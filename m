Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SmqgI-00065C-Io
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:21:34 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:59226 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SmqVU-0006Ur-CE; Thu, 05 Jul 2012 14:10:24 -0400
Date: Thu, 5 Jul 2012 14:10:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1656802.Mb7ogIjIbu@helios>
Message-ID: <alpine.DEB.2.02.1207051409390.31598@oneiric>
References: <alpine.DEB.2.02.1207051311580.30933@oneiric>
	<1656802.Mb7ogIjIbu@helios>
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
Subject: Re: is there a "bitbake" variation that will tell me about *only* the used packages?
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
X-List-Received-Date: Thu, 05 Jul 2012 18:21:34 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 5 Jul 2012, Paul Eggleton wrote:

> On Thursday 05 July 2012 13:14:32 Robert P. J. Day wrote:
> >   it's possible i'm misreading something, but i want to display a list
> > of recipes and their versions that will go into the given target.  i
> > configured for qemuarm and i want to bitbake core-image-minimal.
> >
> >   if i run "bitbake -s", that appears to show me *all* packages and
> > preferred versions, not just for, say, core-image-minimal.  is there a
> > variation that will tell me that info only for the recipes that will
> > be used for a given target?
>
> This is something being worked on under bug #2404:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2404

  yup, that's exactly what i'm talkin' bout, willis.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


