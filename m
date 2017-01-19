Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2274A600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 96E4420B66;
	Thu, 19 Jan 2017 17:20:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Dkg8sCAdcPvT; Thu, 19 Jan 2017 17:20:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F6192017C;
	Thu, 19 Jan 2017 17:20:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C3F53162324; Thu, 19 Jan 2017 12:20:12 -0500 (EST)
Date: Thu, 19 Jan 2017 12:20:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170119172012.GW15833@denix.org>
References: <20170119152151.15814-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20170119152151.15814-1-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to 2017.01 release
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
X-List-Received-Date: Thu, 19 Jan 2017 17:20:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 19, 2017 at 04:21:51PM +0100, Marek Vasut wrote:
> Upgrade U-Boot to the latest version.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../u-boot/{u-boot-common_2016.11.inc => u-boot-common_2017.01.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2016.11.bb => u-boot-fw-utils_2017.01.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2016.11.bb => u-boot-mkimage_2017.01.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2016.11.bb => u-boot_2017.01.bb}        | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2016.11.inc => u-boot-common_2017.01.inc} (86%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.11.bb => u-boot-fw-utils_2017.01.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.11.bb => u-boot-mkimage_2017.01.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2016.11.bb => u-boot_2017.01.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> similarity index 86%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> index 84adc1c56a..df24c853dd 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
> +SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> -- 
> 2.11.0
> 

