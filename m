Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QCwPP-0004hC-By
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 18:07:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Apr 2011 09:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,252,1301900400"; d="scan'208";a="423343648"
Received: from unknown (HELO helios.localnet) ([10.255.13.60])
	by azsmga001.ch.intel.com with ESMTP; 21 Apr 2011 09:04:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 17:04:37 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
MIME-Version: 1.0
Message-Id: <201104211704.37707.paul.eggleton@linux.intel.com>
Subject: [RFC] meta-handheld
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
X-List-Received-Date: Thu, 21 Apr 2011 16:07:13 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I've discussed the possibility with a few people on IRC of creating a meta-
handheld layer for support of older handheld devices - this would include 
Zaurus, iPAQ, SimPad, etc; possibly even EZX phones if they aren't in a layer 
of their own. These machines share a fair amount of commonality and I don't 
think that they will all survive if each one has to be put into a BSP of its 
own. Response so far seems to be positive but I'd like to hear thoughts from 
others on this.

I have access to many of these devices, and this is something I am prepared to 
maintain on my own time, although I would appreciate help from others. I have 
the basis of a layer from what was left in oe-core and meta-extras but quite a 
lot of it would need to be brought over from OE.

If people agree that this is a good idea, the next question would be where to 
host it - is this something that could be within the meta-oe repository?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre (UK)


