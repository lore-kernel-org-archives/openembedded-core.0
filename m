Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 67559719C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E09A20901;
	Thu, 20 Oct 2016 13:45:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WpfIPn33IMFx; Thu, 20 Oct 2016 13:45:17 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2877E208EE;
	Thu, 20 Oct 2016 13:45:15 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id A6E60162176; Thu, 20 Oct 2016 09:45:14 -0400 (EDT)
Date: Thu, 20 Oct 2016 09:45:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161020134514.GX2494@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<20161020133514.3403-3-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161020133514.3403-3-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/4] u-boot: Drop PV altogether
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
X-List-Received-Date: Thu, 20 Oct 2016 13:45:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 20, 2016 at 03:35:13PM +0200, Marek Vasut wrote:
> Drop the explicit setting of PV altogether. This changes the U-Boot
> version string from "v20yy.mm" to "20yy.mm" , so layer setting the
> PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
> V2: - Add PE=1 to increment the epoch of the package, as the version
>       numbering changes in non-backward-compatible way.
> ---
>  meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> index 0a90621..e7f6364 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> @@ -3,14 +3,13 @@ SECTION = "bootloaders"
>  
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
> +PE="1"

^^^^^^^^
Formatting! My OCD is going to kill me... :)



>  # This revision corresponds to the tag "v2016.09.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
>  SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>  
> -PV = "v2016.09.01"
> -
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.9.3
> 

