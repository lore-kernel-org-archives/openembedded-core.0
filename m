Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81D8C6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 05:55:20 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id m34so7874390oik.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+MHUk0pGXCZdFi/C5/U0rV8I/jpO7biQY9qrh5DnOxU=;
	b=YJkAXQ/pxoFYlxhsAG8h6/wjJfXTJWSICACdWOLUcuSMWIL4iiyCYjC6k4a0PhVW/5
	+4LbEva9Abr0igwez73m0j0uN5cp2+qzjyy7SPMttqaq/eO7VhMw2T+J17Iclt4W7kyt
	Alm4MyNdUCNJ7KAeNF69CByhyXSOmqWqB23dGGwfGZQE5Dtb1VFcQ06o4ArCY3gAK25m
	zUz8YaDh5rzP5AHZKjEGiobIXhbG5lZVaYfQaWubWDKKXKobQijV7Y+VUX0rAB+Yhhpl
	eNk8Z+Tci1m+DgCjim4G6R8VJhWa+jKCJALDhEvREakDG6TLi26BJ9E5hiiCdwJIh+iy
	mtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+MHUk0pGXCZdFi/C5/U0rV8I/jpO7biQY9qrh5DnOxU=;
	b=NDpyTrb1bYqbVDSe0iuOV5tZvy+rD5eCbG3NHQf3ZZdX42yEdzo745ndjYfLTOEZ3X
	eouAfuKmWs07l7D3X7Tozrj/MjdMs37eOWXnL6b3ZZzKsU1uCWnjudOlLnW0pKTH6bC7
	EDzDmFdk0MtxZtvrKXcTNnO1IEUQyvOrDmvUI6R4zAJzi3E2bHTIM7HK8HzoAS16ZM2H
	0jPSSgifygLaLAobrmaqcilYebSmZb98Yq9BGsSmcqZC4AKuUB8K+63Ay3Xv6pvS4+w0
	flXOrb6ai7Dj5AmkrhaKfyc6kRJrnH2OCPaVNtxkuBPmKiu7jaZWlq+/qPOf2HUwrY/R
	f98Q==
X-Gm-Message-State: AN3rC/5VlRNedI6rGfSfOn82h4kguKQAqwHVJ2JhU7EToOict+4YpaWt
	+atn7wWO6vLpNA==
X-Received: by 10.84.195.129 with SMTP id j1mr14331799pld.88.1492754121413;
	Thu, 20 Apr 2017 22:55:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x65sm13533236pfb.111.2017.04.20.22.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 22:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 22:55:01 -0700
Message-Id: <20170421055501.16435-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] webkitgtk: Upgrade to 2.16.1
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
X-List-Received-Date: Fri, 21 Apr 2017 05:55:23 -0000

Drop patches that were backports or have been upstreamed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 ---------------------
 .../webkit/webkitgtk/detect_atomics.patch          |  38 -----
 .../webkit/webkitgtk/x32_support.patch             |  13 +-
 .../{webkitgtk_2.14.5.bb => webkitgtk_2.16.1.bb}   |   7 +-
 4 files changed, 8 insertions(+), 235 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/detect_atomics.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.5.bb => webkitgtk_2.16.1.bb} (95%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
deleted file mode 100644
index a4face2765b..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 17 Apr 2016 12:35:41 -0700
-Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
-
-gcc-6 has now introduced stdlib.h in libstdc++ for better
-compliance and its including the C library stdlib.h using
-include_next which is sensitive to order of system header
-include paths. Its infact better to not tinker with the
-system header include paths at all. Since adding /usr/include
-to -system is redundant and compiler knows about it moreover
-now with gcc6 it interferes with compiler's functioning
-and ends up with compile errors e.g.
-
-/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
-
-This is also an issue with clang (when using libstdc++ >= 6)
-
-Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=161697
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- Source/JavaScriptCore/shell/CMakeLists.txt             | 2 +-
- Source/WebCore/PlatformGTK.cmake                       | 6 +++---
- Source/WebKit2/PlatformGTK.cmake                       | 2 +-
- Source/cmake/WebKitMacros.cmake                        | 2 +-
- Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt | 2 +-
- Tools/ImageDiff/CMakeLists.txt                         | 2 +-
- Tools/MiniBrowser/gtk/CMakeLists.txt                   | 2 +-
- Tools/TestWebKitAPI/PlatformGTK.cmake                  | 2 +-
- Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt    | 2 +-
- Tools/WebKitTestRunner/CMakeLists.txt                  | 2 +-
- 10 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
-index 155c797..80fe22b 100644
---- a/Source/JavaScriptCore/shell/CMakeLists.txt
-+++ b/Source/JavaScriptCore/shell/CMakeLists.txt
-@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
- include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(jsc ${JSC_SOURCES})
- target_link_libraries(jsc ${JSC_LIBRARIES})
- 
-diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
-index 567bd79..1fabea8 100644
---- a/Source/WebCore/PlatformGTK.cmake
-+++ b/Source/WebCore/PlatformGTK.cmake
-@@ -340,7 +340,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
-         ${GTK2_INCLUDE_DIRS}
-         ${GDK2_INCLUDE_DIRS}
-     )
--    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
-+    target_include_directories(WebCorePlatformGTK2 PRIVATE
-         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
-     )
-     target_link_libraries(WebCorePlatformGTK2
-@@ -365,7 +365,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCorePlatformGTK)
- target_include_directories(WebCorePlatformGTK PRIVATE
-     ${WebCore_INCLUDE_DIRECTORIES}
- )
--target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
-+target_include_directories(WebCorePlatformGTK PRIVATE
-     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
-     ${GTK_INCLUDE_DIRS}
-     ${GDK_INCLUDE_DIRS}
-@@ -383,7 +383,7 @@ include_directories(
-     "${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
- )
- 
-diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
-index e4805a4..c57df5d 100644
---- a/Source/WebKit2/PlatformGTK.cmake
-+++ b/Source/WebKit2/PlatformGTK.cmake
-@@ -822,7 +822,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
-     target_include_directories(WebKitPluginProcess2 PRIVATE
-         ${WebKit2CommonIncludeDirectories}
-     )
--    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
-+    target_include_directories(WebKitPluginProcess2 PRIVATE
-          ${WebKit2CommonSystemIncludeDirectories}
-          ${GTK2_INCLUDE_DIRS}
-          ${GDK2_INCLUDE_DIRS}
-diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
-index 043e78e..8b3b642 100644
---- a/Source/cmake/WebKitMacros.cmake
-+++ b/Source/cmake/WebKitMacros.cmake
-@@ -224,7 +224,7 @@ endmacro()
- 
- macro(WEBKIT_FRAMEWORK _target)
-     include_directories(${${_target}_INCLUDE_DIRECTORIES})
--    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
-+    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
-     add_library(${_target} ${${_target}_LIBRARY_TYPE}
-         ${${_target}_HEADERS}
-         ${${_target}_SOURCES}
-diff --git a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-index c431667..6dff244 100644
---- a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-+++ b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES
- )
- 
- include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
- 
- set(WebKitTestNetscapePlugin_LIBRARIES
-     ${X11_LIBRARIES}
-diff --git a/Tools/ImageDiff/CMakeLists.txt b/Tools/ImageDiff/CMakeLists.txt
-index b15443f..87e03bf 100644
---- a/Tools/ImageDiff/CMakeLists.txt
-+++ b/Tools/ImageDiff/CMakeLists.txt
-@@ -14,6 +14,6 @@ set(IMAGE_DIFF_LIBRARIES
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
- target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
-diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
-index 0704bc6..619e5a5 100644
---- a/Tools/MiniBrowser/gtk/CMakeLists.txt
-+++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
-@@ -58,7 +58,7 @@ endif ()
- add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
- 
- include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(MiniBrowser ${MiniBrowser_SOURCES})
- target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
- 
-diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
-index 7552cc2..2eb44d5 100644
---- a/Tools/TestWebKitAPI/PlatformGTK.cmake
-+++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
-@@ -20,7 +20,7 @@ include_directories(
-     ${WEBKIT2_DIR}/UIProcess/API/gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${GDK3_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GTK3_INCLUDE_DIRS}
-diff --git a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-index b0b4739..434e4ca 100644
---- a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-+++ b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-@@ -23,7 +23,7 @@ include_directories(
-     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${ATSPI_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GSTREAMER_INCLUDE_DIRS}
-diff --git a/Tools/WebKitTestRunner/CMakeLists.txt b/Tools/WebKitTestRunner/CMakeLists.txt
-index 7db90f2..a4f917f 100644
---- a/Tools/WebKitTestRunner/CMakeLists.txt
-+++ b/Tools/WebKitTestRunner/CMakeLists.txt
-@@ -116,7 +116,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
- 
- add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
- target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
--- 
-2.9.3
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/detect_atomics.patch b/meta/recipes-sato/webkit/webkitgtk/detect_atomics.patch
deleted file mode 100644
index c4e80a7d967..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/detect_atomics.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Sourced from https://bugs.webkit.org/show_bug.cgi?id=161900
-
-on arm fixes
-
-| /usr/src/debug/libgcc/6.2.0-r0/gcc-6.2.0/build.arm-oe-linux-gnueabi.arm-oe-linux-gnueabi/libgcc/../../../../../../../work-shared/gcc-6.2.0-r0/gcc-6.2.0/libgcc/config/arm/linux-atomic-64bit.c:117: multiple definition of `__sync_sub_and_fetch_8'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Backport
-
-diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
-index 867999e..ea69322 100644
---- a/Source/WTF/wtf/CMakeLists.txt
-+++ b/Source/WTF/wtf/CMakeLists.txt
-@@ -171,7 +171,6 @@ set(WTF_HEADERS
- 
- set(WTF_SOURCES
-     Assertions.cpp
--    Atomics.cpp
-     BitVector.cpp
-     CompilationThread.cpp
-     CrossThreadCopier.cpp
-@@ -276,6 +275,15 @@ if (NOT USE_SYSTEM_MALLOC)
-     list(APPEND WTF_LIBRARIES bmalloc)
- endif ()
- 
-+file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
-+     "int main(void)\n"
-+     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
-+try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
-+if (NOT ATOMICS_BUILD_SUCCEEDED)
-+    list(APPEND WTF_SOURCES Atomics.cpp)
-+endif ()
-+file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
-+
- list(APPEND WTF_SOURCES
-     unicode/icu/CollatorICU.cpp
- )
diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
index fea4c27147a..5f23837585b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
@@ -3,11 +3,11 @@ Subject: Fix FTBFS in x32
 Bug-Debian: https://bugs.debian.org/700795
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Index: webkitgtk/Source/WTF/wtf/Platform.h
+Index: webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
 ===================================================================
---- webkitgtk.orig/Source/WTF/wtf/Platform.h
-+++ webkitgtk/Source/WTF/wtf/Platform.h
-@@ -182,8 +182,12 @@
+--- webkitgtk-2.16.1.orig/Source/WTF/wtf/Platform.h
++++ webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
+@@ -172,7 +172,11 @@
  /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
  #if   defined(__x86_64__) \
      || defined(_M_X64)
@@ -15,8 +15,7 @@ Index: webkitgtk/Source/WTF/wtf/Platform.h
 +#define WTF_CPU_X86_64_32 1
 +#else
  #define WTF_CPU_X86_64 1
- #endif
 +#endif
+ #define WTF_CPU_X86_SSE2 1
+ #endif
  
- /* CPU(ARM64) - Apple */
- #if (defined(__arm64__) && defined(__APPLE__)) || defined(__aarch64__)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
index 3559756256d..4443a5941b6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
@@ -17,15 +17,12 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://ppc-musl-fix.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
-           file://detect_atomics.patch \
            file://x32_support.patch \
            file://cross-compile.patch \
            file://gcc7.patch \
            "
-
-SRC_URI[md5sum] = "7fe3cb2699e64f969b285823c5ae2516"
-SRC_URI[sha256sum] = "3ca8f1c33a9b43d6c753dcac1c0788656930e06382b10fdf5c2805ea8f96369f"
+SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
+SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.12.2


