Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SENVd-0008GM-E1
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 18:20:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2012 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136280128"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2012 09:09:51 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 00:10:08 +0800
Message-Id: <cover.1333295122.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/5] dexuan: more build appliance patches: [Apr 1, 2012]
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
X-List-Received-Date: Sun, 01 Apr 2012 16:20:05 -0000

BTW:
I added a "Upstream-Status: inappropriat" into every patches to genext2fs.

With the patches, I only spent about 10~15 minutes to create a 4.5GB
.rootfs.ext3 file by genext2fs.


The following changes since commit 8691a588267472eb5a32b978a0eb9ddfd0c91733:

  cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:59 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib dcui/master
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (5):
  genext2fs: support large files and  filesystems without using large
    amounts of memory
  self-hosted-image: improve do_populate_poky_src
  self-hosted-image: renew the poky src's SRCREV that's installed into
    the target
  builder: uncomment the settings for BB_NUMBER_THREADS and
    PARALLEL_MAKE
  self-hosted-image: fix indentation: 8 spaces --> Tab

 meta/recipes-core/images/self-hosted-image.bb      |   21 +-
 ...01-Fix-warnings-remove-some-unused-macros.patch |   72 ++
 .../0002-Add-put_blk-and-put_nod-routines.patch    | 1123 ++++++++++++++++++++
 .../0003-Add-get_blkmap-and-put_blkmap.patch       |  222 ++++
 ...lker-for-walking-through-directory-entrie.patch |  357 +++++++
 ...05-Make-filesystem-struct-not-an-overloay.patch |  374 +++++++
 ...0006-Improve-the-efficiency-of-extend_blk.patch |  272 +++++
 ...ove-hdlinks-into-the-filesystem-structure.patch |  175 +++
 ...t-the-creation-of-the-filesystem-structur.patch |   95 ++
 ...e-byte-swapping-into-the-get-put-routines.patch |  421 ++++++++
 ...rt-over-to-keeping-the-filesystem-on-disk.patch |  839 +++++++++++++++
 ...les-into-the-filesystem-a-piece-at-a-time.patch |  103 ++
 ...upport-large-file-support-and-rework-hole.patch |  211 ++++
 .../0013-Add-volume-id-support.patch               |   86 ++
 ...014-Remove-unneeded-setting-of-s_reserved.patch |   28 +
 ...-Rework-creating-the-lost-found-directory.patch |   57 +
 ...ix-the-documentation-for-the-new-L-option.patch |   29 +
 .../0017-Fix-file-same-comparison.patch            |   30 +
 ...andle-files-changing-while-we-are-working.patch |   89 ++
 ...ke-sure-superblock-is-clear-on-allocation.patch |   42 +
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   18 +-
 .../genext2fs/genext2fs-1.4.1/update_to_1.95.patch |  119 ++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |   24 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 .../builder/files/builder_hob_start.sh             |    5 +
 25 files changed, 4795 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0001-Fix-warnings-remove-some-unused-macros.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0002-Add-put_blk-and-put_nod-routines.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0003-Add-get_blkmap-and-put_blkmap.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0004-Add-a-dirwalker-for-walking-through-directory-entrie.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0005-Make-filesystem-struct-not-an-overloay.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0006-Improve-the-efficiency-of-extend_blk.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0007-Move-hdlinks-into-the-filesystem-structure.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0008-Separate-out-the-creation-of-the-filesystem-structur.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0009-Move-byte-swapping-into-the-get-put-routines.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0010-Convert-over-to-keeping-the-filesystem-on-disk.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0011-Copy-files-into-the-filesystem-a-piece-at-a-time.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0012-Add-rev-1-support-large-file-support-and-rework-hole.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0013-Add-volume-id-support.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0014-Remove-unneeded-setting-of-s_reserved.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0015-Rework-creating-the-lost-found-directory.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0016-Fix-the-documentation-for-the-new-L-option.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0017-Fix-file-same-comparison.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0018-Handle-files-changing-while-we-are-working.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0019-Make-sure-superblock-is-clear-on-allocation.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/update_to_1.95.patch

-- 
1.7.6



