Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8K-0004vj-1W
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497242"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:44 +0100
Message-Id: <4c9d1787906eb3a66e4b802675a8d4467846801c.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 24/28] packagegroup-*: set reasonable SUMMARY/DESCRIPTION
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 .../packagegroups/packagegroup-base.bb             |   27 +++++++++++++++++++-
 .../packagegroups/packagegroup-core-boot.bb        |    3 ++-
 .../packagegroups/packagegroup-core-nfs.bb         |    3 ++-
 .../packagegroups/packagegroup-core-sdk.bb         |    2 +-
 .../packagegroup-core-ssh-dropbear.bb              |    2 +-
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    2 +-
 .../packagegroups/packagegroup-core-tools-debug.bb |    2 +-
 .../packagegroup-core-tools-profile.bb             |    2 +-
 .../packagegroup-core-tools-testapps.bb            |    2 +-
 .../packagegroups/packagegroup-cross-canadian.bb   |    2 +-
 .../packagegroups/packagegroup-self-hosted.bb      |    3 ++-
 .../packagegroups/packagegroup-core-lsb.bb         |    3 ++-
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |    2 +-
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    2 +-
 .../packagegroups/packagegroup-core-clutter.bb     |    3 ++-
 .../packagegroup-core-gtk-directfb.bb              |    2 +-
 .../packagegroups/packagegroup-core-x11-base.bb    |    3 ++-
 .../packagegroups/packagegroup-core-x11.bb         |    4 ++-
 .../packagegroups/packagegroup-core-qt.bb          |    3 ++-
 .../packagegroups/packagegroup-core-qt4e.bb        |    2 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |    5 +++-
 22 files changed, 59 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 39bb594..63fea28 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd
 #
 
-DESCRIPTION = "Host packages for the standalone SDK or external toolchain"
+SUMMARY = "Host packages for the standalone SDK or external toolchain"
 PR = "r11"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 46db72d..f151591 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -119,6 +119,7 @@ python __anonymous () {
 #
 # packages added by distribution
 #
+SUMMARY_packagegroup-distro-base = "${DISTRO} extras"
 DEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"
 RDEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RDEPENDS}"
 RRECOMMENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
@@ -126,35 +127,44 @@ RRECOMMENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 #
 # packages added by machine config
 #
+SUMMARY_packagegroup-machine-base = "${MACHINE} extras"
+DESCRIPTION_packagegroup-machine-base = "Extra packages required to fully support ${MACHINE} hardware"
 RDEPENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
 RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
+SUMMARY_packagegroup-base-keyboard = "Keyboard support"
 RDEPENDS_packagegroup-base-keyboard = "\
     keymaps"
 
+SUMMARY_packagegroup-base-pci = "PCI bus support"
 RDEPENDS_packagegroup-base-pci = "\
     pciutils"
 
+SUMMARY_packagegroup-base-acpi = "ACPI support"
 RDEPENDS_packagegroup-base-acpi = "\
     acpid \
     libacpi "
 
+SUMMARY_packagegroup-base-apm = "APM support"
 RDEPENDS_packagegroup-base-apm = "\
     ${VIRTUAL-RUNTIME_apm} \
     apmd"
 
+SUMMARY_packagegroup-base-ext2 = "ext2 filesystem support"
 RDEPENDS_packagegroup-base-ext2 = "\
     hdparm \
     e2fsprogs \
     e2fsprogs-e2fsck \
     e2fsprogs-mke2fs"
 
+SUMMARY_packagegroup-base-vfat = "FAT filesystem support"
 RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-msdos \
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437"
 
+SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
@@ -164,11 +174,11 @@ RRECOMMENDS_packagegroup-base-alsa = "\
     kernel-module-snd-mixer-oss \
     kernel-module-snd-pcm-oss"
 
+SUMMARY_packagegroup-base-pcmcia = "PC card slot support"
 RDEPENDS_packagegroup-base-pcmcia = "\
     pcmciautils \
     "
 
-
 RRECOMMENDS_packagegroup-base-pcmcia = "\
     kernel-module-pcmcia \
     kernel-module-airo-cs \
@@ -180,6 +190,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
 
+SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
     bluez4 \
     ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
@@ -201,6 +212,7 @@ RRECOMMENDS_packagegroup-base-bluetooth = "\
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
+SUMMARY_packagegroup-base-irda = "IrDA support"
 RDEPENDS_packagegroup-base-irda = "\
     irda-utils"
 
@@ -217,6 +229,7 @@ RRECOMMENDS_packagegroup-base-irda = "\
     kernel-module-sir-dev \
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
 
+SUMMARY_packagegroup-base-usbgadget = "USB gadget support"
 RRECOMMENDS_packagegroup-base-usbgadget = "\
     kernel-module-pxa27x_udc \
     kernel-module-gadgetfs \
@@ -224,6 +237,7 @@ RRECOMMENDS_packagegroup-base-usbgadget = "\
     kernel-module-g-serial \
     kernel-module-g-ether"
 
+SUMMARY_packagegroup-base-usbhost = "USB host support"
 RDEPENDS_packagegroup-base-usbhost = "\
     usbutils "
 
@@ -241,6 +255,7 @@ RRECOMMENDS_packagegroup-base-usbhost = "\
     kernel-module-usbserial \
     kernel-module-usb-storage "
 
+SUMMARY_packagegroup-base-ppp = "PPP dial-up protocol support"
 RDEPENDS_packagegroup-base-ppp = "\
     ppp \
     ppp-dialin"
@@ -252,6 +267,7 @@ RRECOMMENDS_packagegroup-base-ppp = "\
     kernel-module-ppp-mppe \
     kernel-module-slhc"
 
+SUMMARY_packagegroup-base-ipsec = "IPSEC support"
 RDEPENDS_packagegroup-base-ipsec = "\
     "
 
@@ -262,6 +278,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 # packagegroup-base-wifi contain everything needed to get WiFi working
 # WEP/WPA connection needs to be supported out-of-box
 #
+SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     wireless-tools \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
@@ -282,6 +299,7 @@ RRECOMMENDS_packagegroup-base-wifi = "\
     kernel-module-aes-generic \
     kernel-module-aes"
 
+SUMMARY_packagegroup-base-3g = "Cellular data support"
 RDEPENDS_packagegroup-base-3g = "\
     ofono"
 
@@ -289,34 +307,41 @@ RRECOMMENDS_packagegroup-base-3g = "\
     kernel-module-cdc-acm \
     kernel-module-cdc-wdm"
 
+SUMMARY_packagegroup-base-smbfs = "SMB network filesystem support"
 RRECOMMENDS_packagegroup-base-smbfs = "\
     kernel-module-cifs \
     kernel-module-smbfs"
 
+SUMMARY_packagegroup-base-cramfs = "cramfs filesystem support"
 RRECOMMENDS_packagegroup-base-cramfs = "\
     kernel-module-cramfs"
 
 #
 # packagegroup-base-nfs provides ONLY client support - server is in nfs-utils package
 #
+SUMMARY_packagegroup-base-nfs = "NFS network filesystem support"
 RDEPENDS_packagegroup-base-nfs = "\
     portmap"
 
 RRECOMMENDS_packagegroup-base-nfs = "\
     kernel-module-nfs "
 
+SUMMARY_packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS_packagegroup-base-zeroconf = "\
     avahi-daemon"
 
+SUMMARY_packagegroup-base-ipv6 = "IPv6 support"
 RDEPENDS_packagegroup-base-ipv6 = "\
     "
 
 RRECOMMENDS_packagegroup-base-ipv6 = "\
     kernel-module-ipv6 "
 
+SUMMARY_packagegroup-base-serial = "Serial port support"
 RDEPENDS_packagegroup-base-serial = "\
     setserial \
     lrzsz "
 
+SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
 RDEPENDS_packagegroup-base-phone = "\
     ofono"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index a2970d9..4b1208e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -2,7 +2,8 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Task for OpenedHand Poky - minimal bootable image"
+SUMMARY = "Minimal boot requirements"
+DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
 DEPENDS = "virtual/kernel"
 PR = "r9"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 7b9abdd..09414069 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "NFS tasks for Poky"
+DESCRIPTION = "NFS package groups"
 LICENSE = "MIT"
 PR = "r1"
 
@@ -10,6 +10,7 @@ inherit packagegroup
 
 PACKAGES = "${PN}-server"
 
+SUMMARY_${PN}-server = "NFS server"
 RDEPENDS_${PN}-server = "\
     nfs-utils \
     nfs-utils-client \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index e944ec5..c79f092 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Software Development Tasks for OpenedHand Poky"
+SUMMARY = "Software development tools"
 LICENSE = "MIT"
 PR = "r8"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index dd47d0c..7d71c0c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Dropbear SSH task for Poky"
+SUMMARY = "Dropbear SSH client/server"
 LICENSE = "MIT"
 PR = "r0"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 8a61b4f..f97b010 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenSSH SSH task for Poky"
+SUMMARY = "OpenSSH SSH client/server"
 LICENSE = "MIT"
 PR = "r0"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index 06903a4..a6da660 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Debug tools tasks for OE-Core"
+SUMMARY = "Debugging tools"
 LICENSE = "MIT"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index bdf0d74..6a69363 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Profile tools tasks for OE-Core"
+SUMMARY = "Profiling tools"
 LICENSE = "MIT"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 500f119..1aca97d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Test apps task for OE-Core"
+SUMMARY = "Testing tools/applications"
 LICENSE = "MIT"
 
 inherit packagegroup
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index fcae851..f8e527b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Host SDK package for cross canadian toolchain" 
+SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PR = "r0"
 LICENSE = "MIT"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 67e3f3c..de0a46d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -2,7 +2,8 @@
 # Copyright (C) 2010 Intel Corporation
 #
 
-DESCRIPTION = "Create Basic Image Tasks"
+SUMMARY = "Self-hosting"
+DESCRIPTION = "Packages required to run the build system"
 PR = "r11"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 0e3998d..b8031e5 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -2,7 +2,8 @@
 # Copyright (C) 2010 Intel Corporation
 #
 
-DESCRIPTION = "Create Small Image Tasks"
+SUMMARY = "Linux Standard Base (LSB)"
+DESCRIPTION = "Packages required to satisfy the Linux Standard Base (LSB) specification"
 PR = "r9"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index 782df1f..64b572d 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
+SUMMARY = "GNOME Mobile And Embedded SDK (host tools)"
 LICENSE = "MIT"
 PR = "r12"
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index c560049..95067c4 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OE-Core"
+SUMMARY = "GNOME Mobile And Embedded SDK (target tools)"
 LICENSE = "MIT"
 PR = "r14"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 2c62820..08dd090 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Clutter Tasks for OpenedHand Poky"
+SUMMARY = "Clutter package groups"
 LICENSE = "MIT"
 
 PR = "r4"
@@ -13,6 +13,7 @@ PACKAGES = "\
     ${PN}-core \
     "
 
+SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
     clutter-1.8 \
     clutter-gst-1.8 \
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index df22cd5..6d92a38 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gkt+ over directfb without x11"
+SUMMARY = "GTK+ over DirectFB without X11"
 PR = "r0"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 1f17f01..75574c1 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "Tasks for core X11 applications"
+SUMMARY = "Basic X11 session"
+DESCRIPTION = "Packages required to set up a basic working X11 session"
 LICENSE = "MIT"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 7099c70..3704521 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2011 Intel Corporation
 #
 
-DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
 PR = "r36"
 
@@ -20,15 +19,18 @@ VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 # elsa, xserver-nodm-init
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
+SUMMARY = "X11 display server and basic utilities"
 RDEPENDS_${PN} = "\
     ${PN}-xserver \
     ${PN}-utils \
     "
 
+SUMMARY_${PN}-xserver = "X11 display server"
 RDEPENDS_${PN}-xserver = "\
     ${XSERVER} \
     "
 
+SUMMARY_${PN}-utils = "X11 basic utilities and init"
 RDEPENDS_${PN}-utils = "\
     ${VIRTUAL-RUNTIME_xserver_common} \
     ${VIRTUAL-RUNTIME_graphical_init_manager} \
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index d59cb4b..623a48f 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2010  Intel Corporation. All rights reserved
 #
 
-DESCRIPTION = "Qt Tasks for Poky"
+DESCRIPTION = "Qt package groups"
 LICENSE = "MIT"
 PR = "r3"
 
@@ -12,4 +12,5 @@ PACKAGES = "${PN}-demoapps"
 
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
 
+SUMMARY_${PN}-demoapps = "Qt demo applications"
 RDEPENDS_${PN}-demoapps = "${QTDEMOS}"
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index de8341b..74ae7dd 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "QT4 Embedded base Image Feed"
+SUMMARY = "Qt for Embedded Linux (Qt without X11)"
 PR = "r1"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index ebd2df1..b3b84e2 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2007-2008 OpenedHand Ltd.
 #
 
-DESCRIPTION = "Sato Tasks for Poky"
+SUMMARY = "Sato desktop"
 LICENSE = "MIT"
 PR = "r32"
 
@@ -21,6 +21,7 @@ RDEPENDS_${PN} = "\
 NETWORK_MANAGER ?= "connman-gnome"
 NETWORK_MANAGER_libc-uclibc = ""
 
+SUMMARY_${PN}-base = "Sato desktop - base packages"
 RDEPENDS_${PN}-base = "\
     matchbox-desktop \
     matchbox-session-sato \
@@ -44,6 +45,7 @@ FILEMANAGER_mips ?= ""
 WEB ?= ""
 #WEB = "web-webkit"
 
+SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     gthumb \
     leafpad \
@@ -55,6 +57,7 @@ RDEPENDS_${PN}-apps = "\
     ${WEB} \
     "
 
+SUMMARY_${PN}-games = "Sato desktop - games"
 RDEPENDS_${PN}-games = "\
     oh-puzzles \
     "
-- 
1.7.9.5



