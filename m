Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQL1T-00027n-Pb
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 16:34:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2011 07:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="75650115"
Received: from unknown (HELO helios.localnet) ([10.252.121.171])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2011 07:27:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Nov 2011 15:27:42 +0000
Message-ID: <12956840.7JzGYdDPgH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <2D41B4A3-F3EB-4AAB-8A68-FA67EE79F52F@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321369973.26881.225.camel@ted>
	<2D41B4A3-F3EB-4AAB-8A68-FA67EE79F52F@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 15 Nov 2011 15:34:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 November 2011 16:23:07 Koen Kooi wrote:
> The patch here doesn't use 'x11', but 'gui' as PACKAGECONFIG. Triggering on
> x11 is fine in this case.

Unless I've misunderstood, PACKAGECONFIG's namespace is specific to the 
package; so it does not really matter what it is called. If we're talking 
about changing to use DISTRO_FEATURES then yes, x11 would be the feature to 
check for.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


