Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2OkU-0000cl-FU
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 17:46:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2012 08:34:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="209941081"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2012 08:34:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk, openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 16:34:09 +0100
Message-ID: <6117437.nEeZ99LCxr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <502E63C5.3010205@communistcode.co.uk>
References: <502E5B0E.8040809@communistcode.co.uk>
	<1345216456.27428.13.camel@ted>
	<502E63C5.3010205@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: qemu opengl issues
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
X-List-Received-Date: Fri, 17 Aug 2012 15:46:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 16:31:17 Jack Mitchell wrote:
> Richard Purdie wrote:
> > On Fri, 2012-08-17 at 16:00 +0100, Paul Eggleton wrote:
> >> Right, this is a known limitation - see Yocto Project bug 2407. By pure
> >> coincidence I was thinking about fixing it today as I am testing some
> >> other
> >> related changes; for now the only options are install the required
> >> recipes or hack out the gl-requiring parts of the qemu recipe.
> > 
> > I think we're about at the point where we're going to remove GL pass
> > through support and drop our qemu GL patches. Patches will likely appear
> > next week.
> 
> Sounds good, I'm on holiday from the 22nd till 29th so will hopefully
> see them when I get back!
> 
> Apologies for not checking the bug tracker first.

No worries - it's nice when people do check first but I wouldn't personally 
consider it mandatory.

> *side note: with so many categories it can be a massive farse trying to
> navigate the bugzilla to find bugs, even more so on top of an already
> cluttered/complicated web application.
> 
> edit: I have just looked to see if I could find the bug without looking
> at it first (using the id) and I failed miserably.. maybe the force is
> not with my today but I couldn't even decipher where qemu issues would be.

I usually just do a keyword search using the box at the top - seems effective 
to me most of the time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


