Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U0D6F-0008N8-JE
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:27:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2013 07:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="196280506"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 07:11:41 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:12:33 +0200
Message-Id: <cover.1359470548.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v4 0/3] On-target gcc enhancement
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
X-List-Received-Date: Tue, 29 Jan 2013 15:28:01 -0000
X-List-Received-Date: Tue, 29 Jan 2013 15:28:01 -0000

This patchset enables the user to build gcc with configurable multilib options.
The following changes since commit cfb082961a6c9ac3d65738031c4071210529cd07:

  bitbake: build.py: Dump out performance data of individual tasks (2013-01-28 14:49:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/gcc_enhan8
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/gcc_enhan8

Constantin Musca (3):
  autotools.bbclass: add EXTRACONFFUNCS variable
  multilib.conf: add TARGET_ARCH & TARGET_SYS to MULTILIB_SAVE_VARNAME
  gcc: enable multilib for target gcc

 meta/classes/autotools.bbclass                     |   4 +-
 meta/conf/multilib.conf                            |   2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   3 +-
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |  87 ++++++++++
 meta/recipes-devtools/gcc/gcc-common.inc           |  24 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 190 +++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  73 ++++++++
 9 files changed, 383 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

-- 
1.7.11.7



