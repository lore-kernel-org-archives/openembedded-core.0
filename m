Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00B7C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:07:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.7736.1665497221480523262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 07:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mO/L7eV9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D623B60007;
	Tue, 11 Oct 2022 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665497219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FurLQjKSAw/6YQvTf7JIlcmw0qFRFIpqZSf4aYDJoHM=;
	b=mO/L7eV9S/rPxfFRPumiuRIsDp8xWlHunW896Kf2OsnKmLqgqDFo5PlIVGG4FLFfcIbjbS
	Ec8pWE2/R+eeMBtKMIPkXkmXo+UU1VfdlRLBy4C8aeeT5K1w3860mCN2QaMmuzDY7tWj9f
	9y8e5LgBUALfNeEtSbctVGfz4MOsrcqVs231PiaHo0jzuqiZXtBiO8jLw21UiabU34zu40
	xzJajXFFwQi94YavNdm6Xku8LVjA60/1JTjgub33Nsya52h38Cfea8Y3EUS028XhhCEaDd
	lV9K4s1/uO2avJPNYh0jBsd2vsYxglDI8VpqwMZPcobsFXU5cgdRNI/rg3pOJA==
Date: Tue, 11 Oct 2022 16:06:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libffi: upgrade 3.4.2 -> 3.4.3
Message-ID: <Y0V4gdZi9Y3Z0LQe@mail.local>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:07:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171626

Hello,

This causes the following warning:

https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/1815/steps/13/logs/warnings

Please test your patches before sending them

On 11/10/2022 16:05:54+0800, wangmy wrote:
> License-Update: Copyriht year updated to 2022.
> 
> Changelog:
> =========
>   All struct args are passed by value, regardless of size, as per ABIs.
>   Enable static trampolines for Cygwin.
>   Add support for Loongson's LoongArch64 architecture.
>   Fix x32 static trampolines.
>   Fix 32-bit x86 stdcall stack corruption.
>   Fix ILP32 aarch64 support.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libffi/{libffi_3.4.2.bb => libffi_3.4.3.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.3.bb} (90%)
> 
> diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.3.bb
> similarity index 90%
> rename from meta/recipes-support/libffi/libffi_3.4.2.bb
> rename to meta/recipes-support/libffi/libffi_3.4.3.bb
> index 41c3cad586..d2c86d1f9b 100644
> --- a/meta/recipes-support/libffi/libffi_3.4.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.4.3.bb
> @@ -8,13 +8,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
>  A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
>  
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=32c0d09a0641daf4903e5d61cc8f23a8"
>  
>  SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
>             file://not-win32.patch \
>             file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
>             "
> -SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
> +SRC_URI[sha256sum] = "4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8"
>  
>  EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
>  EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171600): https://lists.openembedded.org/g/openembedded-core/message/171600
> Mute This Topic: https://lists.openembedded.org/mt/94254211/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

