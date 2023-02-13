Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0615BC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 23:32:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.31232.1676331114726413407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 15:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rj4pJ809;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 343EE40006;
	Mon, 13 Feb 2023 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676331112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RAiCERB3biaTHFZZsDbdk6BEBt640S0iOO3o9XlnEA=;
	b=Rj4pJ8091FO8KkjFRnvUsN2kO7VB0mrO04gMXATy6YV5QxfInbtiK6J+8oNs2bnhPSsWWK
	Juzcn+pbi6qgksxuB+ESaHffUNdqCIZdbdpwsE5TQj+BvsmFQ8YbuyHeGXDX1wfQQVOp04
	Da/0JAoG85sM1twECTQdGVygOLpClf1STZpvqg18TI1FOJQgmmKpO1ADs44Kd4GiHyM+S9
	FK8g6Cy/jzr2T8EEK82PnzbnDIqc7lvbrniTfsSF9oSnHu+dw4cMLDjOT71Q+7hJeDEmqf
	XoKdYsDiekHqotEwyGv25YgZTrKBARCK7tY+VGcfeAmEPQAbvpZPFk+n0MXaEQ==
Date: Tue, 14 Feb 2023 00:31:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libcap: upgrade 2.66 -> 2.67
Message-ID: <Y+rIZ41H2YlQOKhV@mail.local>
References: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
 <1676256123-19590-2-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676256123-19590-2-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 23:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177118

On 13/02/2023 10:42:02+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> License-Update:
>  Add description: # +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0-only */
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-support/libcap/{libcap_2.66.bb => libcap_2.67.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libcap/{libcap_2.66.bb => libcap_2.67.bb} (94%)
> 
> diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.67.bb
> similarity index 94%
> rename from meta/recipes-support/libcap/libcap_2.66.bb
> rename to meta/recipes-support/libcap/libcap_2.67.bb
> index c50e9d8cc7..4d4d6d9df1 100644
> --- a/meta/recipes-support/libcap/libcap_2.66.bb
> +++ b/meta/recipes-support/libcap/libcap_2.67.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
>  LICENSE = "BSD-3-Clause | GPL-2.0-only"
>  LIC_FILES_CHKSUM_PAM = "file://pam_cap/License;md5=0ad4c9c052b9719ee4fce1bfc7c7dee4"
>  LIC_FILES_CHKSUM = "\
> -    file://License;md5=e2370ba375efe9e1a095c26d37e483b8 \
> +    file://License;md5=2965a646645b72ecee859b43c592dcaa \

ERROR: libcap-2.67-r0 do_populate_lic: QA Issue: libcap: The LIC_FILES_CHKSUM does not match for file://pam_cap/License;md5=0ad4c9c052b9719ee4fce1bfc7c7dee4
ERROR: libcap-2.67-r0 do_populate_lic: Fatal QA errors were found, failing task.

>      ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}', '', d)} \
>  "
>  
> @@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
>  SRC_URI:append:class-nativesdk = " \
>             file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
>             "
> -SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
> +SRC_URI[sha256sum] = "ce9b22fdc271beb6dae7543da5f74cf24cb82e6848cfd088a5a069dec5ea5198"
>  
>  UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177082): https://lists.openembedded.org/g/openembedded-core/message/177082
> Mute This Topic: https://lists.openembedded.org/mt/96927968/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

