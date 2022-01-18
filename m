Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B5EC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 20:48:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.129.1642538904531256055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 12:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 49B8940C32;
	Tue, 18 Jan 2022 20:48:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNaXV14NeOVa; Tue, 18 Jan 2022 20:48:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25D6540A46;
	Tue, 18 Jan 2022 20:48:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6B514174721; Tue, 18 Jan 2022 15:48:20 -0500 (EST)
Date: Tue, 18 Jan 2022 15:48:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 05/14] lttng-tools: Add missing DEPENDS on
 bison-native
Message-ID: <20220118204820.GN26229@denix.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <20210920124621.1576702-5-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920124621.1576702-5-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 20:48:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160679

Steve,

Can we get this backported to dunfell, please? Thanks!


On Mon, Sep 20, 2021 at 01:46:12PM +0100, Richard Purdie wrote:
> This was being provided by other pieces of the dependency chain but is
> specifically required by configure and could fail if those pieces come
> from sstate. Fix such builds by adding the missing dependency.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> index 95bb2519d7d..47cab42fcf5 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
>  
>  include lttng-platforms.inc
>  
> -DEPENDS = "liburcu popt libxml2 util-linux"
> +DEPENDS = "liburcu popt libxml2 util-linux bison-native"
>  RDEPENDS:${PN} = "libgcc"
>  RRECOMMENDS:${PN} += "${LTTNGMODULES}"
>  RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

