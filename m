Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D34E65C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190744"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:03 +0100
Message-Id: <cover.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] devtool / recipetool bbappend support
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
X-List-Received-Date: Mon, 18 May 2015 15:15:15 -0000

Add support for creating/updating bbappends in both devtool (within the
update-recipe subcommand) and in recipetool (with a new appendfile
subcommand), as well as some related tidy-ups.


The following changes since commit aa2e02a4f78d87bd466bbf92ca57147066c5367f:

  README: add "Contributing" section (2015-05-16 22:37:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-bbappends
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-bbappends

Paul Eggleton (5):
  devtool / recipetool: ensure bb.note() gets printed
  lib/oe/patch: use with open() for all file operations
  oe-selftest: move recipetool tests to their own module
  recipetool: add appendfile subcommand
  devtool: update-recipe: add option to write changes to bbappend

 .../recipes-test/recipetool/files/add-file.patch   |   8 +
 meta-selftest/recipes-test/recipetool/files/file1  |   2 +
 .../recipes-test/recipetool/files/installscript.sh |   3 +
 .../recipetool/files/selftest-replaceme-inst-func  |   1 +
 .../files/selftest-replaceme-inst-globfile         |   1 +
 .../files/selftest-replaceme-inst-todir-globfile   |   1 +
 .../recipetool/files/selftest-replaceme-orig       |   1 +
 .../files/selftest-replaceme-src-globfile          |   1 +
 .../recipetool/files/selftest-replaceme-todir      |   1 +
 .../recipetool/files/subdir/fileinsubdir           |   1 +
 .../recipetool/selftest-recipetool-appendfile.bb   |  42 +++
 meta/lib/oe/patch.py                               | 103 ++++--
 meta/lib/oe/recipeutils.py                         | 328 ++++++++++++++++++-
 meta/lib/oeqa/selftest/devtool.py                  | 283 ++++++++++++----
 meta/lib/oeqa/selftest/recipetool.py               | 364 +++++++++++++++++++++
 meta/lib/oeqa/utils/commands.py                    |  11 +
 scripts/lib/devtool/__init__.py                    |   2 +-
 scripts/lib/devtool/standard.py                    | 155 ++++++---
 scripts/lib/recipetool/append.py                   | 360 ++++++++++++++++++++
 scripts/recipetool                                 |   8 +-
 20 files changed, 1548 insertions(+), 128 deletions(-)
 create mode 100644 meta-selftest/recipes-test/recipetool/files/add-file.patch
 create mode 100644 meta-selftest/recipes-test/recipetool/files/file1
 create mode 100644 meta-selftest/recipes-test/recipetool/files/installscript.sh
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-func
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-inst-todir-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-orig
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-src-globfile
 create mode 100644 meta-selftest/recipes-test/recipetool/files/selftest-replaceme-todir
 create mode 100644 meta-selftest/recipes-test/recipetool/files/subdir/fileinsubdir
 create mode 100644 meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb
 create mode 100644 meta/lib/oeqa/selftest/recipetool.py
 create mode 100644 scripts/lib/recipetool/append.py

-- 
2.1.0


