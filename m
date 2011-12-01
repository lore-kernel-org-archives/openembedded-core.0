Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RW2w1-0006Zv-Jl
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:28:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 01:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81668167"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 01:21:22 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 17:21:24 +0800
Message-Id: <cover.1322731182.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] 3 new patches for the self-hosted-image work
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
X-List-Received-Date: Thu, 01 Dec 2011 09:28:05 -0000

The following changes since commit d7cd934376ae1edaf7055ec635eb3c85fdbf58b3:

  squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self-hosted-v4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self-hosted-v4

Dexuan Cui (3):
  make: expand MAKEFLAGS before we re-exec after rebuilding makefiles.
  task-self-hosted: install sudo, tun.ko, iptables, libgl and libgl-dev
    into the target
  runqemu-ifup, runqemu-internal: be wiser when locating the network
    tools

 meta/recipes-core/tasks/task-self-hosted.bb        |   14 +++++--
 .../make/make-3.82/expand_MAKEFLAGS.patch          |   39 ++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |    4 ++-
 scripts/runqemu-ifup                               |    8 +++--
 scripts/runqemu-internal                           |    3 +-
 5 files changed, 59 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch

-- 
1.7.6



