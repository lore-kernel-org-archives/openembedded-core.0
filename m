Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1983755F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9R8aW8h019295; Tue, 27 Oct 2015 08:36:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cNao9UFvBdYr; Tue, 27 Oct 2015 08:36:32 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9R8aHuT019290
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Oct 2015 08:36:28 GMT
Message-ID: <1445934977.4521.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Tue, 27 Oct 2015 08:36:17 +0000
In-Reply-To: <562F3615.8040907@topic.nl>
References: <20151026151307.GA16394@deadlock.dhs.org>
	<562F3615.8040907@topic.nl>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Problem with RDEPENDS in multimachine builds for allarch packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 08:36:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-10-27 at 09:30 +0100, Mike Looijmans wrote:
> ﻿On 26-10-15 16:13, Sergey 'Jin' Bostandzhyan wrote:
> > Hi,
> >
> > I recently ran into a problem that I described here:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=8578 and while debugging
> > this issue an other problem came to light.
> >
> > I have a multimachine configuration (armv5/imx6) and the same distro for both
> > of them (poky 2.0 RC based).
> >
> > I have some allarch packages which have no DEPENDS, however which have an
> > RDEPENDS_${PN} setting.
> >
> > I can see that even though there were no changes to the recipe itself and
> > also no changes to the recipes listed in RDEPENDS, my recipe still gets
> > rebuilt each time.
> >
> > What we tried:
> >
> > <bluelightning> so cleansstate the recipe, change machine, cleansstate again,
> >                  then build it, then change machine, build it again and note
> >                  the first task that executes
> >
> > The logs for these steps, one with RDEPENDS and one without are at the end of
> > this mail. I can see that with present RDEPENDS "real" tasks get executed
> > even though no changes occured in the recipe; this is not the case when I
> > drop RDEPENDS.
> >
> > Is this a bug or is this just something that needs to be documented?
> 
> I think it's the same problem as described here:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/70070/focus=70072
> 
> > What is the "desired" behaviour?
> 
> Apparently, this needless rebuilding is "desired".

Its more that we can't tell the difference between a case where it is
needless and a case where it is no. The system therefore rebuilds as if
it didn't, there would be cases where it should have rebuilt and did
not.

Cheers,

Richard


