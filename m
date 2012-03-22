Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAkzg-0003N5-TN
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:36:09 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAkr5-0008W2-2f for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:27:15 -0400
Date: Thu, 22 Mar 2012 12:27:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4F6B4B51.3080806@intel.com>
Message-ID: <alpine.DEB.2.02.1203221222230.10320@oneiric>
References: <alpine.DEB.2.02.1203220731420.16149@oneiric>
	<4F6B4B51.3080806@intel.com>
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
Subject: Re: proper way to bounce between two (or more) build directories?
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
X-List-Received-Date: Thu, 22 Mar 2012 16:36:09 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 22 Mar 2012, Scott Garman wrote:

> On 03/22/2012 04:42 AM, Robert P. J. Day wrote:
> >
> >    haven't seen this mentioned anywhere and i know it's simple but
> > i want to confirm this.
> >
> >    say i run oe-init-build-env to initialize a new project, part
> > of the effect of that is to prepend the OE and bitbake related
> > directories to PATH.  i work there for a while, then want to put
> > that on hold to start a second build.
> >
> >    i rerun oe-init-build-env to set up that second build, which
> > works fine but, unsurprisingly, that prepends the OE directories
> > to my PATH *again* (but i really have no choice, it has to be
> > done).
> >
> >    after a while, i want to go back to the first project.  am i
> > expected to run oe-init-build-env yet again?  (prepending
> > directories yet again?)
>
> I would generally do my best to avoid working with multiple build
> areas in the same terminal, and it's definitely not a case we test
> with.

  i had assumed as much, but i was curious to know the actual
difference in the working environment between two builds.  sometimes
info like that is educational.

> >    as best i can tell, the only change i need to make in switching
> > build directories is to reset the BUILDDIR env variable.  is that
> > all that's necessary?  i don't see anything else in my environment
> > that would have to be reset.
>
> Compare your env before and after running the oe-init-build-env
> script, then prepend something to unset the variables that were
> added.

  i did and the only meaningful differences were (as i suspected):

  * BUILDDIR is updated
  * PATH kept being prepended unnecessarily with OE/bitbake dirs

> If you want to submit a patch make the oe-init-build-env script
> idempotent in this way, that could be useful.

  the only thing that i can suggest is that that script check if PATH
already contains the OE dirs at the front, and not prepend them again,
but that's obviously not a big deal.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


