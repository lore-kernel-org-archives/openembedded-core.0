Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F65C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:17:37 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.8103.1647019056911166054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EJNpzX5U;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id 85so7491761qkm.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=muMa1RO4lUNCUfZf8rjtzMdek/9nNeQ2PwnZPuiubhM=;
        b=EJNpzX5UrW2kQmf/bxQkJDYB5MzwWRdlR1ULRbfisB1UKcTXy1E/dgh0xczY6InLY0
         Etih6q/I0usjsDB2M80qdDpsgh91QIOP8J0aowopfNhwcRNtzsINqnuPeR8NogwA9HF5
         PYwoPb06Q/gtozUVTQ3w8CFEEKploVAfUsHXHWJV5keMTZ2t82JyYUkgIXWW++cj35Xn
         eqxewEtE28jIxUFBBVnxr0fkCvnT/5dPREc0RkRyC3xGrztZdzsr3gxYXI0KoZj8Ol69
         vrFLbowfm5iKXZjz4Ie4jwLu+iJTiQXSms3esyknoiZe59SrhkqiuFzYQ6hSYg0R2kB+
         NjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=muMa1RO4lUNCUfZf8rjtzMdek/9nNeQ2PwnZPuiubhM=;
        b=nMrJ4+AL9XkMuqHN0Z/wo9/j0jrt8Y35DBPeSzfw9ZggFw/ZQRb3xnWlJM+ELybM5T
         oXRPWpNs/JWxfLYv5Ccjy5S1PX8EL+UhviVToInIhzEmSEiE9yoLOhj8KZTqqGGODar5
         6Yv9aZ+DiKQ8LZVF7K3vTBKGnIGstY3nfJz1Ow1PH44g5ZYX/T8iH64VSlg+DD90uEiB
         qsDcDN+6R2NEegkObQTA/9bxBMEcQ6Nma1vhHZK3Q6bOsTOE93xJUQboq7d0ZgVXWBmI
         oKtPMjDUMcNaIUPr5VVg9s+z5W6HbgSyXmzn4cL8v0A0GsbOV8QUuls5dyK1/76EbUjf
         cDlA==
X-Gm-Message-State: AOAM533kJBogN61uHyBr/9SNul/wD4iWwgmEIsIRv6t2DADdJkdXfUrF
	sP3rdyZ0hNjXWVjeC6YArBUFK4MDjOAVjA8BpHo=
X-Google-Smtp-Source: 
 ABdhPJyxgu7kRGFEgWUif1Unu6X2y/MbjF0QIlr5VU9wIFXDRd2dVwggQsLin1Jsbxwe44yqIJ3gMCL7kNmZe7ptkq8=
X-Received: by 2002:a05:620a:29c3:b0:67b:31ff:bfb2 with SMTP id
 s3-20020a05620a29c300b0067b31ffbfb2mr6964480qkp.463.1647019055821; Fri, 11
 Mar 2022 09:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20220311151836.1541579-1-f_l_k@t-online.de>
In-Reply-To: <20220311151836.1541579-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Mar 2022 09:17:09 -0800
Message-ID: 
 <CAMKF1spfwGWM3jGB=B6184YoCjYawj4W1F_N69Em+4PziSAWAQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] mesa: update to 22.0.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:17:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163068

could you test boot weston and sato images for musl and report back ?

On Fri, Mar 11, 2022 at 7:18 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> - remove 0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch that
>   was applied upstream
>
> - adjust 0002-meson.build-make-TLS-ELF-optional.patch
>
> - fix patch fuzz
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...fine-__NR_futex-if-it-does-not-exist.patch |  5 ++-
>  ...sdetects-64bit-atomics-on-mips-clang.patch |  8 ++--
>  ...k-for-all-linux-host_os-combinations.patch | 10 ++---
>  ...ormat-Check-for-NEON-before-using-it.patch | 10 ++---
>  ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 -----------------
>  ...02-meson.build-make-TLS-ELF-optional.patch | 44 +++++++++----------
>  .../{mesa-gl_21.3.7.bb => mesa-gl_22.0.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  5 +--
>  .../mesa/{mesa_21.3.7.bb => mesa_22.0.0.bb}   |  0
>  9 files changed, 40 insertions(+), 83 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_21.3.7.bb => mesa-gl_22.0.0.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_21.3.7.bb => mesa_22.0.0.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> index 8bedbac669..3b0bfa323b 100644
> --- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
> @@ -1,4 +1,4 @@
> -From 8973e297f2f9b17498b9dc0e37a19481d4bb7df9 Mon Sep 17 00:00:00 2001
> +From 253b042d2bf10e9abfa9cc508e0782aefd834145 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 16 Oct 2020 11:03:47 -0700
>  Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
> @@ -12,10 +12,13 @@ working
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   src/util/futex.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> +diff --git a/src/util/futex.h b/src/util/futex.h
> +index 43097f4..941b0ec 100644
>  --- a/src/util/futex.h
>  +++ b/src/util/futex.h
>  @@ -34,6 +34,10 @@
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> index 15485feb71..b08e4d86c2 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
> @@ -1,16 +1,17 @@
> -From bb2f0bea553d51d659a9bc46f7ae186885405151 Mon Sep 17 00:00:00 2001
> +From d34bdbd80e5a1f309d2ba280cdc66ff0ee0e5c43 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 13 Jan 2020 15:23:47 -0800
>  Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   src/util/u_atomic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
> -index e4bffa8..58e1ddd 100644
> +index 5a5eab4..e499516 100644
>  --- a/src/util/u_atomic.c
>  +++ b/src/util/u_atomic.c
>  @@ -21,7 +21,7 @@
> @@ -22,6 +23,3 @@ index e4bffa8..58e1ddd 100644
>
>   #include <stdint.h>
>   #include <pthread.h>
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> index b6f86743e1..aea23d0ec2 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> @@ -1,4 +1,4 @@
> -From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 2001
> +From f9c597a2c517eb85c23cbeeb2e95c55794c74cda Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair@alistair23.me>
>  Date: Thu, 14 Nov 2019 13:04:49 -0800
>  Subject: [PATCH] meson.build: check for all linux host_os combinations
> @@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index 932eb13..efc6171 100644
> +index bca6b1f..70d06c0 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -153,7 +153,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> +@@ -172,7 +172,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi = with_shared_glapi and with_any_opengl
>
> @@ -31,8 +31,8 @@ index 932eb13..efc6171 100644
>  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
>
>   dri_drivers = get_option('dri-drivers')
> - if dri_drivers.contains('auto')
> -@@ -970,7 +970,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
> + if dri_drivers.length() != 0
> +@@ -1074,7 +1074,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
>   endif
>
>   # TODO: this is very incomplete
> diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> index 80b9af08e8..5c6165c281 100644
> --- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
> @@ -1,4 +1,4 @@
> -From 4febda271c6bb0dc69ebf573446c6922a1ec35fb Mon Sep 17 00:00:00 2001
> +From fdb2face4eeac3c20eedcca7520f4e7014225fb4 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 2 Dec 2021 19:57:42 -0800
>  Subject: [PATCH] util/format: Check for NEON before using it
> @@ -13,13 +13,14 @@ In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
>
>  Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   src/util/format/u_format.c             | 2 +-
>   src/util/format/u_format_unpack_neon.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
> -index 36c5e52008e..f0a00971691 100644
> +index 36c5e52..f0a0097 100644
>  --- a/src/util/format/u_format.c
>  +++ b/src/util/format/u_format.c
>  @@ -1138,7 +1138,7 @@ static void
> @@ -32,7 +33,7 @@ index 36c5e52008e..f0a00971691 100644
>         if (unpack) {
>            util_format_unpack_table[format] = unpack;
>  diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
> -index a4a5cb1f723..1e4f794a295 100644
> +index a4a5cb1..1e4f794 100644
>  --- a/src/util/format/u_format_unpack_neon.c
>  +++ b/src/util/format/u_format_unpack_neon.c
>  @@ -23,7 +23,7 @@
> @@ -44,6 +45,3 @@ index a4a5cb1f723..1e4f794a295 100644
>
>   /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
>    * unless you tell it "no really".
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
> deleted file mode 100644
> index e87d7d7311..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 7 Dec 2021 11:13:27 -0800
> -Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
> -
> -This makes is a bit more portable, especially on 32bit architectures
> -with 64bit time_t defaults. Especially on musl its a must.
> -
> -Fixes
> -../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
> -              time.tv_sec);
> -              ^~~~~~~~~~~
> -
> -Also reported here [1]
> -
> -[1] https://github.com/agherzan/meta-raspberrypi/issues/969
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14118]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/broadcom/vulkan/v3dv_bo.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c
> -index 71679ce..dc5e7f5 100644
> ---- a/src/broadcom/vulkan/v3dv_bo.c
> -+++ b/src/broadcom/vulkan/v3dv_bo.c
> -@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
> -
> -       struct timespec time;
> -       clock_gettime(CLOCK_MONOTONIC, &time);
> --      fprintf(stderr, "  now:               %ld\n",
> --              time.tv_sec);
> -+      fprintf(stderr, "  now:               %lld\n",
> -+              (long long)time.tv_sec);
> -    }
> -
> -    if (cache->size_list_size) {
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> index 35ab8d5a72..af11baee86 100644
> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
> @@ -1,4 +1,4 @@
> -From 8f2f48b41aa17eec3c4d63685e3296f28e60b980 Mon Sep 17 00:00:00 2001
> +From bf41fa026ae3d378e62fd83d03a6f5933b52ca04 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair@alistair23.me>
>  Date: Thu, 14 Nov 2019 13:08:31 -0800
>  Subject: [PATCH] meson.build: make TLS ELF optional
> @@ -17,36 +17,36 @@ Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/musl-qemux86/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 378, in test_parselogs
>      self.assertEqual(errcount, 0, msg=self.msg)
>  AssertionError: 1 != 0 : Log: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/qemux86-poky-linux-musl/core-image-sato-sdk/1.0-r0/target_logs/Xorg.0.log
> ------------------------
> -Central error: [    10.477] (EE) Failed to load /usr/lib/xorg/modules/extensions/libglx.so: Error relocating /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic definition in /usr/lib/libGL.so.1
> -***********************
>
>  Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Alistair Francis <alistair@alistair23.me>
> -
>  ---
> - meson.build       | 2 +-
> + meson.build       | 7 +++++--
>   meson_options.txt | 6 ++++++
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> + 2 files changed, 11 insertions(+), 2 deletions(-)
>
>  diff --git a/meson.build b/meson.build
> -index 23618c1..c8cc5e3 100644
> +index 70d06c0..1441611 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -476,7 +476,7 @@ endif
> - use_elf_tls = false
> - if (not ['freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and
> -     (not with_platform_android or get_option('platform-sdk-version') >= 29) and
> --    (not with_platform_windows or not with_shared_glapi))
> -+    (not with_platform_windows or not with_shared_glapi) and get_option('elf-tls'))
> -   pre_args += '-DUSE_ELF_TLS'
> -   use_elf_tls = true
> +@@ -490,8 +490,11 @@ foreach platform : _platforms
> +   pre_args += '-DHAVE_@0@_PLATFORM'.format(platform.to_upper())
> + endforeach
> +
> +-use_elf_tls = true
> +-pre_args += '-DUSE_ELF_TLS'
> ++use_elf_tls = false
> ++if get_option('elf-tls')
> ++  use_elf_tls = true
> ++  pre_args += '-DUSE_ELF_TLS'
> ++endif
>
> + if with_platform_android and get_option('platform-sdk-version') >= 29
> +   # By default the NDK compiler, at least, emits emutls references instead of
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 29c402c..f70d9b2 100644
> +index 1f6ef38..99cc5cb 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -455,6 +455,12 @@ option(
> +@@ -440,6 +440,12 @@ option(
>     value : true,
>     description : 'Enable direct rendering in GLX and EGL for DRI',
>   )
> @@ -56,6 +56,6 @@ index 29c402c..f70d9b2 100644
>  +  value : true,
>  +  description : 'Enable TLS support in ELF',
>  +)
> - option(
> -   'prefer-iris',
> -   type : 'boolean',
> + option('egl-lib-suffix',
> +   type : 'string',
> +   value : '',
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb b/meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_21.3.7.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 2f79e8b34d..c9dab15f4f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
>
>  PE = "2"
>
> @@ -20,10 +20,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
> -           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
>             "
>
> -SRC_URI[sha256sum] = "b4fa9db7aa61bf209ef0b40bef83080999d86ad98df8b8b4fada7c128a1efc3d"
> +SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_21.3.7.bb b/meta/recipes-graphics/mesa/mesa_22.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.3.7.bb
> rename to meta/recipes-graphics/mesa/mesa_22.0.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163057): https://lists.openembedded.org/g/openembedded-core/message/163057
> Mute This Topic: https://lists.openembedded.org/mt/89712382/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

