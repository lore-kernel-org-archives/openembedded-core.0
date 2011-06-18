Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0lB-0006oO-CF
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 21:00:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2011 11:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="15140018"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2011 11:57:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:56:48 +0100
Message-Id: <cover.1308423290.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] qt4-tools-nativesdk fixes
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
X-List-Received-Date: Sat, 18 Jun 2011 19:00:45 -0000

Several fixes for qt4-tools-nativesdk.

The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4-nativesdk-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-nativesdk-fix

Paul Eggleton (3):
  qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
  qt4-tools-nativesdk: drop freetype include as we build with
    -no-freetype
  qt4-tools-nativesdk: fix compile failure in src/dbus

 meta/recipes-qt/qt4/files/qt-dbus-const.patch |   21 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc   |    7 ++++---
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/qt-dbus-const.patch

-- 
1.7.4.1



