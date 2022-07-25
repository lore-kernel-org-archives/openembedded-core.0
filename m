Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130AAC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:52:17 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web08.26717.1658746329458410129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xo8rofAF;
 spf=pass (domain: gmail.com, ip: 209.85.217.42,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id 66so7491292vse.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MrVaA3D/GJ8AaQlGWCZwA6/VCcE4OpQENXDI77qcNNA=;
        b=Xo8rofAFFS37fmh+g7t6J7olXppAY87lQNkouda2sS8mSt37G/cL9B/xWVHUXGpabh
         XmVRCJyqjo4jpUPWsBfS+UvYYpte6QhK14pHM5Za2nfiQsSzyIVEZERGK8UP2ZFU9g93
         hP80jN+XVoUk7ewv/Er7vwHySse06GIzxzIaNSNzkqs72TnXgfZRSqIx4neoWjo3T4vK
         tGazU72V0+rUEG/jjBe6mCkJ6M1zDvnAlLFGIf5LMLuK2fXRCXxGi0k2SPPOis1VbL/B
         6w+eWxa20t9QOmbmluUAwn1xsKyV8q44twJbk59Ub7/utHvk4qPmrzxvD5au8rck+g1w
         6bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MrVaA3D/GJ8AaQlGWCZwA6/VCcE4OpQENXDI77qcNNA=;
        b=EMnqvgvZmAIHNwRah8QLKLfXW8DYKs/FZnIv18KVDo0g2pYl5AeJlgXrLLBwx5sGvz
         a1zWDyXSmIYkRwHB649QxfQ8S7E1WQ/lYu8+l7+EjY3V5CdB3zHZ8wUs11b42xFc1NwE
         +uriF9sA3LJpI82oV1jA+Ue/fb5v4XTwRGQnYyyJKTQfsOgt1sTh89hMTc+7B1IDv3uC
         fOw9CzWHo+IMOaCDa+zdqNeRdTRmxy97BKakGGidzjQQhYJ1HII8QpxWXK29+Xuo1oy2
         7DTvG7+PJ4cnsqPpoP3OeUm2W5lxuTtza1almyUmU8F1qOBfkLZKDccAuZPz/ucAnDGv
         yeEg==
X-Gm-Message-State: AJIora8/Rrwi/Uq7CeJYTukb9M7tqOFrKb8hkERr7vCgBTvFe8fNwdt3
	hOhV4Hu9qudPGZS2fcNA0QEm1R0CSvXP7oG/gpkriodBDqs=
X-Google-Smtp-Source: 
 AGRyM1vdE4Mne+PLgwrW5M/uTQdHI0N5DofXYXWaXgDqYqObOWnSZXPC/OFwYRspnBGgsonTF/aLICFTqmquDa78W0Q=
X-Received: by 2002:a67:26c4:0:b0:358:5195:fb40 with SMTP id
 m187-20020a6726c4000000b003585195fb40mr1976411vsm.0.1658746328364; Mon, 25
 Jul 2022 03:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657772638.git.steve@sakoman.com>
 <05760b29576aa8797bbae2e9a1a6a44d3c6aa97e.1657772638.git.steve@sakoman.com>
 <CA+chaQfp6PbQpQuUz57f7uorXduNEj6ybSXOSE4wSmwnMxb0UA@mail.gmail.com>
 <CALY4984uzb+sJDy=R_XKzOoigNWsBT77MY3Wn86KbXnEZJY+QQ@mail.gmail.com>
 <CA+chaQcDQKzngTfVpzcz77mM-F-HZ+UFv7zW3zFqpjFyQtby4A@mail.gmail.com>
In-Reply-To: 
 <CA+chaQcDQKzngTfVpzcz77mM-F-HZ+UFv7zW3zFqpjFyQtby4A@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 25 Jul 2022 16:21:57 +0530
Message-ID: 
 <CALY49878e14EGoaACZ57uhcOPyBm=o76dCRimpCsdMGsVOHutw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/27] glibc: stable 2.35 branch updates
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:52:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168479

Hi,

I had referred the following link in buildroot :-
https://lore.kernel.org/buildroot/20220720213853.1A27184110@busybox.osuosl.=
org/t/

Sending the patches would be very helpful.

Thanks,
Pgowda

On Mon, Jul 25, 2022 at 4:03 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Hi,
>
> it was reverted in buildroot as well in:
> https://lore.kernel.org/all/20220615022348.914136-1-james.hilliard1@gmail=
.com/t/
>
> reverting it in both master and kirkstone is probably good work around fo=
r now, I can send a patch later today as I already have it reverted in my b=
uilds.
>
> Regards,
>
> On Mon, Jul 25, 2022 at 12:18 PM pgowda cve <pgowda.cve@gmail.com> wrote:
>>
>> Hi Martin,
>>
>> Thanks for the confirmation from your side.
>> I had the same issue and reverting the commit on master branch fixed the=
 issue.
>> Please let me know whether the patch should be reverted in the master br=
anch to
>> avoid building issues when "DEBUG_BUILD" is enabled.
>>
>> Thanks & Regards
>> Pgowda
>> On Sun, Jul 24, 2022 at 11:25 PM Martin Jansa <Martin.Jansa@gmail.com> w=
rote:
>> >
>> > On Thu, Jul 14, 2022 at 6:36 AM Steve Sakoman <steve@sakoman.com> wrot=
e:
>> >>
>> >> From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
>> >>
>> >> Below commits on Glibc-2.35 development branch are updated.
>> >>
>> >> glibc:
>> >> ....
>> >> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
>> >
>> > ...
>> >
>> > This last commit seems to cause build failure with DEBUG_BUILD:
>> >
>> > x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfp=
math=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot -Wl,-rpath-link=3D/OE/b=
uild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc=
/2.35-r0/build-x86_64-webos-linux:/OE/build/luneos-kirkstone/webos-ports/tm=
p-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/ma=
th:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-lin=
ux/glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/build/luneos-kirkstone/we=
bos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-we=
bos-linux/dlfcn:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/nss:/OE/build/luneos=
-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/bu=
ild-x86_64-webos-linux/nis:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc=
/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/rt:/OE/bu=
ild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/=
2.35-r0/build-x86_64-webos-linux/resolv:/OE/build/luneos-kirkstone/webos-po=
rts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-li=
nux/mathvec:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-=
webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/support:/OE/build/luneos=
-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/bu=
ild-x86_64-webos-linux/nptl -o /OE/build/luneos-kirkstone/webos-ports/tmp-g=
libc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/suppo=
rt/shell-container -pie -Wl,-O1 -nostdlib -nostartfiles  -Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/luneos-kirkston=
e/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/=
debug/glibc/2.35-r0                      -fdebug-prefix-map=3D/OE/build/lun=
eos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=
=3D/usr/src/debug/glibc/2.35-r0                      -fdebug-prefix-map=3D/=
OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/g=
libc/2.35-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/O=
E/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/gl=
ibc/2.35-r0/recipe-sysroot-native=3D  -fuse-ld=3Dbfd  -Wl,-z,combreloc -Wl,=
-z,relro -Wl,--hash-style=3Dboth /OE/build/luneos-kirkstone/webos-ports/tmp=
-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu=
/Scrt1.o /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crti.o `x86_64-webos-li=
nux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-lin=
ux/glibc/2.35-r0/recipe-sysroot  --print-file-name=3DcrtbeginS.o` /OE/build=
/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.3=
5-r0/build-x86_64-webos-linux/support/shell-container.o /OE/build/luneos-ki=
rkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build=
-x86_64-webos-linux/support/libsupport_nonshared.a  -Wl,-dynamic-linker=3D/=
lib/ld-linux-x86-64.so.2 -Wl,-z,now /OE/build/luneos-kirkstone/webos-ports/=
tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/=
libc.so.6 /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-we=
bos-linux/glibc/2.35-r0/build-x86_64-webos-linux/libc_nonshared.a -Wl,--as-=
needed /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos=
-linux/glibc/2.35-r0/build-x86_64-webos-linux/elf/ld.so -Wl,--no-as-needed =
-lgcc  `x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -=
mfpmath=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/=
work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot  --print-file-name=
=3DcrtendS.o` /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o
>> > /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-l=
inux/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../l=
ibexec/x86_64-webos-linux/gcc/x86_64-webos-linux/11.3.0/ld.bfd: /OE/build/l=
uneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-=
r0/build-x86_64-webos-linux/libc.a(libc-tls.o): in function `__libc_setup_t=
ls':
>> > /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined referen=
ce to `_startup_fatal_not_constant'
>> >
>> > The same is reproducible with DEBUG_BUILD in current master. Reverting=
 2d05ba7f8e confirms that this is the only new issue with DEBUG_BUILD.
>> >
>> > Regards,
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#168463): https://lists.openembedded.org/g/openembe=
dded-core/message/168463
>> > Mute This Topic: https://lists.openembedded.org/mt/92373447/6402864
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[pgowda.cve@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

