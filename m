Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A51356EE54
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:39:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 04:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494441757"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 04:39:44 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 14:39:39 +0200
Message-Id: <cover.1394023121.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Fix issue with unpopulated buildhistory depends files
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
X-List-Received-Date: Wed, 05 Mar 2014 12:39:48 -0000

The following changes since commit f03955041d0e44d377ca1c4def630982f24f1e8b:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:55:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5904_buildhistory_depends_empty
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5904_buildhistory_depends_empty

Laurentiu Palcu (3):
  package_manager.py: make list_installed() list pkg dependencies too
  buildhistory.bbclass: Fix dependency files creation
  populate_sdk_*.bbclass: remove old rootfs_list_installed_depends()

 meta/classes/buildhistory.bbclass     |    9 ++++++++-
 meta/classes/populate_sdk_deb.bbclass |    5 -----
 meta/classes/populate_sdk_ipk.bbclass |    4 ----
 meta/classes/populate_sdk_rpm.bbclass |    4 ----
 meta/lib/oe/package_manager.py        |   31 +++++++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 14 deletions(-)

-- 
1.7.9.5


