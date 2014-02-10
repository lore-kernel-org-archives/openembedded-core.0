Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D06956E00C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:26:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2014 13:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,820,1384329600"; d="scan'208";a="473023467"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.42])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2014 13:26:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2014 13:26:26 -0800
Message-Id: <cover.1392067183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Consolidated Pull 00/11] Kernel Update and more ptest support
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
X-List-Received-Date: Mon, 10 Feb 2014 21:26:26 -0000

Richard,

These are changes that went through the Autobuild, I reviewed them. 
The ptest changes have been pending for a bit, is there a reason that
you have not taken them?

Thanks
	Sau!


The following changes since commit b5b4898cd409036161c62891e9618d9ab3f891f9:

  python-pycurl: upgrade to 7.19.3 (2014-02-08 21:03:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  kernel: stop using -exec rm for deleting files
  linux-yocto/3.10: integrate LTSI
  linux-yocto/3.10: add powermanagement config to 32 bit common-pc

Chong Lu (2):
  acl: enable ptest support
  attr: enable ptest support

Darren Hart (1):
  linux-yocto: Use PACKAGE_ARCH in build dir

Dave Lerner (1):
  valgrind: Integration of regression tests to ptest

Marius Avram (1):
  puzzles: upgrade to r10116

Paul Eggleton (1):
  conf/bitbake.conf: default HOMEPAGE to blank instead of unknown

Stefan Stanacar (2):
  oeqa/utils: targetbuild: take proxy into account
  testimage: fail if no package manifest is found

 meta/classes/kernel.bbclass                        |  18 +-
 meta/classes/package_deb.bbclass                   |   3 +-
 meta/classes/package_ipk.bbclass                   |   3 +-
 meta/classes/package_rpm.bbclass                   |   3 +-
 meta/classes/testimage.bbclass                     |   7 +-
 meta/conf/bitbake.conf                             |   2 +-
 meta/lib/oeqa/runtime/buildcvs.py                  |   2 +-
 meta/lib/oeqa/runtime/buildiptables.py             |   2 +-
 meta/lib/oeqa/runtime/buildsudoku.py               |   2 +-
 meta/lib/oeqa/utils/targetbuild.py                 |  20 +-
 .../valgrind/valgrind/add-ptest.patch              | 205 +++++++++++++++++++++
 .../valgrind/valgrind/force-nostabs.patch          |  42 +++++
 .../valgrind/remove-arm-variant-specific.patch     |  67 +++++++
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 ++++++++
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |  11 ++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  58 +++++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  16 +-
 .../{puzzles_r9765.bb => puzzles_r10116.bb}        |  34 ++--
 meta/recipes-support/attr/acl.inc                  |  14 +-
 meta/recipes-support/attr/acl/run-ptest            |   7 +
 meta/recipes-support/attr/attr.inc                 |  17 +-
 meta/recipes-support/attr/files/run-ptest          |   5 +
 25 files changed, 572 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 create mode 100755 meta/recipes-devtools/valgrind/valgrind/run-ptest
 rename meta/recipes-sato/puzzles/{puzzles_r9765.bb => puzzles_r10116.bb} (47%)
 create mode 100644 meta/recipes-support/attr/acl/run-ptest
 create mode 100644 meta/recipes-support/attr/files/run-ptest

-- 
1.8.3.1


