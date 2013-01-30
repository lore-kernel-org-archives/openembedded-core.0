Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0eUj-0006OR-Ou
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 21:43:29 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:40810 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0eFY-0006DA-WE; Wed, 30 Jan 2013 15:27:17 -0500
Date: Wed, 30 Jan 2013 15:27:15 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130129112406.GK16904@jama.palm1.palmone.com>
Message-ID: <alpine.DEB.2.02.1301301520430.3650@oneiric>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
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
X-List-Received-Date: Wed, 30 Jan 2013 20:43:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 29 Jan 2013, Martin Jansa wrote:

... snip ...

> It would be better to change SRCREV to hash corresponding to that
> tag and move tag only to comment above SRCREV. Such patch could be
> applied in upstream...

  which brings up a larger issue ... what is the *preferred* way of
doing this if one was writing a style guide?  i understand developers
might like to set git SRCREV variables to meaningful tag names but, as
i've learned, that really screws up the possibility of building with
no network.  as it is, quite a few recipes set SRCREV to a hash ID for
*precisely* that reason and, in a short comment above (as you say),
mention the tag it corresponds to.

  which brings me to what caused this annoyance in the first place --
the meta-ti layer, which has only four recipes that use

  SRCREV = <tag name>

so it wouldn't be that hard to submit a patch to adjust those, but
then there's this in
meta-ti/recipes-kernel/linux/linux-keystone_3.6.6.bb:

# The tree tends to rebase, use literal stable tags
SRCREV = "DEV.MCSDK-03.06.06.07"

  uh ... correct me if i'm wrong but isn't it in unspeakably bad taste
to rebase commits that have already been published?

  in any event, can it be considered bad form to set SRCREV to git tag
names?  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


