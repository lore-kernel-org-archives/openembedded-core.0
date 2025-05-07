Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ED2C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 14:36:11 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.34.1746628563750249631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 07:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAZ+gLkT;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-401e77e5443so4175656b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628563; x=1747233363; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3dVpktsnYY9c6muSXCr2QaqMWqraYsbqV42YVlEq7s=;
        b=dAZ+gLkTYLpZgynCpw1Iy3Pm4kBJxIXYPZ30IWmx0wC7V3+Wc49fWVqc7oSpEolgMT
         ALqHWa4xvlrKad8lhq+b/JxkNoEhvaQ2mJXKAsjphHU+Fl2NLbb5b/HcfZIITjVyK/Qu
         Kg3cMmAZ7aEjk7mKL0PowCE3abqSXlfpHQmGzximeVEZnHS+YG8dv8ReskefmLwZbuFn
         45s1Alo9IemlADTDS68yimf3zhT7QzsAgCCffOZq/do4V9A7lZ1soc/3nnvguCdP+YVw
         6z3NB4fC2FE77Gbf5tnx+iInSuPLvpjqPsBRf+FVuMU3NuHfvsirqm/YEvi2Vf7uPa6H
         lYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628563; x=1747233363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3dVpktsnYY9c6muSXCr2QaqMWqraYsbqV42YVlEq7s=;
        b=bYw3gvpgNZ4UTrX96kwDI01z0W8s9f2CMwXHqvaH8QWzVQjp9J3QFt95BU8Pw8bbDY
         dBVMmMhlTpapcD2S0eo2GcYqgSgIbUXYRjON7cBoruC5GyQtG1YgL9an/Lu9av7nJ78r
         bS638YXW+DH3uJ6wqVupkh6qFrhkcf7lsy7xj8BdoUOYSvR+EGZSRK+sR6zDjosoYgMg
         TLT1ZbVpGHDREa61hi18iXEso/WHRO2yO5cYrZnkvojFjkLA+VS41jOXN4klPw4Ywbub
         aEprgl5uZ4L0wJLfcrMg8Sj/PBX2F94oHqAYsBTpLApdsPr+7ShxGIWKcCAK1qqCRsHT
         KaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTcMf/E5RGkaTmM2+ezO9iaPM7CZNIhA+9gdvCgAGLYQUTWnowu1gAtStOQmvdLO37J3mXAH2Q6zM5MyY1lD18KQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxoXTceyaUzBWUi3uKDzcxVPr0LWtaI7R/LgmtvTfpQH3xepMMH
	9Mv0/mSzRSmRaMv+BSBfWJz/YrDteBcpDB8nWG2AS39arSDUGKfXAvs6MUO0YXpEXW1iu5yfBl5
	xuChe49Eshh2v7jsJgJvcjBXgZfuaMcqE
X-Gm-Gg: ASbGncu0g1wJWD/sFQXl4tCJezdGhfbTszBTNF/JUkaKYTvODf4t3KpBqp6aM1pd2r0
	JBzXiDSeqVkj2BVzSArPIBa9EakTPogRBIDtHKjZKdHVoiJ7QWrzY40pNQuxjLHu2e89r86uBvi
	4eCX95zqNzsASX1lSzogTc
X-Google-Smtp-Source: AGHT+IFw+FyjBiTljNHcJj/QlJANxgBMwpWLbg3WYD0QV9p21I9ahXGkrjKMAxdvdfi8JQaS3DvMRI1KGMwzyCwA+sQ=
X-Received: by 2002:a05:6808:238d:b0:401:e949:6374 with SMTP id
 5614622812f47-4036f0804b4mr1885940b6e.16.1746628552515; Wed, 07 May 2025
 07:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska>
In-Reply-To: <aBtspIFmf7KoIZ_7@nuoska>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 May 2025 07:35:26 -0700
X-Gm-Features: ATxdqUHmV_wtwjda34Qv7cJlpafwSunO0KSzolJhGxQhwI5XbhiwCXoqm-dNKUg
Message-ID: <CAMKF1sq428j=kixWnhKVnY3SgQXv2C4Lue7s5=3XhP66uCwxvg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Trevor Woerner <twoerner@gmail.com>, 
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 14:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216114

On Wed, May 7, 2025 at 7:22=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> Hi,
>
> On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via lists.openembedd=
ed.org wrote:
> > > On Tue, May 6, 2025 at 11:04=E2=80=AFPM Sathishkumar Duraisamy
> > > <sathishkumar.d.cbe@gmail.com> wrote:
> > > >
> > > > On Wed, May 7, 2025 at 4:29=E2=80=AFAM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > >>
> > > >> On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy
> > > >> <sathishkumar.d.cbe@gmail.com> wrote:
> > > >> >
> > > >> > Hi
> > > >> >
> > > >> > On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.=
com> wrote:
> > > >> >>
> > > >> >> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
> > > >> >> lists.openembedded.org
> > > >> >> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
> > > >> >> >
> > > >> >> > Hi all,
> > > >> >> >
> > > >> >> > I am also facing the same build issue. I tried to understand =
the issue. From build system for both openssl and systemd, -mbranch-protect=
ion=3Dstandard   enabled. In fact the support this flag added long back, ht=
tps://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc=
5ecd9672f5e86bf8a579 and tpm2 introduces additional dependencies for system=
d as in commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/r=
ecipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c=
2aa4ecfcf8f.
> > > >> >> >
> > > >> >>
> > > >> >> is this flag passed to linker as well ?
> > > >> >>
> > > >> > Openssl:
> > > >> > =3D=3D=3D=3D=3D=3D=3D
> > > >> >
> > > >> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbr=
anch-protection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home=
/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openss=
l/3.5.0/recipe-sysroot"
> > > >> >
> > > >> > export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar=
/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/opens=
sl-3.5.0=3D/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishk=
umar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/b=
uild=3D/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishkumar=
/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recip=
e-sysroot=3D  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next=
/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D  -p=
ipe -Wl,-z,gcs-compliant=3Dall "
> > > >> >
> > > >> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed=
  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3=
.5.0  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/t=
mp/work/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0=
  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D  -ffile-prefix-map=3D/=
home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/op=
enssl/3.5.0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now"
> > > >> >
> > > >> > systemd
> > > >> > =3D=3D=3D=3D=3D=3D
> > > >> >
> > > >> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbr=
anch-protection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=
=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home=
/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/system=
d/257.5/recipe-sysroot"
> > > >> >
> > > >> > export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar=
/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=
=3D/usr/src/debug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoc=
tospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/=
usr/src/debug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoctosp=
ace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroo=
t=3D  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/t=
mp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D  -pipe --sy=
sroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx=
-linux/systemd/257.5/recipe-sysroot"
> > > >> >
> > > >> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed=
  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5  -ffi=
le-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/ar=
mv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5  -ffile-p=
refix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a=
-tdx-linux/systemd/257.5/recipe-sysroot=3D  -ffile-prefix-map=3D/home/sathi=
shkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.=
5/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now"
> > > >> >
> > > >> >
> > > >>
> > > >> Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS no=
t
> > > >> CFLAGS or to openssl flags.
> > > >
> > > >
> > > > Shortly I will build with LDFLAGS and will post the update here.
> > > >
> > >
> > > also try adding try with -Wl,-z,gcs-report-dynamic=3Dnone to LDFLAGS =
in
> > > systemd and see if that helps
> >
> > This did not seem to work. Unknown linker flag and build failure.
>
> Trevor replied on #yocto irc that this worked so I was wrong. I must have=
 mixed up
> testing "-Wl,-z,gcs-report-dynamic=3Dnone" which works and "-Wl,-z,gcs-co=
mpliant=3Dall"
> which fails in systemd build with:
>
> | ../git/meson.build:3:0: ERROR: Compiler aarch64-poky-linux-gcc -march=
=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-strong -O2 =
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security =
--sysroot=3D/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-=
poky-linux/systemd/257.5/recipe-sysroot cannot compile programs.
>
> and
>
> $ grep error: /home/builder/src/base/repo/build/tmp_genericarm64/work/arm=
v8a-poky-linux/systemd/257.5/build/meson-logs/meson-log.txt
> /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux=
/systemd/257.5/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libex=
ec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld: error: unrecognized=
 value '-z gcs-compliant=3Dall'
>
> So this in meta-security/meta-tpm systemd bbappend works:
>
> LDFLAGS:append:aarch64 =3D " -Wl,-z,gcs-report-dynamic=3Dnone"
>
> I can send this out in v2. No need to patch meson.build then.

Exactly, please send v2

>
> Cheers,
>
> -Mikko

