Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFE5771DA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174761"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:54 +0300
Message-Id: <b619ba3e0fca3d9c70410c1a6bdffdfab84d9819.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 36/37] sato-icon-theme: remove as unused
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:50 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Inherit-the-GNOME-icon-theme.patch        | 31 -----------------
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       | 40 ----------------------
 2 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
deleted file mode 100644
index 2c176ee..0000000
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b9f02989310a3c920589f1aa646bcbf16b2572a0 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 13 Jun 2012 11:07:33 +0100
-Subject: [PATCH] Inherit the GNOME icon theme
-
-If the GNOME icon theme isn't installed this is a no-op, but if it is then
-you'll get fallback from Sato to GNOME for icons that are not in Sato.
-
-As applications that use the full GNOME icon theme depend on gnome-icon-theme,
-this just works.
-
-Upstream-Status: Backport
----
- index.theme |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/index.theme b/index.theme
-index c4b03a7..688fbbf 100644
---- a/index.theme
-+++ b/index.theme
-@@ -1,6 +1,7 @@
- [Icon Theme]
- Name=Sato
- Comment=Sato icon theme
-+Inherits=Adwaita
- 
- Directories=16x16/apps,16x16/status,16x16/stock,16x16/places,16x16/mimetypes,16x16/devices,16x16/actions,22x22/apps,22x22/status,22x22/stock,22x22/places,22x22/mimetypes,22x22/devices,22x22/actions,32x32/apps,32x32/status,32x32/stock,32x32/places,32x32/mimetypes,32x32/devices,32x32/actions,48x48/apps,48x48/status,48x48/stock,48x48/places,48x48/mimetypes,48x48/devices,48x48/actions,64x64/apps,64x64/status,64x64/stock,64x64/places,64x64/mimetypes,64x64/devices,64x64/actions,
- 
--- 
-1.7.10
-
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
deleted file mode 100644
index ced735f..0000000
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Sato icon theme"
-HOMEPAGE = "http://www.o-hand.com"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
-SECTION = "x11"
-
-PR = "r6"
-
-DEPENDS = "icon-naming-utils-native libxml-simple-perl-native"
-
-SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
-           file://0001-Inherit-the-GNOME-icon-theme.patch"
-
-SRC_URI[md5sum] = "86a847f3128a43a9cf23b7029a656f50"
-SRC_URI[sha256sum] = "0b0a2807a6a96918ac799a86094ec3e8e2c892be0fd679a4232c2a77f2f61732"
-
-inherit autotools pkgconfig allarch gtk-icon-cache perlnative
-
-# The configure script uses pkg-config to find native binaries to execute, so
-# tell it to use our pkg-config-native wrapper.
-export PKG_CONFIG = "pkg-config-native"
-
-FILES_${PN} += "${datadir}/icons/Sato"
-
-do_install_append() {
-	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s preferences-system.png {}/apps/preferences-desktop.png \;
-	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s file-manager.png {}/apps/system-file-manager.png \;
-	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s ../apps/terminal.png {}/places/computer.png \;
-}
-
-# Explictly setting "Sato" as the default icon theme to avoid flickering from
-# the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
-pkg_postinst_${PN} () {
-    mkdir -p $D/etc/gtk-2.0
-
-    grep -s -q -e ^gtk-icon-theme-name.*\"Sato\" $D/etc/gtk-2.0/gtkrc || \
-        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
-}
-- 
2.1.4


