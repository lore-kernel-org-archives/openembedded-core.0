Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8037C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 19:31:49 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.4394.1709235101572265345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 11:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41TJTZxU000915;
	Thu, 29 Feb 2024 13:29:35 -0600
Message-ID: <0d036adc-c63a-4a21-9325-47569a41514e@kernel.crashing.org>
Date: Thu, 29 Feb 2024 13:29:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] core-image-full-cmdline: add package-management
Content-Language: en-US
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240229150304.3643093-1-michael.opdenacker@bootlin.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240229150304.3643093-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196445

There are plenty of systems where we don't want package-management enabled by 
default.  This will just make core-image-full-cmdline less useful there.

In the past, it's always been up to the user to enable full package-management 
in their configuration, default has been to not have it present.  Has this changed?

On 2/29/24 9:03 AM, Michael Opdenacker via lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Add "package-management" image feature to the core-image-full-cmdline image,
> to support package upgrade testing.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-extended/images/core-image-full-cmdline.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/images/core-image-full-cmdline.bb b/meta/recipes-extended/images/core-image-full-cmdline.bb
> index 4e1cf58d55..b034cd0aeb 100644
> --- a/meta/recipes-extended/images/core-image-full-cmdline.bb
> +++ b/meta/recipes-extended/images/core-image-full-cmdline.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "A console-only image with more full-featured Linux system \
>   functionality installed."
>   
> -IMAGE_FEATURES += "splash ssh-server-openssh"
> +IMAGE_FEATURES += "splash ssh-server-openssh package-management"
>   
>   IMAGE_INSTALL = "\
>       packagegroup-core-boot \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196436): https://lists.openembedded.org/g/openembedded-core/message/196436
> Mute This Topic: https://lists.openembedded.org/mt/104644618/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

