Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2817F597
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 14:39:48 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id w14so14160540qto.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8hCvZmxixUTSRZDumNkN/DNIImCSY0N9JtOI/fMdnhs=;
	b=J1DErPZbatF3gvtBkcZJAvI2PEH+YSE39fo3C0PByyxpy86OoSk5Ick3Z3tD8ZDprG
	8/yWC3h2lgcqBzxOzOuiPBzgEfLRohFa9XzxrdRDM0uPFObiAjJ+NbhCsXwaybZ6eQxG
	q0XrGksjLZFMI0+FNQlyuDJluJNj2ndLeH9+9evIzJ6LvsmGpD4FBLhaKDuqjzeQjMYv
	48WTFTdP9+yuFhYNEKU7PWONFjAL8I2wjK7aD+e5+5PhuKcKZfw0VWWpECmdRgsfVt24
	yCvQZlzguv9pLZc6WfKifP0qCUtxdgJLcNtsXQMOtzFSaO4BdQQrSW02ta3GBO/osJD5
	XKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8hCvZmxixUTSRZDumNkN/DNIImCSY0N9JtOI/fMdnhs=;
	b=f59I7l5BZ+HXMYwm3j6wv+I9ZKSq623hpFt/9tG0f9lDTVh2voy8RKTikVGlUSNxlU
	EhVdIQxa+ArSRcKWWgcwZtYCVFgtOASeOhPl1ccvuz0IFS2uy15rTAWHvTW3/rr5yD2n
	QNM3YJNXmIhiIt2Dcw8iVrc5ZrXWY48FSZSKlzx56iy4gkyUsrCE1X7FlJQk4LiN8yyA
	awbJesSLKstgK5M7dJNvy7EPJtAXSUr9+5d80GQ827wPdxnpQl8WWkiMvM4+m6HGkPiN
	wT7IWsPBfexVPhiWXb1rw/uUTlgEpRyHFhYGN95BHm6fzTTY8I+KYhAAAFdUHLld1Iis
	cExw==
X-Gm-Message-State: APjAAAVxT5bkz67R1K/P3/AwfEIJSp8r2TNy1cO+43ZVbSN+cqR8CTDt
	ZDvO1MSc/U2qYY/vsBtaPAuR5suZsC78fzr5hTk=
X-Google-Smtp-Source: APXvYqwmTHW52ccAwM+zQm/pFk+4B1bEd7DE/1k3XImn3zB9I9kXVP+X0Nj4TZaosRYXaIQsWJig5mivY29lyWwJOnI=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr2502705qtr.378.1570804788761; 
	Fri, 11 Oct 2019 07:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-9-alex.kanavin@gmail.com>
In-Reply-To: <20191011114754.91740-9-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Oct 2019 07:39:22 -0700
Message-ID: <CAMKF1sp7KwGZSgsPobPDAN+K3q3M72xDkQ2e1muuDpnJ+fbU-w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/19] webkitgtk: update 2.24.4 -> 2.26.1
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
X-List-Received-Date: Fri, 11 Oct 2019 14:39:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 11, 2019 at 4:49 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop patches:
> - 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch - this
> has been a pain to rebase for a while as upstream keeps shifting and
> changing the code that needs to be modified. If the issue the patch
> is addressing is still relevant, please work with upstream to fix it
> at the source
>

IIRC this has already been fixed differently. So dropping it might be fine.


> - 0001-gstreamer-add-a-missing-format-string.patch, narrowing.patch
> are integrated upstream
>
> - detect-gstreamer-gl.patch is adjusting something that is better done
> from the yocto package configuration
>
> Add an option to disable an enabled-by-default sandbox that requires
> a component that oe-core does not have.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...acros-Append-to-I-and-not-to-isystem.patch | 125 ------------------
>  ...streamer-add-a-missing-format-string.patch |  24 ----
>  .../webkitgtk/detect-gstreamer-gl.patch       |  20 ---
>  .../webkit/webkitgtk/narrowing.patch          |  31 -----
>  ...ebkitgtk_2.24.4.bb => webkitgtk_2.26.1.bb} |   9 +-
>  5 files changed, 3 insertions(+), 206 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/narrowing.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.24.4.bb => webkitgtk_2.26.1.bb} (93%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> deleted file mode 100644
> index e71905d26a1..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -From d1634e56a2589ec62325011bf77d480a67123b52 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 17 Apr 2016 12:35:41 -0700
> -Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
> -
> -gcc-6 has now introduced stdlib.h in libstdc++ for better
> -compliance and its including the C library stdlib.h using
> -include_next which is sensitive to order of system header
> -include paths. Its infact better to not tinker with the
> -system header include paths at all. Since adding /usr/include
> -to -system is redundant and compiler knows about it moreover
> -now with gcc6 it interferes with compiler's functioning
> -and ends up with compile errors e.g.
> -
> -/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> ----
> - Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
> - Source/WebCore/PlatformGTK.cmake           | 6 +++---
> - Source/WebKit/PlatformGTK.cmake            | 2 +-
> - Source/cmake/WebKitMacros.cmake            | 2 +-
> - Tools/MiniBrowser/gtk/CMakeLists.txt       | 2 +-
> - Tools/TestWebKitAPI/PlatformGTK.cmake      | 2 +-
> - 6 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
> -index 87153e35..cd0beed4 100644
> ---- a/Source/JavaScriptCore/shell/CMakeLists.txt
> -+++ b/Source/JavaScriptCore/shell/CMakeLists.txt
> -@@ -36,7 +36,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> - WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
> - WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
> - include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES} ${JavaScriptCore_PRIVATE_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(jsc ${JSC_SOURCES})
> - target_link_libraries(jsc ${JSC_LIBRARIES})
> -
> -diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
> -index e0dd9cd9..a2997f3e 100644
> ---- a/Source/WebCore/PlatformGTK.cmake
> -+++ b/Source/WebCore/PlatformGTK.cmake
> -@@ -164,7 +164,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> -     target_include_directories(WebCorePlatformGTK2 PRIVATE
> -         ${WebCore_INCLUDE_DIRECTORIES}
> -     )
> --    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
> -+    target_include_directories(WebCorePlatformGTK2 PRIVATE
> -         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> -         ${GTK2_INCLUDE_DIRS}
> -         ${GDK2_INCLUDE_DIRS}
> -@@ -190,7 +190,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
> - target_include_directories(WebCorePlatformGTK PRIVATE
> -     ${WebCore_INCLUDE_DIRECTORIES}
> - )
> --target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
> -+target_include_directories(WebCorePlatformGTK PRIVATE
> -     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> -     ${GTK_INCLUDE_DIRS}
> -     ${GDK_INCLUDE_DIRS}
> -@@ -206,7 +206,7 @@ include_directories(
> -     "${WEBCORE_DIR}/bindings/gobject/"
> - )
> -
> --include_directories(SYSTEM
> -+include_directories(
> -     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> - )
> -
> -diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
> -index 693bbdfe..20e3802f 100644
> ---- a/Source/WebKit/PlatformGTK.cmake
> -+++ b/Source/WebKit/PlatformGTK.cmake
> -@@ -664,7 +664,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> -     target_include_directories(WebKitPluginProcess2 PRIVATE
> -         ${WebKitCommonIncludeDirectories}
> -     )
> --    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
> -+    target_include_directories(WebKitPluginProcess2 PRIVATE
> -          ${WebKitCommonSystemIncludeDirectories}
> -          ${GTK2_INCLUDE_DIRS}
> -          ${GDK2_INCLUDE_DIRS}
> -diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
> -index 6d58d57e..976e2362 100644
> ---- a/Source/cmake/WebKitMacros.cmake
> -+++ b/Source/cmake/WebKitMacros.cmake
> -@@ -152,7 +152,7 @@ macro(WEBKIT_FRAMEWORK _target)
> -         ${${_target}_SOURCES}
> -     )
> -     target_include_directories(${_target} PUBLIC "$<BUILD_INTERFACE:${${_target}_INCLUDE_DIRECTORIES}>")
> --    target_include_directories(${_target} SYSTEM PRIVATE "$<BUILD_INTERFACE:${${_target}_SYSTEM_INCLUDE_DIRECTORIES}>")
> -+    target_include_directories(${_target} PRIVATE "$<BUILD_INTERFACE:${${_target}_SYSTEM_INCLUDE_DIRECTORIES}>")
> -     target_include_directories(${_target} PRIVATE "$<BUILD_INTERFACE:${${_target}_PRIVATE_INCLUDE_DIRECTORIES}>")
> -     target_link_libraries(${_target} ${${_target}_LIBRARIES})
> -     set_target_properties(${_target} PROPERTIES COMPILE_DEFINITIONS "BUILDING_${_target}")
> -diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -index a0d32059..f259ade2 100644
> ---- a/Tools/MiniBrowser/gtk/CMakeLists.txt
> -+++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -@@ -59,7 +59,7 @@ endif ()
> - add_definitions(-DGDK_VERSION_MIN_REQUIRED=GDK_VERSION_3_6)
> -
> - include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(MiniBrowser ${MiniBrowser_SOURCES})
> - target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
> -
> -diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
> -index 8dd0e146..d037fc35 100644
> ---- a/Tools/TestWebKitAPI/PlatformGTK.cmake
> -+++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
> -@@ -22,7 +22,7 @@ include_directories(
> -     ${WEBKIT_DIR}/UIProcess/API/gtk
> - )
> -
> --include_directories(SYSTEM
> -+include_directories(
> -     ${GDK3_INCLUDE_DIRS}
> -     ${GLIB_INCLUDE_DIRS}
> -     ${GSTREAMER_INCLUDE_DIRS}
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch b/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
> deleted file mode 100644
> index bd4ac1e3538..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 2d9687840b97186b80053dd262209e39455ac876 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 8 May 2019 15:31:23 +0200
> -Subject: [PATCH] gstreamer: add a missing format string
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - .../platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp    | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
> -index e1e497ee..483fd65c 100644
> ---- a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
> -+++ b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
> -@@ -738,7 +738,7 @@ static GstStateChangeReturn webKitWebSrcChangeState(GstElement* element, GstStat
> -     WebKitWebSrc* src = WEBKIT_WEB_SRC(element);
> -
> - #if GST_CHECK_VERSION(1, 14, 0)
> --    GST_DEBUG_OBJECT(src, gst_state_change_get_name(transition));
> -+    GST_DEBUG_OBJECT(src, "%s", gst_state_change_get_name(transition));
> - #endif
> -     switch (transition) {
> -     case GST_STATE_CHANGE_READY_TO_NULL:
> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch b/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
> deleted file mode 100644
> index 57ae48c1413..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -From: Alberto Garcia <berto@igalia.com>
> -Subject: Disable USE_GSTREAMER_GL is the package is not found
> -Forwarded: no
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: webkitgtk/Source/cmake/GStreamerChecks.cmake
> -===================================================================
> ---- webkitgtk.orig/Source/cmake/GStreamerChecks.cmake
> -+++ webkitgtk/Source/cmake/GStreamerChecks.cmake
> -@@ -43,7 +43,8 @@ if (ENABLE_VIDEO OR ENABLE_WEB_AUDIO)
> -             message(FATAL_ERROR "GStreamer 1.10 is needed for USE_GSTREAMER_GL.")
> -         else ()
> -             if (NOT PC_GSTREAMER_GL_FOUND)
> --                message(FATAL_ERROR "GStreamerGL is needed for USE_GSTREAMER_GL.")
> -+                set(USE_GSTREAMER_GL OFF)
> -+                message(STATUS "GStreamerGL is needed for USE_GSTREAMER_GL.")
> -             endif ()
> -         endif ()
> -     endif ()
> diff --git a/meta/recipes-sato/webkit/webkitgtk/narrowing.patch b/meta/recipes-sato/webkit/webkitgtk/narrowing.patch
> deleted file mode 100644
> index 598b6b5df53..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/narrowing.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Fix build with clang on arm where char is unsigned
> -
> -Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197087]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/Source/WebCore/contentextensions/DFACombiner.cpp
> -+++ b/Source/WebCore/contentextensions/DFACombiner.cpp
> -@@ -37,7 +37,7 @@ namespace WebCore {
> - namespace ContentExtensions {
> -
> - class DFAMerger {
> --    typedef MutableRangeList<char, uint64_t, 128> CombinedTransitionsMutableRangeList;
> -+    typedef MutableRangeList<signed char, uint64_t, 128> CombinedTransitionsMutableRangeList;
> -
> -     enum class WhichDFA {
> -         A,
> ---- a/Source/WebCore/contentextensions/NFAToDFA.cpp
> -+++ b/Source/WebCore/contentextensions/NFAToDFA.cpp
> -@@ -41,9 +41,9 @@ namespace WebCore {
> -
> - namespace ContentExtensions {
> -
> --typedef MutableRange<char, NFANodeIndexSet> NFANodeRange;
> --typedef MutableRangeList<char, NFANodeIndexSet> NFANodeRangeList;
> --typedef MutableRangeList<char, NFANodeIndexSet, 128> PreallocatedNFANodeRangeList;
> -+typedef MutableRange<signed char, NFANodeIndexSet> NFANodeRange;
> -+typedef MutableRangeList<signed char, NFANodeIndexSet> NFANodeRangeList;
> -+typedef MutableRangeList<signed char, NFANodeIndexSet, 128> PreallocatedNFANodeRangeList;
> - typedef Vector<uint32_t, 0, ContentExtensionsOverflowHandler> UniqueNodeList;
> - typedef Vector<UniqueNodeList, 0, ContentExtensionsOverflowHandler> NFANodeClosures;
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.1.bb
> similarity index 93%
> rename from meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.26.1.bb
> index 8c695ce9e75..77e51e7d290 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.1.bb
> @@ -17,16 +17,12 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
>             file://x32_support.patch \
>             file://cross-compile.patch \
> -           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>             file://0001-Fix-build-with-musl.patch \
> -           file://detect-gstreamer-gl.patch \
>             file://include_array.patch \
> -           file://narrowing.patch \
> -           file://0001-gstreamer-add-a-missing-format-string.patch \
>             "
>
> -SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"
> -SRC_URI[sha256sum] = "8668b129c026624ec226a4cccf4995f9d26f3e88fc28ab75b0e965f3c32b7dd8"
> +SRC_URI[md5sum] = "08145bd6c1587230f135921c142bc150"
> +SRC_URI[sha256sum] = "6b4b21801d2b1008422a1075dbd6fb4ae8b5127503faf657cf9671289d9cd155"
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> @@ -69,6 +65,7 @@ EXTRA_OECMAKE = " \
>                 ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
>                 -DENABLE_MINIBROWSER=ON \
>                  -DPYTHON_EXECUTABLE=`which python3` \
> +                -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
>                 "
>
>  # Javascript JIT is not supported on ARC
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

