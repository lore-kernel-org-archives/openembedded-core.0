Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A65C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:42:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8115.1685695367534572756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mH4ex2/o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685695365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84nXrb6ViI1582PEeXOAqrc6tGVZ/lY6HnBnW7uLxlQ=;
	b=mH4ex2/oPDbZ8DVLpTog8T+WN4ucrVoGcJ0wQOK3MKG0ksFyfw0Db2D7AC/XJYs3mT0CfP
	8o3s6mWaTRKdj8GolTUMYfyy+IobNDQ0o0hCQu+V1R9BqV1oRwgMIVCz3X7dnHambLXSht
	kqPRfFWKmuvTHx4TrnZYDWiym0vm6RNhs3Bc36tMwzApmw6pRahAC23/JOELEful+ACp5P
	gvfae5OTzissOexlvTpxuFiOg9z0sjw36LcV0nRCTLPurbboZurC84AcdYb//HR4ScPD7i
	5/601SL7kXqo2dWx1vgcs7zy7hZZN4eEZHrBUV311PYGI1SqWi/+XytiUsO/hA==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4798120005;
	Fri,  2 Jun 2023 08:42:45 +0000 (UTC)
Message-ID: <d9ec781b-3c97-6e6e-bbfe-e1476472f181@bootlin.com>
Date: Fri, 2 Jun 2023 10:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-utils: upgrading to 1.2.9 FAILED
Content-Language: en-US
To: Auto Upgrade Helper <auh@yoctoproject.org>
References: <010101887b288e27-688a1747-0a59-4a9f-8681-4efda7234d47-000000@us-west-2.amazonses.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <010101887b288e27-688a1747-0a59-4a9f-8681-4efda7234d47-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182295


On 02.06.23 at 10:10, Auto Upgrade Helper wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.9* has Failed(do_compile).


This has already been addressed by a patch that hasn't been merged yet.
See https://lists.openembedded.org/g/openembedded-core/message/182092
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


