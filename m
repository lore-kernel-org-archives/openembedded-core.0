Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDDBC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:44:46 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.54923.1669923882855133837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n7v5Qdrv;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-14286d5ebc3so3369191fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qbciIXRzNfyTvoR8QFtWep2Lmj5iQNIOWSVgX25MrQE=;
        b=n7v5QdrvAyt/wNzagInMprFoBqW439XhPU5krsAqFBXIX7YHuTNOcx9nr435w9C+/V
         dLNmJO3yAhfhParh/JguBIKaDxjxKllYgSqhUbHjj84b0g9ngkJ5/djqhb/VM/a/Z4uZ
         iGlUGZx/szu5Z0W6TiMEqe3YCH1yoVhBu1z4ecmXmHBK6JwXQVN79mLkbHjXZi1+h7Hx
         1qFesixo3jH7MtqcNOrkAjzz90XFNRE7coKXRo3B+AHjfDZuwLrEtAObPFIOIUFJc5+4
         kjXSL28s4Xh2xkR4rgu+VSdDgtXEPJc7tPwvJjm5FIMRcRhS89Tv4Wvqu3Ko48bVf15E
         7XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbciIXRzNfyTvoR8QFtWep2Lmj5iQNIOWSVgX25MrQE=;
        b=vHSb3L1xZGosSifObr++8Ep0s1CnRIo4jjaDNTmHkDR9Tr5CkxuKjY7qsylocxuMsX
         e4aXNtxR+jEcGHm31iNE8isHUNuHY65E/Iv9QDNO9EYm/WMtcQ23ZbwWUvoetIKh8tvd
         obw9l1UcbIcFi01uMIfQKzmxrtlFpJVAzUaguL6ilMWvW1Ywgsoe+Is9Z1Df9pKoAxSr
         IukLxgVWBjBA8s7lHnFJYP4EwTieFzajPWmKYF9cFNaHfP23qjf7CriwXWzidL4DWWkr
         xiqYTQ7TBNBmeFDAnLid3EgH5z2tEWQhE3097Dl0ddawQE4HdD/l2Mg7Nr2LvEvSrWzL
         v5Jg==
X-Gm-Message-State: ANoB5pkTWfUt/oPuT0jmw0SHRqRWSQyyyrODhOiDc+dFtDEJfFlK7KFr
	iAZJjMBTfjJsNPmFr3MvYWPck0VUS5oVQyKDmjo=
X-Google-Smtp-Source: AA0mqf5s3kzApB0uXgVCsMBYhWJ+LXuv+Qz1marXh5vjkgDRIf+eOFMMeZDFtXDW0/w5JqlhSkf6KYj/8TnT4H+9ZA0=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr27933691oab.262.1669923882008; Thu, 01
 Dec 2022 11:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de>
In-Reply-To: <20221201173942.1218836-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 11:44:16 -0800
Message-ID: <CAMKF1srMw290_AT2_dmHYXnCoZ96JNbyVC56-nw9a+E_Df6Ycg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174211

On Thu, Dec 1, 2022 at 9:39 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> - remove deprecated xvmc PACKAGECONFIG
> - remove futex.h patch. Code has been reworked, still needed?
>

build for qemuriscv32 to find out.

> Note: mesa-22.3.0 will require libperfetto update to v28. Otherwise compilation will fail.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -------------------
>  ...k-for-all-linux-host_os-combinations.patch |  7 ++--
>  .../{mesa-gl_22.2.3.bb => mesa-gl_22.3.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +--
>  .../mesa/{mesa_22.2.3.bb => mesa_22.3.0.bb}   |  0
>  5 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb => mesa-gl_22.3.0.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb => mesa_22.3.0.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> deleted file mode 100644
> index e7d92197be..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 16 Oct 2020 11:03:47 -0700
> -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
> -
> -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
> -they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
> -__NR_futex, since this is used in applications, such applications start
> -to fail to build for these newer architectures. This patch defines a
> -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
> -working
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/util/futex.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/util/futex.h b/src/util/futex.h
> -index 2a2a00c..92fc123 100644
> ---- a/src/util/futex.h
> -+++ b/src/util/futex.h
> -@@ -38,6 +38,10 @@
> - #define SYS_futex SYS_futex_time64
> - #endif
> -
> -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> -+# define SYS_futex SYS_futex_time64
> -+#endif
> -+
> - static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
> - {
> -    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> index ec263ce479..2031ea957a 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> @@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
>  index 250b528..b5c98f8 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -173,7 +173,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> +@@ -173,7 +173,7 @@
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi = with_shared_glapi and with_any_opengl
>
> --system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
> +-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
>  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
>
>   dri_drivers = get_option('dri-drivers')
>   if dri_drivers.length() != 0
> -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
> +@@ -1072,7 +1072,7 @@
>   endif
>
>   # TODO: this is very incomplete
> @@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
>     pre_args += '-D_GNU_SOURCE'
>   elif host_machine.system() == 'sunos'
>     pre_args += '-D__EXTENSIONS__'
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 115621228a..86bd91ff5c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,7 +17,6 @@ PE = "2"
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> -           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
>             ${NATIVE_PATCHES} \
>             "
> @@ -25,7 +24,7 @@ NATIVE_PATCHES ?= ""
>  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
>  NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>
> -SRC_URI[sha256sum] = "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c098d6"
> +SRC_URI[sha256sum] = "644bf936584548c2b88762111ad58b4aa3e4688874200e5a4eb74e53ce301746"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
>  X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
> -PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
>  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
>
>  PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
> diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-graphics/mesa/mesa_22.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
> rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174199): https://lists.openembedded.org/g/openembedded-core/message/174199
> Mute This Topic: https://lists.openembedded.org/mt/95388063/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

