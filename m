Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33F8C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 15:12:57 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.6161.1652886772178793100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 08:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h7+HiV6p;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 513FF200004;
	Wed, 18 May 2022 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652886769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ksql7pyhzhJjsJgIG94BIFMsfSDqXd1ic2YPQaXA3no=;
	b=h7+HiV6pLrxG7Pky1uFnU1+w+NJ7vioSjHzFRb68bjroOpda42eJVF7d3y87gY7Egqdk31
	OY5CUsxBI1DzWXCKNdlg5Wn5sXnyg8P7XPfi0RBddv+bszHkw0xMJ/BMHpFh9X2niColbX
	M1D1DE+OAV1Pu+K3Ql60Sa5l+ZSy0Gc7lpDjGhlww6ZkP8Ytd+3M37zZgAji2LHH++xFD+
	DPkeU6mFTmMhwWyCUuEJrWZw5Wu/7ZV1XK+thdTOrQ0czolhS8WJ/+Yd6KzUAfHA2raVEa
	OFiaphgX3VyeGn9KdeIwZEQ6r8SO2jLx2nlFzyxhLyajrMSYyjHwvsiGzNRd4Q==
Date: Wed, 18 May 2022 17:12:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "mangodan2003" <mangodan2003@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gstreamer: updated to 1.20.2 bug fix release
Message-ID: <20220518171247.2a7d0ab5@melee>
In-Reply-To: <20220518123723.134317-1-mangodan2003@gmail.com>
References: <20220518123723.134317-1-mangodan2003@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 15:12:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165855

Hi mangodan2003,

Il giorno Wed, 18 May 2022 13:37:23 +0100
"mangodan2003" <mangodan2003@gmail.com> ha scritto:

> The second 1.20 bug-fix release (1.20.2) was released on 2 May 2022.
> This release only contains bugfixes and it should be safe to update
> from 1.20.x.
> 
> Signed-off-by: mangodan2003 <mangodan2003@gmail.com>

Alexander Kanavin sent a series of patches doing the same upgrades as
you did, and I already have those in my testing branch, so I'm not
taking this one.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

