Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.5988.1625577506414601425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 06:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=Y4P6qWED;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.52, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f52.google.com with SMTP id f5so9687795qvu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=PUE1vKWey98eDuYrQxC0vy5Fq3iOCeLRjQpHTl0QKt8=;
        b=Y4P6qWEDw3iB+bZa5rPBqBD72FkFyRoEzCvC4zwb9M/rWYp1uQDGzjG9rfFjgeC+5e
         VnegeCqtDDaE84s0W31RnSvqpjFUEMYLQpT+RKtbIQpEfxKZ6LN3OZYfAFR/moIU0EJI
         RYTmGRRG8H28cBkHQTAogbe06jF+C7Y/hq2zXTCkCNk4TmnCryjJxMBWGVlhP0wMTSl2
         nVhpFDj7ynE0EaK3wZxq06waYP8yecJWjyaejH5N5IFoi2bbnfpxf5mX/i3eyar9Jdnk
         DHjUwoViFpofhZhAhdtLgUKRMhCDeBen9gR054ddqL8KxAz3pTVLa2M46lMi2zF8O2wJ
         UI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=PUE1vKWey98eDuYrQxC0vy5Fq3iOCeLRjQpHTl0QKt8=;
        b=l7ltRejKVbGKMwpAs2WbkyZZsMXLvvJc2rsR7Av7vE2wewaKtGqaQjTSAEPwYdGviW
         ii8ePnR8MtZXYchpI6zZzF64nuqqO434ISsbe7YqKp0pgtz9Fqs1ebrPBj8z++hUWEmS
         nYq4GDl892YQsajmP5iilh2FpFHbHwe9Nn5QCeiWQrPtky7Gbm6/g6W8cynpKFwQ3LWn
         VVxw3X9ycFjhYSq1gz63MnQaVcDZJKgNHSTGVHXcXPQrnPNUG37wQ3NNhSgExjc7UDmb
         fbj8UauSbaKGNxLEGVGhE9fgPtTLZPdsOIWJ05lI8alxfPCyXZDsw5f94u1kWNlvRCQE
         Tb0A==
X-Gm-Message-State: AOAM533JCRLaHvNXd79/3IYNCTkKdeccoyZBQSaTAB8ONtuK82zvwsfW
	qqWDqdW9g8q4RAkFLFP2TDHnbU6gVyx9MF7i
X-Google-Smtp-Source: ABdhPJxo2jbGM9F8ROvgBGHxZIqgT09Lx2HAeMEDweeeYUsaoY2MpWTHW6Kq7O1F16/KevTN52s7NQ==
X-Received: by 2002:a0c:f78a:: with SMTP id s10mr17970926qvn.61.1625577505167;
        Tue, 06 Jul 2021 06:18:25 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id u22sm1030892qkp.85.2021.07.06.06.18.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:18:24 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f178.google.com with SMTP id a6so4904291qka.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 06:18:24 -0700 (PDT)
X-Received: by 2002:a37:5886:: with SMTP id m128mr19597190qkb.414.1625577504181;
 Tue, 06 Jul 2021 06:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se> <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com> <1c1b7296ea99691d5e7c90fee5f15f9d91e4ff1b.camel@linuxfoundation.org>
In-Reply-To: <1c1b7296ea99691d5e7c90fee5f15f9d91e4ff1b.camel@linuxfoundation.org>
Date: Tue, 6 Jul 2021 10:18:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqvPy_B+qC1RgFQvDwLhskaht3m_47ZpA2j9jZ47CsEeg@mail.gmail.com>
Message-ID: <CAP9ODKqvPy_B+qC1RgFQvDwLhskaht3m_47ZpA2j9jZ47CsEeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"peter@berginkonsult.se" <peter@berginkonsult.se>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>, "liu.ming50@gmail.com" <liu.ming50@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b1131405c6744113"

--000000000000b1131405c6744113
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 6 de jul. de 2021 =C3=A0s 10:04, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Tue, 2021-07-06 at 02:44 +0000, Mittal, Anuj wrote:
> > Hi Peter,
> >
> > On Sun, 2021-07-04 at 10:21 +0100, Richard Purdie wrote:
> > > On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:
> > > > On 2021-07-03 16:55, Mittal, Anuj wrote:
> > > > > On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
> > > > > > This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
> > > > > >
> > > > > > As there is no build dependency between libubootenv and the
> > > > > > configuration
> > > > > > of u-boot there is no reason to check for UBOOT_CONFIG or
> > > > > > UBOOT_MACHINE
> > > > > > by adding the class uboot-config. Revert this in order to
> > > > > > remove
> > > > > > useless
> > > > > > workaround in bsp layer (meta-freescale).
> > > > > This was added to address failures in world builds:
> > > > >
> > > > > https://lists.openembedded.org/g/openembedded-core/message/141757
> > > > >
> > > > > If this is not required, then I think we'd need to address those
> > > > > failures.
> > > >
> > > > Thanks for the pointer about the reason for this patch. I searched
> > > > a bit
> > > > but could not find it.
> > > >
> > > > Can you please help me define 'world builds'?
> > >
> > > "bitbake world"
> > >
> > > i.e. build everything
> > >
> > > > By reading the mail thread my thoughts are that the obvious thing
> > > > is
> > > > that the build has a bad configuration as u-boot is skipped. This
> > > > should
> > > > be the thing to solve.
> > >
> > > Not every MACHINE will support u-boot or have a configuration for it.
> >
> > Do you have a fix for this? This patch was applied and now the world
> > builds for MACHINEs not supporting u-boot are failing. Do you mind if I
> > send a revert of your patch?
>
> I agree with reverting it FWIW.
>

Is there a log somewhere?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000b1131405c6744113
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 6 de jul. de 2021 =C3=A0s 10=
:04, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Tue, 2021-07-06 at 02:44 +0000, =
Mittal, Anuj wrote:<br>
&gt; Hi Peter,<br>
&gt; <br>
&gt; On Sun, 2021-07-04 at 10:21 +0100, Richard Purdie wrote:<br>
&gt; &gt; On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:<br>
&gt; &gt; &gt; On 2021-07-03 16:55, Mittal, Anuj wrote:<br>
&gt; &gt; &gt; &gt; On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:<=
br>
&gt; &gt; &gt; &gt; &gt; This reverts commit 10aa1291979fb90bed1beb49be4d40=
6ed0e1e4d5.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; As there is no build dependency between libubooten=
v and the<br>
&gt; &gt; &gt; &gt; &gt; configuration<br>
&gt; &gt; &gt; &gt; &gt; of u-boot there is no reason to check for UBOOT_CO=
NFIG or<br>
&gt; &gt; &gt; &gt; &gt; UBOOT_MACHINE<br>
&gt; &gt; &gt; &gt; &gt; by adding the class uboot-config. Revert this in o=
rder to<br>
&gt; &gt; &gt; &gt; &gt; remove<br>
&gt; &gt; &gt; &gt; &gt; useless<br>
&gt; &gt; &gt; &gt; &gt; workaround in bsp layer (meta-freescale).<br>
&gt; &gt; &gt; &gt; This was added to address failures in world builds:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/message/141757" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/message/141757</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; If this is not required, then I think we&#39;d need to =
address those<br>
&gt; &gt; &gt; &gt; failures.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks for the pointer about the reason for this patch. I se=
arched<br>
&gt; &gt; &gt; a bit <br>
&gt; &gt; &gt; but could not find it.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Can you please help me define &#39;world builds&#39;?<br>
&gt; &gt; <br>
&gt; &gt; &quot;bitbake world&quot;<br>
&gt; &gt; <br>
&gt; &gt; i.e. build everything<br>
&gt; &gt; <br>
&gt; &gt; &gt; By reading the mail thread my thoughts are that the obvious =
thing<br>
&gt; &gt; &gt; is <br>
&gt; &gt; &gt; that the build has a bad configuration as u-boot is skipped.=
 This<br>
&gt; &gt; &gt; should <br>
&gt; &gt; &gt; be the thing to solve.<br>
&gt; &gt; <br>
&gt; &gt; Not every MACHINE will support u-boot or have a configuration for=
 it.<br>
&gt; <br>
&gt; Do you have a fix for this? This patch was applied and now the world<b=
r>
&gt; builds for MACHINEs not supporting u-boot are failing. Do you mind if =
I<br>
&gt; send a revert of your patch?<br>
<br>
I agree with reverting it FWIW.<br></blockquote><div><br></div><div>Is ther=
e a log somewhere?</div><div> <br></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br=
><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossys=
tems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems=
.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 =
(53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-975=
0</div></div>

--000000000000b1131405c6744113--
