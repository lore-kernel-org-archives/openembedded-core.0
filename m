Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvGI0-0000hM-GP
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 00:14:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2011 15:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40049274"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2011 15:09:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Aug 2011 15:09:57 -0700
Message-Id: <cover.1313964401.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] fix RDEPENDS missing a ${PN}
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
X-List-Received-Date: Sun, 21 Aug 2011 22:14:44 -0000

nuf said

Sau!


The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:

  xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  at: fix RDEPENDS -> RDEPENDS_${PN}

 meta/recipes-extended/at/at_3.1.12.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



