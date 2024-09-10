Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C5FECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:02:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18316.1725958969139867746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snwlr-0004af-JV; Tue, 10 Sep 2024 11:02:47 +0200
Message-ID: <528047d8da240c9bc9833efca62d7728ee0d1dcc.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox
 tools support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 10 Sep 2024 11:02:46 +0200
In-Reply-To: <CANNYZj8nzNzpGRqqSkYtKEuxu6hbBapNQSGkMh8HjRUVLb7GsA@mail.gmail.com>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
	 <20240910072006.3938401-3-ejo@pengutronix.de>
	 <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
	 <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
	 <CANNYZj8nzNzpGRqqSkYtKEuxu6hbBapNQSGkMh8HjRUVLb7GsA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204344

Am Dienstag, dem 10.09.2024 um 10:49 +0200 schrieb Alexander Kanavin:
> On Tue, 10 Sept 2024 at 10:45, Enrico J=C3=B6rns <ejo@pengutronix.de> wro=
te:
> > > Can this be merged into the main barebox recipe? Does it need a separ=
ate recipe?
> >=20
> > not only that it would complicate the main recipe (we had tried this be=
fore), but I really see
> > no
> > point in doing and supporting barebox native builds (in contrast to bar=
ebox-tools).
> >=20
> > And some of these tools might also be useful without using barebox.
> >=20
> > I guess u-boot-tools is separate for similar reasons.
>=20
> Then you should put the common bits into barebox-common.inc, same as
> u-boot does.

My impression was that the actual amount of things to share would not justi=
fy another file.
It is mainly license information, SRC_URI and a bit of metadata where I fou=
nd it more obvious to
have them in the respective recipe.

If having shared parts in a barebox-common.inc is actually preferable, I co=
uld rework this of
course.

> Also there should be a good DESCRIPTION in there. Why
> barebox, and not u-boot, for example?

Trying to outdo other projects was not my intention.
So I would like to omit such comparisons from the description.

My current summary:

  "barebox is a bootloader designed for embedded systems.
  It runs on a variety of architectures including x86, ARM, MIPS, PowerPC a=
nd others."

does not yet get the point of a bootloader?
I also thought that adding too much information would make the summary too =
long.
But in case something important is missing, I am open to further suggestion=
s.


Thanks in advance an best regards

Enrico

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

