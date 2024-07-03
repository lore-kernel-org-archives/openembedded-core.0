Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7BBC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:03:56 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.51120.1720015429012333396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cjlk1LtQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10050240005;
	Wed,  3 Jul 2024 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720015427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hrplus1eGJ9bSNmVqH/AqR2DHOedmUddWWKdeK8XGLA=;
	b=cjlk1LtQwuH77807C0M7aIHD/aqVD2Qwt+to+xA20L1iElvQ2h0KL5azuB87lmWIHo2Gye
	T0w5I52xbw6G0Xl6zVSQseGFIK7ivV3SVFSGJ0KvyeIgciMeX/q4KhEWjkraUUKKAJDk2k
	HmMQ3MRYvCCr67vy5AKlFFcnK9/8St4ueB1XdTqtG7xbsg73VfcC+JK13iD5ZWk7x/jF/3
	onRbGl7VIz09wbazxK5EUaeqV4o1z/LNWHVIDhUlUloIrv9d3v8hHzmzd+rLET+pl+Me/w
	nmpEpm8zD3xffgRYXGWNYTCSOJauR27+Fsf9fvkKNUMl9aOSK+ko0iktnJ23QQ==
Date: Wed, 3 Jul 2024 16:03:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	=?iso-8859-1?Q?Jo=E3o?= Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] less: upgrade 643 -> 661
Message-ID: <20240703140346c0fea020@mail.local>
References: <20240703004656.2295327-1-yi.zhao@windriver.com>
 <20240703004656.2295327-2-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703004656.2295327-2-yi.zhao@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201490

Hello,

This causes new ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6772/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6594/steps/12/logs/stdio

{'less': 'START: ptest-runner\n'
         '2024-07-03T09:13\n'
         "Can't locate File/Basename.pm in @INC (you may need to install the "
         'File::Basename module) (@INC entries checked: '
         '/usr/lib/perl5/site_perl/5.38.2/aarch64-linux '
         '/usr/lib/perl5/site_perl/5.38.2 '
         '/usr/lib/perl5/vendor_perl/5.38.2/aarch64-linux '
         '/usr/lib/perl5/vendor_perl/5.38.2 '
         '/usr/lib/perl5/5.38.2/aarch64-linux /usr/lib/perl5/5.38.2) at '
         './runtest line 8.\n'
         'BEGIN failed--compilation aborted at ./runtest line 8.\n'
         '\n'
         'ERROR: Exit status is 2\n'
         'DURATION: 0\n'}

On 03/07/2024 08:46:56+0800, Yi Zhao wrote:
> ChangeLog:
> https://www.greenwoodsoftware.com/less/news.661.html
> 
> License-Update: Update copyright year to 2024
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-extended/less/{less_643.bb => less_661.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/less/{less_643.bb => less_661.bb} (91%)
> 
> diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_661.bb
> similarity index 91%
> rename from meta/recipes-extended/less/less_643.bb
> rename to meta/recipes-extended/less/less_661.bb
> index 67834bdd58..c3f5853ea4 100644
> --- a/meta/recipes-extended/less/less_643.bb
> +++ b/meta/recipes-extended/less/less_661.bb
> @@ -21,7 +21,7 @@ SECTION = "console/utils"
>  
>  LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
> -                    file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
> +                    file://LICENSE;md5=ea7ea443692720f3015859945c0fb65d \
>                      "
>  DEPENDS = "ncurses"
>  
> @@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
>             file://run-ptest \
>             "
>  
> -SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
> +SRC_URI[sha256sum] = "2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
>  
>  UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201447): https://lists.openembedded.org/g/openembedded-core/message/201447
> Mute This Topic: https://lists.openembedded.org/mt/107011832/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

