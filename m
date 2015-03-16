Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34DAA6AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778111"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:46 +0000
Message-Id: <cover.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 00/16] devtool/recipetool fixes
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:11 -0000

Some fixes and minor improvements for devtool/recipetool and extensions
to the oe-selftest tests for both.


The following changes since commit fb29441216435b9bae47ca9cd42db5a6b1fe77d8:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:49:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool3

Paul Eggleton (16):
  devtool: deploy-target: fix deploying to previously deployed machine
  devtool: name command line parsers appropriately
  devtool: reset: add ability to reset entire workspace
  devtool: modify: get correct initial revision from previously extracted source tree
  devtool: modify/extract: prevent usage with incompatible recipes
  devtool: deploy-target: allow disabling host key checking
  devtool: deploy-target: detect and error if D is empty
  devtool: deploy-target: add an option to disable quiet mode
  classes/externalsrc: fix for recipes that fetch local files
  devtool: deploy-target: add dry-run option
  gitignore: exclude meta-selftest, drop meta-hob
  oe-selftest: support getting unexported variable values
  oe-selftest: add a test for devtool deploy-target
  oe-selftest: add a test for devtool modify on recipes fetching local files
  recipetool: fix duplicate licenses being picked up
  oe-selftest: add missing dependency to test_recipetool_create_git

 .gitignore                                         |   2 +-
 .../recipes-test/images/oe-selftest-image.bb       |   9 ++
 meta/classes/externalsrc.bbclass                   |  14 +-
 meta/lib/oeqa/selftest/devtool.py                  | 145 ++++++++++++++++++-
 meta/lib/oeqa/utils/commands.py                    |   7 +
 scripts/lib/devtool/deploy.py                      |  56 ++++++--
 scripts/lib/devtool/standard.py                    | 159 +++++++++++++--------
 scripts/lib/recipetool/create.py                   |   4 +-
 8 files changed, 327 insertions(+), 69 deletions(-)
 create mode 100644 meta-selftest/recipes-test/images/oe-selftest-image.bb

-- 
1.9.3


