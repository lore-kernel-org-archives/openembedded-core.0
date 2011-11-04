Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5R-0000ta-Pq
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:01:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129579"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:33 +0000
Message-Id: <cover.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/7] combo-layer enhancements
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
X-List-Received-Date: Fri, 04 Nov 2011 18:01:54 -0000

A batch of improvements to the combo-layer tool.

The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:

  rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes2

Paul Eggleton (7):
  scripts/combo-layer: handle merge commits
  scripts/combo-layer: make init set up initial component data
  scripts/combo-layer: tidy up config example
  scripts/combo-layer: make component repo branch configurable
  scripts/combo-layer: fix dirty repo check
  scripts/combo-layer: auto-commit updated config file
  scripts/combo-layer: improve some messages

 scripts/combo-layer              |  121 +++++++++++++++++---------------------
 scripts/combo-layer.conf.example |   28 +++++++--
 2 files changed, 75 insertions(+), 74 deletions(-)

-- 
1.7.5.4



