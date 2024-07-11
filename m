Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278B9C3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 16:38:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.898.1720715890272787027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 09:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l2rKZky8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C39C1BF206;
	Thu, 11 Jul 2024 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720715888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxLwwE2jwGIAyhuGoG30maRTWstRr0Q69TdNFu/n4+8=;
	b=l2rKZky8RH+OXpqi46d09lT3pXTHgSeLuDMndGzlSCmNvalxE4+AXoO38RIubxNdw/FOUy
	tbTC9a31mkUytHCRPUmkdFlLRHFUhW7GeUNaN4MqpUrI2vVde+/MpMjjNPQpDI55iChItv
	c0Z9uq7CN+d75vhOqR1Qe2CtNCVQT/rAwLLP8bC9jHyx9kDclTqCZexVpzaPWAzffC15TA
	5vVr6z7lCuI++OPHbwsH/26SsF4Hg6jd7NR8JG6ml1ZgT77OdtJiFD8NXC4Zhz/XVVxtfw
	vhF8HK/59gvhM9lBng8MnAquiXhe2QmoQk+UMCJIHHK/g+nzOMXJfncZxUMCKQ==
Date: Thu, 11 Jul 2024 18:38:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 18/30] lua: upgrade 5.4.6 -> 5.4.7
Message-ID: <20240711163807b414bedd@mail.local>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
 <1720604634-23406-18-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1720604634-23406-18-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 16:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201785

This causes new ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6615/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6792/steps/12/logs/stdio

On 10/07/2024 17:43:42+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> License-Update: Copyright year updated to 2024.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/lua/{lua_5.4.6.bb => lua_5.4.7.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.7.bb
> similarity index 94%
> rename from meta/recipes-devtools/lua/lua_5.4.6.bb
> rename to meta/recipes-devtools/lua/lua_5.4.7.bb
> index 17dc8fb17d..c72434d220 100644
> --- a/meta/recipes-devtools/lua/lua_5.4.6.bb
> +++ b/meta/recipes-devtools/lua/lua_5.4.7.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Lua is a powerful light-weight programming language designed \
>  for extending applications."
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=e05449eb28c092473f854670c6e8375a"
> +LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=303;endline=324;md5=41f9e2b41229cf6e69aac18c0eb5bfa7"
>  HOMEPAGE = "http://www.lua.org/"
>  
>  SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
> @@ -12,7 +12,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
>  # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
>  PV_testsuites = "5.4.4"
>  
> -SRC_URI[tarballsrc.sha256sum] = "7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88"
> +SRC_URI[tarballsrc.sha256sum] = "9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30"
>  SRC_URI[tarballtest.sha256sum] = "04d28355cd67a2299dfe5708b55a0ff221ccb1a3907a3113cc103ccc05ac6aad"
>  
>  inherit pkgconfig binconfig ptest
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201716): https://lists.openembedded.org/g/openembedded-core/message/201716
> Mute This Topic: https://lists.openembedded.org/mt/107139340/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

