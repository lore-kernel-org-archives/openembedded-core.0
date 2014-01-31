Return-Path: <marius.avram@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 244C96E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 12:28:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jan 2014 04:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,757,1384329600"; d="scan'208";a="473825134"
Received: from mavram-vostro.rb.intel.com ([10.237.105.158])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2014 04:28:20 -0800
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 14:32:28 +0200
Message-Id: <1391171549-22890-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/1] libpng: upgrade to 1.6.8
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
X-List-Received-Date: Fri, 31 Jan 2014 12:28:22 -0000

Note: license has not changed. MD5 sum of files changed because new
contributors were added to LICENSE and png.h file contains the
version of the new release.

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.7.bb |   27 ------------------------
 meta/recipes-multimedia/libpng/libpng_1.6.8.bb |   27 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.7.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.6.8.bb

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.7.bb b/meta/recipes-multimedia/libpng/libpng_1.6.7.bb
deleted file mode 100644
index f41b550..0000000
--- a/meta/recipes-multimedia/libpng/libpng_1.6.7.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "PNG image format decoding library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=243135ddedf702158f9170807cbcfb66 \
-                    file://png.h;endline=15;md5=cb4981447519fe0bb87fbda5e8cd50be \
-                    file://png.h;beginline=209;endline=323;md5=f6b7821e0ddefaa4d71fdfa1f5a91fb7"
-DEPENDS = "zlib"
-LIBV = "16"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
-           file://0001-configure-lower-automake-requirement.patch \
-          "
-
-SRC_URI[md5sum] = "7023a9eacd7b6a3eb95761a2f574d456"
-SRC_URI[sha256sum] = "13c9c853a9a600218fff9961658dc4f485ad2ef9b862315b434dd2fdbbe1f945"
-
-inherit autotools binconfig pkgconfig
-
-# Work around missing symbols
-EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
-
-PACKAGES =+ "${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.8.bb b/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
new file mode 100644
index 0000000..d063495
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
@@ -0,0 +1,27 @@
+SUMMARY = "PNG image format decoding library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44bc22578be94b6536c8bdc3a01e5db9 \
+                    file://png.h;endline=15;md5=aa42e53406a5ebb9500bae72fa314b6d \
+                    file://png.h;beginline=209;endline=323;md5=83e13159b5bf0a4d9fb634acbda7cb5b"
+DEPENDS = "zlib"
+LIBV = "16"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+           file://0001-configure-lower-automake-requirement.patch \
+          "
+
+SRC_URI[md5sum] = "51ce71a1642cdde1f4485a7ff82193c0"
+SRC_URI[sha256sum] = "24f73d8b5e1d74a9482c81b65c3f93f96c7da7ed0417b8a948a75d2d99133081"
+
+inherit autotools binconfig pkgconfig
+
+# Work around missing symbols
+EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+
+PACKAGES =+ "${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


