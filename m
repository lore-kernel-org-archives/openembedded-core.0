Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF590ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:33:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.19018.1725960776549862259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1snxF0-0002YT-Vp; Tue, 10 Sep 2024 11:32:55 +0200
Message-ID: <8d745e695393fbc3f630328453ffc79c92930322.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox
 tools support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 10 Sep 2024 11:32:54 +0200
In-Reply-To: <CANNYZj9DVV7ak=KnfJhE9+H3sA9tputtgRz68yPuU=-KwS=50A@mail.gmail.com>
References: <20240910072006.3938401-1-ejo@pengutronix.de>
	 <20240910072006.3938401-3-ejo@pengutronix.de>
	 <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
	 <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
	 <CANNYZj8nzNzpGRqqSkYtKEuxu6hbBapNQSGkMh8HjRUVLb7GsA@mail.gmail.com>
	 <528047d8da240c9bc9833efca62d7728ee0d1dcc.camel@pengutronix.de>
	 <CANNYZj9DVV7ak=KnfJhE9+H3sA9tputtgRz68yPuU=-KwS=50A@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204346

Am Dienstag, dem 10.09.2024 um 11:22 +0200 schrieb Alexander Kanavin:
> On Tue, 10 Sept 2024 at 11:02, Enrico J=C3=B6rns <ejo@pengutronix.de> wro=
te:
> > My impression was that the actual amount of things to share would not j=
ustify another file.
> > It is mainly license information, SRC_URI and a bit of metadata where I=
 found it more obvious to
> > have them in the respective recipe.
> >=20
> > If having shared parts in a barebox-common.inc is actually preferable, =
I could rework this of
> > course.
>=20
> It is yes. They are the same between recipes, and so should be specified =
once.
>=20
> > > Also there should be a good DESCRIPTION in there. Why
> > > barebox, and not u-boot, for example?
> >=20
> > Trying to outdo other projects was not my intention.
> > So I would like to omit such comparisons from the description.

ok, will do.

> > My current summary:
> >=20
> > =C2=A0 "barebox is a bootloader designed for embedded systems.
> > =C2=A0 It runs on a variety of architectures including x86, ARM, MIPS, =
PowerPC and others."
> >=20
> > does not yet get the point of a bootloader?
> > I also thought that adding too much information would make the summary =
too long.
> > But in case something important is missing, I am open to further sugges=
tions.
>=20
> There's a SUMMARY (which is ok), but there's no DESCRIPTION, and they
> are two different texts. We do require a DESCRIPTION that contains a
> paragraph or two, with multiple sentences that properly introduce the
> project. You don't have to directly compare to u-boot, but you do need
> to highlight the best features and advantages of the component. Being
> terse or generic in DESCRIPTION is not a good thing, and no
> DESCRIPTION at all is even worse.

Sorry, maybe I got confused since the SUMMARY I had is as long as other rec=
ipes DESCRIPTION.
But you're right, it's not the same and the DESCRIPTION is missing.
My understanding so far was that SUMMARY is mandatory while DESCRIPTION isn=
't.
However having one is better than not having one.

I'll attempt to provide a more comprehensive DESCRIPTION.

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

