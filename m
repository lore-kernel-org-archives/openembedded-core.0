Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23AF560249
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:05:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F25MJL007577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 18:05:22 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:05:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:05:21 -0800
Message-ID: <cover.1452823464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Fri, 15 Jan 2016 02:05:23 -0000
Content-Type: text/plain

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/e2fsprogs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: 1.42.9 -> 1.43-WIP

 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    8 +-
 ...1-e2fsprogs-fix-cross-compilation-problem.patch |   55 ---
 ...-fix-potential-buffer-overflow-in-closefs.patch |   59 ---
 ...the-ability-to-copy-files-from-a-given-di.patch |   98 ----
 ...isc-create_inode.c-copy-files-recursively.patch |  135 ------
 ...3-misc-create_inode.c-create-special-file.patch |  103 ----
 .../0004-misc-create_inode.c-create-symlink.patch  |   63 ---
 ...005-misc-create_inode.c-copy-regular-file.patch |  224 ---------
 ...0006-misc-create_inode.c-create-directory.patch |   62 ---
 ..._inode.c-set-owner-mode-time-for-the-inod.patch |   81 ----
 ...8-mke2fs.c-add-an-option-d-root-directory.patch |  168 -------
 ...0009-misc-create_inode.c-handle-hardlinks.patch |  210 ---------
 ...-use-the-functions-in-misc-create_inode.c.patch |  496 --------------------
 ...s.8.in-update-the-manual-for-the-d-option.patch |   43 --
 .../e2fsprogs/0012-Fix-musl-build-failures.patch   |   54 ---
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        |   58 ---
 .../e2fsprogs/e2fsprogs/cache_inode.patch          |   52 --
 ...ate-hardlinks-with-the-correct-directory-.patch |   81 ----
 .../e2fsprogs/e2fsprogs/fix-icache.patch           |   65 ---
 ...c-return-error-when-failed-to-populate-fs.patch |   37 --
 .../e2fsprogs/e2fsprogs/mkdir.patch                |   32 +-
 .../e2fsprogs/e2fsprogs/ptest.patch                |   35 +-
 .../{e2fsprogs_1.42.9.bb => e2fsprogs_git.bb}      |   44 +-
 23 files changed, 43 insertions(+), 2220 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.9.bb => e2fsprogs_git.bb} (61%)

-- 
1.7.9.5


