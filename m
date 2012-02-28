Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9n-0004sq-OX
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563775"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:00:59 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:45 +0800
Message-Id: <cover.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5] Fixes for multilib, qemugl and vte
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
X-List-Received-Date: Tue, 28 Feb 2012 08:11:36 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
These are patches to fix bugs and multilib on latest master. Pls. pull.

Thanks,
Edwin

The following changes since commit 927bec5f72230be4f2452d9ef5a747b2c00cb781:

  bitbake.conf: Create a new filter variable BB_HASHCONFIG_WHITELIST (2012-02-27 20:10:41 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (5):
  vte: fix scroll issue
  gnupg: Fix for multilib
  libskba: Fix for multilib
  qemugl: Fix gl apps failure on qemu-x86-64
  self-hosted: Fix multiple libx11 error

 meta/recipes-core/tasks/task-self-hosted.bb        |    4 +-
 .../mesa/qemugl/call_opengl_fix.patch              |   40 ++++++-
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 meta/recipes-support/gnupg/gnupg_2.0.18.bb         |    2 +-
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    2 +-
 meta/recipes-support/vte/vte.inc                   |    3 +-
 meta/recipes-support/vte/vte/scrollbar_fix.patch   |  122 ++++++++++++++++++++
 7 files changed, 167 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch



