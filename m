Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFCCC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 11:04:54 +0000 (UTC)
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web09.7883.1634295891781373700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 04:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=NXwGLAuq;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id bL16mPRXJzwAFbL17mU8BV; Fri, 15 Oct 2021 12:04:50 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=FKGAO9gs c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=rq-sA0nX0egYOU8aZcAA:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=zWPKxnDyjeZHkggv0AoAWwSNWz449tdCOD9kNPsKnc0=; b=NXwGL
	AuqUbwkMQj0AXq2nxjqrKpJCOc0SfXXaBwJzd2AoLaBChW1Eg04rKmttj9A6qInELHGcwmCB3rWMR
	/qcZgcLa5trMEhEVrLI3TdWSyQGWHVc5tmZ/fASJIcfPbwMO0XD96CIHXAZnVw37Iiz9mfAP/HW0i
	/Wh7JCOzdBzN+88CmtCC+dDeurvUVzFarTVLmJaemxAprDZIQkh9BvKen6wkH1/UZC0DVv+kXWCcs
	9nZOwobzgAQsDsa9qmDoHGvDtbUyeb3C8x+5AU0fupfVrXi7MiEbdYwVVyw0eMsd5YLEcTWOtr77y
	TwT82yrhs/FhPe1GKFyi10pVt4Y5Q==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mbL15-004WtC-Vm; Fri, 15 Oct 2021 12:04:47 +0100
Date: Fri, 15 Oct 2021 12:04:47 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 2/2] license: Allow treating missing license
 as error
Message-ID: <YWlgTxcWsxJU+ePY@mcrowe.com>
References: <20211013104805.646626-1-mac@mcrowe.com>
 <20211013104805.646626-2-mac@mcrowe.com>
 <YWhd8iAnlEd/XuR6@mcrowe.com>
 <ba53cc97609bb6c79f513756760292a80e08612d.camel@linuxfoundation.org>
 <YWhkR02QRrR8ubaE@mcrowe.com>
 <9ba1f7ade04de4af7731cfd85bb0484ff0aae63e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <9ba1f7ade04de4af7731cfd85bb0484ff0aae63e.camel@linuxfoundation.org>
X-CMAE-Envelope: 
 MS4wfA3DqIllNDr4DvOKgeBqNnsOzh8og92DYhbCYtEDCSFKMGfOSjJ/KMGroBv1n4xrc4GXhOdA3DLIYe9T198YjigNJ6LNL+MlwkHzteGG6PNRk/xFjKt9
 iCpEUnxYhS8Fvn9ouQqdGHm0BwZSJ3i2wDC7zxdrjblvgyqA2YtLykFbXG0adPCJdIMEoLaoesvJPw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 11:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156990

On Thursday 14 October 2021 at 22:48:07 +0100, Richard Purdie wrote:
> On Thu, 2021-10-14 at 18:09 +0100, Mike Crowe wrote:
> > On Thursday 14 October 2021 at 17:54:18 +0100, Richard Purdie wrote:
> > > On Thu, 2021-10-14 at 17:42 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > > On Wednesday 13 October 2021 at 11:48:05 +0100, Mike Crowe wrote:
> > > > > Use the same WARN_WA and ERROR_QA variables as insane.bbclass to allow
> > > > > individual recipes, the distro or other configuration to determine
> > > > > whether a missing licence should be treated as a warning (as it is now)
> > > > > or as an error.
> > > > > 
> > > > > oe.qa.handle_error isn't immediately fatal, so track the overall sanity
> > > > > state and call bb.fatal if required at the end to ensure that the task
> > > > > really fails. If only bb.error is used then do_populate_lic isn't re-run
> > > > > on subsequent builds which could lead to the error being missed.
> > > > > 
> > > > > It seems odd for the license- error classes to be listed in
> > > > > insane.bbclass but implemented in license.bbclass. All recommendations
> > > > > for somewhere else to put them gratefully received.
> > 
> > [snip]
> > 
> > > > Patch series v4 coming soon.
> > > 
> > > I did have to rework it a bit as I also ran into a few issues and was just
> > > trying to get around to writing them up.
> > > 
> > > I added:
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=9e980f1a71e8b6af5ff6da9b02fac0f8bfd9d4fb
> > > 
> > > which means you can drop the imports.
> > > 
> > > You can use the nonlocal option to help the "sane" problem:
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/diff/meta/classes/license.bbclass?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980
> > > 
> > > The autobuilder also shows issues as some of the functions you moved are
> > > referenced in other classes. The patch became:
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980
> > 
> > Thanks for doing that. I thought I'd searched for other occurrences, but I
> > must have not done so properly. :(
> > 
> > > I was also just thinking we should probably add a new function and add calls at
> > > the end of the tasks like:
> > > 
> > > oe.qa.exit_if_errors(d)
> > > 
> > > with a definition similar to:
> > > 
> > > def exit_if_errors(d):
> > >     qa_sane = d.getVar("QA_SANE")
> > >     if not qa_sane:
> > >         bb.fatal("Fatal QA errors were found.")
> > > 
> > > and then renaming QA_SANE to something like QA_FATAL_ERRORS and exitting if set.
> > 
> > That sounds like it would neaten things up greatly and avoid the risk of
> > accidentally failing to make the error fatal. It ought to mean that many of the sane local
> > variables can be removed too.
> > 
> > Would you like me to provide new versions of the existing patches or add
> > new patches on top of the ones already in master-next?
> 
> I had half a patch for this last bit so I pushed it into master-next. I also
> merged by oe.qa import change.

I think that I already had equivalent changes to everything in
master-next:a53f5758bb2e501dfd34c6a6369303e91b382792. It was slow testing
over night! I've gone with QA_ERRORS_FOUND for the variable name since I
thought that more accurately captured what it meant. I also have only a
single call to oe.qa.exit_if_errors at the end of each task.

> I'm happy for you to take over from here and rework the patches into whatever
> makes the best sense for a series now we know what we're aiming for? I think
> there is a more cleanup of the "sane" variables that can be done beyond my quick
> patch.

Thanks. I'll hopefully send a new series for review today.

I'm finding myself wondering whether having oe.qa.add_messages collect
together all the messages and reporting them all in one go is worth the
complexity. The code that works out in advance which checks generate
warnings and which generate errors appears to be quite old and perhaps it
predates the current mechanism for classifying checks when they fail.
However, any changes here would be rather large, so it would probably make
sense to tackle this separately.

Mike.

