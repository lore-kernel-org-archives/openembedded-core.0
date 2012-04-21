Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SLc63-00085Y-H5
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Apr 2012 17:19:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2012 08:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156509505"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2012 08:08:57 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Apr 2012 23:05:52 +0800
Message-Id: <cover.1335020669.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1][PULL] Fix bug 2355
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
X-List-Received-Date: Sat, 21 Apr 2012 15:19:35 -0000

Hi Richard,

This patch is to fix bug 2355, please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore

Dongxiao Xu (1):
  qt4: move functions from python to shell style

 meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |   15 ++++++++++++---
 meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
 meta/recipes-qt/qt4/qt4.inc                 |   27 +++++++++++++++++++++++----
 meta/recipes-qt/qt4/qt4_arch.inc            |   25 -------------------------
 5 files changed, 37 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4_arch.inc

-- 
1.7.4.1



