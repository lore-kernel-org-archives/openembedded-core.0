Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6C1724DC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 14:13:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Apr 2015 07:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,517,1422950400"; d="scan'208";a="702887931"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2015 07:13:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 17:13:09 +0300
Message-Id: <cover.1428070227.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] Switch to BlueZ 5.x as default Bluetooth stack
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
X-List-Received-Date: Fri, 03 Apr 2015 14:13:33 -0000

BlueZ 5.x is now the default Bluetooth stack.
BlueZ 4.x is moved to meta-oe networking collection
and still supported in oe-core.

The following changes since commit d6d2dd5c9e06c54ff336b44d54f01b4fe24903ed:

  tools: A real fix for thos mega-manual.sed file for Toaster. (2015-04-02 20:30:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB7479_refinement
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB7479_refinement

Cristian Iorga (5):
  bluez5: upgrade to 5.29
  bluez: remove recipes collection
  maintainers.inc: remove info related to bluez4
  upstream_tracking.inc: bluez4 removed from oe-core
  bluetooth.bbclass: set bluez5 as the default BT stack

 meta-yocto/conf/distro/include/maintainers.inc     |  3 --
 .../conf/distro/include/upstream_tracking.inc      |  1 -
 meta/classes/bluetooth.bbclass                     | 16 +++++---
 .../obsolete_automake_macros.patch                 | 14 -------
 .../bluez/bluez-hcidump_2.5.bb                     | 22 -----------
 .../bluez/bluez4-4.101/bluetooth.conf              | 16 --------
 .../bluez/bluez4-4.101/fix-udev-paths.patch        | 37 -----------------
 .../bluez/bluez4-4.101/install-test-script.patch   | 26 ------------
 ...ork-fix-network-Connect-method-parameters.patch | 30 --------------
 .../bluez4-4.101/obsolete_automake_macros.patch    | 14 -------
 .../bluez/bluez4-4.101/sbc_mmx.patch               | 24 -----------
 ...pygobject-instead-ofgobject-introspection.patch | 27 -------------
 meta/recipes-connectivity/bluez/bluez4.inc         | 46 ----------------------
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    | 46 ----------------------
 .../bluez/gst-plugin-bluetooth_4.101.bb            | 39 ------------------
 .../bluez5/{bluez5_5.28.bb => bluez5_5.29.bb}      |  4 +-
 16 files changed, 13 insertions(+), 352 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
 rename meta/recipes-connectivity/bluez5/{bluez5_5.28.bb => bluez5_5.29.bb} (88%)

-- 
2.1.0


