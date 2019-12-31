Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5A347F9A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:05:44 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 15so26188555lfr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gKeTLeQaifzlnKPZ5x8UwpPsc94555yIIluDXabG334=;
	b=BzN6cRYd9l+CpnJ0BE/RYs3xndt5kOzcUUIKjuXn/vSb1cX5H3TM46WrwPb4DAkpQu
	L3p+CCKDvzEdn7XGhqExXxxptELXNzM+uuKVQOanop6E9m91E4hYLvXPikwTiKoeM7bp
	47ahD38BINDRvPCqx8V833qi4/BEXcQnw073n7PrATksXDIqudEMQ5PvWDrrtE0di99d
	Z4Z1UISlG8NArMLaVFzbqrHWwy2DVsjWS4eLyxLYcYtuV/L6DmOMu4hHfZRPNFVwgIaU
	Sw5C+nk1mYC7c/F9B+hOisZ9EpYYPsZnXNCHPXI/tSpmFrkEd1IbsD8mNrymy6hlVlv2
	E5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gKeTLeQaifzlnKPZ5x8UwpPsc94555yIIluDXabG334=;
	b=l9XFUksUL98wds4sXkda7yzIVq0NHmIAv9A+Tvbd4m9bcBg/42/tnMxujWCF/x2IX1
	szDPfpcwT+xuC26PIPEUnrxZ5uXF88y/vn33MUwrF2/8QiFjjOlCElVfvFK6mv/556el
	bPESDI5YrAPpio2yUDNmS8gMWJzU+//fgQD7K5FUf4wjWSboIdNzv1yUvV3uvewFSDu1
	4WJ50uJ7ujVGWREUdYsfgoY6YZWUxkwPbC3ECJtCRdw7mr1wzZ0fvXmETBmDqC9Afduq
	huaIOwaTmbZm3BcGbsC1OuVWqa/lXYXCEne3I+oemaJ0vXGVl+1yhI2Jd+Enc5ABNflK
	Y9TQ==
X-Gm-Message-State: APjAAAXBoj9KMUwkf+Y3Ne3aRxuzLCT0B3Sf2Kq86uqOf/sxgCPsgFaL
	+yuHuT9+RRjAQBtLbAwlTGx/kc7ElGnoNiHkDzo=
X-Google-Smtp-Source: APXvYqyux12Ww5Eq3KLUN0aC+YVyooUB5M6xPMvoYeTmVrjebqbW3B7fuhZMN6f+A3+cSBGHlRRxiMAtBthzvMQAtTk=
X-Received: by 2002:a19:c648:: with SMTP id w69mr39554404lff.44.1577754345217; 
	Mon, 30 Dec 2019 17:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20191221063648.24227-1-alistair@alistair23.me>
	<20191221063648.24227-2-alistair@alistair23.me>
In-Reply-To: <20191221063648.24227-2-alistair@alistair23.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Dec 2019 17:05:15 -0800
Message-ID: <CAKmqyKN=9HZ78bGpsOumv9vDiWOsz59eUiNgBfH2ns+bhY1qUA@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Tue, 31 Dec 2019 01:05:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 20, 2019 at 10:36 PM Alistair Francis
<alistair@alistair23.me> wrote:
>
> Upgrade mesa to 19.3 and refresh the patches.
>
> As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going
> to change the do_install and add a patch to libepoxy to use the new
> define.
>
> 1: https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Ping!

Alistair

> ---
>  ...atch_common.h-define-also-EGL_NO_X11.patch | 26 +++++++++++++++++++
>  .../libepoxy/libepoxy_1.5.4.bb                |  1 +
>  ...k-for-all-linux-host_os-combinations.patch | 18 ++++++-------
>  ...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++++-------
>  ...Allow-enable-DRI-without-DRI-drivers.patch | 10 +++----
>  ...le-asm-unconditionally-now-that-gen_.patch | 10 +++----
>  .../{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb}  |  0
>  .../mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb}   |  6 ++---
>  8 files changed, 58 insertions(+), 31 deletions(-)
>  create mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb} (66%)
>
> diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
> new file mode 100644
> index 0000000000..7262945181
> --- /dev/null
> +++ b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
> @@ -0,0 +1,26 @@
> +From 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 25 Oct 2019 11:09:34 +0000
> +Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
> +
> +MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
> +https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Upstream-Status: Pending
> +---
> + src/dispatch_common.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/dispatch_common.h b/src/dispatch_common.h
> +index dcb3a35..c206253 100644
> +--- a/src/dispatch_common.h
> ++++ b/src/dispatch_common.h
> +@@ -52,6 +52,7 @@
> +  * should do the same
> +  */
> + #  define MESA_EGL_NO_X11_HEADERS 1
> ++#  define EGL_NO_X11 1
> + # endif
> + #include "epoxy/egl.h"
> + #endif
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> index 4caf672369..af9867407e 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> @@ -10,6 +10,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>
>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
> +           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
>             "
>  SRC_URI[md5sum] = "00f47ad447321f9dc59f85bc1c9d0467"
>  SRC_URI[sha256sum] = "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2"
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> index 1869e11059..085254323c 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> @@ -1,6 +1,6 @@
> -From b6d9bc97cb0e8c540a45dba5440b036fb940ff95 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Mon, 11 Nov 2019 09:38:15 -0800
> +From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Thu, 14 Nov 2019 13:04:49 -0800
>  Subject: [PATCH] meson.build: check for all linux host_os combinations
>
>  Make sure that we are also looking for our host_os combinations like
> @@ -13,30 +13,30 @@ Upstream-Status: Pending
>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
>
>  ---
>   meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index d584152..a1f098c 100644
> +index 898d025..09e3759 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> +@@ -124,7 +124,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
> - with_shared_glapi = get_option('shared-glapi') and with_any_opengl
> + with_shared_glapi = with_shared_glapi and with_any_opengl
>
>  -system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
>  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
>
>   dri_drivers = get_option('dri-drivers')
>   if dri_drivers.contains('auto')
> -@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
> +@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
>   endif
>
>   # TODO: this is very incomplete
> --if ['linux', 'cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system())
> +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd'].contains(host_machine.system())
>  +if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or host_machine.system().startswith('linux')
>     pre_args += '-D_GNU_SOURCE'
>   elif host_machine.system() == 'sunos'
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> index 199ed572d5..cd35a1f850 100644
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> @@ -1,13 +1,13 @@
> -From af6923544de02ded648a736e07b9bd8b7c52dba9 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Wed, 23 Oct 2019 09:46:28 -0700
> +From df835389699b32bb6610b39972502e323f8e09e5 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair@alistair23.me>
> +Date: Thu, 14 Nov 2019 13:08:31 -0800
>  Subject: [PATCH] meson.build: make TLS ELF optional
>
>  USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make
>  TLS GLX optional again" patch updated to the latest mesa.
>
>  Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
>
>  ---
>   meson.build       | 2 +-
> @@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
>  diff --git a/meson.build b/meson.build
> -index a1f098c..1e31eb4 100644
> +index 09e3759..a954118 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
> +@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
>   endif
>
>   # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
> --if not with_platform_android or get_option('platform-sdk-version') >= 29
> +-if host_machine.system() != 'windows' and (not with_platform_android or get_option('platform-sdk-version') >= 29)
>  +if (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
>     pre_args += '-DUSE_ELF_TLS'
>   endif
>
>  diff --git a/meson_options.txt b/meson_options.txt
> -index b768c15..76cef24 100644
> +index 626baf3..637ff14 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -333,6 +333,12 @@ option(
> +@@ -341,6 +341,12 @@ option(
>     value : true,
>     description : 'Enable direct rendering in GLX and EGL for DRI',
>   )
> diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> index c20a1f7c52..a0536c87ac 100644
> --- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> +++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> @@ -1,4 +1,4 @@
> -From 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 2001
> +From 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 2001
>  From: Fabio Berton <fabio.berton@ossystems.com.br>
>  Date: Wed, 12 Jun 2019 14:18:31 -0300
>  Subject: [PATCH] Allow enable DRI without DRI drivers
> @@ -15,10 +15,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
>  diff --git a/meson.build b/meson.build
> -index 1e31eb4..512eec6 100644
> +index a954118..62864c6 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -147,7 +147,7 @@ with_dri_r200 = dri_drivers.contains('r200')
> +@@ -154,7 +154,7 @@ with_dri_r200 = dri_drivers.contains('r200')
>   with_dri_nouveau = dri_drivers.contains('nouveau')
>   with_dri_swrast = dri_drivers.contains('swrast')
>
> @@ -28,10 +28,10 @@ index 1e31eb4..512eec6 100644
>   gallium_drivers = get_option('gallium-drivers')
>   if gallium_drivers.contains('auto')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 76cef24..a8abd04 100644
> +index 637ff14..700c34c 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -34,6 +34,12 @@ option(
> +@@ -35,6 +35,12 @@ option(
>     choices : ['auto', 'true', 'false'],
>     description : 'enable support for dri3'
>   )
> diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> index b5658d0c9d..8d614e571a 100644
> --- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> +++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> @@ -1,4 +1,4 @@
> -From 1b1cb6e5ea25eaa98573328b9565728a08245997 Mon Sep 17 00:00:00 2001
> +From 41cd8836d785c79381764e7de59319f87959a5cf Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair@alistair23.me>
>  Date: Thu, 14 Nov 2019 09:06:02 -0800
>  Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
> @@ -15,7 +15,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
>   2 files changed, 67 insertions(+), 33 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index 512eec6..a2bcc3a 100644
> +index 62864c6..b53be8d 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -49,6 +49,7 @@ with_vulkan_icd_dir = get_option('vulkan-icd-dir')
> @@ -26,7 +26,7 @@ index 512eec6..a2bcc3a 100644
>   with_glx_read_only_text = get_option('glx-read-only-text')
>   with_glx_direct = get_option('glx-direct')
>   with_osmesa = get_option('osmesa')
> -@@ -985,41 +986,68 @@ endif
> +@@ -1093,41 +1094,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required : with_platform_windows)
>
>   # TODO: shared/static? Is this even worth doing?
>
> @@ -129,10 +129,10 @@ index 512eec6..a2bcc3a 100644
>   endif
>
>  diff --git a/meson_options.txt b/meson_options.txt
> -index a8abd04..0f4bd80 100644
> +index 700c34c..62e8472 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -233,6 +233,12 @@ option(
> +@@ -241,6 +241,12 @@ option(
>     value : false,
>     description : 'Enable GLVND support.'
>   )
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb b/meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
> similarity index 66%
> rename from meta/recipes-graphics/mesa/mesa_19.2.4.bb
> rename to meta/recipes-graphics/mesa/mesa_19.3.1.bb
> index f4b33df227..c5203c71ff 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
> @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
>             "
>
> -SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
> -SRC_URI[sha256sum] = "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f"
> +SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
> +SRC_URI[sha256sum] = "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -16,6 +16,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --
> 2.24.0
>

