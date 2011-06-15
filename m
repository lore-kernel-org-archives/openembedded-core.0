Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QWkRv-0005w9-7G
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:23:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2011 00:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,369,1304319600"; d="scan'208";a="16404177"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2011 00:20:06 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 15:19:55 +0800
Message-Id: <cover.1308122189.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 0/2] fix the mesa-dri build failure after upgrading to newer glproto and dri2proto
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
X-List-Received-Date: Wed, 15 Jun 2011 07:23:39 -0000

Please review them.

The following changes since commit 6719d1e245234767bb5409c30dd34388ab935550:

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/fix_mesa-dri
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/fix_mesa-dri

Dexuan Cui (2):
  glproto: Revert "glxproto: make GLX swap event struct match spec"
  dri2proto: Revert "dri2proto: make DRI2 swap event match GLX spec"

 .../restore_to_old_xDRI2BufferSwapComplete.patch   |   53 ++++++++++++++++++++
 meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb  |    3 +-
 .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 ++++++++++++++++++++
 meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb |    3 +-
 4 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch



