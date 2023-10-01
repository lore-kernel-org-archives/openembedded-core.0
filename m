Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67689E748F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.64726.1696183990210813827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RBD1diTt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cpsq38o8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018aec71b531-0a354b1a-0b70-47a1-8efc-fea8c439304c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=aXL7FgXTbQHENUwl03oLj4aoahA9OHv+eFx60mU3g1Y=;
	b=RBD1diTtp3BJ8o82wyortyMixwkoMZq4U7m4LDHlxgEcNWgvUFZfVeQluQb5V8Gc
	pLTpiZ/9l/RlfBuxD5yN/Nn0l6aCiJEnrbhHe3YujMvPFOF60kemdDTukHxRYefU40P
	YIsNHztpuzYrqrw3bpsZWciscEDooOF27AfeT2Pc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=aXL7FgXTbQHENUwl03oLj4aoahA9OHv+eFx60mU3g1Y=;
	b=Cpsq38o8oiJGY5lp27G2Ys3grYQj/q+PEBEx8rd5LFctgYvbD+Tf47dfR7ezZfTY
	oZKHeyN45s2YTWibrsd78bCb+byiMMCEM14Hez9KB/qA11vnLJKOdD7YE0MEDwr/Fpz
	Q3f5wDo/5+wB2d0lcm03xKduOmBfndg1KAZag+qU=
Content-Type: multipart/mixed; boundary="===============0796714963001750158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.7 FAILED
Message-ID: <0101018aec71b531-0a354b1a-0b70-47a1-8efc-fea8c439304c-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188519

--===============0796714963001750158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.6-1.7.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 6b35af960515362cc08e6d7d907c0b866215cf38 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 08:29:17 +0000
Subject: [PATCH] erofs-utils: upgrade 1.6 -> 1.7

---
 ...{erofs-utils_1.6.bb => erofs-utils_1.7.bb} |   7 +-
 ...-don-t-allocate-read-too-large-exten.patch | 126 ------------------
 ...-block-insane-long-paths-when-extrac.patch |  80 -----------
 3 files changed, 2 insertions(+), 211 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.6.bb => erofs-utils_1.7.bb} (73%)
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb
similarity index 73%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb
index 5a89e4b8ee..3ae617b766 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb
@@ -5,11 +5,8 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "21710612d35cd952490959bfa6ea9fe87aaa52dd"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
-           file://0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch \
-           file://0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch \
-"
+SRCREV = "ce36273833096f1b7e828309d9b1caa37132092d"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch b/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
deleted file mode 100644
index 52f475dc42..0000000000
--- a/meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From c769805c79d5acede65d96e5786aa5ebb46c01e0 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@linux.alibaba.com>
-Date: Fri, 2 Jun 2023 11:05:19 +0800
-Subject: [PATCH 1/2] erofs-utils: fsck: don't allocate/read too large extents
-
-Since some crafted EROFS filesystem images could have insane large
-extents, which causes unexpected bahaviors when extracting data.
-
-Fix it by extracting large extents with a buffer of a reasonable
-maximum size limit and reading multiple times instead.
-
-Note that only `--extract` option is impacted.
-
-CVE: CVE-2023-33552
-Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33552
-Reported-by: Chaoming Yang <lometsj@live.com>
-Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
-Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-Link: https://lore.kernel.org/r/20230602030519.117071-1-hsiangkao@linux.alibaba.com
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- fsck/main.c | 63 +++++++++++++++++++++++++++++++++++++++++------------
- 1 file changed, 49 insertions(+), 14 deletions(-)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index 6b42252..6689ad8 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -392,6 +392,8 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 	}
- 
- 	while (pos < inode->i_size) {
-+		unsigned int alloc_rawsize;
-+
- 		map.m_la = pos;
- 		if (compressed)
- 			ret = z_erofs_map_blocks_iter(inode, &map,
-@@ -420,10 +422,28 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 		if (!(map.m_flags & EROFS_MAP_MAPPED) || !fsckcfg.check_decomp)
- 			continue;
- 
--		if (map.m_plen > raw_size) {
--			raw_size = map.m_plen;
--			raw = realloc(raw, raw_size);
--			BUG_ON(!raw);
-+		if (map.m_plen > Z_EROFS_PCLUSTER_MAX_SIZE) {
-+			if (compressed) {
-+				erofs_err("invalid pcluster size %" PRIu64 " @ offset %" PRIu64 " of nid %" PRIu64,
-+					  map.m_plen, map.m_la,
-+					  inode->nid | 0ULL);
-+				ret = -EFSCORRUPTED;
-+				goto out;
-+			}
-+			alloc_rawsize = Z_EROFS_PCLUSTER_MAX_SIZE;
-+		} else {
-+			alloc_rawsize = map.m_plen;
-+		}
-+
-+		if (alloc_rawsize > raw_size) {
-+			char *newraw = realloc(raw, alloc_rawsize);
-+
-+			if (!newraw) {
-+				ret = -ENOMEM;
-+				goto out;
-+			}
-+			raw = newraw;
-+			raw_size = alloc_rawsize;
- 		}
- 
- 		if (compressed) {
-@@ -434,18 +454,27 @@ static int erofs_verify_inode_data(struct erofs_inode *inode, int outfd)
- 			}
- 			ret = z_erofs_read_one_data(inode, &map, raw, buffer,
- 						    0, map.m_llen, false);
-+			if (ret)
-+				goto out;
-+
-+			if (outfd >= 0 && write(outfd, buffer, map.m_llen) < 0)
-+				goto fail_eio;
- 		} else {
--			ret = erofs_read_one_data(&map, raw, 0, map.m_plen);
--		}
--		if (ret)
--			goto out;
-+			u64 p = 0;
- 
--		if (outfd >= 0 && write(outfd, compressed ? buffer : raw,
--					map.m_llen) < 0) {
--			erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
--				  inode->nid | 0ULL);
--			ret = -EIO;
--			goto out;
-+			do {
-+				u64 count = min_t(u64, alloc_rawsize,
-+						  map.m_llen);
-+
-+				ret = erofs_read_one_data(&map, raw, p, count);
-+				if (ret)
-+					goto out;
-+
-+				if (outfd >= 0 && write(outfd, raw, count) < 0)
-+					goto fail_eio;
-+				map.m_llen -= count;
-+				p += count;
-+			} while (map.m_llen);
- 		}
- 	}
- 
-@@ -460,6 +489,12 @@ out:
- 	if (buffer)
- 		free(buffer);
- 	return ret < 0 ? ret : 0;
-+
-+fail_eio:
-+	erofs_err("I/O error occurred when verifying data chunk @ nid %llu",
-+		  inode->nid | 0ULL);
-+	ret = -EIO;
-+	goto out;
- }
- 
- static inline int erofs_extract_dir(struct erofs_inode *inode)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch b/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
deleted file mode 100644
index f2f1e34368..0000000000
--- a/meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 6cebfbb79b1d5d8feb48801e1008eea5bfa8b599 Mon Sep 17 00:00:00 2001
-From: Gao Xiang <hsiangkao@linux.alibaba.com>
-Date: Fri, 2 Jun 2023 13:52:56 +0800
-Subject: [PATCH 2/2] erofs-utils: fsck: block insane long paths when
- extracting images
-
-Since some crafted EROFS filesystem images could have insane deep
-hierarchy (or may form directory loops) which triggers the
-PATH_MAX-sized path buffer OR stack overflow.
-
-Actually some crafted images cannot be deemed as real corrupted
-images but over-PATH_MAX paths are not something that we'd like to
-support for now.
-
-CVE: CVE-2023-33551
-Closes: https://nvd.nist.gov/vuln/detail/CVE-2023-33551
-Reported-by: Chaoming Yang <lometsj@live.com>
-Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
-Fixes: b11f84f593f9 ("erofs-utils: fsck: convert to use erofs_iterate_dir()")
-Fixes: 412c8f908132 ("erofs-utils: fsck: add --extract=X support to extract to path X")
-Signeo-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
-Link: https://lore.kernel.org/r/20230602055256.18061-1-hsiangkao@linux.alibaba.com
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- fsck/main.c | 23 +++++++++++++++--------
- 1 file changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/fsck/main.c b/fsck/main.c
-index 6689ad8..28d95ec 100644
---- a/fsck/main.c
-+++ b/fsck/main.c
-@@ -680,28 +680,35 @@ again:
- static int erofsfsck_dirent_iter(struct erofs_dir_context *ctx)
- {
- 	int ret;
--	size_t prev_pos = fsckcfg.extract_pos;
-+	size_t prev_pos, curr_pos;
- 
- 	if (ctx->dot_dotdot)
- 		return 0;
- 
--	if (fsckcfg.extract_path) {
--		size_t curr_pos = prev_pos;
-+	prev_pos = fsckcfg.extract_pos;
-+	curr_pos = prev_pos;
-+
-+	if (prev_pos + ctx->de_namelen >= PATH_MAX) {
-+		erofs_err("unable to fsck since the path is too long (%u)",
-+			  curr_pos + ctx->de_namelen);
-+		return -EOPNOTSUPP;
-+	}
- 
-+	if (fsckcfg.extract_path) {
- 		fsckcfg.extract_path[curr_pos++] = '/';
- 		strncpy(fsckcfg.extract_path + curr_pos, ctx->dname,
- 			ctx->de_namelen);
- 		curr_pos += ctx->de_namelen;
- 		fsckcfg.extract_path[curr_pos] = '\0';
--		fsckcfg.extract_pos = curr_pos;
-+	} else {
-+		curr_pos += ctx->de_namelen;
- 	}
--
-+	fsckcfg.extract_pos = curr_pos;
- 	ret = erofsfsck_check_inode(ctx->dir->nid, ctx->de_nid);
- 
--	if (fsckcfg.extract_path) {
-+	if (fsckcfg.extract_path)
- 		fsckcfg.extract_path[prev_pos] = '\0';
--		fsckcfg.extract_pos = prev_pos;
--	}
-+	fsckcfg.extract_pos = prev_pos;
- 	return ret;
- }
- 
--- 
-2.34.1
-
-- 
2.39.2


--===============0796714963001750158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-9e21a03936115d09f8f17efe96b86bfaa5ae4fa5"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9e21a03936115d09f8f17efe96b86bfaa5ae4fa5"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 29 Mirrors 0 Missed 10 Current 255 (74% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 825 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_recipe_qa)
NOTE: recipe erofs-utils-1.7-r0: task do_recipe_qa: Started
NOTE: recipe erofs-utils-1.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 870 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_fetch)
NOTE: recipe erofs-utils-1.7-r0: task do_fetch: Started
NOTE: recipe erofs-utils-1.7-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_unpack)
NOTE: Running task 872 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe erofs-utils-1.7-r0: task do_unpack: Started
NOTE: recipe erofs-utils-1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe erofs-utils-1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe erofs-utils-1.7-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_patch)
NOTE: Running task 874 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_collect_spdx_deps)
NOTE: recipe erofs-utils-1.7-r0: task do_patch: Started
NOTE: recipe erofs-utils-1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe erofs-utils-1.7-r0: task do_patch: Succeeded
NOTE: Running task 875 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 876 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_populate_lic)
NOTE: recipe erofs-utils-1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe erofs-utils-1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe erofs-utils-1.7-r0: task do_populate_lic: Started
NOTE: recipe erofs-utils-1.7-r0: task do_populate_lic: Succeeded
NOTE: recipe erofs-utils-1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 877 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_configure)
NOTE: recipe erofs-utils-1.7-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot', '
 virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'util-linux-libuuid', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'lz4', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'attr-native', 'linux-libc-headers', 'm4-native', 'gnu-config-native', 'gmp-native', 'zstd-native', 'mpfr-native', 'flex-native', 'libmpc-native', 'zlib-native', 'xz-native', 'libgcc', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: creating directory config
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'config'.
| libtoolize: copying file 'config/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal/ --force
| configure.ac:263: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../autoconf-2.72c/lib/autoconf/general.m4:2979: AC_RUN_IFELSE is expanded from...
| ../autoconf-2.72c/lib/m4sugar/m4sh.m4:697: AS_IF is expanded from...
| configure.ac:263: the top level
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:17: installing 'config/ar-lib'
| configure.ac:17: installing 'config/compile'
| configure.ac:21: installing 'config/config.guess'
| configure.ac:21: installing 'config/config.sub'
| configure.ac:14: installing 'config/install-sh'
| configure.ac:14: installing 'config/missing'
| dump/Makefile.am: installing 'config/depcomp'
| autoreconf: 'config/config.sub' is updated
| autoreconf: 'config/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../git/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot  --enable-lz4 --disable-fuse --disable-static  --enable-lz4
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot... none
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking the archiver (i686-poky-linux-gcc-ar) interface... ar
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... (cached) i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking pkg-config m4 macros... yes
| checking for dirent.h... yes
| checking for execinfo.h... yes
| checking for fcntl.h... yes
| checking for getopt.h... yes
| checking for inttypes.h... (cached) yes
| checking for linux/aufs_type.h... no
| checking for linux/falloc.h... yes
| checking for linux/fs.h... yes
| checking for linux/types.h... yes
| checking for linux/xattr.h... yes
| checking for limits.h... yes
| checking for stddef.h... yes
| checking for stdint.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for sys/ioctl.h... yes
| checking for sys/mman.h... yes
| checking for sys/random.h... yes
| checking for sys/stat.h... (cached) yes
| checking for sys/statfs.h... yes
| checking for sys/sysmacros.h... yes
| checking for sys/time.h... yes
| checking for unistd.h... (cached) yes
| checking whether termios.h defines TIOCGWINSZ... no
| checking whether sys/ioctl.h defines TIOCGWINSZ... yes
| checking for inline... inline
| checking for int64_t... yes
| checking for size_t... yes
| checking for ssize_t... yes
| checking for struct stat.st_rdev... yes
| checking for struct stat.st_atim... yes
| checking for struct stat.st_atimensec... no
| checking for uint64_t... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/recipe-sysroot options needed to detect all undeclared functions... none needed
| checking whether llseek is declared... no
| checking whether lseek64 is declared... yes
| checking whether memrchr is declared... yes
| checking for backtrace... yes
| checking for copy_file_range... yes
| checking for fallocate... yes
| checking for gettimeofday... yes
| checking for lgetxattr... yes
| checking for llistxattr... yes
| checking for memset... yes
| checking for realpath... yes
| checking for lseek64... yes
| checking for ftello64... yes
| checking for pread64... yes
| checking for pwrite64... yes
| checking for posix_fadvise... yes
| checking for fstatfs... yes
| checking for strdup... yes
| checking for strerror... (cached) yes
| checking for strrchr... yes
| checking for strtoull... yes
| checking for tmpfile64... yes
| checking for utimensat... yes
| checking sysconf (_SC_PAGESIZE)... configure: error: in '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/build':
| configure: error: cannot run test program while cross compiling
| See 'config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044, line 289
NOTE: recipe erofs-utils-1.7-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 877 tasks of which 868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: erofs-utils-1.7-r0 do_configure: configure failed
ERROR: erofs-utils-1.7-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.2514044', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/log.do_configure.2514044
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_configure) failed with exit code '1'

--===============0796714963001750158==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.6-1.7.patch"

RnJvbSA2YjM1YWY5NjA1MTUzNjJjYzA4ZTZkN2Q5MDdjMGI4NjYyMTVjZjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwODoyOToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVy
b2ZzLXV0aWxzOiB1cGdyYWRlIDEuNiAtPiAxLjcKCi0tLQogLi4ue2Vyb2ZzLXV0aWxzXzEuNi5i
YiA9PiBlcm9mcy11dGlsc18xLjcuYmJ9IHwgICA3ICstCiAuLi4tZG9uLXQtYWxsb2NhdGUtcmVh
ZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2ggfCAxMjYgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4tYmxv
Y2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2ggfCAgODAgLS0tLS0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMTEgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL3tlcm9mcy11dGlsc18xLjYuYmIg
PT4gZXJvZnMtdXRpbHNfMS43LmJifSAoNzMlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVyb2ZzLXV0aWxzLWZzY2stZG9u
LXQtYWxsb2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMi1lcm9mcy11dGls
cy1mc2NrLWJsb2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjcuYmIK
c2ltaWxhcml0eSBpbmRleCA3MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vy
b2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNy5iYgppbmRleCA1YTg5ZTRiOGVlLi4zYWU2
MTdiNzY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJv
ZnMtdXRpbHNfMS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9l
cm9mcy11dGlsc18xLjcuYmIKQEAgLTUsMTEgKzUsOCBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03MzAwMWQ4MDRlYTFlM2Q4NDM2NWY2
NTIyNDJjY2EyMCIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JD
UkVWID0gIjIxNzEwNjEyZDM1Y2Q5NTI0OTA5NTliZmE2ZWE5ZmU4N2FhYTUyZGQiCi1TUkNfVVJJ
ID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC94aWFuZy9l
cm9mcy11dGlscy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDAxLWVyb2ZzLXV0aWxzLWZzY2stZG9uLXQtYWxsb2NhdGUtcmVhZC10b28tbGFy
Z2UtZXh0ZW4ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMi1lcm9mcy11dGlscy1mc2Nr
LWJsb2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNoIFwKLSIKK1NSQ1JFViA9
ICJjZTM2MjczODMzMDk2ZjFiN2U4MjgzMDlkOWIxY2FhMzcxMzIwOTJkIgorU1JDX1VSSSA9ICJn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMt
dXRpbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDEtZXJvZnMtdXRpbHMt
ZnNjay1kb24tdC1hbGxvY2F0ZS1yZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVyb2ZzLXV0aWxzLWZzY2stZG9u
LXQtYWxsb2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDUyZjQ3NWRjNDIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDEtZXJvZnMtdXRpbHMtZnNjay1kb24tdC1hbGxv
Y2F0ZS1yZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDEyNiAr
MCwwIEBACi1Gcm9tIGM3Njk4MDVjNzlkNWFjZWRlNjVkOTZlNTc4NmFhNWViYjQ2YzAxZTAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5h
bGliYWJhLmNvbT4KLURhdGU6IEZyaSwgMiBKdW4gMjAyMyAxMTowNToxOSArMDgwMAotU3ViamVj
dDogW1BBVENIIDEvMl0gZXJvZnMtdXRpbHM6IGZzY2s6IGRvbid0IGFsbG9jYXRlL3JlYWQgdG9v
IGxhcmdlIGV4dGVudHMKLQotU2luY2Ugc29tZSBjcmFmdGVkIEVST0ZTIGZpbGVzeXN0ZW0gaW1h
Z2VzIGNvdWxkIGhhdmUgaW5zYW5lIGxhcmdlCi1leHRlbnRzLCB3aGljaCBjYXVzZXMgdW5leHBl
Y3RlZCBiYWhhdmlvcnMgd2hlbiBleHRyYWN0aW5nIGRhdGEuCi0KLUZpeCBpdCBieSBleHRyYWN0
aW5nIGxhcmdlIGV4dGVudHMgd2l0aCBhIGJ1ZmZlciBvZiBhIHJlYXNvbmFibGUKLW1heGltdW0g
c2l6ZSBsaW1pdCBhbmQgcmVhZGluZyBtdWx0aXBsZSB0aW1lcyBpbnN0ZWFkLgotCi1Ob3RlIHRo
YXQgb25seSBgLS1leHRyYWN0YCBvcHRpb24gaXMgaW1wYWN0ZWQuCi0KLUNWRTogQ1ZFLTIwMjMt
MzM1NTIKLUNsb3NlczogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMt
MzM1NTIKLVJlcG9ydGVkLWJ5OiBDaGFvbWluZyBZYW5nIDxsb21ldHNqQGxpdmUuY29tPgotRml4
ZXM6IDQxMmM4ZjkwODEzMiAoImVyb2ZzLXV0aWxzOiBmc2NrOiBhZGQgLS1leHRyYWN0PVggc3Vw
cG9ydCB0byBleHRyYWN0IHRvIHBhdGggWCIpCi1TaWduZWQtb2ZmLWJ5OiBHYW8gWGlhbmcgPGhz
aWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4KLUxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzA2MDIwMzA1MTkuMTE3MDcxLTEtaHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tCi0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxy
b3NzLmJ1cnRvbkBhcm0uY29tPgotLS0tCi0gZnNjay9tYWluLmMgfCA2MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2Vk
LCA0OSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2ZzY2sv
bWFpbi5jIGIvZnNjay9tYWluLmMKLWluZGV4IDZiNDIyNTIuLjY2ODlhZDggMTAwNjQ0Ci0tLS0g
YS9mc2NrL21haW4uYwotKysrIGIvZnNjay9tYWluLmMKLUBAIC0zOTIsNiArMzkyLDggQEAgc3Rh
dGljIGludCBlcm9mc192ZXJpZnlfaW5vZGVfZGF0YShzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2Rl
LCBpbnQgb3V0ZmQpCi0gCX0KLSAKLSAJd2hpbGUgKHBvcyA8IGlub2RlLT5pX3NpemUpIHsKLSsJ
CXVuc2lnbmVkIGludCBhbGxvY19yYXdzaXplOwotKwotIAkJbWFwLm1fbGEgPSBwb3M7Ci0gCQlp
ZiAoY29tcHJlc3NlZCkKLSAJCQlyZXQgPSB6X2Vyb2ZzX21hcF9ibG9ja3NfaXRlcihpbm9kZSwg
Jm1hcCwKLUBAIC00MjAsMTAgKzQyMiwyOCBAQCBzdGF0aWMgaW50IGVyb2ZzX3ZlcmlmeV9pbm9k
ZV9kYXRhKHN0cnVjdCBlcm9mc19pbm9kZSAqaW5vZGUsIGludCBvdXRmZCkKLSAJCWlmICghKG1h
cC5tX2ZsYWdzICYgRVJPRlNfTUFQX01BUFBFRCkgfHwgIWZzY2tjZmcuY2hlY2tfZGVjb21wKQot
IAkJCWNvbnRpbnVlOwotIAotLQkJaWYgKG1hcC5tX3BsZW4gPiByYXdfc2l6ZSkgewotLQkJCXJh
d19zaXplID0gbWFwLm1fcGxlbjsKLS0JCQlyYXcgPSByZWFsbG9jKHJhdywgcmF3X3NpemUpOwot
LQkJCUJVR19PTighcmF3KTsKLSsJCWlmIChtYXAubV9wbGVuID4gWl9FUk9GU19QQ0xVU1RFUl9N
QVhfU0laRSkgewotKwkJCWlmIChjb21wcmVzc2VkKSB7Ci0rCQkJCWVyb2ZzX2VycigiaW52YWxp
ZCBwY2x1c3RlciBzaXplICUiIFBSSXU2NCAiIEAgb2Zmc2V0ICUiIFBSSXU2NCAiIG9mIG5pZCAl
IiBQUkl1NjQsCi0rCQkJCQkgIG1hcC5tX3BsZW4sIG1hcC5tX2xhLAotKwkJCQkJICBpbm9kZS0+
bmlkIHwgMFVMTCk7Ci0rCQkJCXJldCA9IC1FRlNDT1JSVVBURUQ7Ci0rCQkJCWdvdG8gb3V0Owot
KwkJCX0KLSsJCQlhbGxvY19yYXdzaXplID0gWl9FUk9GU19QQ0xVU1RFUl9NQVhfU0laRTsKLSsJ
CX0gZWxzZSB7Ci0rCQkJYWxsb2NfcmF3c2l6ZSA9IG1hcC5tX3BsZW47Ci0rCQl9Ci0rCi0rCQlp
ZiAoYWxsb2NfcmF3c2l6ZSA+IHJhd19zaXplKSB7Ci0rCQkJY2hhciAqbmV3cmF3ID0gcmVhbGxv
YyhyYXcsIGFsbG9jX3Jhd3NpemUpOwotKwotKwkJCWlmICghbmV3cmF3KSB7Ci0rCQkJCXJldCA9
IC1FTk9NRU07Ci0rCQkJCWdvdG8gb3V0OwotKwkJCX0KLSsJCQlyYXcgPSBuZXdyYXc7Ci0rCQkJ
cmF3X3NpemUgPSBhbGxvY19yYXdzaXplOwotIAkJfQotIAotIAkJaWYgKGNvbXByZXNzZWQpIHsK
LUBAIC00MzQsMTggKzQ1NCwyNyBAQCBzdGF0aWMgaW50IGVyb2ZzX3ZlcmlmeV9pbm9kZV9kYXRh
KHN0cnVjdCBlcm9mc19pbm9kZSAqaW5vZGUsIGludCBvdXRmZCkKLSAJCQl9Ci0gCQkJcmV0ID0g
el9lcm9mc19yZWFkX29uZV9kYXRhKGlub2RlLCAmbWFwLCByYXcsIGJ1ZmZlciwKLSAJCQkJCQkg
ICAgMCwgbWFwLm1fbGxlbiwgZmFsc2UpOwotKwkJCWlmIChyZXQpCi0rCQkJCWdvdG8gb3V0Owot
KwotKwkJCWlmIChvdXRmZCA+PSAwICYmIHdyaXRlKG91dGZkLCBidWZmZXIsIG1hcC5tX2xsZW4p
IDwgMCkKLSsJCQkJZ290byBmYWlsX2VpbzsKLSAJCX0gZWxzZSB7Ci0tCQkJcmV0ID0gZXJvZnNf
cmVhZF9vbmVfZGF0YSgmbWFwLCByYXcsIDAsIG1hcC5tX3BsZW4pOwotLQkJfQotLQkJaWYgKHJl
dCkKLS0JCQlnb3RvIG91dDsKLSsJCQl1NjQgcCA9IDA7Ci0gCi0tCQlpZiAob3V0ZmQgPj0gMCAm
JiB3cml0ZShvdXRmZCwgY29tcHJlc3NlZCA/IGJ1ZmZlciA6IHJhdywKLS0JCQkJCW1hcC5tX2xs
ZW4pIDwgMCkgewotLQkJCWVyb2ZzX2VycigiSS9PIGVycm9yIG9jY3VycmVkIHdoZW4gdmVyaWZ5
aW5nIGRhdGEgY2h1bmsgQCBuaWQgJWxsdSIsCi0tCQkJCSAgaW5vZGUtPm5pZCB8IDBVTEwpOwot
LQkJCXJldCA9IC1FSU87Ci0tCQkJZ290byBvdXQ7Ci0rCQkJZG8gewotKwkJCQl1NjQgY291bnQg
PSBtaW5fdCh1NjQsIGFsbG9jX3Jhd3NpemUsCi0rCQkJCQkJICBtYXAubV9sbGVuKTsKLSsKLSsJ
CQkJcmV0ID0gZXJvZnNfcmVhZF9vbmVfZGF0YSgmbWFwLCByYXcsIHAsIGNvdW50KTsKLSsJCQkJ
aWYgKHJldCkKLSsJCQkJCWdvdG8gb3V0OwotKwotKwkJCQlpZiAob3V0ZmQgPj0gMCAmJiB3cml0
ZShvdXRmZCwgcmF3LCBjb3VudCkgPCAwKQotKwkJCQkJZ290byBmYWlsX2VpbzsKLSsJCQkJbWFw
Lm1fbGxlbiAtPSBjb3VudDsKLSsJCQkJcCArPSBjb3VudDsKLSsJCQl9IHdoaWxlIChtYXAubV9s
bGVuKTsKLSAJCX0KLSAJfQotIAotQEAgLTQ2MCw2ICs0ODksMTIgQEAgb3V0OgotIAlpZiAoYnVm
ZmVyKQotIAkJZnJlZShidWZmZXIpOwotIAlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IDA7Ci0rCi0r
ZmFpbF9laW86Ci0rCWVyb2ZzX2VycigiSS9PIGVycm9yIG9jY3VycmVkIHdoZW4gdmVyaWZ5aW5n
IGRhdGEgY2h1bmsgQCBuaWQgJWxsdSIsCi0rCQkgIGlub2RlLT5uaWQgfCAwVUxMKTsKLSsJcmV0
ID0gLUVJTzsKLSsJZ290byBvdXQ7Ci0gfQotIAotIHN0YXRpYyBpbmxpbmUgaW50IGVyb2ZzX2V4
dHJhY3RfZGlyKHN0cnVjdCBlcm9mc19pbm9kZSAqaW5vZGUpCi0tLSAKLTIuMzQuMQotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMi1lcm9m
cy11dGlscy1mc2NrLWJsb2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJvZnMtdXRpbHMt
ZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggZjJmMWUzNDM2OC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMi1lcm9mcy11dGlscy1mc2NrLWJs
b2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNoCisrKyAvZGV2L251bGwKQEAg
LTEsODAgKzAsMCBAQAotRnJvbSA2Y2ViZmJiNzliMWQ1ZDhmZWI0ODgwMWUxMDA4ZWVhNWJmYThi
NTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogR2FvIFhpYW5nIDxoc2lhbmdrYW9A
bGludXguYWxpYmFiYS5jb20+Ci1EYXRlOiBGcmksIDIgSnVuIDIwMjMgMTM6NTI6NTYgKzA4MDAK
LVN1YmplY3Q6IFtQQVRDSCAyLzJdIGVyb2ZzLXV0aWxzOiBmc2NrOiBibG9jayBpbnNhbmUgbG9u
ZyBwYXRocyB3aGVuCi0gZXh0cmFjdGluZyBpbWFnZXMKLQotU2luY2Ugc29tZSBjcmFmdGVkIEVS
T0ZTIGZpbGVzeXN0ZW0gaW1hZ2VzIGNvdWxkIGhhdmUgaW5zYW5lIGRlZXAKLWhpZXJhcmNoeSAo
b3IgbWF5IGZvcm0gZGlyZWN0b3J5IGxvb3BzKSB3aGljaCB0cmlnZ2VycyB0aGUKLVBBVEhfTUFY
LXNpemVkIHBhdGggYnVmZmVyIE9SIHN0YWNrIG92ZXJmbG93LgotCi1BY3R1YWxseSBzb21lIGNy
YWZ0ZWQgaW1hZ2VzIGNhbm5vdCBiZSBkZWVtZWQgYXMgcmVhbCBjb3JydXB0ZWQKLWltYWdlcyBi
dXQgb3Zlci1QQVRIX01BWCBwYXRocyBhcmUgbm90IHNvbWV0aGluZyB0aGF0IHdlJ2QgbGlrZSB0
bwotc3VwcG9ydCBmb3Igbm93LgotCi1DVkU6IENWRS0yMDIzLTMzNTUxCi1DbG9zZXM6IGh0dHBz
Oi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDIzLTMzNTUxCi1SZXBvcnRlZC1ieTog
Q2hhb21pbmcgWWFuZyA8bG9tZXRzakBsaXZlLmNvbT4KLUZpeGVzOiBmNDQwNDM1NjE0OTEgKCJl
cm9mcy11dGlsczogaW50cm9kdWNlIGZzY2suZXJvZnMiKQotRml4ZXM6IGIxMWY4NGY1OTNmOSAo
ImVyb2ZzLXV0aWxzOiBmc2NrOiBjb252ZXJ0IHRvIHVzZSBlcm9mc19pdGVyYXRlX2RpcigpIikK
LUZpeGVzOiA0MTJjOGY5MDgxMzIgKCJlcm9mcy11dGlsczogZnNjazogYWRkIC0tZXh0cmFjdD1Y
IHN1cHBvcnQgdG8gZXh0cmFjdCB0byBwYXRoIFgiKQotU2lnbmVvLW9mZi1ieTogR2FvIFhpYW5n
IDxoc2lhbmdrYW9AbGludXguYWxpYmFiYS5jb20+Ci1MaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjMwNjAyMDU1MjU2LjE4MDYxLTEtaHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29t
Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotLS0tCi0gZnNjay9tYWluLmMgfCAyMyArKysrKysrKysr
KysrKystLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4uYwotaW5kZXgg
NjY4OWFkOC4uMjhkOTVlYyAxMDA2NDQKLS0tLSBhL2ZzY2svbWFpbi5jCi0rKysgYi9mc2NrL21h
aW4uYwotQEAgLTY4MCwyOCArNjgwLDM1IEBAIGFnYWluOgotIHN0YXRpYyBpbnQgZXJvZnNmc2Nr
X2RpcmVudF9pdGVyKHN0cnVjdCBlcm9mc19kaXJfY29udGV4dCAqY3R4KQotIHsKLSAJaW50IHJl
dDsKLS0Jc2l6ZV90IHByZXZfcG9zID0gZnNja2NmZy5leHRyYWN0X3BvczsKLSsJc2l6ZV90IHBy
ZXZfcG9zLCBjdXJyX3BvczsKLSAKLSAJaWYgKGN0eC0+ZG90X2RvdGRvdCkKLSAJCXJldHVybiAw
OwotIAotLQlpZiAoZnNja2NmZy5leHRyYWN0X3BhdGgpIHsKLS0JCXNpemVfdCBjdXJyX3BvcyA9
IHByZXZfcG9zOwotKwlwcmV2X3BvcyA9IGZzY2tjZmcuZXh0cmFjdF9wb3M7Ci0rCWN1cnJfcG9z
ID0gcHJldl9wb3M7Ci0rCi0rCWlmIChwcmV2X3BvcyArIGN0eC0+ZGVfbmFtZWxlbiA+PSBQQVRI
X01BWCkgewotKwkJZXJvZnNfZXJyKCJ1bmFibGUgdG8gZnNjayBzaW5jZSB0aGUgcGF0aCBpcyB0
b28gbG9uZyAoJXUpIiwKLSsJCQkgIGN1cnJfcG9zICsgY3R4LT5kZV9uYW1lbGVuKTsKLSsJCXJl
dHVybiAtRU9QTk9UU1VQUDsKLSsJfQotIAotKwlpZiAoZnNja2NmZy5leHRyYWN0X3BhdGgpIHsK
LSAJCWZzY2tjZmcuZXh0cmFjdF9wYXRoW2N1cnJfcG9zKytdID0gJy8nOwotIAkJc3RybmNweShm
c2NrY2ZnLmV4dHJhY3RfcGF0aCArIGN1cnJfcG9zLCBjdHgtPmRuYW1lLAotIAkJCWN0eC0+ZGVf
bmFtZWxlbik7Ci0gCQljdXJyX3BvcyArPSBjdHgtPmRlX25hbWVsZW47Ci0gCQlmc2NrY2ZnLmV4
dHJhY3RfcGF0aFtjdXJyX3Bvc10gPSAnXDAnOwotLQkJZnNja2NmZy5leHRyYWN0X3BvcyA9IGN1
cnJfcG9zOwotKwl9IGVsc2UgewotKwkJY3Vycl9wb3MgKz0gY3R4LT5kZV9uYW1lbGVuOwotIAl9
Ci0tCi0rCWZzY2tjZmcuZXh0cmFjdF9wb3MgPSBjdXJyX3BvczsKLSAJcmV0ID0gZXJvZnNmc2Nr
X2NoZWNrX2lub2RlKGN0eC0+ZGlyLT5uaWQsIGN0eC0+ZGVfbmlkKTsKLSAKLS0JaWYgKGZzY2tj
ZmcuZXh0cmFjdF9wYXRoKSB7Ci0rCWlmIChmc2NrY2ZnLmV4dHJhY3RfcGF0aCkKLSAJCWZzY2tj
ZmcuZXh0cmFjdF9wYXRoW3ByZXZfcG9zXSA9ICdcMCc7Ci0tCQlmc2NrY2ZnLmV4dHJhY3RfcG9z
ID0gcHJldl9wb3M7Ci0tCX0KLSsJZnNja2NmZy5leHRyYWN0X3BvcyA9IHByZXZfcG9zOwotIAly
ZXR1cm4gcmV0OwotIH0KLSAKLS0tIAotMi4zNC4xCi0KLS0gCjIuMzkuMgoK

--===============0796714963001750158==--

