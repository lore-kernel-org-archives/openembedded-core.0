Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE042C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 13:48:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.32802.1659016088702176024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eQSspeT/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso1073710wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=3KG/qlIWodyFWiDapTAl4787G9c7VfhqkN7JMfFGphs=;
        b=eQSspeT/9C7FIyPsOgf1G9wn7guY5/lE4RhAEs+bIfI0zNpL8U6Qwt9kU7xzKSJWuX
         BEdnsY5rhF8zNzQM/0CtRQgjq9aTSBmf7Ji6r5Y/EcStCbolvYfjQnUiRQrSpjbQ0rxB
         3C+3iL/lqi4cSyRvDQmrpwXPQT3+/AWNFFvzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=3KG/qlIWodyFWiDapTAl4787G9c7VfhqkN7JMfFGphs=;
        b=CElaGJMbsi6NKojepA3iSmFC1w78RlklSRH6s4os44LArv+BX8J+Hkt1xoCv+mXYyw
         TNy/U+AoR9Td9rMtfoMUIUKs06f4zhmrgXXyiDVHUauv149+VZ1Pzrg06YRqXYJCa+h2
         vL1uIZTb2av6tknHuYoS2FddTCVZDxjW7tNV3k09tNzF+apPssHPqyfhQl5+TwF8LML8
         wwnWxUTlYAlL3WY/LY/FWTIMVEmu+TxnV/zG7tuSq3naMJ/AricPa3HF7ofQeyP1z6MG
         C9OCQ1E4BwchWQfepfpH8W0RAIrnYNBRs6eNlWEzEa52OgFyPNwB65+p5pvTiKY8Hm7T
         8pYQ==
X-Gm-Message-State: AJIora+QZcZe7l+YalR4EBk2k8X3X0mgfY7ytcH4bJFSsqieYTDhUs3K
	K9iCbeqkng5VN54ExysviQLwdQ==
X-Google-Smtp-Source: 
 AGRyM1tvMT55tZ1A9VBtIGAzSzEg9HGVlN2yTTbSvRW+FHLM+l0Q2QlZDIZEQoUpWI/wsh3fuYGBZQ==
X-Received: by 2002:a1c:2944:0:b0:3a2:fece:29de with SMTP id
 p65-20020a1c2944000000b003a2fece29demr6659364wmp.115.1659016086876;
        Thu, 28 Jul 2022 06:48:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2998:9d35:c8ea:b463?
 ([2001:8b0:aba:5f3c:2998:9d35:c8ea:b463])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003a37d8b864esm1221520wmr.30.2022.07.28.06.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 06:48:06 -0700 (PDT)
Message-ID: 
 <49ef8005a59c2c0d90e234bb896b9b77697bf0d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2]] recipes-support: rng-tools change systemd
 service name
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal =?ISO-8859-1?Q?Lim=F3n?= <limon.anibal@gmail.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, OpenEmbedded Core Mailing
 List <openembedded-core@lists.openembedded.org>,
 otavio.salvador@ossystems.com.br
Date: Thu, 28 Jul 2022 14:48:05 +0100
In-Reply-To: 
 <CAPS-YPDMK55oLPgYPFSRwh8jH9+scB8stz50m3vu=N=j4WyLqQ@mail.gmail.com>
References: <20220726193322.1569574-1-limon.anibal@gmail.com>
	 <20220727124406.4f7bc8ec@booty>
	 <CAPS-YPA4qwJu_3dJ+5X+HEzE1ZGzT6H4Y2urbCKzT14ZPOOiKg@mail.gmail.com>
	 <593d8723-658b-181f-084b-0f310d83c519@gmail.com>
	 <CAPS-YPDMK55oLPgYPFSRwh8jH9+scB8stz50m3vu=N=j4WyLqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 13:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168606

On Thu, 2022-07-28 at 08:34 -0500, Anibal Lim=C3=B3n wrote:
>=20
>=20
> On Wed, Jul 27, 2022 at 11:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >=20
> >=20
> > On 7/27/22 10:51 AM, An?bal Lim?n wrote:
> > >=20
> > >=20
> > > On Wed, Jul 27, 2022 at 5:44 AM Luca Ceresoli
> > > <luca.ceresoli@bootlin.com=20
> > > <mailto:luca.ceresoli@bootlin.com>> wrote:
> > >=20
> > > =C2=A0 =C2=A0 =C2=A0Hello An=C3=ADbal,
> > >=20
> > > =C2=A0 =C2=A0 =C2=A0On Tue, 26 Jul 2022 14:33:22 -0500
> > > =C2=A0 =C2=A0 =C2=A0"An?bal Lim?n" <limon.anibal@gmail.com
> > > =C2=A0 =C2=A0 =C2=A0<mailto:limon.anibal@gmail.com>> wrote:
> > >=20
> > > =C2=A0 =C2=A0 =C2=A0 > From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gma=
il.com
> > > =C2=A0 =C2=A0 =C2=A0<mailto:limon.anibal@gmail.com>>
> > > =C2=A0 =C2=A0 =C2=A0 >
> > > =C2=A0 =C2=A0 =C2=A0 > Change systemd service name from rngd -> rng-t=
ools to
> > > avoid load
> > > =C2=A0 =C2=A0 =C2=A0twice
> > > =C2=A0 =C2=A0 =C2=A0 > the service when sysvinit compatibility is ena=
bled,
> > > =C2=A0 =C2=A0 =C2=A0 >
> > > =C2=A0 =C2=A0 =C2=A0 > ...
> > > =C2=A0 =C2=A0 =C2=A0 > root@:~# ps=C2=A0 | grep rng
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 23 root=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00 SW=C2=A0 =C2=A0[hwrng]
> > > =C2=A0 =C2=A0 =C2=A0 > 13109 root=C2=A0 =C2=A0 =C2=A0 3528 R=C2=A0 =
=C2=A0 /usr/sbin/rngd -f -r /dev/hwrng
> > > =C2=A0 =C2=A0 =C2=A0 > 13117 root=C2=A0 =C2=A0 =C2=A0 2348 S=C2=A0 =
=C2=A0 grep rng
> > > =C2=A0 =C2=A0 =C2=A0 > 29418 root=C2=A0 =C2=A0 =C2=A012756 S=C2=A0 =
=C2=A0 /usr/sbin/rngd -r /dev/hwrng
> > > =C2=A0 =C2=A0 =C2=A0 > ...
> > > =C2=A0 =C2=A0 =C2=A0 >
> > > =C2=A0 =C2=A0 =C2=A0 > Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.a=
nibal@gmail.com
> > > =C2=A0 =C2=A0 =C2=A0<mailto:limon.anibal@gmail.com>>
> > > =C2=A0 =C2=A0 =C2=A0 > ---
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 .../rng-tools/{rngd.service =3D> rng-too=
ls.service}=C2=A0 =C2=A0 |=C2=A0
> > > 0
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 meta/recipes-support/rng-tools/rng-tools=
_6.15.bb
> > > =C2=A0 =C2=A0 =C2=A0<http://rng-tools_6.15.bb>=C2=A0 =C2=A0 =C2=A0| 1=
2 ++++++------
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 2 files changed, 6 insertions(+), 6 dele=
tions(-)
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 rename meta/recipes-support/rng-tools/rn=
g-
> > > tools/{rngd.service =3D>
> > > =C2=A0 =C2=A0 =C2=A0rng-tools.service} (100%)
> > > =C2=A0 =C2=A0 =C2=A0 >
> > > =C2=A0 =C2=A0 =C2=A0 > diff --git
> > > =C2=A0 =C2=A0 =C2=A0a/meta/recipes-support/rng-tools/rng-tools/rngd.s=
ervice
> > > =C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/rng-tools/rng-tools/rng-to=
ols.service
> > > =C2=A0 =C2=A0 =C2=A0 > similarity index 100%
> > > =C2=A0 =C2=A0 =C2=A0 > rename from meta/recipes-support/rng-tools/rng=
-
> > > tools/rngd.service
> > > =C2=A0 =C2=A0 =C2=A0 > rename to meta/recipes-support/rng-tools/rng-t=
ools/rng-
> > > tools.service
> > > =C2=A0 =C2=A0 =C2=A0 > diff --git a/meta/recipes-support/rng-tools/rn=
g-
> > > tools_6.15.bb
> > > =C2=A0 =C2=A0 =C2=A0<http://rng-tools_6.15.bb>
> > > =C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/rng-tools/rng-tools_6.15.b=
b
> > > =C2=A0 =C2=A0 =C2=A0<http://rng-tools_6.15.bb>
> > > =C2=A0 =C2=A0 =C2=A0 > index 0696351903..efc08b5e0a 100644
> > > =C2=A0 =C2=A0 =C2=A0 > --- a/meta/recipes-support/rng-tools/rng-tools=
_6.15.bb
> > > =C2=A0 =C2=A0 =C2=A0<http://rng-tools_6.15.bb>
> > > =C2=A0 =C2=A0 =C2=A0 > +++ b/meta/recipes-support/rng-tools/rng-tools=
_6.15.bb
> > > =C2=A0 =C2=A0 =C2=A0<http://rng-tools_6.15.bb>
> > > =C2=A0 =C2=A0 =C2=A0 > @@ -11,7 +11,7 @@ DEPENDS =3D "sysfsutils open=
ssl"
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 SRC_URI =3D
> > > =C2=A0 =C2=A0 =C2=A0"git://github.com/nhorman/rng-
> > > tools.git;branch=3Dmaster;protocol=3Dhttps
> > > =C2=A0 =C2=A0
> > > =C2=A0<http://github.com/nhorman/rng-tools.git;branch=3Dmaster;protoc=
ol=3D
> > > https> \
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://init \
> > > =C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://default \
> > > =C2=A0 =C2=A0 =C2=A0 > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://rngd.service \
> > > =C2=A0 =C2=A0 =C2=A0 > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://rng-tools.service \
> > >=20
> > > =C2=A0 =C2=A0 =C2=A0This feels strange to me: "rng-tools" does not lo=
ok like a
> > > daemon name,
> > > =C2=A0 =C2=A0 =C2=A0but rather a, well, tools name. Maybe "rng-daemon=
" would
> > > clarify?
> > >=20
> > >=20
> > > Another option is to change the init daemon to be called rngd.
> >=20
> > I think yet another way is to check for condition when sysvinit=20
> > compatibility is enabled during install time and decide if we need
> > to=20
> > install both sysvinit script and systemd service or not. I do not
> > think
> > renaming .service file is a good solution here.
> >=20
>=20
>=20
> I have that solution on the first version of this patch,
>=20
> https://lists.openembedded.org/g/openembedded-core/message/167841?p=3D%2C=
%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Crng-tools%2C20%2C2%2C0%2C92278770

I took the v2 as I think it is the less invasive solution.

Cheers,

Richard

