Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2MTU-0005xT-RP
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:20:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2012 06:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="203507546"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2012 06:08:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Aug 2012 14:08:27 +0100
Message-ID: <24461155.kAEotVvaST@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120817125427.GK3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<5851541.vDHObiJJ2D@helios> <20120817125427.GK3625@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 13:20:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 14:54:27 Martin Jansa wrote:
> On Fri, Aug 17, 2012 at 01:48:45PM +0100, Paul Eggleton wrote:
> > This is also undesirable for meta-oe IMHO - as a general principle,
> > meta-oe
> > shouldn't be trying to both add additional recipes *and* provide
> > newer/older versions of recipes that are in OE-Core. Please, let's get
> > the new versions into OE-Core or if they're too risky/broken for some use
> > cases for that, then they belong in people's distro layers. (Practically
> > I don't think there are that many instances of new versions of OE-Core
> > recipes that people want to use that would be actually rejected by
> > OE-Core).
> 
> What if newer version is needed for recipe which exists only in meta-oe?
> 
> I had this in meta-efl where webkit-efl was sometimes segfaulting when
> older stable version of libsoup2.4 was used, upstream solved that by
> recommending development version of libsoup2.4, but as soon as I've
> added it to meta-efl everybody (including users which don't use
> webkit-efl from meta-efl - don't need this libsoup2.4) got it as
> default.
>
> Yes I could have added this libsoup2.4 only to meta-shr (where I had
> P_V for that) and keep webkit-efl broken for everyone else, or try to
> add developement version of libsoup2.4 to oe-core..

That is an unfortunate situation - surely one possible solution though would 
be to backport the actual patch that fixes the problem to the version of the 
library in OE-Core until the development version of the library gets released? 
Alternatively, in certain cases of poorly maintained upstreams where releases 
are infrequent, we have just switched to the development version at a chosen 
revision in OE-Core (after sufficient testing, naturally).
 
I appreciate there are going to be outliers, but I think the majority of 
situations could be handled without making meta-oe introduce unexpected 
changes when it is enabled on top of OE-Core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


