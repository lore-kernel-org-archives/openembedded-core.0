Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0877EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 17:24:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.40457.1694366638960557496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 10:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FktMGXM9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D376E60007;
	Sun, 10 Sep 2023 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694366637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0aa/owDf+84UvWMmsL6ABr8/y1dkD6tm9VoLV+Q8RY=;
	b=FktMGXM9EWpvl+ffhxCdMQcumM4SFJDjnscM5WOCGz9iF/AeBWf+A6m4ipKvtbaSG7h6fQ
	UcZOCl9igje5QLqkAP3gSoVHhU0MRrSEAxHib55OSPqDmQLQGnbEfpAVEubXyELvO05ffg
	eyJHwhC2ZRX4uVhmCgSSXS3CBgayYuzxyoNcnUDWa+rkvpmxp/HEleqfWQW0racdrg8qY3
	sW+H5RDPG8DabaylGRJ7Ya7OHCK7o7/uWlzlUz4NVKD3UnDv8dE+lPodqZrFmDTrZSXuHD
	9ZpCQOwIeEu1XFDIRje9g7TdZk3/AFOLjE7GG4d9B9kRAJFuMJo13S30AD7gZw==
Date: Sun, 10 Sep 2023 19:23:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] defaultsetup: Inherit create-spdx by default
Message-ID: <202309101723563caf492d@mail.local>
References: <20230910082556.3593410-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910082556.3593410-1-richard.purdie@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 17:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187472

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7743/steps/11/logs/stdio :(



On 10/09/2023 09:25:56+0100, Richard Purdie wrote:
> This has been tested in poky by default for a while and ew've hopefully resolved
> most of the gremlins. THis is the direction we're recommending for license/manifest
> requirements so set it by default for OE.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/defaultsetup.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> index 1abb5096293..90b68057ad4 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -14,7 +14,7 @@ TMPDIR .= "${TCLIBCAPPEND}"
>  
>  USER_CLASSES ?= ""
>  PACKAGE_CLASSES ?= "package_ipk"
> -INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
> +INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
>  INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
>  
>  INIT_MANAGER ??= "none"
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187451): https://lists.openembedded.org/g/openembedded-core/message/187451
> Mute This Topic: https://lists.openembedded.org/mt/101269714/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

