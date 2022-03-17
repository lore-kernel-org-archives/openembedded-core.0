Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74C5C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 10:51:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.8849.1647514262424224341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 03:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PzDmYLdY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9AAB3E000C;
	Thu, 17 Mar 2022 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647514260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sedskYjj3Q/Jh7xZkK2FBM8E4AOkq3/vecdW/MkjEyY=;
	b=PzDmYLdY1oMtadZ8JpGNzBZmpVqfzBDbaJts+hu3W0AwKa5W5xhB0Hsje+r8p+QFS5LzZw
	c8IhLs8LHFfBGA5mXn3+Z4fBaRPSqTr+4gUWnRVWIVJs0kvIBQO3iC2mrMA60OLSb0jMFg
	PqFtClxY4bvNrZQCfU1OcgE2qzePLiNsNXilpW0aIbhIHbeNe4IQS3EdPbKiolDBeNUrYJ
	bGcM58HKSwYik3+4Vv/iZ76nqK9TUKP+WzIffRxRNRCxdtw2lYJVCN4t3fT/6HP2ZQOiwG
	L/9IHl/JXno6svcja9zzKwjGtIHBbto5myW5DTn4uyYh5BgNpp89It6c3kcNgg==
Date: Thu, 17 Mar 2022 11:50:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: michael.opdenacker@bootlin.com
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patches sent to mailing lists: "From" attribute
 modified
Message-ID: <YjMSk+vkVU/mtE1k@piout.net>
References: <16DCF6055FEB6DC7.29979@lists.openembedded.org>
 <d54721ab-03a8-9c80-0445-17c7d76d6570@bootlin.com>
 <047880ea-a2dc-7778-3101-a3c887715513@theobroma-systems.com>
 <eedc4f00-a940-1672-ac00-db2d09023a4c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eedc4f00-a940-1672-ac00-db2d09023a4c@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 10:51:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163384

On 17/03/2022 11:01:12+0100, Michael Opdenacker via lists.openembedded.org wrote:
> Hi Quentin,
> 
> On 3/17/22 10:43, Quentin Schulz wrote:
> >
> > Maybe there's something you can do to configure git send-email to add
> > your
> >
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com"
> >
> > at the top of the mail. See my patches on the ML to see what I mean
> > exactly but that should make it nicer to maintainers because this From
> > will be used and not the one from the mailbox's from field.
> >
> > FWIW, I did nothing in the configuration of git to have this, it's
> > just that it probably detects that the sendemail.from config is
> > different from the commit author mail address and adds it.
> 
> 
> Thanks for the tip. It could work, as my early tests show a difference
> in the received e-mails.
> 

I couldn't convince git to do it since it thinks the sender matches the
author.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

