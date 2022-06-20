Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310D9C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 15:24:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.21477.1655738679459875881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 08:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SxnaTk59;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6B0BC1BF204;
	Mon, 20 Jun 2022 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655738677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiOJOShe5fUY7A/XXdwWkCtetpAnFpfG7TktDkmnsEk=;
	b=SxnaTk59FNcerx8EeirTUNgqX0gBZqHC01Br7dWV2UMREw9T5cvGJ5Fhcazx2lPQmuayOu
	h5wCWF1EC7rDaf0UK/REN549ppX/gRP6dLt0mreJBoFWd5xi/D8HHAl89xcAVzsqI0fgv/
	eaWbMy1pVspYbC7PQIVxy+VUoVXAB7Z2CU4wJqOfR7f6b81YmQVvDSvx9HNxDhOep2xZC9
	bW5r7izgScOIvudE0xQoMgTbjQJWUEqKGw6jkgp9kj54MZy/KBZdp6p0znCteyDPO24oYD
	5n3+4WJH3FbgXQXFNFGbjIcbm7CR06gd0nux75a82lTitneEv3WvQzMmFKwK5g==
Message-ID: <3681bc8a-1be0-b272-3da5-4b4ff804f4e2@bootlin.com>
Date: Mon, 20 Jun 2022 17:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH] kernel-uboot.bbclass: Use vmlinux.initramfs when
 INITRAMFS_IMAGE_BUNDLE set
Content-Language: en-US
To: "Pothuraju, Rajukumar" <rajukumar.pothuraju@amd.com>,
 Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
 <e8affe9f-846e-b36e-8156-ca768a75ab9c@bootlin.com>
 <DM6PR12MB50077A9029766534FE271F9DE5B09@DM6PR12MB5007.namprd12.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Cc: Jason Wessel <jason.wessel@windriver.com>
In-Reply-To: 
 <DM6PR12MB50077A9029766534FE271F9DE5B09@DM6PR12MB5007.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 15:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167119

Hi Raju,

On 6/20/22 16:45, Pothuraju, Rajukumar wrote:
>>
>> Thanks for the patch!
>> By the way, why this weird x"${VAR}" = x1 trick?
>>
>> I see it elsewhere in the class code, so I understand why you took it, but why
>> not just the following?
>>
>> if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> Both formats will gives the same output when the variable set to "1".  This just skips passing empty string to if condition in comparison. And, I think the direct comparison may not work in old shells properly.
>
> Regards,
> Rajukumar P.


Thanks for your opinion. I'm copying Jason Wessel, who first wrote this 
kind of test in this file (in 2013!), hoping he can explain. I hope 
that's no longer necessary today, because I find this hack a bit ugly.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


