Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C24C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:42:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.10491.1637170970567379515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=frtAhEOD;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id r11so14621578edd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=1x7heyvZuosXDxESdWuf/x5IITwRBsCzAGJ8pCFmYWU=;
        b=frtAhEODuKxTEFzM/Bf6jXZkZ1HB48H9g/1F7ZjhDH5dX3NfxBiwHiwdA53BhJ+adX
         WJBziPpjh6ua9KO2vVCZGeMsXGfGJPU1d07Yr2B6cS3yP0nd9t3QMpoI6FIaTdTXLR1b
         mRFI9pswxkMCJQJH7Px7pVtyRpTyzWd5gRpWb9K8CMo/ae3/Ik3KUl3CpUdNc7HTFuka
         GFpgc4YetszrvKxk51AfcLNzRGN2+SWLQhfMiAzBCTiDobgKQknMT3bm6ShQegOYMrWT
         ud9mMPTbctpnG7cQ13XMBJ2+mcSDDBpl5ixrNeBRy2f9Hs8KXP0f2Ijnx8lPJNHsD9B7
         jmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=1x7heyvZuosXDxESdWuf/x5IITwRBsCzAGJ8pCFmYWU=;
        b=TuRZzFwcINLo+ykNaQz1RRS+iZkq8EOgEIaHcpnPr2cNJ5CfxX5WRyT1rse4nMuUyb
         1Y/cpjwDDM57+FCZx58CIxx3PaaG5tTwFRio1oD8z6r76Uf8NHhKcCouqUt01fdcsDBm
         p3x9YqzbHLdk49OFuB/nUxdDPyuUw5CbnceDaoeB4maW/UR10GWNpK3appPXOWdP3PzZ
         eT7qihuFiPdAqnbJ2MEBCUAWbrsQQGGibT4xOHyGWWIvlkgBxr2Psx4pz0ar7u8C6+zc
         L27JbbamnwmPFmKdCkURPIHXh/d34/hh3zzAZQZfUmOBJpPh/ac+tnhgn99jldzn3Yty
         uUlw==
X-Gm-Message-State: AOAM533kYBlxmUy2TeCcLMV4PetvLbz7oVQRhFJM8uGZ9r4/ZZEFbuWR
	IvB4eAD+0fLojb1WPIra0rQ=
X-Google-Smtp-Source: 
 ABdhPJxsV8D0mCggBhfgJZS5Cb7hoeJoSYXi9257Af9CQxUECN/FxJzmZBEuXTRhYu74NrfPkryQ7Q==
X-Received: by 2002:a17:906:5653:: with SMTP id
 v19mr24012852ejr.360.1637170969096;
        Wed, 17 Nov 2021 09:42:49 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 s18sm302358edd.15.2021.11.17.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:42:48 -0800 (PST)
Message-ID: <9f94181cd068f119c33f964b22b9d436258c95c9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 5/8] volatile-binds: add nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 17:42:47 +0000
In-Reply-To: 
 <24a38d0e0d0dddc136c3840cecd18c88236d9b20.camel@linuxfoundation.org>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-6-luca.boccassi@gmail.com>
	 <24a38d0e0d0dddc136c3840cecd18c88236d9b20.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-v/ZTgIVAwLxDGkNQ1k98"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:42:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158443


--=-v/ZTgIVAwLxDGkNQ1k98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 17:40 +0000, Richard Purdie wrote:
> On Wed, 2021-11-17 at 12:31 +0000, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > =C2=A0meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/=
recipes-core/volatile-binds/volatile-binds.bb
> > index 66e28f4fc9..0f27353031 100644
> > --- a/meta/recipes-core/volatile-binds/volatile-binds.bb
> > +++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
> > @@ -84,3 +84,5 @@ do_install[dirs] =3D "${WORKDIR}"
> > =C2=A0do_install_append_class-nativesdk () {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf ${D}/var
> > =C2=A0}
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
>=20
> Is there any useful component left in volatile-binds in the SDK case? I d=
on't
> think we should be extending this as the recipe makes no sense. Rather na=
tivesdk
> variants probably shouldn't be depending upon it?

It's pulled in automatically. I don't know enough about yocto to be
able to tell whether it's intentional and needed or not.

--=20
Kind regards,
Luca Boccassi

--=-v/ZTgIVAwLxDGkNQ1k98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVPxcACgkQKGv37813
JB4sHBAAou+hAqg0wsiA/8b2uPxpZSPrx+Y5pYzklOuPi0DTQue8SezFZyPn4iBx
dFRDm487d/H28+sux38IbM9smLgzmYhWD8LUEwP9Bd3J8+WyY90SXiZGIIA4WSgv
MShRHRm2xqLpRKnLaLZtFPGUMBPBwB1APPj9RbfBduwDbyLqxSwny8g/JMhYul+G
v5pt7ziXf6o2K3PoJCADnAUee6+OtCIu1MkywBAip2Sf7/6gxyQ8g8CasZIy/8YW
mb51xBMm9Vatv/tZWrwWrDIR4IHRP/Gcj2t/FTxYDOxkOsBCnr7UFjdOpEjF8DmZ
VTSa+/s2T/IjHzHlaLplS4INa3yTvPinSNyrOAibKhCE0XknGNeHbYJo2n2gxIun
1yYzObZjMXV3u8jfrnbLNWQL3tzyC8+IjTG5umGe0l60r/yrf8LF40gcQlafOgoh
6sP5m59pm6COAxdYCnNBxDM0FT6uL6Pj0vYAsN+STO5NacBKQfHmQ20McdPreTxR
2NnCiUkP27O0MPogXVu4lo29SPxQAw4/G540GKlItkmTNa26bSg09RPEK2ej0PSA
N/OpmGjb2HL83JPO0ET0C9zfJXIn3yrZocqMaXOYpGIy5vz8/1vECkbxDB+pMN2m
bC5/5XxkxhjYXitkAHYkLwFYi3rAM4wJH2ve+/xGIsn1NgFXOuM=
=rK63
-----END PGP SIGNATURE-----

--=-v/ZTgIVAwLxDGkNQ1k98--


