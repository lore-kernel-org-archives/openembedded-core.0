Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D6A6D76809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305486"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:08:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:20 +1300
Message-Id: <cover.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/14] devtool upgrade fixes
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:15 -0000

I had occasion to look at devtool upgrade recently and found quite a
number of issues. Fix those, improve the tests and fix a couple of minor
things in devtool add and devtool modify as well.


The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool15-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool15-oe

Paul Eggleton (14):
  devtool: add: tweak auto-determining name failure message
  devtool: modify: fix source tree default name when mapping virtuals
  devtool: upgrade: make source tree path optional
  devtool: upgrade: drop superfluous call to validate_pn
  devtool: upgrade: fix version argument checking
  devtool: upgrade: fix moving version-specific files directory
  devtool: upgrade: fix renaming of recipe if PV is not in name
  devtool: upgrade: fix constructing new branch from tarball releases
  devtool: upgrade: fix several issues with extraction of new source
  devtool: upgrade: eliminate unnecessary datastore copy
  devtool: upgrade: drop PR on upgrade
  devtool: upgrade: print new recipe name
  oe-selftest: devtool: rework devtool upgrade test
  oe-selftest: devtool: add an additional test for devtool upgrade

 ...01-Add-a-note-line-to-the-quick-reference.patch |  25 ++++++
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |  16 ++++
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |  14 ++++
 .../devtool/devtool-upgrade-test2_git.bb           |  18 ++++
 .../devtool/devtool-upgrade-test2_git.bb.upgraded  |  17 ++++
 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 ------
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 ------
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 411 -> 0 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 411 -> 0 bytes
 meta/lib/oeqa/selftest/devtool.py                  |  59 +++++++++++--
 scripts/lib/devtool/standard.py                    |  37 +++++----
 scripts/lib/devtool/upgrade.py                     |  91 +++++++++++++--------
 12 files changed, 216 insertions(+), 113 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
 delete mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 delete mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 delete mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 delete mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz

-- 
2.5.0


