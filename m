Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588E8EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:04:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2456.1687363433170500189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jBGSKyOn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687363430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9J0c4dfTsxy6mG4+hush26XEvSJz6+zGzoluV12R0AI=;
	b=jBGSKyOnSjkGkCp/7KtzBQGRxILIJziqq+EdM3GiAk1l8cgKJ/teQqnCD5hvaO6NCsa13y
	AvEKR+9/kpRq42ITSLf4t/57Qf7LNYoIwZtnuQDB3QZ31achnypDvrz5HVNwwZ13P9C7Jf
	PFqL2ZNQmNZuHQrP2ORsiOSY4p9i3tmFJT4hVA5x9hwqvlXgB2jf61Msv9dfazx7fQ7Kfr
	L1DqlLQ4JjUYsnezaSXKQiVWUuna0bbSA1wbTTU3vN3ngC3zIayC0RGi3M+rTc8a+CotGG
	dWQ2OntfZ/0+H4QYoatBKbSv5FUjsx+Pb8JCD73qh4Pt6OSZff3lwOZWVnF3bw==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5598F4000B;
	Wed, 21 Jun 2023 16:03:50 +0000 (UTC)
Message-ID: <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
Date: Wed, 21 Jun 2023 18:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: francesco.dolcini@toradex.com, max.krummenacher@toradex.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
Content-Language: en-US
To: Ming Liu <liu.ming50@gmail.com>
References: <20230530170949.12045-1-liu.ming50@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530170949.12045-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183186

Greetings,

On 30.05.23 at 19:09, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
> to append a string to the name of the local version of the kernel
> image.


How is this supposed to be used?

I added the following to my conf/local.conf file:
KERNEL_LOCALVERSION = "no-networking"

But when I run "uname -a" on the qemux86-64 target, I get:
Linux qemux86-64 6.1.33-yocto-standard #1 SMP PREEMPT_DYNAMIC Thu Jun 15 
03:08:03 UTC 2023 x86_64 GNU/Linux

So, my string is not there!

I'm using the latest Poky master branch for testing.
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


