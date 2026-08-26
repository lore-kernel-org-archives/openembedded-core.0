Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE91C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 15:40:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15541.1787758794473490944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 08:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xSwxne6t;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 32AE34E413C6
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 15:39:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0766B604EC;
	Wed, 26 Aug 2026 15:39:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A71EF11C7833D;
	Wed, 26 Aug 2026 17:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787758787; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wPXIPgfmDM1wJCSrZndtpt4Y5oELRoHeJZE+L7Bo5fI=;
	b=xSwxne6tm75QG9ZfDUKxaOOS/HxdbNUfRTW8WS/jMsUMICw4aifjeMf3p6T/VI5xoTNSC/
	Z3e3aFyNn7D+I65cA20lAoX+AjRJhtiewWWy434Dz6x/lWaRio2a/nEN3yELAVwRIbE2oi
	Fyft1Hzo5SCWIGfEsIxIN0MHYoyV7V/NFUuTPy4d8AB1cgB7S+X0wASmWKeuUy9wP30GIE
	aTU8VVkZ/B/MgKmFZGsjcMURwVq9LDYxhS+7TApzYC3e3Tl1yt/QilcrdUbhDG3lFA7zXb
	g8UOd16vHgYzomSdQ7a6nFSEe00mrJrceSgOMsqrW4m47S9VZjlCEf9XZfpglA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 17:39:45 +0200
Message-Id: <DKYZLKBDD33Q.2509B8K2Q6MXG@bootlin.com>
Subject: Re: [OE-core] [PATCH 12/17] pango: upgrade 1.58.0 -> 1.58.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826081832.1059-1-wangmy@fujitsu.com>
 <20260826081832.1059-5-wangmy@fujitsu.com>
In-Reply-To: <20260826081832.1059-5-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 15:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244403

On Wed Aug 26, 2026 at 10:18 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

I suspect this is breaking librsvg ptests:

Failed ptests:
{'librsvg': ['/usr/lib/librsvg/ptest/reference-71fe336c834bf264']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4399

ptest outputs can be found here:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4399

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


