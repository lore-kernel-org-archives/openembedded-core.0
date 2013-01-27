Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tzbdt-0000tC-Kt
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:28:05 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56664 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TzbOn-0002PT-4d; Sun, 27 Jan 2013 18:12:29 -0500
Date: Sun, 27 Jan 2013 18:12:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <F9201BC4-B773-4B6F-B404-7C5ECCC66BE6@3gfp.com>
Message-ID: <alpine.DEB.2.02.1301271811470.1315@oneiric>
References: <alpine.DEB.2.02.1301271622090.24073@oneiric>
	<F9201BC4-B773-4B6F-B404-7C5ECCC66BE6@3gfp.com>
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
Subject: Re: how to tweak a kernel recipe file to point at a local git repo?
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
X-List-Received-Date: Sun, 27 Jan 2013 23:28:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 27 Jan 2013, Harvey Chapman wrote:

> On Jan 27, 2013, at 4:26 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
> > SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
> >        file://defconfig"
> > ===== snip =====
> >
> >  now i already *have* that repo cloned on my local hard drive, so
> > what would i change in the recipe file (just temporarily) to point the
> > fetcher there?  i would only need to do that once since i've set up my
>
> Something like this:
>
> SRC_URI = "git:///home/hchapman/kernel.git;branch=omap-3.5;protocol=file"

  that's exactly what i tried, and i still had a fetcher failure.
i'll test it again later.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


