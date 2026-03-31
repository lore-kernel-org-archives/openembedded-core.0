Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A714D109B473
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:17:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21151.1774966630508969741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GgJQpPwn;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67EE54E42878
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EEDE6029D;
	Tue, 31 Mar 2026 14:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDB63104502A1;
	Tue, 31 Mar 2026 16:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774966627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=iZjgIDmgzdlVKzh6U+2pYdiEz5Mb0gKbKHT1WNOh3UI=;
	b=GgJQpPwnEPFahzjSz2olvGTYYqB9j2iUBgEjZa4b1f3R9Pbz9dXea35aiVY352/TImC69X
	Kz0w200VYzheFPpmb4rBakGTGefStxWLVe/zvP0HZgE4EOPRzh7q9ocGQryHqa+X64dMjw
	cNa4DdFg4hIoWIQ6IM0c9PdPjDE1WREI+u3oc1/Mcn93qiGk/eZYY2k+NXjtL4RiNoRnzk
	cJnKrqL2lbn8MbDQGTjvqdL/WsOYwxad6j5LgjcN5WLwNZovIafc2Zl4LqkeoU1Tx7JOjU
	r4xC7iZBTiTRLQYeBWH1urhIVhQRh5QyQW8iS9DOY26wzcxl7SrsyyboipkwUQ==
Message-ID: <507009eed57ab19b4bed647b17f9d7bfa00e1edc.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] lto: disable for expect and add
 DEBUG_PREFIX_MAP to ldflags
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com, thomas.petazzoni@bootlin.com
Date: Tue, 31 Mar 2026 16:17:05 +0200
In-Reply-To: <56e03e1e7a5a7a51fe34ad6b099ff7a7f1afd587.camel@linuxfoundation.org>
References: <20260331081246.73406-1-thomas.perrot@bootlin.com>
	 <56e03e1e7a5a7a51fe34ad6b099ff7a7f1afd587.camel@linuxfoundation.org>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hD6nSVHbOICBdIfPv6U5"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234290


--=-hD6nSVHbOICBdIfPv6U5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Tue, 2026-03-31 at 15:12 +0100, Richard Purdie wrote:
> On Tue, 2026-03-31 at 10:12 +0200, Thomas Perrot via
> lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > Disable LTO for the expect package and append DEBUG_PREFIX_MAP to
> > TARGET_LDFLAGS when LTO is enabled, ensuring debug info remapping
> > is applied consistently alongside LTO flags.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/conf/distro/include/lto.inc | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/conf/distro/include/lto.inc
> > b/meta/conf/distro/include/lto.inc
> > index 8752249685a4..c66dfc5a8074 100644
> > --- a/meta/conf/distro/include/lto.inc
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -4,6 +4,7 @@
> > =C2=A0#
> > =C2=A0
> > =C2=A0# Disable LTO for following packages
> > +LTO:pn-expect =3D ""
> > =C2=A0LTO:pn-glibc =3D ""
> > =C2=A0LTO:pn-gcc-runtime =3D ""
> > =C2=A0LTO:pn-libgcc-initial =3D ""
> >=20
>=20
> Is the commit message still correct for this? it doesn't add
> DEBUG_PREFIX_MAP?
>=20

Sorry, I forgot to update the commit message when I modified the
commit.

I will submit a v2 with the correct commit message.

Kind regards,
Thomas Perrot

> Cheers,
>=20
> Richard

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-hD6nSVHbOICBdIfPv6U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmnL12EACgkQn8ALBXH+
Cu1eLQwAj5AU1UakR4A1DHvUk1YBtgiw8LXNA48OMn6AZBcJi4oFyWXiIAToPQjd
zGIDnGlY3y7lZc9S39PEaDMtpFA+OHIa9Sxe7t1dAM13Dzs1ogpYJx3wVTeEXR/g
Qp8ERMtL6yVpTIrOfpqqqztqO0oOXEZtRjIpZ7600CucDO8OshAwHuSG4P+5vBVv
snZu+l3YMumrVfFOGJygWNMb/L8JDoPOYP8RaQsy0lUJKL68l8FAOUzZQU64YpJs
c/lrx273dmwCplH8Wa1sGSqjcPsrfapWBp1oNBlH4fZnBLKjmT3rCLTuvYnCF6VU
tzYCY7koV6FljoA9/bQHU4o/t6ir7ynR52LeyJBQv+2TOQ3HxAy7t2ufbyaLc1pe
lqiCT43BdIwKrcR2yO5Dx7HBsvKM+ZPqK55IjQTD+dBpEfTT34h7qZj20xp/bty2
j4v9jXjlxB9ru7lo+VUp3zd5UReuJrrV8jCczogaqpmYfnfS07Acd9k/4PDn7b2n
tovzYaOZ
=JXPT
-----END PGP SIGNATURE-----

--=-hD6nSVHbOICBdIfPv6U5--

