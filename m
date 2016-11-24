Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 147AF6FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:50:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2016 12:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="905192452"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 24 Nov 2016 12:50:27 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:55:44 -0600
Message-Id: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 00/13] Skip selftests depending on distro and its features
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
X-List-Received-Date: Thu, 24 Nov 2016 20:50:26 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Originally, the selftests were defined for the 'poky' distro. However, there
are more supported distros, including nodistro, poky-lsb and poky-tiny.
These series takes into consideration the distro name and its features
to skip certain tests.

[YOCTO #8525]

The following changes since commit 12a0ee049e453b6d0d2ce2f3fa981d1b6e02bd78:

  dev-manual: Added note about RPM not dealing with post-install (2016-11-23 11:10:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-distro-agnostic
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/oe-selftest-distro-agnostic

Leonardo Sandoval (13):
  selftest: base: new object member to store the DISTRO value
  selftest: bbtests: use minimal image so all distros can execute it
  selftest: bbtests: run non-gplv3 test only on relevant distros
  selftest: buildoptions: skip read-only-image test depending on distro
  selftest: buildoptions: skip test in case features are missing
  selftest: devtool: use mraa instead of libmatchbox to lessen distro
    requirements
  selftest: imagefeatures: skip tests in case distro feature is missing
  selftest: imagefeatures: skip bmap test in case of poky-tiny
  selftest: recipetool: use mraa instead of libmatchbox to lessen distro
    requirements
  selftest: runtime-test: skip image-install test for poky-tiny
  selftest: sstatetests: skip methods in case of poky-tiny or opengl is
    missing
  selftest: wic: skip tests for poky-tiny distro policy
  selftest: bblayers: remove linux kernel checks for show-recipes check

 meta/lib/oeqa/selftest/base.py          |  1 +
 meta/lib/oeqa/selftest/bblayers.py      |  6 +---
 meta/lib/oeqa/selftest/bbtests.py       |  8 +++--
 meta/lib/oeqa/selftest/buildoptions.py  |  3 ++
 meta/lib/oeqa/selftest/devtool.py       | 17 ++++++----
 meta/lib/oeqa/selftest/imagefeatures.py |  9 +++++-
 meta/lib/oeqa/selftest/recipetool.py    | 27 ++++++++++------
 meta/lib/oeqa/selftest/runtime-test.py  |  2 ++
 meta/lib/oeqa/selftest/sstate.py        | 10 +++---
 meta/lib/oeqa/selftest/sstatetests.py   | 57 ++++++++++++++++++++++++++++-----
 meta/lib/oeqa/selftest/wic.py           |  9 ++++++
 11 files changed, 112 insertions(+), 37 deletions(-)

-- 
2.1.4


