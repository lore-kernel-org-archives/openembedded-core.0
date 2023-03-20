Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4159DC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 08:29:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.8980.1679300942638517838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 01:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CIu80mK7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06D7EE0009;
	Mon, 20 Mar 2023 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679300940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWkPSUP+bzxxDQgItv7EL3DD2u7eha4ND7226a2+PaM=;
	b=CIu80mK7213513KLlTNk4zbjLzkNUKqOYEZ0pLvOWdfRyhgGOk2veNN5JjrKT9UPorqZdf
	e+zj4nK4Lwd39UsosPhyq9QboRavAU8b5RYPx1vqT+I1gnt/ehdNTbUDbPtcXeP3t4b7gt
	9RFwxfNQRtlcItCj1PpPTQypT3U+m4mt9N0yNPePcBD0wpEGbwxwB1GP3ogWcjSM1vP0NG
	A8WMU2jaazAAPQjkbghzB2gl42MUeVwczmi+EmD9pP4rjFkwHJB1ygS5nGdidumEAALmzF
	1QkiU8Y0T4L6grfkUNTtkGTSDrq6awe5HxVpsGxbuaA4e9BWUrPHAD+91QCrvQ==
Message-ID: <6f12e6df-d1f6-2984-bef7-11ba15133dd2@bootlin.com>
Date: Mon, 20 Mar 2023 09:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] maintainers.inc: Modify email address
To: zrc_work@qq.com
References: <tencent_19A6F8263997FA6A9B8E458473071DF4800A@qq.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <tencent_19A6F8263997FA6A9B8E458473071DF4800A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178804

Hi Zang

Thanks for the patch!


On 20.03.23 at 09:11, zrc_work via lists.openembedded.org wrote:
> From: zangruochen <zangruochen@loongson.cn>
>
> zangrc.fnst@fujitsu.com -> zangruochen@loongson.cn
>
> Signed-off-by: zangruochen <zangruochen@loongson.cn>


However...

  * Your Signed-off-by information doesn't carry your full name. You
    should be able to fix it by running:

    git config --global user.name "Zang Ruochen"

  * Your "From:" identity is incomplete too. You may need to follow
    instructions on
    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity,
    but this may be fixed by just running the first step.

Don't hesitate to send me an update through a private message first. 
I'll be happy to help with testing.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


