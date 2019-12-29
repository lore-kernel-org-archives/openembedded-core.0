Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF307D65D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 13:46:23 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id 192so13166510ywy.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 05:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VtzkFRPxkMFE34sp2aKrBfxRgW2vvKFLPifAX6gDx/E=;
	b=rs7ytU15/HURCQnaN2lawfgGwfa5S3fT48yF3wIVRnz+3v8k9uHIOQp8p1zIgDnvxl
	PSwIwh0om00Jhzy59KlKam5KGe6M2BgOYGDIV24A2Wi/eb7gJ4cCDUomVdRTRIoqM5i5
	0pAabAGCMK9L0DdS36GOeqDL+qzvEb6XNqHJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VtzkFRPxkMFE34sp2aKrBfxRgW2vvKFLPifAX6gDx/E=;
	b=fzFdS2E3nxEQhhT+xsp94XWNPe/spsi3Jn+MgLniGPOUj8fykRww/qp7mNpC36yDr6
	36U2wNIH4+uK2VTW0+mt0I1fMcinh36FUk4OQ0KaqXrY7V/m+zGLAJat4dsnOwMY967E
	Xbr253U8Xc6ZVtvFtjYG3Vgi41s4D99MAERftNCGeya0B7ydfKDYmEcGCH0YDSeu8kF7
	ysIr2WP4EQatI25WNYbQTQne2JFF0zWXDOCq/aAyxrItCXMPmo0l2s08rT6TDZ+wbzJ5
	fcf+EDkgfc4SEFgEQLJsSVOxHyocFUi7vCV6aSNfoe391BTm1zAFGfIyujhBhvEKZa7V
	IXKw==
X-Gm-Message-State: APjAAAVyKIgGOTWBxY8dXD6AlM+KDcxWpB3LuRGqOKZUVlTpAdwWztqT
	gSb0JC+N5EbjAkXwksNVyEH2Nw==
X-Google-Smtp-Source: APXvYqzOW1MHlWQ1eL20uuxVSnBhygZhIt/WOvRCyTLUSAhMeSqMc3Okyc2IBlcF867F3eLN7OuGag==
X-Received: by 2002:a0d:e253:: with SMTP id l80mr44797085ywe.144.1577627184002;
	Sun, 29 Dec 2019 05:46:24 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-158d-4c58-50b2-1cad.inf6.spectrum.com.
	[2606:a000:1401:86dd:158d:4c58:50b2:1cad])
	by smtp.gmail.com with ESMTPSA id
	l20sm16458818ywa.108.2019.12.29.05.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Dec 2019 05:46:23 -0800 (PST)
Date: Sun, 29 Dec 2019 08:46:20 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191229134620.GW18106@bill-the-cat>
References: <20191224224135.20121-1-alistair.francis@wdc.com>
	<8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: sateesh0457@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to v2020.01-rc5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Dec 2019 13:46:23 -0000
X-Groupsio-MsgNum: 132919
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lez9QO3Seu3ycz0M"
Content-Disposition: inline

--Lez9QO3Seu3ycz0M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 09:23:47AM +0000, Richard Purdie wrote:
> On Tue, 2019-12-24 at 14:41 -0800, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > index a0f9c41469..4799948bb1 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM =3D "
> > file://Licenses/README;md5=3D30503fd321432fc713238f582193b78e"
> >  PE =3D "1"
> > =20
> >  # Drop this line when updating to 2020.01 final
> > -PV =3D "2020.01~rc3"
> > +PV =3D "2020.01~rc5"
> > =20
> >  # We use the revision in order to avoid having to fetch it from the
> >  # repo during parse
> > -SRCREV =3D "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> > +SRCREV =3D "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
> > =20
> >  SRC_URI =3D "git://git.denx.de/u-boot.git \
>=20
> Seems to break on musl:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1392
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1396

Looks like the Gentoo folks hit this as well:
http://patchwork.ozlabs.org/patch/1211367/

Can someone review/ack that please if that's the best way (rather than
reworking include/u-boot/crc.h) to deal with the problem?  Thanks!

--=20
Tom

--Lez9QO3Seu3ycz0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4IrikACgkQh/n2NdMd
dlKePQ//XQKOceU73m49zmNTcAMlWrX3CdnoDHmEOWI9smzjJf1l4cyYjDuPGDyt
lhkVu7CratakS9qH/V8aJFbIXFRKiiq9QRYrFj1wJo7ElY97/uM0uyjnMjny5eZM
ZzBGWrn7zMJx28LkvtKzuqKP9BWzqwDcie9y7kQy9aSxNLxrJLqeiZxtHEOOhPxr
3t+KqQpnCYkSEMy0hS9cJ9RGoWZ21jW6CBXPORIRHGdsBSUR+YI7U+nVLmb8WLb1
2rgtZm9RtVhogtYQ70QoaEqeRrdHMLSuDUCf3j2HeZxoUIZFalKSVJReDyfPcUtM
3eGO5mpVovTnNqnC7uZmrNHQiAMwcDt8sIMmPt68GwgVGNBGWtZE8aK8vDqdcA5B
9WkJrAYk63GSvkVc3s1Xw3HRmzDVLikdi6ypjVAyEraN+ITvWYsAJ4cE8jqvyk9V
Rzbte571NJQdsIPBcSNaAf/xV0cYNdZMbLUe4D72g75myElZbcSTdpHym3Qw600z
b6mI9EP6NP/IUw7/Wqra5QQVsMbmhkPJLh1Sexqsl0HBOWLeTefwJ5utiuogVUmO
Z8tyTBr0Uyg13Dss8MuJY0t7imRT7UWxZ6H6746B2tYk8xBf6PacojZwl94BJ8lX
nsJ2x4W6lryonDq9OSRs/6min8+5FxN27YcByl4OKYGNHbLdyL0=
=9dVD
-----END PGP SIGNATURE-----

--Lez9QO3Seu3ycz0M--
