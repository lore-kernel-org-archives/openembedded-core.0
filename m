Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkJeG-0003sl-3F
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 20:41:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 11:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164125078"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.222])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 11:29:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 19:29:46 +0100
Message-Id: <cover.1340908084.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] apr fixes
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
X-List-Received-Date: Thu, 28 Jun 2012 18:41:00 -0000

Several fixes for apr that have come out of the work to get Apache
working properly.

The following changes since commit b26dda2d1e839ea461485236028e1af53b839d34:

  local.conf.sample.extended: Add accidentally missed features (2012-06-28 16:30:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/apr-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/apr-fixes

Joe MacDonald (1):
  apr: Install apr-local libtool in build dir

Paul Eggleton (2):
  apr: add util-linux to DEPENDS for libuuid
  apr: fix incorrect size of pid_t

 meta/recipes-support/apr/apr_1.4.6.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.7.9.5



