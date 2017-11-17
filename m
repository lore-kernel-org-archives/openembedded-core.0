Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3650A78834
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 19:19:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3ydnxK26Q9z1qqyt;
	Fri, 17 Nov 2017 20:19:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3ydnxJ6LfXz1wdNb;
	Fri, 17 Nov 2017 20:19:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id wWDPS83hjE62; Fri, 17 Nov 2017 20:19:45 +0100 (CET)
X-Auth-Info: 9EjJdomz8/SBqNGwaL0cMxM9aeR83kSp4DF/0UoPj0Q=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 17 Nov 2017 20:19:45 +0100 (CET)
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
From: Marek Vasut <marex@denx.de>
Message-ID: <c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
Date: Fri, 17 Nov 2017 20:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171114183223.7804-1-otavio@ossystems.com.br>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Fri, 17 Nov 2017 19:19:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 07:32 PM, Otavio Salvador wrote:
> This upgrades the U-Boot from 2017.09 to 2017.11 release.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  .../u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc}     | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb}   | 0
>  .../u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb}     | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb}        | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc} (89%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb} (100%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> similarity index 89%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> index 02e51242cb..bfdf1a0d8f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> @@ -7,7 +7,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> +SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \

This patch ^ could use a refresh , since it applies with Fuzz now.

[...]

-- 
Best regards,
Marek Vasut

