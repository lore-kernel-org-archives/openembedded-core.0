Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEABC7EE2E
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 09:21:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.5698.1685438501196729145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 02:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XgxC2TpO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685438499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SLVxgSJNJc3ZRv92zMvIk0GgbauoiIfNpObpbigkHM=;
	b=XgxC2TpO/3v3e7y3/OJ3DPl70bjhDEoC9qA1+L9tzQ/26Kc3uXhwxu3TZzyl9QEE/uspaK
	meA9lnF9Uz2e08j784R0CGbTuiMD2b3xBdNRkA2VmBmgUMxuI8chX/OBLSQA6if3mimUdA
	igGLJjjJW/P98myk46MGFWZwuRJgH8dfjo9eWy8+thCZuZ6mCrR0B6oKEHMTvPVtRYaUr4
	2WMCNr0AC4qHLqOqTT1D6IdkR9ukyv63WqDG7v5ctlUKuYY6zsrTCnxRu5yCxZZkskGi+N
	pT3wtbWbsxIndvw3lWretQoc3JhsDZLaSCwHpKCxT3yQ0mBBe85ZAaww16CRpQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B48D01BF208;
	Tue, 30 May 2023 09:21:37 +0000 (UTC)
Message-ID: <48f2c121-f5e5-0871-2fc2-89c32f7c907e@bootlin.com>
Date: Tue, 30 May 2023 11:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] Fixes pseudo build in loongarch64
Content-Language: en-US
To: zhangjialing@loongson.cn
References: <20230530090023.1468904-1-zhangjialing@loongson.cn>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530090023.1468904-1-zhangjialing@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 09:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181908

Hi JiaLing

On 30.05.23 at 11:00, zhangjialing@loongson.cn wrote:
> From: zhangjialing <zhangjialing@loongson.cn>
>
> Fixes [YOCTO #15110]
>
> Some functions used in the project have been removed from glibc. After the removal of these functions,
> the architecture in glibc will not include the removed functions.
> This patch resolves the usage and compilation issues on the loongarch64 architecture
>
> Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>


Many thanks for your update. Indeed, the "Signed-off-by" information is 
now correct, but the "From:" filed at the beginning of your e-mail is 
not updated yet, and that's what "git am" used for defining the commit 
author.

Could you try with:
git config --global sendemail.from "zhangjialing@loongson.cn"

This should help.

See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

By the way, I cannot apply your patch. Did you apply it against 
OE-core's latest master branch?

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


