Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1DCC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 07:30:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15142.1655364635534829980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 00:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SFqMqKR+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDDFBFF802;
	Thu, 16 Jun 2022 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655364633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IH39HkkcHw6bV6AtK/l093ckQAQ+kBg5JZM/BxN5BlU=;
	b=SFqMqKR+7oj2etKOevW9IJ58dPQj3XpxS2DYky/ndBj0FMIBVMfi3YwZgagxXmxabXyuBV
	+7nL5hS6l9P5ZT5UB+xiCvjoZfBzFO7w5HY8H5DuEySvrXHmHgD436mLQ+gtEFjzIodFoJ
	vgmWG1ZYyzyJdxMM91WvSvhGOdXwylLxnDR9i16tFiPiIne357Mjd43YUTHt+bEqMXY3Z9
	TFtS4VxfAxh53WbhRx/38Eza/+PIveAgANJIh5EtlMmR/M6VSOcHU73WfT4Z5yMCIKCZR1
	poYIqcCVoWPWWqNWe4EaPbr8SfKtCCQ6SYgjkjGtwAF5WnXR436rMHRRdjjg4Q==
Date: Thu, 16 Jun 2022 09:30:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sudo: upgrade 1.9.10 -> 1.9.11
Message-ID: <YqrcGIhjGQ2G4fQh@mail.local>
References: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 07:30:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167002

Hi,

It seems this fails on x32:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/5283/steps/11/logs/stdio

On 15/06/2022 16:19:50+0800, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11.bb} (96%)
> 
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.11.bb
> similarity index 96%
> rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
> rename to meta/recipes-extended/sudo/sudo_1.9.11.bb
> index aa0d814ed7..5e97d8a2cc 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.11.bb
> @@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
>  
>  PAM_SRC_URI = "file://sudo.pam"
>  
> -SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
> +SRC_URI[sha256sum] = "b5476e30d83ca14734da9370f2206beb21c8a33fc85a504fb8a61d18d8b351be"
>  
>  DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166920): https://lists.openembedded.org/g/openembedded-core/message/166920
> Mute This Topic: https://lists.openembedded.org/mt/91772378/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

