Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000EFC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 22:54:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1592.1643842462931328620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 14:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5FD9340C82;
	Wed,  2 Feb 2022 22:54:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT7ohurVX6xL; Wed,  2 Feb 2022 22:54:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D53340AB7;
	Wed,  2 Feb 2022 22:54:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 219CF174738; Wed,  2 Feb 2022 17:54:21 -0500 (EST)
Date: Wed, 2 Feb 2022 17:54:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 28/33] lttng-tools: upgrade 2.13.2 -> 2.13.4
Message-ID: <20220202225421.GG26229@denix.org>
References: <20220202182758.919991-1-alex@linutronix.de>
 <20220202182758.919991-28-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202182758.919991-28-alex@linutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 22:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161263

https://git.openembedded.org/openembedded-core/commit/?id=7de004c74447b3075abb9641843254a7a5c7233b


On Wed, Feb 02, 2022 at 07:27:53PM +0100, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../lttng/{lttng-tools_2.13.2.bb => lttng-tools_2.13.4.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.2.bb => lttng-tools_2.13.4.bb} (98%)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> similarity index 98%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> index d6ce2c7e32..98b91270ba 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://disable-tests.patch \
>             "
>  
> -SRC_URI[sha256sum] = "ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd"
> +SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
>  
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>  
> -- 
> 2.20.1
> 

