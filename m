Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230CDC6379F
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 22:58:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.60806.1674169112146683840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 14:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EUosobgg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6B511C0002;
	Thu, 19 Jan 2023 22:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674169110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CrioeWlGJTqmi5TKA+9Hmo9pmYqnbvgxkeQeXONdySk=;
	b=EUosobggHN0PlTs3XCB5m8T3tj9dRdlAcS/Bj7SNGdMACiBAiGucXIThKFT4a7gaDp+lZQ
	lShp5W5NYp9Kjv2iQ218OxtrFgOiqO6Gb492+PNtovf1IVZvE9o9QGOGcNBxUmabuOjJ0n
	3DAQZ0Ymt006rmaKKKbm2htftFwJk+lTP3NqY8vZUyIFs9OhfeoxTZu04x7TWaopdOBSfD
	AfXrPUYwShE5xHZFsLKGoJ2DMIKbHXfW18nVgu34J2kLBJbiuSC+9iPFZajufYmUL5y6rm
	IpjTxnBSXudrqNQkCw4OY0UkrJm+41gOF1RdPc6jqslfoDYL9PoC1BIRAHedHQ==
Date: Thu, 19 Jan 2023 23:58:27 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alejandro Hernandez
 <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
Message-ID: <20230119235827.20e6f4cb@booty>
In-Reply-To: <CAMKF1sr=HFFJJ-HNe2r3rn0zeD4Fw5Fxn69jde9EE_ZBFvJtEA@mail.gmail.com>
References: <20230119042724.1413857-1-raj.khem@gmail.com>
	<20230119104413.0afa6711@booty>
	<CAMKF1sr=HFFJJ-HNe2r3rn0zeD4Fw5Fxn69jde9EE_ZBFvJtEA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 22:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176166

Hi Khem,

On Thu, 19 Jan 2023 08:52:09 -0800
"Khem Raj" <raj.khem@gmail.com> wrote:

> On Thu, Jan 19, 2023 at 1:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > On Wed, 18 Jan 2023 20:27:22 -0800
> > "Khem Raj" <raj.khem@gmail.com> wrote:
> >  
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>

This version is failing too:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6592/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/2263/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6521/steps/14/logs/stdio

...

> > > diff --git a/meta/conf/distro/include/tcmode-default.inc
b/meta/conf/distro/include/tcmode-default.inc
> > > index 4d4929529a..bcc5f7ce1f 100644
> > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> > >
> > >  GCCVERSION ?= "12.%"
> > >  SDKGCCVERSION ?= "${GCCVERSION}"
> > > -BINUVERSION ?= "2.39%"
> > > +BINUVERSION ?= "2.40%"
> > >  GDBVERSION ?= "12.%"
> > >  GLIBCVERSION ?= "2.37"
> > >  LINUXLIBCVERSION ?= "6.1%"  
> >
> > Applying this patch on an oe-core repository fails with 'git am':
> >
> > error: sha1 information is lacking or useless (meta/conf/distro/include/tcmode-default.inc).
> > error: could not build fake ancestor
> > Patch failed at 0001 binutils: Upgrade to 2.40 release
> >
> > And also with 'git apply'
> >
> > error: patch failed: meta/conf/distro/include/tcmode-default.inc:18
> > error: meta/conf/distro/include/tcmode-default.inc: patch does not apply  
> 
> It might be due to glibc 2.37 upgrade which I have in my local tree
> staged as well.
> you might edit it locally. If you want I can push it to a dedicated branch

Hm, maybe. I will try with your v3 I guess. :)

Not a big problem so far, but an annoyance.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

