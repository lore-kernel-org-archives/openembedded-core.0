Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1B2D13570
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:36:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.47009.1730104571949539970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5LEP-0001g7-VQ; Mon, 28 Oct 2024 09:36:10 +0100
Message-ID: <8f68fb2392b694e5ff98a549f60e59c4cd9cc960.camel@pengutronix.de>
Subject: Re: [OE-core] [yocto] [PATCH 0/9] busybox: cleanup and fix config 
 fragments
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andrej
	 <andrej.v@skyrain.eu>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2024 09:36:09 +0100
In-Reply-To: <3aa923c643b7536db0280c02df6f4fd69e5c9657.camel@linuxfoundation.org>
References: 
	=?iso-8859-1?q?=3C20241007120950=2E975803=2D1=2Dejo=40pengutronix=2Ed?= =?iso-8859-1?q?e=3E_=3C86710f995a94387b6246fca883d5669acef032dd=2Ecam?= =?iso-8859-1?q?el=40pengutronix=2Ede=3E_=3Ca30ee7e5=2Dbc6c=2D4490=2D9?= =?iso-8859-1?q?c10=2D2972138051b5=40skyrain=2Eeu=3E_=3C0eff54fc7c7be4?= =?iso-8859-1?q?f7d5ea956d7209a2a93fa0aca4=2Ecamel=40linuxfoundation?= =?iso-8859-1?q?=2Eorg=3E?= <SLX9SS$38183D9630E103129BF22210DCF67086@skyrain.eu>
	 <3aa923c643b7536db0280c02df6f4fd69e5c9657.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206436

Hi Andrej, Hi Richard,

Am Freitag, dem 25.10.2024 um 19:07 +0100 schrieb Richard Purdie:
> On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
> > Ok, I was thinking that it was done by intention, but it happened 14y
> > ago=C2=A0
> > https://github.com/openembedded/openembedded-core/commit/615a98ed9a02
> > 1da245513790c064761a0a5a67e9 . So I guess not.=C2=A0

I am not sure if I fully understand what you are referring to here.
Could you provide some details about what happened there?
OE didn't have those fragments 14y ago I guess.

> > Enrico, no=C2=A0
> > =C2=A0problem, most=C2=A0of them could by integrated into defconfig. Pl=
ease
> > squash it into one commit if you're going to do it. Or let me know
> > and I will take a care of it=C2=A0;).=C2=A0
>=20
> In many ways I prefer having multiple changes showing an evolution as
> those patches do, it does make review easier.

Thanks Richard for stepping in! I've rebased and revised my patches now and=
 sent a v2.

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

