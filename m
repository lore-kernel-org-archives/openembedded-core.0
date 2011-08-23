Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qvo1Z-0006QO-3c
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 12:16:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 03:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40916892"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.129])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2011 03:11:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 11:11:11 +0100
Message-Id: <cover.1314094152.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Remove cp -n option as discussed
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
X-List-Received-Date: Tue, 23 Aug 2011 10:16:01 -0000

The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:

  xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/sanity3a
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity3a

Paul Eggleton (1):
  image.bbclass: remove non-standard -n option from cp command

 meta/classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



