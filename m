Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5D1C4707F
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.1090.1649350853194343853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Orjw6Y56;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l26so12210055ejx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QktOnDF3bFysADAMDcYrs/SxchSQ7Kda4yAb5tc6q8w=;
        b=Orjw6Y56HKwfOuQGXRIJVS0IVkyBAsh5jxirT+zfQcI7RqbbI24K8XtwA2Fncx0xMv
         h+WJwCmEPhBPXs/2Ml3cnNAHR7Q3DV1qVCkHjDoD7L9/28DsUcGdzkh81HD06n3s5TBS
         7LaRMLeT06ep/vbJ5dPKQqaBGuRqSfhKNdRBZMOKCa8cqWHsLx/OEhQg53DHroI33aKH
         UaU8P7sz9zL1FF18+JkT4H9dj7K2L4DFbasPZcuUhRAkhWWiiHFAMpPYVpcecz9rxLrU
         hGOsqhtHBnUjy2CtBvxSHOI5mOX0iCDGDQVYgGmK0koLzdxCoEp/VfVIkc0av2CafQ2/
         XR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QktOnDF3bFysADAMDcYrs/SxchSQ7Kda4yAb5tc6q8w=;
        b=38YpWW0im1G/fxq90iOVQBoTVQAM/uphrNsIRGZEYmSfyFh7UtaZoKLX7S+L6fsKNv
         SN5HEa6v2i3+vl01CxjfAsZeTKTZVMRbbD1L8hDGHLHZg1EkAfhBdEshsSZAlsVeKUtR
         RxLKEUlPjXFsvxLbCsuLNggboVMhS2Ft4ez2st23z1MsQ+1zFvs/ML6BCPG0+1NgGmUN
         JBghjH3zNHOXan0V7+uCGoNkk9JIrP+pw41ANHAyPiQuHs5b/aiMCie5c+f0gQSYO+Sq
         hvQ/O2bfCCOhC6PhhrHw+r4O7P8wJvc29zEPOJIMBxA7KYVO5sOSFyAPo7S15oS3dwZQ
         VOlA==
X-Gm-Message-State: AOAM531nKs+mAo5EOHgS6DyopP9Go7xHz1PFRgSVEnzqxy/h5gX9Gpv0
	dOXW6WY3jFF3ySE93GWaNNN4yCOuyrU=
X-Google-Smtp-Source: 
 ABdhPJxDF8W2s5JqJXibilGU3bxfhW1Gh/Wplx0hzD00fbNseoPcD51GV59KnGv0Ui8eFC9ba5p7dA==
X-Received: by 2002:a17:907:eaa:b0:6e8:2f3:45f9 with SMTP id
 ho42-20020a1709070eaa00b006e802f345f9mr14807711ejc.323.1649350851555;
        Thu, 07 Apr 2022 10:00:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/17] webkitgtk: update 2.34.6 -> 2.36.0
Date: Thu,  7 Apr 2022 19:00:23 +0200
Message-Id: <20220407170029.3500874-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164127

Drop patches:
0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
(both merged upstream)

reduce-memory-overheads.patch
(rejected by upstream, there's no use case - see the discussion)

Rebase to version submitted upstream:
0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch

Add:
0001-When-building-introspection-files-do-not-quote-CFLAG.patch

angle is no longer needed for x11-less setups.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...spection.cmake-prefix-variables-obta.patch | 38 +++++----
 ...cy-parallel-build-of-WebKit2-4.0.gir.patch | 46 -----------
 ...trospection-files-add-CMAKE_C_FLAGS-.patch | 52 -------------
 ...trospection-files-do-not-quote-CFLAG.patch | 78 +++++++++++++++++++
 .../webkitgtk/reduce-memory-overheads.patch   | 28 -------
 ...ebkitgtk_2.34.6.bb => webkitgtk_2.36.0.bb} |  9 +--
 6 files changed, 105 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.6.bb => webkitgtk_2.36.0.bb} (95%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 54d34b1c69..bccf74d9c9 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 317a5ac120c44987219bc03486cd2f2d1842c9b9 Mon Sep 17 00:00:00 2001
+From e0bf97eecfa601e08b9578f00b1000890284241a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -6,22 +6,30 @@ Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
 
 Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232933]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- Source/cmake/FindGObjectIntrospection.cmake | 1 +
- 1 file changed, 1 insertion(+)
+ Source/cmake/FindGObjectIntrospection.cmake | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Source/cmake/FindGObjectIntrospection.cmake b/Source/cmake/FindGObjectIntrospection.cmake
-index e1f49b4..03a4446 100644
+index be96814a..ae67b593 100644
 --- a/Source/cmake/FindGObjectIntrospection.cmake
 +++ b/Source/cmake/FindGObjectIntrospection.cmake
-@@ -26,6 +26,7 @@ macro(_GIR_GET_PKGCONFIG_VAR _outvar _varname _extra_args)
-     else ()
-         string(REGEX REPLACE "[\r\n]" " " _result "${_result}")
-         string(REGEX REPLACE " +$" ""  _result "${_result}")
-+        string(CONCAT _result $ENV{PKG_CONFIG_SYSROOT_DIR} "${_result}")
-         separate_arguments(_result)
-         set(${_outvar} ${_result} CACHE INTERNAL "")
-     endif ()
--- 
-2.1.4
-
+@@ -16,7 +16,6 @@
+ # Redistribution and use is allowed according to the terms of the BSD license.
+ 
+ 
+-
+ find_package(PkgConfig QUIET)
+ if (PKG_CONFIG_FOUND)
+     if (PACKAGE_FIND_VERSION_COUNT GREATER 0)
+@@ -30,6 +29,9 @@ if (PKG_CONFIG_FOUND)
+         pkg_get_variable(INTROSPECTION_GENERATE gobject-introspection-1.0 g_ir_generate)
+         pkg_get_variable(INTROSPECTION_GIRDIR gobject-introspection-1.0 girdir)
+         pkg_get_variable(INTROSPECTION_TYPELIBDIR gobject-introspection-1.0 typelibdir)
++        set(INTROSPECTION_SCANNER "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_SCANNER}")
++        set(INTROSPECTION_COMPILER "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_COMPILER}")
++        set(INTROSPECTION_GENERATE "$ENV{PKG_CONFIG_SYSROOT_DIR}${INTROSPECTION_GENERATE}")
+         set(INTROSPECTION_VERSION "${_pc_gir_VERSION}")
+         if (${INTROSPECTION_VERSION} VERSION_GREATER_EQUAL "1.59.1")
+             set(INTROSPECTION_HAVE_SOURCES_TOP_DIRS YES)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
deleted file mode 100644
index e06607ba2b..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4718888071e29deb8b245b88c81577fd5bac4e5e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 29 Aug 2016 16:38:11 +0300
-Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232935]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Source/WebKit/PlatformGTK.cmake | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index a069c5f6..ea2f542b 100644
---- a/Source/WebKit/PlatformGTK.cmake
-+++ b/Source/WebKit/PlatformGTK.cmake
-@@ -650,8 +650,9 @@ if (ENABLE_INTROSPECTION)
-         set(GIR_SOURCES_TOP_DIRS "--sources-top-dirs=${CMAKE_BINARY_DIR}")
-     endif ()
- 
--    add_custom_command(
--        OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
-+    # This is a target and not a command because it's used to build another .gir
-+    # and a .typelib, which would trigger two racy parallel builds when using command
-+    add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
-         DEPENDS WebKit
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
-         COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-@@ -699,7 +700,7 @@ if (ENABLE_INTROSPECTION)
-     add_custom_command(
-         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
--        DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
-+        DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
-         COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
-             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-@@ -761,7 +762,7 @@ if (ENABLE_INTROSPECTION)
- 
-     add_custom_command(
-         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
--        DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
-+        DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
-         COMMAND ${INTROSPECTION_COMPILER} --includedir=${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir -o ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
-     )
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
deleted file mode 100644
index 9e2bf09dd7..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 8f1e170a6de8036ab50eb35834a77f2c79412ee3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Oct 2015 14:18:57 +0200
-Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
- compiler flags.
-
-g-ir-compiler is using a C compiler internally, so it needs to set
-the proper flags for it.
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232936]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Source/JavaScriptCore/PlatformGTK.cmake | 2 +-
- Source/WebKit/PlatformGTK.cmake         | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Source/JavaScriptCore/PlatformGTK.cmake b/Source/JavaScriptCore/PlatformGTK.cmake
-index 0b2968d2..2742ad80 100644
---- a/Source/JavaScriptCore/PlatformGTK.cmake
-+++ b/Source/JavaScriptCore/PlatformGTK.cmake
-@@ -71,7 +71,7 @@ if (ENABLE_INTROSPECTION)
-     add_custom_command(
-         OUTPUT ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS JavaScriptCore
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
-             --quiet
-diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index e36e4c35..943f9794 100644
---- a/Source/WebKit/PlatformGTK.cmake
-+++ b/Source/WebKit/PlatformGTK.cmake
-@@ -742,7 +742,7 @@ if (ENABLE_INTROSPECTION)
-         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS WebKit
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
-             --quiet
-@@ -786,7 +786,7 @@ if (ENABLE_INTROSPECTION)
-         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
-         DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
-             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
-             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-             ${INTROSPECTION_SCANNER}
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
new file mode 100644
index 0000000000..3d02be9894
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
@@ -0,0 +1,78 @@
+From 01f5ab0edf3dd8f76d37fd36c2dcd3108be33a7b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 4 Apr 2022 21:20:05 +0200
+Subject: [PATCH] When building introspection files, do not quote CFLAGS.
+
+This does not seem to be propagated to the compiler correctly:
+
+In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/syslimits.h:7,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:34,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/lib/glib-2.0/include/glibconfig.h:11,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:32,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:32,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:30,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspectb51ks33n/JavaScriptCore-4.0.c:2:
+/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/include-fixed/limits.h:203:75: error: no include path in which to search for limits.h
+  203 | #include_next <limits.h>                /* recurse down to the real one */
+      |                                                                           ^
+In file included from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/galloca.h:32,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib.h:30,
+                 from /srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/build/Source/JavaScriptCore/tmp-introspectb51ks33n/JavaScriptCore-4.0.c:2:
+/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot/usr/include/glib-2.0/glib/gtypes.h:35:10: fatal error: time.h: No such file or directory
+   35 | #include <time.h>
+      |          ^~~~~~~~
+compilation terminated.
+Traceback (most recent call last):
+  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/unixccompiler.py", line 117, in _compile
+    self.spawn(compiler_so + cc_args + [src, '-o', obj] +
+  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/ccompiler.py", line 910, in spawn
+    spawn(cmd, dry_run=self.dry_run)
+  File "/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/lib/python3.10/distutils/spawn.py", line 91, in spawn
+    raise DistutilsExecError(
+distutils.errors.DistutilsExecError: command '/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit code 1
+
+Upstream-Status: Inappropriate [upstream has rewritten the whole thing as of https://github.com/WebKit/WebKit/commit/b0ae032850bb6b2672051bab8032fc9f9ef5eb97]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Source/JavaScriptCore/PlatformGTK.cmake | 2 +-
+ Source/WebKit/PlatformGTK.cmake         | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/JavaScriptCore/PlatformGTK.cmake b/Source/JavaScriptCore/PlatformGTK.cmake
+index 1c3c8fb7..efd18807 100644
+--- a/Source/JavaScriptCore/PlatformGTK.cmake
++++ b/Source/JavaScriptCore/PlatformGTK.cmake
+@@ -71,7 +71,7 @@ if (ENABLE_INTROSPECTION)
+     add_custom_command(
+         OUTPUT ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+         DEPENDS JavaScriptCore
+-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}" LDFLAGS=
++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+             ${INTROSPECTION_SCANNER}
+             --quiet
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index 48d1820d..ded05035 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -675,7 +675,7 @@ if (ENABLE_INTROSPECTION)
+     add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
+         DEPENDS WebKit
+         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}" LDFLAGS=
++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+             ${INTROSPECTION_SCANNER}
+             --quiet
+@@ -721,7 +721,7 @@ if (ENABLE_INTROSPECTION)
+         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
+         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+         DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
+-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS="-Wno-deprecated-declarations ${CMAKE_C_FLAGS}"
++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
+             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
+             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+             ${INTROSPECTION_SCANNER}
+-- 
+2.30.2
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
deleted file mode 100644
index 907d36c4cd..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ec6045fcf5a46123b54029a675d08d89a5e30f21 Mon Sep 17 00:00:00 2001
-From: Alberto Garcia <berto@igalia.com>
-Date: Sun, 25 Apr 2021 18:45:13 +0000
-Subject: [PATCH] Reduce memory usage when not using the Gold linker
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232938]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Source/cmake/OptionsCommon.cmake | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index dd4da682..71ad6106 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -101,6 +101,11 @@ option(GCC_OFFLINEASM_SOURCE_MAP
-   ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
- 
- option(USE_APPLE_ICU "Use Apple's internal ICU" ${APPLE})
-+# Pass --reduce-memory-overheads to the bfd linker in order to save memory
-+if (NOT USE_LD_GOLD)
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
-+    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
-+endif ()
- 
- # Enable the usage of OpenMP.
- #  - At this moment, OpenMP is only used as an alternative implementation
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
index 6870eed525..09d4493370 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
@@ -11,15 +11,13 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-           file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
-           file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://reduce-memory-overheads.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
+           file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6"
+SRC_URI[sha256sum] = "b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
@@ -47,7 +45,7 @@ DEPENDS = " \
 PACKAGECONFIG_SOUP ?= "soup2"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2 angle', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
@@ -72,6 +70,7 @@ PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=R
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
 PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
+PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
-- 
2.30.2


