Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A5C48BD1
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.8170.1649750844865933385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 01:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eHq0ima2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D6E861C000A;
	Tue, 12 Apr 2022 08:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649750843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fFtRV6QwleKtJEgACmo2DhrQU9TTYb4ff/r2C3dyF9w=;
	b=eHq0ima2wqzaHoMYcpRNOKbiySwESdTGC/LpF35yNfNEmZhruqPtAr13pcBOdpCgIOSEDG
	WDc43N9qPKtMKOguVeIdlhBut6fuuE6T+yA/b+161ie34i3pdJNHsCVUmJZXk/xBJfB48N
	RM0dE2gMZkdpzNQUUyVhGxvTxM6BRQd8VgPic94g22fWOfBaTHQXTb6YiCyGpjY8W/5P4t
	yheWAVIe4ojNNr5wV4LosFBS7flUa9dBWfaJE9Nn5szOSIvkaEP2OJ4q227RtT+z6bx30D
	OiZDZwJRxTVHpH455TvVIHmvXim7+fZhvIvIWnABUWi9iU35hZ5V14Wmemwkqw==
Date: Tue, 12 Apr 2022 10:07:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/2] pango: Upgrade to 1.50.6
Message-ID: <YlUzOsgctKOiW87c@mail.local>
References: <20220410231659.717650-1-raj.khem@gmail.com>
 <20220410231659.717650-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410231659.717650-2-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164259

Hi Khem,

On 10/04/2022 16:16:59-0700, Khem Raj wrote:
> Changes in this release [1]
> 
> [1] https://github.com/GNOME/pango/commit/37a427018c92a2bc679ef104097e07a619609c9c


New ptest failures with this release:
https://autobuilder.yoctoproject.org/typhoon/#builders/82/builds/3109/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/81/builds/3362/steps/12/logs/stdio

{'pango': ['pango/test-layout.test']}

It seems to be intermittent as my previous build didn't have that
failure.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased
> 
>  .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.6.bb} (94%)
> 
> diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
> similarity index 94%
> rename from meta/recipes-graphics/pango/pango_1.50.4.bb
> rename to meta/recipes-graphics/pango/pango_1.50.6.bb
> index 0ea621bf670..b1b9054234d 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
> @@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
>  
>  SRC_URI += "file://run-ptest"
>  
> -SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
> +SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
>  
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>  
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164211): https://lists.openembedded.org/g/openembedded-core/message/164211
> Mute This Topic: https://lists.openembedded.org/mt/90384193/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

