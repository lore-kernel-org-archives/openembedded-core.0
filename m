Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1AB60810
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:59:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2013 06:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,905,1363158000"; d="scan'208";a="356779707"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2013 06:59:14 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 16:59:09 +0300
Message-Id: <cover.1371736529.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] qemu: fix segfault in Xorg when not using kvm
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
X-List-Received-Date: Thu, 20 Jun 2013 13:59:36 -0000

The following changes since commit 7d02de844c00d55189673a6eed9197bcbc5b2720:

  bitbake: bitbake: remove the function for reparse because it does nothing (2013-06-20 13:29:53 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/qemu-x86-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/qemu-x86-fix

Laurentiu Palcu (1):
  qemu: fix segfault in Xorg when not using kvm

 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch |   79 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.5.0.bb           |    3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch

-- 
1.7.9.5


