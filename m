Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCsuo-0006zQ-Dh
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 15:27:54 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCsm5-0000mD-1l; Wed, 28 Mar 2012 09:18:53 -0400
Date: Wed, 28 Mar 2012 09:18:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <12232640.MdqDDZk2lY@helios>
Message-ID: <alpine.DEB.2.02.1203280918070.7923@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<26662553.TyMenuqT12@helios>
	<alpine.DEB.2.02.1203280713020.2164@oneiric>
	<12232640.MdqDDZk2lY@helios>
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
X-List-Received-Date: Wed, 28 Mar 2012 13:27:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Mar 2012, Paul Eggleton wrote:

> On Wednesday 28 March 2012 07:14:41 Robert P. J. Day wrote:
> >   even though i realize this technique is not encouraged for
> > local.conf, as i mentioned, i just tested using it from scratch in a
> > brand new build and it still didn't add that package to my image.  if
> > it should have, then something isn't working.
>
> So, there are two reasons why it might not work:
>
> 1) If you're using core-image-minimal, it will never be included
> using DISTRO_EXTRA_RDEPENDS (nor MACHINE_EXTRA_RDEPENDS, for that
> matter). This is because core-image-minimal does not include
> task-base - only the minimum required to get a working system.

  ah, quite so, i didn't notice that, i'll try again with another
image just for verification.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


