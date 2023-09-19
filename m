Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DB6CE79A9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 17:57:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16898.1695146245002527690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 10:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l4p3H+49;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0D63FF806;
	Tue, 19 Sep 2023 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695146243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AadAdiIQlG3UM9lM08BgXMvf2TUgkRVcIEgMRMOEj0k=;
	b=l4p3H+49n/MXqpR5L8jdjKUtawvnVsWfwNcSFJlxZaaATQ21nH6JtcJh2UTEjjWR+scT3W
	lhwiHUG0laJWxONuf6FA+DRA0luL0ToAnVrVa3Q8/T4EFeHEorlDqtwM2EvhkR4oo0Kxwc
	5gfbdwRHuPUkRDgpZAdc3fZG7uiDoOokvbBgZu5GWEkU4+fohagybnI0Hlm/9KBHYXcnXm
	T0bNW5w4lfQJvuYN13NU0RJqmpR/eihPA+xP1jvayQGarEKAw09MMxr6nNwILH8EMctR6i
	H84fmHZWbEggXOzkBtHD2dlTijz1bhIfTgc3syxj+/7ZIEuSFkZxkBsuz3L/jw==
Date: Tue, 19 Sep 2023 19:57:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <20230919175722c6907581@mail.local>
References: <20230919114941.1819808-1-f_l_k@t-online.de>
 <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
 <9RH81S.9NI7WQZ7L6QX@t-online.de>
 <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
 <202309191559576fcd373c@mail.local>
 <CANNYZj-g6JvuMm3pRHJLHxhkVn_gw__E29iLksd8RWGSvdywew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-g6JvuMm3pRHJLHxhkVn_gw__E29iLksd8RWGSvdywew@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 17:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187875

On 19/09/2023 18:30:23+0200, Alexander Kanavin wrote:
> On Tue, 19 Sept 2023 at 17:59, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > > Having gpl3-only recipes in core is not a problem. Ability to build
> > > basic images without gpl3 items is tested, since that kind of thing is
> >
> > I don't think we test this anymore.
> 
> We do:
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/incompatible_lic.py?h=master-next#n135
> (the test in NoGPL3InImagesTests class)
> 
> You were probably thinking of meta-gplv2 tests.

Yeah, I thought we dropped both at the same time.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

