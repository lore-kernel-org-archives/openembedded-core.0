Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2309CAC587
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 17:53:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14359.1757872424823995077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 10:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tLUhGXDq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB2BB4E405D6
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:53:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E11B6063F;
	Sun, 14 Sep 2025 17:53:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2C42102F29EC;
	Sun, 14 Sep 2025 19:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757872421; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gJwoEOPpmi9H4N8pUaGhagNoGt8JVV1AcCimuiaMo0o=;
	b=tLUhGXDqsNPcD79vc8tQDJjzaxn08NqIqdT7vBI5BnD7BV5BttDK3/Qlswo4cUkXRTMt+T
	w3mZY+tFwZeySfwo1UXPUM1ksdwDil+hAPd4/UWRAsuNEX6Iy3SfxPMOVqnfTE0LjqKsLh
	yq3SclzhvbGXK5cuTfDvhwNKKxvC+9PoDVY39vs9O3z7K08oA1/m87XD2glHzV6FOhKiEm
	poHY3RJKGRqGIlE8ujBis7YlzQ02vRhxDJgUQIoqwugavUF/HTaBTTOd6X8ozXF2jTwZSY
	xumAYwsOGXUhaG3mXFjjX90tNnzUTL3mhnuOXCZqIjhKyZnQFooX57qwYjKhAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 19:53:39 +0200
Message-Id: <DCSPRKWRDFBK.H6AT60ND74IR@bootlin.com>
Subject: Re: [OE-core] Patch pushed but don't see in the mailing list
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <emailaddress.ashish@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <7JR7.1757863849293272270.zxTQ@lists.openembedded.org>
In-Reply-To: <7JR7.1757863849293272270.zxTQ@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 17:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223366

On Sun Sep 14, 2025 at 5:30 PM CEST, Ashish Mishra via lists.openembedded.o=
rg wrote:
> Hi Team ,
>
> I have pushed an patch in meta-openembedded layer .
> But don't see it in mailing list .
> Can member please help me where should i look for the patch submitted and=
 whats the status
>
> Thanks ,
> Ashish
>

Hi Ashish,

I can see your message here:

https://lists.openembedded.org/g/openembedded-devel/message/119396

Maybe it had to be manually validated by a moderator?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


