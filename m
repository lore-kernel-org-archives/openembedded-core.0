Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJOP5-0000ED-Fi
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:50:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Oct 2012 05:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="219071488"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2012 05:37:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 13:37:14 +0100
Message-Id: <cover.1349267792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Minor fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:50:19 -0000

The following changes since commit eb96be4db46039752c44dc37ef676eaac04e3dba:

  xf86-video-intel: drop libxvmc dependency (2012-10-03 12:41:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes2

Paul Eggleton (2):
  buildhistory_analysis: update to use explode_dep_versions2()
  rpmresolve: fix reporting of multiple matches error

 meta/lib/oe/buildhistory_analysis.py              |   23 +++++++++++++++++----
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |    6 +++---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |    2 +-
 3 files changed, 23 insertions(+), 8 deletions(-)

-- 
1.7.9.5



