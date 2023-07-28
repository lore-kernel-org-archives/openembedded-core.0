Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1A6C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 10:31:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.29392.1690540295024635912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 03:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jqRlaC8l;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5505120007;
	Fri, 28 Jul 2023 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690540292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=my/y6tPVpMQjbVuvGax9TttMLC+YE9d3JZNVWoI5HKo=;
	b=jqRlaC8l6Yxxpu8C5fg/fdwbCtwosbZMSCJyQKESeFCO5UBvNzeVmS3WI44LrCT+2o/rbx
	65Q2CthAZ70GvASYCKSE/xUkKnpzbRyfM/hvROSMyRSwtu0/P6E0eVnnyLR4z2zxn5RgrR
	aP2cJLJYOOgwq4OEd2/nJFmU/Js8I90riFc07CETRcSFSLho9lijjssNLIUIUZjp5TEx1W
	ioPQGZZyAJl/FEv8rRdiIr5k7+IuGlxWTNLjj6L4S4DK0CrlyVZVF6sG0jLx1pfTBPTeF+
	0M8c4//X8cdkHHpKf32d2Jtolr0agbiz53xca+vpHFr1NAUbh9byL2Ppw4HTlA==
Date: Fri, 28 Jul 2023 12:31:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: j.lemetayer@kerlink.fr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] package: always sort the conffiles
Message-ID: <2023072810313162556501@mail.local>
References: <20230727153732.1104305-1-j.lemetayer@kerlink.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727153732.1104305-1-j.lemetayer@kerlink.fr>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 10:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185018

Hello,

On 27/07/2023 17:37:32+0200, Jean-Marie Lemetayer via lists.openembedded.org wrote:
> To improve package reproducibility, the conffiles order should not be
> directly linked to the file system.
> 
> Sorting the conffiles solves this issue.


This is missing you Signed-off-by tag.

> ---
>  meta/lib/oe/package.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 70040f09e7..9d70925b9b 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -613,7 +613,7 @@ def get_conffiles(pkg, d):
>          conf_list[i] = conf_list[i][1:]
>  
>      os.chdir(cwd)
> -    return conf_list
> +    return sorted(conf_list)
>  
>  def legitimize_package_name(s):
>      """
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184964): https://lists.openembedded.org/g/openembedded-core/message/184964
> Mute This Topic: https://lists.openembedded.org/mt/100392906/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

