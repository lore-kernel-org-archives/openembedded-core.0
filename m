Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C87DC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 16:21:53 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.3004.1633450911700131136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 09:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5E80C100004;
	Tue,  5 Oct 2021 16:21:48 +0000 (UTC)
Date: Tue, 5 Oct 2021 18:21:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] Rust oe-selftest file
Message-ID: <YVx7m1AFrSsNGtAW@piout.net>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
 <20210929080448.16224-3-pgowda.cve@gmail.com>
 <YVTv6yOlPK6LmW5d@piout.net>
 <CALY4987_k43oqQKiGP0Znf9FYaJ50YzpQqejBbqUvvObqhxdXA@mail.gmail.com>
 <e2ff8b3f-a9e1-00f6-7536-3bb8712fad84@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2ff8b3f-a9e1-00f6-7536-3bb8712fad84@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 16:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156651

On 05/10/2021 12:13:56-0400, Randy MacLeod wrote:
> On 2021-09-30 12:31 a.m., Pgowda wrote:
> > Hi Alexandre,
> > 
> > Thanks for mentioning it.
> > 
> > It's already been taken care of as the following patch:-
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=50f7a13e69e8987b3629d455f9f56720c376e89b
> 
> Hi Naveen,
> 
> That link is for a commit in master-next that is no longer valid.
> I guess you should send a v3.
> 

That's fine, I'm also carrying the patch in kirkstone-next now


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

