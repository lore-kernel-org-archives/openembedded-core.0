Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U088p-0007Jy-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 11:10:34 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54747 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U07th-0007ZM-Ez; Tue, 29 Jan 2013 04:54:33 -0500
Date: Tue, 29 Jan 2013 04:54:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130129094422.GJ16904@jama.palm1.palmone.com>
Message-ID: <alpine.DEB.2.02.1301290453220.12871@oneiric>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
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
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Tue, 29 Jan 2013 10:10:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 29 Jan 2013, Martin Jansa wrote:

> On Tue, Jan 29, 2013 at 04:08:10AM -0500, Robert P. J. Day wrote:
> >
> >   not sure if this is expected behaviour, but i'm using the meta-ti
> > layer to build a core-image-minimal for a am180x-evm.  i'm using
> > "own-mirrors" to use my own premirrors directory and i've collected
> > all of the necessary tarballs and actually completed the build, after
> > which i make sure i have saved all of the tarballs so i don't need
> > to download anything for a subsequent build.
> >
> >   as a test, i totally delete my build and start over, but this time
> > with
> >
> >   BB_NO_NETWORK = "1"
> >
> > which i assumed would still work.  instead, i almost immediately got
> > this:
> >
> > $ bitbake -c fetch core-image-minimal
> > Pseudo is not present but is required, building this first before the
> > main build
> > ERROR: ExpansionError during parsing
> > /home/rpjday/oe/dist/layers/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
> > Failure expanding variable SRCPV, expression was
> > ${@bb.fetch2.get_srcrev(d)} which triggered exception NetworkAccess:
> > Network access disabled through BB_NO_NETWORK but access requested
> > with command git ls-remote
> > git://arago-project.org/git/projects/u-boot-keystone.git
> > DEV.MCSDK-03.00.00.06 (for url None)
> > ERROR: Command execution failed: Exited with 1
>
> It's using tag instead of hash in SRCREV, so it behaves the same as
> SRC_URI = "git://.*;tag=foo" and tries to access upstream repo to
> convert tag name to hash (or check if it's still the same hash as when
> you've built it last time.

  ah ... so as a cheap hack to get around this, as long as i don't
need that recipe, i guess i could just BBMASK it out.  is that the
easiest solution?  thanks.


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


