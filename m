Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9BEC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 14:00:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.13754.1659880834329786762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 07:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bj3AQ+Gs;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j1so8249155wrw.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WysMtDGXKqF43K/5bBBZa8BQISURci5c8K9bZwaRz24=;
        b=Bj3AQ+GsmaaCFy+WYVmtaYLGmKbaFpFZMxU1wIecMsr+ZnXLu1cUYHlIFbjunI6N3d
         s45d2XwAdorwXi7M7GFJPTIwCBsJ6BsmftRXoUKGzZBorKjn8pg0ojZt0dMLJCiDDjlt
         GnjCV6C57gE0p/0hf+lBzOqKxbcWOBb5ivGs1bY1ddR+NkJS7LkHquh/+SxugTKKmHzC
         XQhWpZnug113z2fwsr6fdaxLj0HSwweixcn0qlZ0tuRPXngXWMZtPvYpVrHAgNCdFIy+
         bSZX6eriO5bUzQAO0H+nv1ku6ZM3egCj+tY+I8Y227iC7x9JXhPAdDp48vuN+GULoMwu
         ybVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WysMtDGXKqF43K/5bBBZa8BQISURci5c8K9bZwaRz24=;
        b=lz9Y/UoFg7N++DLnH5U688ng3VGSvT0+PCY55GrGlDS+kAxTLZ0/atuqFK0NEPf8dZ
         GGuFc59X0JGnIePAFwYAu2OGjsAB1K8an3LdQ2aN8hd+I8ZywZ1K716+qWXnYNwv3InB
         MUqjPXVtawOHY9BlOSF7dvDXvmI6kQMVD7ko+Ig+7qlg3KQRIH3jGHlf51GU6GzkiFuK
         pC33sb79a251Rhs9j02sIGOnI24mMoNz1pmOTSjuvquG9BC8isZsjjolEMMUrVgolr2z
         IbNWhldk7yJLuxIoZ+U/ocIGbMTi7tyzLAflxryDOi8C8tuSrRKdeLUtNlfUhol/Z70c
         swEg==
X-Gm-Message-State: ACgBeo0NzBp3klWUN8TckYND411jLTyxKR6mTRxJkYo2S7LJirqZUxiL
	I+PIr94rgBvokgWygM929zu8JLYFLoaByLB5yos=
X-Google-Smtp-Source: 
 AA6agR5Fm+al52sSGxG47ODVuDuFbheRGMAb+sWW6jsrf3PWrtGr0s5E5mdqSxFL6T5rs3vaWW0CT4g0rcGpK7dwAyo=
X-Received: by 2002:a5d:6e8d:0:b0:21e:48a4:b267 with SMTP id
 k13-20020a5d6e8d000000b0021e48a4b267mr8519228wrz.507.1659880832386; Sun, 07
 Aug 2022 07:00:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <29469a94b96725978e7a2957de16d670fc981a7b.camel@linuxfoundation.org>
 <1705ADB698699ACE.21236@lists.openembedded.org>
 <170733CB4C175948.2604@lists.openembedded.org>
In-Reply-To: <170733CB4C175948.2604@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 7 Aug 2022 15:59:47 +0200
Message-ID: 
 <CA+chaQe3VR=wNFQBSfoQdLWdj2wBj_NLKWkQ079b1_tByJEqxA@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHv2] glibc: revert one upstream change to
 work around broken DEBUG_BUILD build
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, sundeep.kokkonda@gmail.com,
	raj.khem@gmail.com
Content-Type: multipart/alternative; boundary="0000000000006248e805e5a71f6b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 14:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168992

--0000000000006248e805e5a71f6b
Content-Type: text/plain; charset="UTF-8"

This issue is still reproducible in latest 2.36, I've updated:
https://sourceware.org/bugzilla/show_bug.cgi?id=29249
and for the new strcpy issue I've bisected where it was introduced and
created new ticket upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=29454
we can revert 2 more upstream commits as work around, but lets wait a bit
for upstream, maybe there is some simple fix, but I wasn't able to figure
it out today (and don't want to spent even more time on it). Reverts
included in
https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/master
if someone want's to test it as well.

Regards,

On Mon, Aug 1, 2022 at 1:05 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> FWIW: I was checking if this is still reproducible with 2.36 from khem's
> branch:
>
> https://github.com/YoeDistro/openembedded-core/commit/eec0967b92973b8ed5b2fe98ac652fe0da21493b
>
> and with DEBUG_BUILD it failed elsewhere now:
> http://errors.yoctoproject.org/Errors/Details/663898/
>
> |
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/12.1.0/ld.bfd:
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/build-x86_64-oe-linux/elf/librtld.os:
> in function `_dl_load_cache_lookup':
> | /usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined reference
> to `strcpy'
>
> On Wed, Jul 27, 2022 at 1:57 PM Martin Jansa via lists.openembedded.org
> <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
>
>> * work around for build failure with DEBUG_BUILD:
>>   http://errors.yoctoproject.org/Errors/Details/661468/
>>
>>
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.3.0/ld.bfd:
>>
>> TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc/2.35-r0/build-x86_64-oe-linux/libc.a(libc-tls.o):
>>   in function `__libc_setup_tls':
>>   /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined
>> reference to `_startup_fatal_not_constant'
>>
>>   introduced in:
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=50ca0eea5424c89c9b39cf69d8bd73fd65f06e95
>>   with:
>>
>> https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=a2a6bce7d7e52c1c34369a7da62c501cc350bc31
>>
>>   Temporary reverting as discussed in:
>>   https://lists.openembedded.org/g/openembedded-core/message/168463
>>   (it's also reverted in buildroot now with:
>> https://lore.kernel.org/buildroot/20220720213853.1A27184110@busybox.osuosl.org/t/
>> )
>>
>>   instead of revert we can use -fexpensive-optimizations which
>>   will optimize-out the symbol, but that works only with -O1 and
>>   not -Og used by DEBUG_BUILD
>>
>>   upstream report:
>>   https://sourceware.org/bugzilla/show_bug.cgi?id=29249
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>
>>  v2: mention -fexpensive-optimizations and add link to upstream
>>      bug report
>>
>>  ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
>>  2 files changed, 130 insertions(+)
>>  create mode 100644
>> meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>>
>> diff --git
>> a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>> new file mode 100644
>> index 0000000000..2421a63605
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
>> @@ -0,0 +1,128 @@
>> +From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>> +Date: Sun, 24 Jul 2022 19:41:41 +0200
>> +Subject: [PATCH] Revert "Linux: Implement a useful version of
>> _startup_fatal"
>> +
>> +This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
>> +Upstream-Status: Inappropriate [temporary work around]
>> +
>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> +
>> +---
>> + sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
>> + sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
>> + sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
>> + 3 files changed, 19 insertions(+), 65 deletions(-)
>> + delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
>> + delete mode 100644 sysdeps/unix/sysv/linux/startup.h
>> +
>> +diff --git a/sysdeps/unix/sysv/linux/i386/startup.h
>> b/sysdeps/unix/sysv/linux/i386/startup.h
>> +index 213805d7d2..67c9310f3a 100644
>> +--- a/sysdeps/unix/sysv/linux/i386/startup.h
>> ++++ b/sysdeps/unix/sysv/linux/i386/startup.h
>> +@@ -1,5 +1,5 @@
>> + /* Linux/i386 definitions of functions used by static libc main startup.
>> +-   Copyright (C) 2022 Free Software Foundation, Inc.
>> ++   Copyright (C) 2017-2022 Free Software Foundation, Inc.
>> +    This file is part of the GNU C Library.
>> +
>> +    The GNU C Library is free software; you can redistribute it and/or
>> +@@ -16,7 +16,22 @@
>> +    License along with the GNU C Library; if not, see
>> +    <https://www.gnu.org/licenses/>.  */
>> +
>> +-/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
>> +-#define I386_USE_SYSENTER 0
>> ++#if BUILD_PIE_DEFAULT
>> ++/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
>> ++# define I386_USE_SYSENTER 0
>> +
>> +-#include_next <startup.h>
>> ++# include <sysdep.h>
>> ++# include <abort-instr.h>
>> ++
>> ++__attribute__ ((__noreturn__))
>> ++static inline void
>> ++_startup_fatal (const char *message __attribute__ ((unused)))
>> ++{
>> ++  /* This is only called very early during startup in static PIE.
>> ++     FIXME: How can it be improved?  */
>> ++  ABORT_INSTRUCTION;
>> ++  __builtin_unreachable ();
>> ++}
>> ++#else
>> ++# include_next <startup.h>
>> ++#endif
>> +diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h
>> b/sysdeps/unix/sysv/linux/ia64/startup.h
>> +deleted file mode 100644
>> +index 77f29f15a2..0000000000
>> +--- a/sysdeps/unix/sysv/linux/ia64/startup.h
>> ++++ /dev/null
>> +@@ -1,22 +0,0 @@
>> +-/* Linux/ia64 definitions of functions used by static libc main startup.
>> +-   Copyright (C) 2022 Free Software Foundation, Inc.
>> +-   This file is part of the GNU C Library.
>> +-
>> +-   The GNU C Library is free software; you can redistribute it and/or
>> +-   modify it under the terms of the GNU Lesser General Public
>> +-   License as published by the Free Software Foundation; either
>> +-   version 2.1 of the License, or (at your option) any later version.
>> +-
>> +-   The GNU C Library is distributed in the hope that it will be useful,
>> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +-   Lesser General Public License for more details.
>> +-
>> +-   You should have received a copy of the GNU Lesser General Public
>> +-   License along with the GNU C Library; if not, see
>> +-   <https://www.gnu.org/licenses/>.  */
>> +-
>> +-/* This code is used before the TCB is set up.  */
>> +-#define IA64_USE_NEW_STUB 0
>> +-
>> +-#include_next <startup.h>
>> +diff --git a/sysdeps/unix/sysv/linux/startup.h
>> b/sysdeps/unix/sysv/linux/startup.h
>> +deleted file mode 100644
>> +index 39859b404a..0000000000
>> +--- a/sysdeps/unix/sysv/linux/startup.h
>> ++++ /dev/null
>> +@@ -1,39 +0,0 @@
>> +-/* Linux definitions of functions used by static libc main startup.
>> +-   Copyright (C) 2017-2022 Free Software Foundation, Inc.
>> +-   This file is part of the GNU C Library.
>> +-
>> +-   The GNU C Library is free software; you can redistribute it and/or
>> +-   modify it under the terms of the GNU Lesser General Public
>> +-   License as published by the Free Software Foundation; either
>> +-   version 2.1 of the License, or (at your option) any later version.
>> +-
>> +-   The GNU C Library is distributed in the hope that it will be useful,
>> +-   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +-   Lesser General Public License for more details.
>> +-
>> +-   You should have received a copy of the GNU Lesser General Public
>> +-   License along with the GNU C Library; if not, see
>> +-   <https://www.gnu.org/licenses/>.  */
>> +-
>> +-#ifdef SHARED
>> +-# include_next <startup.h>
>> +-#else
>> +-# include <sysdep.h>
>> +-
>> +-/* Avoid a run-time invocation of strlen.  */
>> +-#define _startup_fatal(message)
>>  \
>> +-  do
>> \
>> +-    {
>>  \
>> +-      size_t __message_length = __builtin_strlen (message);
>>  \
>> +-      if (! __builtin_constant_p (__message_length))
>> \
>> +-        {
>>  \
>> +-          extern void _startup_fatal_not_constant (void);
>>  \
>> +-          _startup_fatal_not_constant ();
>>  \
>> +-        }
>>  \
>> +-      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),
>>  \
>> +-                             __message_length);
>>  \
>> +-      INTERNAL_SYSCALL_CALL (exit_group, 127);
>> \
>> +-    }
>>  \
>> +-  while (0)
>> +-#endif  /* !SHARED */
>> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb
>> b/meta/recipes-core/glibc/glibc_2.35.bb
>> index 96fe39c548..df847e76bf 100644
>> --- a/meta/recipes-core/glibc/glibc_2.35.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
>> @@ -48,6 +48,8 @@ SRC_URI =
>> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>
>> file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
>>
>> file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
>>
>> file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>> +           \
>> +
>>  file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
>>             "
>>  S = "${WORKDIR}/git"
>>  B = "${WORKDIR}/build-${TARGET_SYS}"
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168746):
> https://lists.openembedded.org/g/openembedded-core/message/168746
> Mute This Topic: https://lists.openembedded.org/mt/92744420/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006248e805e5a71f6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This issue is still reproducible in latest 2.36, I&#39;ve =
updated:<div><a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D2=
9249">https://sourceware.org/bugzilla/show_bug.cgi?id=3D29249</a><br></div>=
<div>and for the new strcpy issue I&#39;ve bisected where it was introduced=
 and created new ticket upstream:</div><div><a href=3D"https://sourceware.o=
rg/bugzilla/show_bug.cgi?id=3D29454">https://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D29454</a><br></div><div>we can revert 2 more upstream commits a=
s work around, but lets wait a bit for upstream, maybe there is some simple=
 fix, but I wasn&#39;t able to figure it out today (and don&#39;t want to s=
pent even more time on it). Reverts included in=C2=A0<a href=3D"https://git=
.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/master">https://=
git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/master</a> if=
 someone want&#39;s to test it as well.</div><div><br></div><div>Regards,</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Aug 1, 2022 at 1:05 PM Martin Jansa via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D=
"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">FWIW: I was checking if this is still reproducible with 2.3=
6 from khem&#39;s branch:<div><a href=3D"https://github.com/YoeDistro/opene=
mbedded-core/commit/eec0967b92973b8ed5b2fe98ac652fe0da21493b" target=3D"_bl=
ank">https://github.com/YoeDistro/openembedded-core/commit/eec0967b92973b8e=
d5b2fe98ac652fe0da21493b</a><br></div><div><br></div><div>and with DEBUG_BU=
ILD it failed elsewhere now:</div><div><a href=3D"http://errors.yoctoprojec=
t.org/Errors/Details/663898/" target=3D"_blank">http://errors.yoctoproject.=
org/Errors/Details/663898/</a><br></div><div><br></div><div>| /OE/build/oe-=
core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-r0/recipe-sysroot-native/u=
sr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/12=
.1.0/ld.bfd: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/glibc/2.36-=
r0/build-x86_64-oe-linux/elf/librtld.os: in function `_dl_load_cache_lookup=
&#39;:<br>| /usr/src/debug/glibc/2.36-r0/git/elf/dl-cache.c:513: undefined =
reference to `strcpy&#39;<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 1:57 PM Martin J=
ansa via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.=
openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* work a=
round for build failure with DEBUG_BUILD:<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168746): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168746" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168746</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92744420/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92744420/3617156</a><br>
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

--0000000000006248e805e5a71f6b--

