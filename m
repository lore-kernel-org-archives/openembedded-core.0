Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D61AC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:03:57 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.3668.1665047031156079266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZbKNjmK1;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 749D910000B;
	Thu,  6 Oct 2022 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665047028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5yBUwAIpGp1YQziLfH+kNgl8S2OzaEjQGiJPLD3Mm4I=;
	b=ZbKNjmK1M1kXpZM7KScx/2s8rQ0A3kv+l35V5+pdFfI9ZbGoZfdm/kV993ElNlcQZZyllY
	iy6Fl0VQXMCPLSG+Q9JKy0Nxza40srr95aH8N4w4jPVLq5Wm6i+lzaA0e3cysLK/uOxUTZ
	adIld5Gpp9tf/yvOm3k3zE9pBP6kzGPg0b6Zi1dcfbsBhllllUCZwGYrAq+VtHG245P0iD
	TZnvLi4a+NMIRqfRF8l4iVJIwMAeeISTOlgS4cgwPWFflum7q3ciGURjtj9fEsQk7HxHf/
	daQxyVAle7tQ3cBWN0dhppIRHAIdQbWC5Y6dp9yaa8awIhJsGiggACi1wQtdtg==
Message-ID: <c0a9f615a9a52a89d894f7ed78207cc462220169.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2022 11:03:46 +0200
In-Reply-To: 
 <CANNYZj9yoFsY3On8PqsqBw1VV3R4qB1Xd7R-1=Po5x4wGonmSA@mail.gmail.com>
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
	 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
	 <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
	 <CANNYZj9yoFsY3On8PqsqBw1VV3R4qB1Xd7R-1=Po5x4wGonmSA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8GkUub+ghqdx5eiW7f51"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171482


--=-8GkUub+ghqdx5eiW7f51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, 2022-10-05 at 19:09 +0200, Alexander Kanavin wrote:
> > Does core-image-weston have the same problem? If it does, then this
> > certainly needs to go to qemu include in conf/machine/
> >=20

Yes, the same issue occurs on core-image-weston, when
NO_RECOMMENDATIONS =3D "1".

So, instead of adding this rdepends in the sato image, I can add
kernel-module-virtio-input in MACHINE_EXTRA_RDEPENDS in
conf/machine/include/qemu.inc.

In addition, I'm looking to use a built-in virtio-input, as proposed by
	Bruce Ashfield.

Kind regards,
Thomas

> > Alex
> >=20
> > On Wed, 5 Oct 2022 at 18:51, Thomas Perrot via
> > lists.openembedded.org
> > <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > > >=20
> > > > Hello Khem,
> > > >=20
> > > > On Wed, 2022-10-05 at 09:19 -0700, Khem Raj wrote:
> > > > > > On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
> > > > > > lists.openembedded.org
> > > > > > <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > > > > > > >=20
> > > > > > > > Otherwise, it isn't possible to interact with the UI.
> > > > > >=20
> > > > > > I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS
> > > > > > in > > > machine
> > > > > > configs, it will help a wide range of users who may be
> > > > > > using
> > > > > > graphical images.
> > > >=20
> > > > I hesitated to put it in MACHINE_EXTRA_RDEPENDS for Qemu
> > > > targets.
> > > >=20
> > > > Currently, kernel-modules are in MACHINE_EXTRA_RRECOMMENDS of
> > > > Qemu
> > > > RISC-V and PPC64, which are not installed when > >
> > > > NO_RECOMMENDATIONS=3D"1"
> > > >=20
> > > > Kind regards,
> > > > Thomas
> > > >=20
> > > > > >=20
> > > > > > > >=20
> > > > > > > > Signed-off-by: Thomas Perrot
> > > > > > > > <thomas.perrot@bootlin.com>
> > > > > > > > ---
> > > > > > > > =C2=A0meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > > > > > > > =C2=A01 file changed, 2 insertions(+)
> > > > > > > >=20
> > > > > > > > diff --git a/meta/recipes-sato/images/core-image-
> > > > > > > > sato.bb
> > > > > > > > b/meta/recipes-sato/images/core-image-sato.bb
> > > > > > > > index e63a229d1257..0e37c15097b3 100644
> > > > > > > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > > > > > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > > > > > > @@ -12,6 +12,8 @@ inherit core-image
> > > > > > > > =C2=A0TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool >=
 >
> > > > > > > > > > nativesdk-glib-
> > > > > > > > 2.0"
> > > > > > > > =C2=A0TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D =
" >
> > > > > > > > > > > nativesdk-
> > > > > > > > intltool nativesdk-glib-2.0"
> > > > > > > >=20
> > > > > > > > +IMAGE_INSTALL:append:qemuall =3D " kernel-module-virtio-
> > > > > > > > input"
> > > > > > > > +
> > > > > > > > =C2=A0QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES",
> > > > > > > > "opengl", > > > > "-m
> > > > > > > > 512", "-m 256", d)}'
> > > > > > > > =C2=A0QB_MEM:qemuarmv5 =3D "-m 256"
> > > > > > > > =C2=A0QB_MEM:qemumips =3D "-m 256"
> > > > > > > > --
> > > > > > > > 2.37.3
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > >=20
> > > > --
> > > > Thomas Perrot, Bootlin
> > > > Embedded Linux and kernel engineering
> > > > https://bootlin.com
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171469): >
> > https://lists.openembedded.org/g/openembedded-core/message/171469
> > Mute This Topic: https://lists.openembedded.org/mt/94137249/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub>
> > =C2=A0[thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-8GkUub+ghqdx5eiW7f51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmM+mfIACgkQn8ALBXH+
Cu3IPgwAskwpebNK+cwBmi5GvELkvFTVqGmc8xIRG0U6S5q/l9eStX7tWYNq5XAa
K17MzWPKz7HT8DEVrnB2IT/QXCxa0+BocuCtb7gpcimD+SqkkhC0dcqEoBBFJUo7
ZVafhCt/BbRRgy01poGA4k5up8HCfWPf17K8jGk8krTKXBVQKUSKxJPQ7/+eC+zY
Bv0Q4MkwC27136Ly0/mYRmlMYBmQrjkTfhTGgijZoQkSI49sl870XsvkyT2asXv/
Ts+bh1uZ0svmJaDoT5KadkUMdRAWg1X1GLH4tuTIyx/kd4j3f5mbjf6zpmjfwqCq
lbUigguahHh+jfCWRXK+b84jST84ANAFRznO4vRb1+LmSVeb8/mZXxARqSP3TJMe
9vDxB7HYBx+r75Elg9SK2EtECF5+QQo8wCdp8FuE+u45B1U9ocyMsANt2OyHELie
eVM2j46gHwijyakJze+L1Y4u1OWtHW9VjuxrWdTumecJnmZhzzU3zqrv3BUtLxHF
PjhwDV6U
=kCYH
-----END PGP SIGNATURE-----

--=-8GkUub+ghqdx5eiW7f51--

