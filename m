Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846C9EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:55:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.3827.1687366520614240201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T8OxI12e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687366518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQt85+l3XDOWdypLQ4wGAK9Z/heyYnPnJhVtO7aXLY0=;
	b=T8OxI12e4IE92LAJ8ldFFeyAuvuFdmjtlWCB3rPyyDmrOz9ZmTrbfjSm2dthP/ogVWkhu+
	vghwJJOL2zzvHknhdZM7+69DPQ1hrcu/hLFDVXWz7/5CU91B+0J4znqrE4ih88RBel5ZP6
	81DNFs1ot9314JYP3FmfH3k1k+ArF0en/h89xhmVpD7/JCcl9yKuf6OMyML+CqI8FsGuwE
	GavIh8h5rV0pkByhccJf9iZTVnrGA5sdR/y3OrHNo92HDSw/VpHSW44JuLHs5SMT6NiA5Q
	TYAR+G7KTdVa/TAHBmeBY56SE5DpCg0H5haA+VaCSEizjSu2ZjhYSuZUsRysow==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4879FC000A;
	Wed, 21 Jun 2023 16:55:18 +0000 (UTC)
Message-ID: <f01c4f8c-458b-a913-70e2-8aae29148e9c@bootlin.com>
Date: Wed, 21 Jun 2023 18:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Ming Liu <liu.ming50@gmail.com>, francesco.dolcini@toradex.com,
 max.krummenacher@toradex.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20230530170949.12045-1-liu.ming50@gmail.com>
 <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
 <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com>
 <eb7e5f60-8780-d133-7dfc-21177f50844f@bootlin.com>
 <CADkTA4NL8JGMhH_j70ontw7oOkMGGENCtL97TBNEVwth9QCVZQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CADkTA4NL8JGMhH_j70ontw7oOkMGGENCtL97TBNEVwth9QCVZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183192


On 21.06.23 at 18:52, Bruce Ashfield wrote:
> It really isn't a variable that most people will use. Most kernel
> recipes that have needed
> to set a local version have already been doing it a different way.


So, we wouldn't document this new variable?

Would you have details about this different way? It seems that the 
manual doesn't explain how... (see 
https://docs.yoctoproject.org/kernel-dev/index.html)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


