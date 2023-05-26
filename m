Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B721C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 13:41:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.8314.1685108512614813788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MWbhFcx0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685108510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHa3sg/C3I8vmFkLh12zNqGT1hBq6KfavlXpeB9tzx4=;
	b=MWbhFcx0JAnljPRGy5smZb2Y0jtuZycwvl0BOeEdVcDO9sX9/emB7yqfy+kvYY9xkGj2AO
	mGXQIqWrx0QsWTRO8tCfelQaS4ULMuLO5cMFI4jezFT9pfxraDNX4Z3MFHsYAhgi7/sOI8
	RxsoV8HKJ4xAKEHDiGhjUdEgEvGZAkRUqUesHFUSUwhoqwsCnb1cPRq+/Ay8hOtPi5Q2ui
	p3Q6XGM3z6HRF5DLyCp2SHxNrlBmzHtfO0SCdfEe+UZpwbgyupic9v99mmshYCwQPRpawE
	2QVhQOnU9639kGewqyVPf8s8ncESLtyBsgbYhiglRRf8IA6Wg88a3ytzp0xggw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ACD7E000D;
	Fri, 26 May 2023 13:41:50 +0000 (UTC)
Message-ID: <819d4b56-b575-a665-2d01-d237d345ddd3@bootlin.com>
Date: Fri, 26 May 2023 15:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] rpm2cpio.sh: update to the last 4.x version
Content-Language: en-US
To: aplanas@suse.com
References: <20230526123926.27308-1-aplanas@suse.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230526123926.27308-1-aplanas@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 13:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181771

Hi Alberto,

On 26.05.23 at 14:39, Alberto Planas via lists.openembedded.org wrote:
> openSUSE RPMs are compressing the RPM payload using zstd, that
> correspond to the magic ID 0x28, 0xb5, 0x2f.
>
> This patch update the script to the last version from the rpm project,
> and add support to this compression format, and extract the cpio payload
> using the "unzstd" binary.
>
> Signed-off-by: Alberto Planas <aplanas@suse.com>
> ---
>   scripts/rpm2cpio.sh | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
>   mode change 100755 => 100644 scripts/rpm2cpio.sh


Many thanks for your contributions to the project!

However, since your patches are received through "Your Name via 
lists.openembedded.org" or "Your Name via lists.yoctoproject.org", we'd 
need you to do add one thing to your git configuration, so that your 
patches are given an "Author" field which matches your "Signed-off-by" 
information. See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Fixing_your_From_identity 
for details.

Don't hesitate to send a patch test directly to me, if you wish.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


