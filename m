Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56EFE7D0AB
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 21:05:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.7261.1695330295263846481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 14:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NWfBUSxP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED7A3FF803;
	Thu, 21 Sep 2023 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695330293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ojQIM0IYPyQPgcRdGvhrB5nUn8S9wjPbsuFLVwlaiQ=;
	b=NWfBUSxP4Ow7MgY4+NS7DuVv5mxcodiigs6dBIkkRTyfAq63fnIDb66A4ONTD9lq1SHszG
	hIX92y0s3Rb3VpQlqDpnL6HDdeaClJRXPsafwpNrmptZa6dkhBeUkRFrtl0MTeQ5VVso2J
	a2bqvbKpdmkW2Q3QE1BTIjBIlZh92ft8ECJbWD8UhZ8tZbEwKzMOMpfph3poVL6Y1V2cxC
	W8tqicoVJFNSTl1HFR/Zyxn8HOZxalE1MyXW+s0Zqg8ICasyCVcpyPf/G/mvli6+uMAqbM
	3k7psc7O4V2C2UPrd9XyOmGiHtCSPBFFMLqhQgZ0V0y5CdTf6bfuL9ytuq5XVw==
Date: Thu, 21 Sep 2023 23:04:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <2023092121043261a17d09@mail.local>
References: <20230920181526.386874-1-f_l_k@t-online.de>
 <2023092114422322cfc0b0@mail.local>
 <CANNYZj_RbS9pqZ6Aei-HpN8-Horzzvs-f-xT-S7ZDaQi98Loug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_RbS9pqZ6Aei-HpN8-Horzzvs-f-xT-S7ZDaQi98Loug@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 21:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188026

On 21/09/2023 16:46:49+0200, Alexander Kanavin wrote:
> On Thu, 21 Sept 2023 at 16:42, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7816/steps/12/logs/stdio
> >
> > ERROR: Nothing PROVIDES 'vte' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb DEPENDS on or otherwise requires it)
> > vte was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
> > NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['matchbox-terminal', 'vte']
> > NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> > NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> > NOTE: Runtime target 'packagegroup-core-x11-sato' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato', 'matchbox-terminal', 'vte']
> > NOTE: Runtime target 'packagegroup-core-x11-sato-base' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-base', 'matchbox-terminal', 'vte']
> > NOTE: Runtime target 'packagegroup-core-x11-sato-games' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-games', 'matchbox-terminal', 'vte']
> > NOTE: Runtime target 'packagegroup-core-x11-sato-apps' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-apps', 'matchbox-terminal', 'vte']
> > ERROR: Nothing RPROVIDES 'matchbox-terminal-dev' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb RDEPENDS on or otherwise requires it)
> 
> It seems the time has come to make the decision:
> 1. Enable opengl distro feature by default in oe-core (something I've
> been pushing for for a while).

I'd prefer we don't do this because we are still supporting platforms
that don't have a GPU and this will reduce the amount of testing that is
done without opengl whereas we have many others targets that will
exercise opengl support.

> or
> 2. Drop sato images and replace them with non-graphical or basic x11
> images in https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n313
> or
> 3. Something else?
> 
> Alex

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188010): https://lists.openembedded.org/g/openembedded-core/message/188010
> Mute This Topic: https://lists.openembedded.org/mt/101484377/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

