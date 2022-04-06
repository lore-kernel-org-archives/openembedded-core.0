Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6978DC4707F
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.5876.1649231094574918512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 00:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PsbMD3xo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 622AE240010;
	Wed,  6 Apr 2022 07:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649231092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rJI6l9p7vJOuGdQBpmgiAUnDg/08xJjt6pPEkNH3orw=;
	b=PsbMD3xojPa5QT6auQmx8kqMkz+Q3lBFnTZhfbFBIyNYZC6k5BNnw+qiAuQ5Mz0cdur3va
	3G2eO2UMhslAbw0IGWDpYgn/6TM0PHvS37bUlko30JWefu/Q65uDVSsjG+W4LXEdJCGJzH
	FPtRN9LUwbaefOW8iOdnPUd8jRVUMbgfmUUz/Bhu9GXWZAgd39XNc0U3CJItDNYKE+AIAv
	VOjUOKxEF6GWEF8TLQ7liJ3qdrCNNKovbAraqZVs9dB9IpIVs3P6aqhFKuVE4D88+Nw5Rv
	jqnp+sfkGAxDFBIRs3vcWnRQUsqKWmulhStv2QsjVwpnqGixnh6R45c04nm9UA==
Date: Wed, 6 Apr 2022 09:44:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] pseudo: Update to latest to fix link handling
Message-ID: <Yk1E9GiFLchs5KKn@mail.local>
References: <20220405220328.4040-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405220328.4040-1-chaitanya.vadrevu@ni.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164059

Hi,

I'm sorry, I forgot to send my patch to the ML after build testing but
this is already in master.

On 05/04/2022 17:03:28-0500, Chaitanya Vadrevu wrote:
> Update to latest version of pseudo which includes a fix to handle
> absolute links correctly. This fixes ldconfig failures in OE builds
> when rootfs contains absolute links.
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index d20136aef9..e7ef6a730c 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
>      file://older-glibc-symbols.patch"
>  SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
>  
> -SRCREV = "df1d1321fb093283485c387e3c933d2d264e509c"
> +SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
>  S = "${WORKDIR}/git"
>  PV = "1.9.0+git${SRCPV}"
>  
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164053): https://lists.openembedded.org/g/openembedded-core/message/164053
> Mute This Topic: https://lists.openembedded.org/mt/90277234/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

