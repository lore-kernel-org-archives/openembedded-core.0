Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qw1xZ-0008U3-2o
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:08:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2011 18:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,272,1312182000"; d="scan'208";a="41725374"
Received: from unknown (HELO helios.localnet) ([10.255.18.108])
	by azsmga001.ch.intel.com with ESMTP; 23 Aug 2011 18:04:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 24 Aug 2011 02:04:00 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<6BCD0FB4-907F-4055-A405-F236F6D3D4AA@dominion.thruhere.net>
	<4E5442DE.7060103@linux.intel.com>
In-Reply-To: <4E5442DE.7060103@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201108240204.00267.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Wed, 24 Aug 2011 01:08:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 24 August 2011 01:16:30 you wrote:
> I would suggest possibly renaming the current meta-qt3 to meta-qt and
> including this set of demos there.

We really don't want to mix Qt 3 and Qt 4; we really only have a layer for Qt 
3 for LSB, I doubt anyone will actually use it.

By the way, in case there is some confusion, these are not extra demos. The 
demo images should merely bring in packages we are already building as part of 
Qt 4, nothing more.

IMHO, these images either belong together with Qt 4 (whereever that might be) 
or in a separate tests layer that contains testing items for everything in OE-
core. However, now isn't really the time to be making those reorganisations; 
so either we drop this task for this cycle or we add them to OE-core, that's 
the decision that needs to be made.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


