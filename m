Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Te5bk-0002Uy-Pr
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 16:00:57 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:40853 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Te5Ny-0006Su-3P; Thu, 29 Nov 2012 09:46:42 -0500
Date: Thu, 29 Nov 2012 09:46:39 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3409560.zPX7xbNTKL@helios>
Message-ID: <alpine.DEB.2.02.1211290945360.26135@oneiric>
References: <alpine.DEB.2.02.1211280631130.31857@oneiric>
	<5097983.bapmtWeVbY@helios>
	<alpine.DEB.2.02.1211290652280.3805@oneiric>
	<3409560.zPX7xbNTKL@helios>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: some simple questions/observations about package groups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 15:00:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Nov 2012, Paul Eggleton wrote:

> On Thursday 29 November 2012 06:58:02 Robert P. J. Day wrote:
> > On Thu, 29 Nov 2012, Paul Eggleton wrote:
> > > On Wednesday 28 November 2012 15:27:58 Chris Larson wrote:
> > > > Also, to comment on something tangentially related from a different
> > > > thread,
> > > > technically the PACKAGE_GROUP_ variables were the first to use the term
> > > > as
> > > > far as I'm aware. *tasks* were then renamed to use that name as well,
> > > > which
> > > > is where a bunch of the confusion probably got introduced.
> > >
> > > I did mention that:
> > > > PACKAGE_GROUP_* actually came first as a way to
> > > > define items for IMAGE_FEATURES that map to one or more packages, and
> > > > I'm
> > > > not  sure the name choice was a particularly good one - I wonder if it
> > > > would be worth considering renaming it to something like
> > > > IMAGE_FEATURE_PACKAGES in order to avoid confusion, although obviously
> > > > every rename like this has a cost associated.
> >
> >   before i forgot all of this, i lashed together this wiki page for my
> > own benefit so i'd have some examples to show students:
> >
> > http://www.crashcourse.ca/wiki/index.php/OE_package_groups
> >
> > it's admittedly in rough form and could use some polishing but it will
> > do for now.  feedback?  errors?
>
> You're describing those things defined by PACKAGE_GROUP_* as package
> groups, which I would strongly advise against. I know the naming of
> PACKAGE_GROUP_* suggests that the two are part of the same thing but
> they really aren't. Most of this page apart from section 5 is
> actually talking about IMAGE_FEATURES and should be reworded as such
> if you want to reduce confusion rather than increasing it.

  ok, i will work on that later today.  i do remember your earlier
email warning about a bad choice of names, so i'll review that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


