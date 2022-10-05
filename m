Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8063C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 16:51:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.170.1664988691441848072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 09:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gdUmherI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A61040007;
	Wed,  5 Oct 2022 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664988688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=guWKWwqNUrSj4ryyrw7p6P5e3ZZZSKLGe1o927Hcp1g=;
	b=gdUmherIkAYZg3ndPedVq+2l6A772dEV43Kw5P5KnUez/XxrLLjMvyq3Q4jGoOgHzNt/Qr
	XGNm3Z7Jz9a5xIZkZgBu05p4u0xJvyDJo+F+YbbWRQffiAoqY2dCkaaSZHevOdBlosCtkV
	1cmbAb0jFb8R56NizT5iFLX2DcThrqyaqjauZoRYv1u44Cj9N+uql9Ho05gsVQR60mVx2D
	+ju3EiSywayfbUUb39jcGaiuwV4F9eUcgJm+YuJgqDYVEgWRjtiRix89P9uiiVhWCK234L
	eihvu8vPZjA2Yc3n2rBMggsILmeZ3O7e2z6xk5GuCKJL/U36YdPGHmLCdOOnXQ==
Message-ID: <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Oct 2022 18:51:26 +0200
In-Reply-To: 
 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
	 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-yD/H65faq1JtmeM6M3Bj"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 16:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171468


--=-yD/H65faq1JtmeM6M3Bj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Wed, 2022-10-05 at 09:19 -0700, Khem Raj wrote:
> On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > Otherwise, it isn't possible to interact with the UI.
>=20
> I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS in machine
> configs, it will help a wide range of users who may be using
> graphical images.

I hesitated to put it in MACHINE_EXTRA_RDEPENDS for Qemu targets.

Currently, kernel-modules are in MACHINE_EXTRA_RRECOMMENDS of Qemu
RISC-V and PPC64, which are not installed when NO_RECOMMENDATIONS=3D"1"

Kind regards,
Thomas

>=20
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > b/meta/recipes-sato/images/core-image-sato.bb
> > index e63a229d1257..0e37c15097b3 100644
> > --- a/meta/recipes-sato/images/core-image-sato.bb
> > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > @@ -12,6 +12,8 @@ inherit core-image
> > =C2=A0TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool nativesdk-gli=
b-
> > 2.0"
> > =C2=A0TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D " nativesdk-
> > intltool nativesdk-glib-2.0"
> >=20
> > +IMAGE_INSTALL:append:qemuall =3D " kernel-module-virtio-input"
> > +
> > =C2=A0QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > 512", "-m 256", d)}'
> > =C2=A0QB_MEM:qemuarmv5 =3D "-m 256"
> > =C2=A0QB_MEM:qemumips =3D "-m 256"
> > --
> > 2.37.3
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171461):
> > https://lists.openembedded.org/g/openembedded-core/message/171461
> > Mute This Topic: https://lists.openembedded.org/mt/94137249/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-yD/H65faq1JtmeM6M3Bj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmM9tg4ACgkQn8ALBXH+
Cu00yAwAg71ypKrtiqWRl2X4G8D+brErYxBNyhD4yP9Z2lnnbpZHgu1r2tEml0HZ
MQn+55W598s1vKUXdPtQ66BPFyQac+91MriSKZK59iEV79/gQuDbERM5H2xF7Mmn
HyfvAmnGP4l9xshDTlE+dNasAijHoqZINs+edARmsR7eyORqwyNGsjwX8rRBadXO
1EfgnRlMOG/ogc/3kv2AHnQazBNTCl9OOhwg+ci6oveKaGDVPGzovuIZ3NPESJ5m
SdWrUTDuwzzMvxQQapVGfcopt0Tp++Cywkh7P/OUovwOrsFaR6mZ341Q1Tcvjod4
/HESzFgSdGRu462frgK+5vNcTFS/6VcQCQ6j9V6ySxqd88G/y7tnNvj0jv+6GWAR
1IXAHbLbqwd+GHwwA79j0O0Db8IsZRx+Ay7ueykGcKm9SkmWL/TOqWtCjH/SD1zW
Qwh/lTqhfBP+Zzg9rYE69xPzCaOWALwYSdUZ9zmq1Mc/LIBM2eMz+fzF5VR6KR32
AqW63vlZ
=vAU9
-----END PGP SIGNATURE-----

--=-yD/H65faq1JtmeM6M3Bj--

