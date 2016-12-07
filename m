Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id E7BC9606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:17:29 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AJPtgJxSDvWwQtOWCVsrGZwszydpsv+yvbD5Q0YIu?=
	=?us-ascii?q?jvd0So/mwa6ybRSN2/xhgRfzUJnB7Loc0qyN4vumBDZLv87JmUtBWaQEbwUCh8?=
	=?us-ascii?q?QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFRrlKAV6?=
	=?us-ascii?q?OPn+FJLMgMSrzeCy/IDYbxlViDanb75/KBu7oR/Ru8UIjodvK7o9wQbVr3VVfO?=
	=?us-ascii?q?hb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPHw768PttRnY?=
	=?us-ascii?q?UAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD+v4btnRAPuhS?=
	=?us-ascii?q?waMTMy7WPZhdFqjK9DoByvuQFxzYDXbo+SNvV+cLjQcc8GSWdbQspcTTBNDp+6?=
	=?us-ascii?q?YoASD+QBJ+FYr4zlqlYQtxS+Hw2sBOT0yjRVmnL22bY13Po7EQHa2wwrAtQAsH?=
	=?us-ascii?q?PMrNrrNaYZTPq7w7fSzTrdbvJdxDDw55TMchAmufGDQ7NxfNHQyUkgDQzFilSQ?=
	=?us-ascii?q?ppb/MzyJ0eQNtnGW4ux9XuyhjG4nrht+ojmpxso0hIjGmJkaylPF9SVl2oo1Is?=
	=?us-ascii?q?e4SEFjbd+qDpRfrCKaN4pqQsMtX2Fouzw2yrocuZ60eiUB1ZcpxwbHZvGDboSE?=
	=?us-ascii?q?+A/vWPuTLDtigH9ofKiziwuy/EWg0uHxUtS43ExXoiZYkNTArG0B2hPJ5sSaTP?=
	=?us-ascii?q?Z2412v1iyV1w/J7+FJOUU0la3GJJE/2rMwjZ8TsVjbHi/xhUX2kLeadkU69eis?=
	=?us-ascii?q?7OTqervmqYWaN451iwH+NLohlta+AeQ3KAcOW2mb9v6m2LL/+k35Ra1Gjvwwkq?=
	=?us-ascii?q?bHrJDXPcAWqrOjDwNIz4ou6QyzAjOi3dgCgHUKLFJIdAqCj4fzOlHOJP74De24?=
	=?us-ascii?q?g1SpiDpk2/TGPrr5AprTL3nOi7bhfbln5E5YyQo818pT6I5TCrEEOP7zQFP+tM?=
	=?us-ascii?q?TEDh8lNAy52+HnCM1j2YMYR22PB7SWP73PvlCV+O0gPvCAa5MSuDbnNfco/Pru?=
	=?us-ascii?q?jX4imV8BZqmlx5wXaGimEfRgPUqZZGHjjckcHmgXoAUxUfbmiFqYUT5cND6OWP?=
	=?us-ascii?q?c7/jw9BYesAIvPS4zoi7ub0Q+/H4ZKfSZBEl2KHHLieomIVvtKbzidceF7lTlR?=
	=?us-ascii?q?frG7T4g6nTiqvgLg170vCu3M9z9QjZ/52co9s+bXkgk/5xR1AM2Z0mjLRGZxyD?=
	=?us-ascii?q?BbDwQq1bxy9BQugmyI1rJ11qRV?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DpAQAjbUhY/5tjdVteHAYMGQYMgxABA?=
	=?us-ascii?q?QEBAR9agQakBVSHdIp8gg+CBymFeQKBez8UAQEBAQEBAQEBAQFhKIIzGIIdAQM?=
	=?us-ascii?q?DSwE9HAMBAh0SIS4IGQkSiDoDGwEJqkeEEgGDLA2DaQEBCAEBAQEjgjGEDYcjQ?=
	=?us-ascii?q?4QJgxUFmjI1hk6DEINbg2ICkDwCiVCENYQOHzd4Ew6DXRsYgUZxAYkfAQEB?=
X-IPAS-Result: =?us-ascii?q?A2DpAQAjbUhY/5tjdVteHAYMGQYMgxABAQEBAR9agQakBVS?=
	=?us-ascii?q?HdIp8gg+CBymFeQKBez8UAQEBAQEBAQEBAQFhKIIzGIIdAQMDSwE9HAMBAh0SI?=
	=?us-ascii?q?S4IGQkSiDoDGwEJqkeEEgGDLA2DaQEBCAEBAQEjgjGEDYcjQ4QJgxUFmjI1hk6?=
	=?us-ascii?q?DEINbg2ICkDwCiVCENYQOHzd4Ew6DXRsYgUZxAYkfAQEB?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; d="scan'208";a="87996289"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 Dec 2016 21:17:29 +0100
Received: from 1.14.117.91.dynamic.reverse-mundo-r.com ([91.117.14.1]
	helo=trinity.local.igalia.com) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim)
	id 1cEief-00063T-H5 for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 21:17:29 +0100
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 21:17:07 +0100
Message-Id: <1481141827-22451-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAMKF1srtVjVmEN0s2vKgw89g=LxJSG36eEkxFdhhouuxzg6KYQ@mail.gmail.com>
References: <CAMKF1srtVjVmEN0s2vKgw89g=LxJSG36eEkxFdhhouuxzg6KYQ@mail.gmail.com>
Subject: [PATCH] Revert "webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch"
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
X-List-Received-Date: Wed, 07 Dec 2016 20:17:30 -0000

This reverts commit 812c52f654c1bccca033163100055e3a8b8cda6e.

Upstream fixed the issue with GCC. But the build still fails with Clang.
Therefore reintroduce this patch until a better solution is found.
Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=161697

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 +++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
new file mode 100644
index 0000000..a4face2
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -0,0 +1,185 @@
+From 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Apr 2016 12:35:41 -0700
+Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
+
+gcc-6 has now introduced stdlib.h in libstdc++ for better
+compliance and its including the C library stdlib.h using
+include_next which is sensitive to order of system header
+include paths. Its infact better to not tinker with the
+system header include paths at all. Since adding /usr/include
+to -system is redundant and compiler knows about it moreover
+now with gcc6 it interferes with compiler's functioning
+and ends up with compile errors e.g.
+
+/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
+
+This is also an issue with clang (when using libstdc++ >= 6)
+
+Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=161697
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
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
+
+diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
+index 155c797..80fe22b 100644
+--- a/Source/JavaScriptCore/shell/CMakeLists.txt
++++ b/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
+ 
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
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+ )
+ 
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
+ )
+ 
+ include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ set(WebKitTestNetscapePlugin_LIBRARIES
+     ${X11_LIBRARIES}
+diff --git a/Tools/ImageDiff/CMakeLists.txt b/Tools/ImageDiff/CMakeLists.txt
+index b15443f..87e03bf 100644
+--- a/Tools/ImageDiff/CMakeLists.txt
++++ b/Tools/ImageDiff/CMakeLists.txt
+@@ -14,6 +14,6 @@ set(IMAGE_DIFF_LIBRARIES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
+ target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index 0704bc6..619e5a5 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -58,7 +58,7 @@ endif ()
+ add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
+ 
+ include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(MiniBrowser ${MiniBrowser_SOURCES})
+ target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
+ 
+diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
+index 7552cc2..2eb44d5 100644
+--- a/Tools/TestWebKitAPI/PlatformGTK.cmake
++++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
+@@ -20,7 +20,7 @@ include_directories(
+     ${WEBKIT2_DIR}/UIProcess/API/gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${GDK3_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GTK3_INCLUDE_DIRS}
+diff --git a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+index b0b4739..434e4ca 100644
+--- a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
++++ b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
+@@ -23,7 +23,7 @@ include_directories(
+     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${ATSPI_INCLUDE_DIRS}
+     ${GLIB_INCLUDE_DIRS}
+     ${GSTREAMER_INCLUDE_DIRS}
+diff --git a/Tools/WebKitTestRunner/CMakeLists.txt b/Tools/WebKitTestRunner/CMakeLists.txt
+index 7db90f2..a4f917f 100644
+--- a/Tools/WebKitTestRunner/CMakeLists.txt
++++ b/Tools/WebKitTestRunner/CMakeLists.txt
+@@ -116,7 +116,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES
+ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ 
+ include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
+ 
+ add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedBundle_SOURCES})
+ target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRARIES})
+-- 
+2.9.3
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 280765c..1c327ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://ppc-musl-fix.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
+           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            "
 
 SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
-- 
2.1.4


