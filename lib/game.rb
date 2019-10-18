class Game
  TOTAL_ERRORS_ALLOWED = 7
  SPECIAL_LETTERS = "ЕЁИЙ"

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
  end

  def errors
    return @user_guesses - @letters
  end

  def errors_made
    return errors.length
  end

  def errors_allowed
    return TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        if @user_guesses.include?(letter)
          letter
        else
          nil
        end
      end

    return result
  end

  def lost?
    return errors_allowed == 0
  end

  def over?
    return won? || lost?
  end

  def play!(letter)
    if !over? && !@user_guesses.include?(letter) && !SPECIAL_LETTERS.include?(letter)
       @user_guesses << letter
    else  normalize(letter)
    end
  end

  def won?
    return (@letters - @user_guesses).empty?
  end

  def word
    return @letters.join
  end

  def normalize(letter)
    if letter == "И" || letter == "Й"
      if @letters.include?("И") && @letters.include?("Й")
      @user_guesses << "И" << "Й"
      elsif @letters.include?("И")
        @user_guesses << "И"
      elsif @letters.include?("Й")
        @user_guesses << "Й"
      else
      end

    else (letter =="Е" || letter =="Ё")
      if @letters.include?("Е") && @letters.include?("Ё")
      @user_guesses << "Е" << "Ё"
      elsif @letters.include?("Е")
        @user_guesses << "Е"
      elsif @letters.include?("Ё")
        @user_guesses << "Ё"
      else
      end
    end
  end
end
