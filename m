Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D6AC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 22:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1558.1643842333743930752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 14:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E80C040C82;
	Wed,  2 Feb 2022 22:52:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z75GWmx8_oDj; Wed,  2 Feb 2022 22:52:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC90440AB7;
	Wed,  2 Feb 2022 22:52:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 01CDA174738; Wed,  2 Feb 2022 17:52:11 -0500 (EST)
Date: Wed, 2 Feb 2022 17:52:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 27/33] wayland-protocols: upgrade 1.24 -> 1.25
Message-ID: <20220202225210.GE26229@denix.org>
References: <20220202182758.919991-1-alex@linutronix.de>
 <20220202182758.919991-27-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202182758.919991-27-alex@linutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 22:52:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161261

https://git.openembedded.org/openembedded-core/commit/?id=66dc75cf5e6b741ef7ba011841cd5ceeebf17b36


On Wed, Feb 02, 2022 at 07:27:52PM +0100, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../{wayland-protocols_1.24.bb => wayland-protocols_1.25.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/wayland/{wayland-protocols_1.24.bb => wayland-protocols_1.25.bb} (91%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
> similarity index 91%
> rename from meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
> rename to meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
> index 0cfdb90b68..074801b22d 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
>  
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             "
> -SRC_URI[sha256sum] = "bff0d8cffeeceb35159d6f4aa6bab18c807b80642c9d50f66cba52ecf7338bc2"
> +SRC_URI[sha256sum] = "f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  
> -- 
> 2.20.1
> 

