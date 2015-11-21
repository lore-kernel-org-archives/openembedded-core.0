Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 93E116011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 14:23:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20151121142342821_0685;
	Sat, 21 Nov 2015 06:23:42 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=49636 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1a095a-0003Dr-Tj; Sat, 21 Nov 2015 09:24:30 -0500
Date: Sat, 21 Nov 2015 09:23:33 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4MBujzToM2AV7su24sUEvLXLwFyGK5ZcX3SP6SMv-7KTA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1511210920450.30774@localhost>
References: <alpine.LFD.2.20.1511210640580.26105@localhost>
	<CADkTA4MBujzToM2AV7su24sUEvLXLwFyGK5ZcX3SP6SMv-7KTA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means the EXTRA_KERNEL_SRC_URI variable, if anything?
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
X-List-Received-Date: Sat, 21 Nov 2015 14:23:45 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Nov 2015, Bruce Ashfield wrote:

> On Sat, Nov 21, 2015 at 6:45 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   perusing a BSP package handed to me by someone else and in their
> > recipes-kernel/linux/ directory, there's a custom kernel .bbappend
> > file with the line:
> >
> >   EXTRA_KERNEL_SRC_URI += "file://kernelmods.scc"
> >
> > i am unfamiliar with that SRC_URI-related variable, and i don't see it
> > anywhere under the numerous layers i have checked out. is this some
> > legacy/deprecated variable? i don't know what to make of it.
>
> I'm guessing that BSP was created/packaged by Wind River :) That
> variable shows up in the linux-windriver kernel recipe, which is
> based on linux-yocto.
>
> It was simply a way to have a variable that could be used, without
> requiring direct manipulation of the SRC_URI .. since if a direct
> assignment had bee done to SRC_URI "good things" got clobbered, and
> "bad things" happened.
>
> I'd suggest ignoring it (except perhaps in the context of what you
> are using), since it is specific to that kernel, and something that
> will go away over time.
>
> oh .. and if the BSP wasn't a Wind River one .. I have no idea ;)

  that is, of course, precisely where it came from -- thanks for
clearing that up.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


