Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36BCE7F1DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:22:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g67so43123478wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IDxSo9pdtSZjPdqGWMn+RHfcOo/w1MxQaeGiUs2VFS8=;
	b=C4qNyWgdvEG16XpBO2WFGDShqsMRoOb3eTy/WLvqSKcVJj0oZ3kg7aVckpBWCCu2g4
	f5QtVRlR/+koVJJ9AqfiFuAa/DbN5IR5vjcgvN4/SJwyZUD+qrlPXgCHZGUnS5ThTsIP
	zLsSztzyik4YPCT4NizHnFRp2C0XQ/ecPCYflKfSNCHEt4aGjU+J82zV6g2k7JO3djao
	xirs4g15lJZZPaGEt57vLoM6N6bUA8SXjgels6kKM6ZulGkmbApGQZ4KuveEDiZVRVZH
	j0G3tiMw06WmZsoC4r6DhxmGI3I5yu3WADnkn0oQUupyUlLyEX0qJVtirR7eYdvQySwV
	Bdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IDxSo9pdtSZjPdqGWMn+RHfcOo/w1MxQaeGiUs2VFS8=;
	b=f3swMkW3ZIcQ81QiAIorIKmTL+Pza7rGTOtiZlWtcEquPQJ/RE6cfJJ/+HsabbtLJD
	+kax1FEhjBNTctoYbUoko6Gxrymj6/G4paT2hFmzb7v6cQAOWFyg6740///t0qpsPH5U
	bDRgbKy304qwCin+e0vCgcaovvEOKQ0lPzEvFRSmPqyUSnpgIrNbekGIXqCBI3AxZKqM
	XYYR1O7iXGawauVuCeI8zyMyyeiRa0m0Q5d+WGy+F/trGaSpnRMAQTK5260WgxYjMt1z
	Tzi9lahWCjIhA/pyA0uSMmD5XteTEqBAwvZ2ZgrbPXpNR28/JDs7GHCOzJt3m3jIIOnB
	Gcag==
X-Gm-Message-State: APjAAAXAVO8m/2Si8WVjLACyQvRwd6jswZpBzUjqLGZEFKHxsL28c/3N
	xRVSlOJ5rpNnBUISmwxLLsxWGRVmPSU=
X-Google-Smtp-Source: APXvYqynFgyA+h3HzKn3f5gLzAGAFEu/QldMSdcJHyPC4iJF5nQHhF0tplLeoXYue3fc+Ee8IW/n4w==
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr88675344wme.9.1564136521589; 
	Fri, 26 Jul 2019 03:22:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d16sm44786380wrv.55.2019.07.26.03.22.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 03:22:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 11:21:58 +0100
Message-Id: <20190726102158.19164-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3] libical: upgrade to 3.0.5
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
X-List-Received-Date: Fri, 26 Jul 2019 10:22:01 -0000
Content-Transfer-Encoding: 8bit

Add PACKAGECONFIG options for ICU (enabled by default) and BDB (disabled by
default).

Note that this upgrade includes some API breakage.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ibical.pc.in-fix-iculibs-remove-full.patch | 44 -------------------
 meta/recipes-support/libical/libical_2.0.0.bb | 28 ------------
 meta/recipes-support/libical/libical_3.0.5.bb | 35 +++++++++++++++
 3 files changed, 35 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
 delete mode 100644 meta/recipes-support/libical/libical_2.0.0.bb
 create mode 100644 meta/recipes-support/libical/libical_3.0.5.bb

diff --git a/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch b/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
deleted file mode 100644
index 6db75f5086c..00000000000
--- a/meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1a41069c0dc054e59cd76fc3d8cf7cc2a78b5e8d Mon Sep 17 00:00:00 2001
-From: Allen Winter <allen.winter@kdab.com>
-Date: Sat, 3 Sep 2016 16:56:29 -0400
-Subject: [PATCH] CMakeLists.txt, libical.pc.in - fix iculibs (remove full path) ISSUE: 227
-
-Upstream-Status: Backport
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-----
-diff -Naur libical-2.0.0-orig/CMakeLists.txt libical-2.0.0/CMakeLists.txt
---- libical-2.0.0-orig/CMakeLists.txt	2016-09-08 18:05:06.166049345 +0300
-+++ libical-2.0.0/CMakeLists.txt	2016-09-08 18:05:45.201561334 +0300
-@@ -128,6 +128,7 @@
- #  RSCALE info at http://tools.ietf.org/html/rfc7529
- find_package(ICU)
- if(ICU_FOUND)
-+  set(ICUUC_LIBS "-licuuc") #for libical.pc
-   set(HAVE_LIBICU 1)
-   if(ICU_MAJOR_VERSION VERSION_GREATER 50)
-     set(HAVE_ICU_DANGI TRUE)
-@@ -137,6 +138,7 @@
- endif()
- if(ICU_I18N_FOUND)
-   set(HAVE_LIBICU_I18N 1)
-+  set(ICUI18N_LIBS "-licui18n") #for libical.pc
- endif()
- 
- # MSVC specific definitions
-diff -Naur libical-2.0.0-orig/libical.pc.in libical-2.0.0/libical.pc.in
---- libical-2.0.0-orig/libical.pc.in	2015-12-28 23:44:53.000000000 +0200
-+++ libical-2.0.0/libical.pc.in	2016-09-08 18:09:12.991963597 +0300
-@@ -3,10 +3,10 @@
- libdir=@libdir@
- includedir=@includedir@
- threadslib=@PTHREAD_LIBS@
--iculib=@ICU_LIBRARIES@ @ICU_I18N_LIBRARIES@
-+iculibs=@ICUUC_LIBS@ @ICUI18N_LIBS@
- 
- Name: libical
- Description: An implementation of basic iCAL protocols
- Version: @VERSION@
--Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib} ${iculib}
-+Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib} ${iculibs}
- Cflags: -I${includedir}
diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
deleted file mode 100644
index 7dffdcfb013..00000000000
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
-HOMEPAGE = "https://github.com/libical/libical"
-BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPLv2.1 | MPL-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
-                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
-SECTION = "libs"
-
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch \
-           "
-DEPENDS = "icu"
-
-SRC_URI[md5sum] = "6bf8e5f5a3ba88baf390d0134e05d76e"
-SRC_URI[sha256sum] = "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf21456da"
-UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
-
-inherit cmake pkgconfig
-
-# No need to use perl-native, the host perl is sufficient.
-EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
-
-do_install_append_class-target () {
-    # Remove build host references
-    sed -i \
-       -e 's,${STAGING_LIBDIR},${libdir},g' \
-       ${D}${libdir}/cmake/LibIcal/LibIcalTargets-noconfig.cmake
-}
diff --git a/meta/recipes-support/libical/libical_3.0.5.bb b/meta/recipes-support/libical/libical_3.0.5.bb
new file mode 100644
index 00000000000..3832b20bf11
--- /dev/null
+++ b/meta/recipes-support/libical/libical_3.0.5.bb
@@ -0,0 +1,35 @@
+SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+HOMEPAGE = "https://github.com/libical/libical"
+BUGTRACKER = "https://github.com/libical/libical/issues"
+LICENSE = "LGPLv2.1 | MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
+                    file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
+                    file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
+SECTION = "libs"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "9be4e8a1739a9c27e06aa8ce66b8cb34"
+SRC_URI[sha256sum] = "7ad550c8c49c9b9983658e3ab3e68b1eee2439ec17b169a6b1e6ecb5274e78e6"
+UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ??= "icu"
+PACKAGECONFIG[bdb] = ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=True,db"
+# ICU is used for RSCALE (RFC7529) support
+PACKAGECONFIG[icu] = ",-DCMAKE_DISABLE_FIND_PACKAGE_ICU=True,icu"
+
+# No need to use perl-native, the host perl is sufficient.
+EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
+
+# The glib library can't be cross-compiled, disable for now.
+# https://github.com/libical/libical/issues/394
+EXTRA_OECMAKE += "-DICAL_GLIB=false"
+
+do_install_append_class-target () {
+    # Remove build host references
+    sed -i \
+       -e 's,${STAGING_LIBDIR},${libdir},g' \
+       ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake
+}
-- 
2.20.1


