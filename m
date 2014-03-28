Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED9D860E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:12:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 03:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,750,1389772800"; d="scan'208";a="482031601"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2014 03:12:09 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 12:10:42 +0200
Message-Id: <cover.1396000670.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Don't fool around with rpm __db.00* files
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
X-List-Received-Date: Fri, 28 Mar 2014 10:12:11 -0000

We were deleting/creating those files too many times during the rootfs creation
process. That led to various rpmdb related issues. Instead, remove those files
at the end of the rootfs creation process which seems the most sane thing to do.

laurentiu

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b6049_do_rootfs_crash
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b6049_do_rootfs_crash

Laurentiu Palcu (2):
  package_manager.py: leave the __db.00* files in place
  rootfs.py: add new cleanup method

 meta/lib/oe/package_manager.py |    8 +-------
 meta/lib/oe/rootfs.py          |   25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

-- 
1.7.9.5


