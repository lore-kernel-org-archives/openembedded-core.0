Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCtPt-0007Ko-Ex
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 16:00:01 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCtHA-0002xj-9G for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 09:51:00 -0400
Date: Wed, 28 Mar 2012 09:50:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <67D24706-0CFE-4BE0-90C9-325BC9BDE18A@dominion.thruhere.net>
Message-ID: <alpine.DEB.2.02.1203280949290.9289@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<67D24706-0CFE-4BE0-90C9-325BC9BDE18A@dominion.thruhere.net>
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
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 14:00:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Mar 2012, Koen Kooi wrote:

>
> Op 27 mrt. 2012, om 05:20 heeft Robert P. J. Day het volgende geschreven:
>
> >
> >  i'm currently poring over the OE docs (including the ones at the
> > yocto site), and i'm trying to figure out how to simply add a package
> > to an image through one's local.conf file.
>
> Why throught local.conf. Image recipes are really small and easy to
> understand. Just make a copy of the recipe you want to change and
> change that, no need to go poke at it from non obvious places. I
> really don't understand why people are so against creating their own
> image recipe since foo-image.bb is not really foo-image anymore if
> you add 'bar' to it thru e.g. local.conf.

  actually, i have no problem with that, as long as the same
philosophy holds in the official OE/yocto docs.  but if the docs
themselves explain how to do it through local.conf, then it should be
supported.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


