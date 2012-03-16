Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8cXA-0004u5-I3
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 20:09:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2012 12:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140089167"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2012 12:01:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 19:00:55 +0000
Message-Id: <cover.1331924409.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/6] Misc fixes
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
X-List-Received-Date: Fri, 16 Mar 2012 19:09:52 -0000

The following changes since commit efd80fd23cb96ccc203893017938c1163d20b898:

  tcl: Fix bad RPATH QA warning (2012-03-16 16:47:27 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes16

Paul Eggleton (6):
  classes/image: avoid cp race condition when building multiple images
  buildhistory_analysis: fix duplicate PE/PV/PR in related fields
  buildhistory: allow disabling image and/or package history
  buildhistory: avoid reruns of do_package
  iproute2: fix unpackaged files warning
  qt4: add RPROVIDES/RREPLACES for qmake2 recipe

 meta/classes/buildhistory.bbclass                  |   24 +++++++++++++++++--
 meta/classes/image.bbclass                         |    2 +-
 meta/lib/oe/buildhistory_analysis.py               |    2 +-
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../iproute2/iproute2_3.2.0.bb                     |    2 +
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    3 ++
 8 files changed, 31 insertions(+), 8 deletions(-)

-- 
1.7.5.4



