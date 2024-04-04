Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A170BCD1297
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 18:02:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45576.1712253754951067091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 11:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=of4hzLVR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4D97E0004;
	Thu,  4 Apr 2024 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FTMbxKuTg7apFAs+whoHpM6V/PSE+i63vPdVjDHd7nI=;
	b=of4hzLVRg68PSh5Oo/lgW6E5n4Tee12H2L5N7sOh/Lst1DIwHjVTKYIPhZv5d46X96UDVd
	ga6iKlQfyW1Lzu8XGApS3Hp+NcuZIr7VH2gK0FDFSknlR8xwilwXkvP9AwwAB+BU9sICUY
	jdikdIeCCaOfyaaEmDJST/ea46r+9FcZ/VqQjpB8BaeFkmoxUVWZ0NtX88yOon6WBxDikF
	HbIDlJ8M/4UrbqySsDRUNpuy9lekOCkA/ZidriUP3S8khiI5dbaggOugeETfNGNreDC7h1
	MU2gk+Sc+G/+zx8SbHLjMXVfy3VBZJLvGlj1alIRyG0qYWcqi8acT4IG1LOeiw==
Date: Thu, 4 Apr 2024 20:02:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] util-linux: Set the license for
 util-linux-fcntl-lock to MIT
Message-ID: <202404041802317f92a6a4@mail.local>
References: <20240402045654.3717582-1-pkj@axis.com>
 <2024040323445722e2c297@mail.local>
 <DB5PR02MB10213CCA7CB746291E72C4A07EF3C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB5PR02MB10213CCA7CB746291E72C4A07EF3C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197970

On 04/04/2024 17:25:52+0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Sent: den 4 april 2024 01:45
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] util-linux: Set the license for util-linux-fcntl-lock to MIT
> > 
> > Hello,
> > 
> > This caused:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4604/steps/12/logs/stdio
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240403-u_hyp_wv/packages/diff-html/
> 
> Doesn't this type of breakage happen all the time for pure recipe 
> changes that affect the output if the PR server is not enabled?
> 
> > 
> > I guess we need to bump PR?
> 
> Given that RP removed all PR variables from the recipes in OE-Core (see 
> commit d4c346e8ab8f3cae25d1b01c7331ed9f6d4f96ef), I would expect that he 
> is not too keen to see them coming back...
> 

The plan is to take your patch as-is in master and if this causes reop
failures bump PR

> //Peter
> 
> > 
> > On 02/04/2024 06:56:54+0200, Peter Kjellerstedt wrote:
> > > This avoids problems if BSD-4-Clause is in INCOMPATIBLE_LICENSE since
> > > util-linux-fcntl-lock is now a dependency of run-postinsts.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/recipes-core/util-linux/util-linux.inc | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> > > index f4b547215e..d506783f9a 100644
> > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > @@ -7,6 +7,7 @@ disk partitioning, kernel message management, filesystem creation, and system lo
> > >  SECTION = "base"
> > >
> > >  LICENSE = "GPL-1.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
> > > +LICENSE:${PN}-fcntl-lock = "MIT"
> > >  LICENSE:${PN}-fdisk = "GPL-1.0-or-later"
> > >  LICENSE:${PN}-libblkid = "LGPL-2.1-or-later"
> > >  LICENSE:${PN}-libfdisk = "LGPL-2.1-or-later"
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

