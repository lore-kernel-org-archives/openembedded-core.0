Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F520C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 09:06:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.23116.1659949576810932914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZqJzuRU;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id n4so8354410wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DkO//JUn1M3Iq/vwkgrhmxoRpCB7QatzCEtFu2nwCno=;
        b=dZqJzuRUDZNZOqB+utelyR9b4LmcCHKJa7XOstnC1p8miRUIzOgZDB1viMm/GonV46
         l3GgjD1UE1w0T3d+givme0cZCQ9XT/ClX1NmyL8mYk+5jwO6Acz3IDbtsaM+nxoaVY3J
         9r7hU+1LYl1WnrTuBajux7tRYMuTG4uoQ355mrMEAQ69qlnbeSXwTwWCOMI7A5v0vmWJ
         9Mn8+dMdsS6xpNJqt6Oc1y8NfExXHKfzhLLUCA4kifZOzcPqd9ulrnuT5dDIsQNFH51S
         P/xmZ4I6JOUSF6Teokwm/VqycFpphtFgfqONld3OayDjgPC4ek5I9evQvm1bSZkHc89s
         aPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DkO//JUn1M3Iq/vwkgrhmxoRpCB7QatzCEtFu2nwCno=;
        b=uF3M6tI9rqQVaUI471ZHE6iTqf0qDjhtbEF2CJx0RXg292Lz1/6voIt5aFdsKfC97J
         4lnVbfUbQ8143q/YADAcPmOS+UsNqbj8S3Sd/8iRNwzOOcOSJgy/IxCE/LTEFp/r8lZy
         +pjrcg5naTr2mblY5petO4Dso1j1UZCFkyM0zIt3QzMgOOPh90jPnKQYHu4OSk3/bqMA
         ZrE0CZ3Kf3B+KsW2bY7CCpLHFBDmOxjn+PL6irHh28JTCinjM1pAMZ5CqdslOs12Sl23
         vSazC750bl+/rYIEf4QBqEGvgaZjEsgSGO/O8Gy/qnhuz9BLC1exGDZR4VT8iJRy0uXh
         aNZg==
X-Gm-Message-State: ACgBeo0YAVwTBUz+cdQWqiLo69nxd3ORA9Zm350T6lHc+7kR0+Qk+e8+
	q8ryGneUut5/upIDdYA7mvV3WRWQpa0Hk2y1o2I=
X-Google-Smtp-Source: 
 AA6agR7HTx3QLRNnckUZeUvrfvyjNfWk0NdpvunsgIfbPiOeLgc90C6xydTUy0S0p2QV4N9cJs3uiGQ2SqPxTumhQgw=
X-Received: by 2002:adf:fb03:0:b0:21d:70cb:d6b5 with SMTP id
 c3-20020adffb03000000b0021d70cbd6b5mr10457528wrr.548.1659949574969; Mon, 08
 Aug 2022 02:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <1709153253BBC9C9.7816@lists.openembedded.org>
 <17091BA3B520FD6B.8942@lists.openembedded.org>
In-Reply-To: <17091BA3B520FD6B.8942@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Aug 2022 11:05:29 +0200
Message-ID: 
 <CA+chaQeOAJ0CvvLrcMTRjX0uW=Ke89NmzuL9zzoUZQF-Bsb9Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: fix new upstream build issue with
 DEBUG_BUILD build
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2dd1d05e5b72063"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 09:06:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169075

--000000000000c2dd1d05e5b72063
Content-Type: text/plain; charset="UTF-8"

The 2nd fix was updated in upstream:
https://sourceware.org/pipermail/libc-alpha/2022-August/141290.html (1st is
the same https://sourceware.org/pipermail/libc-alpha/2022-August/141289.html
)
will send updated version, once the final fix is merged in master branch
(or SRCREV update once it gets merged in releases/2.38/master branch).

On Sun, Aug 7, 2022 at 6:05 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * fix SRCREV to match with glibc-2.36 tag
> * refresh 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>   (just different commit SHA in master and 2.35 branch)
>
> * add proposed fixes for build failure with DEBUG_BUILD:
>   http://errors.yoctoproject.org/Errors/Details/663898/
>
> 86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fmacro-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=/usr/src/debug/glibc/2.36-r0
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=/usr/src/debug/glibc/2.36-r0
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot=
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=
> -Wl,-z,relro,-z,now -fuse-ld=bfd  -nostdlib -nostartfiles -r -o
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os
> '-Wl,-('
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/dl-allobjs.os
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/rtld-libc.a
> -lgcc '-Wl,-)' \
>
> -Wl,-Map,TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os.map
> x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fmacro-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=/usr/src/debug/glibc/2.36-r0
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=/usr/src/debug/glibc/2.36-r0
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot=
>
> -fdebug-prefix-map=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=
> -Wl,-z,relro,-z,now -fuse-ld=bfd  -nostdlib -nostartfiles -shared -o
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/ld.so.new
>               \
>           -Wl,-z,relro -Wl,-z,defs -Wl,-z,now   \
>           -Wl,-z,pack-relative-relocs \
>
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os
> -Wl,--version-script=TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/ld.map
>           \
>           -Wl,-soname=ld-linux-x86-64.so.2
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/12.1.0/ld.bfd:
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os:
> in function `_dl_load_cache_lookup':
> /usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined reference
> to `strcpy'
> collect2: error: ld returned 1 exit status
>
>   introduced in 2.36 version, with:
>   https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=6b9006bfb0
>
>   upstream report with this fix proposed:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=29454
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc     |  2 +-
>  ...lement-a-useful-version-of-_startup_.patch |  8 ++---
>  .../0002-x86-Fix-STRCPY-symbol-name.patch     | 23 ++++++++++++
>  .../glibc/0003-Add-RTLD-hook-for-strcpy.patch | 35 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.36.bb         |  2 ++
>  5 files changed, 65 insertions(+), 5 deletions(-)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
>  create mode 100644
> meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index b6da2c345d..0fa6ac39c4 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.36/master"
>  PV = "2.36"
> -SRCREV_glibc ?= "c74bb93cfdb04d49155b0e30983a3c866167bbca"
> +SRCREV_glibc ?= "c804cd1c00adde061ca51711f63068c103e94eef"
>  SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> diff --git
> a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> index 2421a63605..befac35e84 100644
> ---
> a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> +++
> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> @@ -1,13 +1,13 @@
> -From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
> +From 464f0a4f53fc68758760a34199a257d0ec0775d4 Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 24 Jul 2022 19:41:41 +0200
> +Date: Sun, 7 Aug 2022 12:51:48 +0200
>  Subject: [PATCH] Revert "Linux: Implement a useful version of
> _startup_fatal"
>
> -This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
> +This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.
> +
>  Upstream-Status: Inappropriate [temporary work around]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
>  ---
>   sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
>   sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
> diff --git
> a/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
> b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
> new file mode 100644
> index 0000000000..326aca6e0c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch
> @@ -0,0 +1,23 @@
> +From 67aa386a4b5ff54994e157875f3abe99763b5bf7 Mon Sep 17 00:00:00 2001
> +From: Noah Goldstein <goldstein.w.n@gmail.com>
> +Date: Sun, 7 Aug 2022 22:42:30 +0800
> +Subject: [PATCH] x86: Fix STRCPY symbol name
> +
> +Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454]
> +---
> + sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/x86_64/multiarch/strcpy-sse2.S
> b/sysdeps/x86_64/multiarch/strcpy-sse2.S
> +index e29b411314..d6b9bae5f8 100644
> +--- a/sysdeps/x86_64/multiarch/strcpy-sse2.S
> ++++ b/sysdeps/x86_64/multiarch/strcpy-sse2.S
> +@@ -22,7 +22,7 @@
> +
> + # include <sysdep.h>
> +
> +-# ifndef STPCPY
> ++# ifndef STRCPY
> + #  define STRCPY __strcpy_sse2
> + # endif
> +
> diff --git
> a/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
> b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
> new file mode 100644
> index 0000000000..64a7a307fe
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch
> @@ -0,0 +1,35 @@
> +From 64351e4b48a02c453ca9ed667d358ad44df6bf93 Mon Sep 17 00:00:00 2001
> +From: Noah Goldstein <goldstein.w.n@gmail.com>
> +Date: Sun, 7 Aug 2022 23:54:19 +0800
> +Subject: [PATCH] Add RTLD hook for strcpy
> +
> +Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454]
> +---
> + sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
> + 1 file changed, 18 insertions(+)
> + create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
> +
> +diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S
> b/sysdeps/x86_64/multiarch/rtld-strcpy.S
> +new file mode 100644
> +index 0000000000..19439c553d
> +--- /dev/null
> ++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
> +@@ -0,0 +1,18 @@
> ++/* Copyright (C) 2022 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include "../strcpy.S"
> diff --git a/meta/recipes-core/glibc/glibc_2.36.bb
> b/meta/recipes-core/glibc/glibc_2.36.bb
> index f4504282f6..97bab9c381 100644
> --- a/meta/recipes-core/glibc/glibc_2.36.bb
> +++ b/meta/recipes-core/glibc/glibc_2.36.bb
> @@ -52,6 +52,8 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>             \
>
> file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
> +           file://0002-x86-Fix-STRCPY-symbol-name.patch \
> +           file://0003-Add-RTLD-hook-for-strcpy.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168997):
> https://lists.openembedded.org/g/openembedded-core/message/168997
> Mute This Topic: https://lists.openembedded.org/mt/92874008/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c2dd1d05e5b72063
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The 2nd fix was updated in upstream:<div><a href=3D"https:=
//sourceware.org/pipermail/libc-alpha/2022-August/141290.html">https://sour=
ceware.org/pipermail/libc-alpha/2022-August/141290.html</a> (1st is the sam=
e=C2=A0<a href=3D"https://sourceware.org/pipermail/libc-alpha/2022-August/1=
41289.html">https://sourceware.org/pipermail/libc-alpha/2022-August/141289.=
html</a>)<br></div><div>will send updated version, once the final fix is me=
rged in master branch (or SRCREV update once it gets merged in releases/2.3=
8/master branch).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 6:05 PM Martin Jansa via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin=
.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">* fix SRCREV to match with glibc-2.36 tag<br>
* refresh 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch<b=
r>
=C2=A0 (just different commit SHA in master and 2.35 branch)<br>
<br>
* add proposed fixes for build failure with DEBUG_BUILD:<br>
=C2=A0 <a href=3D"http://errors.yoctoproject.org/Errors/Details/663898/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/663898/</a><br>
<br>
86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse=C2=A0 --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36=
-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-p=
refix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=3D/usr/sr=
c/debug/glibc/2.36-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-6=
4-oe-linux/glibc/2.36-r0=3D/usr/src/debug/glibc/2.36-r0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=
=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot=3D=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36=
-r0/recipe-sysroot-native=3D=C2=A0 -Wl,-z,relro,-z,now -fuse-ld=3Dbfd=C2=A0=
 -nostdlib -nostartfiles -r -o TOPDIR/tmp-glibc/work/core2-64-oe-linux/glib=
c/2.36-r0/build-x86_64-oe-linux/elf/librtld.os &#39;-Wl,-(&#39; TOPDIR/tmp-=
glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/dl-all=
objs.os TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-=
oe-linux/elf/rtld-libc.a -lgcc &#39;-Wl,-)&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-Map,TOPDIR/tmp-glibc/work/core2-64-=
oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os.map<br>
x86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse=C2=A0 --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.3=
6-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-=
prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0=3D/usr/s=
rc/debug/glibc/2.36-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-6=
4-oe-linux/glibc/2.36-r0=3D/usr/src/debug/glibc/2.36-r0=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=
=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot=3D=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36=
-r0/recipe-sysroot-native=3D=C2=A0 -Wl,-z,relro,-z,now -fuse-ld=3Dbfd=C2=A0=
 -nostdlib -nostartfiles -shared -o TOPDIR/tmp-glibc/work/core2-64-oe-linux=
/glibc/2.36-r0/build-x86_64-oe-linux/elf/ld.so.new=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-z,relro -Wl,-z,defs -Wl,-z,now=C2=
=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-z,pack-relative-relocs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TOPDIR/tmp-glibc/work/core2-64-oe-linux/=
glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os -Wl,--version-script=3DT=
OPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/=
ld.map=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,-soname=3Dld-linux-x86-64.so.2<br>
TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native=
/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/=
12.1.0/ld.bfd: TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-=
x86_64-oe-linux/elf/librtld.os: in function `_dl_load_cache_lookup&#39;:<br=
>
/usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined reference to=
 `strcpy&#39;<br>
collect2: error: ld returned 1 exit status<br>
<br>
=C2=A0 introduced in 2.36 version, with:<br>
=C2=A0 <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;=
h=3D6b9006bfb0" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D6b9006bfb0</a><br>
<br>
=C2=A0 upstream report with this fix proposed:<br>
=C2=A0 <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D29454" =
rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D29454</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0...lement-a-useful-version-of-_startup_.patch |=C2=A0 8 ++---<br>
=C2=A0.../0002-x86-Fix-STRCPY-symbol-name.patch=C2=A0 =C2=A0 =C2=A0| 23 +++=
+++++++++<br>
=C2=A0.../glibc/0003-Add-RTLD-hook-for-strcpy.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
=C2=A05 files changed, 65 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-=
symbol-name.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-f=
or-strcpy.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc<br>
index b6da2c345d..0fa6ac39c4 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.36/master&quot;<br>
=C2=A0PV =3D &quot;2.36&quot;<br>
-SRCREV_glibc ?=3D &quot;c74bb93cfdb04d49155b0e30983a3c866167bbca&quot;<br>
+SRCREV_glibc ?=3D &quot;c804cd1c00adde061ca51711f63068c103e94eef&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;794da69788cbf9bf57b59a852f9f11307663fa87&=
quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.git=
</a>&quot;<br>
diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-us=
eful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Revert=
-Linux-Implement-a-useful-version-of-_startup_.patch<br>
index 2421a63605..befac35e84 100644<br>
--- a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch<br>
+++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch<br>
@@ -1,13 +1,13 @@<br>
-From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001<br>
+From 464f0a4f53fc68758760a34199a257d0ec0775d4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
-Date: Sun, 24 Jul 2022 19:41:41 +0200<br>
+Date: Sun, 7 Aug 2022 12:51:48 +0200<br>
=C2=A0Subject: [PATCH] Revert &quot;Linux: Implement a useful version of _s=
tartup_fatal&quot;<br>
<br>
-This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.<br>
+This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [temporary work around]<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---<br>
=C2=A0 sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------<br>
diff --git a/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.=
patch b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch=
<br>
new file mode 100644<br>
index 0000000000..326aca6e0c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0002-x86-Fix-STRCPY-symbol-name.patch<b=
r>
@@ -0,0 +1,23 @@<br>
+From 67aa386a4b5ff54994e157875f3abe99763b5bf7 Mon Sep 17 00:00:00 2001<br>
+From: Noah Goldstein &lt;<a href=3D"mailto:goldstein.w.n@gmail.com" target=
=3D"_blank">goldstein.w.n@gmail.com</a>&gt;<br>
+Date: Sun, 7 Aug 2022 22:42:30 +0800<br>
+Subject: [PATCH] x86: Fix STRCPY symbol name<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a>]<br>
+---<br>
+ sysdeps/x86_64/multiarch/strcpy-sse2.S | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/sysdeps/x86_64/multiarch/strcpy-sse2.S b/sysdeps/x86_64/multi=
arch/strcpy-sse2.S<br>
+index e29b411314..d6b9bae5f8 100644<br>
+--- a/sysdeps/x86_64/multiarch/strcpy-sse2.S<br>
++++ b/sysdeps/x86_64/multiarch/strcpy-sse2.S<br>
+@@ -22,7 +22,7 @@<br>
+ <br>
+ # include &lt;sysdep.h&gt;<br>
+ <br>
+-# ifndef STPCPY<br>
++# ifndef STRCPY<br>
+ #=C2=A0 define STRCPY __strcpy_sse2<br>
+ # endif<br>
+ <br>
diff --git a/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.pa=
tch b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch<br>
new file mode 100644<br>
index 0000000000..64a7a307fe<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0003-Add-RTLD-hook-for-strcpy.patch<br>
@@ -0,0 +1,35 @@<br>
+From 64351e4b48a02c453ca9ed667d358ad44df6bf93 Mon Sep 17 00:00:00 2001<br>
+From: Noah Goldstein &lt;<a href=3D"mailto:goldstein.w.n@gmail.com" target=
=3D"_blank">goldstein.w.n@gmail.com</a>&gt;<br>
+Date: Sun, 7 Aug 2022 23:54:19 +0800<br>
+Subject: [PATCH] Add RTLD hook for strcpy<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a>]<br>
+---<br>
+ sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++<br>
+ 1 file changed, 18 insertions(+)<br>
+ create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S<br>
+<br>
+diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multi=
arch/rtld-strcpy.S<br>
+new file mode 100644<br>
+index 0000000000..19439c553d<br>
+--- /dev/null<br>
++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S<br>
+@@ -0,0 +1,18 @@<br>
++/* Copyright (C) 2022 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
++=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
++=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
++=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
++<br>
++=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
++=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
++=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
++=C2=A0 =C2=A0Lesser General Public License for more details.<br>
++<br>
++=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
++=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
++=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
++<br>
++#include &quot;../strcpy.S&quot;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.36.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.36.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.36.bb</a><br>
index f4504282f6..97bab9c381 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
@@ -52,6 +52,8 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert-Linux-Implemen=
t-a-useful-version-of-_startup_.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-x86-Fix-STRCPY-symbol=
-name.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Add-RTLD-hook-for-str=
cpy.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168997): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168997" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168997</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92874008/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92874008/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c2dd1d05e5b72063--

