Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6383C2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 07:14:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.80807.1718694888286530144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 00:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PpBQ6MWg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 181AF2000C;
	Tue, 18 Jun 2024 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718694886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NgKRAS3cMypiBUcJrFvIn9l5r7E3ajW6zFrRpvcCJxs=;
	b=PpBQ6MWgO5CAnHOXZQwQkm2Tqq0Gzp5Pi2abRWbFP2qoMJcFelNV6ckV8w7fgi5t6tY8iM
	smAfve91CixJ9ATtxHcWNAcD8dLdJV4kKS6jFuuwwskmKw+dkPtwekS13ynKk3DMuD5whC
	JTZB2UNUgIsORcTfmCCRXJLVmat+Dudz2S+CZZdu67z5PeaNPjvY0d8bQp3bGXPALyyFJh
	hK9KxvQn6Xkg35KmLqxAYGIslGF1qvmgxu+1Cqi9Hz+HWZyiwqybTlCRkGn7GIS1nv0QLd
	cIArPO7UXiqkvdK+QLbE32Yv+jJdFtPOcHJ9cNyU+ip/tqsnjoZXkFvBENs3EA==
Date: Tue, 18 Jun 2024 09:14:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: kai.kang@windriver.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 0/1] Update for gfortran
Message-ID: <202406180714458280640a@mail.local>
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <202406180640385120dfe3@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406180640385120dfe3@mail.local>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 07:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200857

Also, this is not based on master and doesn't apply, I'm dropping the
whole series.

On 18/06/2024 08:40:39+0200, Alexandre Belloni wrote:
> You must always resend the whole series, else ths patch is not
> applicable as-is. The work must be on your side, not on the maintainer's
> side.
> 
> On 16/06/2024 23:31:34+0800, Kai Kang via lists.openembedded.org wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> > 
> > v3:
> > * update INSANE_SKIP for ${MLPREFIX}gfortran
> > 
> > v2:
> > * add sub-package gfortran conditionally
> > 
> > 
> > Kai Kang (1):
> >   gfortran: update runtime dependencies
> > 
> >  meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200779): https://lists.openembedded.org/g/openembedded-core/message/200779
> > Mute This Topic: https://lists.openembedded.org/mt/106704989/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

