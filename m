Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748C3C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 12:11:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.53172.1658319078602067525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 05:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WuRyQLPu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4F3B81BF207;
	Wed, 20 Jul 2022 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658319076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jtqZUoqXHAKUmoNZmxsYsmd17ZdDRiFwnhEmDoFxqOI=;
	b=WuRyQLPurV1XVkAJWv9waEQA6dGVL4bCt8cHFSRL06O+ig0vdZz4N9MxByuxjsFjYX7kc/
	eGYoSUYL29FLoykEBX9FWsM02pUKXEJLJEDeHji/krO0tj/iqGwjyUWHW9cxmuvvnx3tP0
	xP5Gk7dhiRUkjpvJYTzIatGCFerLlxCSPNhnUCn+fUd1C1lJNMIxL0t8tXhHNPv4XF5kh0
	xMSFQzbBOuW79CToyfVde0Sf623olBcWxe2PJ8LsAXV9PlK0mPvuvgB3nK0uCkrUAfmEFx
	yY6o0adQcFcgm0Elx6/dQE6aJKzQlp1Y8h1DP/ZC7egMrHaoEADMWdmBbjaXyw==
Date: Wed, 20 Jul 2022 14:11:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 10/51] xf86-input-keyboard: remove the recipe
Message-ID: <Ytfw5F9y/GhSXqFv@mail.local>
References: <20220720084442.2940187-1-alex@linutronix.de>
 <20220720084442.2940187-10-alex@linutronix.de>
 <YtfR3KLvG0D4eLcP@mail.local>
 <CANNYZj8oCFGN_fb8LY_tynsGG1NxatHORqSUVrfy_W8kjuo08g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj8oCFGN_fb8LY_tynsGG1NxatHORqSUVrfy_W8kjuo08g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 12:11:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168361

On 20/07/2022 12:09:20+0200, Alexander Kanavin wrote:
> On Wed, 20 Jul 2022 at 11:58, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > > diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > > index 6f473de88c..0cc4e005b9 100644
> > > --- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > > +++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > > @@ -43,8 +43,6 @@ SRCREV:pn-xf86-input-evdev = "${AUTOREV}"
> > >  #PREFERRED_VERSION_xf86-input-evdev ?= "2.0.4"
> > >  SRCREV:pn-xf86-input-mouse = "${AUTOREV}"
> > >  #PREFERRED_VERSION_xf86-input-mouse ?= "1.3.0+git%"
> > > -SRCREV:pn-xf86-input-keyboard = "${AUTOREV}"
> > > -#PREFERRED_VERSION_xf86-input-keyboard ?= "1.3.1+git%"
> > >  SRCREV:pn-xf86-input-synaptics = "${AUTOREV}"
> > >  #PREFERRED_VERSION_xf86-input-synaptics ?= "0.15.2+git%"
> >
> > This patch doesn't apply because of this hunk.
> 
> Can you cherry-pick from
> https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates
> instead?
> 

I can but it doesn't change that the whole patch can't be applied
because a hunk is for meta-yocto and the others are for oe-core so this
has to be split as we are not applying patches on poky directly.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

