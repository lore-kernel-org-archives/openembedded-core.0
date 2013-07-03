Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D45661485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:34:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 07:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364215796"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 07:34:26 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 17:34:20 +0300
Message-Id: <cover.1372861799.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Wed, 03 Jul 2013 14:34:26 -0000

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_rootless_x
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4345_shutdown_icon_rootless_x

Laurentiu Palcu (4):
  sysvinit: allow users in shutdown group to perform halt/reboot
  connman: make xuser a member of 'shutdown' group
  xserver-nodm-init: make xuser a member of 'shutdown' group
  shutdown-desktop: give entire path in Exec field

 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +++++++++---
 .../x11-common/xserver-nodm-init.bb                |    2 +-
 .../shutdown-desktop/shutdown-desktop.bb           |    2 +-
 .../shutdown-desktop/shutdown.desktop              |    4 ++--
 5 files changed, 14 insertions(+), 8 deletions(-)

-- 
1.7.9.5


