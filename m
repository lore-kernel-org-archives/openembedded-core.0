Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UdK5U-0005Lp-1C
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 14:48:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2013 05:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,692,1363158000"; d="scan'208";a="338916226"
Received: from unknown (HELO helios.localnet) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2013 05:30:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>, openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 13:30:24 +0100
Message-ID: <8007192.MZnvvGgZfG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1368700555.6920.118.camel@phil-desktop.brightsign>
References: <518A6B25.5000108@r-finger.com> <5194A04E.3000300@r-finger.com>
	<1368700555.6920.118.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Fri, 17 May 2013 12:48:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 May 2013 11:35:55 Phil Blundell wrote:
> On Thu, 2013-05-16 at 10:01 +0100, Tomas Frydrych wrote:
> > On 15/05/13 21:49, Phil Blundell wrote:
> > > - we have a slightly funky 2-stage bootstrap process for cogl in order
> > > to break the dependency cycle with cairo; this involves hacks to the
> > > recipes for cogl, cairo, pango and harfbuzz (at least) which I suspect
> > > would not be very palatable to oe-core.
> > 
> > I have never run into this, is this with recent cogls?
> 
> It's because we build Cairo with the cogl backend enabled.  That
> introduces a dependency of cairo on cogl (obviously), which is a problem
> because cogl-pango needs pango, which needs harfbuzz, which needs cairo.
> So what we do is build cogl initially with pango disabled, then use that
> to compile cairo and the rest of the stack, and then finally build the
> "real" cogl with everything enabled.
> 
> Obviously the other option would be to build cairo twice, firstly
> without cogl and the second time with it.  I don't think there's much to
> choose between the two.

I was just speaking to one of the cogl developers and he was surprised that 
anyone would be using cairo's cogl backend since it's never really been 
finished. Is that backend definitely functionality that you're using?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


