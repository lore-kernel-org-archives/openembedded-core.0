Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB927C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 22:53:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1517.1643842391938245080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 14:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F221E40C82;
	Wed,  2 Feb 2022 22:53:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QjX9I_f6wxQ; Wed,  2 Feb 2022 22:53:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DC3A440AB7;
	Wed,  2 Feb 2022 22:53:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AA90F174738; Wed,  2 Feb 2022 17:53:09 -0500 (EST)
Date: Wed, 2 Feb 2022 17:53:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 15/33] ell: upgrade 0.47 -> 0.48
Message-ID: <20220202225309.GF26229@denix.org>
References: <20220202182758.919991-1-alex@linutronix.de>
 <20220202182758.919991-15-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202182758.919991-15-alex@linutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 22:53:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161262

https://git.openembedded.org/openembedded-core/commit/?id=53070e8e119d90b633db8b26ba002ae95f2cfcca


On Wed, Feb 02, 2022 at 07:27:40PM +0100, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} (89%)
> 
> diff --git a/meta/recipes-core/ell/ell_0.47.bb b/meta/recipes-core/ell/ell_0.48.bb
> similarity index 89%
> rename from meta/recipes-core/ell/ell_0.47.bb
> rename to meta/recipes-core/ell/ell_0.48.bb
> index 1db0065a37..737302a444 100644
> --- a/meta/recipes-core/ell/ell_0.47.bb
> +++ b/meta/recipes-core/ell/ell_0.48.bb
> @@ -16,7 +16,7 @@ inherit autotools pkgconfig
>  
>  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
>             "
> -SRC_URI[sha256sum] = "4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9"
> +SRC_URI[sha256sum] = "9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5"
>  
>  do_configure:prepend () {
>      mkdir -p ${S}/build-aux
> -- 
> 2.20.1
> 

