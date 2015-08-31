Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D0D18762B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 16:16:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2015 09:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,442,1437462000"; d="scan'208";a="552303475"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2015 09:16:35 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 08:09:58 +0000
Message-Id: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v3 0/3] devtool: upgrade feature
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
X-List-Received-Date: Mon, 31 Aug 2015 16:16:37 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The following changes were made since V2:

- Some code packed into functions
- Change '_' to '-' on branch and tag names (per Paul suggestion
- New recipe under meta-selftest so unit tests (oe-selftest) do not
  depend on real recipes (also, Anibal/Paul suggestion)

The following changes since commit 393bd7496d71eb101f21234c1233a2d18fd2c73e:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:28:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-upgrade

Leonardo Sandoval (3):
  devtool: upgrade feature
  devtool-upgrade: sample recipe to test the devtool feature
  oeqa/selftest: new tests for devtool upgrage feature

 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 ++
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 ++
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 0 -> 411 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 0 -> 411 bytes
 meta/lib/oeqa/selftest/devtool.py                  |  36 +++
 scripts/lib/devtool/standard.py                    |   4 +-
 scripts/lib/devtool/upgrade.py                     | 356 +++++++++++++++++++++
 7 files changed, 447 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 create mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
 create mode 100644 scripts/lib/devtool/upgrade.py

-- 
1.8.4.5


