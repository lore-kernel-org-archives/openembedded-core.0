Return-Path: <ionutx.radu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0928C6B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 11:38:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 04:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="376984538"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2013 04:38:53 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 14:41:24 +0300
Message-Id: <cover.1374837613.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3 0/1] Package upgrades
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
X-List-Received-Date: Fri, 26 Jul 2013 11:38:54 -0000

Changes in v3:
* target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch was backported
* qemu was tested on core-image-sato all architectures. The tests were basic (output version qemu version information)

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (1):
  qemu: Updated from 1.5.0 to 1.5.1

 ...-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch |   79 --------------------
 .../qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb}          |    7 +-
 2 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch
 rename meta/recipes-devtools/qemu/{qemu_1.5.0.bb => qemu_1.5.1.bb} (49%)

-- 
1.7.10.4


