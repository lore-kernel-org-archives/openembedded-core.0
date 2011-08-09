Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tong.lin@intel.com>) id 1QqhPd-0004So-Cr
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 10:11:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2011 01:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,342,1309762800"; d="scan'208";a="36586805"
Received: from yocto-build1.sh.intel.com (HELO localhost) ([10.239.48.127])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2011 01:06:10 -0700
From: Lin Tong <tong.lin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 16:30:49 +0800
Message-Id: <cover.1312869726.git.tong.lin@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] [PULL] valgrind:fix bug 1129 for supporting kernel 3.0
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
X-List-Received-Date: Tue, 09 Aug 2011 08:11:45 -0000

Hi Saul,

This pull request adds 3.0 kernel supports in valgrind's configure.in, which fixed bug 1129. Please help to review and pull.

[YOCTO #1129]

Thanks,
Tong


The following changes since commit 19252e0592c59ed0fb06ca510d11e564518f746d:
  Nitin A Kamble (1):
        x86 tune inc files: add x32 abi tune parameters

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib tlin100/bug1129
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=tlin100/bug1129

Lin Tong (1):
  valgrind: supporting Linux kernel 3.0

 .../valgrind-3.6.1/fix_3.0_kernel_support.patch    |   26 ++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_3.0_kernel_support.patch



