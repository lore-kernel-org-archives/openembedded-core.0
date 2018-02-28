Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 571447888A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 02:06:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S270bx023278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Feb 2018 18:07:00 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 18:06:34 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Feb 2018 21:06:55 -0500
Message-ID: <5dc8743babd2e46da540b21cffefa199801a136a.1519783331.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1519783331.git.bruce.ashfield@windriver.com>
References: <cover.1519783331.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.12: add stratix10 SoC development board
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2018 02:07:00 -0000
Content-Type: text/plain

Integrating the patches to introduce support for  stratix10 SOC, which
comprises the following commits:

   22f73c1fe991 drivers: ethernet: stmmac: keep Ethernet clock in enable status on Stratix10 platform
   c3ceae6df341 drivers: ethernet: stmmac: improve phy control during ethernet suspend/resume
   883d8df59543 drivers: ethernet: stmmac: set delay_us value as 0
   063b17881fed arm64: dts: stratix10: add interrupt-parent property in root node
   e991516fa777 arm64: dts: stratix10: correct PMU interrupt number
   555f51414098 arm64: dts: stratix10: add alias for i2c1
   a5dd201f0e8c arm64: dts: stratix10: control FPGA IO from linux kernel
   67e763e631bd mtd: spi-nor: add support for mt25qu02g serial flash
   6068e35ed261 arm64: dts: stratix10: enable qspi feature
   2d019c47939c arm64: dts: stratix10: add USB ECC reset bit
   d9b9d63a6417 FogBugz #516572: add clock to USB nodes
   f4bca65baf07 arm64: dts: stratix10: enable USB on the devkit
   1ed12c04eac6 arm64: dts: stratix10: remove phy node for usb
   b9b8f08f50ca usb: dwc2: add optional usb ecc reset bit
   7a04b5cba903 usb: dwc2: disable erroneous overcurrent condition
   aac3bd2a2e23 dts: stratix10_socdk: enable gpio1 and leds
   9807c107b1c3 arm64: dts: stratix10: fix interrupt number for gpio1
   cbd264cde6bc arm64: dts: stratix10: add gpio header
   f91f7117ef93 gpio: gpio-dwapb: add optional reset
   3aa90a6801aa mtd: spi-nor: Allow Cadence QSPI support for ARM64
   3bb156eb80b6 FogBugz #495013-1: dts: stratix10: Add QSPI support for Stratix10
   81981997697b reset: socfpga: fix for 64-bit compilation
   882cc1f9800d FogBugz #491967-5: dts: stratix10: add ltc2497
   d7b3bc0833a6 FogBugz #492768: Revert "i2c: dw: temporary workaround for i2c clocks"
   60711b82517f arm64: dts: stratix10: add reset property for various peripherals
   f9aeefce1310 arm64: stratix10: add the 'altr,modrst-off' property
   e65b02b3b5b7 arm64: stratix10: include the reset manager bindings
   7ffbb161ee30 reset: socfpga: build the reset-socfpga for Stratix10 SOC
   95197b89dd72 FogBugz #493310: dts: use the clocks for the timers and uarts
   c6ec92c9222a FogBugz #493306: mark the l4_sp_clk as a critical clock
   7caf335dd0fa FogBugz #492768: i2c: dw: temporary workaround for i2c clocks
   b247b5ed60c0 FogBugz #491967-2: dts: stratix10: enable i2c
   b0ea5bac0b3a FogBugz #492420: fix up the correct order of parents for noc_clk
   c81d19a6683b arm64: dts: stratix10: add ethernet/sdmmc support to S10 devkit
   00d6740c9ec9 FogBugz #491251: temporary remove PSCI node
   789aabac6e9d arm64: dts: fix up the gic register for the Stratix10 platform
   9504049ea576 FogBugz #488936-2: Add clocks to emac/sdmmc node
   8ad32e880376 FogBugz #488936-1: dts: bringup SoCFPGA Stratix10 devkit
   f826ccc79752 FogBugz #488843-2: add clock driver for Stratix10 SOC
   56594bb54083 FogBugz #488843-1: dts: clock bindings for the SoCFPGA Stratix10
   2a25f1e19487 FogBugz #488851: dts: use spin-table for SMP
   d36f9d7f16c3 net: stmmac: Adjust dump offset of DMA registers for ethtool
   50eb2994beea Revert "FogBugz #470510: Update stratix10_swvp.dts file for S10 SoC Simics/VP"
   9cc3c6bc11a7 net: stmmac: Add additional registers for dwmac1000_dma ethtool
   4b12474ecb09 FogBugz #470512: Update stratix10_swvp.dts file for S10 SoC Simics/VP
   2e1cf1b70e9a FogBugz #468942-2: Modify QSPI read_delay for Arria10.
   a2baa4e9366e FogBugz #454145: Update stratix10_swvp.dts file for S10 SoC VP
   352eccb9c28e dt-bindings: reset: Add reset manager offsets for Stratix10
   4951f51f6650 FogBugz #458420-2: ARM: dts: add lcd character panel
   52625560a859 FogBugz #458420-1: dts: arria10 socdk: add max1619
   a7926b2fe419 ARM: dts: socfpga: set the i2c frequency
   af2c59f5810f FogBugz #374571: Fix Sysid driver hotplug support.
   b1d136a8001d FogBugz #284482-2: A10 cache coherency is different than A5/C5.
   8dc53e9000e6 FogBugz #284482-1: A10 cache coherency is different than A5/C5.
   cf59a2fb8882 FogBugz #408870: add debugfs interface for fpga config complete timeout
   a2a924222a02 FogBugz #421690: use a unique name to register freeze controller
   db0c754560cb FogBugz #403389-1: Altera Partial Reconfiguration IP Core
   2b11bb966e23 FogBugz #412211: fpga: fix fpga mgr debugfs for module
   546b85ceb86f FogBugz #411427: fpga: memory leaks in fpga manager debugfs
   186529660ef2 FogBugz #405628-1: fpga: doc: add config complete timeout
   e97cb7797091 FogBugz #404467: add missing binding documentation
   9454b288338e FogBugz #411698-3: hwmon: Add Altera A10-SR power supply alarms
   181766fbe257 FogBugz #411698-2: Add Altera A10-SR power supply alarms
   995c713ce65a FogBugz #408205: fix printf format error
   ff30a92ebff5 FogBugz #398879-2: fpga mgr debugfs
   46856886744c FogBugz #398879-1: fpga: doc: documentation for FPGA debugfs
   559f1b2b61f1 FogBugz #365525-3: socfpga: dts: remove fpga image specific info
   6ac61db6de48 ARM: DT: Enable symbols when CONFIG_OF_OVERLAY is used
   784a7fe5585c OF: DT-Overlay configfs interface (v7)
   dcc6ae577325 FogBugz #334039: enable SMP for the Stratix10 SWVP
   83c3f4a2b7dc FogBugz #332965: missing Makefile to build Stratix10 SWVP dts
   5604a2ed0cd1 FogBugz #331066: misc: altera_hwmutex: remove redundant unused of_match_ptr
   e5ad2362d2bc FogBugz #331067: misc: altera_hwmutex: remove .owner
   fdcb3fa5a3a5 FogBugz #332657-2: Stratix 10 Software Virtual Platform
   d64f00ea688a FogBugz #332657-1: Stratix 10 Software Virtual Platform
   86026fe01b25 FogBugz #299928: arria10 swvp: add device tree
   146f064db340 devicetree: net: micrel-ksz90x1.txt: correct documentation
   71244d32db2b TRCom NAND board device tree.
   bb328948b0b5 FogBugz #184650: Cleanup Altera license headers.
   8e855ce4b0c2 misc: sysid: use IS_ERR and PTR_ERR to check for error
   d5e88e198db0 misc: hwmutex: use IS_ERR and PTR_ERR to check for error
   8e7d24910197 FogBugz #236669: Add a Kconfig for ILC driver
   790e85ef4b28 misc: ilc: replace devm_request_and_ioremap with devm_ioremap_and_resource
   1025d2218b88 misc: sysid: replace devm_request_and_ioremap with devm_ioremap_and_resource
   0b1dbbb5a411 misc: hwmutex: replace devm_request_and_ioremap with devm_ioremap_resource
   f78ea9d901c6 FogBugz #240546: Move VIP driver into FB hardware folder
   56c37d32951b FogBugz #177284: add Altera VIP framebuffer driver
   c006613bfc15 FogBugz #229601: newhaven lcd: fix kbuild test robot warnings
   a20f46e5560c FogBugz #101176: add sys entry to set lcd module brightness
   effc29afd46a FogBugz #125882: lcd module needs time to process commands.
   ffab5da4edbf FogBugz #118160: support tilde character on newhaven lcd module
   c72219530e09 FogBugz #114479: load custom character for backslash
   0eb518db5832 FogBugz #107683: handle backspace better in lcd driver
   c62a261496fc tty: newhaven_lcd: Remove devinit and devexit
   717f3b73f7c7 FogBugz #102358: i2c newhaven lcd driver uses faulty hyphen
   394b437bac51 FogBugz #100586: Set lcd backlight brightness to max
   3754d6b77c1b FogBugz #84276: lcd driver on i2c
   115230c21271 FogBugz #143478: drivers/misc: Move sysid from arch to drivers
   8e28bdd388c4 FogBugz #178225: Add Altera interrupt latency counter driver
   095297e45627 FogBugz #144109: Remove extra lines from license header
   6534e0969ae2 FogBugz #143451: Fix mutex compatible string
   8eb7914d1532 FogBugz #138162: Add Altera hardware mutex driver
   075f0367ff60 FogBugz #184646: Turn on all peripheral clocks for a system reboot
   d695a0616fda FogBugz #172665: Sample driver for DMA transfer to FPGA soft IP (FIFO)
   f7b3f6418bbc FogBugz #143478: arch/arm: Move sysid from arch to drivers
   1dd2f4af39a0 ARM: socfpga: Turn on ARM errata for L2 cache
   40146055677a mm/sparsemem: Fix ARM64 boot crash when CONFIG_SPARSEMEM_EXTREME=y

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index e6a45fd66302..a31c3559e9d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "33aa1a4ea44399f12dfb26146ea06db5cd02ca69"
+SRCREV_machine ?= "ba4e0e2d358124def579da9ba5992f6dcb94eea8"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 3ff2e1ce1928..79bd962b943e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.12.20"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index b10b82b77199..57ef700d05d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6e5a99db3a495e023041a30d43262047795e645a"
-SRCREV_machine_qemuarm64 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
-SRCREV_machine_qemumips ?= "43dc47f90007d54c7086cc03b28e946e30135f1c"
-SRCREV_machine_qemuppc ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
-SRCREV_machine_qemux86 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
-SRCREV_machine_qemux86-64 ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
-SRCREV_machine_qemumips64 ?= "69f0c96d8e47b0dccfb374809d729f0042c77868"
-SRCREV_machine ?= "40146055677a69730b2c36da1c8c1b4e9bae7bb0"
+SRCREV_machine_qemuarm ?= "7122a8d189df29393419b3352ea11482efaa417a"
+SRCREV_machine_qemuarm64 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
+SRCREV_machine_qemumips ?= "1cff37b7a2bbee4bb99118e57d228ac301fb880b"
+SRCREV_machine_qemuppc ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
+SRCREV_machine_qemux86 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
+SRCREV_machine_qemux86-64 ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
+SRCREV_machine_qemumips64 ?= "3879cb9ed592f8d5db6b35c51761818ad60494da"
+SRCREV_machine ?= "22f73c1fe99198a7b37aa5c76978fe19d301fd88"
 SRCREV_meta ?= "19d815d5a34bfaad95d87cc097cef18b594daac8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


