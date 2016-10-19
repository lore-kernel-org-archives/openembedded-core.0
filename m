Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 178FE71A03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 19:43:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161019194329949_0484;
	Wed, 19 Oct 2016 19:43:29 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=49540 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bwwln-0003hY-G6; Wed, 19 Oct 2016 15:43:23 -0400
Date: Wed, 19 Oct 2016 15:42:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<13189364.vBheUieID7@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191529350.14454@localhost.localdomain>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 19:43:30 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Oct 2016, Paul Eggleton wrote:

> On Wed, 19 Oct 2016 15:32:25 Robert P. J. Day wrote:
> > On Thu, 20 Oct 2016, Paul Eggleton wrote:
> > > On Wed, 19 Oct 2016 11:27:05 Robert P. J. Day wrote:
> > > > On Wed, 19 Oct 2016, Robert P. J. Day wrote:
> > > > >   not sure how dumb a question this is, but as i was doing a basic OE
> > > > >
> > > > > build, i saw the growing number of "nativesdk" rpms piling up under
> > > > > tmp/deploy/rpm/x86_64_linux, and wanted to examine a couple of them
> > > > > later, but after the sysroot was (i assume) populated with all of
> > > > > these rpms, that entire directory was deleted.
> > > > >
> > > > >   is there a switch to preserve that directory? thanks.
> > > >
> > > >   oh, wait, i think i found it:
> > > > SDKIMAGE_FEATURES += "package-management"
> > > >
> > > > does that look right?
> > >
> > > No, it doesn't. That's for turning on package management database in the
> > > SDK, which is not quite the same thing. The fact that those rpms are
> > > disappearing is a separate issue.
> > >
> > > Are you using rm_work?
> >
> >   no. and are you sure you're reading the above correctly? i'm not
> > saying
> >
> >   IMAGE_FEATURES += "package-management"
>
> Yep, I understood.
>
> > i was reading this:
> >
> > https://patchwork.openembedded.org/patch/120705/
> >
> > but perhaps i'm just misinterpreting what i'm reading.
>
> Right - that patch makes the preservation of the package management database
> (what it refers to as the "packaging data") conditional. That code does
> nothing with the packages themselves.

  i'm about to create a new project directory as a test ... is there
any configuration i should do to try to preserve all those nativesdk
rpm files?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


