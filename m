Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFAAC433FE
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:34:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.7372.1634128467484995533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 72D672000A;
	Wed, 13 Oct 2021 12:34:25 +0000 (UTC)
Date: Wed, 13 Oct 2021 14:34:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
Message-ID: <YWbSUQ5slJyMGqJW@piout.net>
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <549aecfd-e6d1-dbe0-3c80-51783f554750@gmail.com>
 <CAAnfSTtj0bS5p05+dEJmLWG8MM-fyr1ZqVxB1MA_hcXHcGXfPQ@mail.gmail.com>
 <CADkTA4OK-K0O1zMQHiMFoHATcZ=se8wZLC0Q0tKEZRF-bfrrhw@mail.gmail.com>
 <YWar9C9+p9fPduVI@piout.net>
 <CADkTA4PK2Dt-GSnaeZTmxgr5hJV4V-6Vw2fh8_QGu5KYtQ1tkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4PK2Dt-GSnaeZTmxgr5hJV4V-6Vw2fh8_QGu5KYtQ1tkg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 12:34:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156905

On 13/10/2021 08:25:38-0400, Bruce Ashfield wrote:
> On Wed, Oct 13, 2021 at 5:50 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 12/10/2021 10:36:12-0400, Bruce Ashfield wrote:
> > > On Thu, Oct 7, 2021 at 6:13 AM Ross Burton <ross@burtonini.com> wrote:
> > > >
> > > > On Wed, 6 Oct 2021 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > Does it have to be native or target dependency ?
> > > >
> > > > Native, as it builds compiler plugins for the host.
> > >
> > > I was out most of last week, and this was a holiday weekend here, so
> > > I'm running behind.
> > >
> > > I didn't notice this on master or master-next, so I've grabbed it and
> > > made the same change to linux-yocto-dev.
> > >
> > > I'll send them out in my next pull request.
> > >
> >
> > Actually, this has been in my kirkstone-next and now my master-next for
> > a while but not in any green a-full build yet.
> 
> Can you point me at that branch ?
> 
> If it isn't poky master-next, or opembedded-core master-next, it might
> as well not exist, since it isn't something I'm going to check.
> 

Sure, it is here:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abelloni/master-next


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

