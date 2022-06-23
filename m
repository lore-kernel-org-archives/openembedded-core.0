Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FACC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 08:41:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.5115.1655973680214751757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 01:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nZlHXZEw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6F78040004;
	Thu, 23 Jun 2022 08:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655973678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xs5tibiCv/eKVnjmZNRS7kjZRnf5y+djx4OCTEEiwNM=;
	b=nZlHXZEwnf/0e98AAjATGvRBME90RxCqWZR8pIdBA5y2o5zuu0YsNJ72AIgImfo0A9vIeA
	nT42WrP5qYhJvTXXtn4K1GL6R/a3rbc0Y1zVNDVa++iDHr6RNdirAffoOikppSWAXG0Yvy
	WQRaUlqhuKgv++cIyfQtZJxjxKQ5Q0ICDZPBxRUCY2hGKEFDRAfc89Gh+rCBS1D+PQPf5C
	h9XyhKnxzBb4tNafu4aJ5hTZU75OaprT/RosDBGpbRrN5M094xOsU3Vo5SQ1OoKznzhBXp
	et9ZlK3BscwPMBf7krgb8Au1OV+jxxa3H00cL0p/4VJaL40lUL5b9EIpSyFtwQ==
Date: Thu, 23 Jun 2022 10:41:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES
 optional
Message-ID: <20220623104115.11e5264a@booty>
In-Reply-To: <291f23ad-b932-e3ed-ca7a-f0f29fd576ba@t-online.de>
References: <20220622173251.478588-1-f_l_k@t-online.de>
	<20220622224440.658ff65c@booty>
	<e74c83db-d4fd-8696-d00b-b19c19f9b42e@t-online.de>
	<20220623094037.2204a89a@booty>
	<291f23ad-b932-e3ed-ca7a-f0f29fd576ba@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 08:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167264

Hi Markus,

On Thu, 23 Jun 2022 09:57:11 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Hi Luca,
> 
> the reason i made the switch working manually both sides was that i 
> wanted to remove those python modules from build dependencies as i 
> thought they would only be needed at runtime.

Sure, fair enough.

As for me, I preferred to do the opposite because the CMake
configuration process might look into anything specific of those
modules, and if they add such code in future versions we might not
notice and experience issues. Maybe unlikely, but my approach was to
prefer a "safe" build to build time.

It's a matter of choice I guess, no approach is clearly "wrong" or
"right" here.

> But this should work as 
> well and I'm of course OK with it.

OK. My v2 is under testing right now.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

