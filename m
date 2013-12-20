Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF8660D57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 09:37:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2013 01:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,519,1384329600"; d="scan'208";a="427723684"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.151])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2013 01:37:20 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 11:43:48 +0200
Message-Id: <cover.1387532399.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Package upgrades
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
X-List-Received-Date: Fri, 20 Dec 2013 09:37:20 -0000

I've tested the new version of valgrind on local autobuilder on build-appliance,
nightly-arm, mips, ppc, x86, x86-64. Also, I've built on my machine a core-image-sato-sdk
for x86, and I've tested if the correct version was installed. I've done some simple tests, too.

The following changes since commit 9daa1de753e58b7f678e68cf307f6028c0c79a6a:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2013-12-16 12:13:59 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (1):
  valgrind: upgrade to 3.9.0

 .../configure-with-newer-glibc.patch               |   41 --------------------
 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      |   27 -------------
 .../fix_issue_caused_by_ccache.patch               |   32 ---------------
 .../valgrind-3.8.1/fix_unsupporting_kernel_3.patch |   26 -------------
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind-3.8.1 => valgrind}/sepbuildfix.patch |   26 ++++++-------
 .../{valgrind_3.8.1.bb => valgrind_3.9.0.bb}       |   12 ++----
 8 files changed, 17 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/configure-with-newer-glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_issue_caused_by_ccache.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/fix_unsupporting_kernel_3.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.8.1 => valgrind}/sepbuildfix.patch (96%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.8.1.bb => valgrind_3.9.0.bb} (76%)

-- 
1.7.9.5


