library(ggplot2)
library(dplyr)


experiments <- read.csv("results.csv")

alpha <- filter(experiments, set == "Alpha")
alpha_A <- filter(experiments, set == "Alpha and A")
alpha_A_C <- filter(experiments, set == "Alpha, A and C")
alpha_A_C_AC <- filter(experiments, set == "Alpha, A, C and AC")
alpha_max <- group_by(alpha, algorithm, size) %>% summarise(max = max(time))
alpha_A_max <- group_by(alpha_A, algorithm, size) %>% summarise(max = max(time))
alpha_A_C_max <- group_by(alpha_A_C, algorithm, size) %>% summarise(max = max(time))
alpha_A_C_AC_max <- group_by(alpha_A_C_AC, algorithm, size) %>% summarise(max = max(time))


point_style = geom_point(size = 1,  shape=21)
plot_theme = theme(plot.title = element_text(hjust = 0.5),
                   strip.text.x = element_text(size=13, margin = margin(.1, 0, .1, 0, "cm")),
                   strip.text.y = element_text(size=13), 
                   strip.background = element_rect(colour="white", fill="#FFFFFF"))
plot_wrap = facet_wrap(set ~ algorithm, scales = "free", nrow = 2)
plot_stat = stat_smooth(method = "auto", se = FALSE)
x_label = xlab ("Input size")
y_label = ylab("Time (secs.)")


alpha_plot = ggplot(alpha, aes(x = size, y = time)) + point_style +
             plot_theme + plot_wrap + plot_stat + x_label + y_label
alpha_A_plot = ggplot(alpha_A, aes(x = size, y = time)) + point_style +
  plot_theme + plot_wrap + plot_stat + x_label + y_label
alpha_A_C_plot = ggplot(alpha_A_C, aes(x = size, y = time)) + point_style +
  plot_theme + plot_wrap + plot_stat + x_label + y_label
alpha_A_C_AC_plot = ggplot(alpha_A_C_AC, aes(x = size, y = time)) + point_style +
  plot_theme + plot_wrap + plot_stat + x_label + y_label 

alpha_plot
alpha_A_plot
alpha_A_C_plot
alpha_A_C_AC_plot


alpha_max_plot = ggplot(alpha_max, aes(x = size, y = max)) + point_style +
  plot_theme + facet_wrap(~ algorithm, scales = "free") + plot_stat + ggtitle("Alpha") + x_label + y_label
alpha_A_max_plot = ggplot(alpha_A_max, aes(x = size, y = max)) + point_style +
  plot_theme + facet_wrap(~ algorithm, scales = "free") + plot_stat + ggtitle("Alpha and A") + x_label + y_label
alpha_A_C_max_plot = ggplot(alpha_A_C_max, aes(x = size, y = max)) + point_style +
  plot_theme + facet_wrap(~ algorithm, scales = "free") + plot_stat + ggtitle("Alpha, A and C") + x_label + y_label
alpha_A_C_AC_max_plot = ggplot(alpha_A_C_AC_max, aes(x = size, y = max)) + point_style +
  plot_theme + facet_wrap(~ algorithm, scales = "free") + plot_stat + ggtitle("Alpha, A, C and AC") + x_label + y_label


alpha_max_plot
alpha_A_max_plot
alpha_A_C_max_plot
alpha_A_C_AC_max_plot

