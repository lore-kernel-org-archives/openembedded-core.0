Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24050C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 11:05:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.23288.1659351935256347307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 04:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MlbSIfSI;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id v3so12741825wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SGG1jj6m+ie6cd8Jm7nnFqb52IaD0xUUoFqdahorpYw=;
        b=MlbSIfSIhxOMod8jN3AxjysAHeAKNSJalaqDyiYRnjourp3NdpjMz7rflFt3MohROL
         sn2tsdZgje5Bg1q2/81TD/Sl+cYhdbo2HW/DUM9+GDVvFMyzvxvzQb3fZS4DPe5ManuC
         nBdPwOkvlBlsgQJHS7Y/yGr6uoJYmqgkjLlhmuSQQtuT6UVF2UHkl0r7VjlXmYKtkD/J
         uEWW1LwRiZZCYVw1cDv0vVsLwbHxtbDDIlJD9Y8CBQzJ/qgR88aZmHAtf7r/5NMnh3q+
         MhVyZnoO8cKljUNXAEwMVGCxOG4bBhIG0kpXpTqVIZeBL8VyLGoIAzEwhwhvvFdh3wy9
         UtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SGG1jj6m+ie6cd8Jm7nnFqb52IaD0xUUoFqdahorpYw=;
        b=nJRyeiGCcRZ8GpO9HdfAekq2VoidhXYkqkOu5UsCe1qcZJUfoxyp6AB1zapR2WdfP2
         TesjXpfdDb76wUe1VIKNgc57H8clthcL1pRFR+DkCNPhK6rGGsnqkZY7AcMMAgAsFnYR
         ZnH3/HxbpWRJAq4RNOMOpmuPyr2yJqzXAyirkLHmqLLVahVIBe0GvSOkGv5lsu2ikIUS
         SKeFWpCMR1ai8IBbDYytD1eBEA2aA0RZx0F2p7p0jmhwn8u2HB61kq1gIi+buWnFfxww
         pVBX2qSpWsRTOmrM+SzjKrvupuJjbNd/l8dqHY82bQfW9EAjHnPUfACqVdwsTq7XXI6O
         eNNQ==
X-Gm-Message-State: ACgBeo2L3oaZAsYwMl2mLgg3wQiBIrg++ynA5MZdOZLJR8HHBNZIBy2C
	mGi3z3orSEqOJxilYAvkA6wJ8vEQ8thz+9A8L48=
X-Google-Smtp-Source: 
 AA6agR4CsW9musaBUvJB8gmEeFdDAN0s7SN21iSPYHF2ElHSrUj62foVtZhFWQhThwb9i2VY/qmY0YQwen55K4lQ198=
X-Received: by 2002:adf:f5c7:0:b0:220:6871:de96 with SMTP id
 k7-20020adff5c7000000b002206871de96mr1340040wrp.516.1659351933375; Mon, 01
 Aug 2022 04:05:33 -0700 (PDT)
MIME-Version: 1.0
References: 
 <29469a94b96725978e7a2957de16d670fc981a7b.camel@linuxfoundation.org>
 <1705ADB698699ACE.21236@lists.openembedded.org>
In-Reply-To: <1705ADB698699ACE.21236@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 1 Aug 2022 13:04:58 +0200
Message-ID: 
 <CA+chaQdwCJG2hWPtuzA8rfMVLPCsJOKDzOL4u2ZCK98rOnwCDA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHv2] glibc: revert one upstream change to
 work around broken DEBUG_BUILD build
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@gmail.com,
	raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008bd95b05e52bfa14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 11:05:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168746

--0000000000008bd95b05e52bfa14
Content-Type: text/plain; charset="UTF-8"

FWIW: I was checking if this is still reproducible with 2.36 from khem's
branch:
https://github.com/YoeDistro/openembedded-core/commit/eec0967b92973b8ed5b2fe98ac652fe0da21493b

and with DEBUG_BUILD it failed elsewhere now:
http://errors.yoctoproject.org/Errors/Details/663898/

|
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/12.1.0/ld.bfd:
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os:
in function `_dl_load_cache_lookup':
| /usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined reference
to `strcpy'

On Wed, Jul 27, 2022 at 1:57 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * work around for build failure with DEBUG_BUILD:
>   http://errors.yoctoproject.org/Errors/Details/661468/
>
>
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.3.0/ld.bfd:
>
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-oe-linux/libc.a(libc-tls.o):
>   in function `__libc_setup_tls':
>   /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined reference
> to `_startup_fatal_not_constant'
>
>   introduced in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=50ca0eea5424c89c9b39cf69d8bd73fd65f06e95
>   with:
>
> https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=a2a6bce7d7e52c1c34369a7da62c501cc350bc31
>
>   Temporary reverting as discussed in:
>   https://lists.openembedded.org/g/openembedded-core/message/168463
>   (it's also reverted in buildroot now with:
> https://lore.kernel.org/buildroot/20220720213853.1A27184110@busybox.osuosl.org/t/
> )
>
>   instead of revert we can use -fexpensive-optimizations which
>   will optimize-out the symbol, but that works only with -O1 and
>   not -Og used by DEBUG_BUILD
>
>   upstream report:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=29249
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>
>  v2: mention -fexpensive-optimizations and add link to upstream
>      bug report
>
>  ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
>  2 files changed, 130 insertions(+)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> new file mode 100644
> index 0000000000..2421a63605
> --- /dev/null
> +++
> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> @@ -0,0 +1,128 @@
> +From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 24 Jul 2022 19:41:41 +0200
> +Subject: [PATCH] Revert "Linux: Implement a useful version of
> _startup_fatal"
> +
> +This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
> +Upstream-Status: Inappropriate [temporary work around]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +---
> + sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
> + sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
> + sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
> + 3 files changed, 19 insertions(+), 65 deletions(-)
> + delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
> + delete mode 100644 sysdeps/unix/sysv/linux/startup.h
> +
> +diff --git a/sysdeps/unix/sysv/linux/i386/startup.h
> b/sysdeps/unix/sysv/linux/i386/startup.h
> +index 213805d7d2..67c9310f3a 100644
> +--- a/sysdeps/unix/sysv/linux/i386/startup.h
> ++++ b/sysdeps/unix/sysv/linux/i386/startup.h
> +@@ -1,5 +1,5 @@
> + /* Linux/i386 definitions of functions used by static libc main startup.
> +-   Copyright (C) 2022 Free Software Foundation, Inc.
> ++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> +
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -16,7 +16,22 @@
> +    License along with the GNU C Library; if not, see
> +    <https://www.gnu.org/licenses/>.  */
> +
> +-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
> +-#define I386_USE_SYSENTER 0
> ++#if BUILD_PIE_DEFAULT
> ++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
> ++# define I386_USE_SYSENTER 0
> +
> +-#include_next <startup.h>
> ++# include <sysdep.h>
> ++# include <abort-instr.h>
> ++
> ++__attribute__ ((__noreturn__))
> ++static inline void
> ++_startup_fatal (const char *message __attribute__ ((unused)))
> ++{
> ++  /* This is only called very early during startup in static PIE.
> ++     FIXME: How can it be improved?  */
> ++  ABORT_INSTRUCTION;
> ++  __builtin_unreachable ();
> ++}
> ++#else
> ++# include_next <startup.h>
> ++#endif
> +diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h
> b/sysdeps/unix/sysv/linux/ia64/startup.h
> +deleted file mode 100644
> +index 77f29f15a2..0000000000
> +--- a/sysdeps/unix/sysv/linux/ia64/startup.h
> ++++ /dev/null
> +@@ -1,22 +0,0 @@
> +-/* Linux/ia64 definitions of functions used by static libc main startup.
> +-   Copyright (C) 2022 Free Software Foundation, Inc.
> +-   This file is part of the GNU C Library.
> +-
> +-   The GNU C Library is free software; you can redistribute it and/or
> +-   modify it under the terms of the GNU Lesser General Public
> +-   License as published by the Free Software Foundation; either
> +-   version 2.1 of the License, or (at your option) any later version.
> +-
> +-   The GNU C Library is distributed in the hope that it will be useful,
> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +-   Lesser General Public License for more details.
> +-
> +-   You should have received a copy of the GNU Lesser General Public
> +-   License along with the GNU C Library; if not, see
> +-   <https://www.gnu.org/licenses/>.  */
> +-
> +-/* This code is used before the TCB is set up.  */
> +-#define IA64_USE_NEW_STUB 0
> +-
> +-#include_next <startup.h>
> +diff --git a/sysdeps/unix/sysv/linux/startup.h
> b/sysdeps/unix/sysv/linux/startup.h
> +deleted file mode 100644
> +index 39859b404a..0000000000
> +--- a/sysdeps/unix/sysv/linux/startup.h
> ++++ /dev/null
> +@@ -1,39 +0,0 @@
> +-/* Linux definitions of functions used by static libc main startup.
> +-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> +-   This file is part of the GNU C Library.
> +-
> +-   The GNU C Library is free software; you can redistribute it and/or
> +-   modify it under the terms of the GNU Lesser General Public
> +-   License as published by the Free Software Foundation; either
> +-   version 2.1 of the License, or (at your option) any later version.
> +-
> +-   The GNU C Library is distributed in the hope that it will be useful,
> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +-   Lesser General Public License for more details.
> +-
> +-   You should have received a copy of the GNU Lesser General Public
> +-   License along with the GNU C Library; if not, see
> +-   <https://www.gnu.org/licenses/>.  */
> +-
> +-#ifdef SHARED
> +-# include_next <startup.h>
> +-#else
> +-# include <sysdep.h>
> +-
> +-/* Avoid a run-time invocation of strlen.  */
> +-#define _startup_fatal(message)                                         \
> +-  do                                                                    \
> +-    {                                                                   \
> +-      size_t __message_length = __builtin_strlen (message);             \
> +-      if (! __builtin_constant_p (__message_length))                    \
> +-        {                                                               \
> +-          extern void _startup_fatal_not_constant (void);               \
> +-          _startup_fatal_not_constant ();                               \
> +-        }                                                               \
> +-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
> +-                             __message_length);                         \
> +-      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
> +-    }                                                                   \
> +-  while (0)
> +-#endif  /* !SHARED */
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb
> b/meta/recipes-core/glibc/glibc_2.35.bb
> index 96fe39c548..df847e76bf 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -48,6 +48,8 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
>
> file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
>
> file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
> +           \
> +
>  file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168558):
> https://lists.openembedded.org/g/openembedded-core/message/168558
> Mute This Topic: https://lists.openembedded.org/mt/92647387/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008bd95b05e52bfa14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I was checking if this is still reproducible with 2.=
36 from khem&#39;s branch:<div><a href=3D"https://github.com/YoeDistro/open=
embedded-core/commit/eec0967b92973b8ed5b2fe98ac652fe0da21493b">https://gith=
ub.com/YoeDistro/openembedded-core/commit/eec0967b92973b8ed5b2fe98ac652fe0d=
a21493b</a><br></div><div><br></div><div>and with DEBUG_BUILD it failed els=
ewhere now:</div><div><a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/663898/">http://errors.yoctoproject.org/Errors/Details/663898/</a><br><=
/div><div><br></div><div>| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/glibc/2.36-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexe=
c/x86_64-oe-linux/gcc/x86_64-oe-linux/12.1.0/ld.bfd: /OE/build/oe-core/tmp-=
glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtl=
d.os: in function `_dl_load_cache_lookup&#39;:<br>| /usr/src/debug/glibc/2.=
36-r0/git/elf/dl-cache.c:513: undefined reference to `strcpy&#39;<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Jul 27, 2022 at 1:57 PM Martin Jansa via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* wo=
rk around for build failure with DEBUG_BUILD:<br>
=C2=A0 <a href=3D"http://errors.yoctoproject.org/Errors/Details/661468/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/661468/</a><br>
<br>
=C2=A0 TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot=
-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe=
-linux/11.3.0/ld.bfd:<br>
=C2=A0 TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-o=
e-linux/libc.a(libc-tls.o):<br>
=C2=A0 in function `__libc_setup_tls&#39;:<br>
=C2=A0 /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined refer=
ence to `_startup_fatal_not_constant&#39;<br>
<br>
=C2=A0 introduced in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D50ca0eea5424c89c9b39cf69d8bd73fd65f06e95" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D50ca0eea=
5424c89c9b39cf69d8bd73fd65f06e95</a><br>
=C2=A0 with:<br>
=C2=A0 <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;=
h=3Da2a6bce7d7e52c1c34369a7da62c501cc350bc31" rel=3D"noreferrer" target=3D"=
_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3Da2a6bc=
e7d7e52c1c34369a7da62c501cc350bc31</a><br>
<br>
=C2=A0 Temporary reverting as discussed in:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/168463" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/168463</a><br>
=C2=A0 (it&#39;s also reverted in buildroot now with: <a href=3D"https://lo=
re.kernel.org/buildroot/20220720213853.1A27184110@busybox.osuosl.org/t/" re=
l=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/buildroot/202207=
20213853.1A27184110@busybox.osuosl.org/t/</a>)<br>
<br>
=C2=A0 instead of revert we can use -fexpensive-optimizations which<br>
=C2=A0 will optimize-out the symbol, but that works only with -O1 and<br>
=C2=A0 not -Og used by DEBUG_BUILD<br>
<br>
=C2=A0 upstream report:<br>
=C2=A0 <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249" =
rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D29249</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
<br>
=C2=A0v2: mention -fexpensive-optimizations and add link to upstream<br>
=C2=A0 =C2=A0 =C2=A0bug report<br>
<br>
=C2=A0...lement-a-useful-version-of-_startup_.patch | 128 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.35.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A02 files changed, 130 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Im=
plement-a-useful-version-of-_startup_.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-us=
eful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0001-Revert=
-Linux-Implement-a-useful-version-of-_startup_.patch<br>
new file mode 100644<br>
index 0000000000..2421a63605<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-ve=
rsion-of-_startup_.patch<br>
@@ -0,0 +1,128 @@<br>
+From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001<br>
+From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Date: Sun, 24 Jul 2022 19:41:41 +0200<br>
+Subject: [PATCH] Revert &quot;Linux: Implement a useful version of _startu=
p_fatal&quot;<br>
+<br>
+This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.<br>
+Upstream-Status: Inappropriate [temporary work around]<br>
+<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---<br>
+ sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------<br>
+ sysdeps/unix/sysv/linux/startup.h=C2=A0 =C2=A0 =C2=A0 | 39 --------------=
------------<br>
+ 3 files changed, 19 insertions(+), 65 deletions(-)<br>
+ delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h<br>
+ delete mode 100644 sysdeps/unix/sysv/linux/startup.h<br>
+<br>
+diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/li=
nux/i386/startup.h<br>
+index 213805d7d2..67c9310f3a 100644<br>
+--- a/sysdeps/unix/sysv/linux/i386/startup.h<br>
++++ b/sysdeps/unix/sysv/linux/i386/startup.h<br>
+@@ -1,5 +1,5 @@<br>
+ /* Linux/i386 definitions of functions used by static libc main startup.<=
br>
+-=C2=A0 =C2=A0Copyright (C) 2022 Free Software Foundation, Inc.<br>
++=C2=A0 =C2=A0Copyright (C) 2017-2022 Free Software Foundation, Inc.<br>
+=C2=A0 =C2=A0 This file is part of the GNU C Library.<br>
+ <br>
+=C2=A0 =C2=A0 The GNU C Library is free software; you can redistribute it =
and/or<br>
+@@ -16,7 +16,22 @@<br>
+=C2=A0 =C2=A0 License along with the GNU C Library; if not, see<br>
+=C2=A0 =C2=A0 &lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
+ <br>
+-/* Can&#39;t use &quot;call *%gs:SYSINFO_OFFSET&quot; during startup.=C2=
=A0 */<br>
+-#define I386_USE_SYSENTER 0<br>
++#if BUILD_PIE_DEFAULT<br>
++/* Can&#39;t use &quot;call *%gs:SYSINFO_OFFSET&quot; during statup in st=
atic PIE.=C2=A0 */<br>
++# define I386_USE_SYSENTER 0<br>
+ <br>
+-#include_next &lt;startup.h&gt;<br>
++# include &lt;sysdep.h&gt;<br>
++# include &lt;abort-instr.h&gt;<br>
++<br>
++__attribute__ ((__noreturn__))<br>
++static inline void<br>
++_startup_fatal (const char *message __attribute__ ((unused)))<br>
++{<br>
++=C2=A0 /* This is only called very early during startup in static PIE.<br=
>
++=C2=A0 =C2=A0 =C2=A0FIXME: How can it be improved?=C2=A0 */<br>
++=C2=A0 ABORT_INSTRUCTION;<br>
++=C2=A0 __builtin_unreachable ();<br>
++}<br>
++#else<br>
++# include_next &lt;startup.h&gt;<br>
++#endif<br>
+diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/li=
nux/ia64/startup.h<br>
+deleted file mode 100644<br>
+index 77f29f15a2..0000000000<br>
+--- a/sysdeps/unix/sysv/linux/ia64/startup.h<br>
++++ /dev/null<br>
+@@ -1,22 +0,0 @@<br>
+-/* Linux/ia64 definitions of functions used by static libc main startup.<=
br>
+-=C2=A0 =C2=A0Copyright (C) 2022 Free Software Foundation, Inc.<br>
+-=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
+-<br>
+-=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
+-=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
+-=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
+-=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
+-<br>
+-=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
+-=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
+-=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
+-=C2=A0 =C2=A0Lesser General Public License for more details.<br>
+-<br>
+-=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
+-=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
+-=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
+-<br>
+-/* This code is used before the TCB is set up.=C2=A0 */<br>
+-#define IA64_USE_NEW_STUB 0<br>
+-<br>
+-#include_next &lt;startup.h&gt;<br>
+diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/s=
tartup.h<br>
+deleted file mode 100644<br>
+index 39859b404a..0000000000<br>
+--- a/sysdeps/unix/sysv/linux/startup.h<br>
++++ /dev/null<br>
+@@ -1,39 +0,0 @@<br>
+-/* Linux definitions of functions used by static libc main startup.<br>
+-=C2=A0 =C2=A0Copyright (C) 2017-2022 Free Software Foundation, Inc.<br>
+-=C2=A0 =C2=A0This file is part of the GNU C Library.<br>
+-<br>
+-=C2=A0 =C2=A0The GNU C Library is free software; you can redistribute it =
and/or<br>
+-=C2=A0 =C2=A0modify it under the terms of the GNU Lesser General Public<b=
r>
+-=C2=A0 =C2=A0License as published by the Free Software Foundation; either=
<br>
+-=C2=A0 =C2=A0version 2.1 of the License, or (at your option) any later ve=
rsion.<br>
+-<br>
+-=C2=A0 =C2=A0The GNU C Library is distributed in the hope that it will be=
 useful,<br>
+-=C2=A0 =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
+-=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 S=
ee the GNU<br>
+-=C2=A0 =C2=A0Lesser General Public License for more details.<br>
+-<br>
+-=C2=A0 =C2=A0You should have received a copy of the GNU Lesser General Pu=
blic<br>
+-=C2=A0 =C2=A0License along with the GNU C Library; if not, see<br>
+-=C2=A0 =C2=A0&lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"norefer=
rer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
+-<br>
+-#ifdef SHARED<br>
+-# include_next &lt;startup.h&gt;<br>
+-#else<br>
+-# include &lt;sysdep.h&gt;<br>
+-<br>
+-/* Avoid a run-time invocation of strlen.=C2=A0 */<br>
+-#define _startup_fatal(message)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 do=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t __message_length =3D __builtin_strlen (messag=
e);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 if (! __builtin_constant_p (__message_length))=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extern void _startup_fatal_not_constan=
t (void);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _startup_fatal_not_constant ();=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (messag=
e),=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__message_length);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 INTERNAL_SYSCALL_CALL (exit_group, 127);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+-=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 while (0)<br>
+-#endif=C2=A0 /* !SHARED */<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.35.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.35.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.35.bb</a><br>
index 96fe39c548..df847e76bf 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.35.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.35.bb</a><br>
@@ -48,6 +48,8 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCBR=
ANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-sysdeps-gnu-configure=
.ac-Set-libc_cv_rootsbindir-onl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-timezone-Make-shell-i=
nterpreter-overridable-in-tzsel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-fix-create-thread-fai=
led-in-unprivileged-process-BZ-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Revert-Linux-Implemen=
t-a-useful-version-of-_startup_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168558): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168558" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168558</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92647387/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92647387/3617156</a><br>
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

--0000000000008bd95b05e52bfa14--

