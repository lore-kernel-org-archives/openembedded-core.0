Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF02C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 17:45:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20141.1676915150498517085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 09:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fiQtdaLg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 33E2EFF808;
	Mon, 20 Feb 2023 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676915148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGntf/L0nhckkEOPFjQpH3eY51qrQaW2RiPVJtr/QRw=;
	b=fiQtdaLgYs98Ha03vGDeqJugjL65XA4qKEcvJFwynZHPB3rxvQB1F/ZxOPk4GbvD/rJgUQ
	YBzRMk82HVt4k8C8f4xDmOW5TEiCvDUsY5+FFO5jVEwjAZ1p/IO2hVO59Vw2t80B/H9NLe
	xcc35auwrTTWtAm4fFMxKxR+zPMj3SZ3GUQg+toGfddRgxGn+CQGHY+JED6WuvRWdyXpLs
	I0DbGCDmlDN9Gpk6iScow8Z7CDxuPg8MUNvVeJbzWHM6SuYs6vdyfjB+IpTIgnDHNmhfir
	FsgH5LsTSkVoDxwB3bqjl8BlC8rjo5GOkdJMLHwkc0yp3SjCthvV+MqRisYPtw==
Message-ID: <14a72505-0e05-6b81-ce33-580cf986c898@bootlin.com>
Date: Mon, 20 Feb 2023 18:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH] ref-manual: Fix invalid feature name
To: quentin.schulz@theobroma-systems.com, niko.mauno@vaisala.com,
 openembedded-core@lists.openembedded.org
References: <20230219143133.66511-1-niko.mauno@vaisala.com>
 <8b58d703-93d4-11f8-4d0e-d6b922e995d4@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <8b58d703-93d4-11f8-4d0e-d6b922e995d4@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 17:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177449

Hi Nico,

On 20.02.23 at 10:20, Quentin Schulz via lists.openembedded.org wrote:
> Hi Niko,
>
> This should be sent to the docs mailing list instead 
> (docs@lists.yoctoproject.org). Cc'ing now.


Thanks for the patch!
You also have an issue with the way your e-mails are received here. Here 
is a workaround:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity

I fixed the commit manually, but doing this will help for next time.

>
> On 2/19/23 15:31, Niko Mauno via lists.openembedded.org wrote:
>> Replace the invalid feature name with correct one which helps to avoid
>> following bitbake error
>>
>>    ERROR: Nothing PROVIDES 'core-image-minimal'
>>    core-image-minimal was skipped: 'empty-root-passwd' in 
>> IMAGE_FEATURES (added via EXTRA_IMAGE_FEATURES) is not a valid image 
>> feature.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

>
> @Michael, this typo seems to have landed in langdale too so probably a 
> candidate for backport.


Correct. I submitted a backport patch. Thanks!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


