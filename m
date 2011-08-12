Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tong.lin@intel.com>) id 1QroYJ-0008VH-GR
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 12:01:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 02:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37122575"
Received: from yocto-build1.sh.intel.com (HELO localhost) ([10.239.48.49])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2011 02:56:45 -0700
From: Lin Tong <tong.lin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 18:21:21 +0800
Message-Id: <cover.1313143473.git.tong.lin@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] [PULL] valgrind: fix bug 1129 for supporting kernel 3.x
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
X-List-Received-Date: Fri, 12 Aug 2011 10:01:19 -0000

Hi Saul,

This pull requests to add 3.x kernel supports in valgrind's configure.in,
which fixed bug 1129. Please help to review and pull.

[YOCTO #1129]

Thanks,
Tong

The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
  Kumar Gala (1):
        gnome-doc-utils: respect python-dir setting EXTRA_OECONF

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib tlin100/bug1129-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=tlin100/bug1129-v2

Lin Tong (1):
  valgrind: supporting on Linux kernel 3.x

 .../valgrind-3.6.1/fix_unsupporting_kernel_3.patch |   26 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch



