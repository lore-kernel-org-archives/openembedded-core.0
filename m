Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADB4E937EA
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 15:31:27 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.247904.1776007877758379587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 08:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F0UttoZZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6FAB9C5B18C;
	Sun, 12 Apr 2026 15:31:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 228DF5FFB9;
	Sun, 12 Apr 2026 15:31:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DACA10451B68;
	Sun, 12 Apr 2026 17:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776007874; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h6pOi9j5sBJr/m/kl62LGHYw3yAIwnZmJrgsvrWx3eo=;
	b=F0UttoZZz2iJfGy51ATx0w6s4mkJMlBxvlCYJl1n8r8NwCyWVpO/JOUufECn2o89DUF3LG
	rDsHcrqwsGPZZEhR2SGmKpgMmrK+wqguZdoRcV8S0jKhA1+sms7/SoZ8R1kha6LeYgY1XA
	aWXupZbHnVZHIuUmgLex3a1z/3vx2tdtlH0awWWBWHT0IJFdS15df7ryhnW1IFiHeJ7rjx
	rvkXCyq8SypYDAu2nixQ43xJT7xBQgyWNuejGvl+rmw40ZadX2huIR7kBGvFMddaX3nyzt
	WCEw7jl/3f6no3ULIdaXhpRiGCWQhtXcGs8+xTqxmsLWh07dYMd9O8Nz/C95IQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Apr 2026 17:31:12 +0200
Message-Id: <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com>
Subject: Re: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 15:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235070

On Fri Apr 10, 2026 at 12:28 PM CEST, Mingyu Wang (Fujitsu) wrote:
> I have sent a v2 patch of lttng-ust to fix this ptest error.

Thanks, but I believe the errors are still present:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3471
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3494

Also, we got some reproducibility error:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3813
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260412-qjuiol67/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


