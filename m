Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C0EC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 16:17:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.13980.1642695443383189808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 08:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 475CB1BF211;
	Thu, 20 Jan 2022 16:17:20 +0000 (UTC)
Date: Thu, 20 Jan 2022 17:17:18 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 thomas.petazzoni@bootlin.com, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH] icu: fix make_icudata dependencies
Message-ID: <20220120171718.4c5b03a7@kmaincent-XPS-13-7390>
In-Reply-To: 
 <CANNYZj-oOAz2A_2v8ysopd_TaZA8qM42hhZbgutA1AO5qi90_g@mail.gmail.com>
References: <20220120143242.35930-1-kory.maincent@bootlin.com>
	<CANNYZj8iOcC6TLkOW2Bt6G+Ey=h5zwxrEUNQC8E7v8yXz0GFpg@mail.gmail.com>
	<20220120160339.4f21c216@kmaincent-XPS-13-7390>
	<CANNYZj-oOAz2A_2v8ysopd_TaZA8qM42hhZbgutA1AO5qi90_g@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 16:17:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160771

On Thu, 20 Jan 2022 16:09:25 +0100
Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> > Could you be more explicit or use an example?
> > =20
>=20
> I think you need something like
>=20
> do_make_icudata[deptask] =3D "do_prepare_recipe_sysroot"

Oh, I didn't know this deptask flag, thanks to point me this out.
I will send a v2 with this.

K=C3=B6ry

