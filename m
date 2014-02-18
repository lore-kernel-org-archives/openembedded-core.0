Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF2D76D8FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:49:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2014 05:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,501,1389772800"; d="scan'208";a="485189752"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 05:49:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 15:49:42 +0200
Message-Id: <cover.1392731055.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Add image creation dependency mechanism
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
X-List-Received-Date: Tue, 18 Feb 2014 13:49:47 -0000

The image creation is done now in parallel. However, we didn't have any
dependency handling in place since the old code did that serial. This patchset
adds such dependency mechanism and all images types are split in groups,
according to dependency, which can be done in parallel.

The users, however, have to declare the image dependency using the IMAGE_TYPEDEP variable:

Example:
IMAGE_TYPEDEP_rpi-sdimg = "ext3"

laurentiu

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/image_deps_fix

for you to fetch changes up to e7feddd1dafc5eb02b80b8d43aca504b17151e5c:

  lib/oe/image.py: add image dependency mechanism (2014-02-18 15:16:21 +0200)

----------------------------------------------------------------
Laurentiu Palcu (2):
      image*.bbclass, bootimg.bbclass: add image type dependencies
      lib/oe/image.py: add image dependency mechanism

 meta/classes/bootimg.bbclass     |    4 +
 meta/classes/image-live.bbclass  |    3 +
 meta/classes/image-vmdk.bbclass  |    3 +
 meta/classes/image_types.bbclass |    5 +
 meta/lib/oe/image.py             |  282 ++++++++++++++++++++++++++------------
 5 files changed, 206 insertions(+), 91 deletions(-)

Laurentiu Palcu (2):
  image*.bbclass, bootimg.bbclass: add image type dependencies
  lib/oe/image.py: add image dependency mechanism

 meta/classes/bootimg.bbclass     |    4 +
 meta/classes/image-live.bbclass  |    3 +
 meta/classes/image-vmdk.bbclass  |    3 +
 meta/classes/image_types.bbclass |    5 +
 meta/lib/oe/image.py             |  282 ++++++++++++++++++++++++++------------
 5 files changed, 206 insertions(+), 91 deletions(-)

-- 
1.7.9.5


