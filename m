Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1380E60138
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 13:52:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2015 06:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,384,1427785200"; d="scan'208";a="725330184"
Received: from jlbuthle-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.56])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2015 06:52:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 14:52:22 +0100
Message-Id: <cover.1431006684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] oe-selftest fixes for devtool
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
X-List-Received-Date: Thu, 07 May 2015 13:52:42 -0000

Fix a couple of regressions in the oe-selftest tests for devtool (one 
caused by me, the other caused by the recent PN change in gcc-source),
plus one more improvement to how we deal with tap devices in the test
for "devtool deploy-target".


The following changes since commit 52d5ab7fcea7028ff1d10b3e2416c0179128ba71:

  bluez: update to 5.30 (2015-05-07 13:14:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-selftests
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-selftests

Paul Eggleton (3):
  oe-selftest: devtool: fix broken URL in test_devtool_add_fetch
  devtool: fix for rename of gcc-source
  oe-selftest: devtool: add a proper test to see if tap devices exist

 meta/lib/oeqa/selftest/devtool.py | 22 ++++++++++++++++++++--
 scripts/lib/devtool/standard.py   |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.1.0


