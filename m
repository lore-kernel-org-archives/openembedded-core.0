Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FF7C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 13:55:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.30259.1737899728069446121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 05:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tc36j-0004K3-KS; Sun, 26 Jan 2025 14:55:25 +0100
Message-ID: <ebabf07076b20daabada527f80c311682f00200c.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH] barebox: upgrade 2024.12.0 -> 2025.01.0
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Date: Sun, 26 Jan 2025 14:55:23 +0100
In-Reply-To: <a282345831eaa176310242c5784aaff11e030ce5.camel@linuxfoundation.org>
References: <20250125213518.294656-1-ejo@pengutronix.de>
	 <a282345831eaa176310242c5784aaff11e030ce5.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210291

Am Sonntag, dem 26.01.2025 um 11:25 +0000 schrieb Richard Purdie:
> On Sat, 2025-01-25 at 22:35 +0100, Enrico J=C3=B6rns via lists.openembedd=
ed.org wrote:
> > Changes:
> >=20
> > * Added LLVM/Clang support for the sandbox architecture.
> > * Enabled command execution from the sandbox command line.
> > * Improved TFTP with dentry caching and default window size set to 1.
> > * Introduced hardening features: register zeroing, stack variable
> > =C2=A0 initialization, and malloc buffer zeroing.
> > * Enhanced AM625 support with network support, watchdog driver, and
> > =C2=A0 bootsource detection.
> >=20
> > Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutroni=
x.de/T/#u
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Thanks for the upgrade. Unfortunately it ran into issues with musl:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/897/ste=
ps/11/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/913/ste=
ps/11/logs/stdio

Thanks for testing!

I probably should add musl to my pre-flight checklist.. =F0=9F=99=82
I could quickly reproduce this here and will come with a v2 once fixed.

Regards, Enrico

> Cheers,
>=20
> Richard
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

