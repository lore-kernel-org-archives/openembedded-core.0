Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D63C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:05:03 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.10920.1637172302052705668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYlwPI5r;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y12so14837483eda.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=V/yGyFK2dg5ewfbxDybPQzsixlyoqXjZvOVVAr3PWVc=;
        b=jYlwPI5r3BCQFzVQQUBZRNPyjPEBsLNjkevN20En3vCqr60ybIWJlDlNV6Td4jNQ0R
         JSW5mygONsiXs5ey1X8NPhKMdyNtYHivEhXn2l+se6W/X95zRscNefjuBtD1M/s8WYsY
         IHDNqJRF4u1QVkFmM0dT3rR4X5aGM25MKq5qaHqhaImd+SqB4o+gBFryMrcEMsQR5LWA
         ceZbVQ8h0UIeFLhe9+xpR74HFstvjEgIUJ7GpiSawCRymJWnm7V/hm2CVDb6yLVAF4Bp
         FrZ4T+i+WWWClWl2KKjDFO/6GTEyt69WSH/b68twkBxmtSjLLilEqKVJCiUQkCnzLdOo
         FcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=V/yGyFK2dg5ewfbxDybPQzsixlyoqXjZvOVVAr3PWVc=;
        b=34Gjddj0MUh4FrbFNsAjtF3DPL9BMZscF7mqCEth7dGArvOI0T9x23Msp3KRQH2oWp
         7kdEQfY31iEF3Y0gYADPrdpDvcigVWCc8hC0n60LstQnVW4QUwFpMVpoxkSwpt7zVzEM
         8LKEbx5q+q+47Ei4lyM6IlTcbJsmwYHbOSl2h7QjVj98+we/qGy0bIryLCfEFzaAkTcd
         kB/Gn2ND67TjHM7XaVbwiMoU6/DoVTQoimlVtrSKTsOu6p6fzz8p4JW69BaD+al0Ponu
         LME1YuNyF08+PaXYwl98U/P7/OOxLnvCZ+Efi/Eqn7dkjawN6dk+E0+1vr9FTHArV+2U
         KsDQ==
X-Gm-Message-State: AOAM531zjQObcUFfEtb5K8Xb1B/N/aJVgwhDM62kCEivtWWZZdhkWqio
	pGspW+bYcqDXlcwbIjtiw8g=
X-Google-Smtp-Source: 
 ABdhPJznKr/AdsC3OM6pie6WJK9AHNNPqjUykfN5ZAPkyiDZOVd3rw3bTo538I1ewXsxa4jySWhi4g==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr893191eds.224.1637172300206;
        Wed, 17 Nov 2021 10:05:00 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 gn16sm317297ejc.67.2021.11.17.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 10:04:59 -0800 (PST)
Message-ID: <05772373b7f5566fac765c0697c8ba74c903b19e.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 18:04:58 +0000
In-Reply-To: 
 <CANNYZj_KSZ2GkKdiZZfpzDbq3z8mFPNNU=_SZdjZYtWpZarxFA@mail.gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
	 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
	 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
	 <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
	 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
	 <58f4aeaccff5aa6cc9b92144e20cc1831d503f99.camel@gmail.com>
	 <CANNYZj_KSZ2GkKdiZZfpzDbq3z8mFPNNU=_SZdjZYtWpZarxFA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-L7xMuEqCU96gjb7Kel6a"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:05:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158448


--=-L7xMuEqCU96gjb7Kel6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 18:49 +0100, Alexander Kanavin wrote:
> On Wed, 17 Nov 2021 at 18:41, Luca Boccassi <luca.boccassi@gmail.com>
> wrote:
> > > This is packaging the tool for the target images; what I propose
> > is
> > > that it's built and used natively.
> >=20
> > Which is what this patchset does? Again you can't build these
> > recipes
> > to run locally without these changes, that's the entire point
>=20
> This patchset allows systemd binaries to be used in SDKs; what I
> would like to see is that those binaries are built and used directly
> in yocto builds. E.g. systemd recipe gains BBCLASSEXTEND =3D "native",
> systemd.bbclass gets DEPENDS =3D "systemd-native" and then uses the
> native systemd binaries in the same way you want to use them in your
> private SDK-based pipelines.=20

Sounds good to me, feel free to go ahead and send patches to do that.
It's unrelated to this series and to my requirements, and I have no use
for it, so I will not be spending any time chasing down various rabbit
holes to make it work, sorry.

--=20
Kind regards,
Luca Boccassi

--=-L7xMuEqCU96gjb7Kel6a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVREoACgkQKGv37813
JB5sBA/8DmWr5w1Y+/nAqbkUWNWaQRiVZhdRHswpk6ZpZCFzozt7nJq+JbPIoUmt
ahfoE0A3wu+rqdnM9ePgzN0+RJ7QQO3TtfH0YSLIujk5gecv1zMFZQhyq/afFtR9
X/0KngaQDhb1w76myq4Xjt9S8URiEJEVtNCdyCWigN3dwazbvzkYLWMHtzWePNKB
nnM+eNBAS6Y5sbVaaJLACw9E1Hv+GedurNRu0eYkZSjArV6Zly/KBeaYcxZd25Pz
XPZUnjV22W7c/zbG7aVQUVCdcWy5dOsvnaoucrTuKVfhg57oOIA4XI6387omW9l3
qzmjUI5MwScPGG+z0bNb1m8zkY+LAmvWZ/3BQodkzNGZenKoOEHrb83D6/pp0qZ1
zqFWPMWemeHG/EEDZ7/rAbRwahSUfPiYXy49FfEJ0EmnMjB7kxNo7p4/u+9DZV1d
Q9cAa+Ste+rSQhULgdeRukibJ/PMTeNRVonRqEhHHR+Fh+AO0LfAWbaiaKPKmZ0T
LfNNZECrt5c0qKwrPrwf+1LylhHEEWPmFEguiGGYgTToLc0wErDzZU6OxXeG9Oyd
o7gSmOLLckS/ceff/HGDx1BwxpmSIv4EWJre3mcgacrxmNmVVK18H6LemCh6ZBmA
XN9Z4+TWddZpbuUqQLACIqRCftP6y4Qwy38aWzjNB8gFuc5CuTw=
=CXan
-----END PGP SIGNATURE-----

--=-L7xMuEqCU96gjb7Kel6a--


