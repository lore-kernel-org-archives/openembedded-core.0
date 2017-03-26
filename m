Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id EFF8F72F0E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A6717208E3;
	Sun, 26 Mar 2017 21:14:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id X45jbou_Z_yO; Sun, 26 Mar 2017 21:14:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 84D54208CB;
	Sun, 26 Mar 2017 21:14:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F109916242A; Sun, 26 Mar 2017 17:14:38 -0400 (EDT)
Date: Sun, 26 Mar 2017 17:14:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170326211438.GI15664@denix.org>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170326200813.23705-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Sun, 26 Mar 2017 21:14:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 26, 2017 at 05:08:13PM -0300, Otavio Salvador wrote:
> Ths 2017.03 release is out since March 13th 2017 and is the latest
> stable release prior Pyro release.

At least 2 typos in the description...


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb}        | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc} (86%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> similarity index 86%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> index df24c853dd..c115f36831 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
> +SRCREV = "8537ddd769f460d7fb7a62a3dcc9669049702e51"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.03.bb
> -- 
> 2.12.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

