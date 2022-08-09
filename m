Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4184AC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 10:13:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.9944.1660040022505195208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 03:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UByOxxHj;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id q30so13732512wra.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4K5TuL6KEugB/STWDKmw0LGc9NA/S1XbT2SVebttuJM=;
        b=UByOxxHjokPJPnxY2j8K2oYaYc2i7pg8YuJdZ6zxvuiMz/jbyAucvluiWeOVrcrjAv
         HvlGQw5EpwEO66zxZj8lBeMHiUOgW5JrpgZp7HoXKBRKP80xeK9Pbxk7p4n+UrdjYleo
         QV8oXplnkYjOsPP0Ez/Z5JIWtIGHn5ZtqXRcJvh3fLlNicM1QSIAICwvOyaMfoJ7lIEn
         1FxprvEpW/IrmqLITh+58be436Nf+f9irpxOrMjcgoDTbk2UWkAYOuKy+WNds5Ipeg1n
         gxCmDkwo/RFuehM4VHWcMTp45evylonLYroOHP2f5dLj2/7hgqTQSfs12AsanNbvE49/
         AOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4K5TuL6KEugB/STWDKmw0LGc9NA/S1XbT2SVebttuJM=;
        b=TAz2CS4l+GKcRj+6l/xdfAGl/3bg+tM3jFCnbQYM/UruxHGdkFzRzdMno77Jg4osF0
         hJhVcNgE6X7qBRtjbWMvsCUMrw5B2AZ94K4aY1YR+lT+rk9f/B7pjdo4qoO3VAkPtP4f
         TFvZNE0v3XS+oavqfgT46D/1Scji+9cmt6MXhnymruxLDRb84lCqQgjaYFlakbdZjtxO
         BNawN7KPT0BpqnIBjL73e2JSfalGSHKz+Rm5YxuzjReAlLisPO7gVo4Y1ZisuPcbHCOI
         7UJW5F0A6lBONo2biaS9qmaRILSMN+uoC2y3l8Qm077qx3JHBCrc6xjdmdbpBR1maDa3
         W3Cg==
X-Gm-Message-State: ACgBeo3mzrELyty/Vy0Qtix++F5rdwsys/m1gNWDST5/J9Ak8jbo98k1
	BurFK4y7rjuqSLZs0IrnXlTcL4oQUUC00a3eyA0=
X-Google-Smtp-Source: 
 AA6agR48Nr+KTVb6r6Dc8WlMQXT+Z9GvSy31PI5aXJ4QL9wi88sdJIpK/iqmFWXJVY1iq0WOGrpGfgT7dVk6BSmak6Y=
X-Received: by 2002:adf:fb03:0:b0:21d:70cb:d6b5 with SMTP id
 c3-20020adffb03000000b0021d70cbd6b5mr13337967wrr.548.1660040020869; Tue, 09
 Aug 2022 03:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220809054340.822999-1-raj.khem@gmail.com>
 <20220809054340.822999-2-raj.khem@gmail.com>
In-Reply-To: <20220809054340.822999-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Aug 2022 12:12:53 +0200
Message-ID: 
 <CA+chaQe8g1A3FUu=ct3JXGY017saV3V=f7G9fKc_ccZB5ji=CA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] glibc: fix new upstream build issue with
 DEBUG_BUILD build
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c1c7c005e5cc2f56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 10:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169144

--000000000000c1c7c005e5cc2f56
Content-Type: text/plain; charset="UTF-8"

312ded0d63 x86: Fix `#define STRCPY` guard in strcpy-sse2.S
483cfe1a6a elf: Replace `strcpy` call with `memcpy` [BZ #29454]

These 2 are now merged in master branch (without any further changes), we
can update Upstream-Status to Backported, but hopefully they'll be
backported to release/2.36/master branch as well and we'll remove them
completely with next SRCREV bump.

Cheers,

On Tue, Aug 9, 2022 at 7:43 AM Khem Raj <raj.khem@gmail.com> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
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
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v3: Rebased, no code changes
>
>  ...define-STRCPY-guard-in-strcpy-sse2.S.patch | 28 ++++++++++++++++
>  ...ace-strcpy-call-with-memcpy-BZ-29454.patch | 32 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.36.bb         |  4 ++-
>  3 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
>  create mode 100644
> meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> new file mode 100644
> index 00000000000..2d14a4c6196
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> @@ -0,0 +1,28 @@
> +From 1d4d09d9dff96f46674262534ce1f0e51a8252cb Mon Sep 17 00:00:00 2001
> +From: Noah Goldstein <goldstein.w.n@gmail.com>
> +Date: Sun, 7 Aug 2022 22:42:30 +0800
> +Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S
> +
> +`#ifndef STPCPY` is incorrect for checking if `STRCPY` is already
> +defined.  It doesn't end up mattering as the whole check is
> +guarded by `#if IS_IN (libc)` but is incorrect none the less.
> +
> +Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454
> https://sourceware.org/pipermail/libc-alpha/2022-August/141289.html]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
> a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> new file mode 100644
> index 00000000000..1b347b33226
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> @@ -0,0 +1,32 @@
> +From f0e36cf0b348dbc990af9f869196710ca89c28c2 Mon Sep 17 00:00:00 2001
> +From: Noah Goldstein <goldstein.w.n@gmail.com>
> +Date: Sun, 7 Aug 2022 23:54:19 +0800
> +Subject: [PATCH] elf: Replace `strcpy` call with `memcpy` [BZ #29454]
> +
> +GCC normally does this optimization for us in
> +strlen_pass::handle_builtin_strcpy but only for optimized
> +build. To avoid needing to include strcpy.S in the rtld build to
> +support the debug build, just do the optimization by hand.
> +
> +Upstream-Status: Submitted [
> https://sourceware.org/bugzilla/show_bug.cgi?id=29454
> https://sourceware.org/pipermail/libc-alpha/2022-August/141290.html]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + elf/dl-cache.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/elf/dl-cache.c b/elf/dl-cache.c
> +index c02a95d9b5..03a6d236e8 100644
> +--- a/elf/dl-cache.c
> ++++ b/elf/dl-cache.c
> +@@ -513,8 +513,9 @@ _dl_load_cache_lookup (const char *name)
> +      we are accessing. Therefore we must make the copy of the
> +      mapping data without using malloc.  */
> +   char *temp;
> +-  temp = alloca (strlen (best) + 1);
> +-  strcpy (temp, best);
> ++  size_t best_len = strlen (best) + 1;
> ++  temp = alloca (best_len);
> ++  memcpy (temp, best, best_len);
> +   return __strdup (temp);
> + }
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.36.bb
> b/meta/recipes-core/glibc/glibc_2.36.bb
> index c64b65db3e3..2db3994cf7b 100644
> --- a/meta/recipes-core/glibc/glibc_2.36.bb
> +++ b/meta/recipes-core/glibc/glibc_2.36.bb
> @@ -51,7 +51,9 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>
> file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
>
> file://0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
> -           "
> +           file://0026-x86-Fix-define-STRCPY-guard-in-strcpy-sse2.S.patch
> \
> +           file://0027-elf-Replace-strcpy-call-with-memcpy-BZ-29454.patch
> \
> +"
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
> --
> 2.37.1
>
>

--000000000000c1c7c005e5cc2f56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">312ded0d63 x86: Fix `#define STRCPY` guard in strcpy-sse2.=
S<br>483cfe1a6a elf: Replace `strcpy` call with `memcpy` [BZ #29454]<br><di=
v><br></div><div>These 2 are now merged in master branch (without any furth=
er changes), we can update Upstream-Status to Backported, but hopefully the=
y&#39;ll be backported to release/2.36/master branch as well and we&#39;ll =
remove them completely with next SRCREV bump.</div><div><br></div><div>Chee=
rs,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Aug 9, 2022 at 7:43 AM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br=
>
<br>
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
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v3: Rebased, no code changes<br>
<br>
=C2=A0...define-STRCPY-guard-in-strcpy-sse2.S.patch | 28 ++++++++++++++++<b=
r>
=C2=A0...ace-strcpy-call-with-memcpy-BZ-29454.patch | 32 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++-<br>
=C2=A03 files changed, 63 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0026-x86-Fix-define-=
STRCPY-guard-in-strcpy-sse2.S.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0027-elf-Replace-str=
cpy-call-with-memcpy-BZ-29454.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard=
-in-strcpy-sse2.S.patch b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define=
-STRCPY-guard-in-strcpy-sse2.S.patch<br>
new file mode 100644<br>
index 00000000000..2d14a4c6196<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0026-x86-Fix-define-STRCPY-guard-in-str=
cpy-sse2.S.patch<br>
@@ -0,0 +1,28 @@<br>
+From 1d4d09d9dff96f46674262534ce1f0e51a8252cb Mon Sep 17 00:00:00 2001<br>
+From: Noah Goldstein &lt;<a href=3D"mailto:goldstein.w.n@gmail.com" target=
=3D"_blank">goldstein.w.n@gmail.com</a>&gt;<br>
+Date: Sun, 7 Aug 2022 22:42:30 +0800<br>
+Subject: [PATCH] x86: Fix `#define STRCPY` guard in strcpy-sse2.S<br>
+<br>
+`#ifndef STPCPY` is incorrect for checking if `STRCPY` is already<br>
+defined.=C2=A0 It doesn&#39;t end up mattering as the whole check is<br>
+guarded by `#if IS_IN (libc)` but is incorrect none the less.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a> <a href=3D"https://sourceware.o=
rg/pipermail/libc-alpha/2022-August/141289.html" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/pipermail/libc-alpha/2022-August/141289.=
html</a>]<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
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
diff --git a/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-wit=
h-memcpy-BZ-29454.patch b/meta/recipes-core/glibc/glibc/0027-elf-Replace-st=
rcpy-call-with-memcpy-BZ-29454.patch<br>
new file mode 100644<br>
index 00000000000..1b347b33226<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0027-elf-Replace-strcpy-call-with-memcp=
y-BZ-29454.patch<br>
@@ -0,0 +1,32 @@<br>
+From f0e36cf0b348dbc990af9f869196710ca89c28c2 Mon Sep 17 00:00:00 2001<br>
+From: Noah Goldstein &lt;<a href=3D"mailto:goldstein.w.n@gmail.com" target=
=3D"_blank">goldstein.w.n@gmail.com</a>&gt;<br>
+Date: Sun, 7 Aug 2022 23:54:19 +0800<br>
+Subject: [PATCH] elf: Replace `strcpy` call with `memcpy` [BZ #29454]<br>
+<br>
+GCC normally does this optimization for us in<br>
+strlen_pass::handle_builtin_strcpy but only for optimized<br>
+build. To avoid needing to include strcpy.S in the rtld build to<br>
+support the debug build, just do the optimization by hand.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://sourceware.org/bugzilla/sho=
w_bug.cgi?id=3D29454" rel=3D"noreferrer" target=3D"_blank">https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D29454</a> <a href=3D"https://sourceware.o=
rg/pipermail/libc-alpha/2022-August/141290.html" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/pipermail/libc-alpha/2022-August/141290.=
html</a>]<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+---<br>
+ elf/dl-cache.c | 5 +++--<br>
+ 1 file changed, 3 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/elf/dl-cache.c b/elf/dl-cache.c<br>
+index c02a95d9b5..03a6d236e8 100644<br>
+--- a/elf/dl-cache.c<br>
++++ b/elf/dl-cache.c<br>
+@@ -513,8 +513,9 @@ _dl_load_cache_lookup (const char *name)<br>
+=C2=A0 =C2=A0 =C2=A0 we are accessing. Therefore we must make the copy of =
the<br>
+=C2=A0 =C2=A0 =C2=A0 mapping data without using malloc.=C2=A0 */<br>
+=C2=A0 =C2=A0char *temp;<br>
+-=C2=A0 temp =3D alloca (strlen (best) + 1);<br>
+-=C2=A0 strcpy (temp, best);<br>
++=C2=A0 size_t best_len =3D strlen (best) + 1;<br>
++=C2=A0 temp =3D alloca (best_len);<br>
++=C2=A0 memcpy (temp, best, best_len);<br>
+=C2=A0 =C2=A0return __strdup (temp);<br>
+ }<br>
+ <br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.36.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.36.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.36.bb</a><br>
index c64b65db3e3..2db3994cf7b 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.36.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.36.bb</a><br>
@@ -51,7 +51,9 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-time-paths-in-the-output-binar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-Revert-Linux-Implemen=
t-a-useful-version-of-_startup_.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-x86-Fix-define-STRCPY=
-guard-in-strcpy-sse2.S.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-elf-Replace-strcpy-ca=
ll-with-memcpy-BZ-29454.patch \<br>
+&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
<br>
-- <br>
2.37.1<br>
<br>
</blockquote></div>

--000000000000c1c7c005e5cc2f56--

