Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S4oru-0004Np-Bp
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 08:31:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Mar 2012 23:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115184978"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 05 Mar 2012 23:22:57 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 15:23:09 +0800
Message-Id: <cover.1331017518.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/4] Fixes for multilib and VTE, Mar 6, 2012
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
X-List-Received-Date: Tue, 06 Mar 2012 07:31:34 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

RP,
2 fixes for multilib.
1 for VTE, which just revert a simple commit after last VTE upgrade. Although
doesn't hit the root cause, it fix the end user experience issue and is more
light-weight than reverting whole VTE upgrade. We can revisit it for root cause
in future.

Thanks,
edwin

The following changes since commit a8dc76ee69cfe1ffe846c07a510e3a562a5b1a7f:

  base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:04:11 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Dongxiao Xu (1):
  multilib: extend all recipes in multilib.conf

Zhai Edwin (3):
  vte: fix scroll issue
  self-hosted: Fix multiple libx11 error
  shadow-sysroot: Fix for multilib

 meta/classes/useradd.bbclass                     |    2 +-
 meta/conf/multilib.conf                          |  313 ++++++++++++++++++++--
 meta/recipes-core/tasks/task-self-hosted.bb      |    4 +-
 meta/recipes-support/vte/vte.inc                 |    3 +-
 meta/recipes-support/vte/vte/scrollbar_fix.patch |  122 +++++++++
 5 files changed, 424 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch



