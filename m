Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86E5F719AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 22:56:07 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 3so17755671pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 14:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=5MGfhbDVtrf1Dy+BfUk9ezDn2PeOgRZzltzP+JgUjMM=;
	b=HDnWd/y12bVy/ppuXoCaIzk2O7DM0LPWpVYFYDwrWthDi7kTedLvj6fZV3haSynCu8
	n7zFa6mS2Um/kyvQbNeKkqGKkSlsBLvUNMZUJXGdLDPobewGib0HQLwkeYcfN57BL7KN
	FHzVaRoAJCMGp+HDrtzZvgWrcX9FhpbbhcbchO60C/tS3o/BhY+j6/k55/WLWU8KFCZH
	gxBxQ3dNVKlUVhU3cP3j/pc1oFp7uRGMNYOzP94/Iz0qFp9KrzJWS6ST+klaezCXMDQL
	d8bj2q+M/1hD3YZak1485x3RnvaYex07RTbR94SAOZHxdobKAWtWo/64vQ+m1oPzeuvr
	P58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=5MGfhbDVtrf1Dy+BfUk9ezDn2PeOgRZzltzP+JgUjMM=;
	b=H9nZQPYNvAO9vIW3fAlIS1M9QNMeOdyFJ6XLhctCCdidy3urqdXK5BOisDT7mytHzu
	/GINDg0lmQtfNzabcjMyCGniKmqlLlHc88G9i8gjENjgojlpOXGk8xeW7mdlylkdbxJM
	e1jeu/15GDi8hORVKZPPLXh9VdsiTfmX42aI7EEJY0YNEGCjVjbd/Piq+Exg5bv69pOA
	IrR/nwklQlsBXPUrmjaLfKT/e7m4Ug7bZi8Ir8AlZXm/Ce2ckXVyDcArAhFXT/12tHMm
	cQziMHykrDCauKYXxh4njec4mJowm6MZo7o7629huDG8Tzvu/ahLYop8DVzbRpLq353t
	Z+4Q==
X-Gm-Message-State: AKaTC03rSVZ1avu9wvc71kf74LgtMkIlfhVXUFO/x1SwBrQSuyyTzD8Lwq2BQCziVQNQGw==
X-Received: by 10.98.80.9 with SMTP id e9mr59084967pfb.13.1480978569188;
	Mon, 05 Dec 2016 14:56:09 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w5sm29809563pfl.31.2016.12.05.14.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 14:56:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <D1A701D4-6205-498C-9A83-C65F7542F91E@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 5 Dec 2016 14:56:07 -0800
In-Reply-To: <1478627553-13710-1-git-send-email-clopez@igalia.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
References: <1478627553-13710-1-git-send-email-clopez@igalia.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
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
X-List-Received-Date: Mon, 05 Dec 2016 22:56:08 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_44A32FF3-1CEB-4906-AA47-AF6525844D7F"

--Apple-Mail=_44A32FF3-1CEB-4906-AA47-AF6525844D7F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Carlos

webkitgtk fails now e.g. see

http://errors.yoctoproject.org/Errors/Details/111221/ =
<http://errors.yoctoproject.org/Errors/Details/111221/>

fatal error: 'stdlib.h' file not found
#include_next <stdlib.h>

This is when building with clang, I think its too early to drop this =
patch.=20

> On Nov 8, 2016, at 9:52 AM, Carlos Alberto Lopez Perez =
<clopez@igalia.com> wrote:
>=20
> * This patch is not longer needed. Upstream has fixed this issue in:
>   https://trac.webkit.org/changeset/205672 which is already included
>   in WebKitGTK+ >=3D 2.14.0
>=20
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
> ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 181 =
---------------------
> meta/recipes-sato/webkit/webkitgtk_2.14.1.bb       |   1 -
> 2 files changed, 182 deletions(-)
> delete mode 100644 =
meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-is=
ystem.patch
>=20
> diff --git =
a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch =
b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch
> deleted file mode 100644
> index ef209c8..0000000
> --- =
a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -=46rom 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon Sep 17 00:00:00 =
2001
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
> -/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such =
file or directory
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
> -diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt =
b/Source/JavaScriptCore/shell/CMakeLists.txt
> -index 155c797..80fe22b 100644
> ---- a/Source/JavaScriptCore/shell/CMakeLists.txt
> -+++ b/Source/JavaScriptCore/shell/CMakeLists.txt
> -@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -=20
> - WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
> - include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM =
${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(jsc ${JSC_SOURCES})
> - target_link_libraries(jsc ${JSC_LIBRARIES})
> -=20
> -diff --git a/Source/WebCore/PlatformGTK.cmake =
b/Source/WebCore/PlatformGTK.cmake
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
> -@@ -365,7 +365,7 @@ =
WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCorePlatformGTK)
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
> -diff --git a/Source/WebKit2/PlatformGTK.cmake =
b/Source/WebKit2/PlatformGTK.cmake
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
> -diff --git a/Source/cmake/WebKitMacros.cmake =
b/Source/cmake/WebKitMacros.cmake
> -index 043e78e..8b3b642 100644
> ---- a/Source/cmake/WebKitMacros.cmake
> -+++ b/Source/cmake/WebKitMacros.cmake
> -@@ -224,7 +224,7 @@ endmacro()
> -=20
> - macro(WEBKIT_FRAMEWORK _target)
> -     include_directories(${${_target}_INCLUDE_DIRECTORIES})
> --    include_directories(SYSTEM =
${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -+    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -     add_library(${_target} ${${_target}_LIBRARY_TYPE}
> -         ${${_target}_HEADERS}
> -         ${${_target}_SOURCES}
> -diff --git a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt =
b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -index c431667..6dff244 100644
> ---- a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -+++ b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt
> -@@ -42,7 +42,7 @@ =
set(WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES
> - )
> -=20
> - include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM =
${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})
> =
-+include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIE=
S})
> -=20
> - set(WebKitTestNetscapePlugin_LIBRARIES
> -     ${X11_LIBRARIES}
> -diff --git a/Tools/ImageDiff/CMakeLists.txt =
b/Tools/ImageDiff/CMakeLists.txt
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
> -diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt =
b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -index 0704bc6..619e5a5 100644
> ---- a/Tools/MiniBrowser/gtk/CMakeLists.txt
> -+++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -@@ -58,7 +58,7 @@ endif ()
> - add_definitions(-DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_6)
> -=20
> - include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM =
${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(MiniBrowser ${MiniBrowser_SOURCES})
> - target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
> -=20
> -diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake =
b/Tools/TestWebKitAPI/PlatformGTK.cmake
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
> -diff --git a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt =
b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
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
> -diff --git a/Tools/WebKitTestRunner/CMakeLists.txt =
b/Tools/WebKitTestRunner/CMakeLists.txt
> -index 7db90f2..a4f917f 100644
> ---- a/Tools/WebKitTestRunner/CMakeLists.txt
> -+++ b/Tools/WebKitTestRunner/CMakeLists.txt
> -@@ -116,7 +116,7 @@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES
> - WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -=20
> - include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM =
${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
> -=20
> - add_library(TestRunnerInjectedBundle SHARED =
${WebKitTestRunnerInjectedBundle_SOURCES})
> - target_link_libraries(TestRunnerInjectedBundle =
${WebKitTestRunner_LIBRARIES})
> ---=20
> -2.9.3
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
> index a2586de..69c9f11 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
> @@ -18,7 +18,6 @@ SRC_URI =3D =
"http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>            file://ppc-musl-fix.patch \
>            =
file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
>            =
file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
> -           =
file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>            "
>=20
> SRC_URI[md5sum] =3D "8d6c60dc41604d3bbd43165a674c07e5"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_44A32FF3-1CEB-4906-AA47-AF6525844D7F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Carlos<div class=3D""><br class=3D""></div><div =
class=3D"">webkitgtk fails now e.g. see</div><div class=3D""><br =
class=3D""></div><div class=3D""><a =
href=3D"http://errors.yoctoproject.org/Errors/Details/111221/" =
class=3D"">http://errors.yoctoproject.org/Errors/Details/111221/</a></div>=
<div class=3D""><br class=3D""></div><div class=3D""><div class=3D"">fatal=
 error: 'stdlib.h' file not found</div><div class=3D"">#include_next =
&lt;stdlib.h&gt;</div></div><div class=3D""><br class=3D""></div><div =
class=3D"">This is when building with clang, I think its too early to =
drop this patch.&nbsp;</div><div class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Nov 8, 2016, at 9:52 AM, Carlos Alberto Lopez Perez &lt;<a =
href=3D"mailto:clopez@igalia.com" class=3D"">clopez@igalia.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D""> * This patch is not longer needed. Upstream has fixed this =
issue in:<br class=3D""> &nbsp;&nbsp;<a =
href=3D"https://trac.webkit.org/changeset/205672" =
class=3D"">https://trac.webkit.org/changeset/205672</a> which is already =
included<br class=3D""> &nbsp;&nbsp;in WebKitGTK+ &gt;=3D 2.14.0<br =
class=3D""><br class=3D"">Signed-off-by: Carlos Alberto Lopez Perez =
&lt;<a href=3D"mailto:clopez@igalia.com" =
class=3D"">clopez@igalia.com</a>&gt;<br class=3D"">---<br class=3D""> =
...bKitMacros-Append-to-I-and-not-to-isystem.patch | 181 =
---------------------<br class=3D""> =
meta/recipes-sato/webkit/webkitgtk_2.14.1.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;1 -<br class=3D""> 2 =
files changed, 182 deletions(-)<br class=3D""> delete mode 100644 =
meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-is=
ystem.patch<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch =
b/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch<br class=3D"">deleted file mode 100644<br class=3D"">index =
ef209c8..0000000<br class=3D"">--- =
a/meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-=
isystem.patch<br class=3D"">+++ /dev/null<br class=3D"">@@ -1,181 +0,0 =
@@<br class=3D"">-=46rom 20ee11dd188e1538f8cdd17a289dc6f9c63a011e Mon =
Sep 17 00:00:00 2001<br class=3D"">-From: Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">-Date: Sun, 17 Apr =
2016 12:35:41 -0700<br class=3D"">-Subject: [PATCH] WebKitMacros: Append =
to -I and not to -isystem<br class=3D"">-<br class=3D"">-gcc-6 has now =
introduced stdlib.h in libstdc++ for better<br class=3D"">-compliance =
and its including the C library stdlib.h using<br class=3D"">-include_next=
 which is sensitive to order of system header<br class=3D"">-include =
paths. Its infact better to not tinker with the<br class=3D"">-system =
header include paths at all. Since adding /usr/include<br class=3D"">-to =
-system is redundant and compiler knows about it moreover<br =
class=3D"">-now with gcc6 it interferes with compiler's functioning<br =
class=3D"">-and ends up with compile errors e.g.<br class=3D"">-<br =
class=3D"">-/usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: =
No such file or directory<br class=3D"">-<br class=3D"">-Signed-off-by: =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">-Upstream-Status: =
Pending<br class=3D"">----<br class=3D"">- =
Source/JavaScriptCore/shell/CMakeLists.txt =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
2 +-<br class=3D"">- Source/WebCore/PlatformGTK.cmake =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 6 +++---<br =
class=3D"">- Source/WebKit2/PlatformGTK.cmake =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br =
class=3D"">- Source/cmake/WebKitMacros.cmake =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 =
+-<br class=3D"">- =
Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt | 2 +-<br =
class=3D"">- Tools/ImageDiff/CMakeLists.txt =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
2 +-<br class=3D"">- Tools/MiniBrowser/gtk/CMakeLists.txt =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">- =
Tools/TestWebKitAPI/PlatformGTK.cmake =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">- =
Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt &nbsp;&nbsp;&nbsp;| =
2 +-<br class=3D"">- Tools/WebKitTestRunner/CMakeLists.txt =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">- 10 files changed, 12 =
insertions(+), 12 deletions(-)<br class=3D"">-<br class=3D"">-diff --git =
a/Source/JavaScriptCore/shell/CMakeLists.txt =
b/Source/JavaScriptCore/shell/CMakeLists.txt<br class=3D"">-index =
155c797..80fe22b 100644<br class=3D"">---- =
a/Source/JavaScriptCore/shell/CMakeLists.txt<br class=3D"">-+++ =
b/Source/JavaScriptCore/shell/CMakeLists.txt<br class=3D"">-@@ -20,7 =
+20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()<br class=3D"">- <br =
class=3D"">- WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})<br class=3D"">- =
include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})<br =
class=3D"">--include_directories(SYSTEM =
${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})<br =
class=3D"">-+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORI=
ES})<br class=3D"">- add_executable(jsc ${JSC_SOURCES})<br class=3D"">- =
target_link_libraries(jsc ${JSC_LIBRARIES})<br class=3D"">- <br =
class=3D"">-diff --git a/Source/WebCore/PlatformGTK.cmake =
b/Source/WebCore/PlatformGTK.cmake<br class=3D"">-index 567bd79..1fabea8 =
100644<br class=3D"">---- a/Source/WebCore/PlatformGTK.cmake<br =
class=3D"">-+++ b/Source/WebCore/PlatformGTK.cmake<br class=3D"">-@@ =
-340,7 +340,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GTK2_INCLUDE_DIRS}<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GDK2_INCLUDE_DIRS}<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;)<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;target_include_directories(WebCorePlatformGTK2 SYSTEM =
PRIVATE<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;target_include_directories(WebCorePlatformGTK2 =
PRIVATE<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${WebCore_SYSTEM_INCLUDE_D=
IRECTORIES}<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;target_link_libraries(WebCorePlatformGTK2<br =
class=3D"">-@@ -365,7 +365,7 @@ =
WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCorePlatformGTK)<br class=3D"">- =
target_include_directories(WebCorePlatformGTK PRIVATE<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${WebCore_INCLUDE_DIRECTORIES}<br class=3D"">- =
)<br class=3D"">--target_include_directories(WebCorePlatformGTK SYSTEM =
PRIVATE<br class=3D"">-+target_include_directories(WebCorePlatformGTK =
PRIVATE<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${WebCore_SYSTEM_INCLUDE_DIRECTORIES}<br =
class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;${GTK_INCLUDE_DIRS}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GDK_INCLUDE_DIRS}<br class=3D"">-@@ -383,7 =
+383,7 @@ include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;"${DERIVED_SOURCES_GOBJECT_DOM_BINDINGS_DIR}"<br =
class=3D"">- )<br class=3D"">- <br =
class=3D"">--include_directories(SYSTEM<br =
class=3D"">-+include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${WebCore_SYSTEM_INCLUDE_DIRECTORIES}<br =
class=3D"">- )<br class=3D"">- <br class=3D"">-diff --git =
a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK.cmake<br =
class=3D"">-index e4805a4..c57df5d 100644<br class=3D"">---- =
a/Source/WebKit2/PlatformGTK.cmake<br class=3D"">-+++ =
b/Source/WebKit2/PlatformGTK.cmake<br class=3D"">-@@ -822,7 +822,7 @@ if =
(ENABLE_PLUGIN_PROCESS_GTK2)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;target_include_directories(WebKitPluginProcess2 =
PRIVATE<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${WebKit2CommonIncludeDire=
ctories}<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;)<br class=3D"">-- =
&nbsp;&nbsp;&nbsp;target_include_directories(WebKitPluginProcess2 SYSTEM =
PRIVATE<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;target_include_directories(WebKitPluginProcess2 =
PRIVATE<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${WebKit2CommonSyste=
mIncludeDirectories}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GTK2_INCLUDE_DIRS}=
<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${GDK2_INCLUDE_DIRS}=
<br class=3D"">-diff --git a/Source/cmake/WebKitMacros.cmake =
b/Source/cmake/WebKitMacros.cmake<br class=3D"">-index 043e78e..8b3b642 =
100644<br class=3D"">---- a/Source/cmake/WebKitMacros.cmake<br =
class=3D"">-+++ b/Source/cmake/WebKitMacros.cmake<br class=3D"">-@@ =
-224,7 +224,7 @@ endmacro()<br class=3D"">- <br class=3D"">- =
macro(WEBKIT_FRAMEWORK _target)<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;include_directories(${${_target}_INCLUDE_DIRECTORI=
ES})<br class=3D"">-- &nbsp;&nbsp;&nbsp;include_directories(SYSTEM =
${${_target}_SYSTEM_INCLUDE_DIRECTORIES})<br class=3D"">-+ =
&nbsp;&nbsp;&nbsp;include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTOR=
IES})<br class=3D"">- &nbsp;&nbsp;&nbsp;&nbsp;add_library(${_target} =
${${_target}_LIBRARY_TYPE}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${${_target}_HEADERS}<br =
class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${${_target}_SOURCES}<br =
class=3D"">-diff --git =
a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt =
b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt<br =
class=3D"">-index c431667..6dff244 100644<br class=3D"">---- =
a/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt<br =
class=3D"">-+++ =
b/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.txt<br class=3D"">-@@=
 -42,7 +42,7 @@ =
set(WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES<br class=3D"">- =
)<br class=3D"">- <br class=3D"">- =
include_directories(${WebKitTestNetscapePlugin_INCLUDE_DIRECTORIES})<br =
class=3D"">--include_directories(SYSTEM =
${WebKitTestNetscapePlugin_SYSTEM_INCLUDE_DIRECTORIES})<br =
class=3D"">-+include_directories(${WebKitTestNetscapePlugin_SYSTEM_INCLUDE=
_DIRECTORIES})<br class=3D"">- <br class=3D"">- =
set(WebKitTestNetscapePlugin_LIBRARIES<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${X11_LIBRARIES}<br class=3D"">-diff --git =
a/Tools/ImageDiff/CMakeLists.txt b/Tools/ImageDiff/CMakeLists.txt<br =
class=3D"">-index b15443f..87e03bf 100644<br class=3D"">---- =
a/Tools/ImageDiff/CMakeLists.txt<br class=3D"">-+++ =
b/Tools/ImageDiff/CMakeLists.txt<br class=3D"">-@@ -14,6 +14,6 @@ =
set(IMAGE_DIFF_LIBRARIES<br class=3D"">- =
WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()<br class=3D"">- <br class=3D"">- =
include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})<br =
class=3D"">--include_directories(SYSTEM =
${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})<br =
class=3D"">-+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})=
<br class=3D"">- add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})<br =
class=3D"">- target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})<br =
class=3D"">-diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt =
b/Tools/MiniBrowser/gtk/CMakeLists.txt<br class=3D"">-index =
0704bc6..619e5a5 100644<br class=3D"">---- =
a/Tools/MiniBrowser/gtk/CMakeLists.txt<br class=3D"">-+++ =
b/Tools/MiniBrowser/gtk/CMakeLists.txt<br class=3D"">-@@ -58,7 +58,7 @@ =
endif ()<br class=3D"">- =
add_definitions(-DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_6)<br =
class=3D"">- <br class=3D"">- =
include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})<br =
class=3D"">--include_directories(SYSTEM =
${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})<br =
class=3D"">-+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES}=
)<br class=3D"">- add_executable(MiniBrowser ${MiniBrowser_SOURCES})<br =
class=3D"">- target_link_libraries(MiniBrowser =
${MiniBrowser_LIBRARIES})<br class=3D"">- <br class=3D"">-diff --git =
a/Tools/TestWebKitAPI/PlatformGTK.cmake =
b/Tools/TestWebKitAPI/PlatformGTK.cmake<br class=3D"">-index =
7552cc2..2eb44d5 100644<br class=3D"">---- =
a/Tools/TestWebKitAPI/PlatformGTK.cmake<br class=3D"">-+++ =
b/Tools/TestWebKitAPI/PlatformGTK.cmake<br class=3D"">-@@ -20,7 +20,7 @@ =
include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${WEBKIT2_DIR}/UIProcess/API/gtk<br class=3D"">- =
)<br class=3D"">- <br class=3D"">--include_directories(SYSTEM<br =
class=3D"">-+include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GDK3_INCLUDE_DIRS}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GLIB_INCLUDE_DIRS}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GTK3_INCLUDE_DIRS}<br class=3D"">-diff --git =
a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt =
b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt<br class=3D"">-index=
 b0b4739..434e4ca 100644<br class=3D"">---- =
a/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt<br class=3D"">-+++ =
b/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt<br class=3D"">-@@ =
-23,7 +23,7 @@ include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk<br =
class=3D"">- )<br class=3D"">- <br =
class=3D"">--include_directories(SYSTEM<br =
class=3D"">-+include_directories(<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${ATSPI_INCLUDE_DIRS}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GLIB_INCLUDE_DIRS}<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;${GSTREAMER_INCLUDE_DIRS}<br class=3D"">-diff =
--git a/Tools/WebKitTestRunner/CMakeLists.txt =
b/Tools/WebKitTestRunner/CMakeLists.txt<br class=3D"">-index =
7db90f2..a4f917f 100644<br class=3D"">---- =
a/Tools/WebKitTestRunner/CMakeLists.txt<br class=3D"">-+++ =
b/Tools/WebKitTestRunner/CMakeLists.txt<br class=3D"">-@@ -116,7 +116,7 =
@@ GENERATE_BINDINGS(WebKitTestRunner_SOURCES<br class=3D"">- =
WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()<br class=3D"">- <br class=3D"">- =
include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})<br =
class=3D"">--include_directories(SYSTEM =
${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})<br =
class=3D"">-+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTO=
RIES})<br class=3D"">- <br class=3D"">- =
add_library(TestRunnerInjectedBundle SHARED =
${WebKitTestRunnerInjectedBundle_SOURCES})<br class=3D"">- =
target_link_libraries(TestRunnerInjectedBundle =
${WebKitTestRunner_LIBRARIES})<br class=3D"">--- <br class=3D"">-2.9.3<br =
class=3D"">-<br class=3D"">diff --git =
a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb<br class=3D"">index =
a2586de..69c9f11 100644<br class=3D"">--- =
a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb<br class=3D"">+++ =
b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb<br class=3D"">@@ -18,7 =
+18,6 @@ SRC_URI =3D "<a =
href=3D"http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz" =
class=3D"">http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> =
\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///ppc-musl-fix.patch" =
class=3D"">file://ppc-musl-fix.patch</a> \<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch" =
class=3D"">file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch</a=
> \<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.=
patch" =
class=3D"">file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-wor=
k.patch</a> \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch" =
class=3D"">file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch</=
a> \<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"<br =
class=3D""><br class=3D""> SRC_URI[md5sum] =3D =
"8d6c60dc41604d3bbd43165a674c07e5"<br class=3D"">-- <br =
class=3D"">2.1.4<br class=3D""><br class=3D"">-- <br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_44A32FF3-1CEB-4906-AA47-AF6525844D7F--
