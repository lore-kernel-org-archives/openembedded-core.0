Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 876277604B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 11:50:56 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id e18-v6so2438536wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UeUg0Z5RsCtt0HsAimnoAemtcIhMXIFQGL8bbNoneDQ=;
	b=c/LeV/DAW7m9i2S/IFKgL19hlZpDYvYCTabM8PhxR+0Z6U8wDc3yewPHNwgvMXXe5T
	lcAYbGKJa+AQHH/PTSyAY2Ppa6SW9tCEjR4W8ttxe0+Rx4rjtwsKHBPz64mJ3EDhydFk
	ZJoR7vVbdeDwL+G35+0mDvi4lquTZzZArqAmMp6ryZwQCc+NyuqKixfxn2RcQI2py0Uo
	HYjXnNKk5g/WLI1PhRliZOGJbWBoSQa3UHwDYGEVeFOINb9Pj/FXRWU2zxYkMIDgTXN8
	9BxhU9fEOmRSsRz7+f0Nz/7S4rr2HDN0tuMjoWg5LrsUBumobmmaPi1o+Jv/MaHLB/3+
	muIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UeUg0Z5RsCtt0HsAimnoAemtcIhMXIFQGL8bbNoneDQ=;
	b=hZDbPXAHxk+CW3YXNxE9CJoMC1Qiut21lLnE+6il+PELhFbtowBNKnZu79spyKWbh3
	8v/hmN9ABB7fxxa8Agy87P/IoB3+u7evda25sDZh3olRC34kXRWtt8V0bsc9Ou3e9Nfl
	i7T7HRvD0AEHj1+8lv2A0qTwdgTbDTtQ6fXShht6HQulMraRRLJEFW+tezvqrHbpq7h9
	oyiBuUyOibyfUExSWzmI/ZGcQqaL51YejnQaAtizF5Nc7ECe44xN8vGQ3ukspgR/zdGJ
	/cJ4HC427LLBfMagJ4AKlY2spETsiNxylrsiJs6+zGfdM56nGljT2bfccEIZ3aMbfD4X
	YYtQ==
X-Gm-Message-State: APt69E1i58bIuUa1TVxjhLs7LJQIqcj3AmLB+EiRIMs4lZU4P8+hIh0d
	7yHuSt+P85prpdP7gqAnzzW0eeZa
X-Google-Smtp-Source: ADUXVKLZCCLllE6inaw8CvIrostAYkxf1J/petGc8xpd7KoDyf63UFDtQSKuWOAizulFLP0aNKZmVQ==
X-Received: by 2002:adf:ed52:: with SMTP id
	u18-v6mr3787191wro.262.1528890656894; 
	Wed, 13 Jun 2018 04:50:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e63-v6sm4177113wma.46.2018.06.13.04.50.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 04:50:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 12:50:53 +0100
Message-Id: <20180613115053.28394-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libdrm: port to Meson
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
X-List-Received-Date: Wed, 13 Jun 2018 11:50:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 53 ----------------------
 .../recipes-graphics/drm/libdrm/installtests.patch | 25 ----------
 meta/recipes-graphics/drm/libdrm_2.4.92.bb         | 23 ++++------
 3 files changed, 9 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm/installtests.patch

diff --git a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
deleted file mode 100644
index 40bebc0f50c..00000000000
--- a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e6bd4205b0b546afe991ae6f72256645f4404ad4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 5 Sep 2016 14:41:37 +0300
-Subject: [PATCH libdrm] configure.ac: Allow explicit enabling of cunit tests
-
-Add --with-cunit to make it easier to do reproducible builds. Default
-is still to probe cunit and build opportunistically.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [mailing list]
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-Index: libdrm-2.4.91/configure.ac
-===================================================================
---- libdrm-2.4.91.orig/configure.ac
-+++ libdrm-2.4.91/configure.ac
-@@ -163,6 +163,12 @@ AC_ARG_ENABLE(install-test-programs,
- 		  [Install test programs (default: no)]),
- 		  [INSTALL_TESTS=$enableval], [INSTALL_TESTS=no])
- 
-+AC_ARG_WITH([cunit],
-+            [AS_HELP_STRING([--with-cunit],
-+                            [Build tests that use cunit (default: auto)])],
-+            [],
-+            [with_cunit=auto])
-+
- dnl ===========================================================================
- dnl check compiler flags
- AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
-@@ -411,7 +417,7 @@ else
- 	AC_DEFINE(HAVE_RADEON, 0)
- fi
- 
--if test "x$AMDGPU" != xno; then
-+if test "x$with_cunit" != xno -a "x$AMDGPU" != xno; then
- 	# Detect cunit library
- 	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
- 	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
-@@ -436,7 +442,11 @@ if test "x$AMDGPU" = xyes; then
- 	AC_DEFINE(HAVE_AMDGPU, 1, [Have amdgpu support])
- 
- 	if test "x$have_cunit" = "xno"; then
--		AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
-+		if test "x$with_cunit" = "xyes"; then
-+			AC_MSG_ERROR([Could not find cunit library but --with-cunit was given])
-+		elif test "x$with_cunit" = "xauto"; then
-+			AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
-+		fi
- 	fi
- else
- 	AC_DEFINE(HAVE_AMDGPU, 0)
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
deleted file mode 100644
index ec1fb0236e4..00000000000
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 5c6eb43c2f6e7f2ee7c25c92e42f4e4403fa0527 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 21 Feb 2017 14:37:52 +0200
-Subject: [PATCH] tests: also install test apps
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- tests/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0355a92..b4882cd 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -45,3 +45,4 @@ TESTS = \
- check_PROGRAMS = \
- 	$(TESTS) \
- 	drmdevice
-+bin_PROGRAMS = $(check_PROGRAMS)
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
index 2b3bf4f83d2..e77ac671e9d 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -10,24 +10,19 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs libpciaccess"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://installtests.patch \
-           file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
-          "
-
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f9b00d985f82d0be6ecc20c799acc89e"
 SRC_URI[sha256sum] = "e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa"
 
-inherit autotools pkgconfig manpages
+inherit meson pkgconfig manpages
+
+EXTRA_OEMESON = "-Dvalgrind=false \
+                 -Dcairo-tests=false \
+                 -Dinstall-test-programs=true \
+                 -Domap=true \
+                 -Detnaviv=true"
 
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --without-cunit \
-                 --enable-omap-experimental-api \
-                 --enable-etnaviv-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-valgrind \
-                "
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-- 
2.11.0


