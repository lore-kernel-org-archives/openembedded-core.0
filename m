Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7EBD58063
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:07:43 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16489.1732532862126676804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tFWwO-0007hZ-Il; Mon, 25 Nov 2024 12:07:40 +0100
Message-ID: <0c7b419307de6be75df7a232440d997653809921.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] barebox-tools: upgrade 2024.09.0 -> 2024.10.0
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Mon, 25 Nov 2024 12:07:39 +0100
In-Reply-To: <CANNYZj_YG8Enba=QM0niqgw0TFj_yojC8-f1rA9pBja=z38PxQ@mail.gmail.com>
References: <20241125102227.1216656-1-ejo@pengutronix.de>
	 <CANNYZj_YG8Enba=QM0niqgw0TFj_yojC8-f1rA9pBja=z38PxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207738

Am Montag, dem 25.11.2024 um 11:39 +0100 schrieb Alexander Kanavin:
> Already in master (but barebox is still at 2023.09):
> https://git.yoctoproject.org/poky/commit/?id=3D10a2dd4d67d57e8f91a2814cd6=
1371b6cab94044
>=20
> See what I mean about not enforcing lockstep updates? :)

Oh, I just looked at the Mails and did not notice a new barebox patch there=
 and the other had a
comment that made me assume it won't get merged. Seems my assumption was wr=
ong. =F0=9F=98=89

Will rebase.

Enrico

> Alex
>=20
> On Mon, 25 Nov 2024 at 11:23, Enrico J=C3=B6rns <ejo@pengutronix.de> wrot=
e:
> >=20
> > Regular barebox release.
> >=20
> > Changelog: https://lore.pengutronix.de/barebox/ZxIdBi3xLj0dHqzi@pengutr=
onix.de/T/
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0.../{barebox-tools_2024.09.0.bb =3D> barebox-tools_2024.10.0.bb}=
=C2=A0 | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0rename meta/recipes-bsp/barebox/{barebox-tools_2024.09.0.bb =3D> =
barebox-tools_2024.10.0.bb}
> > (93%)
> >=20
> > diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb b/meta=
/recipes-
> > bsp/barebox/barebox-tools_2024.10.0.bb
> > similarity index 93%
> > rename from meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> > rename to meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> > index 13a308b3da..386656f7ad 100644
> > --- a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
> > +++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000=
b9ca1f0d3364286c4192"
> > =C2=A0DEPENDS =3D "bison-native flex-native libusb1"
> >=20
> > =C2=A0SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> > -SRC_URI[sha256sum] =3D "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64=
c3bd0c4f24f23a47da"
> > +SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b1=
6dee7442d71a5af88d"
> >=20
> > =C2=A0S =3D "${WORKDIR}/barebox-${PV}"
> > =C2=A0B =3D "${WORKDIR}/build"
> > --
> > 2.39.5
> >=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

