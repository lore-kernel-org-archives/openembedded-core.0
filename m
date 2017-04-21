Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id ED1A077B38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:09:24 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k87so31098745ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L71X16dxsgr3NdWmBai1qyCgl/WAa81OeA51PE7w6uE=;
	b=PK9AZ+rtityOYEeATCZkdmj8dIZpiCiv3a726poNEBguHVGKg6iXzfjD2oNo9o4sCY
	nbXcge+GvkKWG3LnDp+4KsHKCHESdCun5rPlY20aleHXGPf7YnZEYI0u7NPVWDSgjEud
	fLiSC37oYqw0VvrP9MR4Ak/bwd2GipP/zF2T5SdUsx2f+mGIjvdXw+BMOYKRyXHcyJl+
	Sep5+TBCNyQQj/C3LcogdRcUtgNnHhvG72Uu4laWgpqUDu/WaUsrTVmOCmWjDJHN9e7H
	Et0uoUBO0rFBHd7iLT5dxcGjpmW+xWN+HS/VaFXXR+P36im7BvOGCQHBoBnzc0UeWprV
	oUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L71X16dxsgr3NdWmBai1qyCgl/WAa81OeA51PE7w6uE=;
	b=nPvoqoAZCyk6q95oP2FGCxkkoLRsaEIdpS7rqkK126UhPuKvwhyLUcfBvaZz+0YPVD
	UnclQEFued7CrOpCm3hFCSyPaX5rsONKG3Vth/hz2NwuBVE9aUQq4FecEophsEFqTyGr
	nL8bYrq7LSbUSuqUAwxPhG2p+JWk8mlhz8JsD1TGamSa8RbQ1R9GbIkQyg07cuOmRcQn
	8eNS7LMsiWGRDydsk4OoVlxDmVKuciAHjsS4uVwVz4mvSDthQ4/e3YctPqC/4j7vpmVC
	g/q8ZSr7IDqfQ1J+XAnhx7vK5Dxto8jyV8gkczdSIUg9cNfCLv91PoPQrUeNyknghDbq
	PvKw==
X-Gm-Message-State: AN3rC/5UYBSEs2eRl/WNF5J9q0DUD1ZDs8pGs9jaJH8WFpsf23iFmF5Q
	a/SmtXf0ziHy5w==
X-Received: by 10.36.13.74 with SMTP id 71mr11275825itx.62.1492787365635;
	Fri, 21 Apr 2017 08:09:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id d139sm829118itd.6.2017.04.21.08.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 08:09:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 08:09:12 -0700
Message-Id: <20170421150912.12582-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH V2] webkitgtk: Upgrade to 2.16.1
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
X-List-Received-Date: Fri, 21 Apr 2017 15:09:25 -0000

Fix build with gcc7
Move all patches to webkit folder
Drop patches that were backports or have been upstreamed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 ---------------------
 .../recipes-sato/webkit/files/detect_atomics.patch |  38 -----
 ...Introspection.cmake-prefix-variables-obta.patch |   0
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |   0
 ...cmake-drop-the-hardcoded-introspection-gt.patch |   0
 ...c-settings-so-that-gtkdoc-generation-work.patch |   0
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |   0
 .../{files => webkitgtk}/cross-compile.patch       |   0
 meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 +++
 .../webkit/{files => webkitgtk}/musl-fixes.patch   |   0
 .../webkit/{files => webkitgtk}/ppc-musl-fix.patch |   0
 .../webkit/webkitgtk/x32_support.patch             |  13 +-
 .../{webkitgtk_2.14.5.bb => webkitgtk_2.16.1.bb}   |   8 +-
 13 files changed, 32 insertions(+), 235 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 delete mode 100644 meta/recipes-sato/webkit/files/detect_atomics.patch
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/cross-compile.patch (100%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
 rename meta/recipes-sato/webkit/{files => webkitgtk}/musl-fixes.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/ppc-musl-fix.patch (100%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.5.bb => webkitgtk_2.16.1.bb} (95%)

diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
deleted file mode 100644
index a4face2765b..00000000000
--- a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
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
diff --git a/meta/recipes-sato/webkit/files/detect_atomics.patch b/meta/recipes-sato/webkit/files/detect_atomics.patch
deleted file mode 100644
index c4e80a7d967..00000000000
--- a/meta/recipes-sato/webkit/files/detect_atomics.patch
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
diff --git a/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
diff --git a/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
diff --git a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
diff --git a/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
diff --git a/meta/recipes-sato/webkit/files/cross-compile.patch b/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/cross-compile.patch
rename to meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch b/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
new file mode 100644
index 00000000000..aee29a9a72d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
@@ -0,0 +1,23 @@
+Imported from
+https://src.fedoraproject.org/cgit/rpms/webkitgtk4.git/plain/gcc7.patch
+
+Add to CXX flags since webkitgtk uses c++ compiler by default
+Fixes
+Source/JavaScriptCore/runtime/JSGenericTypedArrayView.h:119:67: error: no matching function for call to 'JSC::JSGenericTypedArrayView<Adaptor>::vector() const'
+|          return bitwise_cast<const typename Adaptor::Type*>(vector());
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com
+Upstream-Status: Pending
+
+diff -up webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7 webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake
+--- webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7	2017-02-21 09:57:13.168916004 +0100
++++ webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake	2017-02-21 09:58:12.811563156 +0100
+@@ -41,6 +41,8 @@ if (COMPILER_IS_GCC_OR_CLANG)
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-aliasing")
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-aliasing -fno-rtti")
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-expansion-to-defined")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-expansion-to-defined")
+ endif ()
+ 
+ if (COMPILER_IS_CLANG AND CMAKE_GENERATOR STREQUAL "Ninja")
diff --git a/meta/recipes-sato/webkit/files/musl-fixes.patch b/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/musl-fixes.patch
rename to meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
diff --git a/meta/recipes-sato/webkit/files/ppc-musl-fix.patch b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/ppc-musl-fix.patch
rename to meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
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
index daa17a94da2..4443a5941b6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
@@ -17,14 +17,12 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://ppc-musl-fix.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
-           file://detect_atomics.patch \
            file://x32_support.patch \
            file://cross-compile.patch \
+           file://gcc7.patch \
            "
-
-SRC_URI[md5sum] = "7fe3cb2699e64f969b285823c5ae2516"
-SRC_URI[sha256sum] = "3ca8f1c33a9b43d6c753dcac1c0788656930e06382b10fdf5c2805ea8f96369f"
+SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
+SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.12.2


