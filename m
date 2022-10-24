Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5FBFA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:51:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.20162.1666623096820558962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TZ+gc0Zy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E885240011;
	Mon, 24 Oct 2022 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666623094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tFSGVloj0HwzIamO3gVgJ9mSqQRqnKltUlJIg/3JRJQ=;
	b=TZ+gc0Zye7rMwkXm9O2j64Py1VGXMEJkzS3dMvff6t6sSS9qzZyhM3tgKiOTWiEjBUP6qQ
	fPy6q16Z7nFIhFejVozNxQCw5yFdlWSdpM8gjpY5RZXSAWAhqxlBPKCUQIzSouc1Dbu0DF
	eJC0FlZxFbLiLr3FK9hZyLvIsP7Y2Ix21tKwHUsGj1xIyu9uwwa2occ48qqq2Hcqj+MKWa
	OxuHqgwtxIIh3HQvTxkNHCOYzTHxAnCE6B7HveZujgTSl3GWt46CjGZXnf2uwKgzOXevjd
	ifkTr9/98Bm13ECxlwXBNsUHmk2mjXBtSrqLUkqy/iXmiaLp+FCXj4Bxd0Hklw==
Date: Mon, 24 Oct 2022 16:51:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] kern-tools-native: don't pull the
 toolchain as it is not used
Message-ID: <Y1amZYBBdWfFD8WT@mail.local>
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-2-jose.quaresma@foundries.io>
 <95AC8980-2768-4D43-B50E-DD2AF76250A9@arm.com>
 <171BBDD02E0F6FCC.12487@lists.openembedded.org>
 <CANPvuRk0_WBStWbFxBEMA1kmuZF+F2vUFAe8fdvD4zLn3XTkVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANPvuRk0_WBStWbFxBEMA1kmuZF+F2vUFAe8fdvD4zLn3XTkVg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172100

On 24/10/2022 15:21:56+0100, Jose Quaresma wrote:
> Hi Alexandre,
> 
> I see this one is still on staging abelloni main-next
> https://git.yoctoproject.org/poky-contrib/log/?h=abelloni/master-next
> 
> Can this be dropped please?
> 

Dropped now

> Jose
> 
> Jose Quaresma via lists.openembedded.org <quaresma.jose=
> gmail.com@lists.openembedded.org> escreveu no dia sexta, 7/10/2022 à(s)
> 09:59:
> 
> > Hi Ross,
> >
> > Ross Burton <Ross.Burton@arm.com> escreveu no dia quinta, 6/10/2022 à(s)
> > 11:50:
> >
> >> On 30 Sep 2022, at 18:54, Jose Quaresma via lists.openembedded.org
> >> <quaresma.jose=gmail.com@lists.openembedded.org> wrote:
> >> >
> >> > Prevents the default dependencies, namely the C compiler and standard C
> >> library (libc),
> >> > from being added to DEPENDS. This variable is usually used within
> >> recipes that do not
> >> > require any compilation using the C compiler.
> >> >
> >> > This also improves the speed as it will not populate the
> >> > native sysroot with the toolchain.
> >>
> >> But this is a native recipe, so it doesn’t depend on a cross-compiler:
> >>
> >> $ bitbake-getvar -r kern-tools-native DEPENDS
> >> DEPENDS=" git-native”
> >>
> >
> > Right, sorry for my confusion that maybe it was ignorance of the reality
> > of this detail of native packages.
> > Please drop that patch and thanks for your time in reviewing it.
> >
> > Jose
> >
> >
> >>
> >> Ross
> >
> >
> >
> > --
> > Best regards,
> >
> > José Quaresma
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171519):
> > https://lists.openembedded.org/g/openembedded-core/message/171519
> > Mute This Topic: https://lists.openembedded.org/mt/94022665/5052612
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > quaresma.jose@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
> 
> -- 
> Best regards,
> 
> José Quaresma

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

