Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF28C636D5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 13:54:58 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.12893.1643205296824256346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 05:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 91B8410000B;
	Wed, 26 Jan 2022 13:54:53 +0000 (UTC)
Date: Wed, 26 Jan 2022 14:54:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Christian Eggers <ceggers@arri.de>,
	openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH meta-oe] rtc-tool: Add a recipe
Message-ID: <YfFSrTW5oTe+5zCe@piout.net>
References: <20220123150358.1306062-1-festevam@gmail.com>
 <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 13:54:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160987

Hello Fabio,

On 24/01/2022 16:18:34-0300, Fabio Estevam wrote:
> Hi Christian,
> 
> On Mon, Jan 24, 2022 at 6:57 AM Christian Eggers <ceggers@arri.de> wrote:
> >
> > Hi Fabio,
> >
> > from my experience, custom build systems (including "bare" Makefiles)
> > are often hard to integrate/maintain for distributors.
> 
> rtc-tools is a straightforward package and I have sent the Makefile
> patch upstream.
> 
> Not sure why it can be hard to integrate or maintain it.
> 
> > What about using CMake instead?
> 
> I can do that if needed, but it is up to the rtc-tools maintainer, Alexandre.
> 
> Alexandre, any advice?
> 

My plan is to probably go for the Makefile. I don't think it will cause
any issue and this doesn't care about portability to other systems as
the tool is Linux only.

I'm just checking with buildroot whether they prefer having all the
binaries installed with a single target or if rtc-range has to be
separated out.

rtc-range is supposed to be a debugging tool. I'd also separate it in a
different package.

Note that there is a daemon that should be coming up (well when I will
have time) with the goal of monitoring both battery status and clock
drift.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

