Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B06EE49B8
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 23:08:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.37056.1693955313945110975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 16:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yip39tzy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD261BF204;
	Tue,  5 Sep 2023 23:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693955312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5dg/AeJ1aiZtwszDixKScDZDiDzEkFUZbAlcs+T7Do=;
	b=Yip39tzyza20Msy9IPqNYimJuy1iNqH9dUgatdIV0hv6wrHQLS8IftuWH77Z4G7wpFUyWz
	ldig4JQhOBJ+UtaRU/uNtkdk9xT8Mj45VFlceZyWcrAc6ElQEyNE1Z45+5J+h3dZa3iIvz
	I/hZct6Tfz/ftfehG9qWnUKeNej5pPnzcCiakUIFdETWwUfTd8NvM5ARAei8wC5nOiYjEq
	B7tP+QtJ7tnEi13oaEE4cu77G5SxCtJG/KAXIl98kepzUKuwnydeSJcVjPBwQB4xNlmmR5
	LUzXgAe9SnQWORmcNnSEf+449BYFhPvnT8S3IyTcQlII4PxXX/WBuuwKF3SKSw==
Date: Wed, 6 Sep 2023 01:08:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-firmware: add firmware files for NXP BT
 chipsets
Message-ID: <20230905230830dd3380ae@mail.local>
References: <29102.1693310912640920508@lists.openembedded.org>
 <24144.1693935708896928880@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24144.1693935708896928880@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 23:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187257

On 05/09/2023 10:41:48-0700, Tom Hochstein wrote:
> On Tue, Aug 29, 2023 at 05:08 AM, Tom Hochstein wrote:
> 
> > 
> > On Fri, Aug 25, 2023 at 07:37 AM, Tom Hochstein wrote:
> > 
> >> Please hold off on this. The -common design is not working correctly and
> >> is causing those firmware packages to be registered as a runtime
> >> dependency of the main package.
> > 
> > 
> > 
> > Actually, the -common design is working fine, there was just a
> > misunderstanding.
> > 
> > Please do consider this patch as-is.
> > 
> > Tom
> > 
> > 
> > 
> 
> Ping

Please rebase and submit v2

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187250): https://lists.openembedded.org/g/openembedded-core/message/187250
> Mute This Topic: https://lists.openembedded.org/mt/100943055/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

