Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C1AE7D0D2
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:42:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15944.1695364925883119152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VmBX9Ksh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07E02E0006;
	Fri, 22 Sep 2023 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695364923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4dAQ2E/sj4e74gJgdbvMsGyNDg0wBEJnmNAePDQOJ0=;
	b=VmBX9KshuKcJQ8IECa1t4jZ4+FNktyKNtwjZC4DWi85Jsktz4V6tKRv2vIISrqV/nibXmF
	ob3NUYtsxJNIua95QZyF6pda/vW0vpYV5RdjLgHuPDf/PfJgSIWUNEKsaINwqHjIF2vDP3
	WdIEIOBKI/Be8QzZtlNXan/aQ8jK5KNRfF47BmLm/poWtXX0Yb+aeny5FFmEXk8vgK9X9l
	eC+ZI5buour/UA75Lp0Ao1MylxFs5Z4qjrFehoHdzCYDPFZpHIcTxOt0Jk3vDgDgPR4km1
	PxaLDVKzipmvps1S4D4BLY6icO9tGXALUcTFtBG5I4ILBHvzwYqSWRJS+9SEnw==
Date: Fri, 22 Sep 2023 08:42:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <20230922064202279c2c00@mail.local>
References: <20230920181526.386874-1-f_l_k@t-online.de>
 <2023092114422322cfc0b0@mail.local>
 <20230921205944c6389866@mail.local>
 <CANNYZj9JH-gcfAQad2y7SQuq2aMQ--=8J65xe--fW2gG3j4=TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9JH-gcfAQad2y7SQuq2aMQ--=8J65xe--fW2gG3j4=TQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188041

On 22/09/2023 07:18:07+0200, Alexander Kanavin wrote:
> On Thu, 21 Sept 2023 at 22:59, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> >
> > BTW, I'd like you to test patches before sending because you claimed
> > this was tested with oe-core but this was definitively not. The fact
> > that we are at v6 and this still breaks builds so early is very
> > annoying.
> 
> Was this claimed somewhere? I am not seeing it. The latest breakage is
> on an esoteric configuration (oecore without poky, which has a
> different set of default distro features), so I do not think it is
> fair to expect submissions would be tested there upfront.
> 

IT was on v3. nodistro is not an esoteric configuration. Honestly,
while poky is great for testing, this is an awful distro for an actual
product. Way to many features are enabled for most of the embedded
platforms.

> Testing on poky for a basic target is expected, and was done, but
> things like 32 bit, musl, retro computing platforms like ppc or mips
> are on the AB to run through. Otherwise submitters will just decide
> it's not worth the trouble to contribute, and we're back to me doing
> the bulk of the updates, which is the outcome I am not going to
> appreciate.

I agree and I don't expect anyone to test mips, ppc, musl or x32 on
their own but having a patch building fine with nodistro is a basic
test.
32bit is pretty much alive though as we have seen new 32bit SoCs getting
released this year. There were even ARMv5 SoCs released just last year.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

