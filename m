Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E22256AF13
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:22:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2013 00:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="365137181"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2013 00:22:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:22:32 +0300
Message-Id: <cover.1373005640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 0/5] Allow xuser to shutdown (cover letter only)
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
X-List-Received-Date: Fri, 05 Jul 2013 07:22:49 -0000

Changes in v3:
 * made xuser-account inherit allarch;
 * moved the sed in do_install();

Changes in v2:
 * created a separate recipe for xuser creation, located in
   meta/recipes-support/user-creation/. If there are other users we might need
   to add in the future, we can put the recipes here;
 * removed xuser creation from connman and xserver-noadm-init and added the
   new 'xuser-account' recipe in RDEPENDS;

Laurentiu

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_rootless_x_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4345_shutdown_icon_rootless_x_v3

Laurentiu Palcu (5):
  sysvinit: allow users in shutdown group to perform halt/reboot
  xuser-account: create separate recipe for xuser creation
  connman: remove xuser creation, RDEPEND on xuser-account
  xserver-nodm-init: remove xuser creation, RDEPEND on xuser-account
  shutdown-desktop: give entire path in Exec field

 meta/recipes-connectivity/connman/connman.inc      |   10 ++------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 ++++++---
 .../x11-common/xserver-nodm-init.bb                |   13 ++--------
 .../shutdown-desktop/shutdown-desktop.bb           |    4 ++-
 .../user-creation/xuser-account_0.1.bb             |   27 ++++++++++++++++++++
 5 files changed, 43 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

-- 
1.7.9.5


