Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsXRN-0006MN-2q
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 13:01:41 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:50328 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SsXGL-0002yE-Jw for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 06:50:17 -0400
Date: Sat, 21 Jul 2012 06:50:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207210644110.1819@oneiric>
References: <alpine.DEB.2.02.1207191738300.22542@oneiric>
	<CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
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
Subject: Re: what are the major phases of do_patch() for the kernel?
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
X-List-Received-Date: Sat, 21 Jul 2012 11:01:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Jul 2012, Bruce Ashfield wrote:

> On Thu, Jul 19, 2012 at 5:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   short version: what happens during each major processing step of the
> > do_patch function for the kernel?
> >
> >   longer version: i'm stepping through what happens when i do a
> > "bitbake linux-yocto", and documenting what happens at each step --
> > currently looking at do_patch().
> >
> >   after having run the previous validate_branches target, what i
> > appear to have is the source directory containing the kernel source
> > with the (for me) standard/arm-versatile-926ejs branch checked out,
> > and no top-level "meta" directory.  so far, so good.
> >
> >   now, i'm building core-image-minimal for qemuarm, so i'm being as
> > unexciting and non-exotic as possible -- not selecting any special
> > parameters or corner cases or anything.
> >
> >   so as i peruse do_patch() in kernel-yocto.bbclass, i'm following
> > along to functions like createme and updateme and patchme, and with
> > createme, further into decheckpoint and check_defconfig and ... you
> > get the idea.  and i'm kind of getting lost in the weeds of details.
> >
> >   given that i'm building an absolutely stock target with a supported
> > machine, all i really need for the moment is a very high-level
> > explanation of what each of those main routines does.
> >
> >   so if my initial understanding is correct (that before i start
> > do_patch), i have the stock yocto kernel checked out to the
> > appropriate machine branch and nothing else), what does each
> > subsequent step accomplish?
> >
> >   don't need horrific detail, just one line or less as to what's
> > accomplished by each step like:
> >
> >   * createme
> >     * decheckpoint
> >     * checkdefconfig
> >     * check_branch
> >     * metaize
> >   * updateme
>
> Most of this is already covered in the kernel architecture manual
> that you can find on the yocto pages .. I'd suggest starting there.

  actually, i *was* going through your kernel manual and the major
thing that was causing me grief was a lack of precise terminology.
when you're reading chapter 3, there are numerous references to the
"kernel tree", but i think it would be massively useful to distinguish
between the variations of tree here.

  one could start by mentioning the pristine kernel.org tree that's
used as a starting point.  then there's the tree one checks out of
git.yoctoproject.org, which contains (among other things) a "meta"
branch which is then added to that tree and its content applied.  from
what i can read in the kern-tools utilities, that might be called the
"metaize"d tree.  after which the configuration is done, and so on.

  terminology matters.  all i'm after is, if i'm describing this
process to a class, i want to use terminology that matches what's in
the manuals.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


