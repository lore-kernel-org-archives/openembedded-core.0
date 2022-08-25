Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875FAC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:02:58 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.22126.1661421773758139354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TmAOSut0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2BFAE100003;
	Thu, 25 Aug 2022 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661421770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+hW1h+oukwSTnc8jq2tAeMNkARrHeol/+ma+HbzKeU=;
	b=TmAOSut0+xlCrBnK12Ww1dTilVT4dZ7GzbdaUHI8rXtDny/Dz0XDbRhDs+arYhqfPQL6wV
	Nq+pM3RE/y3ozPkv0nt50GS0KXCwiMRiAgXG0FvEiiAhGNpT5JNm0gl9RfVQsxbmB+o/ue
	U8ZdN1hscv/QhLr5dpn/tUdNmkIZsn7qVEOAC79ocXEpg7D0doPGIX4eM+LnU9GZYDJMru
	HsSB/6TvL+Mt5A3CLycJE2/q5rCAq6O+nNJycPFiO0+g22+ErF1iLEg593inq0vsBhJzXe
	qBrFTMvcABKC1SuowO717EXdRSdWedu/0SUQDVAa57/8APo/lNRm5UqIbE+02w==
Date: Thu, 25 Aug 2022 12:02:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] ccache: Upgrade to 4.6.2
Message-ID: <20220825120248.66f9b613@booty>
In-Reply-To: 
 <CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
References: <20220823180151.3321962-1-raj.khem@gmail.com>
	<20220823180151.3321962-3-raj.khem@gmail.com>
	<20220824185224.370c44bf@booty>
	<CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:02:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169841

Hi Khem,

On Wed, 24 Aug 2022 09:57:13 -0700
"Khem Raj" <raj.khem@gmail.com> wrote:

> On Wed, Aug 24, 2022 at 9:52 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > On Tue, 23 Aug 2022 11:01:51 -0700
> > "Khem Raj" <raj.khem@gmail.com> wrote:
> >  
> > > Fix build with musl
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>  
> >
> > AB testing with these 3 patches I got an error in test_ccache_tool. Not
> > sure these patches are guilty, but they are the only ones
> > ccache-related.
> >
> > Maybe you can have a look?
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4037/steps/15/logs/stdio
> >  
> 
> drop the upgrade patch
> 
> [3/3] ccache: Upgrade to 4.6.2
> 
>  and see if that helps. We dont really need that for gcc 12 issue.

My build with the first two patches + the gcc 12.2.0 upgrade succeeded.
Thanks!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

