Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4FFC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 09:52:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.19698.1677577923605390362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 01:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i/XV45mk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4083620002;
	Tue, 28 Feb 2023 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677577921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=en/q482QKfV/9hxiyIl6h7UwzAgktkRCkTd/duxi3bY=;
	b=i/XV45mkwfYTDJG7HWwwUHORMxxNjzieiGVmtek0Xhhfy4E31wRvrINnfmM1yj9z7v/Wse
	/hFqA4bnyIWiWz4kkRRbyK0PdrJ7lL8wGIF2OekunbOOh6LYx0dN3YmNk1W0QfnIJdrIoe
	sbiO2lZT9wv5+w8FieIscgI8vC6/kF2X1W+lRhlfhe3JZRgHjROxBI45KLiVMw1AIRkjvU
	Y//IbmJUMDOu+Gu5X1IeyjAOrHnpXyVMgKa/pzf0fwUlw3QpzXkYk8nL+QDMQpWqmRp0MI
	xQ7it/SXumFglRsbb9njdKMiTE6KS5F3jUSoC+3HxA9Xmdr2mqVx4EqhPqVHUw==
Message-ID: <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
Date: Tue, 28 Feb 2023 10:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
Content-Language: en-US
To: Tom Hochstein <tom.hochstein@nxp.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
 <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177831

Greetings,

Thank you all for your replies and comments!

On 24.02.23 at 00:24, Tom Hochstein wrote:
> I agree. The problem I have with these variable names is that it's ambiguous whether the features will be included or excluded from the backfill. All you can tell from the names is that the values were 'considered'. What does that mean? You have to go to the manual to find the full meaning.
>
> What's important about the variables is that they will be 'excluded' from the backfill, so this does look much clearer to me:
>
> 	DISTRO_FEATURES_BACKFILL_EXCLUDED += "some-feature"


Richard, would you accept it if I sent a patch replacing 
"BACKFILL_CONSIDERED" by "BACKFILL_EXCLUDED" in the two variables?

Of course, I can understand if that's too late for the next release, and 
instead document this oddity, at least before we can make a change again.

>
> Is there a good reason why we have this separate variable and can't just do this?
>
> 	DISTRO_FEATURES_BACKFILL:remove = "some-feature"


Good question. Maybe because ":remove" is final, and cannot be 
overridden, if I understood correctly?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


