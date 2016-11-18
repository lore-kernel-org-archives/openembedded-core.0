Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 526D571A19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A399520AB6;
	Fri, 18 Nov 2016 19:44:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yHGWbZuMPkYH; Fri, 18 Nov 2016 19:44:43 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5CB28201BD;
	Fri, 18 Nov 2016 19:44:40 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 59DE61621A4; Fri, 18 Nov 2016 14:44:39 -0500 (EST)
Date: Fri, 18 Nov 2016 14:44:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161118194439.GF26131@denix.org>
References: <20161118192955.17284-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161118192955.17284-1-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Fri, 18 Nov 2016 19:55:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2016 at 08:29:55PM +0100, Marek Vasut wrote:
> Upgrade U-Boot to the latest version.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> Cc: Ross Burton <ross.burton@intel.com>
> ---
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> similarity index 71%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> index f706a6b..84adc1c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> @@ -7,8 +7,8 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
> +SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
> +SRC_URI = "git://git.denx.de/u-boot.git"

Will it branch off into own branch eventually? Does master ever get 
re-written? I guess as long as this commit always stays in master, it should 
be fine.


>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> -- 
> 2.10.2
> 

