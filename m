Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qbua8-0002id-59
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:13:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 06:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="21884691"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 06:09:44 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 21:09:37 +0800
Message-Id: <cover.1309352791.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/3] fix to bug #1099, updates to Upstream-Status and distro_tracking_fields.inc
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
X-List-Received-Date: Wed, 29 Jun 2011 13:13:28 -0000

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (3):
  grub: add -fno-reorder-functions into STAGE2_COMPILE
  lttng-ust: change the patch's Upstream-Status to Accepted.
  distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for
    screen and tcf-agent

 .../conf/distro/include/distro_tracking_fields.inc |    3 +-
 .../grub/grub-0.97/no-reorder-functions.patch      |   31 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    5 ++-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 4 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/no-reorder-functions.patch

-- 
1.7.6



