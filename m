Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EBDC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 08:13:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4966.1685434423157998661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 01:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nD5g1Vnd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685434421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9b8eq74/8u74/ZmkWrW6fAgp94Z0jKy75T1H+TczUY=;
	b=nD5g1Vndwen+W3gY4LkeJt4+C1XP3MPSvP4CBggHgxzpxC3zjswjNDybTM9BQqqXGgltj+
	fW2cRGI1SdhHCNFaY+vRlU7Rbac5Brr9PLrP52spK4HFZv96dfcegQUI76E9JOMU1BMuAt
	+WiLRiTgfaKUq/InnxU3jV4DC5zntFLRe+nr51250IVvUPrzgpzIBWinAjk6Omm9gCCQMv
	swnsRKXPeY9AqI9Gr57eEjY1YceplIqVgscKvn9lcFUSQmfDejB1QWLXlIW8InXiRt2znY
	IPMjt+1+gb72SqXkfW553zhGJXWBBxqpZ793OCvthWXSF0YYaB6xAYdPrucR/Q==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13D6E2000A;
	Tue, 30 May 2023 08:13:40 +0000 (UTC)
Message-ID: <9ecef1d5-bb95-67de-79c5-aaf26690a7b2@bootlin.com>
Date: Tue, 30 May 2023 10:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] Fixes pseudo build in loongarch64
Content-Language: en-US
To: zhangjialing@loongson.cn
References: <20230530064659.1465477-1-zhangjialing@loongson.cn>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230530064659.1465477-1-zhangjialing@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 08:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181905

Hello,

On 30.05.23 at 08:47, zhangjialing@loongson.cn wrote:
> From: zhangjialing <zhangjialing@loongson.cn>
>
> Fixes [YOCTO #15110]
>
> Some functions used in the project have been removed from glibc. After the removal of these functions,
> the architecture in glibc will not include the removed functions.
> This patch resolves the usage and compilation issues on the loongarch64 architecture
>
> Signed-off-by: zhangjialing <zhangjialing@loongson.cn>


Many thanks for your patches!
However, would you mind modifying your git configuration, so that your 
first and last names are separated, please?

Something like...

|git config --global user.name "Guy Fawkes" |||

Otherwise, your name won't be correctly added to the release notes.
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


