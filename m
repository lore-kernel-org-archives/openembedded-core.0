Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 841E3780FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 13:35:45 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id v188so7342515qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 05:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=aChOyQ0Iu7Dj0PSKjweEIr4XQxhtevL4pfHuBeuEmWc=;
	b=eMLeFAq3gwOteeBHy8lN5M0wvSnwd+Mq1K9p73j6hZpfQb9hkiqx4tvU2e+hClXjCA
	E0B1bOWa0PKHl5mCCvAxmTzQGbcrfPfPKKNZ0bb4zdDdUsBOVUHhH2moTSVPZQvrYJA4
	1JxIBhslbGD9oG801vDEuU/WOlM1Dttkor6acBzgde98NhP6wsqqJDwPrin962ezEv2V
	w01HGUZVs1XhUveImsDMnbexZBwe6QJI7he8GJW2zTCyf53cP+Ie1m/o54flQW9LxuAx
	l8C+PyBUo3tz2mjnJhVY9GiN9d0YRQ9H4nlEkLGQxc2uZRM4cS7YhSqbkaN9FZ7n06uE
	RMIw==
X-Gm-Message-State: AKGB3mIojswNuuwDO8HOIHozSdwTf2WRcCpD5Oywwic670ICd4ALdXMy
	7FAMrHfEeL02qslYp+WUXqA76Q==
X-Google-Smtp-Source: ACJfBos5CQTKlG3gWGgbT2dnwxVBkrTL7W9Mi0yew5J1dPlWiwLdHeGI4DdY/LudEFUHUis7BrEdzA==
X-Received: by 10.55.4.143 with SMTP id 137mr19561360qke.28.1513949744021;
	Fri, 22 Dec 2017 05:35:44 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r124sm14291310qkf.16.2017.12.22.05.35.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Dec 2017 05:35:43 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 22 Dec 2017 11:35:36 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Dec 2017 11:35:35 -0200
Message-Id: <20171222133535.31170-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.3.1 release
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
X-List-Received-Date: Fri, 22 Dec 2017 13:35:45 -0000

The 17.3.1 release, published in December 21, 2017, is the first 17.3
stable release for use. It fixes a number of issues since 17.3.0
release.

The release notes can be seen at:

 - 17.3.0: https://www.mesa3d.org/relnotes/17.3.0.html
 - 17.3.1: https://www.mesa3d.org/relnotes/17.3.1.html

This commit has reworked few patches, to apply to the new source, and
dropped the backported ones.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../0001-configure.ac-Always-check-for-expat.patch | 51 ----------------------
 .../mesa/files/llvm-config-version.patch           | 39 ++++++++++-------
 .../files/replace_glibc_check_with_linux.patch     | 12 ++---
 .../recipes-graphics/mesa/files/vulkan-mkdir.patch | 37 ----------------
 .../mesa/{mesa-gl_17.2.6.bb => mesa-gl_17.3.1.bb}  |  0
 .../mesa/{mesa_17.2.6.bb => mesa_17.3.1.bb}        |  6 +--
 6 files changed, 33 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.2.6.bb => mesa-gl_17.3.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.2.6.bb => mesa_17.3.1.bb} (79%)

diff --git a/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch b/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
deleted file mode 100644
index 4753c49d22..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1f7d752193f02d15d5923cee992e8f46d4c6df1b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 28 Aug 2017 13:51:49 +0300
-Subject: [PATCH] configure.ac: Always check for expat
-
-expat was not checked if dri was not built leading to build failure
-in vulkan driver: backport a fix (a combination of multiple commits
-that should end up in 17.3).
-
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 15 ++++++---------
- 1 file changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index fd346c8aa2..662faecefa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1777,6 +1777,12 @@ if test "x$with_dri_drivers" = xno; then
-     with_dri_drivers=''
- fi
- 
-+# Check for expat
-+PKG_CHECK_MODULES([EXPAT], [expat])
-+PKG_CHECK_MODULES([EXPAT], [expat],,
-+    [PKG_CHECK_MODULES([EXPAT], [expat21])]
-+)
-+
- dnl If $with_dri_drivers is yes, drivers will be added through
- dnl platform checks. Set DEFINES and LIB_DEPS
- if test "x$enable_dri" = xyes; then
-@@ -1810,15 +1816,6 @@ if test "x$enable_dri" = xyes; then
-         with_dri_drivers="i915 i965 nouveau r200 radeon swrast"
-     fi
- 
--    # Check for expat
--    PKG_CHECK_MODULES([EXPAT], [expat], [],
--        # expat version 2.0 and earlier do not provide expat.pc
--        [AC_CHECK_HEADER([expat.h],[],
--                         [AC_MSG_ERROR([Expat headers required for DRI not found])])
--         AC_CHECK_LIB([expat],[XML_ParserCreate],[],
--                     [AC_MSG_ERROR([Expat library required for DRI not found])])
--         EXPAT_LIBS="-lexpat"])
--
-     # put all the necessary libs together
-     DRI_LIB_DEPS="$DRI_LIB_DEPS $SELINUX_LIBS $LIBDRM_LIBS $EXPAT_LIBS -lm $PTHREAD_LIBS $DLOPEN_LIBS"
- fi
--- 
-2.14.1
-
diff --git a/meta/recipes-graphics/mesa/files/llvm-config-version.patch b/meta/recipes-graphics/mesa/files/llvm-config-version.patch
index aa33a1e915..fd79991aab 100644
--- a/meta/recipes-graphics/mesa/files/llvm-config-version.patch
+++ b/meta/recipes-graphics/mesa/files/llvm-config-version.patch
@@ -1,18 +1,24 @@
-When building llvm from git or svn it embeds the svn/git revision into internal version string
+From: Otavio Salvador <otavio@ossystems.com.br>
+Subject: [PATCH] Properly get LLVM version when using LLVM Git releases
 
-$ /mnt/a/oe/build/tmp/work/corei7-64-bec-linux/mesa/2_17.1.5-r0/recipe-sysroot/usr/lib/llvm5.0/llvm-config-host --version
+$ llvm-config-host --version
 5.0.0git-9a5c333388c
 
-We need to ignore everything after 5.0.0 which is what the cut cmd is doing
+We need to ignore everything after 5.0.0 which is what the cut cmd is
+doing
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: mesa-17.1.5/configure.ac
-===================================================================
---- mesa-17.1.5.orig/configure.ac
-+++ mesa-17.1.5/configure.ac
-@@ -967,7 +967,7 @@ strip_unwanted_llvm_flags() {
+diff --git a/configure.ac b/configure.ac
+index a02173f244..b107f04c2e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -995,7 +995,7 @@ strip_unwanted_llvm_flags() {
  
  llvm_set_environment_variables() {
      if test "x$LLVM_CONFIG" != xno; then
@@ -21,12 +27,15 @@ Index: mesa-17.1.5/configure.ac
          LLVM_CPPFLAGS=`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppflags"`
          LLVM_INCLUDEDIR=`$LLVM_CONFIG --includedir`
          LLVM_LIBDIR=`$LLVM_CONFIG --libdir`
-@@ -2560,7 +2560,7 @@ if test "x$enable_llvm" = xyes; then
+@@ -2644,7 +2644,7 @@ detect_old_buggy_llvm() {
+     dnl ourselves.
      dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
-     if test "x$enable_llvm_shared_libs" = xyes; then
-         dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
--        LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
-+        LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version|cut -c1-5`
-         AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
+     dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
+-    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
++    LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version | cut -c1-5`
+     AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
  
-         if test "x$llvm_have_one_so" = xyes; then
+     if test "x$llvm_have_one_so" = xyes; then
+-- 
+2.15.1
+
diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
index 0280ee8599..98f910f89f 100644
--- a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
+++ b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
@@ -1,26 +1,28 @@
-endianness check is OS wide and not specific to libc
+From: Otavio Salvador <otavio@ossystems.com.br>
+Subject: [PATCH] endianness check is OS wide and not specific to libc
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 ---
  src/util/u_endian.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/util/u_endian.h b/src/util/u_endian.h
-index b9d563d..2d5eab9 100644
+index 9e09f80181..3148033fae 100644
 --- a/src/util/u_endian.h
 +++ b/src/util/u_endian.h
 @@ -27,7 +27,7 @@
  #ifndef U_ENDIAN_H
  #define U_ENDIAN_H
  
--#if defined(__GLIBC__) || defined(ANDROID)
+-#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__)
 +#if defined(__linux__)
  #include <endian.h>
  
  #if __BYTE_ORDER == __LITTLE_ENDIAN
 -- 
-2.1.4
+2.15.1
 
diff --git a/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch b/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
deleted file mode 100644
index 15ee5eeb14..0000000000
--- a/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From c78979fd95a1c4f732f7e6edf0f32c524e5955b8 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 12 Jul 2017 17:10:07 +0100
-Subject: [PATCH] src/intel/Makefile.vulkan.am: create target directories when
- required
-
-In out-of-tree builds src/intel/vulkan won't exist, so always create it before
-writing into it.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- src/intel/Makefile.vulkan.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/intel/Makefile.vulkan.am b/src/intel/Makefile.vulkan.am
-index 3857a5dc62..26e9cd410c 100644
---- a/src/intel/Makefile.vulkan.am
-+++ b/src/intel/Makefile.vulkan.am
-@@ -44,11 +44,13 @@ EXTRA_DIST += \
- 	vulkan/TODO
- 
- vulkan/dev_icd.json : vulkan/dev_icd.json.in
-+	$(MKDIR_GEN)
- 	$(AM_V_GEN) $(SED) \
- 		-e "s#@build_libdir@#${abs_top_builddir}/${LIB_DIR}#" \
- 		< $(srcdir)/vulkan/dev_icd.json.in > $@
- 
- vulkan/intel_icd.@host_cpu@.json : vulkan/intel_icd.json.in
-+	$(MKDIR_GEN)
- 	$(AM_V_GEN) $(SED) \
- 		-e "s#@install_libdir@#${libdir}#" \
- 		< $(srcdir)/vulkan/intel_icd.json.in > $@
--- 
-2.11.0
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.2.6.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.2.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.2.6.bb b/meta/recipes-graphics/mesa/mesa_17.3.1.bb
similarity index 79%
rename from meta/recipes-graphics/mesa/mesa_17.2.6.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.1.bb
index fc3ac75f7e..4c0a61c3ea 100644
--- a/meta/recipes-graphics/mesa/mesa_17.2.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.1.bb
@@ -5,15 +5,13 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://disable-asm-on-non-gcc.patch \
            file://0001-Use-wayland-scanner-in-the-path.patch \
            file://0002-hardware-gloat.patch \
-           file://vulkan-mkdir.patch \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
-           file://0001-configure.ac-Always-check-for-expat.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "862f2b7e2a08554570b192a89f723b6f"
-SRC_URI[sha256sum] = "6ad85224620330be26ab68c8fc78381b12b38b610ade2db8716b38faaa8f30de"
+SRC_URI[md5sum] = "b4b021279ea21e1eb8a1369afa6f19a0"
+SRC_URI[sha256sum] = "9ae607e0998a586fb2c866cfc8e45e6f52d1c56cb1b41288253ea83eada824c1"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.15.1


