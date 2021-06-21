require './player'
require './question'

# Get players' names
print "Hello! Please, enter Player 1 name: "
name1 = gets.chomp
print "Great! And now, Player 2, please, enter your name: "
name2 = gets.chomp
puts "Welcome #{name1} and #{name2} to the clash of Ruby Math Titans!"

# initialize players
player1 = Player.new(name1)
player2 = Player.new(name2)

# start the game

while player1.alive? && player2.alive? 
  question1 = Question.new
  question2 = Question.new 
  puts "----- NEW TURN -----"
  puts "#{player1.name}: #{question1.ask}"
  print ">>> "
  input = gets.chomp.to_i
  if input == question1.answer
    puts "#{player1.name}: YES! You are correct!"
    puts "#{player1.name}: #{player1.lives}/3 #{player2.name}: #{player2.lives}/3"
  else 
    puts "#{player1.name}: LOL WHAT? NO! Incorrect!"
    player1.lives -= 1
    if player1.lives == 0
      break
    end
    puts "#{player1.name}: #{player1.lives}/3 #{player2.name}: #{player2.lives}/3"
  end

  puts "----- NEW TURN -----"
  puts "#{player2.name}: #{question2.ask}"
  print ">>> "
  input = gets.chomp.to_i
  if input == question2.answer
    puts "#{player2.name}: YES! You are correct!"
    puts "#{player1.name}: #{player1.lives}/3 #{player2.name}: #{player2.lives}/3"
  else 
    puts "#{player1.name}: LOL WHAT? NO! Incorrect!"
    player2.lives -= 1
    if player2.lives == 0
      break
    end
    puts "#{player1.name}: #{player1.lives}/3 #{player2.name}: #{player2.lives}/3"
  end
end

if player1.lives > player2.lives
  puts "#{player1.name} wins with a score #{player1.lives}/3"
elsif player1.lives < player2.lives
  puts "#{player2.name} wins with a score #{player2.lives}/3"
end

puts "----- GAME OVER -----"
puts "Good Bye!"


