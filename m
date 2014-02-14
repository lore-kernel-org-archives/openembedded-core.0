Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 167D86EFB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:01:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2014 03:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,844,1384329600"; d="scan'208";a="455436496"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2014 03:01:09 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 13:01:04 +0200
Message-Id: <cover.1392375539.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] fix package-index build issue
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
X-List-Received-Date: Fri, 14 Feb 2014 11:01:38 -0000

After rootfs code refactoring, 'bitbake package-index' fails because it's
calling the old bash indexing routines. This patchset should fix that.

laurentiu

The following changes since commit b60ed2d0fd86a3ae5ce7facbb044677aa7ec2889:

  bitbake: runqueue: Ensure we do run 'masked' setscene tasks if specified as targets (2014-02-13 17:57:20 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/package_index_recipe_fix

for you to fetch changes up to db1e6488ef483ab76f7eca961b214bd8f8758b2e:

  package_*.bbclass: remove references to the old bash indexing routines (2014-02-14 12:47:53 +0200)

----------------------------------------------------------------
Laurentiu Palcu (3):
      package_manager.py, rootfs.py, sdk.py: add Indexer class
      package-index.bb: use the new python indexing routines
      package_*.bbclass: remove references to the old bash indexing routines

 meta/classes/package_deb.bbclass        |    1 -
 meta/classes/package_ipk.bbclass        |    1 -
 meta/classes/package_rpm.bbclass        |    1 -
 meta/lib/oe/package_manager.py          |  339 ++++++++++++++++++++-----------
 meta/lib/oe/rootfs.py                   |   58 ------
 meta/lib/oe/sdk.py                      |   48 +----
 meta/recipes-core/meta/package-index.bb |    7 +-
 7 files changed, 224 insertions(+), 231 deletions(-)

Laurentiu Palcu (3):
  package_manager.py, rootfs.py, sdk.py: add Indexer class
  package-index.bb: use the new python indexing routines
  package_*.bbclass: remove references to the old bash indexing
    routines

 meta/classes/package_deb.bbclass        |    1 -
 meta/classes/package_ipk.bbclass        |    1 -
 meta/classes/package_rpm.bbclass        |    1 -
 meta/lib/oe/package_manager.py          |  339 ++++++++++++++++++++-----------
 meta/lib/oe/rootfs.py                   |   58 ------
 meta/lib/oe/sdk.py                      |   48 +----
 meta/recipes-core/meta/package-index.bb |    7 +-
 7 files changed, 224 insertions(+), 231 deletions(-)

-- 
1.7.9.5


