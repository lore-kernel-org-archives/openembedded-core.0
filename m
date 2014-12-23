Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D46077272A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280220"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:41 +0000
Message-Id: <cover.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/7] oe-selftest QA test fixes
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:06 -0000

Some fixes for issues in the QA tests; some of these came up on the
autobuilder, others were stumbled over while I was fixing the other
issues.

The following changes since commit 353e70f3964eb6531ecb3dc69cbd827053d8f463:

  init-ifupdown: Add missing script for qemuarm64 (2014-12-23 10:12:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qafixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qafixes

Paul Eggleton (7):
  oeqa/utils: replace some tabs with spaces
  oeqa/utils: fix testcase decorator to allow calling tests individually
  oeqa/selftest: fix test_event_handler for changes in bitbake output
  oeqa/selftest: skip test_incremental_image_generation if not using rpm
  oeqa/selftest: improve failure messages for devtool tests
  oeqa/selftest: populate pkgdata/shlibs in test_recipetool_create_git
  oeqa/selftest: fix test_force_task so it doesn't taint the entire build

 meta/lib/oeqa/selftest/bbtests.py      |  3 +-
 meta/lib/oeqa/selftest/buildoptions.py |  3 ++
 meta/lib/oeqa/selftest/devtool.py      | 22 +++++----
 meta/lib/oeqa/utils/commands.py        | 10 ++--
 meta/lib/oeqa/utils/decorators.py      | 85 +++++++++++++++++-----------------
 5 files changed, 65 insertions(+), 58 deletions(-)

-- 
1.9.3


