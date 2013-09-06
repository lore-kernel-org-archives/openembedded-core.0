Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 343716B24E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 20:26:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2013 13:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,856,1371106800"; d="scan'208";a="374592390"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2013 13:26:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Fri,  6 Sep 2013 13:30:20 -0700
Message-Id: <cover.1378498892.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: yunguo.wei@windriver.com, Darren Hart <dvhart@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/2] UPdates in support of genericx86*
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
X-List-Received-Date: Fri, 06 Sep 2013 20:26:20 -0000

As this series bridges both oe-core and poky and is best viewed as one series, I
opted to send the series to both lists.

These patches address bugs/feature requests for additional support of
linux-firmware and xorg-video-* drivers for the new meta-yocto-bsp genericx86
and genericx86-64 machines.

Changes since v1
* Remove the addition of the mga video driver (postponed)
* Rename x86-common.inc to genericx86-common.inc
* Remove duplication from ia32-base.inc and genericx86-common.inc
* Remove PR=0


The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/genericx86v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/genericx86v2

Darren Hart (2):
  linux-firmware: Update SRCREV, pull in iwlwifi-7260 support
  genericx86: Create a genericx86-common.inc base for the x86 BSPs

 meta-yocto-bsp/conf/machine/genericx86-64.conf     |   29 +-----------------
 meta-yocto-bsp/conf/machine/genericx86.conf        |   31 +-------------------
 .../conf/machine/include/genericx86-common.inc     |   20 +++++++++++++
 .../linux-firmware/linux-firmware_git.bb           |    9 +++---
 4 files changed, 27 insertions(+), 62 deletions(-)
 create mode 100644 meta-yocto-bsp/conf/machine/include/genericx86-common.inc

-- 
1.7.9.5


