Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80324FB3CF5
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:00:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47746.1774864801704160465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DZ8iSnA9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7A344E42870;
	Mon, 30 Mar 2026 09:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D1815FFA8;
	Mon, 30 Mar 2026 09:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFFA310450D8B;
	Mon, 30 Mar 2026 11:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774864798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=N918ZJ7eks/rqSahzc1cfez4Rky6HztpwX74f/AKbPQ=;
	b=DZ8iSnA9a84VnNBENpzo8CBemY6UqvlIXpVI8qf3Tt8If2j2CL/7goVqkDsZHT2vPDIc1U
	9cgTKqHst84JO6VBUuNSzSdijCk/GBjCydXb4QiWKGd9yFs8U3TFOi4Xojn+2uJnj2MW/J
	/Btp/7IYtgCMWc4adgW3Xv8nALiAjRw89tcOTxuo4GIQF7R6zGxlq66SeXNMd8YDJJFBY2
	AnGBc7n0OpQiEHIXF6h88xvEULpnAKR9UVtF3Hlnf74lwpdjQ8CEsJYKHJ/0a9elUCdJ5D
	4AE8Mr64vY50D5qfqK1uMQfU5l8+YNxuozhV1CCNYuvv1/XXJYDYHMprTJYbSA==
Message-ID: <0110332424c01404402aa58286399958e1449110.camel@bootlin.com>
Subject: Re: [OE-core] [PATCH] lto.inc: add DEBUG_PREFIX_MAP back to
 TARGET_LDFLAGS
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com, changqing.li@windriver.com, rs@ti.com, 
	ricardo.salveti@oss.qualcomm.com, raj.khem@gmail.com,
 antonin.godard@bootlin.com, 	richard.purdie@linuxfoundation.org
Date: Mon, 30 Mar 2026 11:59:51 +0200
In-Reply-To: <acg3xGOKkL769U3e@navimatix.de>
References: <20260204052638.284617-1-changqing.li@windriver.com>
	 <acg3xGOKkL769U3e@navimatix.de>
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
	protocol="application/pgp-signature"; boundary="=-zhRrWZH6P85mqeyG81vi"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234220


--=-zhRrWZH6P85mqeyG81vi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

   1. Hello,
     =20
On Sat, 2026-03-28 at 21:26 +0100, J=C3=B6rg Sommer via
lists.openembedded.org wrote:
> Changqing Li via lists.openembedded.org schrieb am Mi 04. Feb, 13:26
> (+0800):
> > From: Changqing Li <changqing.li@windriver.com>
> >=20
> > DEBUG_PREFIX_MAP is appended to TARGET_LDFLAGS in commit [1] for
> > fixing
> > reproducible issue when LTO is enabled. It is removed in comit [2]
> > since
> > this commit causes cgo binary not reproducible. But actually, we
> > still
> > need this DEBUG_PREFIX_MAP in LDFLAGS when LTO enabled. So, only
> > appened
> > it when LTO is enabled. Refer [3] for the history, with this patch,
> > patch [4] is also needed for cgo + lto enabled.
>=20
> Gentle ping. This patch is missing, otherwise QA check buildpaths
> matches in
> nearly all packages.

I confirm this patch is required to fix QA check build paths for a few
packages.=20
Kind regards,
Thomas Perrot

>=20
> But this still leaves some packages with buildpaths, because there's
> a bug
> in gcc that it does not apply -ffile-prefix-map:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124581
>=20
> > diff --git a/meta/conf/distro/include/lto.inc
> > b/meta/conf/distro/include/lto.inc
> > index 227f0c5c2a..cef92901e3 100644
> > --- a/meta/conf/distro/include/lto.inc
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -49,5 +49,6 @@ LTO:toolchain-clang =3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flt
> > =C2=A0
> > =C2=A0SELECTED_OPTIMIZATION:append =3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
> > =C2=A0TARGET_LDFLAGS:append:class-target =3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
> > +TARGET_LDFLAGS:append:class-target =3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '
> > ${DEBUG_PREFIX_MAP}', '', d)}"
>=20
> Possibly, I would join these lines.
>=20
>=20
> Best regards J=C3=B6rg

--=20
Thomas Perrot, Bootlin Embedded Linux and kernel engineering
https://bootlin.com

--=-zhRrWZH6P85mqeyG81vi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmnKSZcACgkQn8ALBXH+
Cu1YcQv6ArS+Fd3E9dfUEpYKduAgBz5RcgGmClk/CQOuh+u8I/XsYDG3N2tqxgVQ
izfFzMAf8/6/4GJIKc2dOln71m0fgqa6yVF+761/O+hAziMA/mWcIwErfNYv9YHf
1UCmclXKe9c/8GQyfkT0n4fJQQZ0NhNy0fRGypa5+aEdLr0Exst++6bSRRMztCoj
ls8ttsOPFAA/M1g2egR/d2g8dy6sO0/O2SXskqcw1didKHWnLVhLzaS12REOVX0K
KwHUXVCwH6V4kVxq0OLQMlkeDc6w8L6t1nxJNicQLd1H9p4s4BlVgIQAEhN8RcFb
mbJSY0NljG8EAYsbvUn39d9eawfntvcFrIAT5187uaMc2YhSGpCADMVszcWBx8zW
1oVISsgUjfOyPRkx1EwzTO1nXbYtgbHyZzyVel2ODQbXI69PrWi93T5pdhZB+Y7y
GeL2fBAZwriHZ+N1tlNgUgBG1w3ZYezkYSucZh5uZwA0GG2as1Ld0HwkbNUXzJGv
0az+JDtL
=JkMQ
-----END PGP SIGNATURE-----

--=-zhRrWZH6P85mqeyG81vi--

