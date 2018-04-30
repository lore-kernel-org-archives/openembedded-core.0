Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 223DA71984
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 00:43:59 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f189so5448735pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 17:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D1leN/06xvwthjlqRGt8pmAFf7yrZig4RkYtZcUx+qo=;
	b=j5LtWoKYk/mb3YckIBMFxT/YiOJTrBQPTgvXJghyBOMTd4es/OJEkYDSXDX3654y8P
	3YQjNuFbVHuUjhrAMu+vHpE2AEjmN+I0Ow6D2Rrn3/FH6AffAIPDQfpbVF+FEXnC3/og
	rfZaerLylhYhZElYJb/iQa1gmGv2JdgPAgV93Jx9alR+ss7YcPL7ylpiXi98LHMZLcfR
	+QtbjAPKPf6Jw64YZNTxptqtFHJRZwcnffkIHhMRcyXJ/+fK70Cesov3tI8f9utMvrXn
	PzRtuDlRAgZO0fZe7jaj8dNGDIqIRiX6vjGvcvS3dWFAcMjk9Q0hYvLefex9n3jN74of
	ZHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D1leN/06xvwthjlqRGt8pmAFf7yrZig4RkYtZcUx+qo=;
	b=HxCN/IbGUPLM3KFUiqfGkFSw/+rQaKMZvP5v/vT5VDrV2z+HvdziMIIIeXZJOib17C
	Y//ZJ374Q3wWerNtdHR8N7+5g9T4k7Y4u5HthRMs+KOn/zWVxlIPq7/dmSQKd3dOsv83
	3pFiroD7j1GpZ6MVjolmsItJceizJeBT+20o12NVwfIdBTGo9dPpXDMTDm2uUHTY2gTw
	huqabHF0VyfYAGlKxQy8QW8pdsy/WDb961icYJ2nTmjVm0dZNiqG18lsVuIMffjrW4L3
	vKvpwJGX/3OlE9svP65EB0mYRl1IUnQazPk5HAE5eqUY7xxLXQglFW8uKQwH/65bRAq3
	RVqw==
X-Gm-Message-State: ALQs6tB9NXF8BWxjDA7H8JOGcCy3BhSU6n2kyzrnqMT323adkRWS6Pbe
	VUThQZNYj4crgR2dEI4nxqFIx6JkrwOBe5azqGg=
X-Google-Smtp-Source: AB8JxZpZ/NC68me5BSVR6C2UyFnzZVIrTo7T/wHgkW7XIRJ6LhRr0w1mx6TlJbV022aLPEH2ME0D8q63vm1qgpfD6mo=
X-Received: by 2002:a63:7547:: with SMTP id
	f7-v6mr8781706pgn.204.1525049040718; 
	Sun, 29 Apr 2018 17:44:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Sun, 29 Apr 2018 17:43:30 -0700 (PDT)
In-Reply-To: <20180404111321.10824-9-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-9-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2018 17:43:30 -0700
Message-ID: <CAMKF1sphcVNwqPgZfuK5iByfEmQ+9KuS5AwMVYsai57Shpg_xA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/22] webkitgtk: update to 2.20.0
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
X-List-Received-Date: Mon, 30 Apr 2018 00:44:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 4:13 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Rebase patches, remove a couple of upstreamed patches.
>
> Add an option to enable woff2 font library (not currently packaged by oe).
>

2.20.1 patch release is available since this patch was posted. Since
this patch is still
in staging, it would be nicer if it was rebased to use 2.20.1

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../webkitgtk/0001-Fix-build-with-musl.patch       | 28 +++++-----
>  ...01-Fix-gles3-header-when-gles2-is-enabled.patch | 38 -------------
>  ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch | 63 +++++++++++-----------
>  ...cmake-drop-the-hardcoded-introspection-gt.patch | 15 +++---
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 52 +++++++++---------
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch | 47 ++++++++--------
>  .../detect-atomics-during-configure.patch          | 17 +++---
>  .../webkitgtk/fix-configure-failure-aarch64.patch  | 29 ----------
>  .../webkit/webkitgtk/x32_support.patch             | 24 +++++----
>  .../{webkitgtk_2.18.6.bb => webkitgtk_2.20.0.bb}   |  8 +--
>  10 files changed, 124 insertions(+), 197 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-is-enabled.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.18.6.bb => webkitgtk_2.20.0.bb} (95%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
> index 7cc4514fccc..041ec4675f1 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
> @@ -1,24 +1,25 @@
> -From 415e31bd5444fa360af58b069f1b9db6607fca7d Mon Sep 17 00:00:00 2001
> +From 4f9d736e0458ed33cd161cd164ad0acdac939f44 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 6 Oct 2017 17:00:08 +0300
>  Subject: [PATCH] Fix build with musl
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
> + Source/JavaScriptCore/runtime/MachineContext.h | 18 +++++++++++++++++-
>   Source/WTF/wtf/Platform.h                      |  2 +-
> - 2 files changed, 6 insertions(+), 6 deletions(-)
> + 2 files changed, 18 insertions(+), 2 deletions(-)
>
>  diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
> -index 95080b9..2bb689c 100644
> +index bf0bdc7..84b8a8a 100644
>  --- a/Source/JavaScriptCore/runtime/MachineContext.h
>  +++ b/Source/JavaScriptCore/runtime/MachineContext.h
>  @@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
>   #error Unknown Architecture
>   #endif
>
> --#elif defined(__GLIBC__)
> +-#elif defined(__GLIBC__) || defined(__BIONIC__)
>  +#elif defined(__linux__)
>
>   #if CPU(X86)
> @@ -27,7 +28,7 @@ index 95080b9..2bb689c 100644
>   #error Unknown Architecture
>   #endif
>
> --#elif defined(__GLIBC__)
> +-#elif defined(__GLIBC__) || defined(__BIONIC__)
>  +#elif defined(__linux__)
>
>   // The following sequence depends on glibc's sys/ucontext.h.
> @@ -36,7 +37,7 @@ index 95080b9..2bb689c 100644
>   #error Unknown Architecture
>   #endif
>
> --#elif defined(__GLIBC__)
> +-#elif defined(__GLIBC__) || defined(__BIONIC__)
>  +#elif defined(__linux__)
>
>   // The following sequence depends on glibc's sys/ucontext.h.
> @@ -45,7 +46,7 @@ index 95080b9..2bb689c 100644
>   #error Unknown Architecture
>   #endif
>
> --#elif defined(__GLIBC__)
> +-#elif defined(__GLIBC__) || defined(__BIONIC__)
>  +#elif defined(__linux__)
>
>   // The following sequence depends on glibc's sys/ucontext.h.
> @@ -54,24 +55,21 @@ index 95080b9..2bb689c 100644
>   #error Unknown Architecture
>   #endif
>
> --#elif defined(__GLIBC__)
> +-#elif defined(__GLIBC__) || defined(__BIONIC__)
>  +#elif defined(__linux__)
>
>   // The following sequence depends on glibc's sys/ucontext.h.
>   #if CPU(X86)
>  diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
> -index 5a2863b..b36c3ff 100644
> +index 551c047..e50b05a 100644
>  --- a/Source/WTF/wtf/Platform.h
>  +++ b/Source/WTF/wtf/Platform.h
> -@@ -680,7 +680,7 @@
> +@@ -683,7 +683,7 @@
>   #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
>   #endif
>
> --#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
> +-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
>  +#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
>   #define HAVE_MACHINE_CONTEXT 1
>   #endif
>
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-is-enabled.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-is-enabled.patch
> deleted file mode 100644
> index 21574072f17..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-gles3-header-when-gles2-is-enabled.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From adf3d4c9d4133bd6995590d921c0ccaec5254da9 Mon Sep 17 00:00:00 2001
> -From: Bhargava Sreekantappa Gayathri
> - <bhargava.sreekantappa-gayathri@xilinx.com>
> -Date: Tue, 27 Feb 2018 16:09:31 -0800
> -Subject: [PATCH] Fix gles3 header when gles2 is enabled
> -
> -A GLES 2 application should not use gl3.h.
> -Fix the gles3 header failure while compiling webkitgtk.
> -
> -FAILED:
> -Source/WebCore/CMakeFiles/WebCore.dir/platform/graphics/GLContext.cpp.o
> -           ^~~~~~~~~~~~~
> -compilation terminated.
> -
> -Upstream-Status: Backport
> -Imported patch from: https://bugs.webkit.org/show_bug.cgi?id=183008
> -
> -Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
> -Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ----
> - Source/WebCore/platform/graphics/GLContext.cpp | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/Source/WebCore/platform/graphics/GLContext.cpp b/Source/WebCore/platform/graphics/GLContext.cpp
> -index 599dcc0..46d2fd4 100644
> ---- a/Source/WebCore/platform/graphics/GLContext.cpp
> -+++ b/Source/WebCore/platform/graphics/GLContext.cpp
> -@@ -31,7 +31,6 @@
> - #elif USE(OPENGL_ES_2)
> - #define GL_GLEXT_PROTOTYPES 1
> - #include <GLES2/gl2.h>
> --#include <GLES3/gl3.h>
> - #endif
> -
> - #if USE(GLX)
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
> index 896890b4334..aa9a06701a7 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
> @@ -1,7 +1,7 @@
> -From b7f40eceef0f23bf88090789d4c5845c35f048ae Mon Sep 17 00:00:00 2001
> +From 0afc194c6446e6c3242f1d706b4564e3a9cb2cee Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 29 Aug 2016 16:38:11 +0300
> -Subject: [PATCH 4/9] Fix racy parallel build of WebKit2-4.0.gir
> +Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> @@ -11,39 +11,36 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
>  diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
> -index a33c6a86..d83a2e77 100644
> +index a074a80..8c6ebb5 100644
>  --- a/Source/WebKit/PlatformGTK.cmake
>  +++ b/Source/WebKit/PlatformGTK.cmake
> -@@ -1122,8 +1122,9 @@ endif ()
> - string(REGEX MATCHALL "-L[^ ]*"
> -     INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
> +@@ -728,8 +728,9 @@ if (ENABLE_INTROSPECTION)
> +     string(REGEX MATCHALL "-L[^ ]*"
> +         INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}")
>
> --add_custom_command(
> --    OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> -+# This is a target and not a command because it's used to build another .gir
> -+# and a .typelib, which would trigger two racy parallel builds when using command
> -+add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
> -     DEPENDS WebKit2
> -     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> -     COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
> -@@ -1168,7 +1169,7 @@ add_custom_command(
> - add_custom_command(
> -     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
> -     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> --    DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> -+    DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
> -     COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
> -         LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
> -         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> -@@ -1225,7 +1226,7 @@ add_custom_command(
> +-    add_custom_command(
> +-        OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> ++    # This is a target and not a command because it's used to build another .gir
> ++    # and a .typelib, which would trigger two racy parallel builds when using command
> ++    add_custom_target(WebKit2-${WEBKITGTK_API_VERSION}-gir
> +         DEPENDS WebKit
> +         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> +         COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
> +@@ -773,7 +774,7 @@ if (ENABLE_INTROSPECTION)
> +     add_custom_command(
> +         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
> +         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> +-        DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> ++        DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
> +         COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
> +             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
> +             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> +@@ -828,7 +829,7 @@ if (ENABLE_INTROSPECTION)
>
> - add_custom_command(
> -     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
> --    DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> -+    DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
> -     COMMAND ${INTROSPECTION_COMPILER} --includedir=${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir -o ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
> - )
> +     add_custom_command(
> +         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
> +-        DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> ++        DEPENDS WebKit2-${WEBKITGTK_API_VERSION}-gir
> +         COMMAND ${INTROSPECTION_COMPILER} --includedir=${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir -o ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
> +     )
>
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
> index 0f6eeed1a2e..e8d1d8c341a 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
> @@ -1,4 +1,4 @@
> -From 48648570e449cf7f84a26dc03c1e3f620fa69757 Mon Sep 17 00:00:00 2001
> +From bed4cf4aaa6aad4172ec9942e9039fb8e1ef68a4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 29 Feb 2016 18:13:39 +0200
>  Subject: [PATCH] OptionsGTK.cmake: drop the hardcoded introspection/gtkdoc
> @@ -11,16 +11,17 @@ through the use of qemu target emulation.
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  Upstream-Status: Pending
> +
>  ---
>   Source/cmake/OptionsGTK.cmake | 6 ------
>   1 file changed, 6 deletions(-)
>
> -Index: webkitgtk-2.12.1/Source/cmake/OptionsGTK.cmake
> -===================================================================
> ---- webkitgtk-2.12.1.orig/Source/cmake/OptionsGTK.cmake
> -+++ webkitgtk-2.12.1/Source/cmake/OptionsGTK.cmake
> -@@ -424,12 +424,6 @@ if (USE_LIBHYPHEN)
> -     endif ()
> +diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
> +index 661b40e..404441b 100644
> +--- a/Source/cmake/OptionsGTK.cmake
> ++++ b/Source/cmake/OptionsGTK.cmake
> +@@ -352,12 +352,6 @@ if (ENABLED_COMPILER_SANITIZERS)
> +     set(ENABLE_INTROSPECTION OFF)
>   endif ()
>
>  -# Override the cached variables, gtk-doc and gobject-introspection do not really work when cross-building.
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> index 9fc1421fdd6..034219f8269 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> @@ -1,7 +1,7 @@
> -From ef832a115b40861c08df333339b1366da49e5393 Mon Sep 17 00:00:00 2001
> +From e1c6540f7984bd48e1e2d80d965fa82c70de3c20 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 17 Apr 2016 12:35:41 -0700
> -Subject: [PATCH 9/9] WebKitMacros: Append to -I and not to -isystem
> +Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
>
>  gcc-6 has now introduced stdlib.h in libstdc++ for better
>  compliance and its including the C library stdlib.h using
> @@ -17,6 +17,7 @@ and ends up with compile errors e.g.
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  Upstream-Status: Pending
> +
>  ---
>   Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
>   Source/WebCore/PlatformGTK.cmake           | 6 +++---
> @@ -27,23 +28,23 @@ Upstream-Status: Pending
>   6 files changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScriptCore/shell/CMakeLists.txt
> -index bc37dd31..4e49871f 100644
> +index b3c7e0b..88446de 100644
>  --- a/Source/JavaScriptCore/shell/CMakeLists.txt
>  +++ b/Source/JavaScriptCore/shell/CMakeLists.txt
>  @@ -35,7 +35,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
>   WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
>   WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
> - include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
> + include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES} ${JavaScriptCore_PRIVATE_INCLUDE_DIRECTORIES})
>  -include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
>  +include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
>   add_executable(jsc ${JSC_SOURCES})
>   target_link_libraries(jsc ${JSC_LIBRARIES})
>
>  diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
> -index 73506c74..8eb8b415 100644
> +index 32c6ccc..fef5e8b 100644
>  --- a/Source/WebCore/PlatformGTK.cmake
>  +++ b/Source/WebCore/PlatformGTK.cmake
> -@@ -281,7 +281,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> +@@ -159,7 +159,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>           ${GTK2_INCLUDE_DIRS}
>           ${GDK2_INCLUDE_DIRS}
>       )
> @@ -52,7 +53,7 @@ index 73506c74..8eb8b415 100644
>           ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>       )
>       target_link_libraries(WebCorePlatformGTK2
> -@@ -305,7 +305,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
> +@@ -183,7 +183,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
>   target_include_directories(WebCorePlatformGTK PRIVATE
>       ${WebCore_INCLUDE_DIRECTORIES}
>   )
> @@ -61,7 +62,7 @@ index 73506c74..8eb8b415 100644
>       ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>       ${GTK_INCLUDE_DIRS}
>       ${GDK_INCLUDE_DIRS}
> -@@ -321,7 +321,7 @@ include_directories(
> +@@ -199,7 +199,7 @@ include_directories(
>       "${WEBCORE_DIR}/bindings/gobject/"
>   )
>
> @@ -71,33 +72,33 @@ index 73506c74..8eb8b415 100644
>   )
>
>  diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
> -index d83a2e77..401246f4 100644
> +index 8c6ebb5..772c243 100644
>  --- a/Source/WebKit/PlatformGTK.cmake
>  +++ b/Source/WebKit/PlatformGTK.cmake
> -@@ -1050,7 +1050,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> +@@ -655,7 +655,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>       target_include_directories(WebKitPluginProcess2 PRIVATE
> -         ${WebKit2CommonIncludeDirectories}
> +         ${WebKitCommonIncludeDirectories}
>       )
>  -    target_include_directories(WebKitPluginProcess2 SYSTEM PRIVATE
>  +    target_include_directories(WebKitPluginProcess2 PRIVATE
> -          ${WebKit2CommonSystemIncludeDirectories}
> +          ${WebKitCommonSystemIncludeDirectories}
>            ${GTK2_INCLUDE_DIRS}
>            ${GDK2_INCLUDE_DIRS}
>  diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros.cmake
> -index 7bc89543..d9818fa4 100644
> +index a1e7e8f..ce24274 100644
>  --- a/Source/cmake/WebKitMacros.cmake
>  +++ b/Source/cmake/WebKitMacros.cmake
> -@@ -78,7 +78,7 @@ macro(WEBKIT_FRAMEWORK_DECLARE _target)
> - endmacro()
> -
> - macro(WEBKIT_FRAMEWORK _target)
> --    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -+    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -     target_sources(${_target} PRIVATE
> -         ${${_target}_HEADERS}
> +@@ -134,7 +134,7 @@ macro(WEBKIT_FRAMEWORK _target)
>           ${${_target}_SOURCES}
> +     )
> +     target_include_directories(${_target} PUBLIC "$<BUILD_INTERFACE:${${_target}_INCLUDE_DIRECTORIES}>")
> +-    target_include_directories(${_target} SYSTEM PRIVATE "$<BUILD_INTERFACE:${${_target}_SYSTEM_INCLUDE_DIRECTORIES}>")
> ++    target_include_directories(${_target} PRIVATE "$<BUILD_INTERFACE:${${_target}_SYSTEM_INCLUDE_DIRECTORIES}>")
> +     target_include_directories(${_target} PRIVATE "$<BUILD_INTERFACE:${${_target}_PRIVATE_INCLUDE_DIRECTORIES}>")
> +     target_link_libraries(${_target} ${${_target}_LIBRARIES})
> +     set_target_properties(${_target} PROPERTIES COMPILE_DEFINITIONS "BUILDING_${_target}")
>  diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gtk/CMakeLists.txt
> -index e832a86d..ce92c864 100644
> +index dc2b61e..0128dca 100644
>  --- a/Tools/MiniBrowser/gtk/CMakeLists.txt
>  +++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
>  @@ -57,7 +57,7 @@ endif ()
> @@ -110,11 +111,11 @@ index e832a86d..ce92c864 100644
>   target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
>
>  diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI/PlatformGTK.cmake
> -index 1be3dd52..7bdddf37 100644
> +index 4aef695..a14b163 100644
>  --- a/Tools/TestWebKitAPI/PlatformGTK.cmake
>  +++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
>  @@ -20,7 +20,7 @@ include_directories(
> -     ${WEBKIT2_DIR}/UIProcess/API/gtk
> +     ${WEBKIT_DIR}/UIProcess/API/gtk
>   )
>
>  -include_directories(SYSTEM
> @@ -122,6 +123,3 @@ index 1be3dd52..7bdddf37 100644
>       ${GDK3_INCLUDE_DIRS}
>       ${GLIB_INCLUDE_DIRS}
>       ${GTK3_INCLUDE_DIRS}
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
> index fb4c4dc9325..923d00c4bae 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
> @@ -1,8 +1,8 @@
> -From 98b1359a0cd87bbdb22cef98ba594440f4c57d92 Mon Sep 17 00:00:00 2001
> +From f9767a479111f9c6f280c43176c33de50aee7f66 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 28 Oct 2015 14:18:57 +0200
> -Subject: [PATCH 2/9] When building introspection files, add CMAKE_C_FLAGS to
> - the compiler flags.
> +Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
> + compiler flags.
>
>  g-ir-compiler is using a C compiler internally, so it needs to set
>  the proper flags for it.
> @@ -15,27 +15,24 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
> -index 7f92ae72..a33c6a86 100644
> +index dc6b306..a074a80 100644
>  --- a/Source/WebKit/PlatformGTK.cmake
>  +++ b/Source/WebKit/PlatformGTK.cmake
> -@@ -1126,7 +1126,7 @@ add_custom_command(
> -     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> -     DEPENDS WebKit2
> -     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> --    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
> -+    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
> -         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> -         ${INTROSPECTION_SCANNER}
> -         --quiet
> -@@ -1169,7 +1169,7 @@ add_custom_command(
> -     OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
> -     DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> -     DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> --    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations
> -+    COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
> -         LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
> -         ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> -         ${INTROSPECTION_SCANNER}
> ---
> -2.14.1
> -
> +@@ -732,7 +732,7 @@ if (ENABLE_INTROSPECTION)
> +         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> +         DEPENDS WebKit
> +         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> +-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
> ++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
> +             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> +             ${INTROSPECTION_SCANNER}
> +             --quiet
> +@@ -774,7 +774,7 @@ if (ENABLE_INTROSPECTION)
> +         OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
> +         DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
> +         DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> +-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations
> ++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS}
> +             LDFLAGS="${INTROSPECTION_ADDITIONAL_LDFLAGS}"
> +             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
> +             ${INTROSPECTION_SCANNER}
> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
> index c6157e10378..bbdb64490a2 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
> @@ -1,7 +1,7 @@
> -From 0b3811771ae6385503f2d949f9433d8f810d2ff9 Mon Sep 17 00:00:00 2001
> +From d907ac649ff5514826af9ad7e97e15dfcf79909c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 17 May 2017 22:34:24 -0700
> -Subject: [PATCH 8/9] webkitgtk: Fix build for armv5
> +Subject: [PATCH] webkitgtk: Fix build for armv5
>
>  Taken from
>  https://bugs.webkit.org/show_bug.cgi?id=161900
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
>  diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
> -index 6b5e45b9..46ee3c22 100644
> +index 220bafd..4e1e9f8 100644
>  --- a/Source/WTF/wtf/CMakeLists.txt
>  +++ b/Source/WTF/wtf/CMakeLists.txt
> -@@ -205,7 +205,6 @@ set(WTF_HEADERS
> +@@ -315,7 +315,6 @@ set(WTF_HEADERS
>
>   set(WTF_SOURCES
>       Assertions.cpp
> @@ -25,7 +25,7 @@ index 6b5e45b9..46ee3c22 100644
>       AutomaticThread.cpp
>       BitVector.cpp
>       CPUTime.cpp
> -@@ -336,6 +335,15 @@ if (NOT USE_SYSTEM_MALLOC)
> +@@ -458,6 +457,15 @@ if (NOT USE_SYSTEM_MALLOC)
>       list(APPEND WTF_LIBRARIES bmalloc)
>   endif ()
>
> @@ -39,8 +39,5 @@ index 6b5e45b9..46ee3c22 100644
>  +file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
>  +
>   list(APPEND WTF_SOURCES
> -     unicode/icu/CollatorICU.cpp
> - )
> ---
> -2.14.1
> -
> +     unicode/CollatorDefault.cpp
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64.patch
> deleted file mode 100644
> index 4a6ab544b2a..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/fix-configure-failure-aarch64.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix configure failure for aarch64
> -
> -| -- Performing Test CXX_COMPILER_SUPPORTS_-fcolor-diagnostics - Failed
> -| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=always
> -| -- Performing Test CXX_COMPILER_SUPPORTS_-fdiagnostics-color=always - Success
> -| CMake Error at Source/cmake/OptionsCommon.cmake:42 (WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG):
> -|   Unknown CMake command "WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG".
> -| Call Stack (most recent call first):
> -|   Source/cmake/WebKitCommon.cmake:58 (include)
> -|   CMakeLists.txt:166 (include)
> -|
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> -
> -Index: webkitgtk-2.14.6/Source/cmake/OptionsCommon.cmake
> -===================================================================
> ---- webkitgtk-2.14.6.orig/Source/cmake/OptionsCommon.cmake     2018-02-15 18:56:29.315238564 -0800
> -+++ webkitgtk-2.14.6/Source/cmake/OptionsCommon.cmake  2018-02-15 18:54:57.469518064 -0800
> -@@ -39,7 +39,7 @@
> -     if (NOT WTF_CPU_ARM64)
> -         message(FATAL_ERROR "WTF_CPU_ARM64_CORTEXA53 set without WTF_CPU_ARM64")
> -     endif ()
> --    WEBKIT_PREPEND_GLOBAL_COMPILER_FLAG(-mfix-cortex-a53-835769)
> -+    WEBKIT_PREPEND_GLOBAL_COMPILER_FLAGS(-mfix-cortex-a53-835769)
> - endif ()
> -
> - EXPOSE_VARIABLE_TO_BUILD(WTF_CPU_ARM64_CORTEXA53)
> diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
> index 5f23837585b..f2454b98499 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
> @@ -1,13 +1,19 @@
> +From 897563a0397266d8ceb058f172e16b06419b2593 Mon Sep 17 00:00:00 2001
>  From: Daniel Schepler <dschepler@gmail.com>
> -Subject: Fix FTBFS in x32
> -Bug-Debian: https://bugs.debian.org/700795
> -Upstream-Status: Pending
> -Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Index: webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
> +Date: Mon, 26 Mar 2018 17:48:34 +0300
> +Subject: [PATCH] Fix FTBFS in x32
> +
>  ===================================================================
> ---- webkitgtk-2.16.1.orig/Source/WTF/wtf/Platform.h
> -+++ webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
> -@@ -172,7 +172,11 @@
> +
> +---
> + Source/WTF/wtf/Platform.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
> +index 850e298..551c047 100644
> +--- a/Source/WTF/wtf/Platform.h
> ++++ b/Source/WTF/wtf/Platform.h
> +@@ -132,7 +132,11 @@
>   /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
>   #if   defined(__x86_64__) \
>       || defined(_M_X64)
> @@ -17,5 +23,5 @@ Index: webkitgtk-2.16.1/Source/WTF/wtf/Platform.h
>   #define WTF_CPU_X86_64 1
>  +#endif
>   #define WTF_CPU_X86_SSE2 1
> + #define WTF_CPU_KNOWN 1
>   #endif
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
> similarity index 95%
> rename from meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
> index c29fa7f4c5c..50e26665782 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.0.bb
> @@ -20,12 +20,10 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://detect-atomics-during-configure.patch \
>             file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>             file://0001-Fix-build-with-musl.patch \
> -           file://fix-configure-failure-aarch64.patch \
> -           file://0001-Fix-gles3-header-when-gles2-is-enabled.patch \
>             "
>
> -SRC_URI[md5sum] = "c1a548595135ee75ad3bf2e18ac83112"
> -SRC_URI[sha256sum] = "93912cc2f40f12e452be1ca4babdbdaac0ec4f828d441257a6b06c2963bbac3c"
> +SRC_URI[md5sum] = "51cc47345c3ec53802718cd6fc9b746f"
> +SRC_URI[sha256sum] = "57f640f720bd9a8a7207f3321cf803a15c2f207b4e7b75ff1be17bc1eeb00a3c"
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> @@ -56,6 +54,8 @@ PACKAGECONFIG[webgl] = "-DENABLE_WEBGL=ON,-DENABLE_WEBGL=OFF,virtual/libgl"
>  PACKAGECONFIG[opengl] = "-DENABLE_OPENGL=ON,-DENABLE_OPENGL=OFF,virtual/libgl"
>  PACKAGECONFIG[libsecret] = "-DUSE_LIBSECRET=ON,-DUSE_LIBSECRET=OFF,libsecret"
>  PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
> +# Source is at https://github.com/google/woff2
> +PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
>
>  EXTRA_OECMAKE = " \
>                 -DPORT=GTK \
> --
> 2.16.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

