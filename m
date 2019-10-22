Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id C11367F7D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 22:12:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y3so18866034ljj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hmGmagwqCoZ/UsCq+sDx2Eb0v+PF6nvoZW/EXYNMayU=;
	b=T8yVlA+7bmevT2jVKEt/rOeJhA14f4rPQNhNs0FIplGL3Y960cBy+Vsru5/djeNVux
	aweBBysQwHeou2SOeeSbBKd4GLtRfJwWTzYRVStuSecwKSSmvzb9E4s2y26xgBnR3BHR
	XcOgSEHUgYBUlFwYljeeMSPEHzlBsIwp3RsZjNdydJsuc8nQlUpqk+1Q8Pc7Tu2LEjTz
	p9bcTtzqmvWT96h4bGLiQ9x0NQZ13I63hHipWfdadx/gVWR73xNuC1v6c0xpmgOwcY8r
	46obMNhkRfc6+VhVf81hHba8V9zWQQ0yjTyRTUvvJjKi2NH+sNel5vX/1j0/ou5ev+nh
	bDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hmGmagwqCoZ/UsCq+sDx2Eb0v+PF6nvoZW/EXYNMayU=;
	b=mprAgh4FejCALYhtI59jQi8bc8ADjzecoU5wq2fkEeF259ufnbFuVVDsgMJx+n9wzZ
	9psxjXEem5RPklg6GyaSOYdryEIlFUJbgasdPibZAyFj8nMWwMEoLhZAbY2FTJt1bpy8
	31xZhtBeDCaVkFhat7s1ttRKSy+z/HY/cUUdufDyx0C9RVEjPF2pCxyEeyD6jwBnTwjN
	UH4SzduWOTssUPnUxGrHQrRoYdRV6bX3+hblPCkq03jo/N0hU6XGrgvewq8b6ogCt3ai
	Il+bYU7UtTtgpvJbKhvtnRjJJpZPNR10JtKtolP1sojEdlYE7PnCKHREcbamOAOKoKii
	cpEg==
X-Gm-Message-State: APjAAAXmA9mazRbBp+BLY8qG1Bbz1Yxy2wbkmkYCTsF0Rn+O6tpGc2K6
	YWoHpeYgzK8xrv6Leq5+zJlW6OEM6eHzWakS/7O/Us8C0Z4=
X-Google-Smtp-Source: APXvYqyxat44TxMSj39i8FE/qz0gR/s+3dWSPxUIFI1IC3ViJhxJC3jjE+YQLJkxfsiu5wXh5suOMVNTMrShCmSqhdE=
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr1897754ljm.7.1571782363120;
	Tue, 22 Oct 2019 15:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191012165433.24511-1-alistair@alistair23.me>
In-Reply-To: <20191012165433.24511-1-alistair@alistair23.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Oct 2019 15:07:26 -0700
Message-ID: <CAKmqyKMtXBO6Z2NUC5ewYwYOHneorfrbiMJOf6PZfsg7hybR1Q@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Tue, 22 Oct 2019 22:12:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 12, 2019 at 9:54 AM Alistair Francis <alistair@alistair23.me> wrote:
>
> Upgrade mesa and mesa-gl to 19.2.1.
>
> The license hash change was a trivial new line removal.
>
> The glx-tls option was removed as it isn't included in the meson.build
> file.
>
> The -Dasm=false was removed as it also is no longer included.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Ping!

Alistair

> ---
>  ...llow-enable-DRI-without-DRI-drivers.patch} |  0
>  ...on.build-make-TLS-GLX-optional-again.patch | 52 -------------------
>  .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           | 13 ++---
>  .../mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}   |  7 ++-
>  5 files changed, 7 insertions(+), 65 deletions(-)
>  rename meta/recipes-graphics/mesa/files/{0003-Allow-enable-DRI-without-DRI-drivers.patch => 0002-Allow-enable-DRI-without-DRI-drivers.patch} (100%)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb} (71%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0002-Allow-enable-DRI-without-DRI-drivers.patch
> similarity index 100%
> rename from meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> rename to meta/recipes-graphics/mesa/files/0002-Allow-enable-DRI-without-DRI-drivers.patch
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> deleted file mode 100644
> index 641bacf1d9..0000000000
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
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
> -@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
> -   endif
> - endif
> -
> --pre_args += '-DGLX_USE_TLS'
> -+if get_option('glx-tls')
> -+  pre_args += '-DGLX_USE_TLS'
> -+endif
> - if with_glx != 'disabled'
> -   if not (with_platform_x11 and with_any_opengl)
> -     error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
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
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9e5808ee27..dbf3f2ca67 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> +LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
>
>  PE = "2"
>
> @@ -57,12 +57,11 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
> -                   glx-tls \
>                    "
> -PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
> -PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
> +PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
> +PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
>
> -PACKAGECONFIG_remove_libc-musl = "glx-tls"
> +PACKAGECONFIG_remove_libc-musl = ""
>
>  # "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
> @@ -70,7 +69,6 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
>  X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
> -PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
>  PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
>  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
>
> @@ -140,9 +138,6 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
>
>  PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
>
> -# mesa tries to run cross-built gen_matypes on build machine to get struct size information
> -EXTRA_OEMESON_append = " -Dasm=false"
> -
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> similarity index 71%
> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_19.2.1.bb
> index 19221e9e25..6e87e0eb6a 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> @@ -2,12 +2,11 @@ require ${BPN}.inc
>
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> -           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
> -           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
> +           file://0002-Allow-enable-DRI-without-DRI-drivers.patch \
>             "
>
> -SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
> -SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
> +SRC_URI[md5sum] = "8f9c05cfbf7b357c60a5345bb87a92c7"
> +SRC_URI[sha256sum] = "4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.23.0
>

