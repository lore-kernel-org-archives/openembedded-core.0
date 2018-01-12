Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 09FF278866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 16:19:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jan 2018 08:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,349,1511856000"; d="scan'208";a="193450220"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 12 Jan 2018 08:19:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 18:20:02 +0200
Message-Id: <20180112162002.9669-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
References: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [morty][PATCH 2/2] webkitgtk: update to 2.18.5 (includes Spectre mitigations; see commit description)
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
X-List-Received-Date: Fri, 12 Jan 2018 16:19:58 -0000

This is the only available stable version with mitigation fixes for Spectre.
Webkit upstream developers do not port CVE fixes to earlier stable series,
no exception was made in this case.

More information:

https://webkit.org/blog/8048/what-spectre-and-meltdown-mean-for-webkit/
https://webkitgtk.org/security/WSA-2018-0001.html
https://webkitgtk.org/2018/01/10/webkitgtk2.18.5-released.html

This commit also contains the following commits added in master branch after morty release:

webkitgtk: update to 2.14.1

Rebase 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

(From OE-Core rev: a44d50c827b5180ff901d31c443ea02e100b10d5)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkit: Reduce duplication in MIPS variants.

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

(From OE-Core rev: f76d972aff47412a2cbd2d47134d66046cfe574a)

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

 * This patch is not longer needed. Upstream has fixed this issue in:
   https://trac.webkit.org/changeset/205672 which is already included
   in WebKitGTK+ >= 2.14.0

(From OE-Core rev: 812c52f654c1bccca033163100055e3a8b8cda6e)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Add an option to disable opengl support

(From OE-Core rev: 04e17727a3d1b52f6f93078fd16c6c7c9ba2b0d4)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Use MIPS MACHINE_OVERRIDES

The mipsarch* MACHINE_OVERRIDES can be used to pass the same
parameters to MIPS pre-R2 and R6 ISA variants.

Use them to reduce duplication in supporting MIPS R6 ISA.

(From OE-Core rev: 8369b3568828b1dcff0f3a061a18367f018ac447)

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: update to 2.14.2

(From OE-Core rev: ccce954f7f0b24390ce36460cf05499c8169ed10)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
Revert "webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch"

This reverts commit 812c52f654c1bccca033163100055e3a8b8cda6e.

Upstream fixed the issue with GCC. But the build still fails with Clang.
Therefore reintroduce this patch until a better solution is found.
Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=161697

(From OE-Core rev: 39be43943e3de0eb0ab9b61b405f3b76f12a307d)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Fix atomic detection on arm architecture

(From OE-Core rev: a77fc49defcf3a30a8f026cfdbd56565750f5a61)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: patch & disable JIT for x32

It might not be speedy, but it does build now.

(From OE-Core rev: 79f7e215ee7c176f02efafe7359aaa77dbd9430c)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: add missing python-native dep

Since we can't inherit pythonnative, we need this dep explicitly.

(From OE-Core rev: 63530f59e43738bac081aaf3c89ec57006038dce)

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: update to 2.14.5

Remove a reference to WebKit/LICENSE, as the directory is not there anymore
(and the LICENSE file in it hasn't been moved somewhere else) - it was
a relic of webkit 1.x era.

(From OE-Core rev: 10331f42acfa5dc429198b7c025cc2360511e534)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Fix build on aarch64

Do not try to do runtime tests during cross compile
Fixes

| CMake Error at Source/cmake/OptionsCommon.cmake:73 (math):
|   math cannot parse the expression: "-1": syntax error, unexpected exp_MINUS,
|   expecting exp_OPENPARENT or exp_NUMBER (1)

(From OE-Core rev: 528006009dddd876a830e0a8f248658182a37f37)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Upgrade to 2.16.1

Fix build with gcc7
Move all patches to webkit folder
Drop patches that were backports or have been upstreamed

(From OE-Core rev: bfbdd1a2069f199be9ba0909dd512469ff17b65e)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: remove native python dependency

Using host python seems to be fine.

(From OE-Core rev: 7cf80640f53bd8faa4874c2dad5f630a935475f6)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Fix build for armv5

Detect atomics during configure

(From OE-Core rev: 424ffbde2111130137e307eb9e598ad50451c865)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Upgrade to 2.16.3

Use bfd linker on ppc, this is because gold fails to link
webkit libraries when PIE is enabled

(From OE-Core rev: 8808d4b13a946499bc6e84a1be15f53d8ab3f673)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Upgrade to 2.16.5

Adjust some dependencies: libgcrypt is now required (instead of gnutls)
and the following build deps where missing: gettext-native, glib-2.0
and glib-2.0-native.

Also the CMake argument ENABLE_CREDENTIAL_STORAGE has been renamed to
USE_LIBSECRET.

This new upstream release (2.16.4 actually) includes security fixes for
CVE: CVE-2017-2538

(From OE-Core rev: ef68005a8c527e9b1d05b7769f0ec8ebe9ec3f91)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: update to 2.16.6

(From OE-Core rev: 198ccdbefa481f725492b5d8834213fe26431be5)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Do not use -isystem forcibly

this causes include_next <stdlib.h> to not find
this header since -isystem <sysroot> is added via
cmake, we alrady are using --sysroot so rely on that

(From OE-Core rev: a0f2d1389a7e76b64003fea391a0cd485ff5fe77)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: Add a recommends on shared-mime-info.

 * without this package installed any WebKitGTK+ based browser
   will fail to correctly open html files (and other files)
   from disk (file:// URIs). It will open them as plain txt files.

(From OE-Core rev: b708cb53b46d9d82a7853bcd0f25ef6bc417bd10)

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: disable gobject-introspection on armv7a

Disable gobject-introspection on armv7a and armv7ve
to avoid do_compile failure:

| qemu: uncaught target signal 11 (Segmentation fault) - core dumped
| Segmentation fault

(From OE-Core rev: bdddd81c8b4eab6bbf7a8697992b48cb5a30ae4a)

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

===
webkitgtk: update to 2.18.3

gcc7.patch, musl-fixes.patch, and ppc-musl-fix.patch all change code that is no
longer present in upstream tree. However, a patch with different musl fixes
has been added.

The rest of the patches are rebased to the new tree.

Libtasn is a new dependency.

Disable Gstreamer GL support on x86 due to clashing headers problem.

(From OE-Core rev: 3acae2dcd130122fe76504ec855af78db829d6ec)
===
webkitgtk: fix build with musl and x32

Make the x32 check generic to make it work with musl as well.

Fixes [YOCTO #12118]

(From OE-Core rev: dbd604ccf34e304769937b15051c047561de47f7)
===

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 223 ---------------------
 meta/recipes-sato/webkit/files/musl-fixes.patch    |  48 -----
 meta/recipes-sato/webkit/files/ppc-musl-fix.patch  |  26 ---
 ...Introspection.cmake-prefix-variables-obta.patch |   0
 .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++++
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 ++-
 ...cmake-drop-the-hardcoded-introspection-gt.patch |   0
 ...c-settings-so-that-gtkdoc-generation-work.patch |  25 +--
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 126 ++++++++++++
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 ++-
 .../webkit/webkitgtk/cross-compile.patch           |  23 +++
 .../detect-atomics-during-configure.patch          |  46 +++++
 .../webkit/webkitgtk/x32_support.patch             |  21 ++
 .../{webkitgtk_2.12.5.bb => webkitgtk_2.18.5.bb}   |  72 ++++---
 14 files changed, 377 insertions(+), 357 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 delete mode 100644 meta/recipes-sato/webkit/files/musl-fixes.patch
 delete mode 100644 meta/recipes-sato/webkit/files/ppc-musl-fix.patch
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch (100%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch (78%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch (100%)
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch (60%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 rename meta/recipes-sato/webkit/{files => webkitgtk}/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch (72%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.5.bb => webkitgtk_2.18.5.bb} (62%)

diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
deleted file mode 100644
index 25b3c9f243e..00000000000
--- a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From 53a00058184cd710c6f4375f4daab49d7e885a30 Mon Sep 17 00:00:00 2001
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
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Source/cmake/WebKitMacros.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/JavaScriptCore/CMakeLists.txt
-@@ -1311,7 +1311,7 @@ add_subdirectory(shell)
- 
- WEBKIT_WRAP_SOURCELIST(${JavaScriptCore_SOURCES})
- include_directories(${JavaScriptCore_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
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
- 
- if (MSVC)
-     ADD_PRECOMPILED_HEADER("WebKitPrefix.h" "win/WebKitPrefix.cpp" WebKit_SOURCES)
-Index: webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit2/CMakeLists.txt
-+++ webkitgtk-2.12.1/Source/WebKit2/CMakeLists.txt
-@@ -756,7 +756,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- GENERATE_WEBKIT2_MESSAGE_SOURCES(WebKit2_DERIVED_SOURCES "${WebKit2_MESSAGES_IN_FILES}")
- 
- include_directories(${WebKit2_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKit2_SYSTEM_INCLUDE_DIRECTORIES})
- add_library(WebKit2 ${WebKit2_LIBRARY_TYPE} ${WebKit2_SOURCES} ${WebKit2_DERIVED_SOURCES})
- 
- add_dependencies(WebKit2 WebCore ${WEBKIT2_EXTRA_DEPENDENCIES})
-Index: webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
-@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCL
- )
- 
- include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
- 
- set(WebKitTestNetscapePlugin_LIBRARIES
-     ${X11_LIBRARIES}
-Index: webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/ImageDiff/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/ImageDiff/CMakeLists.txt
-@@ -14,7 +14,7 @@ set(IMAGE_DIFF_LIBRARIES
- WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
- 
- include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
- target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
- set_target_properties(ImageDiff PROPERTIES FOLDER "Tools")
-Index: webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/MiniBrowser/gtk/CMakeLists.txt
-@@ -55,7 +55,7 @@ endif ()
- add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
- 
- include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(MiniBrowser ${MiniBrowser_SOURCES})
- target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
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
- 
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
-@@ -20,7 +20,7 @@ include_directories(
-     ${WEBKIT2_DIR}/UIProcess/API/gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${GDK3_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GTK3_INCLUDE_DIRS}
-Index: webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-===================================================================
---- webkitgtk-2.12.1.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-+++ webkitgtk-2.12.1/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
-@@ -23,7 +23,7 @@ include_directories(
-     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
- )
- 
--include_directories(SYSTEM
-+include_directories(
-     ${ATSPI_INCLUDE_DIRS}
-     ${GLIB_INCLUDE_DIRS}
-     ${GSTREAMER_INCLUDE_DIRS}
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
- 
- WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
- include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
--include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
- add_executable(jsc ${JSC_SOURCES})
- target_link_libraries(jsc ${JSC_LIBRARIES})
- set_target_properties(jsc PROPERTIES FOLDER "JavaScriptCore")
diff --git a/meta/recipes-sato/webkit/files/musl-fixes.patch b/meta/recipes-sato/webkit/files/musl-fixes.patch
deleted file mode 100644
index 4fdd56fea04..00000000000
--- a/meta/recipes-sato/webkit/files/musl-fixes.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Replace __GLIBC__ with __linux__ since musl also supports it
-so checking __linux__ is more accomodating
-
-See http://git.alpinelinux.org/cgit/aports/tree/community/webkit2gtk/musl-fixes.patch?id=219435d86d7e8fac9474344a7431c62bd2525184
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-===================================================================
---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -566,7 +566,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__) && ENABLE(JIT)
-+#elif defined(__linux__) && ENABLE(JIT)
- 
- #if CPU(X86)
-     return reinterpret_cast<void*>((uintptr_t) regs.machineContext.gregs[REG_ESP]);
-@@ -665,7 +665,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -747,7 +747,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -838,7 +838,7 @@ void* MachineThreads::Thread::Registers:
- #error Unknown Architecture
- #endif
- 
--#elif defined(__GLIBC__)
-+#elif defined(__linux__) // glibc and musl
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
diff --git a/meta/recipes-sato/webkit/files/ppc-musl-fix.patch b/meta/recipes-sato/webkit/files/ppc-musl-fix.patch
deleted file mode 100644
index 5f58e4953e7..00000000000
--- a/meta/recipes-sato/webkit/files/ppc-musl-fix.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-ucontext structure is different between musl and glibc for ppc
-therefore its not enough just to check for arch alone, we also
-need to check for libc type.
-
-Fixes errors like
-
-Source/JavaScriptCore/heap/MachineStackMarker.cpp:90:65: error: 'struct mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
-     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-===================================================================
---- webkitgtk-2.12.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -86,7 +86,7 @@ static void pthreadSignalHandlerSuspendR
-     }
- 
-     ucontext_t* userContext = static_cast<ucontext_t*>(ucontext);
--#if CPU(PPC)
-+#if CPU(PPC) && defined(__GLIBC__)
-     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
- #else
-     thread->suspendedMachineContext = userContext->uc_mcontext;
diff --git a/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
new file mode 100644
index 00000000000..7cc4514fccc
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -0,0 +1,77 @@
+From 415e31bd5444fa360af58b069f1b9db6607fca7d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 6 Oct 2017 17:00:08 +0300
+Subject: [PATCH] Fix build with musl
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
+ Source/WTF/wtf/Platform.h                      |  2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
+index 95080b9..2bb689c 100644
+--- a/Source/JavaScriptCore/runtime/MachineContext.h
++++ b/Source/JavaScriptCore/runtime/MachineContext.h
+@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ #if CPU(X86)
+     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
+@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+ #error Unknown Architecture
+ #endif
+ 
+-#elif defined(__GLIBC__)
++#elif defined(__linux__)
+ 
+ // The following sequence depends on glibc's sys/ucontext.h.
+ #if CPU(X86)
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 5a2863b..b36c3ff 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -680,7 +680,7 @@
+ #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
+ #endif
+ 
+-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
++#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
+ #define HAVE_MACHINE_CONTEXT 1
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
similarity index 78%
rename from meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
index 615fe4f4025..896890b4334 100644
--- a/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -1,19 +1,20 @@
-From 5760d346b42807b596f479c81f7a6b42eb36065e Mon Sep 17 00:00:00 2001
+From b7f40eceef0f23bf88090789d4c5845c35f048ae Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 29 Aug 2016 16:38:11 +0300
-Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
+Subject: [PATCH 4/9] Fix racy parallel build of WebKit2-4.0.gir
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- Source/WebKit2/PlatformGTK.cmake | 9 +++++----
+ Source/WebKit/PlatformGTK.cmake | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)
 
-diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake
-index adaa010..f18cf8a 100644
---- a/Source/WebKit2/PlatformGTK.cmake
-+++ b/Source/WebKit2/PlatformGTK.cmake
-@@ -906,8 +906,9 @@ endif ()
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index a33c6a86..d83a2e77 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1122,8 +1122,9 @@ endif ()
  string(REGEX MATCHALL "-L[^ ]*"
      INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
  
@@ -25,7 +26,7 @@ index adaa010..f18cf8a 100644
      DEPENDS WebKit2
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
      COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
-@@ -950,7 +951,7 @@ add_custom_command(
+@@ -1168,7 +1169,7 @@ add_custom_command(
  add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -34,7 +35,7 @@ index adaa010..f18cf8a 100644
      COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
          LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
-@@ -1004,7 +1005,7 @@ add_custom_command(
+@@ -1225,7 +1226,7 @@ add_custom_command(
  
  add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
@@ -44,5 +45,5 @@ index adaa010..f18cf8a 100644
  )
  
 -- 
-2.9.3
+2.14.1
 
diff --git a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
similarity index 100%
rename from meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
diff --git a/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
similarity index 60%
rename from meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index 586dd2375c9..83fd5129a01 100644
--- a/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,8 +1,8 @@
-From 4eeeaec775e190cf3f5885d7c6717acebd0201a8 Mon Sep 17 00:00:00 2001
+From 9b09974003097c9a408bbeea568996768efe705b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
-Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
- OpenEmbedded build system
+Subject: [PATCH 05/10] Tweak gtkdoc settings so that gtkdoc generation works
+ under OpenEmbedded build system
 
 This requires setting a few environment variables so that the transient
 binary is build and linked correctly, and disabling the tweaks to RUN
@@ -10,26 +10,27 @@ variable from gtkdoc.py script so that our qemu wrapper is taken into use.
 
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Source/PlatformGTK.cmake | 2 +-
  Tools/gtk/gtkdoc.py      | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
-index af4d2e3..b7b93c7 100644
+index 50b5393..7a31db5 100644
 --- a/Source/PlatformGTK.cmake
 +++ b/Source/PlatformGTK.cmake
-@@ -25,7 +25,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
+@@ -24,7 +24,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
      add_custom_command(
          OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
          DEPENDS ${DocumentationDependencies}
--        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
-+        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=${CMAKE_C_FLAGS} LD=${CMAKE_C_COMPILER} LDFLAGS=${CMAKE_C_LINK_FLAGS} RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper GIR_EXTRA_LIBS_PATH=${CMAKE_BINARY_DIR}/lib ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
++        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc -v ${_extra_args}
          COMMAND touch ${_stamp_name}
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
-     )
+         VERBATIM
 diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
-index 4c8237b..c0205f0 100644
+index 03c8e8e..34fbaff 100644
 --- a/Tools/gtk/gtkdoc.py
 +++ b/Tools/gtk/gtkdoc.py
 @@ -318,9 +318,9 @@ class GTKDoc(object):
@@ -38,12 +39,12 @@ index 4c8237b..c0205f0 100644
              current_ld_library_path = env.get('LD_LIBRARY_PATH')
 -            if current_ld_library_path:
 +            if current_ld_library_path and 'RUN' not in env:
-                 env['RUN'] = 'LD_LIBRARY_PATH="%s:%s" ' % (self.library_path, current_ld_library_path)
+                 env['LD_LIBRARY_PATH'] = '%s:%s' % (self.library_path, current_ld_library_path)
 -            else:
 +            elif 'RUN' not in env:
-                 env['RUN'] = 'LD_LIBRARY_PATH="%s" ' % self.library_path
+                 env['LD_LIBRARY_PATH'] = self.library_path
  
          if ldflags:
 -- 
-2.8.1
+2.15.1
 
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
new file mode 100644
index 00000000000..dfdc1160182
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
@@ -0,0 +1,126 @@
+From ef832a115b40861c08df333339b1366da49e5393 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Apr 2016 12:35:41 -0700
+Subject: [PATCH 9/9] WebKitMacros: Append to -I and not to -isystem
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
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
+ Source/WebCore/PlatformGTK.cmake           | 6 +++---
+ Source/WebKit/PlatformGTK.cmake            | 2 +-
+ Source/cmake/WebKitMacros.cmake            | 2 +-
+ Tools/MiniBrowser/gtk/CMakeLists.txt       | 2 +-
+ Tools/TestWebKitAPI/PlatformGTK.cmake      | 2 +-
+ 6 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
+index bc37dd31..4e49871f 100644
+--- a/Source/JavaScriptCore/shell/CMakeLists.txt
++++ b/Source/JavaScriptCore/shell/CMakeLists.txt
+@@ -35,7 +35,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
+ WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
+ WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
+ include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(jsc ${JSC_SOURCES})
+ target_link_libraries(jsc ${JSC_LIBRARIES})
+ 
+diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
+index 73506c74..8eb8b415 100644
+--- a/Source/WebCore/PlatformGTK.cmake
++++ b/Source/WebCore/PlatformGTK.cmake
+@@ -281,7 +281,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+         ${GTK2_INCLUDE_DIRS}
+         ${GDK2_INCLUDE_DIRS}
+     )
+-    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
++    target_include_directories(WebCorePlatformGTK2 PRIVATE
+         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     )
+     target_link_libraries(WebCorePlatformGTK2
+@@ -305,7 +305,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
+ target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_INCLUDE_DIRECTORIES}
+ )
+-target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
++target_include_directories(WebCorePlatformGTK PRIVATE
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+     ${GTK_INCLUDE_DIRS}
+     ${GDK_INCLUDE_DIRS}
+@@ -321,7 +321,7 @@ include_directories(
+     "${WEBCORE_DIR}/bindings/gobject/"
+ )
+ 
+-include_directories(SYSTEM
++include_directories(
+     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
+ )
+ 
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index d83a2e77..401246f4 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1050,7 +1050,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
+     target_include_directories(WebKitPluginProcess2 PRIVATE
+         ${WebKit2CommonIncludeDirectories}
+     )
+-    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
++    target_include_directories(WebKitPluginProcess2 PRIVATE
+          ${WebKit2CommonSystemIncludeDirectories}
+          ${GTK2_INCLUDE_DIRS}
+          ${GDK2_INCLUDE_DIRS}
+diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
+index 7bc89543..d9818fa4 100644
+--- a/Source/cmake/WebKitMacros.cmake
++++ b/Source/cmake/WebKitMacros.cmake
+@@ -78,7 +78,7 @@ macro(WEBKIT_FRAMEWORK_DECLARE _target)
+ endmacro()
+ 
+ macro(WEBKIT_FRAMEWORK _target)
+-    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
++    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
+     target_sources(${_target} PRIVATE
+         ${${_target}_HEADERS}
+         ${${_target}_SOURCES}
+diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
+index e832a86d..ce92c864 100644
+--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
+@@ -57,7 +57,7 @@ endif ()
+ add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
+ 
+ include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
+-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
+ add_executable(MiniBrowser ${MiniBrowser_SOURCES})
+ target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
+ 
+diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
+index 1be3dd52..7bdddf37 100644
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
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
similarity index 72%
rename from meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
rename to meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 3f71297f504..fb4c4dc9325 100644
--- a/meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -1,23 +1,24 @@
-From bae9f73b2c693b5aa156fed717d6481b60682786 Mon Sep 17 00:00:00 2001
+From 98b1359a0cd87bbdb22cef98ba594440f4c57d92 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 28 Oct 2015 14:18:57 +0200
-Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
- compiler flags.
+Subject: [PATCH 2/9] When building introspection files, add CMAKE_C_FLAGS to
+ the compiler flags.
 
 g-ir-compiler is using a C compiler internally, so it needs to set
 the proper flags for it.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- Source/WebKit2/PlatformGTK.cmake | 4 ++--
+ Source/WebKit/PlatformGTK.cmake | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-===================================================================
---- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
-+++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
-@@ -910,7 +910,7 @@ add_custom_command(
+diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
+index 7f92ae72..a33c6a86 100644
+--- a/Source/WebKit/PlatformGTK.cmake
++++ b/Source/WebKit/PlatformGTK.cmake
+@@ -1126,7 +1126,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
      DEPENDS WebKit2
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -26,7 +27,7 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
          --quiet
-@@ -951,7 +951,7 @@ add_custom_command(
+@@ -1169,7 +1169,7 @@ add_custom_command(
      OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
      DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
@@ -35,3 +36,6 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
          LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
          ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
          ${INTROSPECTION_SCANNER}
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch b/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
new file mode 100644
index 00000000000..4d1de728511
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
@@ -0,0 +1,23 @@
+Disable the tests meant to run when compiling natively
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
+===================================================================
+--- webkitgtk-2.14.5.orig/Source/cmake/OptionsCommon.cmake
++++ webkitgtk-2.14.5/Source/cmake/OptionsCommon.cmake
+@@ -67,8 +67,11 @@ endif ()
+ # Detect Cortex-A53 core if CPU is ARM64 and OS is Linux.
+ # Query /proc/cpuinfo for each available core and check reported CPU part number: 0xd03 signals Cortex-A53.
+ # (see Main ID Register in ARM Cortex-A53 MPCore Processor Technical Reference Manual)
+-set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
+-if (WTF_CPU_ARM64 AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
++if( NOT WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
++    set(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE OFF)
++endif(WTF_CPU_ARM64_CORTEXA53_INITIALVALUE)
++
++if (WTF_CPU_ARM64 AND NOT CMAKE_CROSSCOMPILING AND (${CMAKE_SYSTEM_NAME} STREQUAL "Linux"))
+     execute_process(COMMAND nproc OUTPUT_VARIABLE PROC_COUNT)
+     math(EXPR PROC_MAX ${PROC_COUNT}-1)
+     foreach (PROC_ID RANGE ${PROC_MAX})
diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
new file mode 100644
index 00000000000..c6157e10378
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
@@ -0,0 +1,46 @@
+From 0b3811771ae6385503f2d949f9433d8f810d2ff9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 May 2017 22:34:24 -0700
+Subject: [PATCH 8/9] webkitgtk: Fix build for armv5
+
+Taken from
+https://bugs.webkit.org/show_bug.cgi?id=161900
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
+index 6b5e45b9..46ee3c22 100644
+--- a/Source/WTF/wtf/CMakeLists.txt
++++ b/Source/WTF/wtf/CMakeLists.txt
+@@ -205,7 +205,6 @@ set(WTF_HEADERS
+ 
+ set(WTF_SOURCES
+     Assertions.cpp
+-    Atomics.cpp
+     AutomaticThread.cpp
+     BitVector.cpp
+     CPUTime.cpp
+@@ -336,6 +335,15 @@ if (NOT USE_SYSTEM_MALLOC)
+     list(APPEND WTF_LIBRARIES bmalloc)
+ endif ()
+ 
++file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
++     "int main(void)\n"
++     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
++try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++if (NOT ATOMICS_BUILD_SUCCEEDED)
++    list(APPEND WTF_SOURCES Atomics.cpp)
++endif ()
++file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++
+ list(APPEND WTF_SOURCES
+     unicode/icu/CollatorICU.cpp
+ )
+-- 
+2.14.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
new file mode 100644
index 00000000000..5f23837585b
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
@@ -0,0 +1,21 @@
+From: Daniel Schepler <dschepler@gmail.com>
+Subject: Fix FTBFS in x32
+Bug-Debian: https://bugs.debian.org/700795
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Index: webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
+===================================================================
+--- webkitgtk-2.16.1.orig/Source/WTF/wtf/Platform.h
++++ webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
+@@ -172,7 +172,11 @@
+ /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
+ #if   defined(__x86_64__) \
+     || defined(_M_X64)
++#ifdef __ILP32__
++#define WTF_CPU_X86_64_32 1
++#else
+ #define WTF_CPU_X86_64 1
++#endif
+ #define WTF_CPU_X86_SSE2 1
+ #endif
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
similarity index 62%
rename from meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
index 11c91c1d0b7..ccef5ff2fbe 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.5.bb
@@ -4,45 +4,42 @@ BUGTRACKER = "http://bugs.webkit.org/"
 
 LICENSE = "BSD & LGPLv2+"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-                    file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
 		    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
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
+           file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
+           file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
+           file://x32_support.patch \
+           file://cross-compile.patch \
+           file://detect-atomics-during-configure.patch \
+           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+           file://0001-Fix-build-with-musl.patch \
+           "
+
+SRC_URI[md5sum] = "af18c2cfa00cadfd0b4d8db21cab011d"
+SRC_URI[sha256sum] = "0c6d80cc7eb5d32f8063041fa11a1a6f17a29765c2f69c6bc862cd47c2d539b8"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-# We cannot inherit pythonnative because that would conflict with inheriting python3native
-# (which is done by gobject-introspection). But webkit only needs the path to native Python 2.x binary
-# so we simply set it explicitly here.
-EXTRANATIVEPATH += "python-native"
-
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
 
-DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
 	   atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora libvorbis libxcomposite libxtst \
 	   ruby-native libnotify gstreamer1.0-plugins-bad \
+	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl', '' ,d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
                    libsecret \
                   "
@@ -54,7 +51,8 @@ PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant
 PACKAGECONFIG[gtk2] = "-DENABLE_PLUGIN_PROCESS_GTK2=ON,-DENABLE_PLUGIN_PROCESS_GTK2=OFF,gtk+"
 PACKAGECONFIG[gles2] = "-DENABLE_GLES2=ON,-DENABLE_GLES2=OFF,virtual/libgles2"
 PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
-PACKAGECONFIG[libsecret] = "-DENABLE_CREDENTIAL_STORAGE=ON,-DENABLE_CREDENTIAL_STORAGE=OFF,libsecret"
+PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
+PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
 PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 
 EXTRA_OECMAKE = " \
@@ -63,8 +61,13 @@ EXTRA_OECMAKE = " \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
+                -DPYTHON_EXECUTABLE=`which python` \
 		"
 
+# GL/GLES header clash: both define the same thing, differently, on 32 bit x86
+EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
+EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=OFF "
@@ -77,19 +80,28 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_mips = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_mips64 = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
+EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
+
 # JIT not supported on MIPS either
-EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
+
+# JIT not supported on X32
+# An attempt was made to upstream JIT support for x32 in
+# https://bugs.webkit.org/show_bug.cgi?id=100450, but this was closed as
+# unresolved due to limited X32 adoption.
+EXTRA_OECMAKE_append_x86-x32 = " -DENABLE_JIT=OFF "
 
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
+RRECOMMENDS_${PN} += "ca-certificates shared-mime-info"
+
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
@@ -105,4 +117,10 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
 # WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+EXTRA_OECMAKE_append_mipsarchn32 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+EXTRA_OECMAKE_append_mipsarchn64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+GI_DATA_ENABLED_armv7a = "False"
+GI_DATA_ENABLED_armv7ve = "False"
-- 
2.15.1


