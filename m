Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8319FC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 04:01:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.36837.1658203265585174024
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 21:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C422840CBC;
	Tue, 19 Jul 2022 04:01:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpwrebxop8SO; Tue, 19 Jul 2022 04:01:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B41140C67;
	Tue, 19 Jul 2022 04:01:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2AA841749AF; Tue, 19 Jul 2022 00:01:01 -0400 (EDT)
Date: Tue, 19 Jul 2022 00:01:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH][dunfell] linux-yocto-rt/5.4: fixup -rt build
 breakage
Message-ID: <20220719040101.GA18692@denix.org>
References: <20220719034456.2312-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719034456.2312-1-bruce.ashfield@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 04:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168270

On Mon, Jul 18, 2022 at 11:44:56PM -0400, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Integrating the following commit(s) to linux-yocto/5.4:
> 
>     cc478e363cc3 rt: fixup random and irq/manage merge issues
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index 5bc1993cf2..fe75aee4da 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,7 +11,7 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>  
> -SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"

This does not match to what is currently in dunfell, so it won't apply:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb?h=dunfell#n14


> +SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
>  SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> -- 
> 2.19.1

