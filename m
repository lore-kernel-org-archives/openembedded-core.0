Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id E04316CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:51:50 +0000 (UTC)
Received: from [69.196.158.250] (port=57540 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VjoKw-0003C6-DK; Fri, 22 Nov 2013 05:51:47 -0500
Date: Fri, 22 Nov 2013 05:51:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: "Behrens, Holger" <Holger.Behrens@windriver.com>
In-Reply-To: <7A688B48FC95D148BFE83E098348BE5055CD82DC@ALA-MBA.corp.ad.wrs.com>
Message-ID: <alpine.DEB.2.02.1311220551100.5495@oneiric>
References: <1385047536.16887.137.camel@ted>
	<1385050308.20337.16.camel@dvhart-mobl4.amr.corp.intel.com>
	<7A688B48FC95D148BFE83E098348BE5055CD82DC@ALA-MBA.corp.ad.wrs.com>
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
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>, "Hart,
	Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ia32-base: Remove cpio and ext3 defaults
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
X-List-Received-Date: Fri, 22 Nov 2013 10:51:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 22 Nov 2013, Behrens, Holger wrote:

> > On Thu, 2013-11-21 at 15:25 +0000, Richard Purdie wrote:
> > > On real IA hardware, neither the ext3 or cpio images are particularly useful
> > > or used. cpio is legacy from initramfs and that specific image now overrides
> > > FSTYPES accordingly. The size difference in filesystems makes ext3 as a file
> > > format less useful, mainly being useful in the qemu case.
> > >
> > > When needed users can still override the default FSTYPES so having
> > > saner defaults makes sense. This improves build times and uses less
> > > network bandwidth for builds and releases.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > I'm fine with this, although it raises the question if we ought to be
> > doing anything more than tar rootfs in include files like this. there
> > are ia32 machines where a live image is not useful (although rare). Most
> > x86 BSPs would add live - but then again, most x86 BSPs will be starting
> > to consolidate on the genericx86 BSPs anyway....
>
> live image does not build in case of INCOMPATIBE_LICENSE = GPLv3
                                                ^^^?
  is that just a mail list typo or a copy and paste error?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

