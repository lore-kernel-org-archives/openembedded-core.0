Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 873BE71B40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 20:34:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2017 12:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="925786964"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by orsmga003.jf.intel.com with ESMTP; 23 Jan 2017 12:34:20 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:41:13 -0600
Message-Id: <cover.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 0/2] Skip imagefeature and sstatetest tests depending on distro
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
X-List-Received-Date: Mon, 23 Jan 2017 20:34:39 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Originally, the selftests were defined for the 'poky' distro. However, there
are more supported distros, including nodistro, poky-lsb and poky-tiny.
This series just focus on two test cases: imagefeatures and sstatetests.

[YOCTO #8525]

The following changes since commit 4aa6644f92975ded908ef99cf313466e0845e071:

  kernel-fitimage: Use compressed ramdisks in FIT images if available (2017-01-23 12:05:23 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/selftest-imagefeatures-sstatetest-distro-agnostic
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/selftest-imagefeatures-sstatetest-distro-agnostic

Leonardo Sandoval (2):
  selftest/imagefeatures: skip weston test if required features are not
    present
  selftest: sstatetests: skip glibc-initial tests in case of non-glibc
    distro

 meta/lib/oeqa/selftest/imagefeatures.py |  6 +++---
 meta/lib/oeqa/selftest/sstate.py        |  1 +
 meta/lib/oeqa/selftest/sstatetests.py   | 25 +++++++++++++++++++------
 3 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.1.4


