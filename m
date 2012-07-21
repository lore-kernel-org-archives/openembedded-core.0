Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SscoC-0003LP-G2
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 18:45:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:53829 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SscdA-0007UB-Sb for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 12:34:12 -0400
Date: Sat, 21 Jul 2012 12:34:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4Myz35prigzOekZ7hFxuTUujbMierEf-kyts0-yrXU7eQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207211225460.13670@oneiric>
References: <alpine.DEB.2.02.1207191738300.22542@oneiric>
	<CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
	<alpine.DEB.2.02.1207210644110.1819@oneiric>
	<CADkTA4Myz35prigzOekZ7hFxuTUujbMierEf-kyts0-yrXU7eQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 21 Jul 2012 16:45:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 21 Jul 2012, Bruce Ashfield wrote:
... snip ...

> Sure ... but I'll point out that you are going into architectural
> details that are under the covers, and that are written from the
> point of view of a kernel tree maintainer using the tools, they are
> not written from the point of view of the casual observer. The
> moving parts of the tools that can be tweaked, are already brought
> out out to the recipes (I'll point out again that the bitbake
> recipes you see are but one binding).
>
> So yes, another variation of the document might be useful, but I've
> (we've), moved these details out from "in front" and instead have
> focussed on the use cases .. from someone creating a new BSP, or
> adding a configuration fragment to their build .. i.e. it looks and
> works just like any other package in the system from the point of
> view of user manipulations, with the extra functionality available
> if someone has used them, and finds that their use case doesn't fit
> the mold (i.e. how many people go an need to modify bitbake when
> using oe-core? it took me 2 years to need to do that).
>
> What is the goal of a class that you'd be trying to do around this ?
> That makes all the difference in what I'd suggest for options and
> changes.

  points well taken so let me make a much more innocuous suggestion.
perhaps the higher-level routines like createme, updateme, and so on
could have a short comment paragraph or two at the top just
summarizing what they do, nothing more than that.

  i accept that even that higher level is still "under the covers" but
for the fun of it, i'm just following along with each (task) step of
building a yocto kernel, and it would make it *way* easier if i had
just a basic understanding of what each bitbake task was supposed to
accomplish.

  most of those utility scripts already have a "usage" routine -- how
hard would it be to add another few lines of comment as to what the
script is meant to do?

  anyway, i've whined about this sufficiently, so back to the code...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



