Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web12.36696.1599998198560292092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 04:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Bq7J44Z2Xz1rsXY;
	Sun, 13 Sep 2020 13:56:36 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Bq7J44Cy1z1qrg1;
	Sun, 13 Sep 2020 13:56:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 1IozNouXOcob; Sun, 13 Sep 2020 13:56:35 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Sun, 13 Sep 2020 13:56:35 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 0D4144540606;
	Sun, 13 Sep 2020 13:56:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new, port 10024)
	with ESMTP id Z9fDVQUabx7n; Sun, 13 Sep 2020 13:56:32 +0200 (CEST)
Received: from [192.168.178.47] (stefano-MacBookPro.fritz.box [192.168.178.47])
	by babic.homelinux.org (Postfix) with ESMTPS id 0F4FD454022F;
	Sun, 13 Sep 2020 13:56:32 +0200 (CEST)
Subject: Re: [OE-core] [PATCH] libubootenv: upgrade 0.3 -> 0.3.1
To: pjtexier@koncepto.io, openembedded-core@lists.openembedded.org
Cc: sbabic@denx.de
References: <1599917828-7283-1-git-send-email-pjtexier@koncepto.io>
From: "Stefano Babic" <sbabic@denx.de>
Message-ID: <c5ea68a2-8c13-5d5e-8915-99c7c8d6eaa5@denx.de>
Date: Sun, 13 Sep 2020 13:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599917828-7283-1-git-send-email-pjtexier@koncepto.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12.09.20 15:37, Pierre-Jean Texier via lists.openembedded.org wrote:
> This is a bugfix release which includes the following changes:
> 
> 824551a Prepare 0.3.1
> ca6aaa1 Fix file reading/writing when the environment is in EEPROM
> a031dea Fix regression in UBI volume support
> c91c150 Define SOVERSION to indicate API version
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>   meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} (94%)
> 
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
> similarity index 94%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
> index 0771148..613e316 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
>   SECTION = "libs"
>   
>   SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
> +SRCREV = "824551ac77bab1d0f7ae34d7a7c77b155240e754"
>   
>   S = "${WORKDIR}/git"
>   


Reviewed-by: Stefano Babic <sbabic@denx.de>

Best regards,
Stefano Babic

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
