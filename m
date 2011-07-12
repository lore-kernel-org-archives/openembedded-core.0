Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qgi8N-00015d-Eh
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:56:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="27071674"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2011 11:52:39 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 11:52:35 -0700
Message-Id: <cover.1310496679.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/3] a bugfix & fix for couple of qa warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2011 18:56:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:

  insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  binutils: package unpackaged files
  eglibc: fix installed but not packaged files
  eglibc: fix runtime assertion failure

 .../eglibc/eglibc-2.13/glibc_bug_fix_12454.patch   |  179 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |    4 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
 .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
 .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    2 +
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 7 files changed, 190 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch

-- 
1.7.4.4



