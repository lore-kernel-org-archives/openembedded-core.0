Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3798C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 16:22:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.20121.1674058951921208194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 08:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nnzdoLpo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 242C8C000F;
	Wed, 18 Jan 2023 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674058949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GXoSbN7xiGotSev1F3utb2Z/C3OZ/vPxhCMdRyCn2Sk=;
	b=nnzdoLpoKfjsIc+6WO2RjJS5n15i3s4MH3/N3vaLpKf5JsVdrJS2ySBJj1mhLwqm6tYbI0
	H+ypQcaV4lUIeDEfbppG/Yavq1jNF7SrwV+tS/iua0JxwJLMQo24yxt5PkJbLJrM/n2PMl
	pA0v5Q+DcbCEVAiwMazo9nAPrZWdNg/+VmL+1ic8rgQXlh/Ruf9DySljFH9vRV0JubPRM/
	jZrx4UWj5uHhUf8YbE75NLjIFNy/+Sz8Qmhe2Ad90lQuyq69mw21wYR6qI6VUbPKLhkmXR
	b+8zuMKq7bkNeckZRFscdgXrDvxIzSKwwTywQpmsLl8oKSUuvWWQ9IdZjAotLg==
Date: Wed, 18 Jan 2023 17:22:27 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
Cc: <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Message-ID: <20230118172227.28bdb930@booty>
In-Reply-To: <20230118112759.3909741-1-pkj@axis.com>
References: <20230118112759.3909741-1-pkj@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 16:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176106

Hello Peter,

On Wed, 18 Jan 2023 12:27:59 +0100
"Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:

> This avoids the following error:
> 
>   configure: error: Vala bindings require GObject Introspection
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

A different patch [0] to address the same bug is already in my testing
branch and is possibly being merged soon on master by Richard. Can you
please check whether your think your patch is better and let us know?

[0]
https://git.openembedded.org/openembedded-core-contrib/commit/?h=lucaceresoli/master-next-success&id=e9e761146b52658c06aae150332db666ce2f25a8

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

