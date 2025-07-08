Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C7C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 17:57:38 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.2942.1751997456136071741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 10:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qSe3oe5O;
 spf=pass (domain: konsulko.com, ip: 209.85.160.41, mailfrom: trini@konsulko.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2efa219b5bbso1240727fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751997455; x=1752602255; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDG6CDd4y/0GtjiM0vT7165cFQIuveaY4GDIzMWbCDA=;
        b=qSe3oe5O1UzVatAY+6PcYlXx2xayYTmYB9oB7cqGQE0b+qpeOu63grIrIOg9DVUfPO
         NTVfT/dnalxp/j/WLQ3H+KpDpM+DkEGxwiJtFLP6oibOv/pPHJ/FMbl3wrGw6/obH20P
         J2XGX+Gt6t0S8k+KZnXksNT0YndwZgHAfOGGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997455; x=1752602255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDG6CDd4y/0GtjiM0vT7165cFQIuveaY4GDIzMWbCDA=;
        b=DEY1nD2stYGNhCDa8i0pMNywYHDG4LM92+3xlWWcdN+JzxDI89bXZ0fx4G3BqL6IXO
         yxH1oXlinqdfUkkmvHP6D+DRt3uxiBlMnv5MLKaSvGfuibZBICTX9JCEL9T/k+Ge6UrP
         5Sno3l1ohUgZFBnFIvGAHVGlvLLdn6x8HTCGpM+zQr0HUvpK4mjWxWYzqko8lYuEGOv4
         1yka7KhbaLrKfe4taCaWyNmQz9zzmYmrjdyZ7kk8rxTXFKlPm9A8JLbA3Tl9dhUssXYk
         UGDetw5vXV0W0vr1pGjzrLGrl32th7/ThJiFViY6IZDe/0KI1KBlAqJxp62W8KZYnTPS
         xYmA==
X-Forwarded-Encrypted: i=1; AJvYcCV2WSUUg/ivh0gO9BvYJQTKCoe75CaIjIjjpqKCBHLjiVn8HtQRICOERFeIAtUur3mrvtUkMeoEXUJP4s6C/VupoA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMi4FcdjAdkivwDfnSahSWgy7p/DkPxJxaDtG9ZXo5MJXAS5Ta
	rTguZioJyBpWoJo7BRP89Ra5P56zILHwsOqw/zsuX5dMtUFPs2TS+ELSDOJU2zWHjwI=
X-Gm-Gg: ASbGncvPfMt/NnoKhR4wGY5LuO7kYTIMFCpr5WAN+xS74iTNMoK4Ecz6zN1dizfe7RD
	Ch/gIVeNaPg3L22ga1OhURen5KbSGe9VukF1r6Fj7rVLhzfTD+zfP/8SdijDAmrGHq3ey2sGgr+
	2iYFOPua05mMgbVdp1iM8QhAQGgSDOQdizFwBIHqnjbZSI+RxgYK6Jg6txeWQYQzxWGxulOs020
	PeZQepXJ/EEA5+2Le9+qb5riFs2Ev3uNiY9UY0pfn1Xuy5h6vDoQ4b/plCdrACiJOiskvzLjyI/
	VYHVMEcue9BR2M8sEAx9ann5m8yaEMqp/7mrJLni85bqpMG7bxuULGAFcwPKzeM6ZGUAZyTkWcF
	DZgtNSq6DCtolpiX1g2Eu
X-Google-Smtp-Source: AGHT+IGQnYsU2Cmc7qjGY2QcXK7p5NcPdl22IXNUDdXhAHGQg4NL7ma8sQAqyPJw55gHlnC4lQ7XGg==
X-Received: by 2002:a05:6870:e249:b0:2d5:1725:f529 with SMTP id 586e51a60fabf-2f79200c1e2mr14127953fac.27.1751997455253;
        Tue, 08 Jul 2025 10:57:35 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2f790276f63sm2937410fac.44.2025.07.08.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:57:34 -0700 (PDT)
Date: Tue, 8 Jul 2025 11:57:32 -0600
From: Tom Rini <trini@konsulko.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	adrian.freihofer@siemens.com, Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <20250708175732.GU6424@bill-the-cat>
References: <20250708012959.77522-1-festevam@gmail.com>
 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XILbVboMGBVneuuX"
Content-Disposition: inline
In-Reply-To: <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 17:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220052


--XILbVboMGBVneuuX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2025 at 02:04:15PM -0300, Fabio Estevam wrote:
> Hi Mathieu,
>=20
> On Tue, Jul 8, 2025 at 9:37=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >
> > On Tue Jul 8, 2025 at 3:29 AM CEST, Fabio Estevam via lists.openembedde=
d.org wrote:
> > > Upgrade to U-Boot 2025.07.
> > >
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> >
> > Hi Fabio,
> >
> > Thanks for your patch.
> >
> > It looks like this is breaking selftests on the autobuilder:
> >
> > 2025-07-08 07:43:52,116 - oe-selftest - INFO - fitimage.UBootFitImageTe=
sts.test_sign_cascaded_uboot_fit_image (subunit.RemotedTestCase)
> > 2025-07-08 07:43:52,118 - oe-selftest - INFO -  ... FAIL
> > ...
> > ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> > ...
> > | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No suc=
h file or directory
> >
> >
> > Both on debian and armhost:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1923
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2077
> >
> > Can you have a look at these failures please?
>=20
> Thanks for the report.
>=20
> I am adding some folks on CC in case they have some ideas.

Interesting. How can we trigger that outside of the autobuilder?

--=20
Tom

--XILbVboMGBVneuuX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhtXAgACgkQFHw5/5Y0
tyzisgv/WlVxoL2NtpXyMI3ejLfKCmuCCnAbEsguuiRgu+yQpX+K+z5I7XZy1vDo
2vTnQM5Eb4T8chIWxpdQgEXYgznExNYmdkRsbxoHR9uA8c+zwyg7dz4LvHLDbh3D
rWSens+hKQUYr6gAdgWzXmJdZNM65VA5ee6jzCoXnLQuPCKxOoGjgRs6s20Z06Kj
EUWbHOLvlC7UsQMVx1JidaDzenBIEAC1FC5N82b1TPcWHrgynTRAMwoUBAf4ExL5
32ARZUUYoxOijta99f/RCUAUlHLZOMB/GI2TyilCeHtY6GHUiuHQNUPnplVAAEkw
fBcr4kBawKni6cFpsAJb0bFn0wu3RIJisGmjxKIGdoDzN8JR31tarYmkrC+TpEjx
Lt4IWi6k9FIZQDz+zAS1lZOE8Du1f73KWYhqfOMkW9s4Nk5IHnT1auIkGdOjU3Am
OTh7ROA6JgDuDzwAGUoaytAaifIMyiP3K2kxf1jOPnoB5aMETFtfZ4v1J+/V3xYO
RTIVzy36
=uykt
-----END PGP SIGNATURE-----

--XILbVboMGBVneuuX--

