Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CC6566BD9A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 13:41:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jun 2014 06:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,965,1392192000"; d="scan'208";a="440291643"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 03 Jun 2014 06:41:14 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jun 2014 16:44:49 +0300
Message-Id: <cover.1401803047.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] neard: fix parallel build
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
X-List-Received-Date: Tue, 03 Jun 2014 13:41:33 -0000

The following changes since commit 99006ef296369c0fa7a40b83ef84b01d438fe98a:

  oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot (2014-06-03 10:38:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6389
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6389

Richard Purdie (1):
  neard: fix for parallel build

 meta/recipes-connectivity/neard/neard/parallelmake.patch | 16 ++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb            |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/parallelmake.patch

-- 
1.9.1


