Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0euL-0001mb-UV
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 22:09:28 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52495 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0efA-0007x8-UB; Wed, 30 Jan 2013 15:53:45 -0500
Date: Wed, 30 Jan 2013 15:53:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Harvey Chapman <hchapman-oecore@3gfp.com>
In-Reply-To: <3C2BEFD8-C67F-4356-9518-5E91D1B975D4@3gfp.com>
Message-ID: <alpine.DEB.2.02.1301301552470.3553@oneiric>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
	<CABcZAN=urVqvHFj_EkRXfkDUpbNb51Lr7taPWiPYXqqU__Cigw@mail.gmail.com>
	<3C2BEFD8-C67F-4356-9518-5E91D1B975D4@3gfp.com>
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
Cc: Chris Larson <clarson@kergoth.com>, Martin Jansa <martin.jansa@gmail.com>,
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
X-List-Received-Date: Wed, 30 Jan 2013 21:09:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 30 Jan 2013, Harvey Chapman wrote:

> So, should BB_NO_NETWORK=1 automatically set BB_SRCREV_POLICY=cache
> because the former implies the latter?

  how would that have any useful effect?  by the time you set
BB_NO_NETWORK=1, you better have all those SRCREVs cached already.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


