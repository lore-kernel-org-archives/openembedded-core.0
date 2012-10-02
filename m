Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1TJ4YN-0004vl-BT
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:38:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2012 08:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="229037117"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2012 08:25:08 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 18:25:49 +0300
Message-Id: <1349191549-26315-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gypsy: package removed from meta
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
X-List-Received-Date: Tue, 02 Oct 2012 15:38:35 -0000

Removed package from meta/recipes-connectivity and also all the dependencies reffering to it.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc     |    1 -
 .../distro/include/poky-floating-revisions.inc     |    1 -
 meta/recipes-connectivity/gypsy/files/fixups.patch |   21 -----------------
 meta/recipes-connectivity/gypsy/gypsy.inc          |   15 ------------
 meta/recipes-connectivity/gypsy/gypsy_0.9.bb       |   24 --------------------
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |   18 ---------------
 .../packagegroups/packagegroup-sdk-gmae.inc        |    1 -
 7 files changed, 81 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gypsy/files/fixups.patch
 delete mode 100644 meta/recipes-connectivity/gypsy/gypsy.inc
 delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_0.9.bb
 delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_git.bb

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 38b6974..288557b 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -225,7 +225,6 @@ RECIPE_MAINTAINER_pn-guile = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 RECIPE_MAINTAINER_pn-gupnp = "Radu Moisan <radu.moisan@intel.com>"
 RECIPE_MAINTAINER_pn-gupnp-av = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gupnp-tools = "Cristian Iorga <cristian.iorga@intel.com>"
-RECIPE_MAINTAINER_pn-gypsy = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_MAINTAINER_pn-hal = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-hal-info = "Saul Wold <sgw@linux.intel.com>"
diff --git a/meta-yocto/conf/distro/include/poky-floating-revisions.inc b/meta-yocto/conf/distro/include/poky-floating-revisions.inc
index af8ef11..6f6ee90 100644
--- a/meta-yocto/conf/distro/include/poky-floating-revisions.inc
+++ b/meta-yocto/conf/distro/include/poky-floating-revisions.inc
@@ -45,7 +45,6 @@ SRCREV_pn-xvideo-tests ?= "${AUTOREV}"
 SRCREV_pn-clutter ?= "${AUTOREV}"
 SRCREV_pn-clutter-gst ?= "${AUTOREV}"
 SRCREV_pn-gaku ?= "${AUTOREV}"
-SRCREV_pn-gypsy ?= "${AUTOREV}"
 #SRCREV_pn-webkit-gtk ?= "${AUTOREV}"
 SRCREV_pn-aaina ?= "${AUTOREV}"
 SRCREV_pn-clutter-cairo ?= "${AUTOREV}"
diff --git a/meta/recipes-connectivity/gypsy/files/fixups.patch b/meta/recipes-connectivity/gypsy/files/fixups.patch
deleted file mode 100644
index de4d92e..0000000
--- a/meta/recipes-connectivity/gypsy/files/fixups.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- docs/reference/Makefile.am |    2 ++
- 1 file changed, 2 insertions(+)
-
---- gypsy.orig/docs/reference/Makefile.am
-+++ gypsy/docs/reference/Makefile.am
-@@ -81,10 +81,12 @@ expand_content_files=
- # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
- 
- INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
- GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
- 
-+EXTRA_DIST =
-+CLEANFILES =
- # This includes the standard gtk-doc make rules, copied by gtkdocize.
- include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-connectivity/gypsy/gypsy.inc
deleted file mode 100644
index 0c1735e..0000000
--- a/meta/recipes-connectivity/gypsy/gypsy.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "GPS Multiplexing Daemon"
-DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
-multiple clients to access GPS data from multiple GPS sources \
-concurrently.  Gypsy also hides the details of parsing NMEA from the \
-client applications, passing the data as simple values for the clients \
-to use."
-LICENSE = "GPLv2.0 & LGPLv2.1"
-SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
-
-inherit autotools pkgconfig gtk-doc
-
-EXTRA_OECONF += "--with-distro=debian"
-
-FILES_${PN} += "/usr/share/dbus-1/services/"
diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
deleted file mode 100644
index 51207c9..0000000
--- a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "GPS Multiplexing Daemon"
-DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
-multiple clients to access GPS data from multiple GPS sources \
-concurrently.  Gypsy also hides the details of parsing NMEA from the \
-client applications, passing the data as simple values for the clients \
-to use."
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
-                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
-
-SECTION = "x11"
-DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
-
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
-PR = "r1"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += "/usr/share/dbus-1/system-services/"
-
-SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
-SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
deleted file mode 100644
index 867582d..0000000
--- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require gypsy.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
-PV = "0.8+git${SRCPV}"
-PR = "r2"
-
-S = "${WORKDIR}/git"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
-                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
-
-SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
-           file://fixups.patch"
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
index f9e373d..b0ecc28 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
+++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
@@ -18,7 +18,6 @@ SDK-GMAE = " \
     gupnp \
     gupnp-av \
     gupnp-tools \
-    gypsy \
     libart-lgpl \
     libgalago \
     libtelepathy \
-- 
1.7.9.5



