Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F745607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 10:04:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 02:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,372,1508828400"; d="scan'208";a="11345918"
Received: from bkhoo8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.78.167])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2017 02:04:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 23:03:39 +1300
Message-Id: <cover.1512640717.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH v2 0/1] oe-selftest: devtool: fix test for changes in lzo recipe
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
X-List-Received-Date: Thu, 07 Dec 2017 10:04:18 -0000

A fix for one of the devtool oe-selftest tests to handle Ross's lzo
acinclude.m4 fix.

Changes since v1:
* Some uncommitted changes to the test recipe got wiped out by the bit at
  the end of the test that resets the test changes, hence the checksums
  were missing from the recipe - add the missing stuff back n.
* Add a check to ensure there's no uncommitted changes before proceeding
  with the test (as per other tests that have this resetting)

The following changes since commit a7cd9d1183be603777fc9c8c448281fe01224f7b:

  lib/oe/utils: remove param_bool() (2017-12-02 11:24:38 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-selftest-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-selftest-fix

Paul Eggleton (1):
  oe-selftest: devtool: fix test for changes in lzo recipe

 .../recipes-test/devtool/devtool-test-local/file1        |  1 +
 .../recipes-test/devtool/devtool-test-local/file2        |  1 +
 .../recipes-test/devtool/devtool-test-local_6.03.bb      | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py                  | 16 ++++++++++------
 4 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file1
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file2
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb

-- 
2.9.5


