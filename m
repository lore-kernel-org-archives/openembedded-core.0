Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 60259731F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 20:07:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 08 Jan 2016 12:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,540,1444719600"; d="scan'208";a="630359419"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2016 12:07:29 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 12:03:58 +0000
Message-Id: <a6891a794d1bd63093ef80f3e34b65e169af5e06.1452254483.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1452254483.git.mariano.lopez@linux.intel.com>
References: <cover.1452254483.git.mariano.lopez@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Add "CVE:" tag to current patches in OE-core
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
X-List-Received-Date: Fri, 08 Jan 2016 20:07:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The currnet patches in OE-core doesn't have the "CVE:"
tag, now part of the policy of the patches.

This is patch add this tag to several patches. There might
be patches that I miss; the tag can be added in the future.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch    | 1 +
 meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch               | 1 +
 .../0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch       | 1 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch           | 2 +-
 .../elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch         | 1 +
 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch                   | 1 +
 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch                   | 1 +
 meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch     | 1 +
 .../0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch     | 1 +
 meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch       | 1 +
 meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch       | 1 +
 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch           | 1 +
 meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch         | 1 +
 .../libarchive/libarchive/libarchive-CVE-2013-0211.patch                | 1 +
 .../libarchive/libarchive/libarchive-CVE-2015-2304.patch                | 1 +
 .../mailx/files/0011-outof-Introduce-expandaddr-flag.patch              | 1 +
 .../mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch      | 1 +
 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch               | 1 +
 .../screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch      | 1 +
 meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch            | 1 +
 .../unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch           | 1 +
 meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch   | 1 +
 meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch  | 1 +
 meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch   | 1 +
 meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch                   | 1 +
 meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch                   | 1 +
 meta/recipes-extended/unzip/unzip/cve-2014-9636.patch                   | 1 +
 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch          | 1 +
 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch       | 1 +
 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch              | 1 +
 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch              | 1 +
 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch              | 1 +
 meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch       | 1 +
 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch                | 1 +
 meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch          | 1 +
 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch                 | 1 +
 36 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
index f9252e9..65ddcaf 100644
--- a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
+++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Accepted
+CVE: CVE-2015-8370
 Signed-off-by: Awais Belal <awais_belal@mentor.com>
 
 From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
diff --git a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
index c9edb30..c5a0be8 100644
--- a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
+++ b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
@@ -3,6 +3,7 @@ ppp: Buffer overflow in radius plugin
 From: https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;bug=782450
 
 Upstream-Status: Backport
+CVE: CVE-2015-3310
 
 On systems with more than 65535 processes running, pppd aborts when
 sending a "start" accounting message to the RADIUS server because of a
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
index 72f77cc..b904e46 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
@@ -4,6 +4,7 @@ Date: Fri, 6 Feb 2015 12:46:39 -0500
 Subject: [PATCH] libext2fs: fix potential buffer overflow in closefs()
 
 Upstream-Status: Backport
+CVE: CVE-2015-1572
 
 The bug fix in f66e6ce4446: "libext2fs: avoid buffer overflow if
 s_first_meta_bg is too big" had a typo in the fix for
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
index 4de67c9..5b6346b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
@@ -11,8 +11,8 @@ fs->desc_blocks.  This doesn't correct the bad s_first_meta_bg value,
 but it avoids causing the e2fsprogs userspace programs from
 potentially crashing.
 
-Fixes CVE-2015-0247
 Upstream-Status: Backport
+CVE: CVE-2015-0247
 
 Signed-off-by: Theodore Ts'o <tytso@mit.edu>
 Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
index 84e8ddc..deba45f 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
@@ -7,6 +7,7 @@ this patch is from:
  https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=147018e729e7c22eeabf15b82d26e4bf68a0d18e
 
 Upstream-Status: Backport
+CVE: CVE-2014-9447
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
index b107e8f..a2691f6 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
@@ -4,6 +4,7 @@ Date: Wed, 10 Jun 2015 14:36:56 +0000
 Subject: [PATCH 2/2] rpm: CVE-2013-6435
 
 Upstream-Status: Backport
+CVE: CVE-2013-6435
 
 Reference:
 https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
index bf1795c..985f150 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
@@ -4,6 +4,7 @@ Date: Wed, 10 Jun 2015 12:56:55 +0000
 Subject: [PATCH 1/2] rpm: CVE-2014-8118
 
 Upstream-Status: Backport
+CVE: CVE-2014-8118
 
 Reference:
 https://bugzilla.redhat.com/show_bug.cgi?id=1168715
diff --git a/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch b/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
index f054452..bea325e 100644
--- a/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
+++ b/meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport [ The patch is rsync-2.6.9 specific ]
+CVE: CVE-2007-4091
 
 The patch is from https://issues.rpath.com/browse/RPL-1647 and is used to
 address http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4091
diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
index 5ece542..19e7f39 100644
--- a/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
+++ b/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Complain if an inc-recursive path is not right for its dir.
  trasnfer path.
 
 Upstream-Status: BackPort
+CVE: CVE-2014-9512
 
 Fix the CVE-2014-9512, rsync 3.1.1 allows remote attackers to write to arbitrary
 files via a symlink attack on a file in the synchronization path.
diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
index 1fcac49..c86f478 100644
--- a/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
+++ b/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 1/1] Add compat flag to allow proper seed checksum order.
  Fixes the equivalent of librsync's CVE-2014-8242 issue.
 
 Upstream-Status: Backport
+CVE: CVE-2014-8242
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 ---
diff --git a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
index 8f719ad..5c99919 100644
--- a/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
+++ b/meta/recipes-extended/cpio/cpio-2.12/0001-Fix-CVE-2015-1197.patch
@@ -11,6 +11,7 @@ Author: Vitezslav Cizek <vcizek@suse.cz>
 Bug-Debian: https://bugs.debian.org/774669
 
 Upstream-Status: Pending
+CVE: CVE-2015-1197
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
diff --git a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
index 49a7cf5..a315735 100644
--- a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
+++ b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Inappropriate [bugfix: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]
+CVE: CVE-2010-0624
 
 This patch avoids heap overflow reported by :
 http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624
diff --git a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
index 059d068..721f2a0 100644
--- a/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
+++ b/meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
@@ -10,6 +10,7 @@ http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5667
 Upstream-Status: Inappropriate [other]
 This version of GNU Grep has been abandoned upstream and they are no longer
 accepting patches.  This is not a backport.
+CVE: CVE-2012-5667
 
 Signed-off-by Ming Liu <ming.liu@windriver.com>
 ---
diff --git a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
index 126f80e..19523f4 100644
--- a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
+++ b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Fix CVE-2013-0211
 This patch comes from:https://github.com/libarchive/libarchive/commit/22531545514043e04633e1c015c7540b9de9dbe4
 
 Upstream-Status: Backport
+CVE: CVE-2013-0211
 
 Signed-off-by: Baogen shang <baogen.shang@windriver.com>
 
diff --git a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
index 4ca779c..5c24396 100644
--- a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
+++ b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
@@ -7,6 +7,7 @@ This fixes a directory traversal in the cpio tool.
 
 
 Upstream-Status: backport
+CVE: CVE-2015-2304
 
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
diff --git a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
index 5d61645..13b955c 100644
--- a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
+++ b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
@@ -13,6 +13,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
+CVE: CVE-2014-7844
 ---
  mailx.1 | 14 ++++++++++++++
  names.c |  3 +++
diff --git a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
index f65cfa8..ae14b8a 100644
--- a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
+++ b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
@@ -7,6 +7,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
+CVE: CVE-2004-2771
 ---
  fio.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch b/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
index f156290..741a990 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
@@ -36,6 +36,7 @@ Date:   Thu Aug 6 16:27:20 2015 +0200
     Signed-off-by: Olaf Kirch <okir@...e.de>
 
     Upstream-Status: Backport
+    CVE: CVE-2015-7236
 
     Signed-off-by: Li Zhou <li.zhou@windriver.com>
 ---
diff --git a/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch b/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
index 2bc9a59..4ac820f 100644
--- a/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
+++ b/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
@@ -10,6 +10,7 @@ This is time consuming and will overflow stack if n is huge.
 Fixes CVE-2015-6806
 
 Upstream-Status: Backport
+CVE: CVE-2015-6806
 
 Signed-off-by: Kuang-che Wu <kcwu@csie.org>
 Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
diff --git a/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch b/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
index da2ae3c..af5026f 100644
--- a/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
+++ b/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Inappropriate [bugfix: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]
+CVE: CVE-2010-0624
 
 This patch avoids heap overflow reported by :
 http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624
diff --git a/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch b/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
index 9ba3c1d..afc4c73 100644
--- a/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
+++ b/meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
@@ -3,6 +3,7 @@ Subject: unzip files encoded with non-latin, non-unicode file names
 Last-Update: 2015-02-11
 
 Upstream-Status: Backport
+CVE: CVE-2015-1315
 
 Updated 2015-02-11 by Marc Deslauriers <marc.deslauriers@canonical.com>
 to fix buffer overflow in charset_to_intern()
diff --git a/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
index e137f0d..0e497cc 100644
--- a/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
+++ b/meta/recipes-extended/unzip/unzip/09-cve-2014-8139-crc-overflow.patch
@@ -5,6 +5,7 @@ Bug-Debian: http://bugs.debian.org/773722
 The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
 
 Upstream-Status: Backport
+CVE: CVE-2014-8139
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
index edc7d51..c989df1 100644
--- a/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
+++ b/meta/recipes-extended/unzip/unzip/10-cve-2014-8140-test-compr-eb.patch
@@ -5,6 +5,7 @@ Bug-Debian: http://bugs.debian.org/773722
 The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
 
 Upstream-Status: Backport
+CVE: CVE-2014-8140
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
index d0c1db3..c48c23f 100644
--- a/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
+++ b/meta/recipes-extended/unzip/unzip/11-cve-2014-8141-getzip64data.patch
@@ -5,6 +5,7 @@ Bug-Debian: http://bugs.debian.org/773722
 The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
 
 Upstream-Status: Backport
+CVE: CVE-2014-8141
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch b/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
index ea93823..87eed96 100644
--- a/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
+++ b/meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2015-7696
 Signed-off-by: Tudor Florea <tudor.flore@enea.com>
 
 From 68efed87fabddd450c08f3112f62a73f61d493c9 Mon Sep 17 00:00:00 2001
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch b/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
index da68988..a8f2936 100644
--- a/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
+++ b/meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2015-7697
 Signed-off-by: Tudor Florea <tudor.flore@enea.com>
 
 From bd8a743ee0a77e65ad07ef4196c4cd366add3f26 Mon Sep 17 00:00:00 2001
diff --git a/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch b/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch
index 0a0bfbb..5fcd318 100644
--- a/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch
+++ b/meta/recipes-extended/unzip/unzip/cve-2014-9636.patch
@@ -4,6 +4,7 @@ Date: Wed, 11 Feb 2015
 Subject: Info-ZIP UnZip buffer overflow
 
 Upstream-Status: Backport
+CVE: CVE-2014-9636
 
 By carefully crafting a corrupt ZIP archive with "extra fields" that
 purport to have compressed blocks larger than the corresponding
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
index 0542dbe..c44c5a1 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
@@ -9,6 +9,7 @@ http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342
 the patch come from:
 https://bugzilla.redhat.com/attachment.cgi?id=799732&action=diff
 
+CVE: CVE-2013-4342
 Signed-off-by: Li Wang <li.wang@windriver.com>
 ---
  xinetd/builtins.c |    2 +-
diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
index 1e31caa..94213a7 100644
--- a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2014-9676
 
 Backport patch to fix CVE-2014-9676.
 
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch
index c9addca..f066774 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch
@@ -11,6 +11,7 @@ git://git.gnupg.org/libgcrypt.git
 exponents in secure memory.
 
 Upstream-Status: Backport
+CVE: CVE-2013-4242
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 --
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
index b29ede4..b50a32f 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2013-4351
 
 Index: gnupg-1.4.7/g10/getkey.c
 ===================================================================
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch
index b1a22f5..5dcde1f 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2013-4576
 
 Index: gnupg-1.4.7/cipher/dsa.c
 ===================================================================
diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch
index 8b5d9a1..3627176 100644
--- a/meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch
+++ b/meta/recipes-support/gnupg/gnupg-1.4.7/GnuPG1-CVE-2012-6085.patch
@@ -17,6 +17,7 @@ Date:   Thu Dec 20 09:43:41 2012 +0100
     (cherry-picked from commit f795a0d59e197455f8723c300eebf59e09853efa)
 
 Upstream-Status: Backport
+CVE: CVE-2012-6085
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
index e4d09c2..f4113ef 100644
--- a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
@@ -8,6 +8,7 @@ We need to check that the parent node is an element before dereferencing
 its namespace
 
 Upstream-Status: Backport
+CVE: CVE-2015-7995
 
 https://git.gnome.org/browse/libxslt/commit/?id=7ca19df892ca22d9314e95d59ce2abdeff46b617
 
diff --git a/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch b/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
index 3c4a00e..61fa7e5 100644
--- a/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
+++ b/meta/recipes-support/libyaml/files/libyaml-CVE-2014-9130.patch
@@ -10,6 +10,7 @@ The patch comes from
 https://bitbucket.org/xi/libyaml/commits/2b9156756423e967cfd09a61d125d883fca6f4f2
 
 Upstream-Status: Backport
+CVE: CVE-2014-9130
 
 Signed-off-by: Yue Tao <yue.tao@windriver.com>
 
diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
index 2407771..9b99803 100644
--- a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
+++ b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
@@ -1,4 +1,5 @@
 Upstream-Status: Backport
+CVE: CVE-2012-2738
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
-- 
1.8.4.5


