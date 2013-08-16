Return-Path: <cristiana.voicu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E314C6B5A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 08:26:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2013 01:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,893,1367996400"; d="scan'208";a="347173121"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2013 01:26:02 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 11:29:07 +0300
Message-Id: <cover.1376641437.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Fri, 16 Aug 2013 08:26:03 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: build-appliance, x86, x86_64, ppc, mips, arm;
 * checked with rpm if the packages were installed and their version; basic functionality for
sudo and crond

Thanks,
Cristiana

The following changes since commit ff10f72abda52315b892c64f711096772d9a4c1c:

  meta-skeleton: Add busybox config fragment example (2013-08-13 23:06:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (2):
  cronie: upgrade to 1.4.11
  sudo: upgrade to 1.8.7

 .../cronie/{cronie_1.4.9.bb => cronie_1.4.11.bb}   |    8 ++--
 meta/recipes-extended/sudo/files/libtool.patch     |   42 --------------------
 meta/recipes-extended/sudo/sudo.inc                |    4 +-
 .../sudo/{sudo_1.8.6p8.bb => sudo_1.8.7.bb}        |    7 +---
 4 files changed, 7 insertions(+), 54 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.9.bb => cronie_1.4.11.bb} (92%)
 delete mode 100644 meta/recipes-extended/sudo/files/libtool.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.6p8.bb => sudo_1.8.7.bb} (79%)

-- 
1.7.9.5


