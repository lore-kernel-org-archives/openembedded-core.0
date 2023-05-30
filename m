Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F97C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 11:53:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7751.1685447591889170488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 04:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VaaTsSA4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685447589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBCvXDn1cu6r0Di43nrM4ZdbFdIpeNtiTsTzAxYAohk=;
	b=VaaTsSA45HieCsHIGDP4fl5xfgTqPJiRGHLYFv7BZnvCQJhQ56ePDJg649hpAISkVMVOJc
	fsGG4IrkjqCVzQwSxf5T2zgbM6dP0qSEAuj0OTqaabA6kZAt6odbYO3GyNbUxExYndCoqQ
	8eMUmkajuwr5AonFU+E4jLwRA8SU1t9/pfjozJKRDqNKrz6mHaGbWgt5LCqPNp5sdZDhav
	NJrUiGJ9hfXv2TmyEzAouMrb1CcCa0R6WkXidMD1VPGg5hwDJrpXum10tOaz9s17FxV9MA
	pwGqa84oTvpIwrf7Obpc964tIIkHTK4Y73/UsSxukU1lmsORSIO1IXjxK4Lgrw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AE7E4000E;
	Tue, 30 May 2023 11:53:08 +0000 (UTC)
Message-ID: <8324f335-12db-a6b2-d934-6bd4bb5089e4@bootlin.com>
Date: Tue, 30 May 2023 13:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
Content-Language: en-US
To: zhangjialing@loongson.cn
References: <20230530113302.1473632-1-zhangjialing@loongson.cn>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530113302.1473632-1-zhangjialing@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 11:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181917

Hi JiaLing

On 30.05.23 at 13:33, zhangjialing@loongson.cn wrote:
> From: JiaLing Zhang <zhangjialing@loongson.cn>
>
> Fixes [YOCTO #15110]
>
> Some functions used in the project have been removed from glibc. After the removal of these functions,
> the architecture in glibc will not include the removed functions.
> This patch resolves the usage and compilation issues on the loongarch64 architecture
>
> Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>


The patch looks perfect, thanks!
I trust you on the contents ;-)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


