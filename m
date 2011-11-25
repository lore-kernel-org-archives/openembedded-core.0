Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTuJD-0003eO-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:51:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Nov 2011 03:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79906318"
Received: from unknown (HELO helios.localnet) ([10.252.121.214])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2011 03:44:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, koen@dominion.thruhere.net,
	elizabeth.flanagan@intel.com
Date: Fri, 25 Nov 2011 11:44:22 +0000
Message-ID: <1812495.zPKFoIJV0g@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
MIME-Version: 1.0
Subject: Image history (testlab)
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
X-List-Received-Date: Fri, 25 Nov 2011 11:51:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Koen / Beth / all,

Following on from my work extending packagehistory (which is still under 
review), I'm looking at tracking history of the content of images so we can 
get warnings about regressions. Thanks to Koen we've had this capability via 
testlab.bbclass in OE for some time now, and from there into meta-oe, but what 
I'd like to do now is bring this into OE-core and extend it so that it 
supports rpm (or even better, all of the package backends we support.) This 
could involve abstracting the package backend functionality out into 
rootfs_*.bbclass.

It also looks like testlab.bbclass in meta-oe has some license dumping 
functionality. Beth, does that mesh with what you've been working on / 
preparing for Yocto 1.2?

Thoughts?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


