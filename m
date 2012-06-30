Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sl57n-0003zT-Fo
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 23:22:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jun 2012 14:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="165195265"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.207])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2012 14:11:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2012 22:11:23 +0100
Message-Id: <cover.1341090544.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] apr fixes v2
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
X-List-Received-Date: Sat, 30 Jun 2012 21:22:39 -0000

Since v1, rebase on latest master (removing now merged patch to add
libtool) and use site file to set pid_t type.


The following changes since commit 54429dfcca0e35a3aeaa78e509240b87d6a8f4ac:

  mklibs-native: Upgrade to 0.1.34 (2012-06-29 13:21:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/apr-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/apr-fixes

Paul Eggleton (2):
  apr: add util-linux to DEPENDS for libuuid
  site/common-linux: fix incorrect size of pid_t for apr

 meta/recipes-support/apr/apr_1.4.6.bb |    3 ++-
 meta/site/common-linux                |    1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5



