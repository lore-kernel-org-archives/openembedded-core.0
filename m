Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tum0M-0001KN-5z
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 16:31:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2013 07:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="246401793"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2013 07:15:56 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 17:16:35 +0200
Message-Id: <cover.1358175955.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2 0/6] On-target multilib gcc enhacement
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
X-List-Received-Date: Mon, 14 Jan 2013 15:31:22 -0000

This patchset enables the user to build gcc with configurable multilib options.
The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/gcc_enhan3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/gcc_enhan3

Constantin Musca (6):
  gcc: add missing dependency (zlib)
  gcc: remove the 64bithack patch
  multilib.conf: add TARGET_ARCH to MULTILIB_SAVE_VARNAME
  gcc: enable multilib for target gcc
  tune-mips32: add BASE_LIB to mips32 tunes
  tune-ppc603e: add BASE_LIB

 meta/conf/machine/include/tune-mips32.inc          |   4 +
 meta/conf/machine/include/tune-ppc603e.inc         |   1 +
 meta/conf/multilib.conf                            |   2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   5 +-
 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch  |  63 -------
 meta/recipes-devtools/gcc/gcc-common.inc           |  25 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 200 +++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++
 10 files changed, 280 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

-- 
1.7.11.7



