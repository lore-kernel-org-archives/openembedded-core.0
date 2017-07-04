Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 46A7E6067D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 23:10:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3x2KVH5dfGz1qsDN;
	Wed,  5 Jul 2017 01:10:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3x2KVH4Smzz3jgYH;
	Wed,  5 Jul 2017 01:10:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id GS2m0XBjGRC0; Wed,  5 Jul 2017 01:10:28 +0200 (CEST)
X-Auth-Info: 2unFZD8VKGt8mNkeAV90UfM3Ko8sMUdUSAYgxyUOI6g=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  5 Jul 2017 01:10:28 +0200 (CEST)
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20170704220128.28747-1-otavio@ossystems.com.br>
From: Marek Vasut <marex@denx.de>
Message-ID: <933095de-34ee-963a-cc7f-55f76956355c@denx.de>
Date: Wed, 5 Jul 2017 01:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170704220128.28747-1-otavio@ossystems.com.br>
Subject: Re: [RFT PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Tue, 04 Jul 2017 23:10:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 07/05/2017 12:01 AM, Otavio Salvador wrote:
> This patch upgrades the U-Boot to the 2017.07-rc3 release; for now it
> is not intended to be merged but to expose possible problems prior the
> official release so we may try to include fixes for final release.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0

NAK, you're updating to -rc3 yet mark it as final release , that's wrong.

>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> similarity index 88%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> index 0e52f27df8..3c0ee2341b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> +SRCREV = "2f4c1d83f4e838bda4a02a408321aebc746b9eaa"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.05.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2017.05.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> 


-- 
Best regards,
Marek Vasut

