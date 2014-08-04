Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 37D8E60559
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:56:28 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140804135628710
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:56:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=33051 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEIkR-0000i1-Cy; Mon, 04 Aug 2014 09:56:23 -0400
Date: Mon, 4 Aug 2014 09:56:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1407160384.6981.57.camel@ted>
Message-ID: <alpine.LFD.2.11.1408040955530.9154@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<20140802200959.GA22882@haswell>
	<alpine.LFD.2.11.1408030254520.10897@localhost>
	<14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1408040933500.8919@localhost>
	<1407160384.6981.57.camel@ted>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Mon, 04 Aug 2014 13:56:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 4 Aug 2014, Richard Purdie wrote:

> On Mon, 2014-08-04 at 09:42 -0400, Robert P. J. Day wrote:
> >   oooooh ... that's still kind of weaselly terminology. :-) i'm not
> > *trying* to be annoyingly pedantic, but this is just the kind of thing
> > that students tend to ask about, which is why i want to nail the
> > details.
> >
> >   the current docs state that pkg_*rm routines are *not* run during
> > image creation, and i'm going to accept that. that means that if a
> > pkg_*rm routine *is* written with reference to ${D}, as long as that's
> > run on the target, it won't make a difference. so the references to
> > ${D} in that context don't *hurt*, they're just unnecessary. and
> > potentially confusing, which is why i'm trying to clarify this. (every
> > pkg_*rm routine i've seen, *if* it tests the value of ${D}, bailed if
> > it was set, which makes sense if they should never, ever be invoked at
> > image creation time.)
>
> In the interests of being pedantic since I know you value correctness,
> they test $D. If they used ${D}, it would get expanded by bitbake at
> build time which is not what you want.
>
> >   WRT stuff run at rootfs postprocessing time, sure, you could always
> > run a package removal command, but clarify this for me -- once you're
> > into rootfs postprocessing, you're running in a "pseudo" environment
> > such that you are *effectively* running inside that rootfs, no? so in
> > that case, all filename references would be full names WRT to the root
> > filesystem -- no references to ${D}. is that correct? or am i just
> > confused?
>
> Pseudo environment means you can perform operations as root, its not a
> chroot. You could be in a pseudo chroot of course but our image
> generation isn't.

  ok, i think i've got it, thanks, both of you.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


