Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuNn6-00080X-8G
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:07:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 05:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171718041"
Received: from unknown (HELO helios.localnet) ([10.252.121.37])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 05:56:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Jul 2012 13:56:11 +0100
Message-ID: <6492036.bctPLCmjO3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <0F8A947F-5465-4350-9700-5E0457EB1A38@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<1515360.HL1K52tqqg@helios>
	<0F8A947F-5465-4350-9700-5E0457EB1A38@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:07:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 July 2012 14:38:59 Koen Kooi wrote:
> Op 26 jul. 2012, om 14:32 heeft Paul Eggleton het volgende geschreven:
> > On Thursday 26 July 2012 14:29:14 Koen Kooi wrote:
> >> Op 26 jul. 2012, om 14:00 heeft Burton, Ross het volgende geschreven:
> >>> On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>> It would be nice if other layers that have RDEPENDS_foo = "dbus-x11"
> >>>> keep
> >>>> working till their maintainers get around fixing them. Note that you
> >>>> might need to do a -c cleansstate on dbus first to trigger any errors.>
> >>> 
> >>> Yes, and isn't that what the RPROVIDES is for?
> >> 
> >> I'm not sure if bitbake can map RPROVIDES to PROVIDES, I vaguely remember
> >> that it doesn't, but it will pick it up *after* do_package has run. I
> >> broke
> >> OE way too many times doing things like that :)
> > 
> > Why would it need to if we're talking about RDEPENDS and more specifically
> > RDEPENDS defined before do_package?
> 
> Because AIUI RDEPENDS get resolved to build the runqueue, so you can't do
> RDEPENDS_foo = "I-don't-exist". If that's not the case I'll shut up :)

Without being too concerned with implementation details, I think it's as 
simple as this: if recipe A has foo in RDEPENDS_${PN} and recipe B has foo in 
RPROVIDES_${PN} then the runtime dependency is considered satisfied and things 
will work. You don't have to specify foo in PROVIDES unless something else has 
foo in DEPENDS.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


