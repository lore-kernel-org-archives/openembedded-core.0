Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qwbwo-0004Wn-9o
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:34:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Aug 2011 08:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41870149"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.243])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2011 08:29:37 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 08:29:29 -0700
Message-Id: <cover.1314286007.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Enhance network connectivity sanity check
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
X-List-Received-Date: Thu, 25 Aug 2011 15:34:26 -0000

The patch header says it all, I've switched to using the checkstatus API of
fetch2 to implement the network connectivity check.

This adds a requirement for BitBake master as of yesterday if you want to
sanity check a gainst git uri's.

The following changes since commit 445d6426197579a9c0317498cc6919bb63e7f726:

  meta-toolchain/environment: Collected site config files in runtime. (2011-08-24 19:26:01 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/connection-test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/connection-test

Joshua Lock (1):
  classes/sanity: enhance the network connectivity test

 meta/classes/sanity.bbclass |   14 ++------------
 1 files changed, 2 insertions(+), 12 deletions(-)

-- 
1.7.6



