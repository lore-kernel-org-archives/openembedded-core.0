Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 126C67EF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 09:54:25 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z1so46217250wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n1GovUF1a/jSFHyfQxDSUr+8ljzD5MnzZVsVXTIVxmM=;
	b=Hx/TT4ugZwu83LVMlyTdrInGNnHCv6Adu0xJFjJX4zbI0ozAPMyqRRHsn4FX98pDfn
	tPcJlTidBQxE78L6sjO60TjkgJk1OpJxiJt2jxA1GcUSvXn8Mdcg7T1PPq/xl1lGJcec
	fUY7i3b+l9oY/y5Sn/VOiVHi1K1niLrSu7m3ThvP2912j8kMDujLBLJXJHaDzzsUqZ9u
	1PEjbRitHObqHwyCBcKLgcHbpWW1F71D2hI+rZGZpyGA7SYA1PwGwebzpCNiyWjUpKDL
	Xz2dF+B7P86Kqd3K+HKx934oMLItur7bLoRDxOg40c7BOD3TB0xzL7WXQHi/CD4Pl34G
	f8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n1GovUF1a/jSFHyfQxDSUr+8ljzD5MnzZVsVXTIVxmM=;
	b=IMhY1CdWUcNXs+w0GMlD+Eren7Pte45sqjrRNptYPvZzqO7Us20G2cZAVILOPnTpyV
	oxZEXsp6BT8sXLIkTECx9JkSXhKNVSeIjnrGNu1LJJMnKRVMN16DLoXm09B9LY62uxnJ
	wlke6zElEPUBGIyuhd5vJiQ5aMuzA4h80TwuvaI6C+4Yxa+nzn/mFyDjEHEMH6UCw0kY
	NyYCRkOFqOSOSRwaZZUHC8kDzE7QxEJf1OPkdB9nYkZsWhz5yIoGmhUmaet+wE0YMxFj
	apfq/ndoB5FezJS9TAR/tQcTTT9gmiNlJVaYSo/BjrhhUUCMKxQMZqoyPozC/TsyMzEE
	tpOQ==
X-Gm-Message-State: APjAAAUhv78hjXfEuOYlv7VsWlJGXMzz8EZXXohJSvsqFPB/PADUfFn+
	WjzsulkT4n237msEmjEq1yUOjjwIMFg=
X-Google-Smtp-Source: APXvYqxrhj9y58SNemNO0o7y3rAAeXOi1MTk0dat0ZKnrAiPApe1XhbBFfn1CXMq3b0LPC+Y3QICrg==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr89862767wrr.147.1563962066509; 
	Wed, 24 Jul 2019 02:54:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 2sm58850020wrn.29.2019.07.24.02.54.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 02:54:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 10:54:23 +0100
Message-Id: <20190724095423.23610-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] libical: upgrade to 3.0.5
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
X-List-Received-Date: Wed, 24 Jul 2019 09:54:26 -0000
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
index 7dffdcfb013..a4238f22633 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_3.0.5.bb
@@ -1,18 +1,18 @@
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPLv2.1 | MPL-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
-                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+LICENSE = "LGPLv2.1 | MPL-2.0"
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


