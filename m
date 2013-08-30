Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id B65086B8EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 12:21:30 +0000 (UTC)
Received: from [69.196.158.250] (port=51263 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VFNhg-0007iS-Va; Fri, 30 Aug 2013 08:21:29 -0400
Date: Fri, 30 Aug 2013 08:21:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1377777433.32502.71.camel@ted>
Message-ID: <alpine.DEB.2.02.1308300817480.5487@oneiric>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
	<1377776979.28077.88.camel@phil-desktop.brightsign>
	<1377777433.32502.71.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Fri, 30 Aug 2013 12:21:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Aug 2013, Richard Purdie wrote:

> On Thu, 2013-08-29 at 12:49 +0100, Phil Blundell wrote:
> > On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:
> > >   distroless. i realize i *could* set a value for DISTRO, but it would
> > > seem that i shouldn't have to in order to avoid a build error.
> >
> > Well, either you're using angstrom or you aren't.  If you do want
> > to use it then you ought to set DISTRO appropriately, and if you
> > don't want to use it then you probably oughtn't to have the
> > angstrom layer included at all.
> >
> > Trying to use the angstrom .bbappends and files with a different
> > (or no) distro configuration will give you a set of metadata
> > that's neither one thing nor the other and, even if you didn't get
> > a build error, there's no guarantee that the resulting image would
> > actually work.
>
> I'm not sure I agree. Ideally layers should be includable without
> turning on behaviour unless it is enabled. This is why we have
> things like an array of OVERRIDES to choose from.

  after i thought about it for a while, this is what i started to
believe as well -- i should be able to include various layers and let
them work it out amongst themselves the correct behaviour and bbappend
processing and so on.

  the reason i selected the layers i did in my example was that i
wanted to build cutting-edge components for my beaglebone black and,
as i read it, this required me to use oe-core, meta-angstom and
meta-ti (among other things). and as you saw, oe-core and
meta-angstrom didn't play well together WRT base-files.

  anyway, i'll let folks higher up the food chain ponder on this.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

