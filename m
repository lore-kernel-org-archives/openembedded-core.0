Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 537DC6FA61
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 15:25:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2014 08:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,981,1392192000"; d="scan'208";a="552137671"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 05 Jun 2014 08:25:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 18:28:40 +0300
Message-Id: <cover.1401981928.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/1] neard: fix parallel build
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
X-List-Received-Date: Thu, 05 Jun 2014 15:25:15 -0000

Second version of the patch, better commit message for the fix patch.

The following changes since commit e7114046be6e71fb326477dc882adb814ef6a751:

  busybox: fix meta-yocto's bbappend's FILESEXTRAPATH (2014-06-03 17:53:13 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/Yb6389
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/Yb6389

Richard Purdie (1):
  neard: fix for parallel build

 .../neard/neard/Fix-snep-send-parallel-build.patch | 31 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/Fix-snep-send-parallel-build.patch

-- 
1.9.1


