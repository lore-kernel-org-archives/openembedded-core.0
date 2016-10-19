Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8A460123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFC83208EE;
	Wed, 19 Oct 2016 20:11:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FJ-3u9yROX8X; Wed, 19 Oct 2016 20:11:00 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D0CD0200CC;
	Wed, 19 Oct 2016 20:10:58 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 2A932162176; Wed, 19 Oct 2016 16:10:58 -0400 (EDT)
Date: Wed, 19 Oct 2016 16:10:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20161019201058.GQ2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-2-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20161018215513.2873-2-marex@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Wed, 19 Oct 2016 20:10:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 18, 2016 at 11:55:10PM +0200, Marek Vasut wrote:
> Upgrade U-Boot to the latest version.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc}   | 8 ++++----
>  .../{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} | 0
>  .../{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb}   | 0
>  .../u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb}            | 0
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc} (59%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> similarity index 59%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> index 403e316..ead5077 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> @@ -4,13 +4,13 @@ SECTION = "bootloaders"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>  
> -# This revision corresponds to the tag "v2016.03"
> +# This revision corresponds to the tag "v2016.09.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
> +SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>  
> -PV = "v2016.03+git${SRCPV}"
> +PV = "v2016.09.01+git${SRCPV}"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2016.03.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> -- 
> 2.9.3
> 

