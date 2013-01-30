Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0eew-0007wF-UV
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 21:53:31 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:40972 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0ePk-0006s6-Vv; Wed, 30 Jan 2013 15:37:49 -0500
Date: Wed, 30 Jan 2013 15:37:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Chris Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1301301535390.3782@oneiric>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
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
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 30 Jan 2013 20:53:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 30 Jan 2013, Chris Larson wrote:

> It's worth bringing up the SRCREV_POLICY variable, which lets you
> control how bitbake handles caching of srcrevs. By default, it
> figures it needs to get the mapping every time (value == clear, or
> unset), which can make sense in certain cases. But you can tell it
> to go ahead and use the values it has cached from a previous run, as
> well (value == cache). This can be useful if you know you're moving
> into an offline state and want to prepare for it above and beyond
> the -c fetchall.

  i'm not in the least embarrassed to admit i didn't even know that
variable existed.  and, yes, that pretty much solves the problem.

  i'm still creeped out by that comment of using the tag name to deal
with rebasing a public commit, though.  :-P

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


