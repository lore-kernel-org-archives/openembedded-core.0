Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Ti18u-0003WU-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 12:03:24 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52570 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Ti0us-0003zc-KI; Mon, 10 Dec 2012 05:48:54 -0500
Date: Mon, 10 Dec 2012 05:48:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Tom Zanussi <tom.zanussi@intel.com>
In-Reply-To: <1355116759.26722.4.camel@empanada>
Message-ID: <alpine.DEB.2.02.1212100548251.5958@oneiric>
References: <alpine.DEB.2.02.1212090822170.4715@oneiric>
	<1355116759.26722.4.camel@empanada>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means "LICENSE_FLAGS = "license_${PN}_${PV}" ?
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
X-List-Received-Date: Mon, 10 Dec 2012 11:03:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 9 Dec 2012, Tom Zanussi wrote:

> On Sun, 2012-12-09 at 08:23 -0500, Robert P. J. Day wrote:
> > scanning a number of OE layers for examples of things to demo in
> > class, and i ran across this in the meta-intel layer:
> >
> > LICENSE_FLAGS = "license_${PN}_${PV}"
> >
> >   not sure what that means, and still not conversant enough in python
> > to read the source.
> >
>
> Hi,
>
> See section '3.4.2. Enabling Commercially Licensed Recipes' in the Yocto
> reference manual for details on that variable:
>
> http://www.yoctoproject.org/docs/1.4/poky-ref-manual/poky-ref-manual.html#enabling-commercially-licensed-recipes

  ah, thanks, i really do need to finish reading *all* the docs one of
these days.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


