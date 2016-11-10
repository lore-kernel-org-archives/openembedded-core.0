Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CBE6060720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697322"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:13 +1300
Message-Id: <cover.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/7] A bunch of fixes for devtool update-recipe
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:48 -0000

A bunch of fixes for devtool update-recipe and associated oe-selftest tests.

The following changes since commit 9303d8055c45a0f6af295d70a6f6a8b9d8d8a7c9:

  devtool: add "rename" subcommand (2016-11-07 11:04:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool23-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool23-oe

Paul Eggleton (7):
  devtool: update-recipe: check output before treating it as a string
  oe-selftest: devtool: test update-recipe with only local files
  lib/oe/patch: fix handling of patches with no header
  devtool: update-recipe: fix handling of compressed local patches
  devtool: update-recipe: support replacing remote patches
  lib/oe/recipeutils: ignore archives by default in
    get_recipe_local_files()
  oe-selftest: devtool: test that updating a file with subdir= works

 .../recipes-test/devtool/devtool-test-localonly.bb |   6 ++
 .../devtool/devtool-test-localonly/file1           |   1 +
 .../devtool/devtool-test-localonly/file2           |   1 +
 .../recipes-test/devtool/devtool-test-patch-gz.bb  |  16 ++++
 .../devtool/devtool-test-patch-gz/readme.patch.gz  | Bin 0 -> 449 bytes
 .../recipes-test/devtool/devtool-test-subdir.bb    |   7 ++
 .../devtool-test-subdir/devtool-test-subdir.tar.gz | Bin 0 -> 181 bytes
 .../devtool/devtool-test-subdir/testfile           |   1 +
 meta/classes/patch.bbclass                         |   9 ++-
 meta/lib/oe/patch.py                               |   8 +-
 meta/lib/oe/recipeutils.py                         |  22 +++--
 meta/lib/oeqa/selftest/devtool.py                  |  67 +++++++++++++++
 scripts/lib/devtool/standard.py                    |  90 +++++++++++++++------
 13 files changed, 193 insertions(+), 35 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file1
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file2
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-patch-gz/readme.patch.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir/devtool-test-subdir.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-subdir/testfile

-- 
2.5.5


