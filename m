Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbRAn-00089v-Ix
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:21:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Dec 2011 22:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="47811189"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Dec 2011 22:14:37 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:14:15 -0800
Message-Id: <cover.1324015563.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/2] Drop dosfstools -d feature in favor of mtools mcopy
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
X-List-Received-Date: Fri, 16 Dec 2011 06:21:37 -0000

The dosfstools -d feature has been shown to be buggy, and even with Nitin's
fixes applied to get directory hierarchies working, it still generates
images that fail dosfsck and don't work with FAT32.

This series presents an alternative means of populating our live images
using mcopy from mtools.

Applies on top of my earlier pull request:
[PATCH 0/4] Fix grub efi menu, kernel messages, and live image dosfsck

The following changes since commit 91e14125b3e90601742f705d2556f5f05e20b944:

  bootimg: Use dosfsck to clean up the generated live image (2011-12-15 22:02:11 -0800)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/mtools
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/mtools

Darren Hart (2):
  bootimg: Use mcopy to construct the hddimg
  dosfstools: Remove initial directory contents feature

 meta/classes/bootimg.bbclass                       |   18 +-
 .../dosfstools/fix_populated_dosfs_creation.patch  |  489 ---------------
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |  639 --------------------
 .../dosfstools/dosfstools/nofat32_autoselect.patch |   27 -
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    7 +-
 5 files changed, 15 insertions(+), 1165 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch

-- 
1.7.6.4



