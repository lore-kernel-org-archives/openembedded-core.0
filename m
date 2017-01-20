Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id B10D171A99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:52:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170120115220007_0485;
	Fri, 20 Jan 2017 11:52:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=51279 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cUXjo-0006Q2-Op; Fri, 20 Jan 2017 06:52:12 -0500
Date: Fri, 20 Jan 2017 06:52:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1701200648260.13268@uk63952.mitel.com>
References: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
	<CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: $50 bounty for an OE recipe for libfilesys-smbclient-perl. seriously.
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
X-List-Received-Date: Fri, 20 Jan 2017 11:52:26 -0000
Content-Type: text/plain; charset=US-ASCII


  the earlier note from ross i had totally forgotten about ...

On Tue, 20 Dec 2016, Burton, Ross wrote:

> FWIW I had a quick look at this.  I'm certainly no perl guru and can
> barely understand it, but it does *so much* wrong that if you really
> need this then it would be easier to just rewrite the makefile.pl
> from scratch.  Once you remove the hunting for the headers in the
> wrong place, it then invokes an autoconf script...  which needs to
> be passed the right options.
>
> Do you really need this module?  It's not been updated for many
> years, so surely there's something better.

  and that's the question ... is there something better? is there not
a single person who needs this feature in their OE/YP build? perhaps
not. maybe i really do need to hire a contractor to take care of this.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


