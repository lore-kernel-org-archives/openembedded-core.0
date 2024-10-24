Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2180CE8E72
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 13:04:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.14014.1729775067801979672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 06:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t3xVp-0003X2-LG; Thu, 24 Oct 2024 15:04:25 +0200
Message-ID: <86710f995a94387b6246fca883d5669acef032dd.camel@pengutronix.de>
Subject: Re: [yocto] [PATCH 0/9] busybox: cleanup and fix config fragments
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org, Andrej Valek
 <andrej.v@skyrain.eu>
Cc: yocto@pengutronix.de
Date: Thu, 24 Oct 2024 15:04:25 +0200
In-Reply-To: <20241007120950.975803-1-ejo@pengutronix.de>
References: <20241007120950.975803-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 13:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206296

Am Montag, dem 07.10.2024 um 14:09 +0200 schrieb Enrico J=C3=B6rns:

[TO +=3D Andrej Valek <andrej.v@skyrain.eu>]

> Most of the busybox config fragments are useless since the respective opt=
ions
> were accidentally enabled in the 'defconfig' file during the defconfig up=
date
> to busybox 1.33.0 [1].
>=20
> This is redundant and confusing and takes the ability to disable options =
by
> removing the respective fragment file from the SRC_URI.
>=20
> While cleaning this up, some other inconsistencies were found and fixed.
>=20
> The series starts with a defconfig sync to the current defaults to have a=
 clear
> base to work on.
>=20
> [1] 4335cd24 ("busybox: refresh the defconfig from 1.33.0")
>=20
>=20
> Enrico J=C3=B6rns (9):
> =C2=A0 busybox: sync config for busybox 1.36.1
> =C2=A0 busybox: disable defconfig options from simpler fragments
> =C2=A0 busybox: disable defconfig options from syslogd.cfg
> =C2=A0 busybox: mdev.cfg: remove CONFIG_SETSID
> =C2=A0 busybox: disable defconfig options from login-utilities.cfg
> =C2=A0 busybox: disable defconfig options from unicode.cfg
> =C2=A0 busybox: getopts.cfg: disable long options
> =C2=A0 busybox: disable long options in defconfig and fix longopts.cfg
> =C2=A0 busybox: disable defconfig options from mount-via-label.cfg
>=20
> =C2=A0meta/recipes-core/busybox/busybox/defconfig=C2=A0=C2=A0 | 124 +++++=
++++---------
> =C2=A0meta/recipes-core/busybox/busybox/getopts.cfg |=C2=A0=C2=A0 2 -
> =C2=A0.../recipes-core/busybox/busybox/longopts.cfg |=C2=A0 11 +-
> =C2=A0meta/recipes-core/busybox/busybox/mdev.cfg=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 -
> =C2=A04 files changed, 68 insertions(+), 70 deletions(-)
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

