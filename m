Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB2FC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:59:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.52124.1658311135422721656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MYqtWGiu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24E192000C;
	Wed, 20 Jul 2022 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658311133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fOs8G9nCruAExdEaRMP6zu37IO+Gvc2Ui459EWsJbE=;
	b=MYqtWGiu7/VkIXfj3iM4Sg24xGuJtHjuxOAoF/w8fF8wNmaGbYHq7pCAf0XMps0wX0T2+w
	okaHCNJrShDXY08C5zN0L7jfy9SsfG5yj6ghRtm/DRjmMJiUoKp76GJtxiWYbmpVoEmQ5+
	lj6aGQyWK634aTAXdnN10NzPTwpflX+oL1TMw1mAWtQlEJJN8o/ZZ+GLJ0d9SZpjC1J6Q1
	PddNlD2So46Gr9PqINWm0aCPW0aGcfgC7Cv0qXqfPmNa9i/ldbA472Tl4YV2gax2jXtX5P
	64eXN5S1a5BCrw92IqnS/L7aaqc/spfCAwbZktVp2Zc8TmRxj4U/tJOvGhPeag==
Date: Wed, 20 Jul 2022 11:58:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 10/51] xf86-input-keyboard: remove the recipe
Message-ID: <YtfR3KLvG0D4eLcP@mail.local>
References: <20220720084442.2940187-1-alex@linutronix.de>
 <20220720084442.2940187-10-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720084442.2940187-10-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168353

Hello,


On 20/07/2022 10:44:01+0200, Alexander Kanavin wrote:
> It has been superseded by libinput/evdev on Linux, and upstream specifically
> errors out on Linux in latest release:
> https://github.com/freedesktop/xorg-xf86-input-keyboard/commit/7e366936d7b7d6c3b4d9c1554908ad20eef74a27
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../conf/distro/include/poky-floating-revisions.inc |  2 --
>  meta/conf/distro/include/maintainers.inc            |  1 -
>  .../xorg-driver/xf86-input-keyboard_1.9.0.bb        | 13 -------------
>  3 files changed, 16 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
> 
> diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> index 6f473de88c..0cc4e005b9 100644
> --- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
> +++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> @@ -43,8 +43,6 @@ SRCREV:pn-xf86-input-evdev = "${AUTOREV}"
>  #PREFERRED_VERSION_xf86-input-evdev ?= "2.0.4"
>  SRCREV:pn-xf86-input-mouse = "${AUTOREV}"
>  #PREFERRED_VERSION_xf86-input-mouse ?= "1.3.0+git%"
> -SRCREV:pn-xf86-input-keyboard = "${AUTOREV}"
> -#PREFERRED_VERSION_xf86-input-keyboard ?= "1.3.1+git%"
>  SRCREV:pn-xf86-input-synaptics = "${AUTOREV}"
>  #PREFERRED_VERSION_xf86-input-synaptics ?= "0.15.2+git%"

This patch doesn't apply because of this hunk.


> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ac1a1ea1a7..e20275c674 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -841,7 +841,6 @@ RECIPE_MAINTAINER:pn-xdpyinfo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-xf86-input-keyboard = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xf86-input-mouse = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
> deleted file mode 100644
> index 1896fff9f9..0000000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require xorg-driver-input.inc
> -
> -SUMMARY = "X.Org X server -- keyboard input driver"
> -
> -DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
> -driver supports the standard OS-provided keyboard interface.  The driver \
> -functions as a keyboard input device, and may be used as the X server's \
> -core keyboard."
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
> -
> -SRC_URI[md5sum] = "a3a3f0dd32361dcdbd406e894dafe090"
> -SRC_URI[sha256sum] = "f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168304): https://lists.openembedded.org/g/openembedded-core/message/168304
> Mute This Topic: https://lists.openembedded.org/mt/92500539/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

