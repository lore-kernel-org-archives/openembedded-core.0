Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11CFC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 15:07:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.19543.1701529655890423174
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Dec 2023 07:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TVaR7peu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D62F0C0006;
	Sat,  2 Dec 2023 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701529653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JM/svAQ9T6IyDJhVf2hdndl+6s0kgZQHE+nBNoBPR5c=;
	b=TVaR7peuf2wnFc3I2JQupqTuiiQU9gDrWvBYUHAUTkxieBzDqtPidyMqaE6mFgOp/V2xhf
	RdE2wCs0qsjJ5bWFO4VroRp84/nVR6XGJqrPc59P+pV+LPdJhzAEKyV166cRhObipqKYy/
	fAzBP03o4CZPqFMyR8TPxWLIla6LJhZJyFjeDojtS6kCRIObEu3g9Whaj+TLivWfPrPpgS
	aE8P5k47JvMN8KhB2DVuaeuhSSlHP9MvAbi/MgN/Opmb6fN6OD9Bk+Rnv+rC72FsfOZHy+
	icHHwQPt+R6kKbqVFOFuZpdykb3edeR8XURserj1acdMcNdRnNSnjX6xmlcoyg==
Date: Sat, 2 Dec 2023 16:07:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v1] documentation.conf: fix do_menuconfig
 description
Message-ID: <202312021507326c3ca3dc@mail.local>
References: <20231130150944.1023969-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130150944.1023969-1-joaomarcos.costa@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 15:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191700

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 30/11/2023 16:09:43+0100, Joao Marcos Costa via lists.openembedded.org wrote:
> The current description is only pertinent to the kernel, even though
> do_menuconfig task is used by other projects, such as Busybox and
> U-Boot.
> 
> Replace "for the kernel" by an agnostic alternative (i.e., "in the
> compilation directory").
> 
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/conf/documentation.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index ab2addb321..05e4b8bc7f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -28,7 +28,7 @@ do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yoc
>  do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
>  do_kernel_link_images[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux and vmlinuz kernel images"
>  do_listtasks[doc] = "Lists all defined tasks for a target"
> -do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
> +do_menuconfig[doc] = "Runs 'make menuconfig' in the compilation directory"
>  do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
>  do_package_index[doc] = "Creates or updates the index in the Package Feed area"
>  do_package_qa[doc] = "Runs QA checks on packaged files"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191509): https://lists.openembedded.org/g/openembedded-core/message/191509
> Mute This Topic: https://lists.openembedded.org/mt/102895214/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

