Return-Path: <sathishkumar.d.cbe@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A5AC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:05:52 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.70.1746633944665499746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 09:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tmvc/TsH;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: sathishkumar.d.cbe@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff4faf858cso48912667b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633944; x=1747238744; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yfIEoVwgfK1ULtYiS+pymv/sF9PI/fW7f1LHwPhMvMo=;
        b=Tmvc/TsH+gYZPDBAw1exrvoGb+eexjO8CSBkG5VyUEwhMOwcxy0QFqQaADdy0waxjO
         bqIiVAYqbrnSyqwrSgV1GA4vKnyFxfuZgHBrh4AU/OX3C5OWjp9EIcqJ11qvYtBe4/lp
         epEEWgK8ygDDWuP6pAIyJGTBXms5ocpLVctKEuCBFujhPZdU7QeWl6edbXX3LhdHpQeR
         e9D9qw1A20+n3BQKwz1eNf7oBw8wLhyQKJFryk6CDSgn1D80ozalnhP/eWxLB5J1iWaS
         hqNfuEVLcB1CKfv+YnYnnDDrvZafvF4qznMjT4nl7xV3MO3UZxrMjDmpXq7B5nIwUxsD
         BnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633944; x=1747238744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfIEoVwgfK1ULtYiS+pymv/sF9PI/fW7f1LHwPhMvMo=;
        b=F7LKOffWhcFTgiaElOtT/vqx9BLd7MQu7LMR9qbEb3Vz+3ovRcpDW3DG/zQmeNDiiN
         brpid0FTW05Yi9ZUh5L4TYkWatdrobvm6bZDv0KVnxNHimgaSvA0pEW7GX1/bWOkIAoD
         K6SKQkE4BlvEOPjKqMqYgEDM+/lJFQ+D6NsXGXzN08hYFgkmPR0m6YeqUjJXjESpwFDk
         yO6h8JPkU5Oy5Q5ZAd9nJKaWJqn8d/cfttAqCbvdXyuc+usGGrTM7xknsa+DGmE4L0/8
         XvQPKjN4z87NBmdpK0+vc7nltHIcDBylp2tEgfou97e6yveYIzBZQihROKaSVHwVkNuO
         rTFw==
X-Forwarded-Encrypted: i=1; AJvYcCVjtvNKO32UBCTNdryc6qrIDVrkLpxHVQIFWMOeZq/3XQnMcTfIsj36xe72y+4gGf8Wm1BVF9u6vn1RA9muHkpJaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzP+Ob/GcZx1gOm3AknAVu+AwaHuuL1wvBJRx+C1zwDA7SOVWZw
	ZxRuo3u3RfzCwxOMl4I/VcWCR4HF9ucVTlTyyZPsZCDWgVOum18lkytSnwwoF9Fi8Ahoeq0nghs
	eKOjPE+1ZVDWBRcoVoVKqOKfEWKw=
X-Gm-Gg: ASbGncutWxNQJbRziy6eAxZeb3HfWL/R7rrvvLnhEU3gxPOKd1smCvh8JAYMOPM8uHJ
	blGd5xUOg/nCVoppBbr3Ns7dsjnDwLoaDuWuNLjOK+8PQ4VyFnLwiC0qOsHe47b5lII8ifjz5yd
	01+60rqpq28u/M3j7CQBrA/w==
X-Google-Smtp-Source: AGHT+IGZIRGuT921kT5KXlS3U8/KEKOmuVAyzRZiXiEQjKVNwL7nbeQs6b42AZ8UHFNY9uHnT94XHeRX4wX1wt7aiKU=
X-Received: by 2002:a05:690c:680e:b0:702:627d:c86 with SMTP id
 00721157ae682-70a1d9e11aemr49933107b3.5.1746633943574; Wed, 07 May 2025
 09:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska> <CAMKF1sq428j=kixWnhKVnY3SgQXv2C4Lue7s5=3XhP66uCwxvg@mail.gmail.com>
In-Reply-To: <CAMKF1sq428j=kixWnhKVnY3SgQXv2C4Lue7s5=3XhP66uCwxvg@mail.gmail.com>
From: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Date: Wed, 7 May 2025 21:35:32 +0530
X-Gm-Features: ATxdqUFY937NeO4dhcmicwJdDP3SvKc0E3gEJkVv01d64bHYSbSq4AnpXpqxXTY
Message-ID: <CAHebdzRXP-GAF7tgyDo4K92z3T35zXV0-+qt1ouXSxWBKKPZpA@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Khem Raj <raj.khem@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c274d706348de749"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 16:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216120

--000000000000c274d706348de749
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 8:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 7, 2025 at 7:22=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org>
> wrote:
> >
> > Hi,
> >
> > On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > > On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via
> lists.openembedded.org wrote:
> > > > On Tue, May 6, 2025 at 11:04=E2=80=AFPM Sathishkumar Duraisamy
> > > > <sathishkumar.d.cbe@gmail.com> wrote:
> > > > >
> > > > > On Wed, May 7, 2025 at 4:29=E2=80=AFAM Khem Raj <raj.khem@gmail.c=
om>
> wrote:
> > > > >>
> > > > >> On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy
> > > > >> <sathishkumar.d.cbe@gmail.com> wrote:
> > > > >> >
> > > > >> > Hi
> > > > >> >
> > > > >> > On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmai=
l.com>
> wrote:
> > > > >> >>
> > > > >> >> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
> > > > >> >> lists.openembedded.org
> > > > >> >> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote=
:
> > > > >> >> >
> > > > >> >> > Hi all,
> > > > >> >> >
> > > > >> >> > I am also facing the same build issue. I tried to understan=
d
> the issue. From build system for both openssl and systemd,
> -mbranch-protection=3Dstandard   enabled. In fact the support this flag a=
dded
> long back,
> https://github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce8=
09cc5ecd9672f5e86bf8a579
> and tpm2 introduces additional dependencies for systemd as in commit
> https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/s=
ystemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f
> .
> > > > >> >> >
> > > > >> >>
> > > > >> >> is this flag passed to linker as well ?
> > > > >> >>
> > > > >> > Openssl:
> > > > >> > =3D=3D=3D=3D=3D=3D=3D
> > > > >> >
> > > > >> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/openssl/3.5.0/recipe-sysroot"
> > > > >> >
> > > > >> > export CFLAGS=3D" -O2 -g
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3=
.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
> -pipe -Wl,-z,gcs-compliant=3Dall "
> > > > >> >
> > > > >> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3=
.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now"
> > > > >> >
> > > > >> > systemd
> > > > >> > =3D=3D=3D=3D=3D=3D
> > > > >> >
> > > > >> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > > > >> >
> > > > >> > export CFLAGS=3D" -O2 -g
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
> -pipe
> --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv=
8a-tdx-linux/systemd/257.5/recipe-sysroot"
> > > > >> >
> > > > >> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D
> -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/w=
ork/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D
> -Wl,-z,relro,-z,now"
> > > > >> >
> > > > >> >
> > > > >>
> > > > >> Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS =
not
> > > > >> CFLAGS or to openssl flags.
> > > > >
> > > > >
> > > > > Shortly I will build with LDFLAGS and will post the update here.
> > > > >
> > > >
> > > > also try adding try with -Wl,-z,gcs-report-dynamic=3Dnone to LDFLAG=
S in
> > > > systemd and see if that helps
> > >
> > > This did not seem to work. Unknown linker flag and build failure.
> >
> > Trevor replied on #yocto irc that this worked so I was wrong. I must
> have mixed up
> > testing "-Wl,-z,gcs-report-dynamic=3Dnone" which works and
> "-Wl,-z,gcs-compliant=3Dall"
> > which fails in systemd build with:
> >
> > | ../git/meson.build:3:0: ERROR: Compiler aarch64-poky-linux-gcc
> -march=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-str=
ong
> -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> --sysroot=3D/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8=
a-poky-linux/systemd/257.5/recipe-sysroot
> cannot compile programs.
> >
> > and
> >
> > $ grep error:
> /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux=
/systemd/257.5/build/meson-logs/meson-log.txt
> >
> /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-linux=
/systemd/257.5/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libex=
ec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld:
> error: unrecognized value '-z gcs-compliant=3Dall'
> >
> > So this in meta-security/meta-tpm systemd bbappend works:
> >
> > LDFLAGS:append:aarch64 =3D " -Wl,-z,gcs-report-dynamic=3Dnone"
> >
>
Build is successful with this change.


> > I can send this out in v2. No need to patch meson.build then.
>
> Exactly, please send v2
>
> >
> > Cheers,
> >
> > -Mikko
>

--000000000000c274d706348de749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 7, =
2025 at 8:06=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, May 7, 2025 at 7:22=E2=80=AFAM Mikko Rapeli &lt;<=
a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@li=
naro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> wrote:<br>
&gt; &gt; On Tue, May 06, 2025 at 11:14:02PM -0700, Khem Raj via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; &gt; &gt; On Tue, May 6, 2025 at 11:04=E2=80=AFPM Sathishkumar Duraisa=
my<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:sathishkumar.d.cbe@gmail.com" target=
=3D"_blank">sathishkumar.d.cbe@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, May 7, 2025 at 4:29=E2=80=AFAM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar=
 Duraisamy<br>
&gt; &gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:sathishkumar.d.cbe@gmail.com"=
 target=3D"_blank">sathishkumar.d.cbe@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Hi<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sat=
hishkumar D via<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &lt;sathishkumar.d.cbe=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openem=
bedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &gt; Hi all,<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &gt; I am also facing the same build issue=
. I tried to understand the issue. From build system for both openssl and s=
ystemd, -mbranch-protection=3Dstandard=C2=A0 =C2=A0enabled. In fact the sup=
port this flag added long back, <a href=3D"https://github.com/openembedded/=
openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openembedded/openembedded-c=
ore/commit/8905639d1cdc5ce809cc5ecd9672f5e86bf8a579</a> and tpm2 introduces=
 additional dependencies for systemd as in commit <a href=3D"https://git.yo=
ctoproject.org/meta-security/commit/meta-tpm/recipes-core/systemd/systemd_%=
25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f" rel=3D"noreferre=
r" target=3D"_blank">https://git.yoctoproject.org/meta-security/commit/meta=
-tpm/recipes-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc81=
1f714c2aa4ecfcf8f</a>.<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; is this flag passed to linker as well ?<br=
>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Openssl:<br>
&gt; &gt; &gt; &gt;&gt; &gt; =3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export CC=3D&quot;aarch64-tdx-linux-gcc=C2=A0 =
-march=3Darmv8-a+crypto -mbranch-protection=3Dstandard -fstack-protector-st=
rong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export CFLAGS=3D&quot; -O2 -g=C2=A0 -ffile-pre=
fix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-t=
dx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3.5.0=C2=A0 -=
ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work=
/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0=C2=A0 =
-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wor=
k/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D=C2=A0 -ffile-prefix-map=
=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linu=
x/openssl/3.5.0/recipe-sysroot-native=3D=C2=A0 -pipe -Wl,-z,gcs-compliant=
=3Dall &quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctos=
pace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.=
0=3D/usr/src/debug/openssl/3.5.0=C2=A0 -ffile-prefix-map=3D/home/sathishkum=
ar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/bui=
ld=3D/usr/src/debug/openssl/3.5.0=C2=A0 -ffile-prefix-map=3D/home/sathishku=
mar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/re=
cipe-sysroot=3D=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/ver=
din-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-nativ=
e=3D=C2=A0 -Wl,-z,relro,-z,now&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; systemd<br>
&gt; &gt; &gt; &gt;&gt; &gt; =3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export CC=3D&quot;aarch64-tdx-linux-gcc=C2=A0 =
-march=3Darmv8-a+crypto -mbranch-protection=3Dstandard -fstack-protector-st=
rong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security --sysroot=3D/home/sathishkumar/yoctospace/verdin-next/build/=
tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export CFLAGS=3D&quot; -O2 -g=C2=A0 -ffile-pre=
fix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-t=
dx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5=C2=A0 -ffile-pref=
ix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-td=
x-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5=C2=A0 -ffile-pre=
fix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-t=
dx-linux/systemd/257.5/recipe-sysroot=3D=C2=A0 -ffile-prefix-map=3D/home/sa=
thishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/2=
57.5/recipe-sysroot-native=3D=C2=A0 -pipe --sysroot=3D/home/sathishkumar/yo=
ctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-s=
ysroot&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; export LDFLAGS=3D&quot;-Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctos=
pace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/s=
rc/debug/systemd/257.5=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctosp=
ace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/=
src/debug/systemd/257.5=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctos=
pace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysro=
ot=3D=C2=A0 -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/b=
uild/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D=C2=A0=
 -Wl,-z,relro,-z,now&quot;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Please try adding -Wl,-z,gcs-compliant=3Dall to sys=
temd LDFLAGS not<br>
&gt; &gt; &gt; &gt;&gt; CFLAGS or to openssl flags.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Shortly I will build with LDFLAGS and will post the upd=
ate here.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; also try adding try with -Wl,-z,gcs-report-dynamic=3Dnone to=
 LDFLAGS in<br>
&gt; &gt; &gt; systemd and see if that helps<br>
&gt; &gt;<br>
&gt; &gt; This did not seem to work. Unknown linker flag and build failure.=
<br>
&gt;<br>
&gt; Trevor replied on #yocto irc that this worked so I was wrong. I must h=
ave mixed up<br>
&gt; testing &quot;-Wl,-z,gcs-report-dynamic=3Dnone&quot; which works and &=
quot;-Wl,-z,gcs-compliant=3Dall&quot;<br>
&gt; which fails in systemd build with:<br>
&gt;<br>
&gt; | ../git/meson.build:3:0: ERROR: Compiler aarch64-poky-linux-gcc -marc=
h=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-strong -O2=
 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security=
 --sysroot=3D/home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a=
-poky-linux/systemd/257.5/recipe-sysroot cannot compile programs.<br>
&gt;<br>
&gt; and<br>
&gt;<br>
&gt; $ grep error: /home/builder/src/base/repo/build/tmp_genericarm64/work/=
armv8a-poky-linux/systemd/257.5/build/meson-logs/meson-log.txt<br>
&gt; /home/builder/src/base/repo/build/tmp_genericarm64/work/armv8a-poky-li=
nux/systemd/257.5/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../li=
bexec/aarch64-poky-linux/gcc/aarch64-poky-linux/15.1.0/ld: error: unrecogni=
zed value &#39;-z gcs-compliant=3Dall&#39;<br>
&gt;<br>
&gt; So this in meta-security/meta-tpm systemd bbappend works:<br>
&gt;<br>
&gt; LDFLAGS:append:aarch64 =3D &quot; -Wl,-z,gcs-report-dynamic=3Dnone&quo=
t;<br>
&gt;<br></blockquote><div>Build is successful with this change.=C2=A0</div>=
<div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I can send this out in v2. No need to patch meson.build then.<br>
<br>
Exactly, please send v2<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -Mikko<br>
</blockquote></div></div>

--000000000000c274d706348de749--

