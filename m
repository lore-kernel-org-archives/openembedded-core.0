Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 00A5E719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:38:26 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 09 Jan 2017 09:38:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51227378"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2017 09:38:25 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:44:56 -0600
Message-Id: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V3 0/4] Skip selftests depending on distro and its features
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
X-List-Received-Date: Mon, 09 Jan 2017 17:38:27 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Originally, the selftests were defined for the 'poky' distro. However, there
are more supported distros, including nodistro, poky-lsb and poky-tiny.
These series takes into consideration the distro name and its features
to skip certain tests.

[YOCTO #8525]

The following changes since commit e016eb10b075e280b4e78a04e47b59a173386421:

  bitbake: bb/cooker: BBCooker stops notifier at shutdown (2017-01-06 00:01:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-distro-agnostic
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/oe-selftest-distro-agnostic

Leonardo Sandoval (4):
  selftest: devtool: use distro agnostic recipes for devtool checks
  selftest: imagefeatures: skip tests based on distro features and
    supported fstypes
  selftest: runtime-test: skip image-install test for poky-tiny
  selftest: sstatetests: skip glibc-initial tests and use a more generic
    image

 meta/lib/oeqa/selftest/devtool.py       | 19 +++++++++--------
 meta/lib/oeqa/selftest/imagefeatures.py | 11 ++++++++++
 meta/lib/oeqa/selftest/runtime-test.py  |  2 ++
 meta/lib/oeqa/selftest/sstate.py        |  1 +
 meta/lib/oeqa/selftest/sstatetests.py   | 36 +++++++++++++++++++++++----------
 5 files changed, 48 insertions(+), 21 deletions(-)

-- 
2.1.4


