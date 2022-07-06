Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDF1C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:09:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7.1657141745049464515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=knQtSzHZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EC70AE0003;
	Wed,  6 Jul 2022 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657141743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eVyze2Ene6580W01qPl3oKYDy3SBJuK1bkiAUxizcog=;
	b=knQtSzHZHhWNor3eD4KA8g2x5ocEOFB5mfp2jxdfhPfT+vQkj0hi39EYh/afPfnpUXzGiZ
	3djJlTKvH9X8Kp3l9qPZZ4NBlLsjQgblyMj490vSEEX9OZKHNZrEIdHF+6hRPOTnKPAnXX
	4JwNJ/UF75SIK0jUASjK+EBg0w9GhRGI5QertW56d66mBiBlK6j8LG8TUDkv84JyrZB2rO
	oHtIMQ0VGkMeCitwLe87EiUdFhY9hjmOX22CQs2e7Ebezs8O7swjNDh4RdmpfcW02jdH2d
	wnkNaPTO3h/aSNZkAueG/HGysARsO+3uoRooHsvCVdi9venpez1KgM7YUY8dTA==
Date: Wed, 6 Jul 2022 23:09:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] icon-naming-utils: Resurrect for
 sato-icon-theme
Message-ID: <YsX57oc+zIEpZl4h@mail.local>
References: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706131642.1011068-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:09:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167747

Hello Richard,

On 06/07/2022 14:16:41+0100, Richard Purdie wrote:
> To add back sato-icon-theme we need this small util.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../icon-naming-utils_0.8.90.bb               | 28 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 18b0624af72..c55b2a09cf9 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -261,6 +261,7 @@ RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
> +RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-igt-gpu-tools = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> new file mode 100644
> index 00000000000..bde265f64fe
> --- /dev/null
> +++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Enables backwards compatibility with current desktop icon themes"
> +DESCRIPTION = "A Perl script used for maintaining backwards \
> +compatibility with current desktop icon themes, while migrating to the \
> +names specified in the Icon Naming Specification. The Icon Naming \
> +Utilities map the icon names used by the GNOME and KDE desktops to the \
> +icon names proposed in the Icon Naming Specification, and generate the \
> +icon files appropriate to the desktop environment you use. The Icon \
> +Naming Specification provides a standard list of common icon contexts \
> +and names that can be used to make icon themes work in a desktop \
> +environment or application that implements the naming specification. "
I believe you are missing HOMEPAGE here

> +LICENSE = "GPLv2"

This warns:
icon-naming-utils-0.8.90-r0 do_package_qa: QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 [obsolete-license]

> +DEPENDS = "libxml-simple-perl-native"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
> +
> +inherit autotools allarch perlnative
> +

Finally, I believe this is also the cause of the
sstatetests.SStateTests.test_sstate_allarch_samesigs failure in
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3786/steps/15/logs/stdio

> +do_configure:append() {
> +	# Make sure we use our nativeperl wrapper.
> +	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
> +}
> +
> +FILES:${PN} += "${datadir}/dtds"
> +
> +BBCLASSEXTEND = "native"
> \ No newline at end of file
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167721): https://lists.openembedded.org/g/openembedded-core/message/167721
> Mute This Topic: https://lists.openembedded.org/mt/92205963/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

