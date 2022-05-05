Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3932C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 13:58:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.11460.1651759082888116679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 06:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aeE3XDxC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 68B1440003;
	Thu,  5 May 2022 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651759081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJcprKo3cIwrKqIubY2HnEbPMNZc5eXC1vMQW3Jz0kk=;
	b=aeE3XDxCdoZhIVHFvd4N6bBoZhpkQagEOwKZMcr6P9myDO66WabidZioySRomXH2q9RP0h
	4ZEuaNUWs5jhVH39nX647HKx5yZKkSHsOtoLMtPdTlfeuqMZJ/LK6IgqIUym7pWA4jsVqW
	wUKLKK9zjya5s2FHCN50aGvhxJOy2/6xLLfkHwtZjxf+cKfqwDKKn2vvcsZUn6sHkIVc3+
	fLrUUqhNweVJdqHo7PjlvBqQIMpzRkNqOCgeTTz4F+yBKyluOSI2qrxA1Xm4lDzs7iBlaR
	vppt0Ma84PpcHF9jlsQSJKSbBDQSZwZTU1DgFKCLL4OagXk6nEXH7T9h2LaGBQ==
Date: Thu, 5 May 2022 15:57:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 18/18] stress-ng: upgrade 0.13.12 -> 0.14.00
Message-ID: <20220505155758.2838a016@melee>
In-Reply-To: <20220427084009.3406717-18-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
	<20220427084009.3406717-18-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 13:58:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165299

Hi Alexander,

Il giorno Wed, 27 Apr 2022 10:40:09 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:

> Disable apparmor via empty config file creation.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

We have a build failure while testing with this patch:

  .../ld: cannot find -lapparmor: No such file or directory

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5169/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

