Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 56BC36CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:14:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2013 22:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,505,1378882800"; d="scan'208";a="308360096"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Oct 2013 22:14:30 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 00:14:27 -0500
Message-Id: <cover.1381898855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/3] a few wic fixes
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
X-List-Received-Date: Wed, 16 Oct 2013 05:14:30 -0000

For problems noticed while testing.

The following changes since commit 2b5bac02196b8bd30d223d508f5f7d4300889fd7:

  poky: Update Version post release (2013-10-14 16:59:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-0

Tom Zanussi (3):
  wic: check for build artifacts
  wic: check passed-in build artifact directories
  wic: add fakeroot to the populate-extfs step

 .../lib/mic/kickstart/custom_commands/partition.py   |  2 +-
 scripts/wic                                          | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
1.7.11.4


