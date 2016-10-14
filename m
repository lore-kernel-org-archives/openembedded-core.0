Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD2C71A7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705462"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:30 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:25 -0500
Message-Id: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] Support supported distros on selftest
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Originally, the test defined inside oeqa/selftest were defined for the 'poky'
distro. However, there are more supported distros, including nodistro, poky-lsb
and poky-tiny. These series takes into consideration the distribution, deciding
either run or skip certain tests.

[YOCTO #8525]

The following changes since commit 4a7eb4b92f32c17abd1111246b1acb9ad3daa355:

  build-appliance-image: Update to master head revision (2016-10-11 08:51:36 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-non-poky-distros
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/oe-selftest-non-poky-distros

Leonardo Sandoval (9):
  selftest: set correct linux-yocto recipe when distro is poky-tiny
  selftest: skip two bbtest tests depending on distro
  selftest: skip test_read_only_image on poky-tiny distro
  selftest: skip some devtool tests when distro is poky-tiny due to
    missing libx11
  selftest: skip those imagefeatures tests not relevant for certain
    distros
  selftest: skip test_recipetool_create_git on poky-tiny distro
  selftest: skip runtime-test's test_testimage_install on poky-tiny
    distro
  selftest: skip sstatetests methods considering distro and its features
  selftest: skip wic test methods for poky-tiny distro

 meta/lib/oeqa/selftest/base.py          |  1 +
 meta/lib/oeqa/selftest/bblayers.py      |  6 ++--
 meta/lib/oeqa/selftest/bbtests.py       |  7 ++++
 meta/lib/oeqa/selftest/buildoptions.py  |  2 ++
 meta/lib/oeqa/selftest/devtool.py       |  7 +++-
 meta/lib/oeqa/selftest/imagefeatures.py | 18 +++++++++--
 meta/lib/oeqa/selftest/recipetool.py    |  2 ++
 meta/lib/oeqa/selftest/runtime-test.py  |  2 ++
 meta/lib/oeqa/selftest/sstate.py        | 10 +++---
 meta/lib/oeqa/selftest/sstatetests.py   | 57 ++++++++++++++++++++++++++++-----
 meta/lib/oeqa/selftest/wic.py           |  9 ++++++
 11 files changed, 102 insertions(+), 19 deletions(-)

-- 
2.1.4


