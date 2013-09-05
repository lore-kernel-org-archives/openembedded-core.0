Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 61F50615B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:14:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Sep 2013 17:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="373657097"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2013 17:14:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Wed,  4 Sep 2013 17:18:37 -0700
Message-Id: <cover.1378339881.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: yunguo.wei@windriver.com, Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/4] Updates in support of genericx86*
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
X-List-Received-Date: Thu, 05 Sep 2013 00:14:28 -0000

As this series bridges both oe-core and poky and is best viewed as one series, I
opted to send the series to both lists.

These patches address bugs/feature requests for additional support of
linux-firmware and xorg-video-* drivers for the new meta-yocto-bsp genericx86
and genericx86-64 machines.

Some of the oe-core changes could be contained in the meta-yocto-bsp layer, but
as these changes come from meta-intel, they are needed by multiple layers, and I
felt it might make more sense in oe-core. If people object to the mga or intel
xserver video drivers, I can respin those for meta-yocto-bsp.

The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/genericx86
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/genericx86

Darren Hart (4):
  linux-firmware: Update SRCREV, pull in iwlwifi-7260 support
  xorg-driver-common: Add configure and install appends from meta-intel
  xf86-video-mga: Pull in Matrox MGA support from meta-intel
  genericx86: Create a x86-common.inc base for the x86 BSPs

 meta-yocto-bsp/conf/machine/genericx86-64.conf     |   29 +-----------------
 meta-yocto-bsp/conf/machine/genericx86.conf        |   31 +-------------------
 meta-yocto-bsp/conf/machine/include/x86-common.inc |   26 ++++++++++++++++
 meta/conf/machine/include/ia32-base.inc            |    2 ++
 .../xorg-driver/xf86-video-mga_1.6.2.bb            |   20 +++++++++++++
 .../xorg-driver/xorg-driver-common.inc             |   17 ++++++++++-
 .../linux-firmware/linux-firmware_git.bb           |   10 ++++---
 7 files changed, 72 insertions(+), 63 deletions(-)
 create mode 100644 meta-yocto-bsp/conf/machine/include/x86-common.inc
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-mga_1.6.2.bb

-- 
1.7.9.5


