Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535AEC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 16:43:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10050.1652978599557798487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 09:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d9azayk9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0F77324000B;
	Thu, 19 May 2022 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652978597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq6+dw5ft1T7N4UmEHOhQeonxF/bHvzaJbu7Sfhp/SQ=;
	b=d9azayk96xjX7QbstbXHoSWvqbXUx0o1O7fZrBS4DvGRsEIA4UTxBU49F1fXcGDPka+JLX
	kxrWYd+s5OGgyK2H/FdBp8QFgRakt44jH6whJVS48DMp8q3/CCqpK74sc0wcZ7XrFbD1K/
	o/JkuTJ6wJSkIBYBgI5A4uRBlUaeveIIXsao6JNupd5GquYZNle9wo/wCge19n89drDtxp
	sSuOrTSt/jaatBZdE+jxggdDMFePPb0jQVJuZJ9qCSPkr3zBJJZfaSwbU21iHeLKJ3ihHh
	XdV7mQZfsmHr3d+by+l8i7hmjk2PLkjAdVrSHGEbsmhyhYE9c1m/vIKVtrFwfw==
Date: Thu, 19 May 2022 18:43:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
Message-ID: <20220519184315.1e91b017@melee>
In-Reply-To: <20220519064312.391164-1-f_l_k@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 16:43:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165903

Hi Markus,

Il giorno Thu, 19 May 2022 08:43:11 +0200
"Markus Volk" <f_l_k@t-online.de> ha scritto:

> libdecor is a client-side decoration library for Wayland clients. It
> is used by libsdl2 for window decoration and is required to provide
> decoration for shells that use client-side decoration such as
> gnome-shell or weston.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

I'm afraid we're having an issue with this patch as well:

AssertionError: 
The following recipes do not have a maintainer assigned to them. Please
add an entry to meta/conf/distro/include/maintainers.inc file. libdecor
(/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb)

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3547/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3604/steps/15/logs/stdio

And also this warning:

WARNING: Nothing RPROVIDES 'nativesdk-libdecor' (but
virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
'nativesdk-libdecor' NOTE: Runtime target 'nativesdk-libdecor' is
unbuildable, removing... Missing or unbuildable dependency chain was:
['nativesdk-libdecor'] WARNING: Nothing RPROVIDES
'nativesdk-libdecor-dev' (but
virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-graphics/libdecor/libdecor_0.1.0.bb
RDEPENDS on or otherwise requires it) No eligible RPROVIDERs exist for
'nativesdk-libdecor-dev' NOTE: Runtime target 'nativesdk-libdecor-dev'
is unbuildable, removing... Missing or unbuildable dependency chain
was: ['nativesdk-libdecor-dev']

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5543/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4571/steps/12/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

