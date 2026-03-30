Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D90CFB3CF5
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:05:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47822.1774865130271150111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GIoVgOL+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54E47C580AD
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:05:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E63B5FFA8
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:05:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84D91104507FB;
	Mon, 30 Mar 2026 12:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774865127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=uLDd48cbTUJKRWf+e7+m/IplUu/wJoIcxZRi7+AELsg=;
	b=GIoVgOL+UZrORceRQov1fklLpeV76zYQkyL6fq2JwjLzCDNkRk+43dfG2s0r4Lc9nuWE+4
	266GzLaaEzzFY8t7gPtrrV1zl/rApgAzeSaeInTGY/S4gR88ryEYsnDNJAUTKWAPU/L/dJ
	kZTGCEzgGUeu4yegKx2I02oJG+kOjvA6CquVGQjfBBwNDX17HeUMIeNJX/ywoORVJLMMez
	IJm5pldjzL8PI2mrF9SjJJlNIMKnrdDFU9/2OBrZRlwX5y/S5NX718cJ4bpxpRgB7lkf8R
	5Kmp6m0JAvjLihg7znqCblwHTCKjFVImKv0kjz9KGGLqGk+UcILUJrdQxmaq6Q==
Message-ID: <53d1c372f60ebae17cd0bda50df842f6716b4e69.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] lto: disable sqlite3 to fix buildpaths QA
 failure
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com, thomas.petazzoni@bootlin.com
Date: Mon, 30 Mar 2026 12:05:26 +0200
In-Reply-To: <20260328153413.279179-1-thomas.perrot@bootlin.com>
References: <20260328153413.279179-1-thomas.perrot@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="=-e4BDPi08ldsToLSiL8wB"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234221


--=-e4BDPi08ldsToLSiL8wB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This workaround isn't needed until the following patch has been
applied:
https://lore.kernel.org/all/20260204052638.284617-1-changqing.li@windriver.=
com/

Thanks, Changqing Li.

Kind regards,
Thomas Perrot

On Sat, 2026-03-28 at 16:34 +0100, thomas.perrot@bootlin.com wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> With LTO enabled, GCC performs a link-time recompilation pass where
> DW_AT_comp_dir is set to the build directory. The -ffile-prefix-map
> flags from DEBUG_PREFIX_MAP are not applied to this attribute during
> LTO recompilation, leaving a raw TMPDIR path in the split debug
> symbols of libsqlite3.so.
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta/conf/distro/include/lto.inc | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> index 8752249685a4..b4f823681af0 100644
> --- a/meta/conf/distro/include/lto.inc
> +++ b/meta/conf/distro/include/lto.inc
> @@ -21,6 +21,8 @@ LTO:pn-libbsd =3D ""
> =C2=A0LTO:pn-perf =3D ""
> =C2=A0# webkit is not linking properly with LTO, disable until next time
> =C2=A0LTO:pn-webkitgtk =3D ""
> +# LTO link-time recompilation leaves TMPDIR in DW_AT_comp_dir of
> debug symbols
> +LTO:pn-sqlite3 =3D ""
> =C2=A0LTO:pn-xserver-xorg =3D ""
> =C2=A0LTO:pn-grub =3D ""
> =C2=A0LTO:pn-grub-efi =3D ""

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-e4BDPi08ldsToLSiL8wB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmnKSuYACgkQn8ALBXH+
Cu2ycQv/Q92r6aTbYXyrr1PSzMYnTR1/S4mrJ/Mi0eWJJtIlHz1AHOOFjCCFgQji
eFRrqMbuJMi3/kqUNl0IC9gh+vJw2DXXKWzfNUZpKODBGdayADNSBTrF3kMKSJfN
yCA2d9tt+ize1ejs4ogDZt5I2kK1rXiRLCZakR6mqfxb7kSvm4YJaDHZqfvnm0xQ
N8b7uAk+d5jtDlqyKJzKESaUKuvL3Rh0MrIih9EftMJ97SZBhpqnYHr9qqhBursu
3+sPuP/Oh3VTzuDEf/2lPXsQLnF7CeGdvHNe3qdsrUE5Vcqk+YEzQPxo0n3q6m5V
jmXo5xm6nOEiVASszplFDSRWwaeOWOTFl08GVlggriazxd+0Vlf0VcWa9N7G8Tws
yOfrazulYpNslgTianxJ4IHLhol7zoykAUdkS7E2EVP6Wvjrnl1nFLLGyzIt/Qq2
r56r+M9NPALc7QuIr5w6ZJfWBDeXFqW7KLubLTh9HWdFy7KIVAjNhpKU4ZVynpTh
Onn4wi20
=bL3X
-----END PGP SIGNATURE-----

--=-e4BDPi08ldsToLSiL8wB--

