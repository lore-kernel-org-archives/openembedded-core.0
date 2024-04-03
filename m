Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D64ECD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 23:45:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.26583.1712187900672580214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 16:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h+NHAd20;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D231FF803;
	Wed,  3 Apr 2024 23:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712187897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GTzev4C+mR+i2PPi9WcsxEiqnhEePGYPdP3jHwXwNbM=;
	b=h+NHAd20X4WAMuD7rRepHHV9556qAqZ0BBt8cYmFkv/Pphe2S6UHoM2VPhRzJM3it1bAIe
	FskVleQOSrH7r0qjMMKrhyuYAwNI53LbKmncH9TW0uue6FhElmJ9vUcV1mdbsRKhQRMqP2
	SKJdFEJRFo+UcZHHVzp3i0fES7TylXKW/ABG4hkFMCGRNMgmczjOIbrPsx7zW3cbw4y20V
	t8ryVatvU6ScZXdFSt7POMoFleu3CN3n4jKLwG1iSBVMNXH4/MoqJFCyXo8z0tuv0MPAxO
	a5KZ+g1F1mK7tOWv4sn3yezRg+MIv819JGUuM0WYCZdrdS8Q/VLplL6OS/3log==
Date: Thu, 4 Apr 2024 01:44:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] util-linux: Set the license for
 util-linux-fcntl-lock to MIT
Message-ID: <2024040323445722e2c297@mail.local>
References: <20240402045654.3717582-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402045654.3717582-1-pkj@axis.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 23:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197945

Hello,

This caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4604/steps/12/logs/stdio
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240403-u_hyp_wv/packages/diff-html/

I guess we need to bump PR?

On 02/04/2024 06:56:54+0200, Peter Kjellerstedt wrote:
> This avoids problems if BSD-4-Clause is in INCOMPATIBLE_LICENSE since
> util-linux-fcntl-lock is now a dependency of run-postinsts.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index f4b547215e..d506783f9a 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -7,6 +7,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
>  SECTION = "base"
>  
>  LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> +LICENSE:${PN}-fcntl-lock = "MIT"
>  LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
>  LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
>  LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197864): https://lists.openembedded.org/g/openembedded-core/message/197864
> Mute This Topic: https://lists.openembedded.org/mt/105282531/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

