Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E5EC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:09:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.15924.1690484988413883847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d8TmSy14;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 376311C0002;
	Thu, 27 Jul 2023 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690484986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XgthBauflHsJurxp8Wj5hh41SMvYawW9/DkqGaSzdm4=;
	b=d8TmSy14Ic19bS6iJI9D6DgyLSMVPd0gjRAOOX0xhyNaSQGFo71623ZznAkkYrs3QZA3ZD
	vqMengpdANSX22ohgnmwC6GMbtdLRy9vViEnsYwk6qnAWPIz0bVzzm2GfEpigdH9UopiwE
	dFRhvKlMKDJ0DDBkeTxzfA0SRfjjkJUyNFc0FOJ+MTeijQIHxbQajguVIhZUJtUgv7Eu8g
	QtKXfDrlhRx7lK0Or3nLRhCzhn/3NCPyBDvoJirSXueI1VZD5+h0kaGB1WeAa3CEEwg0rD
	DUeJSz6E+EYLDd1Pc1xTdWZlAbQyfzSRAutH6ZDO/niyRmS5d8GERNT631vs7A==
Date: Thu, 27 Jul 2023 21:09:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/rust: Add failed test cases
 to exclude list for Rust Oe-selftest
Message-ID: <20230727190944b3e5d90e@mail.local>
References: <202307271414473cf213ec@mail.local>
 <31108.1690468372162790627@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31108.1690468372162790627@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184974

On 27/07/2023 07:32:52-0700, Shinde, Yash via lists.openembedded.org wrote:
> I already posted the other needed patch here, https://lists.openembedded.org/g/openembedded-core/topic/100373873#184890 ( https://lists.openembedded.org/g/openembedded-core/topic/100373873#184890 ) to be patched before this one.
> 

This is exactly my point, you must send a proper series when there are
dependencies between your patches.


> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184940): https://lists.openembedded.org/g/openembedded-core/message/184940
> Mute This Topic: https://lists.openembedded.org/mt/100387455/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

