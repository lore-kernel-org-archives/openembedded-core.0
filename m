Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D5C0C60722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266993"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:53 +0300
Message-Id: <c5f8205c2501e2c8264bd3c315b42569d66ac6c7.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/19] webkitgtk: update to 2.14.1
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:27 -0000

Rebase 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 272 +++++++++------------
 .../{webkitgtk_2.12.5.bb => webkitgtk_2.14.1.bb}   |  26 +-
 2 files changed, 128 insertions(+), 170 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.5.bb => webkitgtk_2.14.1.bb} (85%)

diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
index 25b3c9f..ef209c8 100644
--- a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -1,4 +1,4 @@
-From 53a00058184cd710c6f4375f4daab49d7e885a30 Mon Sep 17 00:00:00 2001
+From 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 17 Apr 2016 12:35:41 -0700
 Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
@@ -15,82 +15,95 @@ and ends up with compile errors e.g.
 /usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+---
+ Source/JavaScriptCore/shell/CMakeLists.txt             | 2 +-
+ Source/WebCore/PlatformGTK.cmake                       | 6 +++---
+ Source/WebKit2/PlatformGTK.cmake                       | 2 +-
+ Source/cmake/WebKitMacros.cmake                        | 2 +-
+ Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt | 2 +-
+ Tools/ImageDiff/CMakeLists.txt                         | 2 +-
+ Tools/MiniBrowser/gtk/CMakeLists.txt                   | 2 +-
+ Tools/TestWebKitAPI/PlatformGTK.cmake                  | 2 +-
+ Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt    | 2 +-
+ Tools/WebKitTestRunner/CMakeLists.txt                  | 2 +-
+ 10 files changed, 12 insertions(+), 12 deletions(-)
 
- Source/cmake/WebKitMacros.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
-@@ -1311,7 +1311,7 @@ add_subdirectory(shell)
+diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
+index 155c797..80fe22b 100644
+--- a/Source/JavaScriptCore/shell/CMakeLists.txt
++++ b/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
  
- WEBKIT_WRAP_SOURCELIST(${JavaScriptCore_SOURCES})
- include_directories(${JavaScriptCore_INCLUDE_DIRECTORIES})
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
 -include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
 +include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
- add_library(JavaScriptCore ${JavaScriptCore_LIBRARY_TYPE} ${JavaScriptCore_HEADERS} ${JavaScriptCore_SOURCES})
- target_link_libraries(JavaScriptCore ${JavaScriptCore_LIBRARIES})
- set_target_properties(JavaScriptCore PROPERTIES COMPILE_DEFINITIONS "BUILDING_JavaScriptCore")
-Index: webkitgtk-2.12.1/Source/WTF/wtf/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WTF/wtf/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/WTF/wtf/CMakeLists.txt
-@@ -286,7 +286,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- WEBKIT_WRAP_SOURCELIST(${WTF_SOURCES})
- include_directories(${WTF_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WTF_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WTF_SYSTEM_INCLUDE_DIRECTORIES})
- add_library(WTF ${WTF_LIBRARY_TYPE} ${WTF_HEADERS} ${WTF_SOURCES})
- target_link_libraries(WTF ${WTF_LIBRARIES})
- set_target_properties(WTF PROPERTIES COMPILE_DEFINITIONS "BUILDING_WTF")
-Index: webkitgtk-2.12.1/Source/WebCore/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebCore/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/WebCore/CMakeLists.txt
-@@ -3748,7 +3748,7 @@ WEBKIT_WRAP_SOURCELIST(${WebCore_IDL_FIL
- WEBKIT_WRAP_SOURCELIST(${WebCoreTestSupport_IDL_FILES} ${WebCoreTestSupport_SOURCES})
- 
- include_directories(${WebCore_INCLUDE_DIRECTORIES} ${WebCoreTestSupport_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebCore_SYSTEM_INCLUDE_DIRECTORIES})
- 
- if (MSVC)
-     ADD_PRECOMPILED_HEADER("WebCorePrefix.h" "WebCorePrefix.cpp" WebCore_SOURCES)
-Index: webkitgtk-2.12.1/Source/WebKit/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/WebKit/CMakeLists.txt
-@@ -28,7 +28,7 @@ set(WebKit_LIBRARIES
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${WebKit_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKit_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKit_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
  
- if (MSVC)
-     ADD_PRECOMPILED_HEADER("WebKitPrefix.h" "win/WebKitPrefix.cpp" WebKit_SOURCES)
-Index: webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit2/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
-@@ -756,7 +756,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- GENERATE_WEBKIT2_MESSAGE_SOURCES(WebKit2_DERIVED_SOURCES "${WebKit2_MESSAGES_IN_FILES}")
+diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
+index 567bd79..1fabea8 100644
+--- a/Source/WebCore/PlatformGTK.cmake
++++ b/Source/WebCore/PlatformGTK.cmake
+@@ -340,7 +340,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+         ${GTK2_INCLUDE_DIRS}
+         ${GDK2_INCLUDE_DIRS}
+     )
+-    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
++    target_include_directories(WebCorePlatformGTK2 PRIVATE
+         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     )
+     target_link_libraries(WebCorePlatformGTK2
+@@ -365,7 +365,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCorePlatformGTK)
+ target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_INCLUDE_DIRECTORIES}
+ )
+-target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
++target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     ${GTK_INCLUDE_DIRS}
+     ${GDK_INCLUDE_DIRS}
+@@ -383,7 +383,7 @@ include_directories(
+     "${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"
+ )
  
- include_directories(${WebKit2_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
- add_library(WebKit2 ${WebKit2_LIBRARY_TYPE} ${WebKit2_SOURCES} ${WebKit2_DERIVED_SOURCES})
+-include_directories(SYSTEM
++include_directories(
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+ )
  
- add_dependencies(WebKit2 WebCore ${WEBKIT2_EXTRA_DEPENDENCIES})
-Index: webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCL
+diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
+index e4805a4..c57df5d 100644
+--- a/Source/WebKit2/PlatformGTK.cmake
++++ b/Source/WebKit2/PlatformGTK.cmake
+@@ -822,7 +822,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+     target_include_directories(WebKitPluginProcess2 PRIVATE
+         ${WebKit2CommonIncludeDirectories}
+     )
+-    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
++    target_include_directories(WebKitPluginProcess2 PRIVATE
+          ${WebKit2CommonSystemIncludeDirectories}
+          ${GTK2_INCLUDE_DIRS}
+          ${GDK2_INCLUDE_DIRS}
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 043e78e..8b3b642 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -224,7 +224,7 @@ endmacro()
+ 
+ macro(WEBKIT_FRAMEWORK _target)
+     include_directories(${${_target}_INCLUDE_DIRECTORIES})
+-    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
++    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
+     add_library(${_target} ${${_target}_LIBRARY_TYPE}
+         ${${_target}_HEADERS}
+         ${${_target}_SOURCES}
+diff --git a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+index c431667..6dff244 100644
+--- a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
++++ b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
+@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES
  )
  
  include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
@@ -99,11 +112,11 @@ Index: webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
  
  set(WebKitTestNetscapePlugin_LIBRARIES
      ${X11_LIBRARIES}
-Index: webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/ImageDiff/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
-@@ -14,7 +14,7 @@ set(IMAGE_DIFF_LIBRARIES
+diff --git a/Tools/ImageDiff/CMakeLists.txt b/Tools/ImageDiff/CMakeLists.txt
+index b15443f..87e03bf 100644
+--- a/Tools/ImageDiff/CMakeLists.txt
++++ b/Tools/ImageDiff/CMakeLists.txt
+@@ -14,6 +14,6 @@ set(IMAGE_DIFF_LIBRARIES
  WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
  
  include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
@@ -111,12 +124,11 @@ Index: webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
 +include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
  add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
  target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
- set_target_properties(ImageDiff PROPERTIES FOLDER "Tools")
-Index: webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
-@@ -55,7 +55,7 @@ endif ()
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index 0704bc6..619e5a5 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -58,7 +58,7 @@ endif ()
  add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
  
  include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
@@ -124,55 +136,11 @@ Index: webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
 +include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
  add_executable(MiniBrowser ${MiniBrowser_SOURCES})
  target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
- set_target_properties(MiniBrowser PROPERTIES FOLDER "Tools")
-Index: webkitgtk-2.12.1/Tools/WebKitTestRunner/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/WebKitTestRunner/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/WebKitTestRunner/CMakeLists.txt
-@@ -115,7 +115,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURC
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
  
- add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
- target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
-Index: webkitgtk-2.12.1/Source/WebCore/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebCore/PlatformGTK.cmake
-+++ webkitgtk-2.12.1/Source/WebCore/PlatformGTK.cmake
-@@ -324,7 +324,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
-         ${GTK2_INCLUDE_DIRS}
-         ${GDK2_INCLUDE_DIRS}
-     )
--    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
-+    target_include_directories(WebCorePlatformGTK2 PRIVATE
-         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
-     )
-     target_link_libraries(WebCorePlatformGTK2
-@@ -366,7 +366,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCoreP
- target_include_directories(WebCorePlatformGTK PRIVATE
-     ${WebCore_INCLUDE_DIRECTORIES}
- )
--target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
-+target_include_directories(WebCorePlatformGTK PRIVATE
-     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
-     ${GTK_INCLUDE_DIRS}
-     ${GDK_INCLUDE_DIRS}
-@@ -384,7 +384,7 @@ include_directories(
-     "${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
- )
- 
-Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/TestWebKitAPI/PlatformGTK.cmake
-+++ webkitgtk-2.12.1/Tools/TestWebKitAPI/PlatformGTK.cmake
+diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
+index 7552cc2..2eb44d5 100644
+--- a/Tools/TestWebKitAPI/PlatformGTK.cmake
++++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
 @@ -20,7 +20,7 @@ include_directories(
      ${WEBKIT2_DIR}/UIProcess/API/gtk
  )
@@ -182,10 +150,10 @@ Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/PlatformGTK.cmake
      ${GDK3_INCLUDE_DIRS}
      ${GLIB_INCLUDE_DIRS}
      ${GTK3_INCLUDE_DIRS}
-Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+diff --git a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+index b0b4739..434e4ca 100644
+--- a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
++++ b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
 @@ -23,7 +23,7 @@ include_directories(
      ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
  )
@@ -195,29 +163,19 @@ Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
      ${ATSPI_INCLUDE_DIRS}
      ${GLIB_INCLUDE_DIRS}
      ${GSTREAMER_INCLUDE_DIRS}
-Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
-+++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-@@ -816,7 +816,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
-     target_include_directories(WebKitPluginProcess2 PRIVATE
-         ${WebKit2CommonIncludeDirectories}
-     )
--    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
-+    target_include_directories(WebKitPluginProcess2 PRIVATE
-          ${WebKit2CommonSystemIncludeDirectories}
-          ${GTK2_INCLUDE_DIRS}
-          ${GDK2_INCLUDE_DIRS}
-Index: webkitgtk-2.12.1/Source/JavaScriptCore/shell/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/shell/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/JavaScriptCore/shell/CMakeLists.txt
-@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+diff --git a/Tools/WebKitTestRunner/CMakeLists.txt b/Tools/WebKitTestRunner/CMakeLists.txt
+index 7db90f2..a4f917f 100644
+--- a/Tools/WebKitTestRunner/CMakeLists.txt
++++ b/Tools/WebKitTestRunner/CMakeLists.txt
+@@ -116,7 +116,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
  
- WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
- include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(jsc ${JSC_SOURCES})
- target_link_libraries(jsc ${JSC_LIBRARIES})
- set_target_properties(jsc PROPERTIES FOLDER "JavaScriptCore")
+ include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
+ target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
+-- 
+2.9.3
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
similarity index 85%
rename from meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
index 941d0e2..f85a33d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
@@ -10,19 +10,19 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
 		   "
 
-SRC_URI = "\
-  http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
-  file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
-  file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
-  file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
-  file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
-  file://musl-fixes.patch \
-  file://ppc-musl-fix.patch \
-  file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
-  file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
-  "
-SRC_URI[md5sum] = "7a9ea00ec195488db90fdeb2d174ddaf"
-SRC_URI[sha256sum] = "6b147854b864a5f115fadb97b2b6200b2f696db015216a34e7298d11c88b1c40"
+SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
+           file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
+           file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
+           file://musl-fixes.patch \
+           file://ppc-musl-fix.patch \
+           file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
+           file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
+           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+           "
+
+SRC_URI[md5sum] = "8d6c60dc41604d3bbd43165a674c07e5"
+SRC_URI[sha256sum] = "2e2d76c328de65bed6e0e4f096b2720a366654b27fc1af0830ece90bc4b7ceb5"
 
 inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.9.3


