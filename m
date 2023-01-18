Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E4DC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 12:55:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14105.1674046510051665045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 04:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c1uWoR55;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 18D5BFF80E;
	Wed, 18 Jan 2023 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674046507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLQxg0A/dEGB47bLRfsZTc3E4QaI0Zu87DRAIab7Bm0=;
	b=c1uWoR55NtU8oeDXwC6Esw/5OnUfy8uReVF3xLiddwtD+gZONYAEFVVKrV2WwlQ3inQ9hZ
	/iSGi9BlVoRlZo74qN8lgqsqWPMfQTEZ2hzr6NxPcOIVOnD+kKqDXJM0m6+DWoIVcHM8QZ
	9twInJ0GWNklJShMUYVOVjIFVZovzEKoRc40mCYijcTcxKo+1iIT7vcCDuFtPUzDfIHhS5
	KS6hbOqao45WvOgEKnSGlR4wRIhGATYU/cuVcx3cKSDz4ewrfMtZ1Ica2qrR68ja3tXOp+
	rXm7yLclrc7Skx+hflK0zHWw268k+vkgStupcDNfm1PYvMQNK4fxxtADncEE6A==
Date: Wed, 18 Jan 2023 13:55:05 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Martin Jansa" <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, kai.kang@windriver.com
Subject: Re: [OE-core] [PATCH] mesa: update submitted patch with backported
 version
Message-ID: <20230118135505.00343139@booty>
In-Reply-To: <20230116153035.3226400-1-Martin.Jansa@gmail.com>
References: <20230116153035.3226400-1-Martin.Jansa@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 12:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176091

Hello Martin,

On Mon, 16 Jan 2023 16:30:35 +0100
"Martin Jansa" <Martin.Jansa@gmail.com> wrote:

> * this version was merged to main in:
>   https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911
>   and cherry-picked to staging/23.0 as well in:
>   https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46d87455a9a414d7c65
> 
>   and as a bonus it doesn't break the build with DEBUG_BUILD
>   for newer toolchain, so we can apply it for target build as well, see:
>   https://lists.openembedded.org/g/openembedded-core/message/169002
>   https://lists.openembedded.org/g/openembedded-core/message/170930
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

There was a conflict while applying this patch on my testing branch due
to a previous patch touching mesa.inc. It was simple enough so I have
fixed it, but you might want to double check the resulting commit:

https://git.openembedded.org/openembedded-core-contrib/commit/?h=lucaceresoli/master-next-success&id=259d433461e246fa85ff0c0ffa98b91209e15d31

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

