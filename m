Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D08577141
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:50:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 11 Nov 2015 07:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="598342137"
Received: from sentry.rb.intel.com ([10.237.105.108])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2015 07:50:02 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 17:51:07 +0200
Message-Id: <cover.1447256967.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] BlueZ and QEMU upgrades
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
X-List-Received-Date: Wed, 11 Nov 2015 15:50:28 -0000

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  qemu: upgrade to 2.4.1
  bluez5: upgrade to 5.36

 .../bluez5/{bluez5_5.33.bb => bluez5_5.36.bb}      |  4 +-
 meta/recipes-devtools/qemu/qemu.inc                |  1 -
 ..._mutex_lock_iothread-fix-race-condition-a.patch | 45 ----------------------
 .../qemu/{qemu_2.4.0.bb => qemu_2.4.1.bb}          |  4 +-
 4 files changed, 4 insertions(+), 50 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch
 rename meta/recipes-devtools/qemu/{qemu_2.4.0.bb => qemu_2.4.1.bb} (85%)

-- 
2.5.0


