Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 814576B819
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:32:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K9WHaa019635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:32:17 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 20 Mar 2014 02:32:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 17:37:40 +0800
Message-ID: <cover.1395308167.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] genext2fs: remove it
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
X-List-Received-Date: Thu, 20 Mar 2014 09:32:18 -0000
Content-Type: text/plain

The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/genext2fs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/genext2fs

Robert Yang (1):
  genext2fs: remove it

 meta/conf/distro/include/seperatebuilddir.inc      |    3 -
 .../packagegroups/packagegroup-self-hosted.bb      |    1 -
 ...01-Fix-warnings-remove-some-unused-macros.patch |   72 --
 .../0002-Add-put_blk-and-put_nod-routines.patch    | 1123 --------------------
 .../0003-Add-get_blkmap-and-put_blkmap.patch       |  222 ----
 ...lker-for-walking-through-directory-entrie.patch |  357 -------
 ...05-Make-filesystem-struct-not-an-overloay.patch |  374 -------
 ...0006-Improve-the-efficiency-of-extend_blk.patch |  272 -----
 ...ove-hdlinks-into-the-filesystem-structure.patch |  175 ---
 ...t-the-creation-of-the-filesystem-structur.patch |   95 --
 ...e-byte-swapping-into-the-get-put-routines.patch |  421 --------
 ...rt-over-to-keeping-the-filesystem-on-disk.patch |  839 ---------------
 ...les-into-the-filesystem-a-piece-at-a-time.patch |  103 --
 ...upport-large-file-support-and-rework-hole.patch |  211 ----
 .../0013-Add-volume-id-support.patch               |   86 --
 ...014-Remove-unneeded-setting-of-s_reserved.patch |   28 -
 ...-Rework-creating-the-lost-found-directory.patch |   57 -
 ...ix-the-documentation-for-the-new-L-option.patch |   29 -
 .../0017-Fix-file-same-comparison.patch            |   30 -
 ...andle-files-changing-while-we-are-working.patch |   89 --
 ...ke-sure-superblock-is-clear-on-allocation.patch |   42 -
 .../fix-memory-corruption-on-powerpc.patch         |   76 --
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   37 -
 .../genext2fs/genext2fs-1.4.1/update_to_1.95.patch |  119 ---
 meta/recipes-devtools/genext2fs/genext2fs.inc      |   16 -
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |   29 -
 .../packagegroups/packagegroup-toolset-native.bb   |    1 -
 27 files changed, 4907 deletions(-)
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0001-Fix-warnings-remove-some-unused-macros.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0002-Add-put_blk-and-put_nod-routines.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0003-Add-get_blkmap-and-put_blkmap.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0004-Add-a-dirwalker-for-walking-through-directory-entrie.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0005-Make-filesystem-struct-not-an-overloay.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0006-Improve-the-efficiency-of-extend_blk.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0007-Move-hdlinks-into-the-filesystem-structure.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0008-Separate-out-the-creation-of-the-filesystem-structur.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0009-Move-byte-swapping-into-the-get-put-routines.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0010-Convert-over-to-keeping-the-filesystem-on-disk.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0011-Copy-files-into-the-filesystem-a-piece-at-a-time.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0012-Add-rev-1-support-large-file-support-and-rework-hole.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0013-Add-volume-id-support.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0014-Remove-unneeded-setting-of-s_reserved.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0015-Rework-creating-the-lost-found-directory.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0016-Fix-the-documentation-for-the-new-L-option.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0017-Fix-file-same-comparison.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0018-Handle-files-changing-while-we-are-working.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0019-Make-sure-superblock-is-clear-on-allocation.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-memory-corruption-on-powerpc.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/update_to_1.95.patch
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs.inc
 delete mode 100644 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb

-- 
1.8.3.1


