Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX6-0005qr-L1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:29 +0200
Received: by rex (Postfix, from userid 1000)
	id 4614820C4C; Tue, 10 May 2011 15:00:39 +0100 (BST)
Message-Id: <cf19c8e3bfa76b6bcd76acd348073944dd92bee1.1305035617.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 12:51:49 +0100
Date: Tue, 10 May 2011 15:00:39 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/6] Drop poky-floating-revisions.inc, poky-bleeding.conf and poky-lsb.conf
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
X-List-Received-Date: Tue, 10 May 2011 14:03:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/poky-floating-revisions.inc     |   83 --------------------
 meta/conf/distro/poky-bleeding.conf                |    8 --
 meta/conf/distro/poky-lsb.conf                     |    9 --
 3 files changed, 0 insertions(+), 100 deletions(-)
 delete mode 100644 meta/conf/distro/include/poky-floating-revisions.inc
 delete mode 100644 meta/conf/distro/poky-bleeding.conf
 delete mode 100644 meta/conf/distro/poky-lsb.conf

diff --git a/meta/conf/distro/include/poky-floating-revisions.inc b/meta/conf/distro/include/poky-floating-revisions.inc
deleted file mode 100644
index 22b4c38..0000000
--- a/meta/conf/distro/include/poky-floating-revisions.inc
+++ /dev/null
@@ -1,83 +0,0 @@
-#
-# Package Versions for cutting edge testing:
-#
-
-SRCREV_pn-exmap-console ?= "${AUTOREV}"
-#SRCREV_pn-opkg-native ?= "${AUTOREV}"
-#SRCREV_pn-opkg-sdk ?= "${AUTOREV}"
-#SRCREV_pn-opkg ?= "${AUTOREV}"
-#SRCREV_pn-opkg-utils-naitve ?= "${AUTOREV}"
-#SRCREV_pn-opkg-utils ?= "${AUTOREV}"
-SRCREV_pn-gconf-dbus ?= "${AUTOREV}"
-SRCREV_pn-contacts ?= "${AUTOREV}"
-SRCREV_pn-dates ?= "${AUTOREV}"
-#SRCREV_pn-gtkhtml2 ?= "${AUTOREV}"
-SRCREV_pn-web ?= "${AUTOREV}"
-SRCREV_pn-eds-dbus ?= "${AUTOREV}"
-SRCREV_pn-matchbox-common ?= "${AUTOREV}"
-SRCREV_pn-matchbox-config-gtk ?= "${AUTOREV}"
-SRCREV_pn-matchbox-desktop ?= "${AUTOREV}"
-SRCREV_pn-matchbox-keyboard ?= "${AUTOREV}"
-SRCREV_pn-matchbox-panel ?= "${AUTOREV}"
-SRCREV_pn-matchbox-panel-2 ?= "${AUTOREV}"
-SRCREV_pn-matchbox-stroke ?= "${AUTOREV}"
-SRCREV_pn-matchbox-themes-extra ?= "${AUTOREV}"
-SRCREV_pn-matchbox-terminal ?= "${AUTOREV}"
-SRCREV_pn-matchbox-wm ?= "${AUTOREV}"
-SRCREV_pn-matchbox-wm-2 ?= "${AUTOREV}"
-SRCREV_pn-settings-daemon ?= "${AUTOREV}"
-SRCREV_pn-screenshot ?= "${AUTOREV}"
-SRCREV_pn-libfakekey ?= "${AUTOREV}"
-SRCREV_pn-oprofileui ?= "${AUTOREV}"
-SRCREV_pn-zaurusd ?= "${AUTOREV}"
-SRCREV_pn-libowl-av ?= "${AUTOREV}"
-SRCREV_pn-owl-video ?= "${AUTOREV}"
-SRCREV_pn-psplash ?= "${AUTOREV}"
-SRCREV_pn-exmap-console ?= "${AUTOREV}"
-SRCREV_pn-gtk-sato-engine ?= "${AUTOREV}"
-SRCREV_pn-matchbox-theme-sato ?= "${AUTOREV}"
-SRCREV_pn-matchbox-theme-sato-2 ?= "${AUTOREV}"
-SRCREV_pn-tasks ?= "${AUTOREV}"
-SRCREV_pn-sato-icon-theme ?= "${AUTOREV}"
-SRCREV_pn-matchbox-desktop-sato ?= "${AUTOREV}"
-SRCREV_pn-oh-puzzles ?= "${AUTOREV}"
-SRCREV_pn-libowl ?= "${AUTOREV}"
-SRCREV_pn-matchbox-applet-light ?= "${AUTOREV}"
-SRCREV_pn-fstests ?= "${AUTOREV}"
-SRCREV_pn-xvideo-tests ?= "${AUTOREV}"
-SRCREV_pn-clutter ?= "${AUTOREV}"
-SRCREV_pn-clutter-gst ?= "${AUTOREV}"
-SRCREV_pn-gaku ?= "${AUTOREV}"
-SRCREV_pn-gypsy ?= "${AUTOREV}"
-#SRCREV_pn-webkit-gtk ?= "${AUTOREV}"
-SRCREV_pn-aaina ?= "${AUTOREV}"
-SRCREV_pn-clutter-cairo ?= "${AUTOREV}"
-SRCREV_pn-table ?= "${AUTOREV}"
-SRCREV_pn-libmatchbox ?= "${AUTOREV}"
-SRCREV_pn-tasks ?= "${AUTOREV}"
-SRCREV_pn-mutter ?= "${AUTOREV}"
-SRCREV_pn-ofono ?= "${AUTOREV}"
-
-SRCREV_pn-dri2proto = "${AUTOREV}"
-#PREFERRED_VERSION_dri2proto ?= "1.99.1+git${SRCREV}"
-SRCREV_pn-libdrm = "${AUTOREV}"
-#PREFERRED_VERSION_libdrm ?= "2.4.0+git${SRCREV}"
-SRCREV_pn-libxcb = "${AUTOREV}"
-#PREFERRED_VERSION_libxcb ?= "1.1.90.1+gitr${SRCREV}"
-SRCREV_pn-lib-proto = "${AUTOREV}"
-#PREFERRED_VERSION_xcb-proto ?= "1.2+gitr${SRCREV}"
-SRCREV_pn-libxcb-sdk = "${AUTOREV}"
-#PREFERRED_VERSION_libxcb-sdk ?= "1.1.90.1+gitr${SRCREV}"
-SRCREV_pn-xf86-input-evdev = "${AUTOREV}"
-#PREFERRED_VERSION_xf86-input-evdev ?= "2.0.4"
-SRCREV_pn-xf86-input-mouse = "${AUTOREV}"
-#PREFERRED_VERSION_xf86-input-mouse ?= "1.3.0+git${SRCREV}"
-SRCREV_pn-xf86-input-keyboard = "${AUTOREV}"
-#PREFERRED_VERSION_xf86-input-keyboard ?= "1.3.1+git${SRCREV}"
-SRCREV_pn-xf86-input-synaptics = "${AUTOREV}"
-#PREFERRED_VERSION_xf86-input-synaptics ?= "0.15.2+git${SRCREV}"
-
-#SRCDATE_oprofile ?= "${DATE}"
-
-PREFERRED_VERSION_oprofile ?= "0.9.4+cvs${SRCDATE_oprofile}"
-
diff --git a/meta/conf/distro/poky-bleeding.conf b/meta/conf/distro/poky-bleeding.conf
deleted file mode 100644
index 328acfe..0000000
--- a/meta/conf/distro/poky-bleeding.conf
+++ /dev/null
@@ -1,8 +0,0 @@
-PREFERRED_VERSION_glib-2.0 ?= "2.17.4"
-PREFERRED_VERSION_glib-2.0-native ?= "2.17.4"
-PREFERRED_VERSION_atk ?= "1.22.0"
-PREFERRED_VERSION_pango ?= "1.21.2"
-PREFERRED_VERSION_gtk+ ?= "2.13.3"
-
-require conf/distro/include/poky-floating-revisions.inc
-require conf/distro/poky.conf
diff --git a/meta/conf/distro/poky-lsb.conf b/meta/conf/distro/poky-lsb.conf
deleted file mode 100644
index 5bc97ec..0000000
--- a/meta/conf/distro/poky-lsb.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-require conf/distro/poky.conf
-
-DISTRO = "linuxstdbase"
-DISTROOVERRIDES = "poky:linuxstdbase"
-
-DISTRO_FEATURES += "pam largefile"
-PREFERRED_PROVIDER_virtual/libx11 = "libx11"
-
-
-- 
1.7.4.1



