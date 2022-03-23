Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E468FC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 15:35:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.10727.1648049735088698017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b53y3PWS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AAD2B1BF206;
	Wed, 23 Mar 2022 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648049733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tMoun+GP98rbhUYB8ZSXEGmPbiBoOIwU99JgNfvPtEg=;
	b=b53y3PWSBoy0SfqvbuRrLCKUZ0WTspJgVXEjd3+gg/Fy6anBRLiutyer4TGIZkjLDzox8D
	NBVt+jrnnUpmp01wBDbB9GUCiPkErdF+BE3jpAIin/dUMgw8prjMHv+OIH2uLB8xPShC4i
	t5wdngkKgVT7mrPm1++vYhoBh3y19JYGUf648mRQHwldK9EXpmxNU8N61RW/aqyDYmZgv4
	ejDj7hmAPOT9k1obS0gcGYbyZLhWVmGWRW4iI3q0++WBsQxa7qMJ+kA7gAVg3Gj9zx9kAF
	0XfClgFJ/jxCc964Vu438vvaw1SxPCyHpnZaS5ba3BFn6/ckNf4IMI5cGuVc6Q==
Date: Wed, 23 Mar 2022 16:35:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] mobile-broadband-provider-info: update branch
 name
Message-ID: <Yjs+RGCl6mjOAoSN@piout.net>
References: 
 <20220323085009.11573-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20220323085009.11573-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 15:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163585

Hello Enguerrand,

This was already fixed in master in:
https://git.openembedded.org/openembedded-core/commit/?id=ed02ee8f20094f598448d58875cb7be8a24a019f

Is this for another branch?

On 23/03/2022 09:50:10+0100, Enguerrand de Ribaucourt wrote:
> The master branch was renamed main, resulting in do_fetch failure.
> This patch updates SRC_URI with the new branch name.
> 
> Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
> ---
>  .../mobile-broadband-provider-info_git.bb                       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> index 4246f4dcbd..3b170f4fdd 100644
> --- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> +++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> @@ -8,7 +8,7 @@ SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
>  PV = "20210805"
>  PE = "1"
>  
> -SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
> +SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
>  S = "${WORKDIR}/git"
>  
>  inherit autotools
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163581): https://lists.openembedded.org/g/openembedded-core/message/163581
> Mute This Topic: https://lists.openembedded.org/mt/89971498/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

