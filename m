Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QTig2-0001Wf-Dw
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 00:53:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2011 15:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,328,1304319600"; 
   d="scan'208";a="9883340"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.162])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2011 15:50:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2011 15:50:19 -0700
Message-Id: <9b2b5b6734ee5180af073fa7e07624fafa902e7c.1307400276.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1307400276.git.dvhart@linux.intel.com>
References: <cover.1307400276.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] beagleboard: cleanup board-omap3beagle.c and allow for building without wl1271
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
X-List-Received-Date: Mon, 06 Jun 2011 22:53:43 -0000

Add two patches to the linux-omap_2.6.37.bb recipe. The first corrects some
whitespace usage. The second adds an ifdef arround the usage of symbols from
the wl1271 driver, allowing the beagleboard kernel to be built without that
driver configured.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 ...0001-board-omap3beagle-whitespace-cleanup.patch |   91 ++++++++++++++++++++
 ...3beagle-allow-for-building-without-wl1271.patch |   42 +++++++++
 recipes-bsp/linux/linux-omap_2.6.37.bb             |    2 +
 3 files changed, 135 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch
 create mode 100644 recipes-bsp/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch

diff --git a/recipes-bsp/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch b/recipes-bsp/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch
new file mode 100644
index 0000000..6910557
--- /dev/null
+++ b/recipes-bsp/linux/linux-omap/0001-board-omap3beagle-whitespace-cleanup.patch
@@ -0,0 +1,91 @@
+From e5e52482147151aaaafbd388d1e5978268e51d24 Mon Sep 17 00:00:00 2001
+Message-Id: <e5e52482147151aaaafbd388d1e5978268e51d24.1307392642.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Mon, 6 Jun 2011 10:17:56 -0700
+Subject: [PATCH 1/2] board-omap3beagle: whitespace cleanup
+
+Eliminate leading and trailing whitespace.
+Indent with tabs.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+---
+ arch/arm/mach-omap2/board-omap3beagle.c |   28 ++++++++++++++--------------
+ 1 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
+index b035bb5..b618cb6 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle.c
++++ b/arch/arm/mach-omap2/board-omap3beagle.c
+@@ -167,12 +167,12 @@ struct wl12xx_platform_data omap_beagle_wlan_data __initdata = {
+ 	.board_ref_clock = 2, /* 38.4 MHz */
+ };
+ 
+- static struct omap2_hsmmc_info mmcbbt[] = {
+- 	{
+- 		.mmc		= 1,
+- 		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA,
+- 		.gpio_wp	= 29,
+- 	},
++static struct omap2_hsmmc_info mmcbbt[] = {
++	{
++		.mmc		= 1,
++		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA,
++		.gpio_wp	= 29,
++	},
+ 	{
+ 		.name		= "wl1271",
+ 		.mmc		= 2,
+@@ -181,8 +181,8 @@ struct wl12xx_platform_data omap_beagle_wlan_data __initdata = {
+ 		.gpio_cd	= -EINVAL,
+ 		.nonremovable	= true,
+ 	},
+- 	{}	/* Terminator */
+- };
++	{}	/* Terminator */
++};
+ 
+ static struct regulator_consumer_supply beagle_vmmc2_supply = {
+ 	.supply         = "vmmc",
+@@ -455,7 +455,7 @@ static int beagle_twl_gpio_setup(struct device *dev,
+ 	/* gpio + 0 is "mmc0_cd" (input/IRQ) */
+ 	mmc[0].gpio_cd = gpio + 0;
+ #if defined(CONFIG_WL1271) || defined(CONFIG_WL1271_MODULE)
+-	if(!strcmp(expansionboard_name, "bbtoys-wifi")) { 
++	if(!strcmp(expansionboard_name, "bbtoys-wifi")) {
+ 		omap2_hsmmc_init(mmcbbt);
+ 		/* link regulators to MMC adapters */
+ 		beagle_vmmc1_supply.dev = mmcbbt[0].dev;
+@@ -648,9 +648,9 @@ static struct i2c_board_info __initdata beagle_i2c1_boardinfo[] = {
+ };
+ 
+ static struct i2c_board_info __initdata beagle_i2c_eeprom[] = {
+-       {
+-               I2C_BOARD_INFO("eeprom", 0x50),
+-       },
++	{
++		I2C_BOARD_INFO("eeprom", 0x50),
++	},
+ };
+ 
+ #if defined(CONFIG_RTC_DRV_DS1307) || \
+@@ -888,7 +888,7 @@ static void __init omap3_beagle_init(void)
+ 	/* REVISIT leave DVI powered down until it's needed ... */
+ 	gpio_direction_output(170, true);
+ 
+-	if(!strcmp(expansionboard_name, "zippy")) 
++	if(!strcmp(expansionboard_name, "zippy"))
+ 	{
+ 		printk(KERN_INFO "Beagle expansionboard: initializing enc28j60\n");
+ 		omap3beagle_enc28j60_init();
+@@ -897,7 +897,7 @@ static void __init omap3_beagle_init(void)
+ 		mmc[1].gpio_cd = 162;
+ 	}
+ 	
+-	if(!strcmp(expansionboard_name, "zippy2")) 
++	if(!strcmp(expansionboard_name, "zippy2"))
+ 	{
+ 		printk(KERN_INFO "Beagle expansionboard: initializing ks_8851\n");
+ 		omap3beagle_ks8851_init();
+-- 
+1.7.1
+
diff --git a/recipes-bsp/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch b/recipes-bsp/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch
new file mode 100644
index 0000000..51978e2
--- /dev/null
+++ b/recipes-bsp/linux/linux-omap/0002-board-omap3beagle-allow-for-building-without-wl1271.patch
@@ -0,0 +1,42 @@
+From 1b9bc1583d882866d64420df39bf5df4bce22bd6 Mon Sep 17 00:00:00 2001
+Message-Id: <1b9bc1583d882866d64420df39bf5df4bce22bd6.1307392642.git.dvhart@linux.intel.com>
+In-Reply-To: <e5e52482147151aaaafbd388d1e5978268e51d24.1307392642.git.dvhart@linux.intel.com>
+References: <e5e52482147151aaaafbd388d1e5978268e51d24.1307392642.git.dvhart@linux.intel.com>
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Mon, 6 Jun 2011 10:19:00 -0700
+Subject: [PATCH 2/2] board-omap3beagle: allow for building without wl1271
+
+While the header file wl12xx.h is ifdef'd to include if the wl1271 driver is
+built, the init routine calls into it regardless. Ideally, the module would
+perform its own initialization at load time and we wouldn't need to ifdef these
+calls in the general board initialization. For now, follow the existing practice
+in this file and ifdef the wl1271 init block.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+---
+ arch/arm/mach-omap2/board-omap3beagle.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
+index b618cb6..caaed82 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle.c
++++ b/arch/arm/mach-omap2/board-omap3beagle.c
+@@ -937,6 +937,7 @@ static void __init omap3_beagle_init(void)
+ 		gpio_export(162, 1);
+ 	}
+ 
++#if defined(CONFIG_WL1271) || defined(CONFIG_WL1271_MODULE)
+ 	if(!strcmp(expansionboard_name, "bbtoys-wifi"))
+ 	{
+ 		if (wl12xx_set_platform_data(&omap_beagle_wlan_data))
+@@ -944,6 +945,7 @@ static void __init omap3_beagle_init(void)
+ 		printk(KERN_INFO "Beagle expansionboard: registering wl12xx platform device\n");
+ 		platform_device_register(&omap_vwlan_device);
+ 	}
++#endif
+ 
+ 	usb_musb_init(&musb_board_data);
+ 	usb_ehci_init(&ehci_pdata);
+-- 
+1.7.1
+
diff --git a/recipes-bsp/linux/linux-omap_2.6.37.bb b/recipes-bsp/linux/linux-omap_2.6.37.bb
index 2953097..c3f8533 100644
--- a/recipes-bsp/linux/linux-omap_2.6.37.bb
+++ b/recipes-bsp/linux/linux-omap_2.6.37.bb
@@ -197,6 +197,8 @@ SRC_URI_append = " \
                   file://0001-xM-audio-fix-from-Ashok.patch \
                   file://0001-omap3-allow-1GHz-mpurates.patch \
                   file://0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch \
+                  file://0001-board-omap3beagle-whitespace-cleanup.patch \
+                  file://0002-board-omap3beagle-allow-for-building-without-wl1271.patch \
                   "
 
 SRC_URI_append_usrp-e1xx = "\
-- 
1.7.1



