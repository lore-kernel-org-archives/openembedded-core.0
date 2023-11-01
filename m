Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFDCC07E98
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8480.1698848703495532161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KuMCiwQN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IurkQ5Ut;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b4600f1-2e099588-ace2-48c5-aee1-964a85a9ae25-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=JnMskKakd4zxq35dBl4SlRTtiEpisItSvKB3J/xPc2s=;
	b=KuMCiwQNIMz3YMVciKNvWkapwYgxYe96OAzNXfxF63SLikkuih0AFn/E+UJpOkN1
	YqdJajpnlkNmR1hyQ54VbLqGisgBE6D0ZccllYQPzS0LRKcl7ooFJKiZ8yiqiwzMCuf
	myRZhgSjYNCW9QhnAxtquWfXzp4XZRGcXwYr3G+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=JnMskKakd4zxq35dBl4SlRTtiEpisItSvKB3J/xPc2s=;
	b=IurkQ5UtEyMYwoJ72iS4TWq+6j1EiNhm+q6+92pDRbpjZpjU0h1P2rTvoFNP/lJU
	fNgiZXvLSegNN6iLIkncJVgCqjsaFMUvIHyuH3DuHjDCRxYeUjpH9bI2hb7UcxeoTF0
	+vIUYjIm3MsBQwt50iFyMgMDa9gy7guCR7sBL+tI=
Content-Type: multipart/mixed; boundary="===============8451170400215484185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.7.1 FAILED
Message-ID: <0101018b8b4600f1-2e099588-ace2-48c5-aee1-964a85a9ae25-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189930

--===============8451170400215484185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *erofs-utils* to *1.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.6-1.7.1.patch
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
From 77a15a1afc34aa6bad9429079807ffcd28c0cf39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:50:30 +0000
Subject: [PATCH] erofs-utils: upgrade 1.6 -> 1.7.1

---
 ...rofs-utils_1.6.bb => erofs-utils_1.7.1.bb} |   7 +-
 ...-don-t-allocate-read-too-large-exten.patch | 126 ------------------
 ...-block-insane-long-paths-when-extrac.patch |  80 -----------
 3 files changed, 2 insertions(+), 211 deletions(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.6.bb => erofs-utils_1.7.1.bb} (73%)
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/files/0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
similarity index 73%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
index 5a89e4b8ee..4c51c84ab2 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb
@@ -5,11 +5,8 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "21710612d35cd952490959bfa6ea9fe87aaa52dd"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
-           file://0001-erofs-utils-fsck-don-t-allocate-read-too-large-exten.patch \
-           file://0002-erofs-utils-fsck-block-insane-long-paths-when-extrac.patch \
-"
+SRCREV = "83d94dc619075e71ca4d0f42941cfc18d269a2af"
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


--===============8451170400215484185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-331ba800622b57ae76117fd7c35f0539f29398a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:331ba800622b57ae76117fd7c35f0539f29398a1"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 27 Mirrors 0 Missed 10 Current 257 (72% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 825 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_recipe_qa)
NOTE: recipe erofs-utils-1.7.1-r0: task do_recipe_qa: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 870 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_fetch)
NOTE: recipe erofs-utils-1.7.1-r0: task do_fetch: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 871 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_unpack)
NOTE: Running task 872 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe erofs-utils-1.7.1-r0: task do_unpack: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe erofs-utils-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_patch)
NOTE: Running task 874 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe erofs-utils-1.7.1-r0: task do_patch: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 875 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 876 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_populate_lic)
NOTE: recipe erofs-utils-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe erofs-utils-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_populate_lic: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_populate_lic: Succeeded
NOTE: recipe erofs-utils-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 877 of 887 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure)
NOTE: recipe erofs-utils-1.7.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot', '
 virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'util-linux-libuuid', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'lz4', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'zstd-native', 'xz-native', 'linux-libc-headers', 'mpfr-native', 'gnu-config-native', 'binutils-cross-x86_64', 'zlib-native', 'gmp-native', 'texinfo-dummy-native', 'flex-native', 'libmpc-native', 'libgcc', 'attr-native', 'm4-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force
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
| NOTE: Running ../git/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot  --enable-lz4 --disable-fuse --disable-static  --enable-lz4
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... none
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking the archiver (x86_64-poky-linux-gcc-ar) interface... ar
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... (cached) x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
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
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot options needed to detect all undeclared functions... none needed
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
| checking sysconf (_SC_PAGESIZE)... 4096
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for uuid... yes
| checking libuuid usability... yes
| checking for lz4.h... yes
| checking for LZ4_compress_destSize in -llz4... yes
| checking for LZ4_compress_HC_destSize in -llz4... yes
| checking for zlib... no
| configure: error: Package requirements (zlib) were not met:
| 
| No package 'zlib' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables zlib_CFLAGS
| and zlib_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822, line 289
NOTE: recipe erofs-utils-1.7.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 877 tasks of which 868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: erofs-utils-1.7.1-r0 do_configure: configure failed
ERROR: erofs-utils-1.7.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.2764822', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/log.do_configure.2764822
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure) failed with exit code '1'

--===============8451170400215484185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.6-1.7.1.patch"

RnJvbSA3N2ExNWExYWZjMzRhYTZiYWQ5NDI5MDc5ODA3ZmZjZDI4YzBjZjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjo1MDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVy
b2ZzLXV0aWxzOiB1cGdyYWRlIDEuNiAtPiAxLjcuMQoKLS0tCiAuLi5yb2ZzLXV0aWxzXzEuNi5i
YiA9PiBlcm9mcy11dGlsc18xLjcuMS5iYn0gfCAgIDcgKy0KIC4uLi1kb24tdC1hbGxvY2F0ZS1y
ZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaCB8IDEyNiAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi1i
bG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaCB8ICA4MCAtLS0tLS0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIxMSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuNi5i
YiA9PiBlcm9mcy11dGlsc18xLjcuMS5iYn0gKDczJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1lcm9mcy11dGlscy1mc2Nr
LWRvbi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJvZnMt
dXRpbHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaAoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18x
LjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS43
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA3MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNy4xLmJiCmluZGV4IDVhODllNGI4
ZWUuLjRjNTFjODRhYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11
dGlscy9lcm9mcy11dGlsc18xLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2Zz
LXV0aWxzL2Vyb2ZzLXV0aWxzXzEuNy4xLmJiCkBAIC01LDExICs1LDggQEAgU0VDVElPTiA9ICJi
YXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NzMwMDFkODA0ZWEx
ZTNkODQzNjVmNjUyMjQyY2NhMjAiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC94aWFuZy9lcm9mcy11dGlscy5naXQvdHJlZS9SRUFE
TUUiCiAKLVNSQ1JFViA9ICIyMTcxMDYxMmQzNWNkOTUyNDkwOTU5YmZhNmVhOWZlODdhYWE1MmRk
IgotU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAot
ICAgICAgICAgICBmaWxlOi8vMDAwMS1lcm9mcy11dGlscy1mc2NrLWRvbi10LWFsbG9jYXRlLXJl
YWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItZXJvZnMt
dXRpbHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaCBcCi0i
CitTUkNSRVYgPSAiODNkOTRkYzYxOTA3NWU3MWNhNGQwZjQyOTQxY2ZjMThkMjY5YTJhZiIKK1NS
Q19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hp
YW5nL2Vyb2ZzLXV0aWxzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNU
UkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVy
b2ZzLXV0aWxzLWZzY2stZG9uLXQtYWxsb2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1lcm9mcy11dGls
cy1mc2NrLWRvbi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1MmY0NzVkYzQyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVyb2ZzLXV0aWxzLWZzY2st
ZG9uLXQtYWxsb2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwxMjYgKzAsMCBAQAotRnJvbSBjNzY5ODA1Yzc5ZDVhY2VkZTY1ZDk2ZTU3ODZhYTVlYmI0
NmMwMWUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogR2FvIFhpYW5nIDxoc2lhbmdr
YW9AbGludXguYWxpYmFiYS5jb20+Ci1EYXRlOiBGcmksIDIgSnVuIDIwMjMgMTE6MDU6MTkgKzA4
MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGVyb2ZzLXV0aWxzOiBmc2NrOiBkb24ndCBhbGxvY2F0
ZS9yZWFkIHRvbyBsYXJnZSBleHRlbnRzCi0KLVNpbmNlIHNvbWUgY3JhZnRlZCBFUk9GUyBmaWxl
c3lzdGVtIGltYWdlcyBjb3VsZCBoYXZlIGluc2FuZSBsYXJnZQotZXh0ZW50cywgd2hpY2ggY2F1
c2VzIHVuZXhwZWN0ZWQgYmFoYXZpb3JzIHdoZW4gZXh0cmFjdGluZyBkYXRhLgotCi1GaXggaXQg
YnkgZXh0cmFjdGluZyBsYXJnZSBleHRlbnRzIHdpdGggYSBidWZmZXIgb2YgYSByZWFzb25hYmxl
Ci1tYXhpbXVtIHNpemUgbGltaXQgYW5kIHJlYWRpbmcgbXVsdGlwbGUgdGltZXMgaW5zdGVhZC4K
LQotTm90ZSB0aGF0IG9ubHkgYC0tZXh0cmFjdGAgb3B0aW9uIGlzIGltcGFjdGVkLgotCi1DVkU6
IENWRS0yMDIzLTMzNTUyCi1DbG9zZXM6IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWls
L0NWRS0yMDIzLTMzNTUyCi1SZXBvcnRlZC1ieTogQ2hhb21pbmcgWWFuZyA8bG9tZXRzakBsaXZl
LmNvbT4KLUZpeGVzOiA0MTJjOGY5MDgxMzIgKCJlcm9mcy11dGlsczogZnNjazogYWRkIC0tZXh0
cmFjdD1YIHN1cHBvcnQgdG8gZXh0cmFjdCB0byBwYXRoIFgiKQotU2lnbmVkLW9mZi1ieTogR2Fv
IFhpYW5nIDxoc2lhbmdrYW9AbGludXguYWxpYmFiYS5jb20+Ci1MaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjMwNjAyMDMwNTE5LjExNzA3MS0xLWhzaWFuZ2thb0BsaW51eC5hbGli
YWJhLmNvbQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGZzY2svbWFpbi5jIHwgNjMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KLSAxIGZp
bGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1n
aXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFpbi5jCi1pbmRleCA2YjQyMjUyLi42Njg5YWQ4IDEw
MDY0NAotLS0tIGEvZnNjay9tYWluLmMKLSsrKyBiL2ZzY2svbWFpbi5jCi1AQCAtMzkyLDYgKzM5
Miw4IEBAIHN0YXRpYyBpbnQgZXJvZnNfdmVyaWZ5X2lub2RlX2RhdGEoc3RydWN0IGVyb2ZzX2lu
b2RlICppbm9kZSwgaW50IG91dGZkKQotIAl9Ci0gCi0gCXdoaWxlIChwb3MgPCBpbm9kZS0+aV9z
aXplKSB7Ci0rCQl1bnNpZ25lZCBpbnQgYWxsb2NfcmF3c2l6ZTsKLSsKLSAJCW1hcC5tX2xhID0g
cG9zOwotIAkJaWYgKGNvbXByZXNzZWQpCi0gCQkJcmV0ID0gel9lcm9mc19tYXBfYmxvY2tzX2l0
ZXIoaW5vZGUsICZtYXAsCi1AQCAtNDIwLDEwICs0MjIsMjggQEAgc3RhdGljIGludCBlcm9mc192
ZXJpZnlfaW5vZGVfZGF0YShzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlLCBpbnQgb3V0ZmQpCi0g
CQlpZiAoIShtYXAubV9mbGFncyAmIEVST0ZTX01BUF9NQVBQRUQpIHx8ICFmc2NrY2ZnLmNoZWNr
X2RlY29tcCkKLSAJCQljb250aW51ZTsKLSAKLS0JCWlmIChtYXAubV9wbGVuID4gcmF3X3NpemUp
IHsKLS0JCQlyYXdfc2l6ZSA9IG1hcC5tX3BsZW47Ci0tCQkJcmF3ID0gcmVhbGxvYyhyYXcsIHJh
d19zaXplKTsKLS0JCQlCVUdfT04oIXJhdyk7Ci0rCQlpZiAobWFwLm1fcGxlbiA+IFpfRVJPRlNf
UENMVVNURVJfTUFYX1NJWkUpIHsKLSsJCQlpZiAoY29tcHJlc3NlZCkgewotKwkJCQllcm9mc19l
cnIoImludmFsaWQgcGNsdXN0ZXIgc2l6ZSAlIiBQUkl1NjQgIiBAIG9mZnNldCAlIiBQUkl1NjQg
IiBvZiBuaWQgJSIgUFJJdTY0LAotKwkJCQkJICBtYXAubV9wbGVuLCBtYXAubV9sYSwKLSsJCQkJ
CSAgaW5vZGUtPm5pZCB8IDBVTEwpOwotKwkJCQlyZXQgPSAtRUZTQ09SUlVQVEVEOwotKwkJCQln
b3RvIG91dDsKLSsJCQl9Ci0rCQkJYWxsb2NfcmF3c2l6ZSA9IFpfRVJPRlNfUENMVVNURVJfTUFY
X1NJWkU7Ci0rCQl9IGVsc2UgewotKwkJCWFsbG9jX3Jhd3NpemUgPSBtYXAubV9wbGVuOwotKwkJ
fQotKwotKwkJaWYgKGFsbG9jX3Jhd3NpemUgPiByYXdfc2l6ZSkgewotKwkJCWNoYXIgKm5ld3Jh
dyA9IHJlYWxsb2MocmF3LCBhbGxvY19yYXdzaXplKTsKLSsKLSsJCQlpZiAoIW5ld3Jhdykgewot
KwkJCQlyZXQgPSAtRU5PTUVNOwotKwkJCQlnb3RvIG91dDsKLSsJCQl9Ci0rCQkJcmF3ID0gbmV3
cmF3OwotKwkJCXJhd19zaXplID0gYWxsb2NfcmF3c2l6ZTsKLSAJCX0KLSAKLSAJCWlmIChjb21w
cmVzc2VkKSB7Ci1AQCAtNDM0LDE4ICs0NTQsMjcgQEAgc3RhdGljIGludCBlcm9mc192ZXJpZnlf
aW5vZGVfZGF0YShzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlLCBpbnQgb3V0ZmQpCi0gCQkJfQot
IAkJCXJldCA9IHpfZXJvZnNfcmVhZF9vbmVfZGF0YShpbm9kZSwgJm1hcCwgcmF3LCBidWZmZXIs
Ci0gCQkJCQkJICAgIDAsIG1hcC5tX2xsZW4sIGZhbHNlKTsKLSsJCQlpZiAocmV0KQotKwkJCQln
b3RvIG91dDsKLSsKLSsJCQlpZiAob3V0ZmQgPj0gMCAmJiB3cml0ZShvdXRmZCwgYnVmZmVyLCBt
YXAubV9sbGVuKSA8IDApCi0rCQkJCWdvdG8gZmFpbF9laW87Ci0gCQl9IGVsc2UgewotLQkJCXJl
dCA9IGVyb2ZzX3JlYWRfb25lX2RhdGEoJm1hcCwgcmF3LCAwLCBtYXAubV9wbGVuKTsKLS0JCX0K
LS0JCWlmIChyZXQpCi0tCQkJZ290byBvdXQ7Ci0rCQkJdTY0IHAgPSAwOwotIAotLQkJaWYgKG91
dGZkID49IDAgJiYgd3JpdGUob3V0ZmQsIGNvbXByZXNzZWQgPyBidWZmZXIgOiByYXcsCi0tCQkJ
CQltYXAubV9sbGVuKSA8IDApIHsKLS0JCQllcm9mc19lcnIoIkkvTyBlcnJvciBvY2N1cnJlZCB3
aGVuIHZlcmlmeWluZyBkYXRhIGNodW5rIEAgbmlkICVsbHUiLAotLQkJCQkgIGlub2RlLT5uaWQg
fCAwVUxMKTsKLS0JCQlyZXQgPSAtRUlPOwotLQkJCWdvdG8gb3V0OwotKwkJCWRvIHsKLSsJCQkJ
dTY0IGNvdW50ID0gbWluX3QodTY0LCBhbGxvY19yYXdzaXplLAotKwkJCQkJCSAgbWFwLm1fbGxl
bik7Ci0rCi0rCQkJCXJldCA9IGVyb2ZzX3JlYWRfb25lX2RhdGEoJm1hcCwgcmF3LCBwLCBjb3Vu
dCk7Ci0rCQkJCWlmIChyZXQpCi0rCQkJCQlnb3RvIG91dDsKLSsKLSsJCQkJaWYgKG91dGZkID49
IDAgJiYgd3JpdGUob3V0ZmQsIHJhdywgY291bnQpIDwgMCkKLSsJCQkJCWdvdG8gZmFpbF9laW87
Ci0rCQkJCW1hcC5tX2xsZW4gLT0gY291bnQ7Ci0rCQkJCXAgKz0gY291bnQ7Ci0rCQkJfSB3aGls
ZSAobWFwLm1fbGxlbik7Ci0gCQl9Ci0gCX0KLSAKLUBAIC00NjAsNiArNDg5LDEyIEBAIG91dDoK
LSAJaWYgKGJ1ZmZlcikKLSAJCWZyZWUoYnVmZmVyKTsKLSAJcmV0dXJuIHJldCA8IDAgPyByZXQg
OiAwOwotKwotK2ZhaWxfZWlvOgotKwllcm9mc19lcnIoIkkvTyBlcnJvciBvY2N1cnJlZCB3aGVu
IHZlcmlmeWluZyBkYXRhIGNodW5rIEAgbmlkICVsbHUiLAotKwkJICBpbm9kZS0+bmlkIHwgMFVM
TCk7Ci0rCXJldCA9IC1FSU87Ci0rCWdvdG8gb3V0OwotIH0KLSAKLSBzdGF0aWMgaW5saW5lIGlu
dCBlcm9mc19leHRyYWN0X2RpcihzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlKQotLS0gCi0yLjM0
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVz
LzAwMDItZXJvZnMtdXRpbHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJh
Yy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAyLWVy
b2ZzLXV0aWxzLWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGYyZjFlMzQzNjguLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJvZnMtdXRp
bHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDgwICswLDAgQEAKLUZyb20gNmNlYmZiYjc5YjFkNWQ4ZmViNDg4MDFlMTAw
OGVlYTViZmE4YjU5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEdhbyBYaWFuZyA8
aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPgotRGF0ZTogRnJpLCAyIEp1biAyMDIzIDEzOjUy
OjU2ICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8yXSBlcm9mcy11dGlsczogZnNjazogYmxvY2sg
aW5zYW5lIGxvbmcgcGF0aHMgd2hlbgotIGV4dHJhY3RpbmcgaW1hZ2VzCi0KLVNpbmNlIHNvbWUg
Y3JhZnRlZCBFUk9GUyBmaWxlc3lzdGVtIGltYWdlcyBjb3VsZCBoYXZlIGluc2FuZSBkZWVwCi1o
aWVyYXJjaHkgKG9yIG1heSBmb3JtIGRpcmVjdG9yeSBsb29wcykgd2hpY2ggdHJpZ2dlcnMgdGhl
Ci1QQVRIX01BWC1zaXplZCBwYXRoIGJ1ZmZlciBPUiBzdGFjayBvdmVyZmxvdy4KLQotQWN0dWFs
bHkgc29tZSBjcmFmdGVkIGltYWdlcyBjYW5ub3QgYmUgZGVlbWVkIGFzIHJlYWwgY29ycnVwdGVk
Ci1pbWFnZXMgYnV0IG92ZXItUEFUSF9NQVggcGF0aHMgYXJlIG5vdCBzb21ldGhpbmcgdGhhdCB3
ZSdkIGxpa2UgdG8KLXN1cHBvcnQgZm9yIG5vdy4KLQotQ1ZFOiBDVkUtMjAyMy0zMzU1MQotQ2xv
c2VzOiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMy0zMzU1MQotUmVw
b3J0ZWQtYnk6IENoYW9taW5nIFlhbmcgPGxvbWV0c2pAbGl2ZS5jb20+Ci1GaXhlczogZjQ0MDQz
NTYxNDkxICgiZXJvZnMtdXRpbHM6IGludHJvZHVjZSBmc2NrLmVyb2ZzIikKLUZpeGVzOiBiMTFm
ODRmNTkzZjkgKCJlcm9mcy11dGlsczogZnNjazogY29udmVydCB0byB1c2UgZXJvZnNfaXRlcmF0
ZV9kaXIoKSIpCi1GaXhlczogNDEyYzhmOTA4MTMyICgiZXJvZnMtdXRpbHM6IGZzY2s6IGFkZCAt
LWV4dHJhY3Q9WCBzdXBwb3J0IHRvIGV4dHJhY3QgdG8gcGF0aCBYIikKLVNpZ25lby1vZmYtYnk6
IEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPgotTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDIzMDYwMjA1NTI1Ni4xODA2MS0xLWhzaWFuZ2thb0BsaW51eC5h
bGliYWJhLmNvbQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGZzY2svbWFpbi5jIHwgMjMg
KysrKysrKysrKysrKysrLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWlu
LmMKLWluZGV4IDY2ODlhZDguLjI4ZDk1ZWMgMTAwNjQ0Ci0tLS0gYS9mc2NrL21haW4uYwotKysr
IGIvZnNjay9tYWluLmMKLUBAIC02ODAsMjggKzY4MCwzNSBAQCBhZ2FpbjoKLSBzdGF0aWMgaW50
IGVyb2ZzZnNja19kaXJlbnRfaXRlcihzdHJ1Y3QgZXJvZnNfZGlyX2NvbnRleHQgKmN0eCkKLSB7
Ci0gCWludCByZXQ7Ci0tCXNpemVfdCBwcmV2X3BvcyA9IGZzY2tjZmcuZXh0cmFjdF9wb3M7Ci0r
CXNpemVfdCBwcmV2X3BvcywgY3Vycl9wb3M7Ci0gCi0gCWlmIChjdHgtPmRvdF9kb3Rkb3QpCi0g
CQlyZXR1cm4gMDsKLSAKLS0JaWYgKGZzY2tjZmcuZXh0cmFjdF9wYXRoKSB7Ci0tCQlzaXplX3Qg
Y3Vycl9wb3MgPSBwcmV2X3BvczsKLSsJcHJldl9wb3MgPSBmc2NrY2ZnLmV4dHJhY3RfcG9zOwot
KwljdXJyX3BvcyA9IHByZXZfcG9zOwotKwotKwlpZiAocHJldl9wb3MgKyBjdHgtPmRlX25hbWVs
ZW4gPj0gUEFUSF9NQVgpIHsKLSsJCWVyb2ZzX2VycigidW5hYmxlIHRvIGZzY2sgc2luY2UgdGhl
IHBhdGggaXMgdG9vIGxvbmcgKCV1KSIsCi0rCQkJICBjdXJyX3BvcyArIGN0eC0+ZGVfbmFtZWxl
bik7Ci0rCQlyZXR1cm4gLUVPUE5PVFNVUFA7Ci0rCX0KLSAKLSsJaWYgKGZzY2tjZmcuZXh0cmFj
dF9wYXRoKSB7Ci0gCQlmc2NrY2ZnLmV4dHJhY3RfcGF0aFtjdXJyX3BvcysrXSA9ICcvJzsKLSAJ
CXN0cm5jcHkoZnNja2NmZy5leHRyYWN0X3BhdGggKyBjdXJyX3BvcywgY3R4LT5kbmFtZSwKLSAJ
CQljdHgtPmRlX25hbWVsZW4pOwotIAkJY3Vycl9wb3MgKz0gY3R4LT5kZV9uYW1lbGVuOwotIAkJ
ZnNja2NmZy5leHRyYWN0X3BhdGhbY3Vycl9wb3NdID0gJ1wwJzsKLS0JCWZzY2tjZmcuZXh0cmFj
dF9wb3MgPSBjdXJyX3BvczsKLSsJfSBlbHNlIHsKLSsJCWN1cnJfcG9zICs9IGN0eC0+ZGVfbmFt
ZWxlbjsKLSAJfQotLQotKwlmc2NrY2ZnLmV4dHJhY3RfcG9zID0gY3Vycl9wb3M7Ci0gCXJldCA9
IGVyb2ZzZnNja19jaGVja19pbm9kZShjdHgtPmRpci0+bmlkLCBjdHgtPmRlX25pZCk7Ci0gCi0t
CWlmIChmc2NrY2ZnLmV4dHJhY3RfcGF0aCkgewotKwlpZiAoZnNja2NmZy5leHRyYWN0X3BhdGgp
Ci0gCQlmc2NrY2ZnLmV4dHJhY3RfcGF0aFtwcmV2X3Bvc10gPSAnXDAnOwotLQkJZnNja2NmZy5l
eHRyYWN0X3BvcyA9IHByZXZfcG9zOwotLQl9Ci0rCWZzY2tjZmcuZXh0cmFjdF9wb3MgPSBwcmV2
X3BvczsKLSAJcmV0dXJuIHJldDsKLSB9Ci0gCi0tLSAKLTIuMzQuMQotCi0tIAoyLjM5LjIKCg==

--===============8451170400215484185==--

