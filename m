Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYLa6-0004X3-Lc
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:46:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 09:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93564355"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2011 09:39:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 17:39:45 +0000
Message-Id: <cover.1323279373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Qt4 fixes
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
X-List-Received-Date: Wed, 07 Dec 2011 17:46:58 -0000

A couple of fixes that I took the opportunity to do while I was testing
building Qt 4.8.0 RC1. (Incidentally I will post the 4.8.0 recipes once
the release is final, which reportedly should be within the next few
weeks.)

The following changes since commit 493746f1d7f1410284880203c1ac462d61ab5299:

  matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings (2011-12-07 12:42:22 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-debug
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-debug

Paul Eggleton (2):
  qt4: fix debug symbol stripping
  qt4: various tidy-ups

 .../qt4/files/add_nostrip_for_debug_packages.diff  |   23 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |    4 +--
 meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |    2 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    6 ++++-
 9 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff

-- 
1.7.5.4



