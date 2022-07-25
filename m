Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99E6C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:18:06 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.26322.1658744284439669866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UBwt0IeG;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id d20so4278967uaw.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YdHQ7O4R9qCP7orkfTgaTD5OS/maD/BRo556SvPJETs=;
        b=UBwt0IeGbz+KMYseRgRNP690Qf7XtJBd7IZq4t3aiIRgQk1l9Dp86AiNzEWTXTphxI
         JMLl1u22erM5CGz8mRvM+vo7cZrRKKAXxDRmIF3yfsIKOBB5kjPwUfDFMwfZsW0sG29S
         NN/CTHHQKwT3r2mrPUJnckJtbEaL/blVsfekkQHQA7ghAzKSrXajz9kQNeA3FmQmtck4
         +2qh4WFyPm12mfOX0b6r01UezOtNXBib9YS2qzPZaeRzBW7bZUjqTGbPgRzddsN9u9w1
         tBFXBBiD1K5c15EqFzd2u3acIzysmYDXMGc9QScVt3+e8HymB2oIvCEWa9u/31nbMtl8
         oMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YdHQ7O4R9qCP7orkfTgaTD5OS/maD/BRo556SvPJETs=;
        b=fQEb35HKe5Tz0RUwSKOPAfaoZF5UmLB60tkwdkTk2KPOw83iV8exBDlQJqhttlPokZ
         Pcatjd9GYCa2DLYKz2RLdTu0xhWnyaDK/r9x/p/mqDbPuJVekdSbubVXi9tztI1iFBXu
         4HNcdoam+mwI+OTJ8bp2UcRMv1xsRLAWtB2oRutI/w2xyyEubqMF/QIYOQFBoTjgMjiA
         5u0ZXgpPH4k1cOV7qxJ3+8Znky5e/n5P0Yze6WyCG/V4/j0NBm8fJpv5cNx5DyEq+DS+
         ec8ERsSDo53l48WIwUTKzVFeLjLaONrgHgkH1VXV4BURR4O1haYOkCpFMXAjmpA3DKbx
         AP+w==
X-Gm-Message-State: AJIora8k+DMJ4FW+dCO3DXFzcc7RGyuMQM8vhgzPEOHK55xyfj4RaIxK
	VPeFzVX+vVhew6IzNCFqGZH/S4kBdOB7EDs7DQY=
X-Google-Smtp-Source: 
 AGRyM1sfAirHw/Waf2RZG0TVdHn4v/rHrxWZc6eDi7KTW7u+cFcseqObns3Vo7vlyANT/j5s/hJwJ2owQ3I9vZg9A4A=
X-Received: by 2002:ab0:20ae:0:b0:384:2b2c:562e with SMTP id
 y14-20020ab020ae000000b003842b2c562emr3175976ual.120.1658744283358; Mon, 25
 Jul 2022 03:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657772638.git.steve@sakoman.com>
 <05760b29576aa8797bbae2e9a1a6a44d3c6aa97e.1657772638.git.steve@sakoman.com>
 <CA+chaQfp6PbQpQuUz57f7uorXduNEj6ybSXOSE4wSmwnMxb0UA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfp6PbQpQuUz57f7uorXduNEj6ybSXOSE4wSmwnMxb0UA@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 25 Jul 2022 15:47:56 +0530
Message-ID: 
 <CALY4984uzb+sJDy=R_XKzOoigNWsBT77MY3Wn86KbXnEZJY+QQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/27] glibc: stable 2.35 branch updates
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:18:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168476

Hi Martin,

Thanks for the confirmation from your side.
I had the same issue and reverting the commit on master branch fixed the is=
sue.
Please let me know whether the patch should be reverted in the master branc=
h to
avoid building issues when "DEBUG_BUILD" is enabled.

Thanks & Regards
Pgowda
On Sun, Jul 24, 2022 at 11:25 PM Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
>
> On Thu, Jul 14, 2022 at 6:36 AM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
>>
>> Below commits on Glibc-2.35 development branch are updated.
>>
>> glibc:
>> ....
>> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
>
> ...
>
> This last commit seems to cause build failure with DEBUG_BUILD:
>
> x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/c=
ore2-64-webos-linux/glibc/2.35-r0/recipe-sysroot -Wl,-rpath-link=3D/OE/buil=
d/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.=
35-r0/build-x86_64-webos-linux:/OE/build/luneos-kirkstone/webos-ports/tmp-g=
libc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/math:=
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/build/luneos-kirkstone/webos=
-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos=
-linux/dlfcn:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64=
-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/nss:/OE/build/luneos-ki=
rkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build=
-x86_64-webos-linux/nis:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wo=
rk/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/rt:/OE/build=
/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.3=
5-r0/build-x86_64-webos-linux/resolv:/OE/build/luneos-kirkstone/webos-ports=
/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux=
/mathvec:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/glibc/2.35-r0/build-x86_64-webos-linux/support:/OE/build/luneos-ki=
rkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build=
-x86_64-webos-linux/nptl -o /OE/build/luneos-kirkstone/webos-ports/tmp-glib=
c/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/support/=
shell-container -pie -Wl,-O1 -nostdlib -nostartfiles  -Wl,-O1 -Wl,--hash-st=
yle=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/luneos-kirkstone/w=
ebos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/deb=
ug/glibc/2.35-r0                      -fdebug-prefix-map=3D/OE/build/luneos=
-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D=
/usr/src/debug/glibc/2.35-r0                      -fdebug-prefix-map=3D/OE/=
build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glib=
c/2.35-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/b=
uild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc=
/2.35-r0/recipe-sysroot-native=3D  -fuse-ld=3Dbfd  -Wl,-z,combreloc -Wl,-z,=
relro -Wl,--hash-style=3Dboth /OE/build/luneos-kirkstone/webos-ports/tmp-gl=
ibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/Sc=
rt1.o /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-=
linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crti.o `x86_64-webos-linux=
-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D=
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/recipe-sysroot  --print-file-name=3DcrtbeginS.o` /OE/build/lu=
neos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r=
0/build-x86_64-webos-linux/support/shell-container.o /OE/build/luneos-kirks=
tone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x8=
6_64-webos-linux/support/libsupport_nonshared.a  -Wl,-dynamic-linker=3D/lib=
/ld-linux-x86-64.so.2 -Wl,-z,now /OE/build/luneos-kirkstone/webos-ports/tmp=
-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/lib=
c.so.6 /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos=
-linux/glibc/2.35-r0/build-x86_64-webos-linux/libc_nonshared.a -Wl,--as-nee=
ded /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-li=
nux/glibc/2.35-r0/build-x86_64-webos-linux/elf/ld.so -Wl,--no-as-needed -lg=
cc  `x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfp=
math=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot  --print-file-name=3Dcr=
tendS.o` /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libe=
xec/x86_64-webos-linux/gcc/x86_64-webos-linux/11.3.0/ld.bfd: /OE/build/lune=
os-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/=
build-x86_64-webos-linux/libc.a(libc-tls.o): in function `__libc_setup_tls'=
:
> /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined reference =
to `_startup_fatal_not_constant'
>
> The same is reproducible with DEBUG_BUILD in current master. Reverting 2d=
05ba7f8e confirms that this is the only new issue with DEBUG_BUILD.
>
> Regards,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168463): https://lists.openembedded.org/g/openembedde=
d-core/message/168463
> Mute This Topic: https://lists.openembedded.org/mt/92373447/6402864
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pg=
owda.cve@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

