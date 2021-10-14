Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E4C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:45:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9733.1634219114189425888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 316861C0009;
	Thu, 14 Oct 2021 13:45:12 +0000 (UTC)
Date: Thu, 14 Oct 2021 15:45:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES variable
Message-ID: <YWg0Zxz52+65ukRp@piout.net>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
 <CADkTA4NZRmGhb92Y22MnGsQhdxZOUtpg99pu0LahdZgyCJCzzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4NZRmGhb92Y22MnGsQhdxZOUtpg99pu0LahdZgyCJCzzw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156957

On 14/10/2021 08:38:46-0400, Bruce Ashfield wrote:
> On Thu, Oct 14, 2021 at 8:32 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2021-10-14 at 08:28 -0400, Bruce Ashfield wrote:
> > > On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > We want things to be reproduicble and the variable doesn't really change
> > > > much any more. Drop the remaining uses and make those code paths always
> > > > active.
> > >
> > > It wasn't clear to me from reading the patch.  What is the way that
> > > someone would now get the current timestamp into a kernel build, if
> > > that's the behaviour that they want ?
> >
> > With this change they probably don't get the option. If we want that to be
> > configurable, we should probably move the control to a different variable which
> > is focused specifically on the kernel. The hardest bit is probably picking a
> > name!
> 
> This is probably the most surprising feature of reproducibility for
> kernel developers, and a question that I've gotten multiple times
> ("what happened to my timestamp ?" followed by "how do I turn this
> off?")
> 
> Most kernel developers already don't really like the "yocto workflow",
> and this adds another element in that category. It is common in a
> debug scenario to check the timestamp of the running kernel to make
> sure that you've actually booted the one you just built.
> 

But do kernel developers actually do their development using YP?
I definitively not. I do all my BSP work outside of any build system and
then I finally integrate everything once this is working/ready.

It did indeed surprise me the first time I saw that but this doesn't
have any actual effect on my workflow. Also, the issue was already
existing if what you were trying to build was already in the sstate
cache (e.G from a nightly build), it would contain the time of the
actual build.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

