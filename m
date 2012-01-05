Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RijlB-0002Ob-Lh
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 10:37:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 01:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108992542"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 01:29:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:29:45 +0000
Message-Id: <cover.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Minor fixes
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
X-List-Received-Date: Thu, 05 Jan 2012 09:37:21 -0000

Fix an omitted Upstream-Status in a recent patch I added, plus some text
changes in a few other places.

The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:

  valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes9
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes9

Paul Eggleton (4):
  classes/update-alternatives: fix typos and grammar
  README: add short description of OE-Core
  conf/local.conf.sample: fix typos/grammar/formatting
  qt4: add Upstream-Status to recently added qt-4.8.0 patch

 README                                            |    6 +++-
 meta/classes/update-alternatives.bbclass          |   12 +++---
 meta/conf/local.conf.sample                       |   35 +++++++++++----------
 meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch |    2 +
 4 files changed, 31 insertions(+), 24 deletions(-)

-- 
1.7.5.4



