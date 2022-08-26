Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB05ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 13:30:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.37218.1661520613094237059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 06:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IxHBr4Pc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 48847C0013;
	Fri, 26 Aug 2022 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661520610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKBty+U+oDOtBYr6Sg1ugW00umSHWuMA0FD5O3IDbVA=;
	b=IxHBr4PcrebQNJBv92ZoEfqsOZfPt0SOHuhWBWiaURQpbg9bHXzZKBPtMlEP8qcB+q5b0b
	uF2cIPjLrvzBmbqlk58Q/49nGFSQS99Pv+1k0wAxAgJZpnoi1X+Q8/Jcm4bRGKJHUXah6f
	Hw3IR3Yr9xxh2HlvnMN3ERvO//GszwU3vqliNh2x0xVommgQbUZZy9bCd58C1SDGe9VrR/
	Gch/g4ZtNhVzrHeWPPIQsbpkJB0rLsdxlHs2GJ+oJozoNtv8MXeONNKY1OGCR4iQhPlXAu
	pAL6rd92MztI1Bt/eNrwwibDv8PCxPPvrR2cB6+ni+CAaPgCkNBbXBkjj5sWKg==
Date: Fri, 26 Aug 2022 15:30:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Tomi Belan" <tomi.belan@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util: Fix resolving relative
 paths from "/"
Message-ID: <20220826153009.3c20a5cf@booty>
In-Reply-To: 
 <CACUV5oe6k9MLOGatqE4xC9TkB6sFb8FeG9qxs4F2ERyr_Upqrg@mail.gmail.com>
References: <20220824165136.11510-1-tomi.belan@gmail.com>
	<20220824223956.75729556@booty>
	<CACUV5oe6k9MLOGatqE4xC9TkB6sFb8FeG9qxs4F2ERyr_Upqrg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 13:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169917

Hi Tomi,

On Wed, 24 Aug 2022 23:09:51 +0200
"Tomi Belan" <tomi.belan@gmail.com> wrote:

> On Wed, Aug 24, 2022 at 10:40 PM Luca Ceresoli
> <luca.ceresoli@bootlin.com> wrote:
> > > canonical and yet starts with a slash. This happens when pseudo_cwd is "/" or  
> >                     ^^^^^^
> > starts -> ends?  
> 
> Oops, yes, of course. Good catch.
> 
> Should I send a v2 patch? :)

No need. Richard already took your patch and fixed the message. It's
currently in the oe-core-next branch:
https://git.yoctoproject.org/pseudo/log/?h=oe-core-next

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

