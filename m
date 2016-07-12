Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DBD396E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:07:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jul 2016 07:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,352,1464678000"; d="scan'208";a="137812562"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 07:07:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5A1AD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:07:39 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 17:07:35 +0300
Message-Id: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/8] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Tue, 12 Jul 2016 14:07:48 -0000

Remove xtscal in preference of xinput-calibrator

[YOCTO #9365]

Maxin B. John (8):
  xtscal: remove recipe
  x11-common: replace xtscal with xinput-calibrator
  pointercal-xinput: add a dummy calibration file for qemu
  pointercal: remove recipe
  tslib: replace pointercal with pointercal-xinput
  packagegroup-core-x11-base.bb: replace pointercal with
    pointercal-xinput
  layer.conf: remove pointercal
  distro_alias.inc: remove pointercal and xtscal references

 meta/conf/distro/include/distro_alias.inc          |   3 -
 meta/conf/layer.conf                               |   1 -
 meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 -
 meta/recipes-bsp/pointercal/pointercal/pointercal  |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 -
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 -
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 -
 .../pointercal/pointercal/qemumips/pointercal      |   1 -
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 36 -> 0 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 -
 .../pointercal/pointercal/qemux86/pointercal       |   1 -
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 -
 .../packagegroups/packagegroup-core-x11-base.bb    |   2 +-
 meta/recipes-graphics/tslib/tslib_1.1.bb           |   2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |   2 +-
 .../pointercal-xinput/qemuall/pointercal.xinput    |   2 +
 .../xtscal/xtscal/30xTs_Calibrate.sh               |  13 -
 .../xtscal/xtscal/change-cross.patch               |  18 -
 meta/recipes-graphics/xtscal/xtscal/cleanup.patch  | 621 ---------------------
 .../xtscal/dso_linking_change_build_fix.patch      |  27 -
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |  33 --
 21 files changed, 5 insertions(+), 749 deletions(-)
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/change-cross.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/cleanup.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb

-- 
2.4.0


