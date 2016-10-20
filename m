Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6B760720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D544820901;
	Thu, 20 Oct 2016 13:46:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id veS4LrJBfaXG; Thu, 20 Oct 2016 13:46:25 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F18A208EE;
	Thu, 20 Oct 2016 13:46:23 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 4A345162176; Thu, 20 Oct 2016 09:46:23 -0400 (EDT)
Date: Thu, 20 Oct 2016 09:46:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161020134623.GZ2494@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<20161020133514.3403-2-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161020133514.3403-2-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] u-boot: Drop the +git part from PV
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
X-List-Received-Date: Thu, 20 Oct 2016 13:46:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 20, 2016 at 03:35:12PM +0200, Marek Vasut wrote:
> The U-Boot package is using release versions of U-Boot,
> so drop the extra +git part from PV.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> index ead5077..0a90621 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>  # repo during parse
>  SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>  
> -PV = "v2016.09.01+git${SRCPV}"
> +PV = "v2016.09.01"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
>  
> -- 
> 2.9.3
> 

