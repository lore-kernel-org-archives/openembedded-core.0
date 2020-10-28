Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.3863.1603919185561333704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wz/IP6h2;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id p93so942651edd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NpwZersZG7IYxR2hPiL/cmKU26l7eYTUGUQuRJJ6rcE=;
        b=Wz/IP6h2u+ud9rfS2yOPZMpbQFpXpcx3Vi6PhmYoxN1VEJeLgXKD7WszZkfjel8ov5
         /k+9Wp9LRJP6ShpGQOvF7zptZWHvECTghYqdc6bRu9kfmV31qmRBjnhZsMhui+l44er0
         0keR0vjV26q2FikiFsiNhnmfeeYSfG12RhCFovDGy5v7sQQVF/Vy6vMH58zRK24HPwf4
         N9MrLZYcC3dfFLgaPBnYjVWDOZlunNtx6naWLdLp9010vgleY1RqTWjE6jJniuJsxf4w
         KxEEHQfw+m3vkIKwtc5ii88xlrwseJRYVcVynleFNLKbwAsiD6M3TxioqD95JGWZZshS
         T4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NpwZersZG7IYxR2hPiL/cmKU26l7eYTUGUQuRJJ6rcE=;
        b=uRfw7ywlKEVyXFPbxizxIloKh2FSxL5RvHkx+Whv6STqe2C6A1rETUjywSwwg6S0qL
         O5oRBVx6/LJFK510z/36BHFV0fS/GfnZon/ApBrCOzSDY3V56vdWOm06/GP8wb19W4Wo
         cWDD4qElzlBTX/hI7JPj3Mrzo+76yrHwGF7HpP/QDQclQpgjZXTN1R2/GhK+B488Q60D
         aDcBsNTvLpTA5T+W8hTK06/fxNBJ0y5tgVHmB+a4ebNkrL+A9mSmKuccuABIHnoK3sbQ
         MvBeqSlzrD1u81PWmoIgQSIWRtBRcz4fVMqqBxeRq4AEpJjGa4ZcCodbdhNk78T2v3VP
         o+7Q==
X-Gm-Message-State: AOAM533+9aY0qmRdCLSrC8u+4sEpkkTDo1hozx0bVnKV9SBjDci7BoUm
	wYVMs/bkmh5DShqnOAEWzQ7fNNU9QvixlA==
X-Google-Smtp-Source: ABdhPJwHCHb1VP43XB3zGdxrxylUVRhzccMaD+3i+hXXDwtmplhKn4GU+KESKUsVvBBPu+lRBxjb1A==
X-Received: by 2002:aa7:c4c2:: with SMTP id p2mr145078edr.371.1603919183792;
        Wed, 28 Oct 2020 14:06:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/33] webkitgtk: update 2.28.4 -> 2.30.1
Date: Wed, 28 Oct 2020 22:05:45 +0100
Message-Id: <20201028210558.21070-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch and
cross-compile.patch as upstream has removed the code.

Rebase 0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch.

Add a systemd config option, subject to systemd in DISTRO_FEATURES.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch | 25 ++++---
 ...-drop-the-hardcoded-introspection-gt.patch | 35 ----------
 ...build-errors-due-to-WWc-11-narrowing.patch | 66 -------------------
 .../webkit/webkitgtk/cross-compile.patch      | 23 -------
 ...ebkitgtk_2.28.4.bb => webkitgtk_2.30.1.bb} |  8 +--
 5 files changed, 14 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.4.bb => webkitgtk_2.30.1.bb} (93%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index 268118b5ca..ca7b1bca48 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From 8ee7806ad2d5606967f7a1529a113fb9d1a386de Mon Sep 17 00:00:00 2001
+From b145ab4273c59f4f908cdaff9e267241bd970e93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -13,26 +13,26 @@ missing atomic primitives.
 
 Upstream-Status: Submitted [https://trac.webkit.org/changeset/231843/webkit]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- Source/cmake/OptionsGTK.cmake     | 2 ++
+ Source/cmake/OptionsGTK.cmake     | 1 +
  Source/cmake/OptionsJSCOnly.cmake | 1 +
- 2 files changed, 3 insertions(+)
+ 2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index d3beef19..6a92856f 100644
+index 8732e935..9b4fbae7 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
-@@ -17,6 +17,8 @@ set(WEBKITGTK_HEADER_INSTALL_DIR "${CMAKE_INSTALL_INCLUDEDIR}/webkitgtk-${WEBKIT
- set(INTROSPECTION_INSTALL_GIRDIR "${CMAKE_INSTALL_FULL_DATADIR}/gir-1.0")
- set(INTROSPECTION_INSTALL_TYPELIBDIR "${LIB_INSTALL_DIR}/girepository-1.0")
- 
+@@ -32,6 +32,7 @@ set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
+ if (USER_AGENT_BRANDING)
+     add_definitions(-DUSER_AGENT_BRANDING="${USER_AGENT_BRANDING}")
+ endif ()
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
-+
+ 
  find_package(Cairo 1.14.0 REQUIRED)
  find_package(Fontconfig 2.8.0 REQUIRED)
- find_package(Freetype 2.4.2 REQUIRED)
 diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
-index b2e87418..326ade23 100644
+index 316c6240..2f712602 100644
 --- a/Source/cmake/OptionsJSCOnly.cmake
 +++ b/Source/cmake/OptionsJSCOnly.cmake
 @@ -1,3 +1,4 @@
@@ -40,6 +40,3 @@ index b2e87418..326ade23 100644
  find_package(Threads REQUIRED)
  
  if (MSVC)
--- 
-2.25.0
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
deleted file mode 100644
index e8d1d8c341..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bed4cf4aaa6aad4172ec9942e9039fb8e1ef68a4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 29 Feb 2016 18:13:39 +0200
-Subject: [PATCH] OptionsGTK.cmake: drop the hardcoded introspection/gtkdoc
- disabling when cross-compiling
-
-This was not possible to override from the command line and in OpenEmbedded
-(one of the most prominent cross-compilation frameworks) introspection does work fine,
-through the use of qemu target emulation.
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Upstream-Status: Pending
-
----
- Source/cmake/OptionsGTK.cmake | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index 661b40e..404441b 100644
---- a/Source/cmake/OptionsGTK.cmake
-+++ b/Source/cmake/OptionsGTK.cmake
-@@ -352,12 +352,6 @@ if (ENABLED_COMPILER_SANITIZERS)
-     set(ENABLE_INTROSPECTION OFF)
- endif ()
- 
--# Override the cached variables, gtk-doc and gobject-introspection do not really work when cross-building.
--if (CMAKE_CROSSCOMPILING)
--    set(ENABLE_GTKDOC OFF)
--    set(ENABLE_INTROSPECTION OFF)
--endif ()
--
- # Override the cached variable, gtk-doc does not really work when building on Mac.
- if (APPLE)
-     set(ENABLE_GTKDOC OFF)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch b/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
deleted file mode 100644
index d8bb8efb88..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From cb929f59b527fe890376e47613dfe1434a320bc0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 Aug 2020 15:44:48 -0700
-Subject: [PATCH] [clang 11] fix build errors due to -WWc++11-narrowing
-
-https://bugs.webkit.org/show_bug.cgi?id=211193
-
-Reviewed by Adrian Perez de Castro.
-
-Fixes the following errors,
-
-Source/WebCore/html/MediaElementSession.cpp:1059:9: error: type 'WebCore::RenderMedia *' cannot be narrowed to 'bool' in initializer list [-Wc++11-narrowing]
-m_element.renderer(),
-^~~~~~~~~~~~~~~~~~~~
-
-Source/WebCore/style/StyleResolver.cpp:106:55: error: type 'const char [4]' cannot be narrowed to 'bool' in initializer list [-Wc++11-narrowing]
-m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
-                                              ^~~~~
-Source/WebCore/style/StyleResolver.cpp:106:55: note: insert an explicit cast to silence this issue
-m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
-                                              ^~~~~
-                                              static_cast<bool>( )
-
-* html/HTMLMediaElement.h:
-(WebCore::HTMLMediaElement::hasRenderer const):
-MediaElementSession was implicitly casting a pointer to a bool,
-which is not allowed with modern Clang checks. Add a helper method
-to encapsulate the now required static_cast<bool>.
-* html/MediaElementSession.cpp: Use the new helper method to see
-if the HTMLMediaElement has an associated renderer.
-(WebCore::MediaElementSession::updateMediaUsageIfChanged):
-* style/StyleResolver.cpp: This was calling MediaQueryEvaluator {
-"all" }; and seemingly expecting to cast a const char[] to a bool,
-or maybe String? It's confusing because of the MediaQueryEvaluator
-API. If it was implicitly converting to bool then that could be
-unintentional. Such casts are not allowed either now. The
-MediaQueryEvaluator's default constructor says it returns true for
-"all", which appears to be the original intent of this call, so I
-replaced it with that.
-(WebCore::Style::Resolver::Resolver):
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@260951 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/c3cf651016e4cdcb4350598d4a586821071f91bf.patch]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/style/StyleResolver.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/style/StyleResolver.cpp b/Source/WebCore/style/StyleResolver.cpp
-index 8bf371a0..34580ddb 100644
---- a/Source/WebCore/style/StyleResolver.cpp
-+++ b/Source/WebCore/style/StyleResolver.cpp
-@@ -107,7 +107,7 @@ Resolver::Resolver(Document& document)
-     if (view)
-         m_mediaQueryEvaluator = MediaQueryEvaluator { view->mediaType() };
-     else
--        m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
-+        m_mediaQueryEvaluator = MediaQueryEvaluator { };
- 
-     if (root) {
-         m_rootDefaultStyle = styleForElement(*root, m_document.renderStyle(), nullptr, RuleMatchingBehavior::MatchOnlyUserAgentRules).renderStyle;
--- 
-2.28.0
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch b/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
deleted file mode 100644
index 4d1de72851..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Disable the tests meant to run when compiling natively
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
-===================================================================
---- webkitgtk-2.14.5.orig/Source/cmake/OptionsCommon.cmake
-+++ webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
-@@ -67,8 +67,11 @@ endif ()
- # Detect Cortex-A53 core if CPU is ARM64 and OS is Linux.
- # Query /proc/cpuinfo for each available core and check reported CPU part number: 0xd03 signals Cortex-A53.
- # (see Main ID Register in ARM Cortex-A53 MPCore Processor Technical Reference Manual)
--set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
--if (WTF_CPU_ARM64 AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
-+if( NOT WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
-+    set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
-+endif(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
-+
-+if (WTF_CPU_ARM64 AND NOT CMAKE_CROSSCOMPILING AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
-     execute_process(COMMAND nproc OUTPUT_VARIABLE PROC_COUNT)
-     math(EXPR PROC_MAX ${PROC_COUNT}-1)
-     foreach (PROC_ID RANGE ${PROC_MAX})
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.1.bb
similarity index 93%
rename from meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.1.bb
index 8ebb3709a8..90f653e6b4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.1.bb
@@ -12,16 +12,13 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
-           file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
-           file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
-           file://0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch \
            "
-SRC_URI[sha256sum] = "821952e8c9303ed752f1fb1d4283f612c25249d00d705d2b79c2db1bc49c9464"
+SRC_URI[sha256sum] = "17c59dfdadb7377192e9b59bc56c8a029c9fad4f38ed732b652bf33d0bd5d6b1"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
@@ -38,7 +35,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libgcrypt \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
                    enchant \
@@ -56,6 +53,7 @@ PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
 PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
+PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
-- 
2.29.0

