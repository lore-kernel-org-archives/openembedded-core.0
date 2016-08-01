Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 58EDF6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:24:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2016 09:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,456,1464678000"; d="scan'208";a="1033036843"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2016 09:23:28 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 08:16:32 +0000
Message-Id: <cover.1470039240.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/1] Add selftest to test testexport's SDK feature
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
X-List-Received-Date: Mon, 01 Aug 2016 16:24:13 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds a new selftest for testexport in the CI to avoid
breaking SDK functionality.

All dependencies are in master now:

Changes in v2:

- Refactor test to avoid environment modification/restoration.
- Tested in local autobuilders.

The following changes since commit 5203cfe6a9b6d12153426bf7b8d9834c9c4efba2:

  ref-manual: Removed redundant "and" (2016-08-01 12:15:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9765v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9765v2

Mariano Lopez (1):
  selftest/runtime-test.py: Add test for testexport SDK feature

 meta-selftest/lib/oeqa/runtime/selftest.py | 24 +++++++++++++++++
 meta/lib/oeqa/selftest/runtime-test.py     | 41 ++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

-- 
2.6.6


