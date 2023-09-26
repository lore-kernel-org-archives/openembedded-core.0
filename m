Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6351AE7F12D
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:18:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3012.1695763114701109689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B8+a+KG0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9771660006;
	Tue, 26 Sep 2023 21:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695763113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtMenFY1wop+8kydoO5JiXNaEDtae3tDPgLJLk8KFOg=;
	b=B8+a+KG0mJKe5qT/v+roXK1aalKOGQce9Tc+If86R6xvMO4wW6guvGSUHtcdzSIc6o2beL
	tYfR1DL1U95pCIahIf9AHOIuGiW065D3TZRF5vfQtxdpcp8FbmakyG2m+2Gi9aVfXOtRJG
	gKYzmPv4VXhNwm4srAedggvLdw/huHB9bQo8Wgq07zZAZ/zHjquDsVE/livyZYPyvuI5jv
	yZWc+BAt1KD4Ly5im66PIj/ycbKU6z/9Q66zYuxWq612HSONI2ceCBEBLKXyI9vsZbwbzS
	jkO0ah96Z8133Z5CevGemiclhAzXLd1odbIo+61QhKkRiaUjl9TxL9gZBpFj4Q==
Date: Tue, 26 Sep 2023 23:18:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-numpy: upgrade 1.25.2 -> 1.26.0
Message-ID: <2023092621183233b7ad2f@mail.local>
References: <1695716688-8983-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695716688-8983-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188266

Hello,

On 26/09/2023 16:24:48+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> License-Update: split license file in standard BSD 3-clause and bundled.
> 
> Changelog:
> ==========
>     Python 3.12.0 support.
>     Cython 3.0.0 compatibility.
>     Use of the Meson build system

I'm a bit surprised you didn't need to add an "inherit meson", could you
check?

>     Updated SIMD support
>     f2py fixes, meson and bind(x) support
>     Support for the updated Accelerate BLAS/LAPACK library
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-numpy_1.25.2.bb => python3-numpy_1.26.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-numpy_1.25.2.bb => python3-numpy_1.26.0.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-numpy_1.25.2.bb
> rename to meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> index 4793b23a38..e94e431209 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
>  DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7614a5b0073688df53773ec6ec7fe81d"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
>  
>  SRCNAME = "numpy"
>  
> @@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://disable_blas.patch \
>             file://run-ptest \
>             "
> -SRC_URI[sha256sum] = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760"
> +SRC_URI[sha256sum] = "f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf"
>  
>  GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
>  UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188229): https://lists.openembedded.org/g/openembedded-core/message/188229
> Mute This Topic: https://lists.openembedded.org/mt/101591676/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

