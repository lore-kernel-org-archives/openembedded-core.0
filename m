Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8662FC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:18:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.5387.1666959532969948107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 05:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RDu74tuB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 625E61C000C;
	Fri, 28 Oct 2022 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666959530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fCjNpFs9tELn/3PlB6Hbvv0ZUSzbSHoHoDroa0iUzy4=;
	b=RDu74tuBwnzmRV/worCiMHX8e4czIqpVALXtlxS/o4LMFGyMImyNQWItq1+QpWZ+rZWzPX
	TcxvrbEyVP8k4Joy9aorBwrhyJ3OSpznkiCm5L4jMd7KhFsiwNT5H9vmGNOqpWLy/L3hr1
	QubvXTmJNAO4OVFB+3X9k0PLcY1RM/ttEyV+t7a+oLh8iAHFQ+yr+vbA7vACMVkjb+aJo2
	kjqomjmsB5w8jEoIc8QNk+l0O10r0iByE4+5fRWvJdfH6yXUaoxBopcUauS6Pf73tQet8W
	aSQGyQ1DfxyNBD/xanUUvm5d0/wz9SPciO838Qlenr55ZGAdMY4V1oyuI9L7jw==
Message-ID: <fa110b7b-a058-edf4-9ece-f8ee0a03f8fc@bootlin.com>
Date: Fri, 28 Oct 2022 14:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: swap partitions are not added to fstab
Content-Language: en-US
To: ciaran.courtney@activeenergy.ie
References: <20221028100509.32171-1-ciaran.courtney@activeenergy.ie>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221028100509.32171-1-ciaran.courtney@activeenergy.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172251

Hi Ciaran,

On 10/28/22 12:05, ciaran.courtney@activeenergy.ie wrote:
> From: ciarancourtney <ciaran.courtney@activeenergy.ie>
>
> - Regression in 7aa678ce804c21dc1dc51b9be442671bc33c4041
>
> Signed-off-by: ciarancourtney <ciaran.courtney@activeenergy.ie>


Many thanks for the patch!

However, your "Signed-off-by" information doesn't properly list your 
first and last names, and this will cause trouble generating the release 
notes.

Could you run:

git config --global user.name "Ciaran Courtney"

(if I'm not mistaken), and regenerate your patch, please?

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


