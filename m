Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AFAC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 07:16:03 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.78872.1723187757573997966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 00:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k0neZ0gf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E659240004;
	Fri,  9 Aug 2024 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723187755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXUBM3moPKxAKNzZPWKc0xjxH9vyejAfp62qN1s0laA=;
	b=k0neZ0gf5mbnkyGgmveE4sH4cu47SqqLlBMwO1p2ntYr4mkyLHPFmXCNcxbC7GCz5sBWKA
	sJ9R2gvh/jpMB0aeP6yUnfk4DSvYS2PUGjSdMmj8GUIuTGHBl1f+mnQWUDMBzIyUGo0td+
	cmn5+2qsy+74+5odgigyauBZ5a9t1SK8AgRVk0QiNjGb9y6DaZgf7VxahudCy5eRO4bktv
	w6m5PfSFe4zBCRb0p0XX3qj73paNuVbPFquejgybZZlnkGJeJBFmu1XdanSik3oHxD3LRM
	AsZsYa7XQLJMNuQyIAZjZlKoR8a9wzU4ARLFPMDWE+FLvxVwOjLzTe2fsWYxVA==
Date: Fri, 9 Aug 2024 09:15:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Subject: Re: [OE-core] [V3][master][PATCH] libcap-ng: update SRC_URI
Message-ID: <20240809071554ec7f422f@mail.local>
References: <f5369479504970df6863b80f3e808b69bbd09f47.camel@linuxfoundation.org>
 <20240809054509.127080-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809054509.127080-1-changqing.li@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 07:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203158

Please do not send new version as replies to previous versions, this bury
them under a pile of patches.

Also, it would be great to have a changelog.

On 09/08/2024 13:45:09+0800, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Refer [1], people.redhat.com has certificate issue, so update SRC_URI
> to fix do_fetch warning
> 
> [1] https://github.com/stevegrubb/libcap-ng/issues/56
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libcap-ng/libcap-ng-python_0.8.5.bb                |  2 --
>  meta/recipes-support/libcap-ng/libcap-ng.inc           | 10 +++++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
> index f8a6b2c317..f702056f02 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
> +++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
> @@ -8,8 +8,6 @@ inherit python3targetconfig
>  
>  DEPENDS += "libcap-ng python3 swig-native"
>  
> -S = "${WORKDIR}/libcap-ng-${PV}"
> -
>  EXTRA_OECONF += "--with-python3"
>  
>  do_install() {
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
> index 85b51c4dc6..4c8ffd41c2 100644
> --- a/meta/recipes-support/libcap-ng/libcap-ng.inc
> +++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
> @@ -7,14 +7,18 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>  
> -SRC_URI = "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
> +SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master \
>             file://0001-Fix-python-path-when-invoking-py-compile-54.patch \
>             "
> -
> -SRC_URI[sha256sum] = "3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff"
> +SRCREV = "f5d39702622208b3ada064d7b2eaeaf1454c9bd3"
> +S = "${WORKDIR}/git"
>  
>  inherit lib_package autotools
>  
> +do_configure:prepend() {
> +    touch ${S}/NEWS
> +}
> +
>  EXTRA_OECONF:append:class-target = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
>  EXTRA_OECONF:append:class-nativesdk = " --with-capability_header=${STAGING_INCDIR}/linux/capability.h"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203149): https://lists.openembedded.org/g/openembedded-core/message/203149
> Mute This Topic: https://lists.openembedded.org/mt/107803611/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

