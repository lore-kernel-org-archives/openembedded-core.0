Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id AB91D727B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 13:51:10 +0000 (UTC)
Received: from [70.30.87.145] (port=60015 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y883p-0003AY-Lg; Mon, 05 Jan 2015 08:51:09 -0500
Date: Mon, 5 Jan 2015 08:51:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1420465310.25779.29.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1501050850080.12284@localhost>
References: <alpine.LFD.2.11.1501050746100.9262@localhost>
	<1420465310.25779.29.camel@linuxfoundation.org>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to share just the host tools among different builds?
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
X-List-Received-Date: Mon, 05 Jan 2015 13:51:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 5 Jan 2015, Richard Purdie wrote:

> On Mon, 2015-01-05 at 07:53 -0500, Robert P. J. Day wrote:
> >   i'm drawing a blank at the moment so this might be a trivial
> > question -- is there a way to share the non-toolchain, host tools
> > across different builds on my development host?
> >
> >   if i'm doing closely-related builds (or even for totally different
> > architectures), i can see the host tools that are built under
> > tmp/sysroots/x86_64-linux/... and one would think that, theoretically,
> > those tools are appropriate for all sorts of independent builds, even
> > if the toolchain is different.
> >
> >   is there a simple setting that allows me to take advantage of all
> > those host tools that were built during an initial build, and continue
> > to use them in subsequent builds?
>
> Its called sstate ;-).
>
> Just share the native parts between the builds. They're usually in a
> distro specific directory.

  i suspected it was sstate-related, just wanted to be sure i could be
that specific. will go back to reading now ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

