Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EFC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:42:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.5058.1665477760612911476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c7VI2iy4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 596F220002;
	Tue, 11 Oct 2022 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665477758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAQUQt8vVF+B+4cieWyPOKEwWSEtKKN0JSUo/5/11Ro=;
	b=c7VI2iy4EmQCDITKtliinkorP3hIHwYBLMemNUeLKLG7cE79Zyd5wYWLZsPgQpal2KwB+N
	iOEgyM2wXb57msq151PJWppo01+Bhqb0Ovr8OkzXd7sbOc3NpsCzPIcLdNIXx24kOT48NX
	mAvCEsvrOJMDlaHsjDMAmEVCcapmVkFEDUeQ1IVn5NBx3vRd5Ejy3RlwkOMsEe6eh1+R3P
	YsDbWL42cwQ8VQNrvX8LVF5Dv63vwPDEmUn3t9lxLgVu5Op4nZjXS7pqpveNUykmNMbLC1
	zCciowVUrTb6afosyAoZHOtQY7l4Z2MpSegSEKz29ecPgXwFDuumI+2lJH4mVA==
Message-ID: <4dbaad5b-c7d9-937a-7ab6-033a9b40ab90@bootlin.com>
Date: Tue, 11 Oct 2022 10:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] numactl: upgrade 2.0.15 -> 2.0.16
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>
References: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:42:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171616

Hi Wang

On 10/11/22 10:21, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta/recipes-support/numactl/numactl_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Thank you for your patches.

There's a problem with the way you send your patches though.

If I apply your patch through "git am", the author of the commit is:
wangmy <wangmy@fujitsu.com>
instead of
Wang Mingyu <wangmy@fujitsu.com>

... as in your "Signed-off-by" information. Because of this issue, your 
name is not properly listed in the contributors section of the release 
notes. I've just send this patch by the way: 
https://lists.yoctoproject.org/g/docs/message/3348

You may try this:

You should be able to fix this by running:

git config --global sendemail.from "wangmy@fujitsu.com"

... though I'm not sure it will work in your case and match your 
user.name identity.

Don't hesitate to send a patch to yourself to check. I'm happy to test too.

Thanks in advance. At least, all the future patches would be trouble free.

Thanks again for all your contributions!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


