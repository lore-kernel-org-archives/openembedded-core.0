Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sm64X-0000ke-Lj
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 18:35:30 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:34405 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sm5tm-0006rw-8y; Tue, 03 Jul 2012 12:24:22 -0400
Date: Tue, 3 Jul 2012 12:24:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4FF31B1B.2090105@linux.intel.com>
Message-ID: <alpine.DEB.2.02.1207031222040.32125@oneiric>
References: <alpine.DEB.2.02.1207031150230.31710@oneiric>
	<4FF31B1B.2090105@linux.intel.com>
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
Subject: Re: what's the easiest way to download *all* recipe-referenced tarballs?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 16:35:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 3 Jul 2012, Saul Wold wrote:

> On 07/03/2012 08:54 AM, Robert P. J. Day wrote:
> >
> >    followup to once upon a time post of mine, i'm prepping to give a
> > tutorial in OE/yocto, and it would be nice if the client could, ahead
> > of time, set up a premirror of every conceivable tarball that is used
> > by any recipe in oe-core.
> >
> >    can that be done?  easily?  i can see configuring for a build,
> > selecting a MACHINE, then doing "bitbake -c fetchall world", or some
> > variation thereof.  but that would be MACHINE-specific.
> >
> We added a "universe" target for fetching and stats gathering, but
> it's not appropriate for building,

  that's fine, sounds like just what i'm after.

> it should get everthing, unless there is a MACHINE-specific variable
> in SRC_URI, which I don't think we have.

  so you're saying that the selection of MACHINE in local.conf
shouldn't make any difference, right?  great, i'll give it a shot.  uh
... any idea how much will be downloaded?  is there a list of the
resulting tarballs somewhere?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



