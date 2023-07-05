Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D24EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:56:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.21530.1688572607249786726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=henj3+49;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688572604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=239ydiDUVck5TY5O65YYSsCNSPubT5Aw73F3TBHxzos=;
	b=henj3+49Rl2KyUTfMeY6bsAL+2dPnYUbkDXgRUF2JTyu+jVymLaJHLrsddeQf4Xtn/naMR
	HdiyfkYp7ny2ZjcBuiuNB8PSgRJ7UeZzR8Su/UEt1sCcMvAVxfTmIxijpZ8MJIcGvPfErk
	a6wPfupOJJ7Y5McamANyVNE5pWeQqe1jWraCjRaraVKI48GiMGerlt1SsLFn/+OkIiK6TA
	sdLQcy5O4YqCPKcXGBxuoB7Npdjbh5gGo55gPOvoKLWNXOj4UqAA1D2+ZHKOeZ7zlJoiNA
	QufmHUWgIAMMW4MlTkfaR+nKvp13KV6bo/iDEG4Z80XNnj3k2Q9c2m+mBcQ0jw==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68C06E0006;
	Wed,  5 Jul 2023 15:56:44 +0000 (UTC)
Date: Wed, 5 Jul 2023 17:56:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Message-ID: <202307051556441596f9ac@mail.local>
References: <20230624053223.228117-1-raj.khem@gmail.com>
 <20230624053223.228117-2-raj.khem@gmail.com>
 <20230630133051db39352e@mail.local>
 <5AE653F3-0F84-4FBA-A71A-21455E4E2B76@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5AE653F3-0F84-4FBA-A71A-21455E4E2B76@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183897

On 05/07/2023 11:08:32+0000, Ross Burton wrote:
> On 30 Jun 2023, at 14:30, Alexandre Belloni via lists.openembedded.org <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > 
> > Hello Khem,
> > 
> > This causes python ptest failures:
> > 
> > {'python3': ['test_crypt', 'test_methods', 'test_sha2_rounds']}
> > 
> > We should probably disable those
> 
> Guessing this is also the cause of the perl failures:
> 
> {'perl': ['t/op/crypt']}
> 
> and apr-util:
> 
> {'apr-util': ['testpass_3_of_6']}
> 
> Test 3 of 6 is test_shapass using SHA1.
> 

Yes it is, I should have added that. I dropped the patch for now.

> If we want to do this then some effort will be needed to make all the test suites adapt to what algorithms are actually available.
> 


> Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183887): https://lists.openembedded.org/g/openembedded-core/message/183887
> Mute This Topic: https://lists.openembedded.org/mt/99749300/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

