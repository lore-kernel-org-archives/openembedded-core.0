Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TBeaZ-0007jA-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 06:30:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 21:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,407,1344236400"; d="scan'208";a="221020048"
Received: from unknown (HELO localhost) ([10.255.13.174])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 21:17:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Sep 2012 21:17:04 -0700
Message-Id: <cover.1347423112.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/3] recipes-rt: Update rt-tests, hwlatdetect, and core-image-rt images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 04:30:12 -0000

These changes have been tested on the meta-intel sys940x BSP. cyclictest and
hwlatdetect run successfully.

The following changes since commit 48169c6bc44c546cecaa06207b6c36da558b81f7:

  classes/packageinfo: use better method to check if package exists (2012-09-10 21:52:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/rt-tests
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/rt-tests

Darren Hart (3):
  rt-tests: Update to 0.84, use the kernel.org git repository
  rt-tests: Add hwlatdetect package
  rt: Add hwlatdetect to rt images

 meta/recipes-rt/images/core-image-rt-sdk.bb        |  2 +-
 meta/recipes-rt/images/core-image-rt.bb            |  2 +-
 ...1-rt-tests-Allow-for-user-specified-PYLIB.patch | 35 +++++++++
 ...02-rt-tests-Break-out-install_hwlatdetect.patch | 68 +++++++++++++++++
 meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb       | 24 ++++++
 .../makefile-support-user-cflags-ldflags.patch     | 89 ----------------------
 meta/recipes-rt/rt-tests/rt-tests.inc              | 18 +++++
 .../{rt-tests_0.83.bb => rt-tests_0.84.bb}         | 18 +----
 8 files changed, 151 insertions(+), 105 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
 create mode 100644 meta/recipes-rt/rt-tests/files/0002-rt-tests-Break-out-install_hwlatdetect.patch
 create mode 100644 meta/recipes-rt/rt-tests/hwlatdetect_0.84.bb
 delete mode 100644 meta/recipes-rt/rt-tests/rt-tests-0.83/makefile-support-user-cflags-ldflags.patch
 create mode 100644 meta/recipes-rt/rt-tests/rt-tests.inc
 rename meta/recipes-rt/rt-tests/{rt-tests_0.83.bb => rt-tests_0.84.bb} (61%)

-- 
1.7.11.4



