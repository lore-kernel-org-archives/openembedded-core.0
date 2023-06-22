Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC6CEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:25:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.16125.1687451106364814489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k/AiQse/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687451104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Kl2/A43Ef+kmCrwQE15jj0gvu6ThTlL02bFXIWPz1I=;
	b=k/AiQse/rDoKUjfZAb67uLjHPX2po7oiY/mGNkyu7T7iHujeDJRMyEcfey4l3Du/Ch8HEd
	5tj2n0h9pZCVfqt5NAZGTkfti049RsIXq+Q/zHXl3hunJh0oyissU/7yaI17v6cCXVJkpk
	fVeK/B/nVMCEtyBKMSayDpm3DgbmFwPy2zUroZsqJ9PZffxea+TUl5jqs4aDg0UuU/WvkQ
	/EzUOrdqClcjUI1orPV5FzpYiF5aCKLOpKXb2ju5XrzZa1HYmoKch8dZRZhdQrU0538c9z
	NS0Z//1CgEqmKbymzl8qOLuKKaRCEEGmcY6qG57K4kDOXyMQQr5gCQ4beugsgw==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F1876000F;
	Thu, 22 Jun 2023 16:25:03 +0000 (UTC)
Date: Thu, 22 Jun 2023 18:24:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Andrej Valek via lists.openembedded.org"
 <andrej.valek=siemens.com@lists.openembedded.org>
Cc: andrej.valek@siemens.com, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Message-ID: <20230622182459.42ba0f28@booty>
In-Reply-To: <c343089e30ebe6f364567b2c1f164f7f9fb9f612.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	<20230622065914.37448-1-andrej.valek@siemens.com>
	<20230622144216.18783d4b@booty>
	<66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
	<20230622155536.505adb2d@booty>
	<ca57036152c436519f92e8d64e3e843c330a3d54.camel@siemens.com>
	<c343089e30ebe6f364567b2c1f164f7f9fb9f612.camel@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183267

Hello Andrej,

On Thu, 22 Jun 2023 14:07:41 +0000
"Andrej Valek via lists.openembedded.org"
<andrej.valek=3Dsiemens.com@lists.openembedded.org> wrote:

> OK,
>=20
> Now I know what's the problem. SPDX are being created without inheriting =
the
> cve-check class.
>=20
> Regards,
> Andrej
>=20
> On Thu, 2023-06-22 at 15:59 +0200, Valek Andrej wrote:
> > Hello Luca,
> >=20
> > I wanted to check the logs, but it requires a login/password. Would it =
be
> > possible to send a link where is not required? Maybe here
> > https://autobuilder.yoctoproject.org/typhoon/#/=C2=A0?

Ouch, sorry about that! Apparently you already found the root cause,
however here is the a-full build public link, in case it were still
useful:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5505

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

