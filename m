Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A973ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 13:34:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.6492.1662125631960098775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 06:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aBSKHnDP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n17so2355840wrm.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=PeMmZO85/Zw8k6HXSI0xmT2GpI2cNF4FFmrvclKBg7Q=;
        b=aBSKHnDPahsr8OKDV5B9Ebe4uKLw77G4VpTiZiWZqYOtFXQ3/TPHRAangKnyT1B7Yt
         RKLk/04AOFxGDzGBuuGbx7VTGy65DlezcgEPFchXb1akEK9jVsgujLuvlkXX/Iqo7wvh
         eXAG23/iu2xt8g+CEpn5CM3IoYFIcjJdaovMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=PeMmZO85/Zw8k6HXSI0xmT2GpI2cNF4FFmrvclKBg7Q=;
        b=sDKdvxPu1oqIarJx4PNtoNwXpLq+phC7YTJ3P2N5FJPJcUOifu2RRv5OrXeYw+a1bk
         7XL+fM54HUiXFxZbu7Gj1KLaVuxkZ9WyaZ9hnNhlEm9ouKpRUpEnFiLEONAQLtZS0M1m
         ZnorYDghM+m+A/5Y4cXDeMpk0u4I+Z37ITKzzTvqzb9haSALG9vZpFtuOaLmGqe93M+N
         O8aBUBXaDytQJKhza7c7/rhG7SAFfMr6DebPhMT5WF5GxXIX5Qw1FFxn86+cGfYSqgFE
         B/uiQ3y+ig21gJ7xDn4AVog8DBSh1kDVv1vYD8QXzQBuE4OEET/kWphIsryCXZGf7NJz
         ACww==
X-Gm-Message-State: ACgBeo2Xm/92RiYaXxgqtEHo11JLCykjlYhFlhBNH6lZNGMcWI1nv96k
	auK9YLhZJsLN0zljyTLmxm7t1A==
X-Google-Smtp-Source: 
 AA6agR6iO+ZCHRFzf0UXYOB8Nx+7pS+IsN3YERl4RfNcc/74Qxdnw6hI15vO1koNlHv75F2a0OO71g==
X-Received: by 2002:a05:6000:15c6:b0:226:f246:6e70 with SMTP id
 y6-20020a05600015c600b00226f2466e70mr5839490wry.617.1662125630252;
        Fri, 02 Sep 2022 06:33:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbec:572b:ff3a:e320?
 ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 z4-20020a1cf404000000b003a603fbad5bsm2062006wma.45.2022.09.02.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:33:49 -0700 (PDT)
Message-ID: 
 <5741bb69465ddd34c4d5e5590d16cc20061b871c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a
 build script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 Sep 2022 14:33:47 +0100
In-Reply-To: <0f4a63bc-4be4-126d-a403-804f75140a53@berginkonsult.se>
References: <20220823085636.30868-1-peter@berginkonsult.se>
	 <20220823085636.30868-2-peter@berginkonsult.se>
	 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
	 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
	 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
	 <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
	 <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
	 <0f4a63bc-4be4-126d-a403-804f75140a53@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 13:34:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170246

On Mon, 2022-08-29 at 13:09 +0200, Peter Bergin wrote:
> Hi Richard,
>=20
> (also adding Khem Raj to CC as maintainer for gcc in oe-core)
>=20
> On 2022-08-25 17:25, Richard Purdie wrote:
> > On Thu, 2022-08-25 at 14:03 +0200, Peter Bergin wrote:
> > > Hi Richard,
> > >=20
> > > On 2022-08-25 10:21, Richard Purdie wrote:
> > > > <snip>
> > > > > I've tried locally to reproduce something. I've built and tested
> > > > > genericx86 and qemuarm64 now on core-image-sato sdk that I saw wa=
s the
> > > > > target for the autobuilder. Both tests passes. The failure I see =
in the
> > > > > autobuilder logs is that the build script can not be executed. On=
 my
> > > > > machine I have that file and it can clearly be executed:
> > > > >=20
> > > > > $ find
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/
> > > > > -name build-script-build
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > >=20
> > > > > $
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > >=20
> > > > > $ file
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > >=20
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build:
> > > > > ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamica=
lly
> > > > > linked, interpreter
> > > > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86=
-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-li=
nux/lib/ld-linux-x86-64.so.2,
> > > > > BuildID[sha1]=3Dc5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU=
/Linux
> > > > > 3.2.0, with debug_info, not stripped
> > > > >=20
> > > > > Found one interesting link here
> > > > > https://github.com/rust-lang/cargo/issues/3553. Unfortunately wit=
hout
> > > > > answer. But also checked the interpreter in my build which looks =
correct?
> > > > >=20
> > > > > $ readelf -a
> > > > > tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-s=
dk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
> > > > > > grep interpreter
> > > > >    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter=
:
> > > > > /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86=
-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-li=
nux/lib/ld-linux-x86-64.so.2]
> > > > >=20
> > > > >=20
> > > > > So there are some differences between my machine and the autobuil=
der
> > > > > setup that I can't get. I would need help here as I'm not that fa=
miliar
> > > > > with the autobuilder setup. Can it still be some host dependency?=
 I'm
> > > > > running on Ubuntu 22.04. Is it possible to check in a autobuilder=
 setup
> > > > > if the file 'build-script-build' is present and possible to execu=
te?
> > > > After staring at this for an hour, I think the pattern is that is i=
t
> > > > failing on builds with:
> > > >=20
> > > > SDKMACHINE =3D "i686"
> > > >=20
> > > > which probably means the linker isn't linking against the libc and
> > > > loader in the SDK properly.
> > > >=20
> > > > (i686 SDK binaries should run on x86_64 hosts since we provide our =
own
> > > > loader and libc)
> > > Thanks a lot for the reproducer. You are correct, with SDKMACHINE i68=
6 I
> > > was able to reproduce. I want to share some weird stuff and see if
> > > someone can get a clue for a solution.
> > >=20
> > > Did same analyze on the build-script-build file as I did on a working=
 one:
> > As I suspected, the dynamic loader on binaries built using the
> > toolchain in the SDK isn't working correctly.
> >=20
> > "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-
> > linux/lib/ld-linux.so.2"
> >=20
> > is the value used at build time. This is supposed to be relocated into
> > the SDK's install location at runtime.
> >=20
> > The question is therefore where is rust getting this value from? You
> > can specify it to the linker at compile time along the lines of:
> >=20
> > -Wl,--dynamic-linker=3D/path/to/ld-linux.so.2
> >=20
> > or it can be the default that comes from toolchain. It is important it
> > points at the one in the SDK, not on the host system.
> >=20
> > The bit I don't understand is whether:
> >=20
> > a) the compiler in the SDK is generating the wrong loader (in which
> > case buildtools-extended-tarball would break which it doesn't)
> > b) rust is hardcoding some dynamic-linker option somewhere it shouldn't
> > c) whether the toolchain is relocating paths correctly or some path
> > isn't relocating and is being used here.
> >=20
> > I'd suggest first checking that a binary generated by nativesdk-gcc in
> > the SDK has the right loader. If that is the case, see what compiler
> > options are being used to create the build tool and go from there.
> >=20
> > FWIW you can see/change the interpreter with patchelf.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> I've tried to narrow this down further and I can say now that this error=
=20
> when building the native rust build script is not directly related to=20
> cargo/rust but to the native gcc compiler shipped in the SDK. I will=20
> next try to dig down in the gcc build process but before spending time=
=20
> there I would like to share my finding and see if someone have ideas.
>=20
> I have two SDKs one with SDKMACHINE=3D"x86_64" and one with=20
> SDKMACHINE=3D"i686". I have the hosts gcc compiler installed in them and=
=20
> use them to compile a minimal c code example with hello world. The one=
=20
> for "x86_64" works well and is using the program interpreter from the=20
> SDK. The executable compiled and linked with "i686" toolchain will have=
=20
> a program interpreter pointing to=20
> "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld=
-linux.so.2".=20
> I will paste in output from the two experiments here below:
>=20
> x86_64:
>=20
> $=20
> <sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-=
gcc=20
> main.c
> $ ./a.out
> Hello world!
> $ readelf -a a.out | grep interpreter
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:=20
> <sdk-install>/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2]
> $=20
> <sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-=
gcc=20
> -dumpspecs | grep -A 1 *dynamic_linker
>=20
> i686:
>=20
> $=20
> <sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gcc=
=20
> main.c
> $ ./a.out
> -bash: ./a.out: No such file or directory
> $ readelf -a a.out | grep interpreter
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [Requesting program interpreter:=20
> /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-=
linux.so.2]=20
>=20
> $=20
> <sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gcc=
=20
> -dumpspecs | grep -A 1 *dynamic_linker
> *dynamic_linker:
> %{muclibc:%rld-uClibc.so.0;:%{mbionic:/system/bin/linker;:%{mmusl:/usr/lo=
cal/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-musl-i386=
.so.1;:/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/li=
b/ld-linux.so.2}}}=20
>=20
>=20
> Noted above is that the spec-file (-dumpspecs) for i686 have a sections=
=20
> with "*dynamic_linker" but that one is missing in x86_64.
>=20
> So my conclusion around the results above is that something seems=20
> missconfigured in the nativesdk-gcc build for i686. When cargo/rust is=
=20
> using the native compiler to build its build script it is set to use=20
> wrong program interpreter and when executed it fails just as my a.out=20
> above does. I hope this can give you some more ideas where to look next=
=20
> and ultimately how to solve this.
>=20

I couldn't remeber the details of how this worked and there has been a
lot going on so I only just got around to experimenting. This might be
really simple fix:

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recip=
es-devtools/gcc/gcc-multilib-config.inc
index 26bfed9507b..2dbbc23c940 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -154,7 +154,7 @@ python gcc_multilib_setup() {
     gcc_header_config_files =3D {
         'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'g=
cc/config/i386/linux64.h'],
         'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'g=
cc/config/i386/linux64.h'],
-        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'],
+        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'g=
cc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'g=
cc/config/mips/linux64.h'],
         'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'g=
cc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'=
],


which changes the linux.h header to have a %r instead of a
SYSTEMLIBS_DIR hardcoded definition. That will the relocate with the
toolchain.

I've not tested this yet but seems like the right thing to fix.

Cheers,

Richard



