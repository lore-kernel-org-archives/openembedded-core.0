Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4269C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 07:45:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.17057.1653551092404374860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 00:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hxF66VYd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E25C6000B;
	Thu, 26 May 2022 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653551090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blq6PcevvcVja+OL4IhuFBNpN+h77aVqxcArVvtIjJ4=;
	b=hxF66VYdXZS3dfJR635IzmUJJop5qc84YbQ7fole0fQGZZcYXZvdzpzl1083YAvzWg+boO
	sNJGQ9W6Vsi7oVdQerxJ2P79aZoIuVm/wKBDfg2piOZ3oMOeYQY4rRQ2OJpoczAciIy5e9
	JSMLwLdgO2UrfVDex6eGrToK57oIS2mzYG8F6yo+YqDNBIVSlrQ49yiZ6VQ299GPqL+1H9
	s2dKzvYBqKyZMpCyFGfsU9TIBuTUMXCnFlccvNTsglf98gNlsSV5pIm4mPkrl324W1AmJj
	STgpHpxsV5fAdm1Bp8Yu7SlD4t+fv8j1/HBSepOfyBfeHcAGRSf/uZlQp3kJcw==
Date: Thu, 26 May 2022 09:44:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] apt: fix upstream version check
Message-ID: <20220526094447.0a0a20d1@melee>
In-Reply-To: 
 <CANNYZj-1wyTZH5Qk3jNHvuH=qWne9MML712sCTvCwg+J0ubcUg@mail.gmail.com>
References: <20220524173622.4033177-1-alex@linutronix.de>
	<20220525102904.016e5c61@melee>
	<CANNYZj-1wyTZH5Qk3jNHvuH=qWne9MML712sCTvCwg+J0ubcUg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 07:45:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166177

Hi Alex,

Il giorno Wed, 25 May 2022 13:01:23 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:

> I haven=E2=80=99t seen it written explicitly, it comes from what stable D=
ebian
> releases actually carry. There=E2=80=99s no harm in having a check that=
=E2=80=99s too
> strict, but there is harm in updating to versions that are actually
> intended for testing or unstable (and that=E2=80=99s what 2.4 is).

Ok, thanks for the clarification!

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

