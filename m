Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 06C7B77162
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703426"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:34 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:57 +0300
Message-Id: <ed1c6596f508634796a44d6ec835d60aa6ca9104.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/31] python-imaging: remove unused recipe
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:57 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/security_flags.inc        |  1 -
 ...ing-setup.py-force-paths-for-zlib-freetyp.patch | 55 ------------------
 .../allow.to.disable.some.features.patch           | 65 ----------------------
 .../python-imaging/fix-freetype-includes.patch     | 30 ----------
 .../python/python-imaging_1.1.7.bb                 | 45 ---------------
 6 files changed, 197 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging_1.1.7.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 5626792..f3315b4 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -338,7 +338,6 @@ DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools Debian=pyth
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
 DISTRO_PN_ALIAS_pn-python-git = "Debian=python-git Fedora=GitPython"
-DISTRO_PN_ALIAS_pn-python-imaging = "Mandriva=python-imaging Debian=python-imaging"
 DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl Ubuntu=python-pycurl"
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index fc4c581..a4c0ead 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -76,7 +76,6 @@ SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-imaging = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch b/meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
deleted file mode 100644
index 2575306..0000000
--- a/meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 07d4f095a9e22ae676a8d68073101131e65012dc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 15 Nov 2011 13:16:54 +0100
-Subject: [PATCH] python imaging setup.py: force paths for zlib, freetype and jpeg and don't add host paths
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- setup.py |   14 +++-----------
- 1 files changed, 3 insertions(+), 11 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 5d4d53a..b1a22ec 100644
---- a/setup.py
-+++ b/setup.py
-@@ -34,10 +34,10 @@ def libinclude(root):
- # TIFF_ROOT = libinclude("/opt/tiff")
- 
- TCL_ROOT = None
--JPEG_ROOT = None
--ZLIB_ROOT = None
-+JPEG_ROOT = os.environ['STAGING_LIBDIR']
-+ZLIB_ROOT = os.environ['STAGING_LIBDIR']
- TIFF_ROOT = None
--FREETYPE_ROOT = None
-+FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
- LCMS_ROOT = None
- 
- # FIXME: add mechanism to explicitly *disable* the use of a library
-@@ -147,7 +147,6 @@ class pil_build_ext(build_ext):
-             add_directory(library_dirs, "/opt/local/lib")
-             add_directory(include_dirs, "/opt/local/include")
- 
--        add_directory(library_dirs, "/usr/local/lib")
-         # FIXME: check /opt/stuff directories here?
- 
-         prefix = sysconfig.get_config_var("prefix")
-@@ -207,13 +206,6 @@ class pil_build_ext(build_ext):
-             if os.path.isfile(os.path.join(tcl_dir, "tk.h")):
-                 add_directory(include_dirs, tcl_dir)
- 
--        # standard locations
--        add_directory(library_dirs, "/usr/local/lib")
--        add_directory(include_dirs, "/usr/local/include")
--
--        add_directory(library_dirs, "/usr/lib")
--        add_directory(include_dirs, "/usr/include")
--
-         #
-         # insert new dirs *before* default libs, to avoid conflicts
-         # between Python PYD stub libs and real libraries
--- 
-1.7.2.5
-
diff --git a/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch b/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
deleted file mode 100644
index 4960ed4..0000000
--- a/meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-At least lcms wasn't deterministicly detected from sysroot.
-
-This will allow to export LCMS_ENABLED=False when lcms isn't in PACKAGECONFIG.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr Imaging-1.1.7.orig/setup.py Imaging-1.1.7/setup.py
---- Imaging-1.1.7.orig/setup.py	2013-07-22 10:17:02.081457075 +0200
-+++ Imaging-1.1.7/setup.py	2013-07-22 13:10:09.029707492 +0200
-@@ -39,6 +39,12 @@
- TIFF_ROOT = None
- FREETYPE_ROOT =  os.environ['STAGING_LIBDIR'], os.environ['STAGING_INCDIR']
- LCMS_ROOT = None
-+TCL_ENABLED = os.getenv('TCL_ENABLED', "True")
-+JPEG_ENABLED = os.getenv('JPEG_ENABLED', "True")
-+ZLIB_ENABLED = os.getenv('ZLIB_ENABLED', "True")
-+TIFF_ENABLED = os.getenv('TIFF_ENABLED', "True")
-+FREETYPE_ENABLED = os.getenv('FREETYPE_ENABLED', "True")
-+LCMS_ENABLED = os.getenv('LCMS_ENABLED', "True")
- 
- # FIXME: add mechanism to explicitly *disable* the use of a library
- 
-@@ -220,22 +226,22 @@
-             zlib = jpeg = tiff = freetype = tcl = tk = lcms = None
-         feature = feature()
- 
--        if find_include_file(self, "zlib.h"):
-+        if ZLIB_ENABLED == 'True' and find_include_file(self, "zlib.h"):
-             if find_library_file(self, "z"):
-                 feature.zlib = "z"
-             elif sys.platform == "win32" and find_library_file(self, "zlib"):
-                 feature.zlib = "zlib" # alternative name
- 
--        if find_include_file(self, "jpeglib.h"):
-+        if JPEG_ENABLED == 'True' and find_include_file(self, "jpeglib.h"):
-             if find_library_file(self, "jpeg"):
-                 feature.jpeg = "jpeg"
-             elif sys.platform == "win32" and find_library_file(self, "libjpeg"):
-                 feature.jpeg = "libjpeg" # alternative name
- 
--        if find_library_file(self, "tiff"):
-+        if TIFF_ENABLED == 'True' and find_library_file(self, "tiff"):
-             feature.tiff = "tiff"
- 
--        if find_library_file(self, "freetype"):
-+        if FREETYPE_ENABLED == 'True' and find_library_file(self, "freetype"):
-             # look for freetype2 include files
-             freetype_version = 0
-             for dir in self.compiler.include_dirs:
-@@ -256,11 +262,11 @@
-                 if dir:
-                     add_directory(self.compiler.include_dirs, dir, 0)
- 
--        if find_include_file(self, "lcms.h"):
-+        if LCMS_ENABLED == 'True' and find_include_file(self, "lcms.h"):
-             if find_library_file(self, "lcms"):
-                 feature.lcms = "lcms"
- 
--        if _tkinter and find_include_file(self, "tk.h"):
-+        if TCL_ENABLED == 'True' and _tkinter and find_include_file(self, "tk.h"):
-             # the library names may vary somewhat (e.g. tcl84 or tcl8.4)
-             version = TCL_VERSION[0] + TCL_VERSION[2]
-             if find_library_file(self, "tcl" + version):
diff --git a/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch b/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
deleted file mode 100644
index 9ecc63a..0000000
--- a/meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From c6040f618d8f2706a7b46d1cdf37d1a587f9701f Mon Sep 17 00:00:00 2001
-From: Andrew Stromnov <stromnov@gmail.com>
-Date: Thu, 28 Nov 2013 16:58:43 +0400
-Subject: [PATCH] fix compiling with FreeType 2.5.1
-
----
- _imagingft.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/_imagingft.c b/_imagingft.c
-index 47d50bd..f19555b 100644
---- a/_imagingft.c
-+++ b/_imagingft.c
-@@ -59,7 +59,11 @@ struct {
-     const char* message;
- } ft_errors[] =
- 
-+#if defined(USE_FREETYPE_2_1)
-+#include FT_ERRORS_H
-+#else
- #include <freetype/fterrors.h>
-+#endif
- 
- /* -------------------------------------------------------------------- */
- /* font objects */
--- 
-1.8.5.1
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
deleted file mode 100644
index a678328..0000000
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Python Imaging Library (PIL)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
-DEPENDS = "freetype jpeg tiff"
-SRCNAME = "Imaging"
-PR = "r5"
-
-SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
-           file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
-           file://allow.to.disable.some.features.patch \
-           file://fix-freetype-includes.patch"
-
-SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
-SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-# There isn't enable/disable option, and lcms is in meta-oe, at least make it explicit when enabled
-# setup.py already has FIXME: add mechanism to explicitly *disable* the use of a library
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[lcms] = ",,lcms"
-
-inherit distutils
-
-do_compile() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
-    distutils_do_compile
-}
-
-do_install() {
-    export STAGING_LIBDIR=${STAGING_LIBDIR}
-    export STAGING_INCDIR=${STAGING_INCDIR}
-    export LCMS_ENABLED=${@bb.utils.contains('PACKAGECONFIG', 'lcms', 'True', 'False', d)}
-    distutils_do_install
-    install -d ${D}${datadir}/doc/${BPN}/html/
-    install -m 0644 ${S}/README ${D}${datadir}/doc/${BPN}/
-    install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${BPN}/html/
-
-    # get rid of #!/usr/local/bin/python
-    sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
-}
-
-RDEPENDS_${PN} += "python-lang python-stringold"
-- 
2.8.1


