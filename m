Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D42C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 12:37:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.2574.1660912640762331804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 05:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oP1FV-0004Yc-PQ; Fri, 19 Aug 2022 14:37:17 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oP1FT-00068M-7N; Fri, 19 Aug 2022 14:37:15 +0200
Message-ID: <c9809db464e0d3d47c290b25d4fb1a1b84d448ac.camel@pengutronix.de>
Subject: Re: [OE-core][PATCH 2/2] openssh: add support for config snippet
 includes to ssh and sshd
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2022 14:37:14 +0200
In-Reply-To: <fbcb8ef91eb74bcc883dc6e5d4924251@axis.com>
References: <20220818111703.1858-1-jlu@pengutronix.de>
	 <20220818111703.1858-2-jlu@pengutronix.de>
	 <CAMKF1spo5nbjvHpxsyff3_dv7Da7a0YP-vkSLXg16D1jHmS78w@mail.gmail.com>
	 <fbcb8ef91eb74bcc883dc6e5d4924251@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 12:37:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169625

On Fri, 2022-08-19 at 09:57 +0000, Peter Kjellerstedt wrote:
> > > +Include /etc/ssh/ssh_config.d/*.conf
> > > +
> > Generally looks ok.
> > I wonder if this increases security concerns with such blanket includes=
.
>=20
> If you have the permissions to add a file to /etc/ssh/ssh_config.d or=20
> /etc/ssh/sshd_config.d, you could just as well modify /etc/ssh/ssh_config=
=20
> or /etc/ssh/sshd_config directly.

This was my thinking as well.

Thanks,
Jan
--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

