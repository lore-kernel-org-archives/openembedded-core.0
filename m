Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EEDE96147D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 14:58:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Sep 2013 07:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,866,1371106800"; d="scan'208";a="398803870"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.38])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2013 07:58:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Mon,  9 Sep 2013 07:58:29 -0700
Message-Id: <cover.1378738373.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Remove apm as a default MACHINE_FEATURE
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
X-List-Received-Date: Mon, 09 Sep 2013 14:58:38 -0000

Applogies for the cross post, but this one covers both oe-core and poky

Remove APM from MACHINE_FEATURE, there is no reason for it to be enabled 
by default since we do not include the appropriate Kernel CONFIG fragment.

For QEMU it makes no sense in the first place and for any new arm platform
apci is available.

Sau!

The following changes since commit 2ab1bf27f79beadc45e86a26c85fc0b95ae3496f:

  bitbake: prserv: Ensure data is committed (2013-09-08 10:51:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgw/apm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/apm

Saul Wold (3):
  qemu.inc: remove apm as a MACHINE_FEATURE
  beagelboard.inc: remove apm as a MACHINE_FEATURE
  yocto-bsp: remove apm as a default MACHINE_FEATURE

 meta-yocto-bsp/conf/machine/beagleboard.conf                            | 2 +-
 meta/conf/machine/include/qemu.inc                                      | 2 +-
 .../lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


