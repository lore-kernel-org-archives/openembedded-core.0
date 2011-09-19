Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5emn-0007vS-3m
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 16:25:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 07:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50127354"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 07:20:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 15:20:07 +0100
Message-Id: <cover.1316441889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix for combo-layer default hook script
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
X-List-Received-Date: Mon, 19 Sep 2011 14:25:29 -0000

Otavio Salvador reported another issue with the hook script which I have
fixed; the circumstances are briefly described in the patch.

The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-hook-fix-2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-hook-fix-2

Paul Eggleton (1):
  scripts/combo-layer: fix still overzealous regex in default hook
    script

 scripts/combo-layer-hook-default.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



