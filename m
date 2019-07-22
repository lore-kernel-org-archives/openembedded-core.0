Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E87527D69D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 14:48:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so28956263wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cpGDrHko4kgy9KW9kf6m80hlY0Avks9/QYOx6yE4UlU=;
	b=AnHYK6jxryuK7+Qa8o+64/1aY3hGkpROrUm1dqhOppy1Ar4vOZQZl8At9VRCu2sE9p
	km2C9G5z+oiDh8RFz2ohXfCOiCIWZdVz3JY+sVcbkJjy3g+ihHk021VLoHe2FTDIgnFt
	s7o6MLMBUET+u7Be9OW9a+tm8nVQ6psviSuGQEC9v4P1gKEqVDCX8zm3ry2tiNP9RyRn
	Gylfl+YDL+6/tgrSBrCJLsV79p/3LdKeZDECWkzxm5MJlF+9ytM9UXLqHtG48XQqKPhl
	hEY3Rn6bB/79uoHpYiXV7dWNDOpAP3BB9a172WqztS1p/8goq2K+UJQ/32uNiPkZ1QgW
	P/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cpGDrHko4kgy9KW9kf6m80hlY0Avks9/QYOx6yE4UlU=;
	b=C8rV3iXljKAX7ng/fAVa1OTZY5ygKcm3RV6M+Lv13JKPVX+WNV59ez/TasTvJ2XFUg
	1sM6C/0dm627C7qJLQmr9Kf7M4Phm0PxavQ05thCXck7YqtApTswX22NM/d/Eu2gyb+a
	cGLpbXDNGXTpe4SVTXOMqNJgHrUThKmw9ml/buLcQ69/GcAkXotj+YTHSqBE9RKFH5JV
	ZmIKAWgAHoBsCiZG7xX+FjhxA0EBm6Y0THP+3fEJx/OvIoDigQefsgExchuABhY1duJE
	wJJvozWJP5PSwFYz18qhubCiPiKlrCwTdb9hgwtyiTjwX6xf0yCmUtcA1FDaO5n29Mco
	e2Hw==
X-Gm-Message-State: APjAAAWG49g3Q8kC6dOSu15AhzNkBcOhmHvMl+mHo7b4Akzk367waDrP
	2LQvlle94dc+3dTSVF4sPlxPpR46YDA=
X-Google-Smtp-Source: APXvYqyOfHCXiEfBtokmriiP69CLZD5xmA9DICpekQlv7a5dEbscybp9wRs4/a/0j6eLEEYXgnDsKw==
X-Received: by 2002:a1c:2302:: with SMTP id j2mr62087336wmj.174.1563806893179; 
	Mon, 22 Jul 2019 07:48:13 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g17sm28626768wrm.7.2019.07.22.07.48.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 07:48:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 15:48:09 +0100
Message-Id: <20190722144809.14972-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: "Maxin B . John" <maxin.john@intel.com>
Subject: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Mon, 22 Jul 2019 14:48:13 -0000
Content-Transfer-Encoding: 8bit

Note that this upgrade includes some API breakage.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ibical.pc.in-fix-iculibs-remove-full.patch | 44 -------------------
 .../{libical_2.0.0.bb => libical_3.0.5.bb}    | 20 +++++----
 2 files changed, 12 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
 rename meta/recipes-support/libical/{libical_2.0.0.bb => libical_3.0.5.bb} (53%)

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
diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_3.0.5.bb
similarity index 53%
rename from meta/recipes-support/libical/libical_2.0.0.bb
rename to meta/recipes-support/libical/libical_3.0.5.bb
index 7dffdcfb013..6489ccb9323 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_3.0.5.bb
@@ -1,18 +1,18 @@
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPLv2.1 | MPL-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
-                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+LICENSE = "LGPLv2.1 | MPL-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
+                    file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
+                    file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch \
-           "
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+
 DEPENDS = "icu"
 
-SRC_URI[md5sum] = "6bf8e5f5a3ba88baf390d0134e05d76e"
-SRC_URI[sha256sum] = "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf21456da"
+SRC_URI[md5sum] = "9be4e8a1739a9c27e06aa8ce66b8cb34"
+SRC_URI[sha256sum] = "7ad550c8c49c9b9983658e3ab3e68b1eee2439ec17b169a6b1e6ecb5274e78e6"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
@@ -20,6 +20,10 @@ inherit cmake pkgconfig
 # No need to use perl-native, the host perl is sufficient.
 EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
 
+# The glib library can't be cross-compiled, disable for now.
+# https://github.com/libical/libical/issues/394
+EXTRA_OECMAKE += "-DICAL_GLIB=false"
+
 do_install_append_class-target () {
     # Remove build host references
     sed -i \
-- 
2.20.1


