Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E2EF16AFE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:57:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2013 03:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="326735999"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2013 03:57:56 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 13:56:40 +0300
Message-Id: <cover.1372933905.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/5] Allow xuser to shutdown
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
X-List-Received-Date: Thu, 04 Jul 2013 10:57:57 -0000

Changes in v2:
 * created a separate recipe for xuser creation, located in
   meta/recipes-support/user-creation/. If there are other users we might need
   to add in the future, we can put the recipes here;
 * removed xuser creation from connman and xserver-noadm-init and added the
   new 'xuser-account' recipe in RDEPENDS;

Laurentiu

CC: sgw@linux.intel.com
CC: martin.jansa@gmail.com

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_rootless_x_v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4345_shutdown_icon_rootless_x_v2

Laurentiu Palcu (5):
  sysvinit: allow users in shutdown group to perform halt/reboot
  xuser-account: create separate recipe for xuser creation
  connman: remove xuser creation, RDEPEND on xuser-account
  xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
  shutdown-desktop: give entire path in Exec field

 meta/recipes-connectivity/connman/connman.inc      |   10 ++------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 ++++++---
 .../x11-common/xserver-nodm-init.bb                |   13 ++--------
 .../shutdown-desktop/shutdown-desktop.bb           |    2 ++
 .../user-creation/xuser-account_0.1.bb             |   27 ++++++++++++++++++++
 5 files changed, 42 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

-- 
1.7.9.5


