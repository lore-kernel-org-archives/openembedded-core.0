Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TsrkQ-0002ER-NV
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:14:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jan 2013 00:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,436,1355126400"; d="scan'208";a="189196759"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jan 2013 00:59:44 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 11:00:21 +0200
Message-Id: <cover.1357721541.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/3] On-target multilib gcc enhancement
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
X-List-Received-Date: Wed, 09 Jan 2013 09:15:06 -0000

This patchset enables the user to build gcc with configurable multilib options.
The following changes since commit 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:

  perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/gcc_enhan
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/gcc_enhan

Constantin Musca (3):
  gcc: add missing dependency (zlib)
  gcc: remove the 64bithack patch
  gcc: enable multilib for target gcc

 meta/recipes-devtools/gcc/gcc-4.7.inc              |   5 +-
 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch  |  63 ----------
 meta/recipes-devtools/gcc/gcc-common.inc           |  23 ++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 132 +++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++++
 7 files changed, 203 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

-- 
1.7.11.7



