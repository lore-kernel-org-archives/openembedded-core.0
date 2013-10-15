Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 57F586CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:47:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 15 Oct 2013 14:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,502,1378882800"; d="scan'208";a="411536406"
Received: from unknown (HELO localhost) ([10.255.15.226])
	by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2013 14:46:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Tue, 15 Oct 2013 14:46:22 -0700
Message-Id: <cover.1381869082.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] wic: FAT16 and python module fixes
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
X-List-Received-Date: Tue, 15 Oct 2013 21:47:03 -0000

The following changes since commit 2b5bac02196b8bd30d223d508f5f7d4300889fd7:

  poky: Update Version post release (2013-10-14 16:59:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib wic
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=wic

Darren Hart (2):
  wic: Force lba off for FAT16 partitions
  wic: Check for external modules

 scripts/lib/mic/utils/partitionedfs.py |   10 ++++++++++
 scripts/wic                            |   12 ++++++++++++
 2 files changed, 22 insertions(+)

-- 
1.7.9.5


