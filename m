Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIz1-00015i-G0
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489262"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:42 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:25 +0300
Message-Id: <14ef1fb3762d029ea5bb8c70371a798396836daa.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
Subject: [RFC 7/7] postinst changes: bump PR to all recipes inheriting gnome and gtk-icon-cache
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
X-List-Received-Date: Wed, 19 Sep 2012 12:02:24 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../connman/connman-gnome_0.7.bb                   |    2 ++
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    2 +-
 meta/recipes-gnome/gnome/libgdata_0.7.1.bb         |    2 ++
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 +-
 meta/recipes-gnome/json-glib/json-glib_0.14.2.bb   |    2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |    2 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 21 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 6cceb2d..1f0c9c0 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -12,6 +12,8 @@ DEPENDS = "gtk+ dbus-glib"
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
 SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git"
 
+PR = "r1"
+
 S = "${WORKDIR}/git"
 
 inherit autotools gtk-icon-cache
diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
index 8936dbd..9bc4e85 100644
--- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SECTION = "x11/gnome"
-PR = "r1"
+PR = "r2"
 inherit gnome allarch
 
 # The omf.make file failed if scrollkeeper doesn't happen to be
diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 4687a7b..188446a 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -11,7 +11,7 @@ do_configure_prepend () {
 
 FILES_${PN} += "${datadir}/gnome-about ${datadir}/libgnome-desktop/pnp.ids"
 
-PR = "r6"
+PR = "r7"
 
 inherit gnome pkgconfig
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index e93f584..3c38150 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r8"
+PR = "r9"
 
 SRC_URI += "file://xsltproc_nonet.patch \
 	    file://use-usr-bin-env-for-python-in-xml2po.patch \
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 1fd42b4..d822721 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r8"
+PR = "r9"
 
 inherit autotools gnome gtk-doc pkgconfig
 
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
index fc891c7..3670912 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 inherit gnome
 inherit autotools
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://pkgconfig.patch"
 
diff --git a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb b/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
index c3f4047..e12ed70 100644
--- a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
+++ b/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
@@ -13,3 +13,5 @@ inherit gnome pkgconfig autotools gettext
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
+
+PR = "r1"
diff --git a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
index 8ed44f3..3d8bd4f 100644
--- a/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
+++ b/meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0914b9d3ebaba41ef2e3e0ae16f296cf \
                     file://egg/egg-dh.h;endline=22;md5=1626c16af2a8da1f88324cf3ced33f08"
 
 SECTION = "x11/gnome/libs"
-PR = "r3"
+PR = "r4"
 
 inherit gnome gtk-doc
 
diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
index 3524f0e..5536fc3 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.30.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
 DEPENDS = "startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
-PR = "r5"
+PR = "r6"
 
 inherit gnome update-alternatives
 
diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 0414386..c62ffa3 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
-PR = "r4"
+PR = "r5"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c544870..259517e 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "gtk+"
 
-PR = "r2"
+PR = "r3"
 
 PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
 
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 759c9d8..7c911e0 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -10,7 +10,7 @@ inherit gnome allarch
 
 DEPENDS = ""
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
         file://index.theme"
diff --git a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
index 18db4e7..a4cbd51 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.14.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0"
 
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 0b01dc1..c8a2fac 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
 
 SECTION = "libs"
-PR = "r4"
+PR = "r5"
 DEPENDS = "zlib gdk-pixbuf gtk+"
 
 inherit autotools pkgconfig gnome gtk-doc
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6bb5fe2..12ae310 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "gtk+ libcroco cairo libxml2"
 DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
-PR = "r9"
+PR = "r10"
 
 inherit autotools pkgconfig gnome gtk-doc
 
diff --git a/meta/recipes-graphics/mutter/mutter_2.29.1.bb b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
index aefd2c7..6a88441 100644
--- a/meta/recipes-graphics/mutter/mutter_2.29.1.bb
+++ b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
@@ -1,6 +1,6 @@
 require mutter.inc
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta/recipes-graphics/mutter/mutter_git.bb b/meta/recipes-graphics/mutter/mutter_git.bb
index 94cb17d..c151a1d 100644
--- a/meta/recipes-graphics/mutter/mutter_git.bb
+++ b/meta/recipes-graphics/mutter/mutter_git.bb
@@ -2,7 +2,7 @@ require mutter.inc
 
 SRCREV = "01d3bebe24d2a56bdf2d82c4a71923e1573f7b7c"
 PV = "2.29.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 108f8e8..6405359 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -2,7 +2,7 @@ require sato-icon-theme.inc
 
 DEPENDS += "icon-naming-utils-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
            file://iconpath-option.patch \
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index d1cc037..b68500f 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r9"
+PR = "r10"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.3.bb b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
index d9ff8de..d11462b 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.3.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r3"
+PR = "r4"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index 2cb1871..1fe66e7 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.9.5



