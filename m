Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UeRwE-00042Z-Fl
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:23:54 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 1CEEC952D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 16:05:32 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:05:18 +0100
Message-Id: <1369062325-30335-2-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v2 1/8] Remove old clutter recipes
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
X-List-Received-Date: Mon, 20 May 2013 15:23:59 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |   23 -------
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |   20 ------
 meta/recipes-graphics/clutter/clutter-fpu.inc      |    6 --
 .../clutter/clutter-gst-1.8_1.4.6.bb               |   22 -------
 meta/recipes-graphics/clutter/clutter-gst.inc      |   13 ----
 .../clutter/clutter-gst/enable_tests-1.4.patch     |   18 ------
 .../clutter/clutter-gst/enable_tests-1.8.patch     |   17 -----
 .../clutter/clutter-gst/enable_tests.patch         |   18 ------
 .../clutter/clutter-gtk-1.8_0.11.4.bb              |   11 ----
 meta/recipes-graphics/clutter/clutter-gtk.inc      |   14 ----
 .../clutter/clutter-gtk/disable_deprecated.patch   |   21 ------
 .../clutter/clutter-gtk/enable_tests.patch         |   18 ------
 meta/recipes-graphics/clutter/clutter-package.inc  |    2 -
 meta/recipes-graphics/clutter/clutter.inc          |   23 -------
 .../clutter/clutter/build-fix.patch                |   18 ------
 .../clutter/clutter/enable_tests-0.6.patch         |   42 ------------
 .../clutter/clutter/enable_tests-0.8.patch         |   52 ---------------
 .../clutter/clutter/enable_tests-1.0.patch         |   34 ----------
 .../clutter/clutter/enable_tests-1.4.patch         |   15 -----
 ...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch |   34 ----------
 .../clutter/clutter/enable_tests.patch             |   34 ----------
 .../clutter/clutter/symconflict.patch              |   33 ----------
 .../clutter/clutter/test-conformance-fix.patch     |   68 --------------------
 .../clutter/update_gettext_macro_version.patch     |   32 ---------
 meta/recipes-graphics/clutter/cogl.inc             |   22 -------
 .../clutter/cogl/build_for_armv4t.patch            |   23 -------
 .../clutter/cogl/macro-versions.patch              |   28 --------
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |   12 ----
 meta/recipes-graphics/clutter/cogl_git.bb          |   16 -----
 29 files changed, 689 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.8_git.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-fpu.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-package.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter/build-fix.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/symconflict.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
 delete mode 100644 meta/recipes-graphics/clutter/cogl.inc
 delete mode 100644 meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
 delete mode 100644 meta/recipes-graphics/clutter/cogl/macro-versions.patch
 delete mode 100644 meta/recipes-graphics/clutter/cogl_1.8.2.bb
 delete mode 100644 meta/recipes-graphics/clutter/cogl_git.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
deleted file mode 100644
index aceef96..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require recipes-graphics/clutter/clutter.inc
-require recipes-graphics/clutter/clutter-package.inc
-
-PR = "r2"
-
-# We're API/ABI compatible and this may make things easier for layers
-PROVIDES += "clutter-1.6"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter/1.8/clutter-${PV}.tar.bz2 \
-           file://enable_tests-1.4.patch \
-           file://update_gettext_macro_version.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-# because we've namespaced PN to clutter-1.8
-S = "${WORKDIR}/clutter-${PV}"
-
-BASE_CONF += "--disable-introspection"
-
-SRC_URI[md5sum] = "487f70f9b59e1328b47f1db4094ab662"
-SRC_URI[sha256sum] = "0d567177facd6913ac9c894e230ae48933125f02354ef965bbbf0586f1f0df91"
diff --git a/meta/recipes-graphics/clutter/clutter-1.8_git.bb b/meta/recipes-graphics/clutter/clutter-1.8_git.bb
deleted file mode 100644
index 89d8026..0000000
--- a/meta/recipes-graphics/clutter/clutter-1.8_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require clutter.inc
-require clutter-package.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-# the 1.8.4 tag
-SRCREV = "f2183fa8df3d173afbee09cc4230ab8f4e03f459"
-PV = "1.8.4+git${SRCPV}"
-PR = "r2"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.gnome.org/clutter;protocol=git;branch=master \
-           file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
-           file://enable_tests.patch;notrev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 "
-S = "${WORKDIR}/git"
-
-BASE_CONF += "--disable-introspection"
-
-AUTOTOOLS_AUXDIR = "${S}/build"
diff --git a/meta/recipes-graphics/clutter/clutter-fpu.inc b/meta/recipes-graphics/clutter/clutter-fpu.inc
deleted file mode 100644
index c541fe3..0000000
--- a/meta/recipes-graphics/clutter/clutter-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_clutter_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
-        return "--without-fpu"
-    return ""
-
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
deleted file mode 100644
index facb0a1..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.6.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require recipes-graphics/clutter/clutter-gst.inc
-
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
-
-DEPENDS += "clutter-1.8 gstreamer"
-RDEPENDS_${PN} += "gst-meta-base"
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.4/clutter-gst-${PV}.tar.bz2 \
-           file://enable_tests-1.8.patch"
-
-S = "${WORKDIR}/clutter-gst-${PV}"
-
-SRC_URI[md5sum] = "98aeed6baa7b3a80f10e7733080eb088"
-SRC_URI[sha256sum] = "54e2966e507563bd3f123a4e25780c2487f854c6cc3df3bedc8c6b5eb45e9769"
-
-do_configure_prepend () {
-       # Disable DOLT
-       sed -i -e 's/^DOLT//' ${S}/configure.ac
-}
diff --git a/meta/recipes-graphics/clutter/clutter-gst.inc b/meta/recipes-graphics/clutter/clutter-gst.inc
deleted file mode 100644
index 702424b..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Clutter GStreamer"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2+"
-
-DEPENDS = "gstreamer gst-plugins-base"
-
-FILESPATH = "${FILE_DIRNAME}/clutter-gst"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/video-player ${bindir}/video-sink"
-
-inherit autotools pkgconfig gtk-doc
-
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
deleted file mode 100644
index 3fc1378..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-05-04 14:07:21.000000000 -0700
-+++ git/examples/Makefile.am	2011-05-04 14:24:38.625984314 -0700
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink audio-player
-+bin_PROGRAMS = video-player video-sink audio-player
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
deleted file mode 100644
index de1dcc2..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Install example binary needed for poky-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-Index: clutter-gst-1.3.8/examples/Makefile.am
-===================================================================
---- clutter-gst-1.3.8.orig/examples/Makefile.am
-+++ clutter-gst-1.3.8/examples/Makefile.am
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink video-sink-navigation
-+bin_PROGRAMS = video-player video-sink video-sink-navigation
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
deleted file mode 100644
index 6175a52..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Install example binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
-+++ git/examples/Makefile.am	2011-01-31 10:14:34.000000000 +0800
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink
-+bin_PROGRAMS = video-player video-sink
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
deleted file mode 100644
index 0885ce1..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.8_0.11.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require recipes-graphics/clutter/clutter-gtk.inc
-
-SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.11/clutter-gtk-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8b88cfcb0358ecfe3e9228efd55f7ebc"
-SRC_URI[sha256sum] = "58d5b027c4589ff442d820f624d7991e25cbeaab795b05f2df2e4c7bc1af2cf6"
-
-DEPENDS += "clutter-1.8"
-
-inherit gettext
-
-S = "${WORKDIR}/clutter-gtk-${PV}"
\ No newline at end of file
diff --git a/meta/recipes-graphics/clutter/clutter-gtk.inc b/meta/recipes-graphics/clutter/clutter-gtk.inc
deleted file mode 100644
index e8d9e10..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Clutter GTK+"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS = "gtk+"
-
-FILESPATH = "${FILE_DIRNAME}/clutter-gtk"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/*"
-
-inherit autotools pkgconfig gtk-doc
-
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
deleted file mode 100644
index f44755b..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Enable GTK_WIDGET macros
-
-This patch enables the macros that clutter-gtk is still using
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/clutter-gtk/Makefile.am
-===================================================================
---- git.orig/clutter-gtk/Makefile.am	2011-05-04 14:07:20.000000000 -0700
-+++ git/clutter-gtk/Makefile.am	2011-05-04 14:25:34.013984328 -0700
-@@ -8,8 +8,6 @@
-         -DCLUTTER_GTK_COMPILATION               \
-         -DG_DISABLE_DEPRECATED                  \
-         -DGDK_PIXBUF_DISABLE_DEPRECATED         \
--        -DGDK_DISABLE_DEPRECATED                \
--        -DGTK_DISABLE_DEPRECATED                \
- 	-DCLUTTER_DISABLE_DEPRECATED
- 
- AM_CPPFLAGS = \
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
deleted file mode 100644
index bedf80e..0000000
--- a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Install the test binary needed for core-image-clutter
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2011-05-04 14:07:20.000000000 -0700
-+++ git/examples/Makefile.am	2011-05-04 14:38:29.785984519 -0700
-@@ -1,6 +1,6 @@
- NULL =
- 
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	gtk-clutter-events \
- 	gtk-clutter-multistage \
- 	gtk-clutter-test \
diff --git a/meta/recipes-graphics/clutter/clutter-package.inc b/meta/recipes-graphics/clutter/clutter-package.inc
deleted file mode 100644
index 22993ff..0000000
--- a/meta/recipes-graphics/clutter/clutter-package.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-PACKAGES =+ "clutter-examples"
-FILES_clutter-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
deleted file mode 100644
index 5a912af..0000000
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Clutter graphics library"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1+"
-
-# Internal json-glib was removed in Clutter 1.5.2, cogl was removed in 1.8, atk required since 1.8
-STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes libxi json-glib cogl atk"
-BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
-
-DEPENDS = "${STDDEPENDS} virtual/libgl libdrm"
-EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
-
-FILESPATH = "${FILE_DIRNAME}/clutter"
-
-inherit autotools pkgconfig gtk-doc gettext
-
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require clutter-fpu.inc
-
-#Fix up some weirdness in the docs
-do_configure_prepend() {
-        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
-        sed -i s:doc::g ${S}/Makefile.am
-}
diff --git a/meta/recipes-graphics/clutter/clutter/build-fix.patch b/meta/recipes-graphics/clutter/clutter/build-fix.patch
deleted file mode 100644
index 08c1845..0000000
--- a/meta/recipes-graphics/clutter/clutter/build-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Installing the same file twice causes an error in Automake 1.11
-
-JL 19/03/10
-
-Upstream-Status: Pending
-
-Index: git/clutter/Makefile.am
-===================================================================
---- git.orig/clutter/Makefile.am	2010-03-19 11:37:51.000000000 +0000
-+++ git/clutter/Makefile.am	2010-03-19 11:50:46.744042007 +0000
-@@ -219,7 +219,6 @@
- 	$(source_h) \
- 	clutter-json.h \
- 	clutter-enum-types.h \
--	clutter-version.h \
- 	clutter.h
- 
- DISTCLEANFILES = \
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
deleted file mode 100644
index 8cff0c5..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
+++ /dev/null
@@ -1,42 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: clutter-0-6/tests/Makefile.am
-===================================================================
---- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/Makefile.am	2007-11-06 12:30:11.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-project \
- 		  test-boxes test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-score test-script
-@@ -26,4 +26,9 @@ test_timeline_SOURCES  = test-timeline.c
- test_score_SOURCES     = test-score.c
- test_script_SOURCES    = test-script.c
- 
-+test_textdir           = $(pkgdatadir)
-+test_text_DATA         = test-text.c
-+test_actorsdir         = $(pkgdatadir)
-+test_actors_DATA       = redhand.png
-+
- EXTRA_DIST = redhand.png test-script.json
-Index: clutter-0-6/tests/test-actors.c
-===================================================================
---- clutter.orig/tests/test-actors.c	2007-11-06 12:29:17.000000000 +0000
-+++ clutter-0-6/tests/test-actors.c	2007-11-06 12:29:21.000000000 +0000
-@@ -143,7 +143,7 @@ main (int argc, char *argv[])
-   stage = clutter_stage_get_default ();
-   clutter_actor_set_size (stage, 800, 600);
- 
--  pixbuf = gdk_pixbuf_new_from_file ("redhand.png", NULL);
-+  pixbuf = gdk_pixbuf_new_from_file ("/usr/share/clutter/redhand.png", NULL);
- 
-   if (!pixbuf)
-     g_error("pixbuf load failed");
-
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
deleted file mode 100644
index d3c196f..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: clutter/tests/Makefile.am
-===================================================================
---- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
-+++ clutter/tests/Makefile.am	2008-06-26 16:46:50.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = test-textures test-events test-offscreen test-scale \
-+bin_PROGRAMS = test-textures test-events test-offscreen test-scale \
-                   test-actors test-behave test-text test-entry test-project \
- 		  test-perspective test-rotate test-depth \
- 		  test-threads test-timeline test-timeline-dup-frames \
-@@ -17,8 +17,8 @@
- 		  test-invariants
- 
- if X11_TESTS
--noinst_PROGRAMS += test-pixmap
--noinst_PROGRAMS += test-devices
-+bin_PROGRAMS += test-pixmap
-+bin_PROGRAMS += test-devices
- endif
- 
- INCLUDES = -I$(top_srcdir)/ -I$(top_srcdir)/clutter -I$(top_builddir)/clutter
-@@ -73,4 +73,9 @@
- test_invariants_SOURCES           = test-invariants.c
- test_devices_SOURCES              = test-devices.c
- 
-+test_textdir           = $(pkgdatadir)
-+test_text_DATA         = test-text.c
-+test_actorsdir         = $(pkgdatadir)
-+test_actors_DATA       = redhand.png
-+
- EXTRA_DIST = redhand.png test-script.json
-Index: clutter/tests/test-actors.c
-===================================================================
---- clutter.orig/tests/test-actors.c	2008-06-26 16:46:26.000000000 +0100
-+++ clutter/tests/test-actors.c	2008-06-26 16:46:31.000000000 +0100
-@@ -195,7 +195,7 @@
-       /* Create a texture from file, then clone in to same resources */
-       if (i == 0)
- 	{
--	  if ((oh->hand[i] = clutter_texture_new_from_file ("redhand.png",
-+	  if ((oh->hand[i] = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png",
- 							    &error)) == NULL)
- 	    {
- 	      g_error ("image load failed: %s", error->message);
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
deleted file mode 100644
index 16460b1..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
+++ /dev/null
@@ -1,34 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/tests/interactive/Makefile.am
-===================================================================
---- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
-+++ git/tests/interactive/Makefile.am	2009-03-12 11:04:12.000000000 +0000
-@@ -77,7 +77,7 @@
- AM_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
- AM_LDFLAGS = $(CLUTTER_LIBS)
- 
--noinst_PROGRAMS = test-interactive
-+bin_PROGRAMS = test-interactive
- 
- test_interactive_SOURCES = \
- 	test-main.c \
-Index: git/tests/interactive/test-actors.c
-===================================================================
---- git.orig/tests/interactive/test-actors.c	2009-03-12 11:01:36.000000000 +0000
-+++ git/tests/interactive/test-actors.c	2009-03-12 11:06:32.000000000 +0000
-@@ -182,7 +182,7 @@
-   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
-   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
- 
--  real_hand = clutter_texture_new_from_file ("redhand.png", &error);
-+  real_hand = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png", &error);
-   if (real_hand == NULL)
-     {
-       g_error ("image load failed: %s", error->message);
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
deleted file mode 100644
index 2ff7697..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/tests/interactive/Makefile.am
-===================================================================
---- git.orig/tests/interactive/Makefile.am	2011-01-28 14:06:29.000000000 +0800
-+++ git/tests/interactive/Makefile.am	2011-01-28 14:26:59.000000000 +0800
-@@ -107,7 +107,7 @@
- 
- common_ldadd = $(top_builddir)/clutter/libclutter-@CLUTTER_SONAME_INFIX@-@CLUTTER_API_VERSION@.la
- 
--noinst_PROGRAMS = test-interactive
-+bin_PROGRAMS = test-interactive
- 
- test_interactive_SOURCES = test-main.c $(UNIT_TESTS)
- test_interactive_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
deleted file mode 100644
index 16460b1..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
+++ /dev/null
@@ -1,34 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/tests/interactive/Makefile.am
-===================================================================
---- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
-+++ git/tests/interactive/Makefile.am	2009-03-12 11:04:12.000000000 +0000
-@@ -77,7 +77,7 @@
- AM_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
- AM_LDFLAGS = $(CLUTTER_LIBS)
- 
--noinst_PROGRAMS = test-interactive
-+bin_PROGRAMS = test-interactive
- 
- test_interactive_SOURCES = \
- 	test-main.c \
-Index: git/tests/interactive/test-actors.c
-===================================================================
---- git.orig/tests/interactive/test-actors.c	2009-03-12 11:01:36.000000000 +0000
-+++ git/tests/interactive/test-actors.c	2009-03-12 11:06:32.000000000 +0000
-@@ -182,7 +182,7 @@
-   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
-   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
- 
--  real_hand = clutter_texture_new_from_file ("redhand.png", &error);
-+  real_hand = clutter_texture_new_from_file ("/usr/share/clutter/redhand.png", &error);
-   if (real_hand == NULL)
-     {
-       g_error ("image load failed: %s", error->message);
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests.patch b/meta/recipes-graphics/clutter/clutter/enable_tests.patch
deleted file mode 100644
index 480b208..0000000
--- a/meta/recipes-graphics/clutter/clutter/enable_tests.patch
+++ /dev/null
@@ -1,34 +0,0 @@
----
- tests/Makefile.am   |    7 ++++++-
- tests/test-actors.c |    2 +-
- tests/test-text.c   |    2 +-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/tests/interactive/Makefile.am
-===================================================================
---- git.orig/tests/interactive/Makefile.am	2009-11-30 17:39:46.000000000 +0000
-+++ git/tests/interactive/Makefile.am	2009-11-30 17:42:30.000000000 +0000
-@@ -88,7 +88,7 @@
- 
- common_ldadd = $(top_builddir)/clutter/libclutter-@CLUTTER_WINSYS@-@CLUTTER_API_VERSION@.la
- 
--noinst_PROGRAMS = test-interactive
-+bin_PROGRAMS = test-interactive
- 
- test_interactive_SOURCES = test-main.c $(UNIT_TESTS)
- test_interactive_CFLAGS = $(CLUTTER_CFLAGS) $(MAINTAINER_CFLAGS)
-Index: git/tests/interactive/test-actors.c
-===================================================================
---- git.orig/tests/interactive/test-actors.c	2009-11-30 17:39:46.000000000 +0000
-+++ git/tests/interactive/test-actors.c	2009-11-30 17:43:03.000000000 +0000
-@@ -178,7 +178,7 @@
-   oh->scaler_1 = clutter_behaviour_scale_new (alpha, 0.5, 0.5, 1.0, 1.0);
-   oh->scaler_2 = clutter_behaviour_scale_new (alpha, 1.0, 1.0, 0.5, 0.5);
- 
--  file = g_build_filename (TESTS_DATADIR, "redhand.png", NULL);
-+  file = g_build_filename (TESTS_DATADIR, "/usr/share/clutter/redhand.png", NULL);
-   real_hand = clutter_texture_new_from_file (file, &error);
-   if (real_hand == NULL)
-     g_error ("image load failed: %s", error->message);
diff --git a/meta/recipes-graphics/clutter/clutter/symconflict.patch b/meta/recipes-graphics/clutter/clutter/symconflict.patch
deleted file mode 100644
index 05f3d27..0000000
--- a/meta/recipes-graphics/clutter/clutter/symconflict.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/tests/test-depth.c
-===================================================================
---- git.orig/tests/test-depth.c	2009-05-24 14:54:40.000000000 +0100
-+++ git/tests/test-depth.c	2009-05-24 14:55:13.000000000 +0100
-@@ -11,13 +11,13 @@
-   clutter_timeline_start (timeline);
- }
- 
--static ClutterActor *raise[2];
-+static ClutterActor *clutterraise[2];
- static gboolean raise_no = 0;
- 
- static gboolean
- raise_top (gpointer ignored)
- {
--  clutter_actor_raise_top (raise[raise_no]);
-+  clutter_actor_raise_top (clutterraise[raise_no]);
-   raise_no = !raise_no;
-   return TRUE;
- }
-@@ -202,8 +202,8 @@
- 
-   clutter_timeline_start (timeline);
- 
--  raise[0] = rect;
--  raise[1] = hand;
-+  clutterraise[0] = rect;
-+  clutterraise[1] = hand;
-   g_timeout_add (2000, raise_top, NULL);
- 
-   clutter_main ();
diff --git a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch b/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
deleted file mode 100644
index ccc6c2a..0000000
--- a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Compiling conformance test leads running test-conformance target binary, and
-gets failure in cross-compile environment. Introduce this commit from upstream
-to fix it.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-
-commit 7fd6273c25569fe4f37ad371532d93e5170e51f7
-Author: Neil Roberts <neil@linux.intel.com>
-Date:   Mon Oct 11 16:16:45 2010 +0100
-
-    tests: Generate the stub scripts using sed
-    
-    Instead of trying to run ./test-conformance with the -l option to
-    generate a list of available tests it now runs sed on the
-    test-conform-main.c file instead. Running the generated executable is
-    a pain for cross-compiling so it would be nice to avoid it unless it's
-    absolutely necessary. Although you could tell people who are cross
-    compiling to just disable the conformance tests, this seems a shame
-    because they could still be useful along with the wrappers for example
-    if the cross compile is built to a shared network folder where the
-    tests can be run on the actual device.
-    
-    The sed script is a little more ugly than it could be because it tries
-    to avoid using the GNU extensions '\+' and '\|'.
-    
-    The script ends up placing restrictions on the format of the C file
-    because the tests must all be listed on one line each. There is now a
-    comment to explain this. Hopefully the trade off is worth it.
-    
-    http://bugzilla.clutter-project.org/show_bug.cgi?id=2363
-
-Upstream-Status: Backport
-
-diff --git a/tests/conform/Makefile.am b/tests/conform/Makefile.am
-index 3036639..1e723e7 100644
---- a/tests/conform/Makefile.am
-+++ b/tests/conform/Makefile.am
-@@ -89,9 +89,11 @@ test_conformance_SOURCES = $(common_sources) $(units_sources)
- 
- wrappers: stamp-test-conformance
- 	@true
--stamp-test-conformance: Makefile test-conformance$(EXEEXT)
-+stamp-test-conformance: Makefile $(srcdir)/test-conform-main.c
- 	@mkdir -p wrappers
--	@( $(abs_builddir)/test-conformance$(EXEEXT) -l -m thorough | $(GREP) '^/' ) > unit-tests
-+	@sed -n -e 's/^ \{1,\}TEST_CONFORM_SIMPLE *(.*"\([^",]\{1,\}\)", *\([a-zA-Z0-9_]\{1,\}\).*/\/conform\1\/\2/p' \
-+	-e 's/^ \{1,\}TEST_CONFORM_SKIP *(.*"\([^",]\{1,\}\)", *\([a-zA-Z0-9_]\{1,\}\).*/\/conform\1\/\2/p' \
-+	$(srcdir)/test-conform-main.c > unit-tests
- 	@chmod +x test-launcher.sh
- 	@( echo "/stamp-test-conformance" ; \
- 	   echo "/test-conformance" ; \
-diff --git a/tests/conform/test-conform-main.c b/tests/conform/test-conform-main.c
-index a8b3cf8..2ae7a04 100644
---- a/tests/conform/test-conform-main.c
-+++ b/tests/conform/test-conform-main.c
-@@ -92,6 +92,11 @@ main (int argc, char **argv)
- {
-   clutter_test_init (&argc, &argv);
- 
-+  /* This file is run through a sed script during the make step so the
-+     lines containing the tests need to be formatted on a single line
-+     each. To comment out a test use the SKIP or TODO macros. Using
-+     #if 0 would break the script. */
-+
-   TEST_CONFORM_SIMPLE ("/timeline", test_timeline);
-   TEST_CONFORM_SKIP (!g_test_slow (), "/timeline", test_timeline_interpolate);
-   TEST_CONFORM_SKIP (!g_test_slow (), "/timeline", test_timeline_rewind);
diff --git a/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch b/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
deleted file mode 100644
index 6671098..0000000
--- a/meta/recipes-graphics/clutter/clutter/update_gettext_macro_version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: clutter-1.6.14/build/autotools/po.m4
-===================================================================
---- clutter-1.6.14.orig/build/autotools/po.m4	2011-05-31 22:39:55.000000000 -0700
-+++ clutter-1.6.14/build/autotools/po.m4	2011-05-31 22:40:36.898833113 -0700
-@@ -29,7 +29,7 @@
- 
-   dnl Release version of the gettext macros. This is used to ensure that
-   dnl the gettext macros and po/Makefile.in.in are in sync.
--  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
-+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
- 
-   dnl Perform the following tests also if --disable-nls has been given,
-   dnl because they are needed for "make dist" to work.
-Index: clutter-1.6.14/po/Makefile.in.in
-===================================================================
---- clutter-1.6.14.orig/po/Makefile.in.in	2011-05-31 22:40:05.000000000 -0700
-+++ clutter-1.6.14/po/Makefile.in.in	2011-05-31 22:40:21.030833109 -0700
-@@ -8,8 +8,8 @@
- # Please note that the actual code of GNU gettext is covered by the GNU
- # General Public License and is *not* in the public domain.
- #
--# Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+# Origin: gettext-0.18
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
deleted file mode 100644
index 26f7889..0000000
--- a/meta/recipes-graphics/clutter/cogl.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
-HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
-LICENSE = "LGPLv2.1+"
-
-STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes gdk-pixbuf libxi"
-BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
-
-DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite libxdamage libdrm"
-EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
-
-FILESPATH = "${FILE_DIRNAME}/cogl"
-
-inherit autotools pkgconfig gtk-doc gettext
-
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-require clutter-fpu.inc
-
-#Fix up some weirdness in the docs
-do_configure_prepend() {
-        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
-        sed -i s:doc::g ${S}/Makefile.am
-}
diff --git a/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch b/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
deleted file mode 100644
index 003e9ff..0000000
--- a/meta/recipes-graphics/clutter/cogl/build_for_armv4t.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-GCC will define __ARM_ARCH_4T__ when building with "-march=armv4t" so we can
-check this to turn off the use of 'clz' instructions, which otherwise would
-cause compile errors like "selected processor does not support ARM mode 
-`clz r3,r0'". 
-
-Upstream-Status: Accepted (should be in the next cogl stable release)
-
-Signed-off-by: Wolfgang Denk <wd@denx.de>
-Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
-Index: cogl-1.8.2/cogl/cogl-fixed.c
-===================================================================
---- cogl-1.8.2.orig/cogl/cogl-fixed.c
-+++ cogl-1.8.2/cogl/cogl-fixed.c
-@@ -626,7 +626,7 @@ cogl_fixed_sqrt (CoglFixed x)
- 	/*
- 	 * Find the highest bit set
- 	 */
--#if defined (__arm__)
-+#if defined (__arm__) && !defined(__ARM_ARCH_4T__)
- 	/* This actually requires at least arm v5, but gcc does not seem
- 	 * to set the architecture defines correctly, and it is I think
- 	 * very unlikely that anyone will want to use clutter on anything
diff --git a/meta/recipes-graphics/clutter/cogl/macro-versions.patch b/meta/recipes-graphics/clutter/cogl/macro-versions.patch
deleted file mode 100644
index 2dcdd8e..0000000
--- a/meta/recipes-graphics/clutter/cogl/macro-versions.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: cogl-1.8.0/configure.ac
-===================================================================
---- cogl-1.8.0.orig/configure.ac
-+++ cogl-1.8.0/configure.ac
-@@ -833,7 +833,7 @@ LT_INIT([disable-static])
- dnl ================================================================
- dnl I18n stuff.
- dnl ================================================================
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18])
- AM_GNU_GETTEXT([external])
- 
- GETTEXT_PACKAGE="cogl"
-Index: cogl-1.8.0/po/Makefile.in.in
-===================================================================
---- cogl-1.8.0.orig/po/Makefile.in.in
-+++ cogl-1.8.0/po/Makefile.in.in
-@@ -9,7 +9,7 @@
- # General Public License and is *not* in the public domain.
- #
- # Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
diff --git a/meta/recipes-graphics/clutter/cogl_1.8.2.bb b/meta/recipes-graphics/clutter/cogl_1.8.2.bb
deleted file mode 100644
index fe4266b..0000000
--- a/meta/recipes-graphics/clutter/cogl_1.8.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require cogl.inc
-
-PR = "r3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://source.clutter-project.org/sources/cogl/1.8/${BPN}-${PV}.tar.bz2 \
-	   file://macro-versions.patch \
-	   file://build_for_armv4t.patch"
-
-SRC_URI[md5sum] = "3145cbf7ff162c33065ea4421c047e2f"
-SRC_URI[sha256sum] = "8b647b51a4fa93034fcd74ffe86b3d4c919b0e54789108f6d065414e6162ab73"
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
deleted file mode 100644
index 3fb70ae..0000000
--- a/meta/recipes-graphics/clutter/cogl_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require cogl.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-# the 1.8.2 tag
-SRCREV = "e398e374e2ff0e88bc1d63577a192f8ca04a1cb5"
-PV = "1.8.2+git${SRCPV}"
-PR = "r4"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master \
-	   file://build_for_armv4t.patch"
-S = "${WORKDIR}/git"
-
-AUTOTOOLS_AUXDIR = "${S}/build"
-- 
1.7.10.4



