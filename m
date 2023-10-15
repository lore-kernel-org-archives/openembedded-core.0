Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55987C04FCD
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.102664.1697399114050803084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XhX9RIm8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gokzE0f4;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b34df063d-76c8a954-08d9-4f13-93dc-8b23097141ae-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Ul/7rIw9s6HT/Y9aO4zr/H2Z0f8V6+4qN7sNKzOVC/U=;
	b=XhX9RIm8rfhtAbpVrCh5x5eBfdVF1a7jgmUcVH9hvCw8ycwK7n5k+z2DaNMWC59q
	aBC9hLKlYEFZy6EA/OhBDb5imwoCm+zvHG381r/nLNZuat4705uqc7t0k+hye5ARQuB
	c1QHL+MGIuJNCP/5aiPXNGRCxkR50ROQeuS51jUg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Ul/7rIw9s6HT/Y9aO4zr/H2Z0f8V6+4qN7sNKzOVC/U=;
	b=gokzE0f4hcsmELX7qBLN7W87FVfzGui1+GiPzbLPIXOcPJ92b5nBL53bi8cDTIVv
	Z2aisquwocl+O6Lhfitu3QJZubKYv+SPaGAtW42eDZ6gCg68HwMIglvl5u+BonVWjkH
	/qtSDiaxWNybIVEm9FKl0JmlOL+XbDnYVQX0+utg=
Content-Type: multipart/mixed; boundary="===============2086614651809651392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.7 FAILED
Message-ID: <0101018b34df063d-76c8a954-08d9-4f13-93dc-8b23097141ae-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189173

--===============2086614651809651392==
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
From 6a20cc41bbeae1c53ec4631033a51e231bd15e7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 09:08:47 +0000
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


--===============2086614651809651392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-0977c4d15948e98a98a36c16db13160569bbf70b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0977c4d15948e98a98a36c16db13160569bbf70b"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 49 Local 39 Mirrors 0 Missed 10 Current 245 (79% match, 96% complete)
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
NOTE: recipe erofs-utils-1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe erofs-utils-1.7-r0: task do_unpack: Started
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
| NOTE: Skipping as already exists in sysroot: ['glibc', 'util-linux-libuuid', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'lz4', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'attr-native', 'linux-libc-headers', 'gmp-native', 'libmpc-native', 'gnu-config-native', 'zstd-native', 'xz-native', 'zlib-native', 'flex-native', 'texinfo-dummy-native', 'binutils-cross-i686', 'mpfr-native', 'm4-native', 'libgcc', 'gettext-minimal-native']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153, line 289
NOTE: recipe erofs-utils-1.7-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 877 tasks of which 868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: erofs-utils-1.7-r0 do_configure: configure failed
ERROR: erofs-utils-1.7-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/run.do_configure.547153', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/erofs-utils/1.7/temp/log.do_configure.547153
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.bb:do_configure) failed with exit code '1'

--===============2086614651809651392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.6-1.7.patch"

RnJvbSA2YTIwY2M0MWJiZWFlMWM1M2VjNDYzMTAzM2E1MWUyMzFiZDE1ZTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDk6MDg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjYgLT4gMS43CgotLS0KIC4uLntlcm9mcy11dGlsc18xLjYu
YmIgPT4gZXJvZnMtdXRpbHNfMS43LmJifSB8ICAgNyArLQogLi4uLWRvbi10LWFsbG9jYXRlLXJl
YWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoIHwgMTI2IC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uLWJs
b2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNoIHwgIDgwIC0tLS0tLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjExIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy97ZXJvZnMtdXRpbHNfMS42LmJi
ID0+IGVyb2ZzLXV0aWxzXzEuNy5iYn0gKDczJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1lcm9mcy11dGlscy1mc2NrLWRv
bi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJvZnMtdXRp
bHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaAoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjYu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS43LmJi
CnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9l
cm9mcy11dGlscy9lcm9mcy11dGlsc18xLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjcuYmIKaW5kZXggNWE4OWU0YjhlZS4uM2Fl
NjE3Yjc2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vy
b2ZzLXV0aWxzXzEuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMv
ZXJvZnMtdXRpbHNfMS43LmJiCkBAIC01LDExICs1LDggQEAgU0VDVElPTiA9ICJiYXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NzMwMDFkODA0ZWExZTNkODQzNjVm
NjUyMjQyY2NhMjAiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC94aWFuZy9lcm9mcy11dGlscy5naXQvdHJlZS9SRUFETUUiCiAKLVNS
Q1JFViA9ICIyMTcxMDYxMmQzNWNkOTUyNDkwOTU5YmZhNmVhOWZlODdhYWE1MmRkIgotU1JDX1VS
SSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcv
ZXJvZnMtdXRpbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAotICAgICAgICAg
ICBmaWxlOi8vMDAwMS1lcm9mcy11dGlscy1mc2NrLWRvbi10LWFsbG9jYXRlLXJlYWQtdG9vLWxh
cmdlLWV4dGVuLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDItZXJvZnMtdXRpbHMtZnNj
ay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaCBcCi0iCitTUkNSRVYg
PSAiY2UzNjI3MzgzMzA5NmYxYjdlODI4MzA5ZDliMWNhYTM3MTMyMDkyZCIKK1NSQ19VUkkgPSAi
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2Zz
LXV0aWxzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVyb2ZzLXV0aWxz
LWZzY2stZG9uLXQtYWxsb2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1lcm9mcy11dGlscy1mc2NrLWRv
bi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA1MmY0NzVkYzQyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAxLWVyb2ZzLXV0aWxzLWZzY2stZG9uLXQtYWxs
b2NhdGUtcmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxMjYg
KzAsMCBAQAotRnJvbSBjNzY5ODA1Yzc5ZDVhY2VkZTY1ZDk2ZTU3ODZhYTVlYmI0NmMwMWUwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogR2FvIFhpYW5nIDxoc2lhbmdrYW9AbGludXgu
YWxpYmFiYS5jb20+Ci1EYXRlOiBGcmksIDIgSnVuIDIwMjMgMTE6MDU6MTkgKzA4MDAKLVN1Ympl
Y3Q6IFtQQVRDSCAxLzJdIGVyb2ZzLXV0aWxzOiBmc2NrOiBkb24ndCBhbGxvY2F0ZS9yZWFkIHRv
byBsYXJnZSBleHRlbnRzCi0KLVNpbmNlIHNvbWUgY3JhZnRlZCBFUk9GUyBmaWxlc3lzdGVtIGlt
YWdlcyBjb3VsZCBoYXZlIGluc2FuZSBsYXJnZQotZXh0ZW50cywgd2hpY2ggY2F1c2VzIHVuZXhw
ZWN0ZWQgYmFoYXZpb3JzIHdoZW4gZXh0cmFjdGluZyBkYXRhLgotCi1GaXggaXQgYnkgZXh0cmFj
dGluZyBsYXJnZSBleHRlbnRzIHdpdGggYSBidWZmZXIgb2YgYSByZWFzb25hYmxlCi1tYXhpbXVt
IHNpemUgbGltaXQgYW5kIHJlYWRpbmcgbXVsdGlwbGUgdGltZXMgaW5zdGVhZC4KLQotTm90ZSB0
aGF0IG9ubHkgYC0tZXh0cmFjdGAgb3B0aW9uIGlzIGltcGFjdGVkLgotCi1DVkU6IENWRS0yMDIz
LTMzNTUyCi1DbG9zZXM6IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDIz
LTMzNTUyCi1SZXBvcnRlZC1ieTogQ2hhb21pbmcgWWFuZyA8bG9tZXRzakBsaXZlLmNvbT4KLUZp
eGVzOiA0MTJjOGY5MDgxMzIgKCJlcm9mcy11dGlsczogZnNjazogYWRkIC0tZXh0cmFjdD1YIHN1
cHBvcnQgdG8gZXh0cmFjdCB0byBwYXRoIFgiKQotU2lnbmVkLW9mZi1ieTogR2FvIFhpYW5nIDxo
c2lhbmdrYW9AbGludXguYWxpYmFiYS5jb20+Ci1MaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjMwNjAyMDMwNTE5LjExNzA3MS0xLWhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbQot
Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGZzY2svbWFpbi5jIHwgNjMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdl
ZCwgNDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9mc2Nr
L21haW4uYyBiL2ZzY2svbWFpbi5jCi1pbmRleCA2YjQyMjUyLi42Njg5YWQ4IDEwMDY0NAotLS0t
IGEvZnNjay9tYWluLmMKLSsrKyBiL2ZzY2svbWFpbi5jCi1AQCAtMzkyLDYgKzM5Miw4IEBAIHN0
YXRpYyBpbnQgZXJvZnNfdmVyaWZ5X2lub2RlX2RhdGEoc3RydWN0IGVyb2ZzX2lub2RlICppbm9k
ZSwgaW50IG91dGZkKQotIAl9Ci0gCi0gCXdoaWxlIChwb3MgPCBpbm9kZS0+aV9zaXplKSB7Ci0r
CQl1bnNpZ25lZCBpbnQgYWxsb2NfcmF3c2l6ZTsKLSsKLSAJCW1hcC5tX2xhID0gcG9zOwotIAkJ
aWYgKGNvbXByZXNzZWQpCi0gCQkJcmV0ID0gel9lcm9mc19tYXBfYmxvY2tzX2l0ZXIoaW5vZGUs
ICZtYXAsCi1AQCAtNDIwLDEwICs0MjIsMjggQEAgc3RhdGljIGludCBlcm9mc192ZXJpZnlfaW5v
ZGVfZGF0YShzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlLCBpbnQgb3V0ZmQpCi0gCQlpZiAoISht
YXAubV9mbGFncyAmIEVST0ZTX01BUF9NQVBQRUQpIHx8ICFmc2NrY2ZnLmNoZWNrX2RlY29tcCkK
LSAJCQljb250aW51ZTsKLSAKLS0JCWlmIChtYXAubV9wbGVuID4gcmF3X3NpemUpIHsKLS0JCQly
YXdfc2l6ZSA9IG1hcC5tX3BsZW47Ci0tCQkJcmF3ID0gcmVhbGxvYyhyYXcsIHJhd19zaXplKTsK
LS0JCQlCVUdfT04oIXJhdyk7Ci0rCQlpZiAobWFwLm1fcGxlbiA+IFpfRVJPRlNfUENMVVNURVJf
TUFYX1NJWkUpIHsKLSsJCQlpZiAoY29tcHJlc3NlZCkgewotKwkJCQllcm9mc19lcnIoImludmFs
aWQgcGNsdXN0ZXIgc2l6ZSAlIiBQUkl1NjQgIiBAIG9mZnNldCAlIiBQUkl1NjQgIiBvZiBuaWQg
JSIgUFJJdTY0LAotKwkJCQkJICBtYXAubV9wbGVuLCBtYXAubV9sYSwKLSsJCQkJCSAgaW5vZGUt
Pm5pZCB8IDBVTEwpOwotKwkJCQlyZXQgPSAtRUZTQ09SUlVQVEVEOwotKwkJCQlnb3RvIG91dDsK
LSsJCQl9Ci0rCQkJYWxsb2NfcmF3c2l6ZSA9IFpfRVJPRlNfUENMVVNURVJfTUFYX1NJWkU7Ci0r
CQl9IGVsc2UgewotKwkJCWFsbG9jX3Jhd3NpemUgPSBtYXAubV9wbGVuOwotKwkJfQotKwotKwkJ
aWYgKGFsbG9jX3Jhd3NpemUgPiByYXdfc2l6ZSkgewotKwkJCWNoYXIgKm5ld3JhdyA9IHJlYWxs
b2MocmF3LCBhbGxvY19yYXdzaXplKTsKLSsKLSsJCQlpZiAoIW5ld3JhdykgewotKwkJCQlyZXQg
PSAtRU5PTUVNOwotKwkJCQlnb3RvIG91dDsKLSsJCQl9Ci0rCQkJcmF3ID0gbmV3cmF3OwotKwkJ
CXJhd19zaXplID0gYWxsb2NfcmF3c2l6ZTsKLSAJCX0KLSAKLSAJCWlmIChjb21wcmVzc2VkKSB7
Ci1AQCAtNDM0LDE4ICs0NTQsMjcgQEAgc3RhdGljIGludCBlcm9mc192ZXJpZnlfaW5vZGVfZGF0
YShzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlLCBpbnQgb3V0ZmQpCi0gCQkJfQotIAkJCXJldCA9
IHpfZXJvZnNfcmVhZF9vbmVfZGF0YShpbm9kZSwgJm1hcCwgcmF3LCBidWZmZXIsCi0gCQkJCQkJ
ICAgIDAsIG1hcC5tX2xsZW4sIGZhbHNlKTsKLSsJCQlpZiAocmV0KQotKwkJCQlnb3RvIG91dDsK
LSsKLSsJCQlpZiAob3V0ZmQgPj0gMCAmJiB3cml0ZShvdXRmZCwgYnVmZmVyLCBtYXAubV9sbGVu
KSA8IDApCi0rCQkJCWdvdG8gZmFpbF9laW87Ci0gCQl9IGVsc2UgewotLQkJCXJldCA9IGVyb2Zz
X3JlYWRfb25lX2RhdGEoJm1hcCwgcmF3LCAwLCBtYXAubV9wbGVuKTsKLS0JCX0KLS0JCWlmIChy
ZXQpCi0tCQkJZ290byBvdXQ7Ci0rCQkJdTY0IHAgPSAwOwotIAotLQkJaWYgKG91dGZkID49IDAg
JiYgd3JpdGUob3V0ZmQsIGNvbXByZXNzZWQgPyBidWZmZXIgOiByYXcsCi0tCQkJCQltYXAubV9s
bGVuKSA8IDApIHsKLS0JCQllcm9mc19lcnIoIkkvTyBlcnJvciBvY2N1cnJlZCB3aGVuIHZlcmlm
eWluZyBkYXRhIGNodW5rIEAgbmlkICVsbHUiLAotLQkJCQkgIGlub2RlLT5uaWQgfCAwVUxMKTsK
LS0JCQlyZXQgPSAtRUlPOwotLQkJCWdvdG8gb3V0OwotKwkJCWRvIHsKLSsJCQkJdTY0IGNvdW50
ID0gbWluX3QodTY0LCBhbGxvY19yYXdzaXplLAotKwkJCQkJCSAgbWFwLm1fbGxlbik7Ci0rCi0r
CQkJCXJldCA9IGVyb2ZzX3JlYWRfb25lX2RhdGEoJm1hcCwgcmF3LCBwLCBjb3VudCk7Ci0rCQkJ
CWlmIChyZXQpCi0rCQkJCQlnb3RvIG91dDsKLSsKLSsJCQkJaWYgKG91dGZkID49IDAgJiYgd3Jp
dGUob3V0ZmQsIHJhdywgY291bnQpIDwgMCkKLSsJCQkJCWdvdG8gZmFpbF9laW87Ci0rCQkJCW1h
cC5tX2xsZW4gLT0gY291bnQ7Ci0rCQkJCXAgKz0gY291bnQ7Ci0rCQkJfSB3aGlsZSAobWFwLm1f
bGxlbik7Ci0gCQl9Ci0gCX0KLSAKLUBAIC00NjAsNiArNDg5LDEyIEBAIG91dDoKLSAJaWYgKGJ1
ZmZlcikKLSAJCWZyZWUoYnVmZmVyKTsKLSAJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAwOwotKwot
K2ZhaWxfZWlvOgotKwllcm9mc19lcnIoIkkvTyBlcnJvciBvY2N1cnJlZCB3aGVuIHZlcmlmeWlu
ZyBkYXRhIGNodW5rIEAgbmlkICVsbHUiLAotKwkJICBpbm9kZS0+bmlkIHwgMFVMTCk7Ci0rCXJl
dCA9IC1FSU87Ci0rCWdvdG8gb3V0OwotIH0KLSAKLSBzdGF0aWMgaW5saW5lIGludCBlcm9mc19l
eHRyYWN0X2RpcihzdHJ1Y3QgZXJvZnNfaW5vZGUgKmlub2RlKQotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJv
ZnMtdXRpbHMtZnNjay1ibG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAyLWVyb2ZzLXV0aWxz
LWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGYyZjFlMzQzNjguLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDItZXJvZnMtdXRpbHMtZnNjay1i
bG9jay1pbnNhbmUtbG9uZy1wYXRocy13aGVuLWV4dHJhYy5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDgwICswLDAgQEAKLUZyb20gNmNlYmZiYjc5YjFkNWQ4ZmViNDg4MDFlMTAwOGVlYTViZmE4
YjU5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEdhbyBYaWFuZyA8aHNpYW5na2Fv
QGxpbnV4LmFsaWJhYmEuY29tPgotRGF0ZTogRnJpLCAyIEp1biAyMDIzIDEzOjUyOjU2ICswODAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMi8yXSBlcm9mcy11dGlsczogZnNjazogYmxvY2sgaW5zYW5lIGxv
bmcgcGF0aHMgd2hlbgotIGV4dHJhY3RpbmcgaW1hZ2VzCi0KLVNpbmNlIHNvbWUgY3JhZnRlZCBF
Uk9GUyBmaWxlc3lzdGVtIGltYWdlcyBjb3VsZCBoYXZlIGluc2FuZSBkZWVwCi1oaWVyYXJjaHkg
KG9yIG1heSBmb3JtIGRpcmVjdG9yeSBsb29wcykgd2hpY2ggdHJpZ2dlcnMgdGhlCi1QQVRIX01B
WC1zaXplZCBwYXRoIGJ1ZmZlciBPUiBzdGFjayBvdmVyZmxvdy4KLQotQWN0dWFsbHkgc29tZSBj
cmFmdGVkIGltYWdlcyBjYW5ub3QgYmUgZGVlbWVkIGFzIHJlYWwgY29ycnVwdGVkCi1pbWFnZXMg
YnV0IG92ZXItUEFUSF9NQVggcGF0aHMgYXJlIG5vdCBzb21ldGhpbmcgdGhhdCB3ZSdkIGxpa2Ug
dG8KLXN1cHBvcnQgZm9yIG5vdy4KLQotQ1ZFOiBDVkUtMjAyMy0zMzU1MQotQ2xvc2VzOiBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMy0zMzU1MQotUmVwb3J0ZWQtYnk6
IENoYW9taW5nIFlhbmcgPGxvbWV0c2pAbGl2ZS5jb20+Ci1GaXhlczogZjQ0MDQzNTYxNDkxICgi
ZXJvZnMtdXRpbHM6IGludHJvZHVjZSBmc2NrLmVyb2ZzIikKLUZpeGVzOiBiMTFmODRmNTkzZjkg
KCJlcm9mcy11dGlsczogZnNjazogY29udmVydCB0byB1c2UgZXJvZnNfaXRlcmF0ZV9kaXIoKSIp
Ci1GaXhlczogNDEyYzhmOTA4MTMyICgiZXJvZnMtdXRpbHM6IGZzY2s6IGFkZCAtLWV4dHJhY3Q9
WCBzdXBwb3J0IHRvIGV4dHJhY3QgdG8gcGF0aCBYIikKLVNpZ25lby1vZmYtYnk6IEdhbyBYaWFu
ZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPgotTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIzMDYwMjA1NTI1Ni4xODA2MS0xLWhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNv
bQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGZzY2svbWFpbi5jIHwgMjMgKysrKysrKysr
KysrKysrLS0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKLWluZGV4
IDY2ODlhZDguLjI4ZDk1ZWMgMTAwNjQ0Ci0tLS0gYS9mc2NrL21haW4uYwotKysrIGIvZnNjay9t
YWluLmMKLUBAIC02ODAsMjggKzY4MCwzNSBAQCBhZ2FpbjoKLSBzdGF0aWMgaW50IGVyb2ZzZnNj
a19kaXJlbnRfaXRlcihzdHJ1Y3QgZXJvZnNfZGlyX2NvbnRleHQgKmN0eCkKLSB7Ci0gCWludCBy
ZXQ7Ci0tCXNpemVfdCBwcmV2X3BvcyA9IGZzY2tjZmcuZXh0cmFjdF9wb3M7Ci0rCXNpemVfdCBw
cmV2X3BvcywgY3Vycl9wb3M7Ci0gCi0gCWlmIChjdHgtPmRvdF9kb3Rkb3QpCi0gCQlyZXR1cm4g
MDsKLSAKLS0JaWYgKGZzY2tjZmcuZXh0cmFjdF9wYXRoKSB7Ci0tCQlzaXplX3QgY3Vycl9wb3Mg
PSBwcmV2X3BvczsKLSsJcHJldl9wb3MgPSBmc2NrY2ZnLmV4dHJhY3RfcG9zOwotKwljdXJyX3Bv
cyA9IHByZXZfcG9zOwotKwotKwlpZiAocHJldl9wb3MgKyBjdHgtPmRlX25hbWVsZW4gPj0gUEFU
SF9NQVgpIHsKLSsJCWVyb2ZzX2VycigidW5hYmxlIHRvIGZzY2sgc2luY2UgdGhlIHBhdGggaXMg
dG9vIGxvbmcgKCV1KSIsCi0rCQkJICBjdXJyX3BvcyArIGN0eC0+ZGVfbmFtZWxlbik7Ci0rCQly
ZXR1cm4gLUVPUE5PVFNVUFA7Ci0rCX0KLSAKLSsJaWYgKGZzY2tjZmcuZXh0cmFjdF9wYXRoKSB7
Ci0gCQlmc2NrY2ZnLmV4dHJhY3RfcGF0aFtjdXJyX3BvcysrXSA9ICcvJzsKLSAJCXN0cm5jcHko
ZnNja2NmZy5leHRyYWN0X3BhdGggKyBjdXJyX3BvcywgY3R4LT5kbmFtZSwKLSAJCQljdHgtPmRl
X25hbWVsZW4pOwotIAkJY3Vycl9wb3MgKz0gY3R4LT5kZV9uYW1lbGVuOwotIAkJZnNja2NmZy5l
eHRyYWN0X3BhdGhbY3Vycl9wb3NdID0gJ1wwJzsKLS0JCWZzY2tjZmcuZXh0cmFjdF9wb3MgPSBj
dXJyX3BvczsKLSsJfSBlbHNlIHsKLSsJCWN1cnJfcG9zICs9IGN0eC0+ZGVfbmFtZWxlbjsKLSAJ
fQotLQotKwlmc2NrY2ZnLmV4dHJhY3RfcG9zID0gY3Vycl9wb3M7Ci0gCXJldCA9IGVyb2ZzZnNj
a19jaGVja19pbm9kZShjdHgtPmRpci0+bmlkLCBjdHgtPmRlX25pZCk7Ci0gCi0tCWlmIChmc2Nr
Y2ZnLmV4dHJhY3RfcGF0aCkgewotKwlpZiAoZnNja2NmZy5leHRyYWN0X3BhdGgpCi0gCQlmc2Nr
Y2ZnLmV4dHJhY3RfcGF0aFtwcmV2X3Bvc10gPSAnXDAnOwotLQkJZnNja2NmZy5leHRyYWN0X3Bv
cyA9IHByZXZfcG9zOwotLQl9Ci0rCWZzY2tjZmcuZXh0cmFjdF9wb3MgPSBwcmV2X3BvczsKLSAJ
cmV0dXJuIHJldDsKLSB9Ci0gCi0tLSAKLTIuMzQuMQotCi0tIAoyLjM5LjIKCg==

--===============2086614651809651392==--

