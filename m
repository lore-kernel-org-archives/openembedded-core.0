Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4538C41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 23:15:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.6920.1702768540007145969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 15:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E/nrPz00;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39ECAC0003;
	Sat, 16 Dec 2023 23:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702768537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gbnjQWI+X4VlX9BRlfSsfs6rN3Y+XfLelboxcDTQhL4=;
	b=E/nrPz000guaf+K+7JzGm8of/khWF5a36iEigIuecWjcr4FIyQH8lFuJdFnhs/YR/AZfjC
	DAOke+Cu9TRqiRUkxA/X6fZJhS3cSeazhEhTk1yumd1aEDD4UlI/SmidPeRiEm/nk2UVHH
	Gez2m2SrXv0CeF5tqdhlM4JDah6N8wf6lF4uQ2DnQIlkQMh8AEzZSqCXoZs6qiewqVEzqS
	zdR1Dpg7hVDbL3RengrQHnfC7FNegrL4GIw3Ei3VYNYlXrc/m/Y+XXen0Ag8GTlU5jPJoB
	/AYqQ3dbK9fVRS946zB/EjZ/xWDIJ31/0cu+ftDAWvihP+6NKakA3xZZLtt1pg==
Date: Sun, 17 Dec 2023 00:15:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] debianutils: upgrade 5.14 -> 5.15
Message-ID: <2023121623153695195ea4@mail.local>
References: <20231216121516.452373-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231216121516.452373-1-yi.zhao@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 23:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192573

On 16/12/2023 20:15:16+0800, Yi Zhao wrote:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

The SoB must match you From:

> ---
>  .../debianutils/{debianutils_5.14.bb => debianutils_5.15.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/debianutils/{debianutils_5.14.bb => debianutils_5.15.bb} (97%)
> 
> diff --git a/meta/recipes-support/debianutils/debianutils_5.14.bb b/meta/recipes-support/debianutils/debianutils_5.15.bb
> similarity index 97%
> rename from meta/recipes-support/debianutils/debianutils_5.14.bb
> rename to meta/recipes-support/debianutils/debianutils_5.15.bb
> index deec8d1fe8..b1368a3b2e 100644
> --- a/meta/recipes-support/debianutils/debianutils_5.14.bb
> +++ b/meta/recipes-support/debianutils/debianutils_5.15.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
>  SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
>             "
>  
> -SRCREV = "7e63b32ea4126c70a5da958f0106add267810a94"
> +SRCREV = "d886c15810b58e57411048f57d7fb941a6819987"
>  
>  inherit autotools update-alternatives
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192558): https://lists.openembedded.org/g/openembedded-core/message/192558
> Mute This Topic: https://lists.openembedded.org/mt/103207618/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

