Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QvWKp-0000vm-2s
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 17:22:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 08:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40627059"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 08:17:56 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 23:36:44 +0800
Message-Id: <cover.1314027196.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] libsdl: add libsdl into sato and fix build error with libsdl
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
X-List-Received-Date: Mon, 22 Aug 2011 15:22:44 -0000

There is no need for libsdl to inherit nativesdk since we enable the target version
with BBCLASSEXTEND now.
We add libsdl into sato image since some 3D graphics testing need it.


The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:

  xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (2):
  libsdl: do not inherit nativesdk
  task-core-x11-sato: add libsdl into sato image

 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    4 ++--
 meta/recipes-sato/tasks/task-core-x11-sato.bb |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)



