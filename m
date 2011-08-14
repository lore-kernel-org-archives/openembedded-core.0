Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsgmD-0000xz-0H
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Aug 2011 21:55:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2011 12:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,370,1309762800"; d="scan'208";a="38350472"
Received: from unknown (HELO helios.localnet) ([10.255.18.55])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2011 12:50:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 20:50:37 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201108142050.37352.paul.eggleton@linux.intel.com>
Subject: Machine specific sysroot issue
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
X-List-Received-Date: Sun, 14 Aug 2011 19:55:21 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I've brought over the Opie recipes from OE in preparation for creating a 
separate layer, and after making a few changes everything compiles OK; however 
I'm finding that the change to machine-specific sysroots is causing some 
problems.

libopie2, a non-machine specific package, among other things installs a file 
called include.pro into ${OPIEDIR}, which is configured to be 
${STAGING_DIR_HOST}. In OE-classic ${STAGING_DIR_HOST} is not machine-specific, 
so if you build libopie2 for machine A then build some other package that 
needs include.pro for machine B, then everything is fine. In the OE-core case 
with machine-specific sysroots it's looking for the file in the sysroot for the 
current machine, which if you've been building for several different machines 
may not be where it has actually been installed.

What's the correct way to fix this? Is libopie2 now installing this file in the 
wrong place?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


