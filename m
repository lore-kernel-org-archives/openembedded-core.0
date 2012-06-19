Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh2lj-0005mw-W4
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 20:03:12 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:39236 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh2bA-00027D-0i; Tue, 19 Jun 2012 13:52:16 -0400
Date: Tue, 19 Jun 2012 13:52:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <4256903.kAPMsSF2tk@helios>
Message-ID: <alpine.DEB.2.02.1206191349040.1449@oneiric>
References: <alpine.DEB.2.02.1206191257390.1069@oneiric>
	<4256903.kAPMsSF2tk@helios>
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
Subject: Re: proper use of CORE_IMAGE_EXTRA_INSTALL?
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
X-List-Received-Date: Tue, 19 Jun 2012 18:03:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 19 Jun 2012, Paul Eggleton wrote:

> On Tuesday 19 June 2012 13:05:35 Robert P. J. Day wrote:
... snip ...
> >
> >   now this would seem to be exactly what the variable
> > CORE_IMAGE_EXTRA_INSTALL was invented for, no?  certainly the above
> > will work but then what's the point of having
> > CORE_IMAGE_EXTRA_INSTALL?
> >
> >   however, if one used that, it's obvious that one would leave the
> > line "inherit core-image" to near the bottom of the .bb file, but
> > returning to my earlier question, what is the proper ordering of
> > setting CORE_IMAGE_EXTRA_INSTALL and inheriting core-image.  it's
> > clear "inherit core-image" would always work *after*, but what about
> > before?
>
> I feel like we've gone over this ground quite a lot; but I guess
> that's because our documentation and examples still aren't clear, so
> fair enough.
>
> There's nothing forcing you into a specific usage here, however we
> might make some recommendations. My recommendation would be to leave
> CORE_IMAGE_EXTRA_INSTALL for use from local.conf - i.e. don't use it
> in your own image recipe; if you want to add things there use
> IMAGE_INSTALL += or IMAGE_INSTALL_append (see other thread).

  and i apologize for beating this so thoroughly -- i'm actually not
suggesting any fundamental changes to the code base; rather, i'm
currently designing an intro course in oe-core/yocto and if i'm going
to use actual recipe files out of oe-core, there's no question i'm
going to have to explain why some of them simply look a bit weird.

  i'm just trying to codify some "best practices".

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


