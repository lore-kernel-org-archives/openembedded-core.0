Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7576EE50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:55:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Feb 2014 03:55:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="482780838"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 13 Feb 2014 03:55:28 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 13:55:25 +0200
Message-Id: <cover.1392292446.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/1] lib/oe/rootfs.py: fix RPM multilib issue
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
X-List-Received-Date: Thu, 13 Feb 2014 11:55:46 -0000

v2:
 * address RP's comments;

laurentiu

The following changes since commit b70a10ca3ee4a0add90d387e2c8288e531aaa47c:

  systemd-serialgetty: Update to match version in recent systemd (2014-02-11 22:59:38 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/rootfs_refactoring_rpm_multilib_fix

for you to fetch changes up to 453395e793d0d5c30d4e8092ee6faf80484ad447:

  lib/oe/rootfs.py: fix RPM multilib issue (2014-02-13 13:52:38 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      lib/oe/rootfs.py: fix RPM multilib issue

 meta/lib/oe/rootfs.py |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

Laurentiu Palcu (1):
  lib/oe/rootfs.py: fix RPM multilib issue

 meta/lib/oe/rootfs.py |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
1.7.9.5


