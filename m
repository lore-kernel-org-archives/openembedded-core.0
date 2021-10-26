Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B1DC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:51:41 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.14101.1635263500435842496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LdDDpNFB;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id k29so9852938qve.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZ9PriUHLifyI7zx0cMT28hra+POHml6KpZ9zpQA/gc=;
        b=LdDDpNFBAI3WDy4PpWfWzH05ounpGmQ6NZ9c1JZMFYXs1I3QnTs5FfesX9z32RDzoD
         LWRGK4HFyU9xLNn2FvtE1l5j6c1eIaHAJBQPO74u5UQoK+bjGOjZ4rly97OO5QlFDw8x
         1UtxXtyc+3EqIC7bs8K1EpePusHrSBIn+rvwihcBCHn9bz7AygdVX0wWAxMtWsmDvQ+l
         84uHMOkAhlujSak5+1glZip2JI3OvYYuHkcpcL33UzdTPW3ndOWE9fOec/ss7sqfsAJd
         bej9RARjTB6+MKaf/JcSug1sOGmoGXqUpREglcLEMXGvBxvh2dFOVS7n0iqKFpodou1d
         n8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZ9PriUHLifyI7zx0cMT28hra+POHml6KpZ9zpQA/gc=;
        b=IRbMGy50coYO9mm8ZYv+GlN7qWN79FOISiGzlQiqZ/f1NzfWWrGY77fOc49eOpX+oo
         JYn9t+pPNvJIUB+wrWd8xUbsqjo9RiYtjKVPzBOf8iIeDLztqGDKkJuRH0CMcaWkTsJX
         dIb70W7jmljUxwIKb9LK7GwpUrt/5FOszMzB+gqrHfMxREkP7u+mFgJ1EulSHYeycrde
         Aq8GW4zq9q3537p1DTMw5HMqR6tw9v5175QX2k9HA8cvd6MubR88C2CGfO465JZNCjfc
         GX0hkXw30iw0KnyKC5qPoPD9MHzOgWp4oyavTHPBKqIU+PS5oyUiz0QvYbuiWFFpNwCV
         y5rQ==
X-Gm-Message-State: AOAM531S3jsWqpN1UHQkoxUFcGv7CEe0egiQthl1RYVIQ2MWgZIoXY1O
	0sV+fXyRQ9uca8iv5bUZfDlxxZKLfbKFUO1SlLU=
X-Google-Smtp-Source: 
 ABdhPJzEUlSq2cl0JYZDCiqljmHwyN4uW3j7vHY2ajgH15dqLpTndXy28gcCs1Q08jZV0rJpqm34YaGTBH5q6XpatUY=
X-Received: by 2002:a05:6214:242a:: with SMTP id
 gy10mr17895369qvb.62.1635263499250;
 Tue, 26 Oct 2021 08:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2021 08:51:13 -0700
Message-ID: 
 <CAMKF1sq_6e_bD4KNF6piTyeXut5bPa+yQ6EjO++c8xj6G6eZLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] gcc: Merge three related patches together
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:51:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157399

looks ok.

On Tue, Oct 26, 2021 at 4:11 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The SYSTEMLIBS_DIR change was spread over three patches, merge these
> together since there is no value in having them separate.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |  2 -
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 52 ++++++++++---------
>  ...IR-replacement-instead-of-hardcoding.patch | 26 ----------
>  ...22-aarch64-Add-support-for-musl-ldso.patch | 25 ---------
>  4 files changed, 28 insertions(+), 77 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 9fd30f52a88..6fa344e9612 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -50,8 +50,6 @@ SRC_URI = "\
>             file://0018-export-CPP.patch \
>             file://0019-Ensure-target-gcc-headers-can-be-included.patch \
>             file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
> -           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
> -           file://0022-aarch64-Add-support-for-musl-ldso.patch \
>             file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
>             file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
>             file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 4726267a80f..0884730786c 100644
> --- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -30,8 +30,7 @@ Upstream-Status: Inappropriate [OE configuration]
>   gcc/config/sparc/linux64.h   |  4 ++--
>   12 files changed, 29 insertions(+), 34 deletions(-)
>
> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> -index c1dae8ca2cf..3ce2b76c1a4 100644
> +unchanged:
>  --- a/gcc/config/alpha/linux-elf.h
>  +++ b/gcc/config/alpha/linux-elf.h
>  @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -45,8 +44,7 @@ index c1dae8ca2cf..3ce2b76c1a4 100644
>   #if DEFAULT_LIBC == LIBC_UCLIBC
>   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>   #elif DEFAULT_LIBC == LIBC_GLIBC
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 85d0136e76e..6bd95855827 100644
> +unchanged:
>  --- a/gcc/config/arm/linux-eabi.h
>  +++ b/gcc/config/arm/linux-eabi.h
>  @@ -65,8 +65,8 @@
> @@ -60,8 +58,7 @@ index 85d0136e76e..6bd95855827 100644
>   #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
>
>   #define GLIBC_DYNAMIC_LINKER \
> -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> -index 0c1c4e70b6b..6bd643ade11 100644
> +unchanged:
>  --- a/gcc/config/arm/linux-elf.h
>  +++ b/gcc/config/arm/linux-elf.h
>  @@ -60,7 +60,7 @@
> @@ -73,8 +70,7 @@ index 0c1c4e70b6b..6bd643ade11 100644
>
>   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>      %{static:-Bstatic} \
> -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> -index 04b274f1654..7aafcf3ac2d 100644
> +unchanged:
>  --- a/gcc/config/i386/linux.h
>  +++ b/gcc/config/i386/linux.h
>  @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -86,8 +82,7 @@ index 04b274f1654..7aafcf3ac2d 100644
>
>   #undef MUSL_DYNAMIC_LINKER
>   #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> -index b3822ced528..92d303e80d6 100644
> +unchanged:
>  --- a/gcc/config/i386/linux64.h
>  +++ b/gcc/config/i386/linux64.h
>  @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> @@ -103,8 +98,7 @@ index b3822ced528..92d303e80d6 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index 4e1db60fced..87efc5f69fe 100644
> +unchanged:
>  --- a/gcc/config/linux.h
>  +++ b/gcc/config/linux.h
>  @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> @@ -122,8 +116,7 @@ index 4e1db60fced..87efc5f69fe 100644
>   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> -index 44a85e410d9..8d41b5574f6 100644
> +unchanged:
>  --- a/gcc/config/mips/linux.h
>  +++ b/gcc/config/mips/linux.h
>  @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
> @@ -153,8 +146,7 @@ index 44a85e410d9..8d41b5574f6 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 \
> -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> -index 9238de5bc92..7136a83260a 100644
> +unchanged:
>  --- a/gcc/config/riscv/linux.h
>  +++ b/gcc/config/riscv/linux.h
>  @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -166,8 +158,7 @@ index 9238de5bc92..7136a83260a 100644
>
>   #define MUSL_ABI_SUFFIX \
>     "%{mabi=ilp32:-sf}" \
> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index e3f2cd254f6..a11e01faa3d 100644
> +unchanged:
>  --- a/gcc/config/rs6000/linux64.h
>  +++ b/gcc/config/rs6000/linux64.h
>  @@ -336,24 +336,19 @@ extern int dot_symbols;
> @@ -200,8 +191,7 @@ index e3f2cd254f6..a11e01faa3d 100644
>
>   #undef  DEFAULT_ASM_ENDIAN
>   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> -index 7558d2f7195..3aaa6c3a078 100644
> +unchanged:
>  --- a/gcc/config/sh/linux.h
>  +++ b/gcc/config/sh/linux.h
>  @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -213,8 +203,7 @@ index 7558d2f7195..3aaa6c3a078 100644
>
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 2550d7ee8f0..a94f4cd8ba2 100644
> +unchanged:
>  --- a/gcc/config/sparc/linux.h
>  +++ b/gcc/config/sparc/linux.h
>  @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
> @@ -226,8 +215,7 @@ index 2550d7ee8f0..a94f4cd8ba2 100644
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index 95af8afa9b5..63127afb074 100644
> +unchanged:
>  --- a/gcc/config/sparc/linux64.h
>  +++ b/gcc/config/sparc/linux64.h
>  @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -241,3 +229,19 @@ index 95af8afa9b5..63127afb074 100644
>
>   #ifdef SPARC_BI_ARCH
>
> +diff -u b/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
> +--- b/gcc/config/aarch64/aarch64-linux.h
> ++++ b/gcc/config/aarch64/aarch64-linux.h
> +@@ -21,10 +21,10 @@
> + #ifndef GCC_AARCH64_LINUX_H
> + #define GCC_AARCH64_LINUX_H
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> +
> + #undef MUSL_DYNAMIC_LINKER
> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> +
> + #undef  ASAN_CC1_SPEC
> + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> diff --git a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> deleted file mode 100644
> index 0f3b3869b02..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 7faad21154a76b200efcced9e12945057c94dff3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Apr 2015 23:15:27 -0700
> -Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
> - base_libdir
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
> -index 7f2529a2a1d..5303b39186f 100644
> ---- a/gcc/config/aarch64/aarch64-linux.h
> -+++ b/gcc/config/aarch64/aarch64-linux.h
> -@@ -21,7 +21,7 @@
> - #ifndef GCC_AARCH64_LINUX_H
> - #define GCC_AARCH64_LINUX_H
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> -
> - #undef MUSL_DYNAMIC_LINKER
> - #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> diff --git a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
> deleted file mode 100644
> index 41536a8a3b4..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 96aa24a874331a318693e4fccc4bc4e7d3fbad2b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Apr 2015 23:18:39 -0700
> -Subject: [PATCH] aarch64: Add support for musl ldso
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
> -index 5303b39186f..4bcae7f3110 100644
> ---- a/gcc/config/aarch64/aarch64-linux.h
> -+++ b/gcc/config/aarch64/aarch64-linux.h
> -@@ -24,7 +24,7 @@
> - #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> -
> - #undef MUSL_DYNAMIC_LINKER
> --#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> -+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> -
> - #undef  ASAN_CC1_SPEC
> - #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157383): https://lists.openembedded.org/g/openembedded-core/message/157383
> Mute This Topic: https://lists.openembedded.org/mt/86599747/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

