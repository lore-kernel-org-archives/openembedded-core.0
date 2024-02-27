Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC38C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 18:44:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.2155.1709059466500023372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 10:44:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1rf2RE-0007hY-SY; Tue, 27 Feb 2024 19:44:24 +0100
Message-ID: <c4869a3d88cd080082f5aec3cd13b9c57ab77a1e.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] kernel.bbclass: slightly fix wording, case, and
 spaces in version check
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 27 Feb 2024 19:44:23 +0100
In-Reply-To: <CADkTA4MJnWAKC=k=QMVGGLF5h-S3Oxq6sNcaHsafYb9NKHBFAw@mail.gmail.com>
References: <20240227170902.3718203-1-ejo@pengutronix.de>
	 <CADkTA4MJnWAKC=k=QMVGGLF5h-S3Oxq6sNcaHsafYb9NKHBFAw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196288

Am Dienstag, dem 27.02.2024 um 12:37 -0500 schrieb Bruce Ashfield:
> On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutron=
ix.de> wrote:
> >=20
> > * Version -> version
> > * match of kernel -> match the kernel
> > * Add missing spaces around "=3D" sign
>=20
> There's nothing technically wrong with the missing spaces. Putting the
> assignment in a recipe with or without the spaces should work.

Right, it's more about being consistent with the oe 'coding style' of assig=
ning variables =F0=9F=98=89

Enrico

> Bruce
>=20
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/classes-recipe/kernel.bbclass | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index 31e4a683d1..837064cef7 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -509,7 +509,7 @@ do_kernel_version_sanity_check() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=3D"${reg}${EXTRAVERSION}=
"
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -z `echo ${PV} | grep -=
E "${reg}"` ]; then
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bbfatal "Package Version (${PV}) does not match of kernel b=
eing built (${vers}).
> > Please update the PV variable to match the kernel source or set KERNEL_=
VERSION_SANITY_SKIP=3D\"1\"
> > in your recipe."
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bbfatal "Package version (${PV}) does not match the kernel =
being built
> > (${vers}). Please update the PV variable to match the kernel source or =
set
> > KERNEL_VERSION_SANITY_SKIP =3D \"1\" in your recipe."
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit 0
> > =C2=A0}
> > --
> > 2.39.2
> >=20
>=20
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

