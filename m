Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CADBC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 13:48:36 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7743.1654091305508203034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 06:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fteacEQv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 01FD160010;
	Wed,  1 Jun 2022 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654091303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9Tz6H+JFRFK4XIp0I+nhkPd/eZXILf9pvMQrC8IwGk=;
	b=fteacEQvrTq2j3f+eUkS2M7bj+Os/oaNy21S40uFdDS4l3Y3noKwhBSkqpHAMshMOqkU1H
	bdEYdvzA886HJxO5PczXgzoKRXHag8mS3VJWwmG7AlCl6zaVdm8rpQpTrnKyCy5R05ebJh
	cnF6BkLa+E+D7fOJU2L5mtp3sPQFslG/vPYiwdUpva5DiIqIZ9BRuFvSQAW4Mnuobvr3+A
	hRSqRWaymgIXtXcMvawjgXn73R8WknIeCrycyobF1LC0NRf/BEWUbV7BpiaN16BPJjYOzA
	eFceQvqFOIwwkyoVejUZQZO3vs39BDEItnaMg9DDa0zc3NdL6jXS5fDHbwPBbQ==
Date: Wed, 1 Jun 2022 15:48:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Cc: openembedded-core@lists.openembedded.org, Peter Bergin
 <peter@berginkonsult.se>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
Message-ID: <20220601154815.085aa68d@booty>
In-Reply-To: <20220531213206.7119-2-marcel@ziswiler.com>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	<20220531213206.7119-2-marcel@ziswiler.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 13:48:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166377

Hi Marcel,

On Tue, 31 May 2022 23:32:06 +0200
"Marcel Ziswiler" <marcel@ziswiler.com> wrote:

> From: Peter Bergin <peter@berginkonsult.se>
> 
> In order to enable configuration option aaf (AVTP Audio Format)
> used for AVB the library libavtp is a dependency but no recipe for
> this library was present. aaf support for alsa-plugins was
> introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> 
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This patch is failing on musl builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5308/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5294/steps/12/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

