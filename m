Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB2777E18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:10:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z11so4580001pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 22:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YCMkmnBqlO8GNa6iptoWknL++hwwpWKAX5tsJs/wkHs=;
	b=iHOECGewM63rai85SaYKxvpmNOWH3NlM7d97SzpNUs1QWRv7ISWj09LA7lVxJa2olc
	98/IHSRD3Mg5Am80ZuBoYX5mFrMacMaESWkOIZxKR75DwnKJ6Tjm/h4HjRRBgp7Ly564
	4wYVGeTjRwxASFphksj74g/93ycl+1i2Ksa/IND81QriNFUbLsl2UswxOswvvR0vyr29
	2pJt/tFsO+POFra5/kXwrGBisBuqJgDjn/KMc/MemyqJ7I8cSQ6rFhSuGqGLVoVtGIJh
	xDSY8XBqvuAb0GDSTJMvXPkp//bJpRPJg96LGPCiooQdOqnQj1ZdwmsAZowDpVXWrtre
	Zxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YCMkmnBqlO8GNa6iptoWknL++hwwpWKAX5tsJs/wkHs=;
	b=P84okXPWPedZsFi7owQBAv4VpQBawQWjXiY6jYA+zoDbNA6RjLVgPzIr4t17LrSo4Y
	6ytUmlnRtt83DpuaMrmELyCPTkrEYlxrhJnNVcoWy8iBnD9ONxuugtSTp+4+hCRfab86
	AfPzARUx7ax3iaSD3/Bha+j6oHeHdJI/VJR35MADn/fPJ2XH4N/SGEHZX1OLco+PJz33
	IFGDfUT5yO7K5tq1qvHVFfQiRldVTxDR/5j6YwyeT3o8NuXL07sRF1DAnunXRfaluehx
	RmwzQPmOUw9+j1pdG+GW2WfbuMu2CeEBFrr4hJgcWC+b5OeAvqNaBpMO2Xo0NR80gaL7
	uLmw==
X-Gm-Message-State: AMCzsaX2WxGquD+gTGLEHUPppRUc+CrCJt51DrhZJ4LFQMhHgskZjeIP
	hQbIuTwT9GGY86MUq6cfvKUecZP+uDy4CUclHIvqDA==
X-Google-Smtp-Source: AOwi7QBdbCPYvAaMAsjDJSjNZyZAnrTm6EnMUdGcEUhpDhIxLarDIIgO5GFQVKkJMZjoh8tWIs2uL1hFR96omj5tIqQ=
X-Received: by 10.84.240.137 with SMTP id z9mr1148127plk.114.1507785024988;
	Wed, 11 Oct 2017 22:10:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 11 Oct 2017 22:09:54 -0700 (PDT)
In-Reply-To: <c0a64a67f9b38870e57ad6b2870b56a4bec3ab3b.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<c0a64a67f9b38870e57ad6b2870b56a4bec3ab3b.1507735448.git.alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 22:09:54 -0700
Message-ID: <CAMKF1srBmLrP=7suUdZEhRDUWzjYD3B6CMTpL8qtaZv6nVkJ5Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/50] webkitgtk: update to 2.18.0
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
X-List-Received-Date: Thu, 12 Oct 2017 05:10:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 8:34 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> gcc7.patch, musl-fixes.patch, and ppc-musl-fix.patch all change code that=
 is no
> longer present in upstream tree. However, a patch with different musl fix=
es
> has been added.
>
> The rest of the patches are rebased to the new tree.
>
> Libtasn is a new dependency.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../webkitgtk/0001-Fix-build-with-musl.patch       |  77 +++++++++
>  ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch |  23 +--
>  ...c-settings-so-that-gtkdoc-generation-work.patch |  21 +--
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 182 ++++++++-------=
------
>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  24 +--
>  .../detect-atomics-during-configure.patch          |  26 ++-
>  meta/recipes-sato/webkit/webkitgtk/gcc7.patch      |  23 ---
>  .../recipes-sato/webkit/webkitgtk/musl-fixes.patch |  48 ------
>  .../webkit/webkitgtk/ppc-musl-fix.patch            |  26 ---
>  .../{webkitgtk_2.16.6.bb =3D> webkitgtk_2.18.0.bb}   |  10 +-
>  10 files changed, 206 insertions(+), 254 deletions(-)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-wit=
h-musl.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/gcc7.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.16.6.bb =3D> webkitgtk_2.18=
.0.bb} (94%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.=
patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
> new file mode 100644
> index 00000000000..2bfa7a1be81
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
> @@ -0,0 +1,77 @@
> +From 415e31bd5444fa360af58b069f1b9db6607fca7d Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 6 Oct 2017 17:00:08 +0300
> +Subject: [PATCH] Fix build with musl
> +
> +Upstream-Status: Inappropriate [needs to use musl-specific defines to be=
 upstreamable]

I think using __GLIBC__ is sub optimal here. So this change should be
upstreamable.

> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
> + Source/WTF/wtf/Platform.h                      |  2 +-
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/Jav=
aScriptCore/runtime/MachineContext.h
> +index 95080b9..2bb689c 100644
> +--- a/Source/JavaScriptCore/runtime/MachineContext.h
> ++++ b/Source/JavaScriptCore/runtime/MachineContext.h
> +@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContex=
t)
> + #error Unknown Architecture
> + #endif
> +
> +-#elif defined(__GLIBC__)
> ++#elif defined(__linux__)
> +
> + #if CPU(X86)
> +     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[R=
EG_ESP]);
> +@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContex=
t)
> + #error Unknown Architecture
> + #endif
> +
> +-#elif defined(__GLIBC__)
> ++#elif defined(__linux__)
> +
> + // The following sequence depends on glibc's sys/ucontext.h.
> + #if CPU(X86)
> +@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machine=
Context)
> + #error Unknown Architecture
> + #endif
> +
> +-#elif defined(__GLIBC__)
> ++#elif defined(__linux__)
> +
> + // The following sequence depends on glibc's sys/ucontext.h.
> + #if CPU(X86)
> +@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machine=
Context)
> + #error Unknown Architecture
> + #endif
> +
> +-#elif defined(__GLIBC__)
> ++#elif defined(__linux__)
> +
> + // The following sequence depends on glibc's sys/ucontext.h.
> + #if CPU(X86)
> +@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& ma=
chineContext)
> + #error Unknown Architecture
> + #endif
> +
> +-#elif defined(__GLIBC__)
> ++#elif defined(__linux__)
> +
> + // The following sequence depends on glibc's sys/ucontext.h.
> + #if CPU(X86)
> +diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
> +index 5a2863b..b36c3ff 100644
> +--- a/Source/WTF/wtf/Platform.h
> ++++ b/Source/WTF/wtf/Platform.h
> +@@ -680,7 +680,7 @@
> + #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
> + #endif
> +
> +-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) || =
CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
> ++#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || =
CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))

We should probably use (OS(LINUX)  instead of defined(__linux__)
and this could be upstreamed too.

> + #define HAVE_MACHINE_CONTEXT 1
> + #endif
> +
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-bu=
ild-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-=
racy-parallel-build-of-WebKit2-4.0.gir.patch
> index 615fe4f4025..896890b4334 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-=
WebKit2-4.0.gir.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-=
WebKit2-4.0.gir.patch
> @@ -1,19 +1,20 @@
> -From 5760d346b42807b596f479c81f7a6b42eb36065e Mon Sep 17 00:00:00 2001
> +From b7f40eceef0f23bf88090789d4c5845c35f048ae Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 29 Aug 2016 16:38:11 +0300
> -Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
> +Subject: [PATCH 4/9] Fix racy parallel build of WebKit2-4.0.gir
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - Source/WebKit2/PlatformGTK.cmake | 9 +++++----
> + Source/WebKit/PlatformGTK.cmake | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> -diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformG=
TK.cmake
> -index adaa010..f18cf8a 100644
> ---- a/Source/WebKit2/PlatformGTK.cmake
> -+++ b/Source/WebKit2/PlatformGTK.cmake
> -@@ -906,8 +906,9 @@ endif ()
> +diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK=
.cmake
> +index a33c6a86..d83a2e77 100644
> +--- a/Source/WebKit/PlatformGTK.cmake
> ++++ b/Source/WebKit/PlatformGTK.cmake
> +@@ -1122,8 +1122,9 @@ endif ()
>   string(REGEX MATCHALL "-L[^ ]*"
>       INTROSPECTION_ADDITIONAL_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS}=
")
>
> @@ -25,7 +26,7 @@ index adaa010..f18cf8a 100644
>       DEPENDS WebKit2
>       DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}=
.gir
>       COMMAND CC=3D${CMAKE_C_COMPILER} CFLAGS=3D-Wno-deprecated-declarati=
ons\ ${CMAKE_C_FLAGS} LDFLAGS=3D
> -@@ -950,7 +951,7 @@ add_custom_command(
> +@@ -1168,7 +1169,7 @@ add_custom_command(
>   add_custom_command(
>       OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERS=
ION}.gir
>       DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}=
.gir
> @@ -34,7 +35,7 @@ index adaa010..f18cf8a 100644
>       COMMAND CC=3D${CMAKE_C_COMPILER} CFLAGS=3D-Wno-deprecated-declarati=
ons\ ${CMAKE_C_FLAGS}
>           LDFLAGS=3D"${INTROSPECTION_ADDITIONAL_LDFLAGS}"
>           ${LOADER_LIBRARY_PATH_VAR}=3D"${INTROSPECTION_ADDITIONAL_LIBRAR=
Y_PATH}"
> -@@ -1004,7 +1005,7 @@ add_custom_command(
> +@@ -1225,7 +1226,7 @@ add_custom_command(
>
>   add_custom_command(
>       OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.typelib
> @@ -44,5 +45,5 @@ index adaa010..f18cf8a 100644
>   )
>
>  --
> -2.9.3
> +2.14.1
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-setting=
s-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
> index 586dd2375c9..e1b69b2a214 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-th=
at-gtkdoc-generation-work.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-th=
at-gtkdoc-generation-work.patch
> @@ -1,8 +1,8 @@
> -From 4eeeaec775e190cf3f5885d7c6717acebd0201a8 Mon Sep 17 00:00:00 2001
> +From 3cc0e5900515cbcedd0447e0bdf487cc8d9a0f8c Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 11 Aug 2016 17:13:51 +0300
> -Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works u=
nder
> - OpenEmbedded build system
> +Subject: [PATCH 5/9] Tweak gtkdoc settings so that gtkdoc generation wor=
ks
> + under OpenEmbedded build system
>
>  This requires setting a few environment variables so that the transient
>  binary is build and linked correctly, and disabling the tweaks to RUN
> @@ -10,26 +10,27 @@ variable from gtkdoc.py script so that our qemu wrapp=
er is taken into use.
>
>  Upstream-Status: Inappropriate [oe-specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Source/PlatformGTK.cmake | 2 +-
>   Tools/gtk/gtkdoc.py      | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/Source/PlatformGTK.cmake b/Source/PlatformGTK.cmake
> -index af4d2e3..b7b93c7 100644
> +index 50b5393f..7a31db51 100644
>  --- a/Source/PlatformGTK.cmake
>  +++ b/Source/PlatformGTK.cmake
> -@@ -25,7 +25,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
> +@@ -24,7 +24,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
>       add_custom_command(
>           OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
>           DEPENDS ${DocumentationDependencies}
> --        COMMAND CC=3D${CMAKE_C_COMPILER} CFLAGS=3D${CMAKE_C_FLAGS} ${CM=
AKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
> -+        COMMAND CC=3D${CMAKE_C_COMPILER} CFLAGS=3D${CMAKE_C_FLAGS} LD=
=3D${CMAKE_C_COMPILER} LDFLAGS=3D${CMAKE_C_LINK_FLAGS} RUN=3D${CMAKE_BINARY=
_DIR}/gtkdoc-qemuwrapper GIR_EXTRA_LIBS_PATH=3D${CMAKE_BINARY_DIR}/lib ${CM=
AKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc ${_extra_args}
> +-        COMMAND ${CMAKE_COMMAND} -E env "CC=3D${CMAKE_C_COMPILER}" "CFL=
AGS=3D${CMAKE_C_FLAGS} -Wno-unused-parameter" ${CMAKE_SOURCE_DIR}/Tools/gtk=
/generate-gtkdoc ${_extra_args}
> ++        COMMAND ${CMAKE_COMMAND} -E env "CC=3D${CMAKE_C_COMPILER}" "CFL=
AGS=3D${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=3D${CMAKE_C_COMPILER}" "L=
DFLAGS=3D${CMAKE_C_LINK_FLAGS}" "RUN=3D${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapp=
er" ${CMAKE_SOURCE_DIR}/Tools/gtk/generate-gtkdoc -v ${_extra_args}
>           COMMAND touch ${_stamp_name}
>           WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
> -     )
> +         VERBATIM
>  diff --git a/Tools/gtk/gtkdoc.py b/Tools/gtk/gtkdoc.py
> -index 4c8237b..c0205f0 100644
> +index 48f862a3..18240e42 100644
>  --- a/Tools/gtk/gtkdoc.py
>  +++ b/Tools/gtk/gtkdoc.py
>  @@ -318,9 +318,9 @@ class GTKDoc(object):
> @@ -45,5 +46,5 @@ index 4c8237b..c0205f0 100644
>
>           if ldflags:
>  --
> -2.8.1
> +2.14.1
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-=
to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Web=
KitMacros-Append-to-I-and-not-to-isystem.patch
> index d6f0ce3cd63..dfdc1160182 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-an=
d-not-to-isystem.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-an=
d-not-to-isystem.patch
> @@ -1,7 +1,7 @@
> -From 53a00058184cd710c6f4375f4daab49d7e885a30 Mon Sep 17 00:00:00 2001
> +From ef832a115b40861c08df333339b1366da49e5393 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 17 Apr 2016 12:35:41 -0700
> -Subject: [PATCH] WebKitMacros: Append to -I and not to -isystem
> +Subject: [PATCH 9/9] WebKitMacros: Append to -I and not to -isystem
>
>  gcc-6 has now introduced stdlib.h in libstdc++ for better
>  compliance and its including the C library stdlib.h using
> @@ -15,68 +15,34 @@ and ends up with compile errors e.g.
>  /usr/include/c++/6.0.0/cstdlib:75:25: fatal error: stdlib.h: No such fil=
e or directory
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
>
> - Source/cmake/WebKitMacros.cmake | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> +---
> + Source/JavaScriptCore/shell/CMakeLists.txt | 2 +-
> + Source/WebCore/PlatformGTK.cmake           | 6 +++---
> + Source/WebKit/PlatformGTK.cmake            | 2 +-
> + Source/cmake/WebKitMacros.cmake            | 2 +-
> + Tools/MiniBrowser/gtk/CMakeLists.txt       | 2 +-
> + Tools/TestWebKitAPI/PlatformGTK.cmake      | 2 +-
> + 6 files changed, 8 insertions(+), 8 deletions(-)
>
> -Index: webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLis=
ts.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeL=
ists.txt
> -+++ webkitgtk-2.16.5/Tools/DumpRenderTree/TestNetscapePlugIn/CMakeLists.=
txt
> -@@ -42,7 +42,7 @@ set(WebKitTestNetscapePlugIn_SYSTEM_INCL
> - )
> -
> - include_directories(${WebKitTestNetscapePlugIn_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DI=
RECTORIES})
> -+include_directories(${WebKitTestNetscapePlugIn_SYSTEM_INCLUDE_DIRECTORI=
ES})
> -
> - set(WebKitTestNetscapePlugIn_LIBRARIES
> -     ${X11_LIBRARIES}
> -Index: webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/ImageDiff/CMakeLists.txt
> -+++ webkitgtk-2.16.5/Tools/ImageDiff/CMakeLists.txt
> -@@ -9,6 +9,6 @@ set(IMAGE_DIFF_LIBRARIES
> - WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -
> - include_directories(${IMAGE_DIFF_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${IMAGE_DIFF_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(ImageDiff ${IMAGE_DIFF_SOURCES})
> - target_link_libraries(ImageDiff ${IMAGE_DIFF_LIBRARIES})
> -Index: webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/MiniBrowser/gtk/CMakeLists.txt
> -+++ webkitgtk-2.16.5/Tools/MiniBrowser/gtk/CMakeLists.txt
> -@@ -57,7 +57,7 @@ endif ()
> - add_definitions(-DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_6)
> -
> - include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> -+include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(MiniBrowser ${MiniBrowser_SOURCES})
> - target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
> -
> -Index: webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/WebKitTestRunner/CMakeLists.txt
> -+++ webkitgtk-2.16.5/Tools/WebKitTestRunner/CMakeLists.txt
> -@@ -106,7 +106,7 @@ GENERATE_BINDINGS(WebKitTestRunnerBindin
> - WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -
> - include_directories(${WebKitTestRunner_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIE=
S})
> -+include_directories(${WebKitTestRunner_SYSTEM_INCLUDE_DIRECTORIES})
> +diff --git a/Source/JavaScriptCore/shell/CMakeLists.txt b/Source/JavaScr=
iptCore/shell/CMakeLists.txt
> +index bc37dd31..4e49871f 100644
> +--- a/Source/JavaScriptCore/shell/CMakeLists.txt
> ++++ b/Source/JavaScriptCore/shell/CMakeLists.txt
> +@@ -35,7 +35,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> + WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
> + WEBKIT_WRAP_SOURCELIST(${TESTAPI_SOURCES})
> + include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
> +-include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES}=
)
> ++include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> + add_executable(jsc ${JSC_SOURCES})
> + target_link_libraries(jsc ${JSC_LIBRARIES})
>
> - add_library(TestRunnerInjectedBundle SHARED ${WebKitTestRunnerInjectedB=
undle_SOURCES})
> - target_link_libraries(TestRunnerInjectedBundle ${WebKitTestRunner_LIBRA=
RIES})
> -Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Source/WebCore/PlatformGTK.cmake
> -+++ webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmake
> -@@ -321,7 +321,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> +diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformG=
TK.cmake
> +index 73506c74..8eb8b415 100644
> +--- a/Source/WebCore/PlatformGTK.cmake
> ++++ b/Source/WebCore/PlatformGTK.cmake
> +@@ -281,7 +281,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>           ${GTK2_INCLUDE_DIRS}
>           ${GDK2_INCLUDE_DIRS}
>       )
> @@ -85,7 +51,7 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmak=
e
>           ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>       )
>       target_link_libraries(WebCorePlatformGTK2
> -@@ -346,7 +346,7 @@ WEBKIT_SET_EXTRA_COMPILER_FLAGS(WebCoreP
> +@@ -305,7 +305,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
>   target_include_directories(WebCorePlatformGTK PRIVATE
>       ${WebCore_INCLUDE_DIRECTORIES}
>   )
> @@ -94,7 +60,7 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.cmak=
e
>       ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>       ${GTK_INCLUDE_DIRS}
>       ${GDK_INCLUDE_DIRS}
> -@@ -362,7 +362,7 @@ include_directories(
> +@@ -321,7 +321,7 @@ include_directories(
>       "${WEBCORE_DIR}/bindings/gobject/"
>   )
>
> @@ -103,37 +69,11 @@ Index: webkitgtk-2.16.5/Source/WebCore/PlatformGTK.c=
make
>       ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>   )
>
> -Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/PlatformGTK.cmake
> -+++ webkitgtk-2.16.5/Tools/TestWebKitAPI/PlatformGTK.cmake
> -@@ -20,7 +20,7 @@ include_directories(
> -     ${WEBKIT2_DIR}/UIProcess/API/gtk
> - )
> -
> --include_directories(SYSTEM
> -+include_directories(
> -     ${GDK3_INCLUDE_DIRS}
> -     ${GLIB_INCLUDE_DIRS}
> -     ${GTK3_INCLUDE_DIRS}
> -Index: webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.=
txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeList=
s.txt
> -+++ webkitgtk-2.16.5/Tools/TestWebKitAPI/Tests/WebKit2Gtk/CMakeLists.txt
> -@@ -21,7 +21,7 @@ include_directories(
> -     ${TOOLS_DIR}/TestWebKitAPI/gtk/WebKit2Gtk
> - )
> -
> --include_directories(SYSTEM
> -+include_directories(
> -     ${ATSPI_INCLUDE_DIRS}
> -     ${GLIB_INCLUDE_DIRS}
> -     ${GSTREAMER_INCLUDE_DIRS}
> -Index: webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Source/WebKit2/PlatformGTK.cmake
> -+++ webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.cmake
> -@@ -1156,7 +1156,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> +diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK=
.cmake
> +index d83a2e77..401246f4 100644
> +--- a/Source/WebKit/PlatformGTK.cmake
> ++++ b/Source/WebKit/PlatformGTK.cmake
> +@@ -1050,7 +1050,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>       target_include_directories(WebKitPluginProcess2 PRIVATE
>           ${WebKit2CommonIncludeDirectories}
>       )
> @@ -142,29 +82,45 @@ Index: webkitgtk-2.16.5/Source/WebKit2/PlatformGTK.c=
make
>            ${WebKit2CommonSystemIncludeDirectories}
>            ${GTK2_INCLUDE_DIRS}
>            ${GDK2_INCLUDE_DIRS}
> -Index: webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Source/JavaScriptCore/shell/CMakeLists.txt
> -+++ webkitgtk-2.16.5/Source/JavaScriptCore/shell/CMakeLists.txt
> -@@ -20,7 +20,7 @@ WEBKIT_INCLUDE_CONFIG_FILES_IF_EXISTS()
> -
> - WEBKIT_WRAP_SOURCELIST(${JSC_SOURCES})
> - include_directories(./ ${JavaScriptCore_INCLUDE_DIRECTORIES})
> --include_directories(SYSTEM ${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES}=
)
> -+include_directories(${JavaScriptCore_SYSTEM_INCLUDE_DIRECTORIES})
> - add_executable(jsc ${JSC_SOURCES})
> - target_link_libraries(jsc ${JSC_LIBRARIES})
> -
> -Index: webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.5.orig/Source/cmake/WebKitMacros.cmake
> -+++ webkitgtk-2.16.5/Source/cmake/WebKitMacros.cmake
> -@@ -277,7 +277,7 @@ macro(WEBKIT_WRAP_SOURCELIST)
> +diff --git a/Source/cmake/WebKitMacros.cmake b/Source/cmake/WebKitMacros=
.cmake
> +index 7bc89543..d9818fa4 100644
> +--- a/Source/cmake/WebKitMacros.cmake
> ++++ b/Source/cmake/WebKitMacros.cmake
> +@@ -78,7 +78,7 @@ macro(WEBKIT_FRAMEWORK_DECLARE _target)
>   endmacro()
>
>   macro(WEBKIT_FRAMEWORK _target)
>  -    include_directories(SYSTEM ${${_target}_SYSTEM_INCLUDE_DIRECTORIES}=
)
>  +    include_directories(${${_target}_SYSTEM_INCLUDE_DIRECTORIES})
> -     add_library(${_target} ${${_target}_LIBRARY_TYPE}
> +     target_sources(${_target} PRIVATE
>           ${${_target}_HEADERS}
>           ${${_target}_SOURCES}
> +diff --git a/Tools/MiniBrowser/gtk/CMakeLists.txt b/Tools/MiniBrowser/gt=
k/CMakeLists.txt
> +index e832a86d..ce92c864 100644
> +--- a/Tools/MiniBrowser/gtk/CMakeLists.txt
> ++++ b/Tools/MiniBrowser/gtk/CMakeLists.txt
> +@@ -57,7 +57,7 @@ endif ()
> + add_definitions(-DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_6)
> +
> + include_directories(${MiniBrowser_INCLUDE_DIRECTORIES})
> +-include_directories(SYSTEM ${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> ++include_directories(${MiniBrowser_SYSTEM_INCLUDE_DIRECTORIES})
> + add_executable(MiniBrowser ${MiniBrowser_SOURCES})
> + target_link_libraries(MiniBrowser ${MiniBrowser_LIBRARIES})
> +
> +diff --git a/Tools/TestWebKitAPI/PlatformGTK.cmake b/Tools/TestWebKitAPI=
/PlatformGTK.cmake
> +index 1be3dd52..7bdddf37 100644
> +--- a/Tools/TestWebKitAPI/PlatformGTK.cmake
> ++++ b/Tools/TestWebKitAPI/PlatformGTK.cmake
> +@@ -20,7 +20,7 @@ include_directories(
> +     ${WEBKIT2_DIR}/UIProcess/API/gtk
> + )
> +
> +-include_directories(SYSTEM
> ++include_directories(
> +     ${GDK3_INCLUDE_DIRS}
> +     ${GLIB_INCLUDE_DIRS}
> +     ${GTK3_INCLUDE_DIRS}
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-intros=
pection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
> index 3f71297f504..fb4c4dc9325 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection=
-files-add-CMAKE_C_FLAGS-.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection=
-files-add-CMAKE_C_FLAGS-.patch
> @@ -1,23 +1,24 @@
> -From bae9f73b2c693b5aa156fed717d6481b60682786 Mon Sep 17 00:00:00 2001
> +From 98b1359a0cd87bbdb22cef98ba594440f4c57d92 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 28 Oct 2015 14:18:57 +0200
> -Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to=
 the
> - compiler flags.
> +Subject: [PATCH 2/9] When building introspection files, add CMAKE_C_FLAG=
S to
> + the compiler flags.
>
>  g-ir-compiler is using a C compiler internally, so it needs to set
>  the proper flags for it.
>
>  Upstream-Status: Pending [review on oe-core list]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - Source/WebKit2/PlatformGTK.cmake | 4 ++--
> + Source/WebKit/PlatformGTK.cmake | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> -Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.12.1.orig/Source/WebKit2/PlatformGTK.cmake
> -+++ webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmake
> -@@ -910,7 +910,7 @@ add_custom_command(
> +diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK=
.cmake
> +index 7f92ae72..a33c6a86 100644
> +--- a/Source/WebKit/PlatformGTK.cmake
> ++++ b/Source/WebKit/PlatformGTK.cmake
> +@@ -1126,7 +1126,7 @@ add_custom_command(
>       OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
>       DEPENDS WebKit2
>       DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}=
.gir
> @@ -26,7 +27,7 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmak=
e
>           ${LOADER_LIBRARY_PATH_VAR}=3D"${INTROSPECTION_ADDITIONAL_LIBRAR=
Y_PATH}"
>           ${INTROSPECTION_SCANNER}
>           --quiet
> -@@ -951,7 +951,7 @@ add_custom_command(
> +@@ -1169,7 +1169,7 @@ add_custom_command(
>       OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERS=
ION}.gir
>       DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}=
.gir
>       DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
> @@ -35,3 +36,6 @@ Index: webkitgtk-2.12.1/Source/WebKit2/PlatformGTK.cmak=
e
>           LDFLAGS=3D"${INTROSPECTION_ADDITIONAL_LDFLAGS}"
>           ${LOADER_LIBRARY_PATH_VAR}=3D"${INTROSPECTION_ADDITIONAL_LIBRAR=
Y_PATH}"
>           ${INTROSPECTION_SCANNER}
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-con=
figure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-con=
figure.patch
> index 12836f28f2e..c6157e10378 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.=
patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.=
patch
> @@ -1,22 +1,31 @@
> +From 0b3811771ae6385503f2d949f9433d8f810d2ff9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 17 May 2017 22:34:24 -0700
> +Subject: [PATCH 8/9] webkitgtk: Fix build for armv5
> +
>  Taken from
>  https://bugs.webkit.org/show_bug.cgi?id=3D161900
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.1.orig/Source/WTF/wtf/CMakeLists.txt
> -+++ webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
> -@@ -182,7 +182,6 @@ set(WTF_HEADERS
> +---
> + Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.t=
xt
> +index 6b5e45b9..46ee3c22 100644
> +--- a/Source/WTF/wtf/CMakeLists.txt
> ++++ b/Source/WTF/wtf/CMakeLists.txt
> +@@ -205,7 +205,6 @@ set(WTF_HEADERS
>
>   set(WTF_SOURCES
>       Assertions.cpp
>  -    Atomics.cpp
>       AutomaticThread.cpp
>       BitVector.cpp
> -     ClockType.cpp
> -@@ -301,6 +300,15 @@ if (NOT USE_SYSTEM_MALLOC)
> +     CPUTime.cpp
> +@@ -336,6 +335,15 @@ if (NOT USE_SYSTEM_MALLOC)
>       list(APPEND WTF_LIBRARIES bmalloc)
>   endif ()
>
> @@ -32,3 +41,6 @@ Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
>   list(APPEND WTF_SOURCES
>       unicode/icu/CollatorICU.cpp
>   )
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch b/meta/recipes=
-sato/webkit/webkitgtk/gcc7.patch
> deleted file mode 100644
> index aee29a9a72d..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/gcc7.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Imported from
> -https://src.fedoraproject.org/cgit/rpms/webkitgtk4.git/plain/gcc7.patch
> -
> -Add to CXX flags since webkitgtk uses c++ compiler by default
> -Fixes
> -Source/JavaScriptCore/runtime/JSGenericTypedArrayView.h:119:67: error: n=
o matching function for call to 'JSC::JSGenericTypedArrayView<Adaptor>::vec=
tor() const'
> -|          return bitwise_cast<const typename Adaptor::Type*>(vector());
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com
> -Upstream-Status: Pending
> -
> -diff -up webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7 webkitg=
tk-2.15.90/Source/cmake/OptionsCommon.cmake
> ---- webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake.gcc7    2017-02-2=
1 09:57:13.168916004 +0100
> -+++ webkitgtk-2.15.90/Source/cmake/OptionsCommon.cmake 2017-02-21 09:58:=
12.811563156 +0100
> -@@ -41,6 +41,8 @@ if (COMPILER_IS_GCC_OR_CLANG)
> -     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-ali=
asing")
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict=
-aliasing -fno-rtti")
> -     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=3Dc++1y")
> -+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-expansion-to-defined")
> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-expansion-to-defined")
> - endif ()
> -
> - if (COMPILER_IS_CLANG AND CMAKE_GENERATOR STREQUAL "Ninja")
> diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch b/meta/r=
ecipes-sato/webkit/webkitgtk/musl-fixes.patch
> deleted file mode 100644
> index 4fdd56fea04..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/musl-fixes.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Replace __GLIBC__ with __linux__ since musl also supports it
> -so checking __linux__ is more accomodating
> -
> -See http://git.alpinelinux.org/cgit/aports/tree/community/webkit2gtk/mus=
l-fixes.patch?id=3D219435d86d7e8fac9474344a7431c62bd2525184
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cp=
p
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.12.1.orig/Source/JavaScriptCore/heap/MachineStackMarker.=
cpp
> -+++ webkitgtk-2.12.1/Source/JavaScriptCore/heap/MachineStackMarker.cpp
> -@@ -566,7 +566,7 @@ void* MachineThreads::Thread::Registers:
> - #error Unknown Architecture
> - #endif
> -
> --#elif defined(__GLIBC__) && ENABLE(JIT)
> -+#elif defined(__linux__) && ENABLE(JIT)
> -
> - #if CPU(X86)
> -     return reinterpret_cast<void*>((uintptr_t) regs.machineContext.greg=
s[REG_ESP]);
> -@@ -665,7 +665,7 @@ void* MachineThreads::Thread::Registers:
> - #error Unknown Architecture
> - #endif
> -
> --#elif defined(__GLIBC__)
> -+#elif defined(__linux__) // glibc and musl
> -
> - // The following sequence depends on glibc's sys/ucontext.h.
> - #if CPU(X86)
> -@@ -747,7 +747,7 @@ void* MachineThreads::Thread::Registers:
> - #error Unknown Architecture
> - #endif
> -
> --#elif defined(__GLIBC__)
> -+#elif defined(__linux__) // glibc and musl
> -
> - // The following sequence depends on glibc's sys/ucontext.h.
> - #if CPU(X86)
> -@@ -838,7 +838,7 @@ void* MachineThreads::Thread::Registers:
> - #error Unknown Architecture
> - #endif
> -
> --#elif defined(__GLIBC__)
> -+#elif defined(__linux__) // glibc and musl
> -
> - // The following sequence depends on glibc's sys/ucontext.h.
> - #if CPU(X86)
> diff --git a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch b/meta=
/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
> deleted file mode 100644
> index a1ad248aac0..00000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -ucontext structure is different between musl and glibc for ppc
> -therefore its not enough just to check for arch alone, we also
> -need to check for libc type.
> -
> -Fixes errors like
> -
> -Source/JavaScriptCore/heap/MachineStackMarker.cpp:90:65: error: 'struct =
mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
> -     thread->suspendedMachineContext =3D *userContext->uc_mcontext.uc_re=
gs;
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cp=
p
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- webkitgtk-2.16.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.=
cpp
> -+++ webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
> -@@ -88,7 +88,7 @@ static void pthreadSignalHandlerSuspendR
> -     }
> -
> -     ucontext_t* userContext =3D static_cast<ucontext_t*>(ucontext);
> --#if CPU(PPC)
> -+#if CPU(PPC) && defined(__GLIBC__)
> -     threadData->suspendedMachineContext =3D *userContext->uc_mcontext.u=
c_regs;
> - #else
> -     threadData->suspendedMachineContext =3D userContext->uc_mcontext;
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.18.0.bb
> similarity index 94%
> rename from meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.18.0.bb
> index 0f126cba813..019066fcc86 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.18.0.bb
> @@ -13,19 +13,17 @@ SRC_URI =3D "http://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
>             file://0001-When-building-introspection-files-add-CMAKE_C_FLA=
GS-.patch \
>             file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection=
-gt.patch \
> -           file://musl-fixes.patch \
> -           file://ppc-musl-fix.patch \
>             file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch =
\
>             file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-w=
ork.patch \
>             file://x32_support.patch \
>             file://cross-compile.patch \
> -           file://gcc7.patch \
>             file://detect-atomics-during-configure.patch \
>             file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch=
 \
> +           file://0001-Fix-build-with-musl.patch \
>             "
>
> -SRC_URI[md5sum] =3D "0e2d142a586e4ff79cf0324f4fdbf20c"
> -SRC_URI[sha256sum] =3D "fc23650df953123c59b9c0edf3855e7bd55bd107820997fc=
72375811e1ea4b21"
> +SRC_URI[md5sum] =3D "10d86dd5a5b68875654cc38af139f382"
> +SRC_URI[sha256sum] =3D "b583e46a3de36a3e80ba33b084ead60512a2046aca01ff61=
e50e519436e5038d"
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features=
_check upstream-version-is-even gtk-doc
>
> @@ -37,7 +35,7 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo libxsl=
t libxt libidn libgcrypt \
>            pango icu bison-native gawk intltool-native libwebp \
>            atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora lib=
vorbis libxcomposite libxtst \
>            ruby-native libnotify gstreamer1.0-plugins-bad \
> -          gettext-native glib-2.0 glib-2.0-native \
> +          gettext-native glib-2.0 glib-2.0-native libtasn1 \
>            "
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11=
', 'wayland' ,d)} \
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

