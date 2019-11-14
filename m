Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF90C7F887
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 07:08:37 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a18so2197348plm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 23:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=+4hoO85koIP0hdpGCAUk+ctuiE+piUfbNlV3uLYikkk=;
	b=HjhTBtMY+RbQh+278DWxsdQH6LNdxwy4SlbuPyTbHgXlYSwhilKezy1foLKQyj5HHS
	StPcxHgC8vwGVhVc6+JU9CstTtSeiIDJixhGCCW4+gTlalEVb+2AingzyR+rMEovyKel
	WBO2nf/41rTd7q67T6oP4ojZgdvBHakCx/GTYFAEXfWGMyjDBD3//h/aP0dlIK4wEaRx
	g5vFQviped1nSVaSolh0bqJaDA6Fsch4QUgYksbTGIfumRiy0vTRtMeaU9bWQcnc3jso
	6ZNU9nBYJxQuVM9Ri2KaPsydwmNhAcSsb36Mn0nkFfBYxbf6xvIA3Eu1x86LR6ayXHQN
	StTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=+4hoO85koIP0hdpGCAUk+ctuiE+piUfbNlV3uLYikkk=;
	b=ADbhClcixSWUjvG07esi8nJDP9pXceCLZmCgDzOyPR0We+clRreq+hm4BiMipcMn3t
	SRojzYzNd6GL0RSCC6ei/U7xjfkXuE3p3vu2wNaIc6pHfCOonmJm/KiPUz4h2ix75q37
	gGWgHrQIT346Qui10WG4sV7i0Gvq08uM2/hD70mEp4j1e4w++kxKSgF2+hYrMu3tEfsz
	LdcqNjhg6mT8QQH2e2hX5m7G5DxUCRzLNfTpaGJra8n6tz+VZjKmKrZlE3RPvbNGunN+
	vVC9P5AhUt5TSfQYMCsHPxWynL20GQ209o2e2E4FdMDR7zLzPD6r+HHPiJzGhqYDBHsp
	vqaA==
X-Gm-Message-State: APjAAAWYR83o8IVmg+QY9UMaPkBR+Is1b6eHx7OC0+I8+M7rcPgkQNsV
	/lyR5mT1w8+RRjooUm3X644=
X-Google-Smtp-Source: APXvYqxb+tLi3rX/5t0GB1NGRZRM9wwzWdXRzgauZKa48frQU8sjMsLiiLpCtUGzaqAtlnqiPVhHHg==
X-Received: by 2002:a17:902:a408:: with SMTP id
	p8mr5495045plq.266.1573715318180; 
	Wed, 13 Nov 2019 23:08:38 -0800 (PST)
Received: from tyche ([2601:646:8500:1c20::367e])
	by smtp.gmail.com with ESMTPSA id n72sm4924613pjc.4.2019.11.13.23.08.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 23:08:37 -0800 (PST)
Message-ID: <e49f7e0779ef6550261f37fb43f53a3d49cf23a7.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 23:08:36 -0800
In-Reply-To: <20191112003109.30108-1-alistair.francis@wdc.com>
References: <20191112003109.30108-1-alistair.francis@wdc.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v7] mesa: Upgrade to 19.2.3
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
X-List-Received-Date: Thu, 14 Nov 2019 07:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-11 at 16:31 -0800, Alistair Francis wrote:
> From: Alistair Francis <alistair@alistair23.me>
> 
> Upgrade mesa and mesa-gl to 19.2.3.
> 
> The license hash change was a trivial new line removal.
> 
> The glx-tls option was removed as it isn't included in the
> meson.build
> file. It has been replaced with 'use-elf-tls' instead. We also added
> an
> INSANE_SKIP to fix this error
>     do_package_qa: QA Issue: ELF binary
>     '[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations
> in .text
>     [textrel]
> 
> The -Dasm=false was removed as it also is no longer included.
> 

ARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgl-mesa: ELF
binary /usr/lib/libGL.so.1.2.0 has relocations in .text [textrel]
WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgles1-mesa: ELF
binary /usr/lib/libGLESv1_CM.so.1.1.0 has relocations in .text
[textrel]
WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgles2-mesa: ELF
binary /usr/lib/libGLESv2.so.2.0.0 has relocations in .text [textrel]
WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libglapi: ELF binary
/usr/lib/libglapi.so.0.0.0 has relocations in .text [textrel]

with musl is still seen. I think we need to disable asm at least for
musl case.

> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> v7:
>  - Update to mesa 19.2.3
>  - Add INSANE_SKIP
> v6:
>  - Rebase on master
> v4:
>  - Add a patch (first patch in the series) to fix libsdl2 build
> v3:
>  - Fix missing Upstream-Status
> v2:
>  - Add back "make TLS ELF optional" patch
> 
>  ...k-for-all-linux-host_os-combinations.patch | 23 ++++----
>  ...02-meson.build-make-TLS-ELF-optional.patch | 48 +++++++++++++++++
>  ...on.build-make-TLS-GLX-optional-again.patch | 52 ---------------
> ----
>  .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.3.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           | 18 +++----
>  .../mesa/{mesa_19.1.6.bb => mesa_19.2.3.bb}   |  6 +--
>  6 files changed, 73 insertions(+), 74 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0002-
> meson.build-make-TLS-ELF-optional.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-
> meson.build-make-TLS-GLX-optional-again.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-
> gl_19.2.3.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.3.bb}
> (77%)
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-
> for-all-linux-host_os-combinations.patch b/meta/recipes-
> graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-
> combinations.patch
> index 9fba5da4b2..1aff727455 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-
> all-linux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-
> all-linux-host_os-combinations.patch
> @@ -1,8 +1,7 @@
> -From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00
> 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Wed, 12 Jun 2019 13:40:20 -0300
> +From 7547bd7340dc318392aee8b3a3ad1f9d902121db Mon Sep 17 00:00:00
> 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Mon, 11 Nov 2019 09:38:15 -0800
>  Subject: [PATCH] meson.build: check for all linux host_os
> combinations
> -Organization: O.S. Systems Software LTDA.
>  
>  Make sure that we are also looking for our host_os combinations like
>  linux-musl etc. when assuming support for DRM/KMS.
> @@ -14,29 +13,33 @@ Upstream-Status: Pending
>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>  ---
>   meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/meson.build b/meson.build
> -index 567a81afd6f..b33b430aed4 100644
> +index d58415270d0..a1f098c3b19 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -107,7 +107,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
> +@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi = get_option('shared-glapi') and with_any_opengl
>   
> --system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd',
> 'gnu/kfreebsd', 'dragonfly', 'linux'].contains(host_machine.system())
> +-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd',
> 'gnu/kfreebsd', 'dragonfly', 'linux',
> 'sunos'].contains(host_machine.system())
>  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd',
> 'dragonfly'].contains(host_machine.system()) or
> host_machine.system().startswith('linux')
>   
>   dri_drivers = get_option('dri-drivers')
>   if dri_drivers.contains('auto')
> -@@ -845,7 +845,7 @@ if cc.compiles('int foo(void)
> __attribute__((__noreturn__));',
> +@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return
> 0; }',
>   endif
>   
>   # TODO: this is very incomplete
>  -if ['linux', 'cygwin', 'gnu',
> 'gnu/kfreebsd'].contains(host_machine.system())
>  +if ['cygwin', 'gnu',
> 'gnu/kfreebsd'].contains(host_machine.system()) or
> host_machine.system().startswith('linux')
>     pre_args += '-D_GNU_SOURCE'
> - endif
> - 
> + elif host_machine.system() == 'sunos'
> +   pre_args += '-D__EXTENSIONS__'
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-
> TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-
> meson.build-make-TLS-ELF-optional.patch
> new file mode 100644
> index 0000000000..c3b5e14cd6
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-
> optional.patch
> @@ -0,0 +1,48 @@
> +From edd03b8ea66ccf81b0c1d27868756d06e2d177ab Mon Sep 17 00:00:00
> 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Wed, 23 Oct 2019 09:46:28 -0700
> +Subject: [PATCH] meson.build: make TLS ELF optional
> +
> +USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original
> "make
> +TLS GLX optional again" patch updated to the latest mesa.
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + meson.build       | 2 +-
> + meson_options.txt | 6 ++++++
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 7992734..06653fe 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or
> with_platform_surfaceless or with_plat
> + endif
> + 
> + # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need
> ELF TLS.
> +-if not with_platform_android or get_option('platform-sdk-version')
> >= 29
> ++if (not with_platform_android or get_option('platform-sdk-version') 
> >= 29) and get_option('elf-tls')
> +   pre_args += '-DUSE_ELF_TLS'
> + endif
> + 
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 188e132..ddd47b7 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -339,6 +339,12 @@ option(
> +   value : true,
> +   description : 'Enable direct rendering in GLX and EGL for DRI',
> + )
> ++option(
> ++  'elf-tls',
> ++  type : 'boolean',
> ++  value : true,
> ++  description : 'Enable TLS support in ELF',
> ++)
> + option(
> +   'I-love-half-baked-turnips',
> +   type : 'boolean',
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-
> TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-
> meson.build-make-TLS-GLX-optional-again.patch
> deleted file mode 100644
> index 641bacf1d9..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-
> optional-again.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00
> 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Wed, 12 Jun 2019 14:15:57 -0300
> -Subject: [PATCH] meson.build: make TLS GLX optional again
> -Organization: O.S. Systems Software LTDA.
> -
> -This was optional with autotools, and needs to be disabled
> -when using musl C library, for instance.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - meson.build       | 4 +++-
> - meson_options.txt | 7 +++++++
> - 2 files changed, 10 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index b33b430aed4..0e50bb26c0a 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or
> with_platform_surfaceless or with_plat
> -   endif
> - endif
> - 
> --pre_args += '-DGLX_USE_TLS'
> -+if get_option('glx-tls')
> -+  pre_args += '-DGLX_USE_TLS'
> -+endif
> - if with_glx != 'disabled'
> -   if not (with_platform_x11 and with_any_opengl)
> -     error('Cannot build GLX support without X11 platform support
> and at least one OpenGL API')
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 1f72faabee8..fcd49efea27 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -339,6 +339,13 @@ option(
> -   value : true,
> -   description : 'Enable direct rendering in GLX and EGL for DRI',
> - )
> -+option(
> -+  'glx-tls',
> -+  type : 'boolean',
> -+  value : true,
> -+  description : 'Enable TLS support in GLX',
> -+)
> -+
> - option(
> -   'I-love-half-baked-turnips',
> -   type : 'boolean',
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> b/meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index 9e5808ee27..2f866a505c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
> "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> +LIC_FILES_CHKSUM =
> "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
>  
>  PE = "2"
>  
> @@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??= "
> ${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'opengl egl gles gbm dri gallium', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'x11 dri3', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> vulkan', 'dri3', '', d)} \
> -                   glx-tls \
> +                   elf-tls \
>  		   "
> -PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
> -PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
> +PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
> +PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
>  
> -PACKAGECONFIG_remove_libc-musl = "glx-tls"
> +PACKAGECONFIG_remove_libc-musl = "elf-tls"
>  
>  # "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
> @@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
>  X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage
> libxfixes xrandr"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
> -PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
> +PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
>  PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-
> xvmc=false,libxvmc"
>  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-
> protocols"
>  
> @@ -140,9 +140,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-
> Dosmesa=none"
>  
>  PACKAGECONFIG[unwind] = "-Dlibunwind=true,-
> Dlibunwind=false,libunwind"
>  
> -# mesa tries to run cross-built gen_matypes on build machine to get
> struct size information
> -EXTRA_OEMESON_append = " -Dasm=false"
> -
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>  
> @@ -263,6 +260,9 @@ FILES_libxatracker-dev =
> "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>                            ${includedir}/xa_tracker.h
> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>                            ${libdir}/pkgconfig/xatracker.pc"
>  
> +# This is a work around for 
> https://gitlab.freedesktop.org/mesa/mesa/issues/966
> +INSANE_SKIP_${PN}_libc-musl += "textrel"
> +
>  # Fix upgrade path from mesa to mesa-megadriver
>  RREPLACES_mesa-megadriver = "mesa"
>  RCONFLICTS_mesa-megadriver = "mesa"
> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> b/meta/recipes-graphics/mesa/mesa_19.2.3.bb
> similarity index 77%
> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_19.2.3.bb
> index 19221e9e25..42181db6f8 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.2.3.bb
> @@ -2,12 +2,12 @@ require ${BPN}.inc
>  
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-
> combinations.patch \
> -           file://0002-meson.build-make-TLS-GLX-optional-again.patch 
> \
> +           file://0002-meson.build-make-TLS-ELF-optional.patch \
>             file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
>             "
>  
> -SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
> -SRC_URI[sha256sum] =
> "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
> +SRC_URI[md5sum] = "7744fbc59d55bb9a54ac018250bf77dc"
> +SRC_URI[sha256sum] =
> "5ee6e42504fe41dcc9a6eba26982656a675b2550a640946f463927ed7f1c5047"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  
> -- 
> 2.23.0
> 


