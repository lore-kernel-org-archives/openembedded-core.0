Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0359B60722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2F0E6208EE;
	Wed, 19 Oct 2016 20:10:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id y0O4zyQeLmRG; Wed, 19 Oct 2016 20:10:25 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 01199200CC;
	Wed, 19 Oct 2016 20:10:22 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 02A19162176; Wed, 19 Oct 2016 16:10:21 -0400 (EDT)
Date: Wed, 19 Oct 2016 16:10:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161019201021.GP2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161018215513.2873-4-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Wed, 19 Oct 2016 20:10:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 18, 2016 at 11:55:12PM +0200, Marek Vasut wrote:
> Drop the explicit setting of PV altogether. This changes the U-Boot
> version string from "v20yy.mm" to "20yy.mm" , so layer setting the
> PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.

Finally!
But do we need to bump PE to ensure upgrade path and proper sorting?


> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> index 0a90621..a535df1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
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

