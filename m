Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCB86FECD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 07:43:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2014 00:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,810,1400050800"; d="scan'208";a="584085510"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2014 00:43:29 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 10:43:24 +0300
Message-Id: <cover.1407310848.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/1] qemu: upgrade to 2.1
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
X-List-Received-Date: Wed, 06 Aug 2014 07:43:31 -0000

Adding a build dependency on gnutls was not the proper fix for QA warning,
but a config on Quorum support. This created the need for v2.
Commit message chaged accordingly.

The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/qemu_upg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/qemu_upg

Cristian Iorga (1):
  qemu: upgrade to 2.1

 ...-Arm-versatilepb-Add-memory-size-checking.patch |  2 +-
 .../qemu/files/pcie_better_hotplug_support.patch   | 74 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 meta/recipes-devtools/qemu/qemu/no-strip.patch     | 15 -----
 .../qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb}          |  7 +-
 5 files changed, 4 insertions(+), 96 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/pcie_better_hotplug_support.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/no-strip.patch
 rename meta/recipes-devtools/qemu/{qemu_2.0.0.bb => qemu_2.1.0.bb} (81%)

-- 
1.9.1


