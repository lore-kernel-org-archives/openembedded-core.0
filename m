Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07874C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 16:45:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2880.1706287517218767861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 08:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EmyJKCpI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0300B1C0005;
	Fri, 26 Jan 2024 16:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706287515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w7CCB8EcZR+K2Swa4B5SfLNgbWpTKgbZgh4eBz3PsPA=;
	b=EmyJKCpIhHVyZWtpv8ZVWL3nBVsc9+An2YQns1p7Ee/AqOnFuf7KGnWN7dscup+4xP48/d
	iBCKtrSO2uPSyFd1jkImQBd6XcJSFAhlgTUO9KEB8uh9Xa+SfiyzNMGcbyRXc9xIhrH8VE
	O88uaIAco8VNOSmMcq7j68Zx2METuo/Mhd54sESYEn/Wda4EvkYYragJ6WLfAvlmaFifFn
	WauBpeVIF6CQ59OKRWJja7kOOsmquOs04pBVK+RptoCvh49kfO5Mz263v/KysYN53j5tVe
	hMyFJOTnarXQ+KoNMhr6lVsJ/L34lJM8JvRwkKvBpPiXiItjBVgJKrfauwVJyQ==
Date: Fri, 26 Jan 2024 17:45:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/11] linux-yocto: consolidated pull request
Message-ID: <202401261645148133b0a1@mail.local>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 16:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194396

Hello Bruce,

I'm not sur this has been reported yet, we are seeing those warnings for
beaglebone:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8541/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7446/steps/12/logs/stdio



On 19/01/2024 16:14:08-0500, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's the colllected -stable updates for 6.6 and 6.1. This will probably be
> the last round of 6.1 updates for master, since I'll drop it shortly in
> preparation for the release. 6.1 will of course continue to be updated in
> linux-yocto and in older releases.
> 
> I've also reenabled my CVE update script, if any of those commits don't look
> right, feel free to toss them out.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 7af374c90c349af2c7ae9cf7d4fa14eeeb23b108:
> 
>   build-appliance-image: Update to master head revision (2024-01-19 12:22:58 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (11):
>   linux-yocto/6.6: update to v6.6.11
>   linux-yocto/6.6: update CVE exclusions
>   linux-yocto/6.1: update to v6.1.72
>   linux-yocto/6.1: update CVE exclusions
>   linux-yocto/6.6: cfg: arm: introduce page size fragments
>   linux-yocto/6.6: security/cfg: add configs to harden protection
>   linux-yocto/6.1: security/cfg: add configs to harden protection
>   linux-yocto/6.6: update to v6.6.12
>   linux-yocto/6.6: update CVE exclusions
>   linux-yocto/6.1: update to v6.1.73
>   linux-yocto/6.1: update CVE exclusions
> 
>  .../linux/cve-exclusion_6.1.inc               | 34 +++++++++++++++----
>  .../linux/cve-exclusion_6.6.inc               | 30 +++++++++++++---
>  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++--------
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++--------
>  8 files changed, 92 insertions(+), 52 deletions(-)
> 
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194066): https://lists.openembedded.org/g/openembedded-core/message/194066
> Mute This Topic: https://lists.openembedded.org/mt/103839206/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

