Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D440971B04;
	Wed, 17 May 2017 09:00:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so1890648wmf.1;
	Wed, 17 May 2017 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cL3Hx/I7q6A/yPGyOggkR3Hab1HDORbIqM/p2O3f7ro=;
	b=Y6sEFg0v2+MiKecIu/jPu+kJoQLDp9rpZiw9L16d4Af9wCpHVe9jE8BNTUZUHLh/6i
	LVJl9anQWYxtmyQ/0j8kShlcn4ksd5RyG+Jhh0mjXz3S+gxSQCb4DtO5eFFsOFrljqAI
	KOR24EKpkTyRXQlifsdt1aQ/Bu0LsTSQGEd9C6f0VZxo3+ulqbGteLfF7bM9fkuyA0Ya
	t10PBvB6Z+IYX1/MxGHUgp9NwfsSRcOC3sGWdqmc3EZ1XBZzpk3Xy7YTyV9qSZ61qKEN
	/qPdRLX2pgR19mrK/Yn6T2Rz+OGu8Hyv9iAQNHGflx2mUwQfGTGNduXLbrvXj1pP5pRZ
	l83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cL3Hx/I7q6A/yPGyOggkR3Hab1HDORbIqM/p2O3f7ro=;
	b=TRe9bT3c/R1OJvPQ7UR7mZoOF2DX7ys0BFiqqyRWtbsl/kDX9NnZxktfR5pz/WanLs
	paNDA3AXbtEUtZW70JwI4/PyWCVEWUPjw2RAPFNvPz+b2iH3vENEuA8TLFjNkV1h57lA
	Dz41R4nEA9ElWmpcG5MX2yvG9oAWQzpfIkK6ntvfjULr3QESsbs55+gKaK+H+sLRg/4K
	axmMXGvAGh4TtVI0h2pMxB8AIfa3R6AxHNDZPCpNXDVXN8/1+so3hcQlDVSBHFn1lug0
	EE1V9AZHy1lpnFheYmD7UA5fGPoxrOC31vx8Vaz7YtEnoEX0Jm8VX1wkeOYsiJYXfRJm
	7Nsw==
X-Gm-Message-State: AODbwcAjSvFLP9w6MsLNQozoDo2c+HHCvuzSHgBTHC+wOogdxjy72SVz
	MxENI/+vQYz5P8ri
X-Received: by 10.28.227.4 with SMTP id a4mr1546165wmh.102.1495011632661;
	Wed, 17 May 2017 02:00:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t85sm2661533wmt.23.2017.05.17.02.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 May 2017 02:00:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 May 2017 11:01:23 +0200
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20170517090123.GD3086@jama>
References: <149457549445.7611.8970581482009236@git.openembedded.org>
	<20170512075134.EFCC22380E8@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170512075134.EFCC22380E8@git.openembedded.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 05/19: webkitgtk: Upgrade to 2.16.1
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
X-List-Received-Date: Wed, 17 May 2017 09:00:32 -0000
X-Groupsio-MsgNum: 97394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LKTjZJSUETSlgu2t"
Content-Disposition: inline

--LKTjZJSUETSlgu2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2017 at 07:51:39AM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch master
> in repository openembedded-core.

Seems to fail for qemuarm:
http://errors.yoctoproject.org/Errors/Details/142779/

>=20
> commit bfbdd1a2069f199be9ba0909dd512469ff17b65e
> Author: Khem Raj <raj.khem@gmail.com>
> AuthorDate: Fri Apr 21 08:09:12 2017 -0700
>=20
>     webkitgtk: Upgrade to 2.16.1
>    =20
>     Fix build with gcc7
>     Move all patches to webkit folder
>     Drop patches that were backports or have been upstreamed
>    =20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 185 ---------------=
------
>  .../recipes-sato/webkit/files/detect_atomics.patch |  38 -----
>  ...Introspection.cmake-prefix-variables-obta.patch |   0
>  ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |   0
>  ...cmake-drop-the-hardcoded-introspection-gt.patch |   0
>  ...c-settings-so-that-gtkdoc-generation-work.patch |   0
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |   0
>  .../{files =3D> webkitgtk}/cross-compile.patch       |   0
>  meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 +++
>  .../webkit/{files =3D> webkitgtk}/musl-fixes.patch   |   0
>  .../webkit/{files =3D> webkitgtk}/ppc-musl-fix.patch |   0
>  .../webkit/webkitgtk/x32_support.patch             |  13 +-
>  .../{webkitgtk_2.14.5.bb =3D> webkitgtk_2.16.1.bb}   |   8 +-
>  13 files changed, 32 insertions(+), 235 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I=
-and-not-to-isystem.patch b/meta/recipes-sato/webkit/files/0001-WebKitMacro=
s-Append-to-I-and-not-to-isystem.patch
> deleted file mode 100644
> index a4face2..0000000
> --- a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-no=
t-to-isystem.patch
> +++ /dev/null
> @@ -1,185 +0,0 @@
> -From 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon Sep 17 00:00:00 2001
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
> -/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such fil=
e or directory
> -
> -This is also an issue with clang (when using libstdc++ >=3D 6)
> -
> -Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=3D161697
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> ----
> - Source/JavaScriptCore/shell/CMakeLists.txt             | 2 +-
> - Source/WebCore/PlatformGTK.cmake                       | 6 +++---
> - Source/WebKit2/PlatformGTK.cmake                       | 2 +-
> - Source/cmake/WebKitMacros.cmake                        | 2 +-
> - Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt | 2 +-
> - Tools/ImageDiff/CMakeLists.txt                         | 2 +-
> - Tools/MiniBrowser/gtk/CMakeLists.txt                   | 2 +-
> - Tools/TestWebKitAPI/PlatformGTK.cmake                  | 2 +-
> - Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt    | 2 +-
> - Tools/WebKitTestRunner/CMakeLists.txt                  | 2 +-
> - 10 files changed, 12 insertions(+), 12 deletions(-)
> -
> -diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScr=
iptCore/shell/CMakeLists.txt
> -index 155c797..80fe22b 100644
> ---- a/Source/JavaScriptCore/shell/CMakeLists.txt
> -+++ b/Source/JavaScriptCore/shell/CMakeLists.txt
> -@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -=20
> - WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
> - include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(jsc ${JSC_SOURCES})
> - target_link_libraries(jsc ${JSC_LIBRARIES})
> -=20
> -diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformG=
TK.cmake
> -index 567bd79..1fabea8 100644
> ---- a/Source/WebCore/PlatformGTK.cmake
> -+++ b/Source/WebCore/PlatformGTK.cmake
> -@@ -340,7 +340,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> -         ${GTK2_INCLUDE_DIRS}
> -         ${GDK2_INCLUDE_DIRS}
> -     )
> --    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
> -+    target_include_directories(WebCorePlatformGTK2 PRIVATE
> -         ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> -     )
> -     target_link_libraries(WebCorePlatformGTK2
> -@@ -365,7 +365,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCorePlatformGTK)
> - target_include_directories(WebCorePlatformGTK PRIVATE
> -     ${WebCore_INCLUDE_DIRECTORIES}
> - )
> --target_include_directories(WebCorePlatformGTK SYSTEM PRIVATE
> -+target_include_directories(WebCorePlatformGTK PRIVATE
> -     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> -     ${GTK_INCLUDE_DIRS}
> -     ${GDK_INCLUDE_DIRS}
> -@@ -383,7 +383,7 @@ include_directories(
> -     "${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"
> - )
> -=20
> --include_directories(SYSTEM
> -+include_directories(
> -     ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> - )
> -=20
> -diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformG=
TK.cmake
> -index e4805a4..c57df5d 100644
> ---- a/Source/WebKit2/PlatformGTK.cmake
> -+++ b/Source/WebKit2/PlatformGTK.cmake
> -@@ -822,7 +822,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> -     target_include_directories(WebKitPluginProcess2 PRIVATE
> -         ${WebKit2CommonIncludeDirectories}
> -     )
> --    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
> -+    target_include_directories(WebKitPluginProcess2 PRIVATE
> -          ${WebKit2CommonSystemIncludeDirectories}
> -          ${GTK2_INCLUDE_DIRS}
> -          ${GDK2_INCLUDE_DIRS}
> -diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros=
=2Ecmake
> -index 043e78e..8b3b642 100644
> ---- a/Source/cmake/WebKitMacros.cmake
> -+++ b/Source/cmake/WebKitMacros.cmake
> -@@ -224,7 +224,7 @@ endmacro()
> -=20
> - macro(WEBKIT_FRAMEWORK _target)
> -     include_directories(${${_target}_INCLUDE_DIRECTORIES})
> --    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -+    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -     add_library(${_target} ${${_target}_LIBRARY_TYPE}
> -         ${${_target}_HEADERS}
> -         ${${_target}_SOURCES}
> -diff --git a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt b/To=
ols/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -index c431667..6dff244 100644
> ---- a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -+++ b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES
> - )
> -=20
> - include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DI=
RECTORIES})
> -+include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORI=
ES})
> -=20
> - set(WebKitTestNetscapePlugin_LIBRARIES
> -     ${X11_LIBRARIES}
> -diff --git a/Tools/ImageDiff/CMakeLists.txt b/Tools/ImageDiff/CMakeLists=
=2Etxt
> -index b15443f..87e03bf 100644
> ---- a/Tools/ImageDiff/CMakeLists.txt
> -+++ b/Tools/ImageDiff/CMakeLists.txt
> -@@ -14,6 +14,6 @@ set(IMAGE_DIFF_LIBRARIES
> - WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -=20
> - include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
> - target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
> -diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gt=
k/CMakeLists.txt
> -index 0704bc6..619e5a5 100644
> ---- a/Tools/MiniBrowser/gtk/CMakeLists.txt
> -+++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -@@ -58,7 +58,7 @@ endif ()
> - add_definitions(-DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_6)
> -=20
> - include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(MiniBrowser ${MiniBrowser_SOURCES})
> - target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
> -=20
> -diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI=
/PlatformGTK.cmake
> -index 7552cc2..2eb44d5 100644
> ---- a/Tools/TestWebKitAPI/PlatformGTK.cmake
> -+++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
> -@@ -20,7 +20,7 @@ include_directories(
> -     ${WEBKIT2_DIR}/UIProcess/API/gtk
> - )
> -=20
> --include_directories(SYSTEM
> -+include_directories(
> -     ${GDK3_INCLUDE_DIRS}
> -     ${GLIB_INCLUDE_DIRS}
> -     ${GTK3_INCLUDE_DIRS}
> -diff --git a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt b/Tools=
/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
> -index b0b4739..434e4ca 100644
> ---- a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
> -+++ b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
> -@@ -23,7 +23,7 @@ include_directories(
> -     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
> - )
> -=20
> --include_directories(SYSTEM
> -+include_directories(
> -     ${ATSPI_INCLUDE_DIRS}
> -     ${GLIB_INCLUDE_DIRS}
> -     ${GSTREAMER_INCLUDE_DIRS}
> -diff --git a/Tools/WebKitTestRunner/CMakeLists.txt b/Tools/WebKitTestRun=
ner/CMakeLists.txt
> -index 7db90f2..a4f917f 100644
> ---- a/Tools/WebKitTestRunner/CMakeLists.txt
> -+++ b/Tools/WebKitTestRunner/CMakeLists.txt
> -@@ -116,7 +116,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES
> - WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -=20
> - include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIE=
S})
> -+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
> -=20
> - add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedB=
undle_SOURCES})
> - target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRA=
RIES})
> ---=20
> -2.9.3
> -
> diff --git a/meta/recipes-sato/webkit/files/detect_atomics.patch b/meta/r=
ecipes-sato/webkit/files/detect_atomics.patch
> deleted file mode 100644
> index c4e80a7..0000000
> --- a/meta/recipes-sato/webkit/files/detect_atomics.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Sourced from https://bugs.webkit.org/show_bug.cgi?id=3D161900
> -
> -on arm fixes
> -
> -| /usr/src/debug/libgcc/6.2.0-r0/gcc-6.2.0/build.arm-oe-linux-gnueabi.ar=
m-oe-linux-gnueabi/libgcc/../../../../../../../work-shared/gcc-6.2.0-r0/gcc=
-6.2.0/libgcc/config/arm/linux-atomic-64bit.c:117: multiple definition of `=
__sync_sub_and_fetch_8'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Backport
> -
> -diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.t=
xt
> -index 867999e..ea69322 100644
> ---- a/Source/WTF/wtf/CMakeLists.txt
> -+++ b/Source/WTF/wtf/CMakeLists.txt
> -@@ -171,7 +171,6 @@ set(WTF_HEADERS
> -=20
> - set(WTF_SOURCES
> -     Assertions.cpp
> --    Atomics.cpp
> -     BitVector.cpp
> -     CompilationThread.cpp
> -     CrossThreadCopier.cpp
> -@@ -276,6 +275,15 @@ if (NOT USE_SYSTEM_MALLOC)
> -     list(APPEND WTF_LIBRARIES bmalloc)
> - endif ()
> -=20
> -+file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
> -+     "int main(void)\n"
> -+     "{ long long x =3D 1; return (int) __sync_add_and_fetch_8(&x, 1); =
}\n")
> -+try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_=
DIR}/test_atomics.cpp)
> -+if (NOT ATOMICS_BUILD_SUCCEEDED)
> -+    list(APPEND WTF_SOURCES Atomics.cpp)
> -+endif ()
> -+file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
> -+
> - list(APPEND WTF_SOURCES
> -     unicode/icu/CollatorICU.cpp
> - )
> diff --git a/meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection=
=2Ecmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0=
001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.=
cmake-prefix-variables-obta.patch
> rename to meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospectio=
n.cmake-prefix-variables-obta.patch
> diff --git a/meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-=
of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy=
-parallel-build-of-WebKit2-4.0.gir.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-o=
f-WebKit2-4.0.gir.patch
> rename to meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build=
-of-WebKit2-4.0.gir.patch
> diff --git a/meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-th=
e-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/000=
1-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the=
-hardcoded-introspection-gt.patch
> rename to meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-t=
he-hardcoded-introspection-gt.patch
> diff --git a/meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so=
-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/000=
1-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/0001-Tweak-gtkdoc-settings-so-=
that-gtkdoc-generation-work.patch
> rename to meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-s=
o-that-gtkdoc-generation-work.patch
> diff --git a/meta/recipes-sato/webkit/files/0001-When-building-introspect=
ion-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/000=
1-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/0001-When-building-introspecti=
on-files-add-CMAKE_C_FLAGS-.patch
> rename to meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspec=
tion-files-add-CMAKE_C_FLAGS-.patch
> diff --git a/meta/recipes-sato/webkit/files/cross-compile.patch b/meta/re=
cipes-sato/webkit/webkitgtk/cross-compile.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/cross-compile.patch
> rename to meta/recipes-sato/webkit/webkitgtk/cross-compile.patch
> diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch b/meta/recipes=
-sato/webkit/webkitgtk/gcc7.patch
> new file mode 100644
> index 0000000..aee29a9
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
> @@ -0,0 +1,23 @@
> +Imported from
> +https://src.fedoraproject.org/cgit/rpms/webkitgtk4.git/plain/gcc7.patch
> +
> +Add to CXX flags since webkitgtk uses c++ compiler by default
> +Fixes
> +Source/JavaScriptCore/runtime/JSGenericTypedArrayView.h:119:67: error: n=
o matching function for call to 'JSC::JSGenericTypedArrayView<Adaptor>::vec=
tor() const'
> +|          return bitwise_cast<const typename Adaptor::Type*>(vector());
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com
> +Upstream-Status: Pending
> +
> +diff -up webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7 webkitg=
tk-2.15.90/Source/cmake/OptionsCommon.cmake
> +--- webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7	2017-02-21 0=
9:57:13.168916004 +0100
> ++++ webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake	2017-02-21 09:58:=
12.811563156 +0100
> +@@ -41,6 +41,8 @@ if (COMPILER_IS_GCC_OR_CLANG)
> +     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-ali=
asing")
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict=
-aliasing -fno-rtti")
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=3Dc++1y")
> ++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-expansion-to-defined")
> ++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-expansion-to-defined")
> + endif ()
> +=20
> + if (COMPILER_IS_CLANG AND CMAKE_GENERATOR STREQUAL "Ninja")
> diff --git a/meta/recipes-sato/webkit/files/musl-fixes.patch b/meta/recip=
es-sato/webkit/webkitgtk/musl-fixes.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/musl-fixes.patch
> rename to meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
> diff --git a/meta/recipes-sato/webkit/files/ppc-musl-fix.patch b/meta/rec=
ipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
> similarity index 100%
> rename from meta/recipes-sato/webkit/files/ppc-musl-fix.patch
> rename to meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
> diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/=
recipes-sato/webkit/webkitgtk/x32_support.patch
> index fea4c27..5f23837 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
> @@ -3,11 +3,11 @@ Subject: Fix FTBFS in x32
>  Bug-Debian: https://bugs.debian.org/700795
>  Upstream-Status: Pending
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Index: webkitgtk/Source/WTF/wtf/Platform.h
> +Index: webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk.orig/Source/WTF/wtf/Platform.h
> -+++ webkitgtk/Source/WTF/wtf/Platform.h
> -@@ -182,8 +182,12 @@
> +--- webkitgtk-2.16.1.orig/Source/WTF/wtf/Platform.h
> ++++ webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
> +@@ -172,7 +172,11 @@
>   /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
>   #if   defined(__x86_64__) \
>       || defined(_M_X64)
> @@ -15,8 +15,7 @@ Index: webkitgtk/Source/WTF/wtf/Platform.h
>  +#define WTF_CPU_X86_64_32 1
>  +#else
>   #define WTF_CPU_X86_64 1
> - #endif
>  +#endif
> + #define WTF_CPU_X86_SSE2 1
> + #endif
>  =20
> - /* CPU(ARM64) - Apple */
> - #if (defined(__arm64__) && defined(__APPLE__)) || defined(__aarch64__)
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.16.1.bb
> similarity index 95%
> rename from meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
> index daa17a9..4443a59 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
> @@ -17,14 +17,12 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://ppc-musl-fix.patch \
>             file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
>             file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-w=
ork.patch \
> -           file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch=
 \
> -           file://detect_atomics.patch \
>             file://x32_support.patch \
>             file://cross-compile.patch \
> +           file://gcc7.patch \
>             "
> -
> -SRC_URI[md5sum] =3D "7fe3cb2699e64f969b285823c5ae2516"
> -SRC_URI[sha256sum] =3D "3ca8f1c33a9b43d6c753dcac1c0788656930e06382b10fdf=
5c2805ea8f96369f"
> +SRC_URI[md5sum] =3D "d3bcf995a667fd9febb9ab991acf0ca7"
> +SRC_URI[sha256sum] =3D "eb92383232328ce655b703c64370ed3795662479719ad1b4=
a869ed46769d2945"
> =20
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features=
_check upstream-version-is-even gtk-doc
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LKTjZJSUETSlgu2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRwRYgAKCRA3VSO3ZXaA
HHmQAJ9gTFpo4oFE7hoPLtnQt3IcrrIW/gCeMJ0jEHyAt6IgjC6+pYoqLW5aGr0=
=RxGS
-----END PGP SIGNATURE-----

--LKTjZJSUETSlgu2t--
