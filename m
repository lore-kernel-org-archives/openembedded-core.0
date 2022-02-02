Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324D2C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 22:59:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1545.1643842759403602282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 14:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B912A40C82;
	Wed,  2 Feb 2022 22:59:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hoLqEIvg_Ij; Wed,  2 Feb 2022 22:59:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C36440AB7;
	Wed,  2 Feb 2022 22:59:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 65047174738; Wed,  2 Feb 2022 17:59:16 -0500 (EST)
Date: Wed, 2 Feb 2022 17:59:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 04/33] connman: update 1.40 -> 1.41
Message-ID: <20220202225916.GH26229@denix.org>
References: <20220202182758.919991-1-alex@linutronix.de>
 <20220202182758.919991-4-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202182758.919991-4-alex@linutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 22:59:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161264

https://git.openembedded.org/openembedded-core/commit/?id=54c896c76ba5955990f27ed1ec5dd81d2f9d09e2


On Wed, Feb 02, 2022 at 07:27:29PM +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0002-resolve-musl-does-not-implement-res_ninit.patch        | 2 +-
>  .../connman/{connman_1.40.bb => connman_1.41.bb}                | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/connman/{connman_1.40.bb => connman_1.41.bb} (85%)
> 
> diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> index 9dca21a02f..63a8fa81b1 100644
> --- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> +++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> @@ -1,4 +1,4 @@
> -From 01974865e4d331eeaf25248bee1bb96539c450d9 Mon Sep 17 00:00:00 2001
> +From f2e6254a48fc0bb41b1617b7832aed4977230cf9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Apr 2015 23:02:21 -0700
>  Subject: [PATCH] resolve: musl does not implement res_ninit
> diff --git a/meta/recipes-connectivity/connman/connman_1.40.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
> similarity index 85%
> rename from meta/recipes-connectivity/connman/connman_1.40.bb
> rename to meta/recipes-connectivity/connman/connman_1.41.bb
> index edb23a1267..736b78eaeb 100644
> --- a/meta/recipes-connectivity/connman/connman_1.40.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.41.bb
> @@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>  
>  SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
>  
> -SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
> +SRC_URI[sha256sum] = "79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589"
>  
>  RRECOMMENDS:${PN} = "connman-conf"
>  RCONFLICTS:${PN} = "networkmanager"
> -- 
> 2.20.1
> 

