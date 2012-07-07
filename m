Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnXoc-0006px-2z
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jul 2012 18:25:02 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:33033 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnXds-0001AK-Ek; Sat, 07 Jul 2012 12:13:56 -0400
Date: Sat, 7 Jul 2012 12:13:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4FF85E97.9010202@linux.intel.com>
Message-ID: <alpine.DEB.2.02.1207071212460.22356@oneiric>
References: <alpine.DEB.2.02.1207071126550.20571@oneiric>
	<4FF85E97.9010202@linux.intel.com>
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
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what's the easiest way to see the difference some local configuration makes?
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
X-List-Received-Date: Sat, 07 Jul 2012 16:25:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 7 Jul 2012, Saul Wold wrote:

> On 07/07/2012 08:43 AM, Robert P. J. Day wrote:
> >
> >    i recall that there's a current request to be able to list the
> > packages and versions that relate *just* to the current target and
> > machine, so i'm looking for any other way to do this so students can
> > see the difference for themselves.
> >
> >    for example, i'm starting with a configuration of "qemuarm", and i
> > can do a fetchall:
> >
> > $ bitbake -c fetchall core-image-minimal
> >
> > and let that run.  so far, so good -- i've now fetched everything
> > required for this target.  if i repeat that command, obviously,
> > nothing should change, and it doesn't.  (i don't even have to build
> > the target, i'm just doing fetching for now.)
> >
> >    now let's say i add to my local.conf:
> >
> > IMAGE_INSTALL_append = " strace"
> >
> > i suspect there's an easier way to see this, but if i want to *prove*
> > that the strace recipe would be part of the build, i can do:
> >
> > $ bitbake -c fetchall -n core-image-minimal     [dry run]
> >
> Have you tried bitbake -e which prints out all the variables and python
> functions, you can then grep for ^IMAGE_INSTALL or what ever you expect to
> affect by your change
>
> Sau!

   oh, that's already on my list, i was just trying to dig up
clever(?) ways to show *only* what would change.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


