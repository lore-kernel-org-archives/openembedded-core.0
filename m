Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Seqdz-0005dx-LZ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 18:42:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="152668157"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.155])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 09:31:25 -0700
Message-Id: <cover.1339604980.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
Subject: [2011-1 PATCH 0/2] Edison/2011-1 fixes
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
X-List-Received-Date: Wed, 13 Jun 2012 16:42:07 -0000

A couple of minor patches. The first enables ghostscript-native to build on
more recent Debian based systems. The second fixes the timeout of the SSH and
SCP automated sanity checks.

Regards,
Joshua

The following changes since commit ab2a4591c4c3926a960f18fa7e848f5d41255e14:

  populate_sdk_ipk.bbclass: Ensure the correct environment is setup for postinstalls (2012-05-21 22:14:59 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib josh/edison
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/edison

Richard Purdie (1):
  ghostscript-native: Ensure the sys/time/h fix is applied for native
    builds

Yi Zhao (1):
  scripts/qemuimage-testlib: fix typos

 meta/recipes-extended/ghostscript/ghostscript_9.02.bb |    1 +
 scripts/qemuimage-testlib                             |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.10.2



