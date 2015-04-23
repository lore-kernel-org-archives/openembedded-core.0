Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C655C6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:39:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 07:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="484703246"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 07:38:50 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:38:32 +0300
Message-Id: <cover.1429799661.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v5 0/4] Switch to BlueZ 5.x as default Bluetooth stack
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
X-List-Received-Date: Thu, 23 Apr 2015 14:39:11 -0000

BlueZ 5.x is now the default Bluetooth stack.
BlueZ 4.x is moved to recipes-connectivity in meta-oe
layer and still supported in poky/YP.

The following changes since commit 781165b071babb888f46a4e1d15880df924c65f6:

  bison: don't depend on help2man (2015-04-21 13:59:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/YB7479_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=Ciorga/YB7479_v3

Cristian Iorga (4):
  bluez4: add proper systemd support
  bluez: remove bluez4 recipes
  bitbake.conf: backfill bluez5 feature
  bluez5: don't exclude from world builds

 meta/conf/bitbake.conf                             |   2 +-
 .../obsolete_automake_macros.patch                 |  14 ---
 .../bluez/bluez-hcidump_2.5.bb                     |  22 -----
 .../bluez/bluez4-4.101/bluetooth.conf              |  16 ---
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 -------
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 ---------------------
 .../bluez/bluez4-4.101/install-test-script.patch   |  26 -----
 ...ork-fix-network-Connect-method-parameters.patch |  30 ------
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ---
 .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 -----
 ...pygobject-instead-ofgobject-introspection.patch |  27 -----
 meta/recipes-connectivity/bluez/bluez4.inc         |  46 ---------
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  47 ---------
 .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 --------
 meta/recipes-connectivity/bluez5/bluez5.inc        |   2 -
 15 files changed, 1 insertion(+), 455 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb

-- 
2.1.0


