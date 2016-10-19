Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 55FDF71A5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDD29208EE;
	Wed, 19 Oct 2016 20:11:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dJQQDpkmqZkh; Wed, 19 Oct 2016 20:11:56 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE186200CC;
	Wed, 19 Oct 2016 20:11:54 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 12CB1162176; Wed, 19 Oct 2016 16:11:54 -0400 (EDT)
Date: Wed, 19 Oct 2016 16:11:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161019201154.GR2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-5-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161018215513.2873-5-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] u-boot: Drop redundant comment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2016 20:11:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 18, 2016 at 11:55:13PM +0200, Marek Vasut wrote:
> Drop comment stating that the SRCREV corresponds to particular U-Boot
> version. This comment is redundant, since the U-Boot version is part
> of the recipe filename.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> index a535df1..5b02c87 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> @@ -4,7 +4,6 @@ SECTION = "bootloaders"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>  
> -# This revision corresponds to the tag "v2016.09.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
>  SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
> -- 
> 2.9.3
> 

