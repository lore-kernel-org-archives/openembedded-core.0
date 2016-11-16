Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACD476025E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 13:39:36 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w194so11823398vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sCe8+8Me2UaTQ2yQ3YIYex51Hdbs3yXYvSFkyuPcQDI=;
	b=p3WXKIUUsYcDIC8jCrWf8p5ZpSPwUN6LxQPFrve5gw+/PvaRYffzQn+BIhe55y3ipj
	xDbopECtTDWFqsTXPUj3JaMXDpjSRbzpK3lnBiDvgFx2sI8HXvmH40wNOh0YuYAMGnVa
	qy+lBf8F6S/GXkMyCLFdZCZDkgs+Db1hHVX/USGGvRzfObtMrUj3Q7hjvToaySewQlXh
	wqgGi418IEdIdvfzL37A0IlGp5fG0eyb+hA2tLEcBk3xtLqVD/Nj4d8DiqIVmSYHrXeu
	p4Ce6+HrPDkj6klqeL5jDuw6KCue2kz6qI8I7leFHQW2YvCqY+KlmX+2NPZGvX5fDVv2
	T2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sCe8+8Me2UaTQ2yQ3YIYex51Hdbs3yXYvSFkyuPcQDI=;
	b=Zz0nkjztxEgKCb+Zr32mPNgO26voZ8G3FLqn3lMOYUJMfbJTLM6gEAN95FnyCFUkvt
	ISTCE6unNz0kZQkpGVKNBLHcAwiHu06nRqMQxFM6eGDds8kx/JissN4xNgMyCOstpvB6
	GXBYXQOWyuXcj+ppPKTjYdPYbFm3U8cgEZltCJ8ny0kXQRl49VNspaVhNdnDGFBwMBN/
	w8i3xQ7b37BHWzS3RoxOqSFaO1jlf7AO0pwnIEUTWIUiDZRMFuN88rhSHuiuoMQRxzIv
	L06q6WB+uBXtgw2Yj5YGWbga/9ILlOOepvkiPzM90/J44frUbCQqznFP5eUGVLgUvoKA
	L0lQ==
X-Gm-Message-State: ABUngvf5Qoq/svVZEaODqmDNI6xCLZq+Uqzbt7yjb/SlnwfChS7T294UAsb13m4b5vIkV7liHafBA92Qq40XPg==
X-Received: by 10.31.201.7 with SMTP id z7mr1200701vkf.67.1479303576865; Wed,
	16 Nov 2016 05:39:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Wed, 16 Nov 2016 05:39:36 -0800 (PST)
In-Reply-To: <2492cb242375d6dbc1efd5c530c555a1cd0dfb72.1479301275.git.jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
	<21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
	<2492cb242375d6dbc1efd5c530c555a1cd0dfb72.1479301275.git.jussi.kukkonen@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 16 Nov 2016 14:39:36 +0100
Message-ID: <CALbNGRQ3D_tsjo7-ZpcPHtyRzzB2WZxVkjDqh3V6JGUxfVCtRQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] mesa: Upgrade 12.0.3 -> 13.0.1
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
X-List-Received-Date: Wed, 16 Nov 2016 13:39:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 16, 2016 at 2:15 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> New major release with OpenGL 4.4 support. Dependency on libudev has
> been removed.
>
> Rebase replace_glibc_check_with_linux.patch.
> Add patch to find native wayland-scanner.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../0001-Use-wayland-scanner-in-the-path.patch     | 37 ++++++++++++++++++++++
>  .../files/replace_glibc_check_with_linux.patch     | 25 ++++++++++-----
>  .../mesa/{mesa-gl_12.0.3.bb => mesa-gl_13.0.1.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc                |  2 +-
>  .../mesa/{mesa_12.0.3.bb => mesa_13.0.1.bb}        |  5 +--
>  5 files changed, 58 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_12.0.3.bb => mesa-gl_13.0.1.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_12.0.3.bb => mesa_13.0.1.bb} (75%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
> new file mode 100644
> index 0000000..e49695b
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-Use-wayland-scanner-in-the-path.patch
> @@ -0,0 +1,37 @@
> +From 2f68fcaaf4964e7feeb383f5c26851965cda037c Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 15 Nov 2016 15:20:49 +0200
> +Subject: [PATCH] Simplify wayland-scanner lookup
> +
> +Don't use pkg-config to lookup the path of a binary that's in the path.
> +
> +Alternatively we'd have to prefix the path returned by pkg-config with
> +PKG_CONFIG_SYSROOT_DIR.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 7 +------
> + 1 file changed, 1 insertion(+), 6 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index e56e35a..a92005a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -2020,12 +2020,7 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
> +     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
> + fi
> +
> +-PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
> +-        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
> +-        WAYLAND_SCANNER='')
> +-if test "x$WAYLAND_SCANNER" = x; then
> +-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> +-fi
> ++AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> +
> + # Do per-EGL platform setups and checks
> + egl_platforms=`IFS=', '; echo $with_egl_platforms`
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
> index e4461ef..0280ee8 100644
> --- a/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
> +++ b/meta/recipes-graphics/mesa/files/replace_glibc_check_with_linux.patch
> @@ -2,16 +2,25 @@ endianness check is OS wide and not specific to libc
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Pending
> -Index: mesa-11.1.1/src/gallium/include/pipe/p_config.h
> -===================================================================
> ---- mesa-11.1.1.orig/src/gallium/include/pipe/p_config.h
> -+++ mesa-11.1.1/src/gallium/include/pipe/p_config.h
> -@@ -130,7 +130,7 @@
> -  * Endian detection.
> -  */
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + src/util/u_endian.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/util/u_endian.h b/src/util/u_endian.h
> +index b9d563d..2d5eab9 100644
> +--- a/src/util/u_endian.h
> ++++ b/src/util/u_endian.h
> +@@ -27,7 +27,7 @@
> + #ifndef U_ENDIAN_H
> + #define U_ENDIAN_H
>
> --#ifdef __GLIBC__
> +-#if defined(__GLIBC__) || defined(ANDROID)
>  +#if defined(__linux__)
>   #include <endian.h>
>
>   #if __BYTE_ORDER == __LITTLE_ENDIAN
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_12.0.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index e4880ff..2f5511e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=899fbe7e42d494c7c8c159c7001693d
>
>  PE = "2"
>
> -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
> +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native"
>
>  PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_12.0.3.bb b/meta/recipes-graphics/mesa/mesa_13.0.1.bb
> similarity index 75%
> rename from meta/recipes-graphics/mesa/mesa_12.0.3.bb
> rename to meta/recipes-graphics/mesa/mesa_13.0.1.bb
> index acc8353..37ac15f 100644
> --- a/meta/recipes-graphics/mesa/mesa_12.0.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_13.0.1.bb
> @@ -3,10 +3,11 @@ require ${BPN}.inc
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
>             file://replace_glibc_check_with_linux.patch \
>             file://disable-asm-on-non-gcc.patch \
> +           file://0001-Use-wayland-scanner-in-the-path.patch \
>  "
>
> -SRC_URI[md5sum] = "1113699c714042d8c4df4766be8c57d8"
> -SRC_URI[sha256sum] = "1dc86dd9b51272eee1fad3df65e18cda2e556ef1bc0b6e07cd750b9757f493b1"
> +SRC_URI[md5sum] = "72b7f4d0c2407f367484abd201cb8276"
> +SRC_URI[sha256sum] = "71962fb2bf77d33b0ad4a565b490dbbeaf4619099c6d9722f04a73187957a731"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.1.4
>
I had already tested mesa 13.0.0 and ran into similar problems as
reported in [1]. So I waited for libdrm which was updated yesterday.
Can you prepare an update for libdrm 2.4.73 too - or shall I take
care?

[1] https://bugs.freedesktop.org/show_bug.cgi?id=98563

Andreas

