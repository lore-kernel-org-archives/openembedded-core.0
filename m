Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA9ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:41:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18018.1725957662738247241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 01:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snwQm-0003ol-Gl; Tue, 10 Sep 2024 10:41:00 +0200
Message-ID: <2829390b5653eb5fc56f3434cc17d69ca0f67ecf.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v4 1/7] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 10 Sep 2024 10:41:00 +0200
In-Reply-To: <CANNYZj98uy30C3Tj_K4wkipPJVGt1NDnH+AyUamWsjGGdsXR3w@mail.gmail.com>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
	 <20240910072006.3938401-2-ejo@pengutronix.de>
	 <CANNYZj98uy30C3Tj_K4wkipPJVGt1NDnH+AyUamWsjGGdsXR3w@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204341

Hi Alex,

Am Dienstag, dem 10.09.2024 um 10:33 +0200 schrieb Alexander Kanavin:
> On Tue, 10 Sept 2024 at 09:21, Enrico J=C3=B6rns via lists.openembedded.o=
rg
> <ejo=3Dpengutronix.de@lists.openembedded.org> wrote:
> > +PACKAGECONFIG[openssl] =3D ",,openssl-native"
> > +PACKAGECONFIG[libusb] =3D ",,libusb1-native"
> > +PACKAGECONFIG[fit] =3D ",,u-boot-tools-native dtc-native"
>=20
> Does barebox have configuration options for these? The problem with
> auto-detection is that one can't reliably keep this options disabled,
> as openssl etc. can show up in native sysroot for other reasons.

this should not be a problem since dependencies are only required for some =
SoC-specific tooling.
And this would just fail to compile if the option is accidentally disabled.

I chose to use packageconfig here to reflect that these are not a hard depe=
ndencies for all cases
and to aligned with what the u-boot recipe does for similar reasons.

Regards, Enrico

> Alex
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

