Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B248719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:44:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 04:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="107793116"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2017 04:44:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 59BE058038E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 04:44:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:32:32 +0300
Message-Id: <cover.1499340568.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] #11709: Implemented --mkfs-extraopts
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
X-List-Received-Date: Thu, 06 Jul 2017 11:44:42 -0000

Hi,

This patchset implements new wks option --mkfs-extraopts, updates
documentation and adds test case for it to the wic oe-selftest test suite.

The following changes since commit 302b7497f94a37ccc65541ac6973251969c0ba77:

  live-vm-common: add MKDOSFS_EXTRAOPTS variable (2017-07-06 11:38:36 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (3):
  wic: implement wks option --mkfs-extraopts
  wic: add description of --mkfs-extraopts
  oe-selftest: wic: add test_mkfs_extraopts test case

 meta/lib/oeqa/selftest/cases/wic.py | 19 ++++++++++++++++++
 scripts/lib/wic/help.py             |  6 ++++++
 scripts/lib/wic/ksparser.py         |  1 +
 scripts/lib/wic/partition.py        | 39 +++++++++++++++++++++++--------------
 4 files changed, 50 insertions(+), 15 deletions(-)

--
Regards,
Ed


