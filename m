Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CCBE77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 13:33:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.105476.1734528776186752304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 05:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tNuAX-00046r-C7; Wed, 18 Dec 2024 14:32:53 +0100
Message-ID: <78b6f77c2eab6007ab888ac973d4997bf144aa46.camel@pengutronix.de>
Subject: Re: [PATCH v9 0/7] Add barebox bootloader support (and testing)
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: a.fatoum@pengutronix.de, alex.kanavin@gmail.com, 
 openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org,  yocto@pengutronix.de
Date: Wed, 18 Dec 2024 14:32:53 +0100
In-Reply-To: <D68XQU2RSZ0C.2V137AIRTE2ZN@bootlin.com>
References: <D68XQU2RSZ0C.2V137AIRTE2ZN@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208871

Hi Antonin,

Am Mittwoch, dem 11.12.2024 um 15:19 +0100 schrieb Antonin Godard:
> Hello Enrico,
>=20
> Since this patch series introduces a new class for compiling barebox-base=
d
> bootloaders, it would be nice to have some documentation for it.
>=20
> Openembedded-core classes are documented in yocto-docs[1], and documentat=
ion
> patches are sent to docs@lists.yoctoproject.org.
>=20
> Could anyone, preferably the author of the class, take some time to docum=
ent the
> usage of the class in yocto-docs/documentation/ref-manual/classes.rst, an=
d the
> variables the class defines (especially the ones that can be overridden f=
or user
> customization) in yocto-docs/documentation/ref-manual/variables.rst?

thank you for reaching out regarding the documentation of the barebox.bbcla=
ss.

I was on vacation last week and still have some year-end tasks to take care=
 of
this week, so I'm not sure how soon I'll get to it.
However, I=E2=80=99m happy to contribute the corresponding class documentat=
ion.

> That would be greatly appreciated. I can help if needed.

Thanks a lot! I'll get back to you in case something is unclear (e.g. where=
 to put which
information). Luckily all the documentation is rst which I am quite familia=
r with =F0=9F=99=82.

For now I've checked out the repo and added a barebox section header in cla=
sses.rst --
just to give myself the impression of having started already =F0=9F=98=89.


Regards,
Enrico

> [1]: https://git.yoctoproject.org/yocto-docs
>=20
> Regards,
> Antonin
>=20
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
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

