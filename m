Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQHXX-0003dE-VT
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 12:51:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Nov 2011 03:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,514,1315206000"; d="scan'208";a="75055833"
Received: from unknown (HELO helios.localnet) ([10.252.121.171])
	by azsmga001.ch.intel.com with ESMTP; 15 Nov 2011 03:44:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Nov 2011 11:44:34 +0000
Message-ID: <1822275.d3xp7880vj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 11:51:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 November 2011 08:58:00 Koen Kooi wrote:
> Let's move this to the TSC and see if we can get this crap removed. There is
> already an existing ruling that USEFLAGS should be a last resort. I'm tired
> of yocto-marketing feel good patches making life harder for people actually
> using oe-core and its output.

Marketing has nothing to do with it. All I really want is to fix the problem 
that the build blows up if you try to build any image for any of the qemu* 
machines with x11 removed from DISTRO_FEATURES. I think it would have been 
nice to also be able to avoid having to build gtk+ and everything it depends 
upon for all such images regardless of whether or not it is really needed, but 
I can live without making that further cleanup if it's going to cause such an 
uproar.

If PACKAGE_CONFIG is not an acceptable solution to this problem I'll accept 
checking for x11 in DISTRO_FEATURES alone, if that's what it takes to get the 
real problem fixed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


