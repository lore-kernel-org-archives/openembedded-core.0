Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8G-0004vH-Q8
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497225"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:38 +0100
Message-Id: <363a65c839d818a186e8a1efeb388ee7032cea0c.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 18/28] packagegroup-*: drop LIC_FILES_CHKSUM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:53 -0000

Since package groups don't actually fetch or distribute anything and we
no longer run do_configure we don't need to set this variable anymore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nativesdk-packagegroup-sdk-host.bb             |    3 ---
 .../packagegroups/packagegroup-base.bb             |    2 --
 .../packagegroups/packagegroup-core-boot.bb        |    2 --
 .../packagegroups/packagegroup-core-console.bb     |    2 --
 .../packagegroups/packagegroup-core-nfs.bb         |    2 --
 .../packagegroups/packagegroup-core-sdk.bb         |    2 --
 .../packagegroup-core-ssh-dropbear.bb              |    2 --
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    2 --
 .../packagegroup-core-standalone-sdk-target.bb     |    2 --
 .../packagegroups/packagegroup-core-tools-debug.bb |    2 --
 .../packagegroup-core-tools-profile.bb             |    2 --
 .../packagegroup-core-tools-testapps.bb            |    2 --
 .../packagegroups/packagegroup-cross-canadian.bb   |    3 ---
 .../packagegroups/packagegroup-self-hosted.bb      |    2 --
 .../packagegroups/packagegroup-core-basic.bb       |    2 --
 .../packagegroups/packagegroup-core-lsb.bb         |    2 --
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    2 --
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    2 --
 .../packagegroups/packagegroup-core-clutter.bb     |    2 --
 .../packagegroup-core-gtk-directfb.bb              |    3 ---
 .../packagegroups/packagegroup-core-x11-base.bb    |    2 --
 .../packagegroups/packagegroup-core-x11.bb         |    2 --
 .../packagegroups/packagegroup-core-qt.bb          |    2 --
 .../packagegroups/packagegroup-core-qt4e.bb        |    3 ---
 .../packagegroup-qte-toolchain-target.bb           |    3 ---
 .../packagegroups/packagegroup-core-x11-sato.bb    |    2 --
 26 files changed, 57 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index ef05004..39bb594 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -6,9 +6,6 @@ DESCRIPTION = "Host packages for the standalone SDK or external toolchain"
 PR = "r11"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit nativesdk packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index c0f0f52..46db72d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r75"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index b49fb3f..a2970d9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Task for OpenedHand Poky - minimal bootable image"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "virtual/kernel"
 PR = "r9"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-console.bb b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
index 63003d0..0c5e7f1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-console.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Tasks for core console applications"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r35"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 8b2318e..7b9abdd 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "NFS tasks for Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r1"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 4ee802f..8d7bbac 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Software Development Tasks for OpenedHand Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "packagegroup-core-console"
 PR = "r8"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index a07e2ba..dd47d0c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "Dropbear SSH task for Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r0"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 89f8c93..8a61b4f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "OpenSSH SSH task for Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r0"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 4099d45..078e7dd 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Target packages for the standalone SDK"
 PR = "r7"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index be424a3..06903a4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Debug tools tasks for OE-Core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 24a99c7..bdf0d74 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Profile tools tasks for OE-Core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 52c278a..500f119 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Test apps task for OE-Core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 8870ccc..fcae851 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -3,9 +3,6 @@ PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PR = "r0"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 7567457..67e3f3c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -5,8 +5,6 @@
 DESCRIPTION = "Create Basic Image Tasks"
 PR = "r11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 95edd78..b2489fe 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -5,8 +5,6 @@
 DESCRIPTION = "Create Basic Image Tasks"
 PR = "r4"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 558db00..0e3998d 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -5,8 +5,6 @@
 DESCRIPTION = "Create Small Image Tasks"
 PR = "r9"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit packagegroup
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index 45cffa4..782df1f 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r12"
 
 inherit packagegroup
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 79b3253..c560049 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r14"
 
 inherit packagegroup
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index d6ac4f3..b928096 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Clutter Tasks for OpenedHand Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PR = "r4"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 19eea99..df22cd5 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -2,9 +2,6 @@ DESCRIPTION = "gkt+ over directfb without x11"
 PR = "r0"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit packagegroup
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index eb4b27d..1f17f01 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,7 +1,5 @@
 DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r0"
 
 inherit packagegroup
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 9563de0..7099c70 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r36"
 
 inherit packagegroup
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index ec5e94b..579ca15 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Qt Tasks for Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r3"
 
 inherit packagegroup
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index 2ea9c2e..de8341b 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -2,9 +2,6 @@ DESCRIPTION = "QT4 Embedded base Image Feed"
 PR = "r1"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit packagegroup
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
index 61466d9..7b65bcc 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -3,9 +3,6 @@ LICENSE = "MIT"
 
 PR = "r5"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index b31eaba..ebd2df1 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -4,8 +4,6 @@
 
 DESCRIPTION = "Sato Tasks for Poky"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r32"
 
 inherit packagegroup
-- 
1.7.9.5



