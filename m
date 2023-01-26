Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F66C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:21:54 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.77981.1674750107457087994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mtIHzFEP;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BEEB10000C;
	Thu, 26 Jan 2023 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674750105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFmxJ+qE7WH9crdQ0zRxQKu85K0GkZiQjM+GjNiLHR0=;
	b=mtIHzFEPKjYJ1kjvqtAM/gRZX9qj6xU24Vve1HI0kok5SqOhEtGLia6vZM0ckhJ0P61fuE
	6Uz7uv9U08pKoeO7jAu5pAKqTRBWc2Lu3AyGZflOyRu8OV4oz6mC0kP8xQAfcbr9UGBWcP
	NjoywPupDvDkZwizj498fKdFOwOd3rDQv7uVYRk0gN17LiY8eY/6tqtMKDFrVSiC+dStZT
	oDN1OoYe0V1DQ32xt6RktmNryXwOFHMSilEtHT2V4t8L0yNywxZq9Nv9VeD3AnxfXnKBtF
	PBlrWOtl5/BIQe5XbwDTlb1+JgwKmuxPARXmyBiG3isKGWt13rm6PzL6fXd7nQ==
Date: Thu, 26 Jan 2023 17:21:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
Message-ID: <Y9Kol1jla2OQMzOa@mail.local>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176404

On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > 
> > Richard,
> > 
> > As promised, here are the commits to switch us over to 6.1 as the
> > default.
> > 
> > I'll also send a series for poky to bump things there as well.
> > 
> > Also, if there are any significant problems, we'll just shelve this
> > while I look at any issues. But at this point, it is worth getting
> > the patches out there to move the needle to 6.1
> 
> Thanks!
> 
> I think the issues are:
> 
> a) two selftest failures:
> 
>   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual_kernel_modify
>   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> 
> b) meta-arm issues
> 
> c) meta-virt issue (which you have a patch pending for in -next)
> 

Unfortunately, I have to add

d) perf reproducibility issues:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2294/steps/13/logs/stdio

> I suspect we can switch poky-tiny and defer the removal patches for a
> few days to give meta-arm time to sort itself out. The only question
> then becomes the selftest issues. I'm taking a quick look to see if
> they're simple to sort.
> 
> Cheers,
> 
> Richard

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176392): https://lists.openembedded.org/g/openembedded-core/message/176392
> Mute This Topic: https://lists.openembedded.org/mt/96508797/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

