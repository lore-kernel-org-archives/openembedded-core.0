Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BDEC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 17:55:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.464.1701798926012307259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 09:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MtO7rLvf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9F55C0005;
	Tue,  5 Dec 2023 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701798924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QOddXETYf/+wBs6MWs2gsgHijnVYCCwDB5XkibUJv4M=;
	b=MtO7rLvfO5xIUx/cTA8sPlwUOitgAP8UV8iXCyA5ujbl/M4Wg9hZuJ+cCcHy4BRpHMx1+K
	pDq+QZdjtS9FJd1+a0BYgkhpnC1ql8OHd1Wm3ZlEKXZfbMiDLmkGiha3rwlu0yGgGDJ3Ug
	2Nb0MSoVMs6W4ET8Ved+tc3pQ3B8Je5OyxfSfz7YwCima2z9GP71UBxPOgnPnxZVPSoqNi
	dvXeFw9mTr/Fztb6sdy5jba1L7XqnAH8obUGZrRjhxnmzD9JSxX5Hk7oXGVJPD3zTc7pja
	RPUd1A9SnXBWLGHyy2b7TVfcOYnon0OcRS+JHyJuyUP3UxKIk+t/3wQh+RNO+Q==
Date: Tue, 5 Dec 2023 18:55:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated pull request
Message-ID: <20231205175523baa0bc72@mail.local>
References: <cover.1701750230.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701750230.git.bruce.ashfield@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 17:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191852

Hello Bruce,

I got this: Unable to find revision 867a6bdef9701f378f5a9ce66a713daa22598649 in branch yocto-6.5
This seems correct, did you forget to push anything?

On 04/12/2023 23:26:55-0500, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's my latest -stable updates for 6.1 and 6.5 as well as the bump
> of the dev kernel to v6.7
> 
> I have more pending changes: the 6.6 reference kernel and associated
> libc-headers updates, as well as the eventual drop of 6.1 from the
> tree.
> 
> But this is my first full cycle on my new configured and cobbled
> together builder after my disk failure. So to keep things simple,
> I've limited this first pull request to try and see if anything
> has been missed in my setup.
> 
> Bruce
> 
> The following changes since commit f89d9240b1208e9df28afed840376ca91842e5dd:
> 
>   vte: Separate out gtk4 pieces of vte into individual packages (2023-12-04 12:45:27 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (7):
>   linux-yocto/6.5: cfg: split runtime and symbol debug
>   linux-yocto/6.5: update to v6.5.11
>   linux-yocto/6.1: update to v6.1.62
>   linux-yocto-dev: bump to v6.7
>   linux-yocto/6.5: update to v6.5.12
>   linux-yocto/6.5: update to v6.5.13
>   linux-yocto/6.1: update to v6.1.65
> 
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
>  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
>  .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
>  .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
>  7 files changed, 42 insertions(+), 42 deletions(-)
> 
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191777): https://lists.openembedded.org/g/openembedded-core/message/191777
> Mute This Topic: https://lists.openembedded.org/mt/102986376/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

