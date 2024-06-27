Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA35C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:16:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4450.1719526570248956054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ThZOv97/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F38E6E0002;
	Thu, 27 Jun 2024 22:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/zUPRElS55gP+ziC3SPioFaMGrbTGdYePwdd5FIHIu8=;
	b=ThZOv97/Ix+70uIQ+8Uzi08Tqlg21e687q2ga75jrwYrW6ZsiCci8hH3gK974do9eMWU2G
	p6rMIOE7IUqP2ULd/5im6QwDKaj4rgtyIPS+dnVMB9p3RyAEEoRfz8vc1uvnmCDCcIOi47
	wmlnRvtxYUXkrQLNYIXvlhKXxkl18PML4tuiWJob07salHy7FX1GXZDjYv3DikYGLFoCNf
	/ayMZcj5P1ylYEEGEw8a5fMwzgLYLS7liJuJxx7BNI6XZFPSg2PDVIagqDvP3YIQE6hg+G
	13ptwXNRgonW66+yHa+ne2bSusyxJlXBxerSnqgaayRB1DqXqgcR6bMu0sl+Jw==
Date: Fri, 28 Jun 2024 00:16:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kai <kai.kang@windriver.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 0/1] Update for gfortran
Message-ID: <202406272216073fa71992@mail.local>
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <202406180640385120dfe3@mail.local>
 <e8fa3278-4d25-45e5-a22a-95d19475cb9b@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8fa3278-4d25-45e5-a22a-95d19475cb9b@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 22:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201211

On 24/06/2024 18:06:38+0800, Kai wrote:
> On 6/18/24 14:40, Alexandre Belloni wrote:
> > You must always resend the whole series, else ths patch is not
> > applicable as-is. The work must be on your side, not on the maintainer's
> > side.
> Because the first patch has been staged in master-next, then I just send the
> other one which
> 
> rebased on master-next.


master-next can be rebased, please base your patches on top of master
unless instructed to do differently.

> 
> Regards,
> Kai
> 
> > 
> > On 16/06/2024 23:31:34+0800, Kai Kang via lists.openembedded.org wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > v3:
> > > * update INSANE_SKIP for ${MLPREFIX}gfortran
> > > 
> > > v2:
> > > * add sub-package gfortran conditionally
> > > 
> > > 
> > > Kai Kang (1):
> > >    gfortran: update runtime dependencies
> > > 
> > >   meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#200779): https://lists.openembedded.org/g/openembedded-core/message/200779
> > > Mute This Topic: https://lists.openembedded.org/mt/106704989/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > 
> > 
> 
> -- 
> Kai Kang
> Wind River Linux
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

