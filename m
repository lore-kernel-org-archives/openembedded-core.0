Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1A9C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 22:56:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.532.1670367405291171746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 14:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jbRzTxt0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C6331BF206;
	Tue,  6 Dec 2022 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670367403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wRFaDre4IPgTlE5vnW4MEP2vc3I1r4Lm6wvwamWNJT0=;
	b=jbRzTxt0+588lPuxOiPrn0mY6MuXB9BgyxBxsgXDL9gOuMFRNVVAVAuQE774omO1ymarU0
	nUy3RDfgqOr551TN1IbfdiMkzreyY/+mwsXVs92pIThMqORMe2FXmdTznPUc2FW2jwNNsY
	R3YZu/9PwYu1T3itg3SY/EqYceLkx/yc2sZdjjTS4sTt/LGBlfpzig7muLZQ4GJmD8Q0Ak
	mBpyA8ET4ROOxKOX8KVNAW93Oix/kkkLe1dvoZGThPiya5jgsrd5WN6oSanjPpoRdxB5wV
	86uFFL9XBiYHxAMeNIEgOwxZE9CO7vjwh1ZZCzdM3tDDtY6qjwwRBTCjT9mySA==
Date: Tue, 6 Dec 2022 23:56:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] oeqa/selftest/externalsrc: add test for
 srctree_hash_files
Message-ID: <Y4/Iqlq3IE+xAy/J@mail.local>
References: <20221205213815.460409-1-peter.marko@siemens.com>
 <Y4+ePE1/BGRK5j1D@mail.local>
 <AS1PR10MB56978A28C5EB19FD9C927635FD1B9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR10MB56978A28C5EB19FD9C927635FD1B9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 22:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174334

On 06/12/2022 22:07:13+0000, Peter Marko wrote:
> > Hello,
> > The submodule test fails on the autobuilders:
> 
> Sure, that's the point of a test - fail if issue is not fixed and pass when the issue is fixed.
> Queue this together with https://lists.openembedded.org/g/openembedded-core/message/174061.
> Ross asked me to provide a test for it - https://lists.openembedded.org/g/openembedded-core/message/174286
> Should I resend as a series of will you try these together?

I'll queue both together, thanks!

> 
> Regards,
>   Peter
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174332): https://lists.openembedded.org/g/openembedded-core/message/174332
> Mute This Topic: https://lists.openembedded.org/mt/95479820/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

