Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA457FD56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 07:33:13 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id s142so2347663vkd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 23:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uObWoRmvq6WjQe/wMNneO63TQHSMglZbT+VeNC6JSZ8=;
	b=GD0b/i4AL3yMVyITqIYnCzil+Usvkoj6ospxLn0CKP84uY7npFaQBFFIEzejTJQwzA
	GY7skEi6ZktACEt2798C9HCVT75NOVu7T1/0m3WtK8G5PBmTj+NbH+nLp7FsH1NxJ9yD
	1GImfodlb8zCJUnHEFVeboFkOp3qwGbN2zLVOp8D/ST85eQhPBdaAY0qPRAcZwxanG5+
	M3Gq9m5oRi5l27K8eWGXm0bwsDPYbYBjrXpJIMd7gitpKoFHQfMVhBLq8XqgGJ4VxWxv
	Xec+OTrrbCVH/4Pqawg1RaiphhyLsZGGMISgINKhgHnIDOJ7N2yWhuBCFlUJ83VhcbXU
	hIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uObWoRmvq6WjQe/wMNneO63TQHSMglZbT+VeNC6JSZ8=;
	b=SshZLwY4haun71fakgsyl1jnI0Q8xSCq43iOwuIQEJAcjmZeXzhQj+Cl1Y/wkVhDNb
	X2qqCp1SulmQ4rsVihhtDHwXoZWV04hLHBAH/mO3j8LTFb22V9U8L+OfWGHkE1QGonO8
	uWWsIalPC2Ev96JqwTA3q++5XV8q9yBccUxXaLqWRW8UYKw/KtkIZhMtng0H6qKvSzD9
	yU6FtlH75+ixF7W/69lSTXcKr6z0KeYLDusgfVt6fYvaIRTPAWyfwHx09rD2DuxKMrdN
	QoG0QcBjv9+9QKsUbQxMPkhr/Y+q0teeqggtmXmj5f1eeFMaWDPE0iTGts20UrfH5Lyk
	6a9Q==
X-Gm-Message-State: APjAAAVpZnTOYrWgsjNfC/M5ybh/OtbLz2xb3VPPtEeny7X+bulSzYNZ
	EGUUjzylBecCZRtzyQQFYZvbwL5x1gKzkgFvy38=
X-Google-Smtp-Source: APXvYqwKLcmH4YqzZcRrQ6eQvRG66TnZJdwmizkKinWXWe6pXbzD7Qys0gbuqD04RA8AfFDsfTpCpbleny34yrWlchw=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr8857892vkc.1.1576827194088; 
	Thu, 19 Dec 2019 23:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20191220041501.19716-1-alistair@alistair23.me>
	<20191220041501.19716-2-alistair@alistair23.me>
In-Reply-To: <20191220041501.19716-2-alistair@alistair23.me>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 08:33:00 +0100
Message-ID: <CANNYZj_0jEV9MoWtaoT7faPKjdvWwHcde1AD9qhGk39V1jLgWQ@mail.gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Fri, 20 Dec 2019 07:33:13 -0000
Content-Type: multipart/alternative; boundary="000000000000c6a154059a1db071"

--000000000000c6a154059a1db071
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Dec 2019 at 05:15, Alistair Francis <alistair@alistair23.me>
wrote:

> Upgrade mesa to 19.3 and refresh the patches.
>
> Also change the regex to not look for x.x.0 versions as they are
> development versions
>

Old: mesa-(?P<pver>\d+(\.\d+)+)
New: mesa-(?P<pver>\d+(\.^[1-9]\d+)+)

I'm not sure what you had in mind, but the new regex does not work at all,
as ^ outside of [] means "beginning of string", and placing [1-9] where it
is would mean it would also exclude x.0.x versions.

To test, use https://regex101.com/, and you should also run 'devtool
latest-version mesa'. I actually think it's fine to leave the regex as it
is, x.x.1 versions are usually quick to follow, and it's good to get an
earlier notice of a new release.

Alex


> As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going
> to change the do_install and add a patch to libepoxy to use the new
> define.
>
> 1:
> https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  ...atch_common.h-define-also-EGL_NO_X11.patch | 26 +++++++++++++++++++
>  .../libepoxy/libepoxy_1.5.4.bb                |  1 +
>  ...k-for-all-linux-host_os-combinations.patch | 18 ++++++-------
>  ...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++++-------
>  ...Allow-enable-DRI-without-DRI-drivers.patch | 10 +++----
>  ...le-asm-unconditionally-now-that-gen_.patch | 10 +++----
>  .../{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb}  |  0
>  .../mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb}   |  8 +++---
>  8 files changed, 59 insertions(+), 32 deletions(-)
>  create mode 100644
> meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.2.4.bb => mesa-gl_19.3.1.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.2.4.bb => mesa_19.3.1.bb}
> (60%)
>
> diff --git
> a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
> b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
> new file mode 100644
> index 0000000000..7262945181
> --- /dev/null
> +++
> b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
> @@ -0,0 +1,26 @@
> +From 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Fri, 25 Oct 2019 11:09:34 +0000
> +Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
> +
> +MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
> +
> https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
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
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> index 4caf672369..af9867407e 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> @@ -10,6 +10,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>
>  SRC_URI = "
> https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
> +           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
>             "
>  SRC_URI[md5sum] = "00f47ad447321f9dc59f85bc1c9d0467"
>  SRC_URI[sha256sum] =
> "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2"
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> index 1869e11059..085254323c 100644
> ---
> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> +++
> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
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
> -@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
> +@@ -124,7 +124,7 @@ with_any_opengl = with_opengl or with_gles1 or
> with_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
> - with_shared_glapi = get_option('shared-glapi') and with_any_opengl
> + with_shared_glapi = with_shared_glapi and with_any_opengl
>
>  -system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',
> 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
>  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd',
> 'dragonfly'].contains(host_machine.system()) or
> host_machine.system().startswith('linux')
>
>   dri_drivers = get_option('dri-drivers')
>   if dri_drivers.contains('auto')
> -@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
> +@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
>   endif
>
>   # TODO: this is very incomplete
> --if ['linux', 'cygwin', 'gnu',
> 'gnu/kfreebsd'].contains(host_machine.system())
> +-if ['linux', 'cygwin', 'gnu', 'freebsd',
> 'gnu/kfreebsd'].contains(host_machine.system())
>  +if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or
> host_machine.system().startswith('linux')
>     pre_args += '-D_GNU_SOURCE'
>   elif host_machine.system() == 'sunos'
> diff --git
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> index 199ed572d5..cd35a1f850 100644
> ---
> a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> +++
> b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
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
> @@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis <
> alistair.francis@wdc.com>
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
>  diff --git a/meson.build b/meson.build
> -index a1f098c..1e31eb4 100644
> +index 09e3759..a954118 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or
> with_platform_surfaceless or with_plat
> +@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or
> with_platform_surfaceless or with_plat
>   endif
>
>   # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF
> TLS.
> --if not with_platform_android or get_option('platform-sdk-version') >= 29
> +-if host_machine.system() != 'windows' and (not with_platform_android or
> get_option('platform-sdk-version') >= 29)
>  +if (not with_platform_android or get_option('platform-sdk-version') >=
> 29) and get_option('elf-tls')
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
> diff --git
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> index c20a1f7c52..a0536c87ac 100644
> ---
> a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> +++
> b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> @@ -1,4 +1,4 @@
> -From 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 2001
> +From 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 2001
>  From: Fabio Berton <fabio.berton@ossystems.com.br>
>  Date: Wed, 12 Jun 2019 14:18:31 -0300
>  Subject: [PATCH] Allow enable DRI without DRI drivers
> @@ -15,10 +15,10 @@ Signed-off-by: Otavio Salvador <
> otavio@ossystems.com.br>
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
> diff --git
> a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> index b5658d0c9d..8d614e571a 100644
> ---
> a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
> +++
> b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
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
> +@@ -1093,41 +1094,68 @@ dep_ws2_32 = cc.find_library('ws2_32', required :
> with_platform_windows)
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
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
> b/meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
> b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
> similarity index 60%
> rename from meta/recipes-graphics/mesa/mesa_19.2.4.bb
> rename to meta/recipes-graphics/mesa/mesa_19.3.1.bb
> index f4b33df227..d105fec4df 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
> @@ -7,15 +7,15 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
>             "
>
> -SRC_URI[md5sum] = "5c047732b81651ddb341597528b4b096"
> -SRC_URI[sha256sum] =
> "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f"
> +SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
> +SRC_URI[sha256sum] =
> "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59"
>
> -UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> +UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.^[1-9]\d+)+)"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
> then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if
> defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#elif defined(__unix__) &&
> defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) ||
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c6a154059a1db071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 20 Dec 2019 at 05:15, Alistair Fr=
ancis &lt;<a href=3D"mailto:alistair@alistair23.me">alistair@alistair23.me<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Upgrade mesa to 19.3 and refresh the patches.<br>
<br>
Also change the regex to not look for x.x.0 versions as they are<br>
development versions<br></blockquote><div><br></div><div>Old: mesa-(?P&lt;p=
ver&gt;\d+(\.\d+)+)</div><div>New: mesa-(?P&lt;pver&gt;\d+(\.^[1-9]\d+)+)</=
div><div><br></div><div>I&#39;m not sure what you had in mind, but the new =
regex does not work at all, as ^ outside of [] means &quot;beginning of str=
ing&quot;, and placing [1-9] where it is would mean it would also exclude x=
.0.x versions.</div><div><br></div><div>To test, use <a href=3D"https://reg=
ex101.com/">https://regex101.com/</a>, and you should also run &#39;devtool=
 latest-version mesa&#39;. I actually think it&#39;s fine to leave the rege=
x as it is, x.x.1 versions are usually quick to follow, and it&#39;s good t=
o get an earlier notice of a new release.<br></div><div><br></div><div>Alex=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going<br=
>
to change the do_install and add a patch to libepoxy to use the new<br>
define.<br>
<br>
1: <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18=
dc31ba7e2f4ea915b67eacc1ddb" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc=
1ddb</a><br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.m=
e" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
---<br>
=C2=A0...atch_common.h-define-also-EGL_NO_X11.patch | 26 ++++++++++++++++++=
+<br>
=C2=A0.../libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" rel=3D"noreferrer" =
target=3D"_blank">libepoxy_1.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0...k-for-all-linux-host_os-combinations.patch | 18 ++++++-------<br>
=C2=A0...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++++-------<br>
=C2=A0...Allow-enable-DRI-without-DRI-drivers.patch | 10 +++----<br>
=C2=A0...le-asm-unconditionally-now-that-gen_.patch | 10 +++----<br>
=C2=A0.../{<a href=3D"http://mesa-gl_19.2.4.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa-gl_19.2.4.bb</a> =3D&gt; <a href=3D"http://mesa-gl_19.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.3.1.bb</a>}=C2=A0 |=C2=
=A0 0<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_19.2.4.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_19.2.4.bb</a> =3D&gt; <a href=3D"http://mesa_19.3.1.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_19.3.1.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
8 +++---<br>
=C2=A08 files changed, 59 insertions(+), 32 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch=
_common.h-define-also-EGL_NO_X11.patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_19.2.4.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.2.4.bb</a> =3D&gt; <a hr=
ef=3D"http://mesa-gl_19.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-g=
l_19.3.1.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_19.2.4.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_19.2.4.bb</a> =3D&gt; <a href=3D"=
http://mesa_19.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_19.3.1.bb<=
/a>} (60%)<br>
<br>
diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-de=
fine-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-disp=
atch_common.h-define-also-EGL_NO_X11.patch<br>
new file mode 100644<br>
index 0000000000..7262945181<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-al=
so-EGL_NO_X11.patch<br>
@@ -0,0 +1,26 @@<br>
+From 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Fri, 25 Oct 2019 11:09:34 +0000<br>
+Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11<br>
+<br>
+MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:<br>
+<a href=3D"https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4e=
a915b67eacc1ddb" rel=3D"noreferrer" target=3D"_blank">https://github.com/me=
sa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb</a><br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+---<br>
+ src/dispatch_common.h | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/src/dispatch_common.h b/src/dispatch_common.h<br>
+index dcb3a35..c206253 100644<br>
+--- a/src/dispatch_common.h<br>
++++ b/src/dispatch_common.h<br>
+@@ -52,6 +52,7 @@<br>
+=C2=A0 * should do the same<br>
+=C2=A0 */<br>
+ #=C2=A0 define MESA_EGL_NO_X11_HEADERS 1<br>
++#=C2=A0 define EGL_NO_X11 1<br>
+ # endif<br>
+ #include &quot;epoxy/egl.h&quot;<br>
+ #endif<br>
diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.=
4.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a> b/meta/rec=
ipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" rel=3D"noreferr=
er" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
index 4caf672369..af9867407e 100644<br>
--- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
+++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
@@ -10,6 +10,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D58ef4c80d401e07bd9ee8=
b6b58cf464b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/$%7BBPN%7D/rel=
eases/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz<=
/a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dispatch_common.h-def=
ine-also-EGL_NO_X11.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;00f47ad447321f9dc59f85bc1c9d0467&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;0bd2cc681dfeffdef739cb29913f8c3caa47a88a=
451fd2bc6e606c02997289d2&quot;<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-al=
l-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-=
meson.build-check-for-all-linux-host_os-combinations.patch<br>
index 1869e11059..085254323c 100644<br>
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux=
-host_os-combinations.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux=
-host_os-combinations.patch<br>
@@ -1,6 +1,6 @@<br>
-From b6d9bc97cb0e8c540a45dba5440b036fb940ff95 Mon Sep 17 00:00:00 2001<br>
-From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" tar=
get=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
-Date: Mon, 11 Nov 2019 09:38:15 -0800<br>
+From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001<br>
+From: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.me" targe=
t=3D"_blank">alistair@alistair23.me</a>&gt;<br>
+Date: Thu, 14 Nov 2019 13:04:49 -0800<br>
=C2=A0Subject: [PATCH] meson.build: check for all linux host_os combination=
s<br>
<br>
=C2=A0Make sure that we are also looking for our host_os combinations like<=
br>
@@ -13,30 +13,30 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.co=
m" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
=C2=A0Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
-Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
+Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.=
me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
<br>
=C2=A0---<br>
=C2=A0 meson.build | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index d584152..a1f098c 100644<br>
+index 898d025..09e3759 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -117,7 +117,7 @@ with_any_opengl =3D with_opengl or with_gles1 or with_=
gles2<br>
+@@ -124,7 +124,7 @@ with_any_opengl =3D with_opengl or with_gles1 or with_=
gles2<br>
=C2=A0 # Only build shared_glapi if at least one OpenGL API is enabled<br>
- with_shared_glapi =3D get_option(&#39;shared-glapi&#39;) and with_any_ope=
ngl<br>
+ with_shared_glapi =3D with_shared_glapi and with_any_opengl<br>
<br>
=C2=A0-system_has_kms_drm =3D [&#39;openbsd&#39;, &#39;netbsd&#39;, &#39;fr=
eebsd&#39;, &#39;gnu/kfreebsd&#39;, &#39;dragonfly&#39;, &#39;linux&#39;, &=
#39;sunos&#39;].contains(host_machine.system())<br>
=C2=A0+system_has_kms_drm =3D [&#39;openbsd&#39;, &#39;netbsd&#39;, &#39;fr=
eebsd&#39;, &#39;dragonfly&#39;].contains(host_machine.system()) or host_ma=
chine.system().startswith(&#39;linux&#39;)<br>
<br>
=C2=A0 dri_drivers =3D get_option(&#39;dri-drivers&#39;)<br>
=C2=A0 if dri_drivers.contains(&#39;auto&#39;)<br>
-@@ -856,7 +856,7 @@ if cc.compiles(&#39;__uint128_t foo(void) { return 0; =
}&#39;,<br>
+@@ -884,7 +884,7 @@ if cc.compiles(&#39;__uint128_t foo(void) { return 0; =
}&#39;,<br>
=C2=A0 endif<br>
<br>
=C2=A0 # TODO: this is very incomplete<br>
--if [&#39;linux&#39;, &#39;cygwin&#39;, &#39;gnu&#39;, &#39;gnu/kfreebsd&#=
39;].contains(host_machine.system())<br>
+-if [&#39;linux&#39;, &#39;cygwin&#39;, &#39;gnu&#39;, &#39;freebsd&#39;, =
&#39;gnu/kfreebsd&#39;].contains(host_machine.system())<br>
=C2=A0+if [&#39;cygwin&#39;, &#39;gnu&#39;, &#39;gnu/kfreebsd&#39;].contain=
s(host_machine.system()) or host_machine.system().startswith(&#39;linux&#39=
;)<br>
=C2=A0 =C2=A0 pre_args +=3D &#39;-D_GNU_SOURCE&#39;<br>
=C2=A0 elif host_machine.system() =3D=3D &#39;sunos&#39;<br>
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF=
-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TL=
S-ELF-optional.patch<br>
index 199ed572d5..cd35a1f850 100644<br>
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-option=
al.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-option=
al.patch<br>
@@ -1,13 +1,13 @@<br>
-From af6923544de02ded648a736e07b9bd8b7c52dba9 Mon Sep 17 00:00:00 2001<br>
-From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" tar=
get=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
-Date: Wed, 23 Oct 2019 09:46:28 -0700<br>
+From df835389699b32bb6610b39972502e323f8e09e5 Mon Sep 17 00:00:00 2001<br>
+From: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.me" targe=
t=3D"_blank">alistair@alistair23.me</a>&gt;<br>
+Date: Thu, 14 Nov 2019 13:08:31 -0800<br>
=C2=A0Subject: [PATCH] meson.build: make TLS ELF optional<br>
<br>
=C2=A0USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original &q=
uot;make<br>
=C2=A0TLS GLX optional again&quot; patch updated to the latest mesa.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
-Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
+Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.=
me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
<br>
=C2=A0---<br>
=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
@@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:a=
listair.francis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;=
<br>
=C2=A0 2 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index a1f098c..1e31eb4 100644<br>
+index 09e3759..a954118 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_platfor=
m_surfaceless or with_plat<br>
+@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or with_platfor=
m_surfaceless or with_plat<br>
=C2=A0 endif<br>
<br>
=C2=A0 # Android uses emutls for versions &lt;=3D P/28. For USE_ELF_TLS we =
need ELF TLS.<br>
--if not with_platform_android or get_option(&#39;platform-sdk-version&#39;=
) &gt;=3D 29<br>
+-if host_machine.system() !=3D &#39;windows&#39; and (not with_platform_an=
droid or get_option(&#39;platform-sdk-version&#39;) &gt;=3D 29)<br>
=C2=A0+if (not with_platform_android or get_option(&#39;platform-sdk-versio=
n&#39;) &gt;=3D 29) and get_option(&#39;elf-tls&#39;)<br>
=C2=A0 =C2=A0 pre_args +=3D &#39;-DUSE_ELF_TLS&#39;<br>
=C2=A0 endif<br>
<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index b768c15..76cef24 100644<br>
+index 626baf3..637ff14 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
-@@ -333,6 +333,12 @@ option(<br>
+@@ -341,6 +341,12 @@ option(<br>
=C2=A0 =C2=A0 value : true,<br>
=C2=A0 =C2=A0 description : &#39;Enable direct rendering in GLX and EGL for=
 DRI&#39;,<br>
=C2=A0 )<br>
diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without=
-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI=
-without-DRI-drivers.patch<br>
index c20a1f7c52..a0536c87ac 100644<br>
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-dr=
ivers.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-dr=
ivers.patch<br>
@@ -1,4 +1,4 @@<br>
-From 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 2001<br>
+From 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.b=
r" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
=C2=A0Date: Wed, 12 Jun 2019 14:18:31 -0300<br>
=C2=A0Subject: [PATCH] Allow enable DRI without DRI drivers<br>
@@ -15,10 +15,10 @@ Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:ot=
avio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br=
>
=C2=A0 2 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index 1e31eb4..512eec6 100644<br>
+index a954118..62864c6 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
-@@ -147,7 +147,7 @@ with_dri_r200 =3D dri_drivers.contains(&#39;r200&#39;)=
<br>
+@@ -154,7 +154,7 @@ with_dri_r200 =3D dri_drivers.contains(&#39;r200&#39;)=
<br>
=C2=A0 with_dri_nouveau =3D dri_drivers.contains(&#39;nouveau&#39;)<br>
=C2=A0 with_dri_swrast =3D dri_drivers.contains(&#39;swrast&#39;)<br>
<br>
@@ -28,10 +28,10 @@ index 1e31eb4..512eec6 100644<br>
=C2=A0 gallium_drivers =3D get_option(&#39;gallium-drivers&#39;)<br>
=C2=A0 if gallium_drivers.contains(&#39;auto&#39;)<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index 76cef24..a8abd04 100644<br>
+index 637ff14..700c34c 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
-@@ -34,6 +34,12 @@ option(<br>
+@@ -35,6 +35,12 @@ option(<br>
=C2=A0 =C2=A0 choices : [&#39;auto&#39;, &#39;true&#39;, &#39;false&#39;],<=
br>
=C2=A0 =C2=A0 description : &#39;enable support for dri3&#39;<br>
=C2=A0 )<br>
diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-u=
nconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/0004-=
Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch<br>
index b5658d0c9d..8d614e571a 100644<br>
--- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-uncondit=
ionally-now-that-gen_.patch<br>
+++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-uncondit=
ionally-now-that-gen_.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1b1cb6e5ea25eaa98573328b9565728a08245997 Mon Sep 17 00:00:00 2001<br>
+From 41cd8836d785c79381764e7de59319f87959a5cf Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alistair Francis &lt;<a href=3D"mailto:alistair@alistair23.me" =
target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
=C2=A0Date: Thu, 14 Nov 2019 09:06:02 -0800<br>
=C2=A0Subject: [PATCH] Revert &quot;mesa: Enable asm unconditionally, now t=
hat<br>
@@ -15,7 +15,7 @@ Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:ali=
stair@alistair23.me" target=3D"_blank">alistair@alistair23.me</a>&gt;<br>
=C2=A0 2 files changed, 67 insertions(+), 33 deletions(-)<br>
<br>
=C2=A0diff --git a/meson.build b/meson.build<br>
-index 512eec6..a2bcc3a 100644<br>
+index 62864c6..b53be8d 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
=C2=A0@@ -49,6 +49,7 @@ with_vulkan_icd_dir =3D get_option(&#39;vulkan-icd-=
dir&#39;)<br>
@@ -26,7 +26,7 @@ index 512eec6..a2bcc3a 100644<br>
=C2=A0 with_glx_read_only_text =3D get_option(&#39;glx-read-only-text&#39;)=
<br>
=C2=A0 with_glx_direct =3D get_option(&#39;glx-direct&#39;)<br>
=C2=A0 with_osmesa =3D get_option(&#39;osmesa&#39;)<br>
-@@ -985,41 +986,68 @@ endif<br>
+@@ -1093,41 +1094,68 @@ dep_ws2_32 =3D cc.find_library(&#39;ws2_32&#39;, r=
equired : with_platform_windows)<br>
<br>
=C2=A0 # TODO: shared/static? Is this even worth doing?<br>
<br>
@@ -129,10 +129,10 @@ index 512eec6..a2bcc3a 100644<br>
=C2=A0 endif<br>
<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index a8abd04..0f4bd80 100644<br>
+index 700c34c..62e8472 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
-@@ -233,6 +233,12 @@ option(<br>
+@@ -241,6 +241,12 @@ option(<br>
=C2=A0 =C2=A0 value : false,<br>
=C2=A0 =C2=A0 description : &#39;Enable GLVND support.&#39;<br>
=C2=A0 )<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.2.4.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.2.4.bb</a> b/meta/recipes=
-graphics/mesa/<a href=3D"http://mesa-gl_19.3.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mesa-gl_19.3.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.2.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa-gl_19.2.4.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_19.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa-gl_19.3.1.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.2.4.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_19.2.4.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_19.3.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_19.3.1.bb</a><br>
similarity index 60%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_19.2.4.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_19.3.1.bb</a><br>
index f4b33df227..d105fec4df 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.2.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_19.2.4.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_19.3.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_19.3.1.bb</a><br>
@@ -7,15 +7,15 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Revert-mesa-Enable-as=
m-unconditionally-now-that-gen_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;5c047732b81651ddb341597528b4b096&quot;<br>
-SRC_URI[sha256sum] =3D &quot;09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c03=
29181968596e548e30f&quot;<br>
+SRC_URI[md5sum] =3D &quot;5c5965db31993af47fee82c9a7ccba5e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4=
eb8274723e033beae59&quot;<br>
<br>
-UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.^[1-9]\d+)+=
)&quot;<br>
<br>
=C2=A0#because we cannot rely on the fact that all apps will use pkgconfig,=
<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;e=
gl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D=
}${includedir}/EGL/eglplatform.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#elif defined(__unix__) &amp=
;&amp; defined(EGL_NO_X11)$/#elif defined(__unix__) \&amp;\&amp; defined(EG=
L_NO_X11) || ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &=
#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
-- <br>
2.24.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000c6a154059a1db071--
