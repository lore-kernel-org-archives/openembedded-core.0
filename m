Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABAFC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 18:37:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.1801.1635446267062983884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9334620005;
	Thu, 28 Oct 2021 18:37:44 +0000 (UTC)
Date: Thu, 28 Oct 2021 20:37:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
Message-ID: <YXrt+LYiPcQsmJke@piout.net>
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 18:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157600

Unfortunately, this fails with:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
libxcvt (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb)


On 27/10/2021 23:03:38+0200, Oleksandr Kravchuk wrote:
> This library is a dependancy of xserver-xorg 21.1.0.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> new file mode 100644
> index 0000000000..628ccfb647
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Library providing a standalone version of the X server \
> +implementation of the VESA CVT standard timing modelines generator"
> +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
> +BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
> +SECTION = "x11/libs"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
> +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson
> +
> +FILES:${PN} = " \
> +    ${libdir}/libxcvt.so.0* \
> +    ${bindir}/cvt \
> +"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157569): https://lists.openembedded.org/g/openembedded-core/message/157569
> Mute This Topic: https://lists.openembedded.org/mt/86638516/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

