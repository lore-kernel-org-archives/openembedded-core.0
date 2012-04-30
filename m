Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SOyA5-00072L-4o
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:29:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Apr 2012 14:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135327971"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2012 14:19:53 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 14:18:36 -0700
Message-Id: <cover.1335820630.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] Fixes for master-next
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
X-List-Received-Date: Mon, 30 Apr 2012 21:29:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

with eglibc-2.15 & gcc-4.7 noticed a compile issue for qt4. and here is a fix for the issue.

Thanks,
Nitin

The following changes since commit a004e53803c4715cdf31f1d77090d39c2a4f3483:

  tune-sh4.inc: Fix spelling of big-endian feature set (2012-04-30 15:57:00 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (1):
  qt4: fix compilation issue

 meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
 .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 3 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch

-- 
1.7.7



