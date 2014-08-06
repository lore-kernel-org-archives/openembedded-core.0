Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EB60470246
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 06:36:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 23:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,810,1400050800"; d="scan'208";a="465481718"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 23:35:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 09:35:37 +0300
Message-Id: <cover.1407306890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] qemu: upgrade to 2.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 06:36:11 -0000

The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/qemu_upg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/qemu_upg

Cristian Iorga (1):
  qemu: upgrade to 2.1

 ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  3 +-
 meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
 .../qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb}          |  7 +-
 5 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/no-strip.patch
 rename meta/recipes-devtools/qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb} (81%)

-- 
1.9.1


