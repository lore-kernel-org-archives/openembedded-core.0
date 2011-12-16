Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RbcNt-0007rR-Uf
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 19:19:53 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RbcH6-00023w-D0 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 16 Dec 2011 19:12:56 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RbcHq-0006Oh-Jj; Fri, 16 Dec 2011 19:13:38 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 19:13:24 +0100
Message-Id: <1324059204-24547-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.7.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [meta-xilinx] u-boot-xilinx: Rename folder and patch name as well to u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 18:19:54 -0000

For consistency and perhaps trademark reasons rename all u-boot references from
uboot to u-boot.

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 .../board-microblaze-monitor-flash-len.patch       |   43 +++++++++++++
 .../cfi_flash-define-monitor_flash_len.patch       |   29 +++++++++
 .../microblaze-genric-add-spi-flash-config.patch   |   27 ++++++++
 .../ml405-add-uartlite-config-options.patch        |   63 ++++++++++++++++++++
 ...405-replace-hardcode-macros-for-uartns550.patch |   36 +++++++++++
 .../ml507-add-uartlite-config-options.patch        |   51 ++++++++++++++++
 ...507-replace-hardcode-macros-for-uartns550.patch |   35 +++++++++++
 ...e-inline-qualifier-from-show_boot_progres.patch |   31 ++++++++++
 recipes-bsp/u-boot/u-boot-xilinx_git.bb            |   28 +++++++++
 .../board-microblaze-monitor-flash-len.patch       |   43 -------------
 .../cfi_flash-define-monitor_flash_len.patch       |   29 ---------
 .../microblaze-genric-add-spi-flash-config.patch   |   27 --------
 .../ml405-add-uartlite-config-options.patch        |   63 --------------------
 ...405-replace-hardcode-macros-for-uartns550.patch |   36 -----------
 .../ml507-add-uartlite-config-options.patch        |   51 ----------------
 ...507-replace-hardcode-macros-for-uartns550.patch |   35 -----------
 ...e-inline-qualifier-from-show_boot_progres.patch |   31 ----------
 recipes-bsp/uboot/u-boot-xilinx_git.bb             |   28 ---------
 18 files changed, 343 insertions(+), 343 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx/u-boot-remove-inline-qualifier-from-show_boot_progres.patch
 create mode 100644 recipes-bsp/u-boot/u-boot-xilinx_git.bb
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx/uboot-remove-inline-qualifier-from-show_boot_progres.patch
 delete mode 100644 recipes-bsp/uboot/u-boot-xilinx_git.bb

diff --git a/recipes-bsp/u-boot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch b/recipes-bsp/u-boot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
new file mode 100644
index 0000000..448a061
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
@@ -0,0 +1,43 @@
+From 7fbe3ac8b54d6db8202380c5a0f7697cc883b2bd Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Mon, 4 Jul 2011 13:26:45 -0500
+Subject: [PATCH] board: microblaze monitor flash len
+
+* Flash address on Microblaze systems could be on higher
+ addresses then ram. This patch fixed this assumption
+ and flash can be located on any address.
+* Redo patch
+
+Signed-off-by: Michal Simek <monstr@...>
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ arch/microblaze/lib/board.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/microblaze/lib/board.c b/arch/microblaze/lib/board.c
+index 588c3e4..e74a6b1 100644
+--- a/arch/microblaze/lib/board.c
++++ b/arch/microblaze/lib/board.c
+@@ -54,6 +54,10 @@ extern int timer_init (void);
+ extern void fsl_init2 (void);
+ #endif
+ 
++/* Section symbols */
++extern char *__end;
++extern char *__text_start;
++
+ /*
+  * All attempts to come up with a "common" initialization sequence
+  * that works for all boards and architectures failed: some of the
+@@ -105,6 +109,8 @@ void board_init (void)
+ 	bd->bi_memsize = CONFIG_SYS_SDRAM_SIZE;
+ 	gd->flags |= GD_FLG_RELOC;      /* tell others: relocation done */
+ 
++	monitor_flash_len = __end - __text_start;
++
+ 	/*
+ 	 * The Malloc area is immediately below the monitor copy in DRAM
+ 	 * aka CONFIG_SYS_MONITOR_BASE - Note there is no need for reloc_off
+-- 
+1.7.5.4
+
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch b/recipes-bsp/u-boot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
new file mode 100644
index 0000000..cf0db96
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
@@ -0,0 +1,29 @@
+From 3157d5fbc18f6aba7cb7954bd1a6fc82d7b515d2 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Mon, 4 Jul 2011 13:58:23 -0500
+Subject: [PATCH] cfi_flash: define monitor_flash_len
+
+* Define monitor_flash_len from global config parameters
+  CONFIG_SYS_MONITOR_LEN.
+* Fix undefined reference
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ drivers/mtd/cfi_flash.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mtd/cfi_flash.c b/drivers/mtd/cfi_flash.c
+index c92c7a7..572c383 100644
+--- a/drivers/mtd/cfi_flash.c
++++ b/drivers/mtd/cfi_flash.c
+@@ -64,6 +64,7 @@
+ 
+ static uint flash_offset_cfi[2] = { FLASH_OFFSET_CFI, FLASH_OFFSET_CFI_ALT };
+ static uint flash_verbose = 1;
++unsigned long monitor_flash_len = CONFIG_SYS_MONITOR_LEN;
+ 
+ flash_info_t flash_info[CFI_MAX_FLASH_BANKS];	/* FLASH chips info */
+ 
+-- 
+1.7.5.4
+
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch b/recipes-bsp/u-boot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
new file mode 100644
index 0000000..18d196d
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
@@ -0,0 +1,27 @@
+From b4ed80e891a8bdcdc7c6ac91fbce09841576bf62 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Tue, 26 Apr 2011 21:43:13 -0500
+Subject: [PATCH] microblaze-generic: add spi flash config options
+
+* Add XPAR_SPI_FLASH configuratiotn option
+* Define base address and flash memory size
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ include/configs/microblaze-generic.h |    3 +++ 
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+Index: git/include/configs/microblaze-generic.h
+===================================================================
+--- git.orig/include/configs/microblaze-generic.h
++++ git/include/configs/microblaze-generic.h
+@@ -202,6 +202,9 @@
+ #elif XPAR_EMC_0_S_AXI_MEM0_BASEADDR
+ 	#define	CONFIG_SYS_FLASH_BASE		XPAR_EMC_0_S_AXI_MEM0_BASEADDR
+ 	#define	CONFIG_SYS_FLASH_SIZE		(XPAR_EMC_0_S_AXI_MEM0_HIGHADDR - XPAR_EMC_0_S_AXI_MEM0_BASEADDR + 1)
++#elif XPAR_SPI_FLASH_BASEADDR
++    #define CONFIG_SYS_FLASH_BASE       XPAR_SPI_FLASH_BASEADDR
++    #define CONFIG_SYS_FLASH_SIZE       (XPAR_SPI_FLASH_HIGHADDR - XPAR_SPI_FLASH_BASEADDR + 1)
+ #else
+ 	#error "Flash is not included in the system"
+ #endif 
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/ml405-add-uartlite-config-options.patch b/recipes-bsp/u-boot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
new file mode 100644
index 0000000..8edd12a
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
@@ -0,0 +1,63 @@
+From f2e7ecde205d88d28536e8454f58ba2b1ef4cc81 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Thu, 16 Dec 2010 17:34:13 -0600
+Subject: [PATCH 1/2] ml405: add uartlite config options
+
+* Add CONFIG_XILINX_UARTLITE options
+* From xparameters find out which serial module
+  is included in the hardware project and configure
+  accord the available device
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ include/configs/ml405.h |   19 +++++++++++++++++--
+ 1 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/include/configs/ml405.h b/include/configs/ml405.h
+index d6f4832..86f093e 100644
+--- a/include/configs/ml405.h
++++ b/include/configs/ml405.h
+@@ -115,7 +115,6 @@
+ //#define CFG_MONITOR_BASE	0xFFFC0000
+ #endif
+ 
+-#define CONFIG_BAUDRATE         9600
+ #define CONFIG_BOOTDELAY        5       /* autoboot after 5 seconds	*/
+
+ #define CONFIG_BOOTCOMMAND      "" /* autoboot command	*/
+@@ -181,6 +180,18 @@
+ #define CFG_MEMTEST_END		0x0C00000	/* 4 ... 12 MB in DRAM	*/
+
+ /*
++ * Serial port
++ * uartLite
++ */
++#ifdef XPAR_UARTLITE_0_BASEADDR
++#define CONFIG_XILINX_UARTLITE
++#define CONFIG_SERIAL_BASE      XPAR_UARTLITE_0_BASEADDR
++#define CONFIG_BAUDRATE         XPAR_UARTLITE_0_BAUDRATE
++#define CONFIG_SYS_BAUDRATE_TABLE   { CONFIG_BAUDRATE }
++#define XPAR_UART_0_CLOCK_FREQ_HZ XPAR_PLB_CLOCK_FREQ_HZ
++#else
++#ifdef XPAR_UARTNS550_0_BASEADDR
++/*
+  * 16550 UART and console
+  */
+ #define CONFIG_CONS_INDEX	1
+@@ -188,8 +199,12 @@
+ #define CFG_NS16550
+ #define CFG_NS16550_SERIAL
+ #define CFG_NS16550_REG_SIZE	-4
+-#define CFG_NS16550_CLK		XPAR_XUARTNS550_CLOCK_HZ
++#define CFG_NS16550_CLK		        XPAR_XUARTNS550_CLOCK_HZ
++#define XPAR_UART_0_CLOCK_FREQ_HZ   XPAR_XUARTNS550_CLOCK_HZ
+ #define CFG_NS16550_COM1	(XPAR_UARTNS550_0_BASEADDR + 0x1003)
++#define CONFIG_BAUDRATE         9600
++#endif
++#endif
+
+ #define CFG_BAUDRATE_TABLE	\
+ 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400,115200}
+--
+1.7.2.3
+
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch b/recipes-bsp/u-boot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
new file mode 100644
index 0000000..3e8ce92
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
@@ -0,0 +1,36 @@
+From 111cbbadbf09b6570567b22962de4a80180aabe1 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Thu, 16 Dec 2010 17:39:35 -0600
+Subject: [PATCH 2/2] ml405: replace hardcode macros for uartns550
+
+* Replace hardcoded macros for setting PLB and uart
+  frecuency
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ board/xilinx/ml405/ml405.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/xilinx/ml405/ml405.c b/board/xilinx/ml405/ml405.c
+index 76dd5e5..0800b10 100755
+--- a/board/xilinx/ml405/ml405.c
++++ b/board/xilinx/ml405/ml405.c
+@@ -138,13 +138,13 @@ get_sys_info(sys_info_t * sysInfo)
+ 	sysInfo->freqProcessor = XPAR_CORE_CLOCK_FREQ_HZ;
+ 
+ 	/* only correct if the PLB and OPB run at the same frequency */
+-	sysInfo->freqPLB = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
++	sysInfo->freqPLB = XPAR_UART_0_CLOCK_FREQ_HZ;
+ 	sysInfo->freqPCI = 0;
+ 
+ 	/* setup the uart clock frequency in the global data otherwise the 
+ 	 * fdt fixups on the device tree hoses it up
+ 	 */
+-	gd->uart_clk = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
++	gd->uart_clk = XPAR_UART_0_CLOCK_FREQ_HZ;
+ }
+ 
+ /*-----------------------------------------------------------------------------
+-- 
+1.7.2.3
+
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/ml507-add-uartlite-config-options.patch b/recipes-bsp/u-boot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
new file mode 100644
index 0000000..cdde911
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
@@ -0,0 +1,51 @@
+From 6e3db4846a393558324733a1d18fdf9858d543fe Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso00@gmail.com>
+Date: Fri, 17 Dec 2010 15:56:45 -0600
+Subject: [PATCH 1/2] ml507: add uartlite config options
+
+* Add CONFIG_XILINX_UARTLITE options
+* From xparameters find out which serial module
+  is included in the hardware project and configure
+  accord the available device
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ include/configs/ml507.h |   16 +++++++++++++++-
+ 1 files changed, 15 insertions(+), 1 deletions(-)
+
+diff --git a/include/configs/ml507.h b/include/configs/ml507.h
+index 6454ef5..be429b6 100644
+--- a/include/configs/ml507.h
++++ b/include/configs/ml507.h
+@@ -172,7 +172,18 @@
+
+ #define CFG_MEMTEST_START	0x0400000	/* memtest works on	*/
+ #define CFG_MEMTEST_END		0x0C00000	/* 4 ... 12 MB in DRAM	*/
+-
++/*
++ *  * Serial port
++ *   * uartLite
++ *    */
++#ifdef XPAR_UARTLITE_0_BASEADDR
++#define CONFIG_XILINX_UARTLITE
++#define CONFIG_SERIAL_BASE      XPAR_UARTLITE_0_BASEADDR
++#define CONFIG_BAUDRATE         XPAR_UARTLITE_0_BAUDRATE
++#define CONFIG_SYS_BAUDRATE_TABLE   { CONFIG_BAUDRATE }
++#define XPAR_UART_0_CLOCK_FREQ_HZ XPAR_PLB_CLOCK_FREQ_HZ
++#else
++#ifdef XPAR_UARTNS550_0_BASEADDR
+ /*
+  * 16550 UART and console
+  */
+@@ -183,6 +194,9 @@
+ #define CFG_NS16550_REG_SIZE	-4
+ #define CFG_NS16550_CLK		XPAR_XUARTNS550_CLOCK_HZ
+ #define CFG_NS16550_COM1	(XPAR_UARTNS550_0_BASEADDR + 0x1003)
++#define XPAR_UART_0_CLOCK_FREQ_HZ   XPAR_XUARTNS550_CLOCK_HZ
++#endif
++#endif
+
+ #define CFG_BAUDRATE_TABLE	\
+ 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400,115200}
+--
+1.7.3.3
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch b/recipes-bsp/u-boot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
new file mode 100644
index 0000000..8a94618
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
@@ -0,0 +1,35 @@
+From 9d8a9331156dcba4fe1aefb066a28f67c46468b4 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso00@gmail.com>
+Date: Fri, 17 Dec 2010 15:58:53 -0600
+Subject: [PATCH 2/2] ml507: replace hardcode macros for uartns550
+
+* Replace hardcoded macros for setting PLB and uart
+  frecuency
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ board/xilinx/ml507/ml507.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/xilinx/ml507/ml507.c b/board/xilinx/ml507/ml507.c
+index 8e6970e..0ef81c3 100644
+--- a/board/xilinx/ml507/ml507.c
++++ b/board/xilinx/ml507/ml507.c
+@@ -137,13 +137,13 @@ get_sys_info(sys_info_t * sysInfo)
+ {
+ 	sysInfo->freqProcessor = XPAR_CORE_CLOCK_FREQ_HZ;
+
+-	sysInfo->freqPLB = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
++	sysInfo->freqPLB = XPAR_UART_0_CLOCK_FREQ_HZ;
+ 	sysInfo->freqPCI = 0;
+
+ 	/* setup the uart clock frequency in the global data otherwise the 
+ 	 * fdt fixups on the device tree hoses it up
+ 	 */
+-	gd->uart_clk = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
++	gd->uart_clk = XPAR_UART_0_CLOCK_FREQ_HZ;
+ }
+
+ /*-----------------------------------------------------------------------------
+--
+1.7.3.3
diff --git a/recipes-bsp/u-boot/u-boot-xilinx/u-boot-remove-inline-qualifier-from-show_boot_progres.patch b/recipes-bsp/u-boot/u-boot-xilinx/u-boot-remove-inline-qualifier-from-show_boot_progres.patch
new file mode 100644
index 0000000..56d26ea
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx/u-boot-remove-inline-qualifier-from-show_boot_progres.patch
@@ -0,0 +1,31 @@
+From 4537cc92b5c149fbcb204d8e904a7ee20b8f4b1c Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso@secretlab.ca>
+Date: Mon, 6 Dec 2010 23:01:03 -0600
+Subject: [PATCH 2/2] uboot: remove inline qualifier from show_boot_progress
+
+* Remove inline qualifier from show_boot_progress
+* Gcc 4.5.1 complains about
+  main.c:51:13: error: inline function 'show_boot_progress'
+  cannot be declared weak
+
+Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
+---
+ common/main.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/common/main.c b/common/main.c
+index 187ef8a..e2f8bb2 100644
+--- a/common/main.c
++++ b/common/main.c
+@@ -48,7 +48,7 @@ DECLARE_GLOBAL_DATA_PTR;
+  * Board-specific Platform code can reimplement show_boot_progress () if needed
+  */
+ void inline __show_boot_progress (int val) {}
+-void inline show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
++void show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
+ 
+ #if defined(CONFIG_BOOT_RETRY_TIME) && defined(CONFIG_RESET_TO_RETRY)
+ extern int do_reset (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]);		/* for do_reset() prototype */
+-- 
+1.7.2.3
+
diff --git a/recipes-bsp/u-boot/u-boot-xilinx_git.bb b/recipes-bsp/u-boot/u-boot-xilinx_git.bb
new file mode 100644
index 0000000..de94319
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-xilinx_git.bb
@@ -0,0 +1,28 @@
+inherit xilinx-boot xilinx-utils
+require recipes-bsp/u-boot/u-boot.inc
+
+PR = "r14"
+PV = "v2009.11"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
+
+# Microblaze src location
+SRCREV = "97fb0720feec9a5b7b3ddc275e3880e5b6af74fe"
+SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;branch=microblaze;protocol=git \
+           file://microblaze-genric-add-spi-flash-config.patch \
+           file://board-microblaze-monitor-flash-len.patch \
+           file://cfi_flash-define-monitor_flash_len.patch"
+
+# Powerpc src location
+SRCREV_powerpc = "d49297009f402a20dd59b21212975dd3d79ee6fd"
+SRC_URI_powerpc = "git://git.xilinx.com/u-boot-xlnx.git;branch=master;protocol=git"
+SRC_URI_powerpc += " file://u-boot-remove-inline-qualifier-from-show_boot_progres.patch \
+                     file://ml405-add-uartlite-config-options.patch \
+                     file://ml405-replace-hardcode-macros-for-uartns550.patch \
+                     file://ml507-add-uartlite-config-options.patch \
+                     file://ml507-replace-hardcode-macros-for-uartns550.patch \
+                    "
+
+XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
+
+S = "${WORKDIR}/git"
diff --git a/recipes-bsp/uboot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch b/recipes-bsp/uboot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
deleted file mode 100644
index 448a061..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/board-microblaze-monitor-flash-len.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7fbe3ac8b54d6db8202380c5a0f7697cc883b2bd Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Mon, 4 Jul 2011 13:26:45 -0500
-Subject: [PATCH] board: microblaze monitor flash len
-
-* Flash address on Microblaze systems could be on higher
- addresses then ram. This patch fixed this assumption
- and flash can be located on any address.
-* Redo patch
-
-Signed-off-by: Michal Simek <monstr@...>
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- arch/microblaze/lib/board.c |    6 ++++++
- 1 files changed, 6 insertions(+), 0 deletions(-)
-
-diff --git a/arch/microblaze/lib/board.c b/arch/microblaze/lib/board.c
-index 588c3e4..e74a6b1 100644
---- a/arch/microblaze/lib/board.c
-+++ b/arch/microblaze/lib/board.c
-@@ -54,6 +54,10 @@ extern int timer_init (void);
- extern void fsl_init2 (void);
- #endif
- 
-+/* Section symbols */
-+extern char *__end;
-+extern char *__text_start;
-+
- /*
-  * All attempts to come up with a "common" initialization sequence
-  * that works for all boards and architectures failed: some of the
-@@ -105,6 +109,8 @@ void board_init (void)
- 	bd->bi_memsize = CONFIG_SYS_SDRAM_SIZE;
- 	gd->flags |= GD_FLG_RELOC;      /* tell others: relocation done */
- 
-+	monitor_flash_len = __end - __text_start;
-+
- 	/*
- 	 * The Malloc area is immediately below the monitor copy in DRAM
- 	 * aka CONFIG_SYS_MONITOR_BASE - Note there is no need for reloc_off
--- 
-1.7.5.4
-
diff --git a/recipes-bsp/uboot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch b/recipes-bsp/uboot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
deleted file mode 100644
index cf0db96..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/cfi_flash-define-monitor_flash_len.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3157d5fbc18f6aba7cb7954bd1a6fc82d7b515d2 Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Mon, 4 Jul 2011 13:58:23 -0500
-Subject: [PATCH] cfi_flash: define monitor_flash_len
-
-* Define monitor_flash_len from global config parameters
-  CONFIG_SYS_MONITOR_LEN.
-* Fix undefined reference
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- drivers/mtd/cfi_flash.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/mtd/cfi_flash.c b/drivers/mtd/cfi_flash.c
-index c92c7a7..572c383 100644
---- a/drivers/mtd/cfi_flash.c
-+++ b/drivers/mtd/cfi_flash.c
-@@ -64,6 +64,7 @@
- 
- static uint flash_offset_cfi[2] = { FLASH_OFFSET_CFI, FLASH_OFFSET_CFI_ALT };
- static uint flash_verbose = 1;
-+unsigned long monitor_flash_len = CONFIG_SYS_MONITOR_LEN;
- 
- flash_info_t flash_info[CFI_MAX_FLASH_BANKS];	/* FLASH chips info */
- 
--- 
-1.7.5.4
-
diff --git a/recipes-bsp/uboot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch b/recipes-bsp/uboot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
deleted file mode 100644
index 18d196d..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/microblaze-genric-add-spi-flash-config.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b4ed80e891a8bdcdc7c6ac91fbce09841576bf62 Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Tue, 26 Apr 2011 21:43:13 -0500
-Subject: [PATCH] microblaze-generic: add spi flash config options
-
-* Add XPAR_SPI_FLASH configuratiotn option
-* Define base address and flash memory size
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- include/configs/microblaze-generic.h |    3 +++ 
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-Index: git/include/configs/microblaze-generic.h
-===================================================================
---- git.orig/include/configs/microblaze-generic.h
-+++ git/include/configs/microblaze-generic.h
-@@ -202,6 +202,9 @@
- #elif XPAR_EMC_0_S_AXI_MEM0_BASEADDR
- 	#define	CONFIG_SYS_FLASH_BASE		XPAR_EMC_0_S_AXI_MEM0_BASEADDR
- 	#define	CONFIG_SYS_FLASH_SIZE		(XPAR_EMC_0_S_AXI_MEM0_HIGHADDR - XPAR_EMC_0_S_AXI_MEM0_BASEADDR + 1)
-+#elif XPAR_SPI_FLASH_BASEADDR
-+    #define CONFIG_SYS_FLASH_BASE       XPAR_SPI_FLASH_BASEADDR
-+    #define CONFIG_SYS_FLASH_SIZE       (XPAR_SPI_FLASH_HIGHADDR - XPAR_SPI_FLASH_BASEADDR + 1)
- #else
- 	#error "Flash is not included in the system"
- #endif 
diff --git a/recipes-bsp/uboot/u-boot-xilinx/ml405-add-uartlite-config-options.patch b/recipes-bsp/uboot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
deleted file mode 100644
index 8edd12a..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/ml405-add-uartlite-config-options.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From f2e7ecde205d88d28536e8454f58ba2b1ef4cc81 Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Thu, 16 Dec 2010 17:34:13 -0600
-Subject: [PATCH 1/2] ml405: add uartlite config options
-
-* Add CONFIG_XILINX_UARTLITE options
-* From xparameters find out which serial module
-  is included in the hardware project and configure
-  accord the available device
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- include/configs/ml405.h |   19 +++++++++++++++++--
- 1 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/include/configs/ml405.h b/include/configs/ml405.h
-index d6f4832..86f093e 100644
---- a/include/configs/ml405.h
-+++ b/include/configs/ml405.h
-@@ -115,7 +115,6 @@
- //#define CFG_MONITOR_BASE	0xFFFC0000
- #endif
- 
--#define CONFIG_BAUDRATE         9600
- #define CONFIG_BOOTDELAY        5       /* autoboot after 5 seconds	*/
-
- #define CONFIG_BOOTCOMMAND      "" /* autoboot command	*/
-@@ -181,6 +180,18 @@
- #define CFG_MEMTEST_END		0x0C00000	/* 4 ... 12 MB in DRAM	*/
-
- /*
-+ * Serial port
-+ * uartLite
-+ */
-+#ifdef XPAR_UARTLITE_0_BASEADDR
-+#define CONFIG_XILINX_UARTLITE
-+#define CONFIG_SERIAL_BASE      XPAR_UARTLITE_0_BASEADDR
-+#define CONFIG_BAUDRATE         XPAR_UARTLITE_0_BAUDRATE
-+#define CONFIG_SYS_BAUDRATE_TABLE   { CONFIG_BAUDRATE }
-+#define XPAR_UART_0_CLOCK_FREQ_HZ XPAR_PLB_CLOCK_FREQ_HZ
-+#else
-+#ifdef XPAR_UARTNS550_0_BASEADDR
-+/*
-  * 16550 UART and console
-  */
- #define CONFIG_CONS_INDEX	1
-@@ -188,8 +199,12 @@
- #define CFG_NS16550
- #define CFG_NS16550_SERIAL
- #define CFG_NS16550_REG_SIZE	-4
--#define CFG_NS16550_CLK		XPAR_XUARTNS550_CLOCK_HZ
-+#define CFG_NS16550_CLK		        XPAR_XUARTNS550_CLOCK_HZ
-+#define XPAR_UART_0_CLOCK_FREQ_HZ   XPAR_XUARTNS550_CLOCK_HZ
- #define CFG_NS16550_COM1	(XPAR_UARTNS550_0_BASEADDR + 0x1003)
-+#define CONFIG_BAUDRATE         9600
-+#endif
-+#endif
-
- #define CFG_BAUDRATE_TABLE	\
- 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400,115200}
---
-1.7.2.3
-
diff --git a/recipes-bsp/uboot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch b/recipes-bsp/uboot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
deleted file mode 100644
index 3e8ce92..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/ml405-replace-hardcode-macros-for-uartns550.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 111cbbadbf09b6570567b22962de4a80180aabe1 Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Thu, 16 Dec 2010 17:39:35 -0600
-Subject: [PATCH 2/2] ml405: replace hardcode macros for uartns550
-
-* Replace hardcoded macros for setting PLB and uart
-  frecuency
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- board/xilinx/ml405/ml405.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/xilinx/ml405/ml405.c b/board/xilinx/ml405/ml405.c
-index 76dd5e5..0800b10 100755
---- a/board/xilinx/ml405/ml405.c
-+++ b/board/xilinx/ml405/ml405.c
-@@ -138,13 +138,13 @@ get_sys_info(sys_info_t * sysInfo)
- 	sysInfo->freqProcessor = XPAR_CORE_CLOCK_FREQ_HZ;
- 
- 	/* only correct if the PLB and OPB run at the same frequency */
--	sysInfo->freqPLB = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
-+	sysInfo->freqPLB = XPAR_UART_0_CLOCK_FREQ_HZ;
- 	sysInfo->freqPCI = 0;
- 
- 	/* setup the uart clock frequency in the global data otherwise the 
- 	 * fdt fixups on the device tree hoses it up
- 	 */
--	gd->uart_clk = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
-+	gd->uart_clk = XPAR_UART_0_CLOCK_FREQ_HZ;
- }
- 
- /*-----------------------------------------------------------------------------
--- 
-1.7.2.3
-
diff --git a/recipes-bsp/uboot/u-boot-xilinx/ml507-add-uartlite-config-options.patch b/recipes-bsp/uboot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
deleted file mode 100644
index cdde911..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/ml507-add-uartlite-config-options.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 6e3db4846a393558324733a1d18fdf9858d543fe Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso00@gmail.com>
-Date: Fri, 17 Dec 2010 15:56:45 -0600
-Subject: [PATCH 1/2] ml507: add uartlite config options
-
-* Add CONFIG_XILINX_UARTLITE options
-* From xparameters find out which serial module
-  is included in the hardware project and configure
-  accord the available device
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- include/configs/ml507.h |   16 +++++++++++++++-
- 1 files changed, 15 insertions(+), 1 deletions(-)
-
-diff --git a/include/configs/ml507.h b/include/configs/ml507.h
-index 6454ef5..be429b6 100644
---- a/include/configs/ml507.h
-+++ b/include/configs/ml507.h
-@@ -172,7 +172,18 @@
-
- #define CFG_MEMTEST_START	0x0400000	/* memtest works on	*/
- #define CFG_MEMTEST_END		0x0C00000	/* 4 ... 12 MB in DRAM	*/
--
-+/*
-+ *  * Serial port
-+ *   * uartLite
-+ *    */
-+#ifdef XPAR_UARTLITE_0_BASEADDR
-+#define CONFIG_XILINX_UARTLITE
-+#define CONFIG_SERIAL_BASE      XPAR_UARTLITE_0_BASEADDR
-+#define CONFIG_BAUDRATE         XPAR_UARTLITE_0_BAUDRATE
-+#define CONFIG_SYS_BAUDRATE_TABLE   { CONFIG_BAUDRATE }
-+#define XPAR_UART_0_CLOCK_FREQ_HZ XPAR_PLB_CLOCK_FREQ_HZ
-+#else
-+#ifdef XPAR_UARTNS550_0_BASEADDR
- /*
-  * 16550 UART and console
-  */
-@@ -183,6 +194,9 @@
- #define CFG_NS16550_REG_SIZE	-4
- #define CFG_NS16550_CLK		XPAR_XUARTNS550_CLOCK_HZ
- #define CFG_NS16550_COM1	(XPAR_UARTNS550_0_BASEADDR + 0x1003)
-+#define XPAR_UART_0_CLOCK_FREQ_HZ   XPAR_XUARTNS550_CLOCK_HZ
-+#endif
-+#endif
-
- #define CFG_BAUDRATE_TABLE	\
- 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400,115200}
---
-1.7.3.3
diff --git a/recipes-bsp/uboot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch b/recipes-bsp/uboot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
deleted file mode 100644
index 8a94618..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/ml507-replace-hardcode-macros-for-uartns550.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9d8a9331156dcba4fe1aefb066a28f67c46468b4 Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso00@gmail.com>
-Date: Fri, 17 Dec 2010 15:58:53 -0600
-Subject: [PATCH 2/2] ml507: replace hardcode macros for uartns550
-
-* Replace hardcoded macros for setting PLB and uart
-  frecuency
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- board/xilinx/ml507/ml507.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/xilinx/ml507/ml507.c b/board/xilinx/ml507/ml507.c
-index 8e6970e..0ef81c3 100644
---- a/board/xilinx/ml507/ml507.c
-+++ b/board/xilinx/ml507/ml507.c
-@@ -137,13 +137,13 @@ get_sys_info(sys_info_t * sysInfo)
- {
- 	sysInfo->freqProcessor = XPAR_CORE_CLOCK_FREQ_HZ;
-
--	sysInfo->freqPLB = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
-+	sysInfo->freqPLB = XPAR_UART_0_CLOCK_FREQ_HZ;
- 	sysInfo->freqPCI = 0;
-
- 	/* setup the uart clock frequency in the global data otherwise the 
- 	 * fdt fixups on the device tree hoses it up
- 	 */
--	gd->uart_clk = XPAR_UARTNS550_0_CLOCK_FREQ_HZ;
-+	gd->uart_clk = XPAR_UART_0_CLOCK_FREQ_HZ;
- }
-
- /*-----------------------------------------------------------------------------
---
-1.7.3.3
diff --git a/recipes-bsp/uboot/u-boot-xilinx/uboot-remove-inline-qualifier-from-show_boot_progres.patch b/recipes-bsp/uboot/u-boot-xilinx/uboot-remove-inline-qualifier-from-show_boot_progres.patch
deleted file mode 100644
index 56d26ea..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx/uboot-remove-inline-qualifier-from-show_boot_progres.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4537cc92b5c149fbcb204d8e904a7ee20b8f4b1c Mon Sep 17 00:00:00 2001
-From: Adrian Alonso <aalonso@secretlab.ca>
-Date: Mon, 6 Dec 2010 23:01:03 -0600
-Subject: [PATCH 2/2] uboot: remove inline qualifier from show_boot_progress
-
-* Remove inline qualifier from show_boot_progress
-* Gcc 4.5.1 complains about
-  main.c:51:13: error: inline function 'show_boot_progress'
-  cannot be declared weak
-
-Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
----
- common/main.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/common/main.c b/common/main.c
-index 187ef8a..e2f8bb2 100644
---- a/common/main.c
-+++ b/common/main.c
-@@ -48,7 +48,7 @@ DECLARE_GLOBAL_DATA_PTR;
-  * Board-specific Platform code can reimplement show_boot_progress () if needed
-  */
- void inline __show_boot_progress (int val) {}
--void inline show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
-+void show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
- 
- #if defined(CONFIG_BOOT_RETRY_TIME) && defined(CONFIG_RESET_TO_RETRY)
- extern int do_reset (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]);		/* for do_reset() prototype */
--- 
-1.7.2.3
-
diff --git a/recipes-bsp/uboot/u-boot-xilinx_git.bb b/recipes-bsp/uboot/u-boot-xilinx_git.bb
deleted file mode 100644
index 016a0bb..0000000
--- a/recipes-bsp/uboot/u-boot-xilinx_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-inherit xilinx-boot xilinx-utils
-require recipes-bsp/u-boot/u-boot.inc
-
-PR = "r14"
-PV = "v2009.11"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
-
-# Microblaze src location
-SRCREV = "97fb0720feec9a5b7b3ddc275e3880e5b6af74fe"
-SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;branch=microblaze;protocol=git \
-           file://microblaze-genric-add-spi-flash-config.patch \
-           file://board-microblaze-monitor-flash-len.patch \
-           file://cfi_flash-define-monitor_flash_len.patch"
-
-# Powerpc src location
-SRCREV_powerpc = "d49297009f402a20dd59b21212975dd3d79ee6fd"
-SRC_URI_powerpc = "git://git.xilinx.com/u-boot-xlnx.git;branch=master;protocol=git"
-SRC_URI_powerpc += " file://uboot-remove-inline-qualifier-from-show_boot_progres.patch \
-                     file://ml405-add-uartlite-config-options.patch \
-                     file://ml405-replace-hardcode-macros-for-uartns550.patch \
-                     file://ml507-add-uartlite-config-options.patch \
-                     file://ml507-replace-hardcode-macros-for-uartns550.patch \
-                    "
-
-XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
-
-S = "${WORKDIR}/git"
-- 
1.7.7.3



