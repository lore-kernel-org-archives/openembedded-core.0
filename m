Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DLO-0003hw-6P
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:18:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2011 01:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="45796795"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 07 Sep 2011 01:13:43 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:18:05 +0800
Message-Id: <cover.1315383334.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] telepathy-python: remove duplicated installation entry of errors.py
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
X-List-Received-Date: Wed, 07 Sep 2011 08:18:50 -0000

Hi Richard and Saul,

This pull request is to fix [YOCTO #1453], please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:

  icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/bugfix

Dongxiao Xu (1):
  telepathy-python: avoid duplicated installation of errors.py

 .../remove_duplicate_install.patch                 |   26 ++++++++++++++++++++
 .../telepathy/telepathy-python_0.15.19.bb          |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch



