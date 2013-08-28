Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 586786BA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 21:19:17 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Aug 2013 14:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,978,1367996400"; d="scan'208";a="352955033"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.210])
	by azsmga001.ch.intel.com with ESMTP; 28 Aug 2013 14:19:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 14:19:16 -0700
Message-Id: <cover.1377724432.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 0/4] Kernel fix & QA tests support for RC1
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
X-List-Received-Date: Wed, 28 Aug 2013 21:19:18 -0000

Richard,

Here is set of patches to address the sanity test failure we saw on 
the build overnight, they work! Found a real issue.

I am also including the qa patches that should address some other issues.

Thanks
	Sau!

The following changes since commit 82c6ab123fafa2acc3d437328a7ca856dfd078d6:

  midori: use BPN instead of PN (2013-08-28 09:30:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto/3.10: fix ssh login and restore CC_OPTIMIZE_FOR_SIZE

Stefan Stanacar (3):
  lib/oeqa/runtime: remove some unnecessary checks from setUpModule
  classes/testimage: increase default boot timeout
  classes/testimage: add support for finding tests in other layers

 meta/classes/testimage.bbclass                     | 57 +++++++++++++++++-----
 meta/lib/oeqa/runtime/__init__.py                  |  3 ++
 meta/lib/oeqa/runtime/date.py                      |  3 --
 meta/lib/oeqa/runtime/df.py                        |  2 -
 meta/lib/oeqa/runtime/dmesg.py                     |  2 -
 meta/lib/oeqa/runtime/vnc.py                       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 +++---
 9 files changed, 61 insertions(+), 34 deletions(-)

-- 
1.8.3.1


