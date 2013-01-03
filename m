Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TqugK-0000YB-UC
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 00:58:41 +0100
Received: from [67.210.173.114] (port=48237 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TquRl-0007PX-L6; Thu, 03 Jan 2013 18:43:37 -0500
Date: Thu, 3 Jan 2013 18:43:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1471125.fLHJiJURJn@helios>
Message-ID: <alpine.DEB.2.02.1301031842220.3315@oneiric>
References: <alpine.DEB.2.02.1301021151240.6551@oneiric>
	<50E4829C.9040908@linux.intel.com>
	<alpine.DEB.2.02.1301030605190.8567@oneiric>
	<1471125.fLHJiJURJn@helios>
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
Subject: Re: value of "PACKAGE_BEFORE_PN" versus "PACKAGES =+"?
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
X-List-Received-Date: Thu, 03 Jan 2013 23:58:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 3 Jan 2013, Paul Eggleton wrote:

> On Thursday 03 January 2013 06:27:57 Robert P. J. Day wrote:
>
> > see oe-core/meta/recipes-multimedia/pulseaudio, where
> > pulseaudio.inc contains the line:
> >
> > FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
> >
> > but there is no reference to lib_package anywhere in that recipe
> > directory.  so what's the point of that line above?
>
> Looks like this is a mistake (or something left over from an earlier revision
> of the recipe) since ${PN}-bin isn't in PACKAGES for pulseaudio.

  i suspected something like that, just wanted to clarify.  i'll let
someone higher up the food chain fix that in whatever way is
appropriate.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


