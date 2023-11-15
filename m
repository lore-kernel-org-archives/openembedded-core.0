Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF66C54F4F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14622.1700059030012817962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M7hk4zqt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k9OA96hZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a1e62-d854f312-38de-464b-baca-27ac4b38e06c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=C2iQig/IBUFnJh5oxLUzNdABgtHPcxXaQfXTqM7bFlo=;
	b=M7hk4zqtQYo33XYARdwN9MgjtkIRh4CluzJA/O6Ocwwt2uH2L/+OuAVbudVhyxbL
	ErT75En6yf/N9kq84F57Pkw9ZmOQg9MqowBVrTm2SC8Pk0OC+SLpFvRQZZ9Z0Ae6DS/
	SmSfaH+P9GQEG3++sPYL4oOgNLLghpl+uWddNNlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=C2iQig/IBUFnJh5oxLUzNdABgtHPcxXaQfXTqM7bFlo=;
	b=k9OA96hZSZaLOrst8yzhgUXe0hapanFYbtMlw5NZmQx/+4EBPY4oN9RI5OqAY6Tz
	hANgRHGmbhwTU9XmsyuG1bkW6Cwey5lj1VMkQW4bCRFrtcZvSW4xhu0rPe85KuGMh6q
	ER/EZbnPLSBmFjE0NWcVJvOWM/Qi9XjJ9mS+tYWw=
Content-Type: multipart/mixed; boundary="===============2695876624730036733=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.7.1 FAILED
Message-ID: <0101018bd36a1e62-d854f312-38de-464b-baca-27ac4b38e06c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190623

--===============2695876624730036733==
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
From 4f0b7744fee5f8a1004f348ce7c4e896f7d76efe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 06:27:04 +0000
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


--===============2695876624730036733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-c600c066564fd5265e53f6ca6b7a30d74cb4634c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c600c066564fd5265e53f6ca6b7a30d74cb4634c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 82 Local 70 Mirrors 0 Missed 12 Current 223 (85% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 229 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.9.4.bb:do_create_spdx_setscene)
NOTE: Running task 658 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_recipe_qa)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 270 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 271 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe erofs-utils-1.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_recipe_qa unihash changed to 413acecbec27060a00d7aa1b108a813d722a873288c35b8a7ee886477ebe7075
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 273 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 709 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 275 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe erofs-utils-1.7.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 710 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 279 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe erofs-utils-1.7.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 286 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 724 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_patch)
NOTE: Running setscene task 295 of 305 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe erofs-utils-1.7.1-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 792 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 793 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_populate_lic)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe erofs-utils-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_populate_lic: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_populate_lic unihash changed to 80059d7dad22605009acd8731c9fac0770c4039aa733b3cdf88c87d4e5c8c960
NOTE: recipe erofs-utils-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_deploy_source_date_epoch unihash changed to b865e8b1b5ac4d67d79d1fa56973a4944291e24aef7cb30eb95cf74e508276c1
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 895 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 906 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe erofs-utils-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe erofs-utils-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe erofs-utils-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 907 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure)
NOTE: recipe erofs-utils-1.7.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/aut
 oconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'util-linux-libuuid', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'lz4', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'attr-native', 'texinfo-dummy-native', 'binutils-cross-x86_64', 'linux-libc-headers', 'm4-native', 'gnu-config-native', 'zstd-native', 'zlib-native', 'gmp-native', 'flex-native', 'mpfr-native', 'xz-native', 'libmpc-native', 'libgcc', 'gettext-minimal-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/share/aclocal/ --force
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
| NOTE: Running ../git/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot  --enable-lz4 --disable-fuse --disable-static  --enable-lz4
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... none
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking the archiver (x86_64-poky-linux-gcc-ar) interface... ar
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
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
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot options needed to detect all undeclared functions... none needed
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
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/recipe-sysroot-native/usr/bin/pkg-config
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
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996, line 289
NOTE: recipe erofs-utils-1.7.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 907 tasks of which 898 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115062636.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115062636.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: erofs-utils-1.7.1-r0 do_configure: configure failed
ERROR: erofs-utils-1.7.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/run.do_configure.1587996', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/erofs-utils/1.7.1/temp/log.do_configure.1587996
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/erofs-utils/erofs-utils_1.7.1.bb:do_configure) failed with exit code '1'

--===============2695876624730036733==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.6-1.7.1.patch"

RnJvbSA0ZjBiNzc0NGZlZTVmOGExMDA0ZjM0OGNlN2M0ZTg5NmY3ZDc2ZWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDY6Mjc6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjYgLT4gMS43LjEKCi0tLQogLi4ucm9mcy11dGlsc18xLjYu
YmIgPT4gZXJvZnMtdXRpbHNfMS43LjEuYmJ9IHwgICA3ICstCiAuLi4tZG9uLXQtYWxsb2NhdGUt
cmVhZC10b28tbGFyZ2UtZXh0ZW4ucGF0Y2ggfCAxMjYgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4t
YmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2ggfCAgODAgLS0tLS0tLS0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMTEgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL3tlcm9mcy11dGlsc18xLjYu
YmIgPT4gZXJvZnMtdXRpbHNfMS43LjEuYmJ9ICg3MyUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDEtZXJvZnMtdXRpbHMtZnNj
ay1kb24tdC1hbGxvY2F0ZS1yZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaAogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAyLWVyb2Zz
LXV0aWxzLWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2gKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNf
MS42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjcuMS5iYgppbmRleCA1YTg5ZTRi
OGVlLi40YzUxYzg0YWIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMt
dXRpbHMvZXJvZnMtdXRpbHNfMS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9m
cy11dGlscy9lcm9mcy11dGlsc18xLjcuMS5iYgpAQCAtNSwxMSArNSw4IEBAIFNFQ1RJT04gPSAi
YmFzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTczMDAxZDgwNGVh
MWUzZDg0MzY1ZjY1MjI0MmNjYTIwIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0L3RyZWUvUkVB
RE1FIgogCi1TUkNSRVYgPSAiMjE3MTA2MTJkMzVjZDk1MjQ5MDk1OWJmYTZlYTlmZTg3YWFhNTJk
ZCIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtZXJvZnMtdXRpbHMtZnNjay1kb24tdC1hbGxvY2F0ZS1y
ZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAyLWVyb2Zz
LXV0aWxzLWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2ggXAot
IgorU1JDUkVWID0gIjgzZDk0ZGM2MTkwNzVlNzFjYTRkMGY0Mjk0MWNmYzE4ZDI2OWEyYWYiCitT
UkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC94
aWFuZy9lcm9mcy11dGlscy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIAogVVBT
VFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPihcZCsoXC5cZCspKykpIgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1l
cm9mcy11dGlscy1mc2NrLWRvbi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2ZpbGVzLzAwMDEtZXJvZnMtdXRp
bHMtZnNjay1kb24tdC1hbGxvY2F0ZS1yZWFkLXRvby1sYXJnZS1leHRlbi5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNTJmNDc1ZGM0Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMS1lcm9mcy11dGlscy1mc2Nr
LWRvbi10LWFsbG9jYXRlLXJlYWQtdG9vLWxhcmdlLWV4dGVuLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMTI2ICswLDAgQEAKLUZyb20gYzc2OTgwNWM3OWQ1YWNlZGU2NWQ5NmU1Nzg2YWE1ZWJi
NDZjMDFlMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEdhbyBYaWFuZyA8aHNpYW5n
a2FvQGxpbnV4LmFsaWJhYmEuY29tPgotRGF0ZTogRnJpLCAyIEp1biAyMDIzIDExOjA1OjE5ICsw
ODAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBlcm9mcy11dGlsczogZnNjazogZG9uJ3QgYWxsb2Nh
dGUvcmVhZCB0b28gbGFyZ2UgZXh0ZW50cwotCi1TaW5jZSBzb21lIGNyYWZ0ZWQgRVJPRlMgZmls
ZXN5c3RlbSBpbWFnZXMgY291bGQgaGF2ZSBpbnNhbmUgbGFyZ2UKLWV4dGVudHMsIHdoaWNoIGNh
dXNlcyB1bmV4cGVjdGVkIGJhaGF2aW9ycyB3aGVuIGV4dHJhY3RpbmcgZGF0YS4KLQotRml4IGl0
IGJ5IGV4dHJhY3RpbmcgbGFyZ2UgZXh0ZW50cyB3aXRoIGEgYnVmZmVyIG9mIGEgcmVhc29uYWJs
ZQotbWF4aW11bSBzaXplIGxpbWl0IGFuZCByZWFkaW5nIG11bHRpcGxlIHRpbWVzIGluc3RlYWQu
Ci0KLU5vdGUgdGhhdCBvbmx5IGAtLWV4dHJhY3RgIG9wdGlvbiBpcyBpbXBhY3RlZC4KLQotQ1ZF
OiBDVkUtMjAyMy0zMzU1MgotQ2xvc2VzOiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFp
bC9DVkUtMjAyMy0zMzU1MgotUmVwb3J0ZWQtYnk6IENoYW9taW5nIFlhbmcgPGxvbWV0c2pAbGl2
ZS5jb20+Ci1GaXhlczogNDEyYzhmOTA4MTMyICgiZXJvZnMtdXRpbHM6IGZzY2s6IGFkZCAtLWV4
dHJhY3Q9WCBzdXBwb3J0IHRvIGV4dHJhY3QgdG8gcGF0aCBYIikKLVNpZ25lZC1vZmYtYnk6IEdh
byBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEuY29tPgotTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIzMDYwMjAzMDUxOS4xMTcwNzEtMS1oc2lhbmdrYW9AbGludXguYWxp
YmFiYS5jb20KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBmc2NrL21haW4uYyB8IDYzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCi0gMSBm
aWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4uYwotaW5kZXggNmI0MjI1Mi4uNjY4OWFkOCAx
MDA2NDQKLS0tLSBhL2ZzY2svbWFpbi5jCi0rKysgYi9mc2NrL21haW4uYwotQEAgLTM5Miw2ICsz
OTIsOCBAQCBzdGF0aWMgaW50IGVyb2ZzX3ZlcmlmeV9pbm9kZV9kYXRhKHN0cnVjdCBlcm9mc19p
bm9kZSAqaW5vZGUsIGludCBvdXRmZCkKLSAJfQotIAotIAl3aGlsZSAocG9zIDwgaW5vZGUtPmlf
c2l6ZSkgewotKwkJdW5zaWduZWQgaW50IGFsbG9jX3Jhd3NpemU7Ci0rCi0gCQltYXAubV9sYSA9
IHBvczsKLSAJCWlmIChjb21wcmVzc2VkKQotIAkJCXJldCA9IHpfZXJvZnNfbWFwX2Jsb2Nrc19p
dGVyKGlub2RlLCAmbWFwLAotQEAgLTQyMCwxMCArNDIyLDI4IEBAIHN0YXRpYyBpbnQgZXJvZnNf
dmVyaWZ5X2lub2RlX2RhdGEoc3RydWN0IGVyb2ZzX2lub2RlICppbm9kZSwgaW50IG91dGZkKQot
IAkJaWYgKCEobWFwLm1fZmxhZ3MgJiBFUk9GU19NQVBfTUFQUEVEKSB8fCAhZnNja2NmZy5jaGVj
a19kZWNvbXApCi0gCQkJY29udGludWU7Ci0gCi0tCQlpZiAobWFwLm1fcGxlbiA+IHJhd19zaXpl
KSB7Ci0tCQkJcmF3X3NpemUgPSBtYXAubV9wbGVuOwotLQkJCXJhdyA9IHJlYWxsb2MocmF3LCBy
YXdfc2l6ZSk7Ci0tCQkJQlVHX09OKCFyYXcpOwotKwkJaWYgKG1hcC5tX3BsZW4gPiBaX0VST0ZT
X1BDTFVTVEVSX01BWF9TSVpFKSB7Ci0rCQkJaWYgKGNvbXByZXNzZWQpIHsKLSsJCQkJZXJvZnNf
ZXJyKCJpbnZhbGlkIHBjbHVzdGVyIHNpemUgJSIgUFJJdTY0ICIgQCBvZmZzZXQgJSIgUFJJdTY0
ICIgb2YgbmlkICUiIFBSSXU2NCwKLSsJCQkJCSAgbWFwLm1fcGxlbiwgbWFwLm1fbGEsCi0rCQkJ
CQkgIGlub2RlLT5uaWQgfCAwVUxMKTsKLSsJCQkJcmV0ID0gLUVGU0NPUlJVUFRFRDsKLSsJCQkJ
Z290byBvdXQ7Ci0rCQkJfQotKwkJCWFsbG9jX3Jhd3NpemUgPSBaX0VST0ZTX1BDTFVTVEVSX01B
WF9TSVpFOwotKwkJfSBlbHNlIHsKLSsJCQlhbGxvY19yYXdzaXplID0gbWFwLm1fcGxlbjsKLSsJ
CX0KLSsKLSsJCWlmIChhbGxvY19yYXdzaXplID4gcmF3X3NpemUpIHsKLSsJCQljaGFyICpuZXdy
YXcgPSByZWFsbG9jKHJhdywgYWxsb2NfcmF3c2l6ZSk7Ci0rCi0rCQkJaWYgKCFuZXdyYXcpIHsK
LSsJCQkJcmV0ID0gLUVOT01FTTsKLSsJCQkJZ290byBvdXQ7Ci0rCQkJfQotKwkJCXJhdyA9IG5l
d3JhdzsKLSsJCQlyYXdfc2l6ZSA9IGFsbG9jX3Jhd3NpemU7Ci0gCQl9Ci0gCi0gCQlpZiAoY29t
cHJlc3NlZCkgewotQEAgLTQzNCwxOCArNDU0LDI3IEBAIHN0YXRpYyBpbnQgZXJvZnNfdmVyaWZ5
X2lub2RlX2RhdGEoc3RydWN0IGVyb2ZzX2lub2RlICppbm9kZSwgaW50IG91dGZkKQotIAkJCX0K
LSAJCQlyZXQgPSB6X2Vyb2ZzX3JlYWRfb25lX2RhdGEoaW5vZGUsICZtYXAsIHJhdywgYnVmZmVy
LAotIAkJCQkJCSAgICAwLCBtYXAubV9sbGVuLCBmYWxzZSk7Ci0rCQkJaWYgKHJldCkKLSsJCQkJ
Z290byBvdXQ7Ci0rCi0rCQkJaWYgKG91dGZkID49IDAgJiYgd3JpdGUob3V0ZmQsIGJ1ZmZlciwg
bWFwLm1fbGxlbikgPCAwKQotKwkJCQlnb3RvIGZhaWxfZWlvOwotIAkJfSBlbHNlIHsKLS0JCQly
ZXQgPSBlcm9mc19yZWFkX29uZV9kYXRhKCZtYXAsIHJhdywgMCwgbWFwLm1fcGxlbik7Ci0tCQl9
Ci0tCQlpZiAocmV0KQotLQkJCWdvdG8gb3V0OwotKwkJCXU2NCBwID0gMDsKLSAKLS0JCWlmIChv
dXRmZCA+PSAwICYmIHdyaXRlKG91dGZkLCBjb21wcmVzc2VkID8gYnVmZmVyIDogcmF3LAotLQkJ
CQkJbWFwLm1fbGxlbikgPCAwKSB7Ci0tCQkJZXJvZnNfZXJyKCJJL08gZXJyb3Igb2NjdXJyZWQg
d2hlbiB2ZXJpZnlpbmcgZGF0YSBjaHVuayBAIG5pZCAlbGx1IiwKLS0JCQkJICBpbm9kZS0+bmlk
IHwgMFVMTCk7Ci0tCQkJcmV0ID0gLUVJTzsKLS0JCQlnb3RvIG91dDsKLSsJCQlkbyB7Ci0rCQkJ
CXU2NCBjb3VudCA9IG1pbl90KHU2NCwgYWxsb2NfcmF3c2l6ZSwKLSsJCQkJCQkgIG1hcC5tX2xs
ZW4pOwotKwotKwkJCQlyZXQgPSBlcm9mc19yZWFkX29uZV9kYXRhKCZtYXAsIHJhdywgcCwgY291
bnQpOwotKwkJCQlpZiAocmV0KQotKwkJCQkJZ290byBvdXQ7Ci0rCi0rCQkJCWlmIChvdXRmZCA+
PSAwICYmIHdyaXRlKG91dGZkLCByYXcsIGNvdW50KSA8IDApCi0rCQkJCQlnb3RvIGZhaWxfZWlv
OwotKwkJCQltYXAubV9sbGVuIC09IGNvdW50OwotKwkJCQlwICs9IGNvdW50OwotKwkJCX0gd2hp
bGUgKG1hcC5tX2xsZW4pOwotIAkJfQotIAl9Ci0gCi1AQCAtNDYwLDYgKzQ4OSwxMiBAQCBvdXQ6
Ci0gCWlmIChidWZmZXIpCi0gCQlmcmVlKGJ1ZmZlcik7Ci0gCXJldHVybiByZXQgPCAwID8gcmV0
IDogMDsKLSsKLStmYWlsX2VpbzoKLSsJZXJvZnNfZXJyKCJJL08gZXJyb3Igb2NjdXJyZWQgd2hl
biB2ZXJpZnlpbmcgZGF0YSBjaHVuayBAIG5pZCAlbGx1IiwKLSsJCSAgaW5vZGUtPm5pZCB8IDBV
TEwpOwotKwlyZXQgPSAtRUlPOwotKwlnb3RvIG91dDsKLSB9Ci0gCi0gc3RhdGljIGlubGluZSBp
bnQgZXJvZnNfZXh0cmFjdF9kaXIoc3RydWN0IGVyb2ZzX2lub2RlICppbm9kZSkKLS0tIAotMi4z
NC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxl
cy8wMDAyLWVyb2ZzLXV0aWxzLWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRy
YWMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZmlsZXMvMDAwMi1l
cm9mcy11dGlscy1mc2NrLWJsb2NrLWluc2FuZS1sb25nLXBhdGhzLXdoZW4tZXh0cmFjLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmMmYxZTM0MzY4Li4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9maWxlcy8wMDAyLWVyb2ZzLXV0
aWxzLWZzY2stYmxvY2staW5zYW5lLWxvbmctcGF0aHMtd2hlbi1leHRyYWMucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSw4MCArMCwwIEBACi1Gcm9tIDZjZWJmYmI3OWIxZDVkOGZlYjQ4ODAxZTEw
MDhlZWE1YmZhOGI1OTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBHYW8gWGlhbmcg
PGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4KLURhdGU6IEZyaSwgMiBKdW4gMjAyMyAxMzo1
Mjo1NiArMDgwMAotU3ViamVjdDogW1BBVENIIDIvMl0gZXJvZnMtdXRpbHM6IGZzY2s6IGJsb2Nr
IGluc2FuZSBsb25nIHBhdGhzIHdoZW4KLSBleHRyYWN0aW5nIGltYWdlcwotCi1TaW5jZSBzb21l
IGNyYWZ0ZWQgRVJPRlMgZmlsZXN5c3RlbSBpbWFnZXMgY291bGQgaGF2ZSBpbnNhbmUgZGVlcAot
aGllcmFyY2h5IChvciBtYXkgZm9ybSBkaXJlY3RvcnkgbG9vcHMpIHdoaWNoIHRyaWdnZXJzIHRo
ZQotUEFUSF9NQVgtc2l6ZWQgcGF0aCBidWZmZXIgT1Igc3RhY2sgb3ZlcmZsb3cuCi0KLUFjdHVh
bGx5IHNvbWUgY3JhZnRlZCBpbWFnZXMgY2Fubm90IGJlIGRlZW1lZCBhcyByZWFsIGNvcnJ1cHRl
ZAotaW1hZ2VzIGJ1dCBvdmVyLVBBVEhfTUFYIHBhdGhzIGFyZSBub3Qgc29tZXRoaW5nIHRoYXQg
d2UnZCBsaWtlIHRvCi1zdXBwb3J0IGZvciBub3cuCi0KLUNWRTogQ1ZFLTIwMjMtMzM1NTEKLUNs
b3NlczogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtMzM1NTEKLVJl
cG9ydGVkLWJ5OiBDaGFvbWluZyBZYW5nIDxsb21ldHNqQGxpdmUuY29tPgotRml4ZXM6IGY0NDA0
MzU2MTQ5MSAoImVyb2ZzLXV0aWxzOiBpbnRyb2R1Y2UgZnNjay5lcm9mcyIpCi1GaXhlczogYjEx
Zjg0ZjU5M2Y5ICgiZXJvZnMtdXRpbHM6IGZzY2s6IGNvbnZlcnQgdG8gdXNlIGVyb2ZzX2l0ZXJh
dGVfZGlyKCkiKQotRml4ZXM6IDQxMmM4ZjkwODEzMiAoImVyb2ZzLXV0aWxzOiBmc2NrOiBhZGQg
LS1leHRyYWN0PVggc3VwcG9ydCB0byBleHRyYWN0IHRvIHBhdGggWCIpCi1TaWduZW8tb2ZmLWJ5
OiBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4KLUxpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMzA2MDIwNTUyNTYuMTgwNjEtMS1oc2lhbmdrYW9AbGludXgu
YWxpYmFiYS5jb20KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBmc2NrL21haW4uYyB8IDIz
ICsrKysrKysrKysrKysrKy0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFp
bi5jCi1pbmRleCA2Njg5YWQ4Li4yOGQ5NWVjIDEwMDY0NAotLS0tIGEvZnNjay9tYWluLmMKLSsr
KyBiL2ZzY2svbWFpbi5jCi1AQCAtNjgwLDI4ICs2ODAsMzUgQEAgYWdhaW46Ci0gc3RhdGljIGlu
dCBlcm9mc2ZzY2tfZGlyZW50X2l0ZXIoc3RydWN0IGVyb2ZzX2Rpcl9jb250ZXh0ICpjdHgpCi0g
ewotIAlpbnQgcmV0OwotLQlzaXplX3QgcHJldl9wb3MgPSBmc2NrY2ZnLmV4dHJhY3RfcG9zOwot
KwlzaXplX3QgcHJldl9wb3MsIGN1cnJfcG9zOwotIAotIAlpZiAoY3R4LT5kb3RfZG90ZG90KQot
IAkJcmV0dXJuIDA7Ci0gCi0tCWlmIChmc2NrY2ZnLmV4dHJhY3RfcGF0aCkgewotLQkJc2l6ZV90
IGN1cnJfcG9zID0gcHJldl9wb3M7Ci0rCXByZXZfcG9zID0gZnNja2NmZy5leHRyYWN0X3BvczsK
LSsJY3Vycl9wb3MgPSBwcmV2X3BvczsKLSsKLSsJaWYgKHByZXZfcG9zICsgY3R4LT5kZV9uYW1l
bGVuID49IFBBVEhfTUFYKSB7Ci0rCQllcm9mc19lcnIoInVuYWJsZSB0byBmc2NrIHNpbmNlIHRo
ZSBwYXRoIGlzIHRvbyBsb25nICgldSkiLAotKwkJCSAgY3Vycl9wb3MgKyBjdHgtPmRlX25hbWVs
ZW4pOwotKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwotKwl9Ci0gCi0rCWlmIChmc2NrY2ZnLmV4dHJh
Y3RfcGF0aCkgewotIAkJZnNja2NmZy5leHRyYWN0X3BhdGhbY3Vycl9wb3MrK10gPSAnLyc7Ci0g
CQlzdHJuY3B5KGZzY2tjZmcuZXh0cmFjdF9wYXRoICsgY3Vycl9wb3MsIGN0eC0+ZG5hbWUsCi0g
CQkJY3R4LT5kZV9uYW1lbGVuKTsKLSAJCWN1cnJfcG9zICs9IGN0eC0+ZGVfbmFtZWxlbjsKLSAJ
CWZzY2tjZmcuZXh0cmFjdF9wYXRoW2N1cnJfcG9zXSA9ICdcMCc7Ci0tCQlmc2NrY2ZnLmV4dHJh
Y3RfcG9zID0gY3Vycl9wb3M7Ci0rCX0gZWxzZSB7Ci0rCQljdXJyX3BvcyArPSBjdHgtPmRlX25h
bWVsZW47Ci0gCX0KLS0KLSsJZnNja2NmZy5leHRyYWN0X3BvcyA9IGN1cnJfcG9zOwotIAlyZXQg
PSBlcm9mc2ZzY2tfY2hlY2tfaW5vZGUoY3R4LT5kaXItPm5pZCwgY3R4LT5kZV9uaWQpOwotIAot
LQlpZiAoZnNja2NmZy5leHRyYWN0X3BhdGgpIHsKLSsJaWYgKGZzY2tjZmcuZXh0cmFjdF9wYXRo
KQotIAkJZnNja2NmZy5leHRyYWN0X3BhdGhbcHJldl9wb3NdID0gJ1wwJzsKLS0JCWZzY2tjZmcu
ZXh0cmFjdF9wb3MgPSBwcmV2X3BvczsKLS0JfQotKwlmc2NrY2ZnLmV4dHJhY3RfcG9zID0gcHJl
dl9wb3M7Ci0gCXJldHVybiByZXQ7Ci0gfQotIAotLS0gCi0yLjM0LjEKLQotLSAKMi4zOS4yCgo=

--===============2695876624730036733==--

