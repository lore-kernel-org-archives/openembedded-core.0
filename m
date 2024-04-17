Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFCCC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 16:27:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.18479.1713371247694695178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 09:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dj2JAk+B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE8214000A;
	Wed, 17 Apr 2024 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713371245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EmIkX6wEepSYF+U9E68cIHz245xHic6G9RYnywBV66Y=;
	b=dj2JAk+B1e1DXM53+HhSR/p/fm1TVDHdQ9ZZtGmZA01PGBDiFsa5Us00gt3TF/hWdBUTyu
	Y5PH2EIahndL6hffCHIX+POYGdojtQ3qRE+RitUmRyjyk1rIeDMEHSF6NOt3R/T+367x4X
	oVndzrw7rs3bH/8AKAAvA1GXxDCjAR53j03z8EKtGyAnHroqHvk/pQTH8LCgFYTuMd0W2h
	1JQ1b2G0RtCUlHlFrVkxfn9npSqhF8z1kqUZqDF5/04JKPLAv4h+gOJ1Rzp/hnJLBXJlfS
	ZgvvvCWMSnZwJpKBgvX+IRcPd7yFUvOFd0W2a/5gEyTwwHHrl1Ye3x1LJkueRQ==
Date: Wed, 17 Apr 2024 18:27:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [OE-core][PATCH 2/2] linux-firmware: add a package for ath12k
 firmware
Message-ID: <2024041716272100e944e3@mail.local>
References: <20240314100610.21815-1-brgl@bgdev.pl>
 <20240314100610.21815-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314100610.21815-2-brgl@bgdev.pl>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 16:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198470

Hello,

Now that master has dverged from Scarthgap, can you rebase?

On 14/03/2024 11:06:10+0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the firmware package for the ATH12K module.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../linux-firmware/linux-firmware_20240312.bb             | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> index 390d10d2f3..4961b43ad5 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> @@ -320,7 +320,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-cnm-license ${PN}-cnm \
>               ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
>               ${PN}-gplv2-license ${PN}-carl9170 \
> -             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
> +             ${PN}-ar3k-license ${PN}-ar3k \
> +             ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
>               \
>               ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
>               \
> @@ -488,6 +489,10 @@ FILES:${PN}-ath11k = " \
>    ${nonarch_base_libdir}/firmware/ath11k \
>  "
>  
> +FILES:${PN}-ath12k = " \
> +  ${nonarch_base_libdir}/firmware/ath12k \
> +"
> +
>  FILES:${PN}-qca = " \
>    ${nonarch_base_libdir}/firmware/qca \
>  "
> @@ -495,6 +500,7 @@ FILES:${PN}-qca = " \
>  RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
>  RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
> +RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
>  RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
>  
>  # For ralink
> -- 
> 2.40.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197102): https://lists.openembedded.org/g/openembedded-core/message/197102
> Mute This Topic: https://lists.openembedded.org/mt/104923522/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

