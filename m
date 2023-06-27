Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E073EEB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:06:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7390.1687849556199417331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tIfA/wDM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55427ce27d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35R5T7VW001078
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=w2W7k
	cbbqyp4Bk8lBuJ7gXREEJ5pcGz3FT8KP/YknoE=; b=tIfA/wDM29f2ylQTFHWF3
	P0O0waSQrpW6/r9lqLAH5V2ayyywTciVQU0DYFwq3l8T0u80coxjRP6A4VlChQMD
	QMKpfzHGebYeWNHqTo2WRzuDB9kov8pkn12BkCPKAe1nQa/iZk1MTj6oY0fxjUMO
	ZPhAYg+ofpilY35LlgAy4LinccrADiHwJoKjD5yGC+cB1sFnCPzuI3oN4d5qWVeJ
	6lv6tOt4sYEQ2EJKOB/LQxkxbLrYhwSfCaxirQdMa6shwBnpkQFwdX/CNzq8ApTk
	HFUh+v3EBgB+SBPzE5iEp6dUKIiDZyZSmjt3VQunAF4CkfcmIvS8dA9/jNaVrhYQ
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb2gwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:05:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 00:05:53 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 00:05:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 1/2] erofs-utils: update 1.5 -> 1.6
Date: Tue, 27 Jun 2023 15:05:51 +0800
Message-ID: <20230627070552.2017915-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EZgW8c4EmHHWa3YcSmXspEYRfttPcqop
X-Proofpoint-GUID: EZgW8c4EmHHWa3YcSmXspEYRfttPcqop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_04,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183440

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop patches merged upstream.

--enable-largefile is no longer necessary, as compiler options are being passed in explicitly.

(From OE-Core rev: 39d38b278cba7b46fd9b367e6f8c989327899e6f)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-configure-use-AC_SYS_LARGEFILE.patch |  43 -------
 ...eplace-l-stat64-by-equivalent-l-stat.patch | 109 ------------------
 ...-Make-LFS-mandatory-for-all-usecases.patch |  41 -------
 ...{erofs-utils_1.5.bb => erofs-utils_1.6.bb} |  10 +-
 4 files changed, 3 insertions(+), 200 deletions(-)
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
 delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.5.bb => erofs-utils_1.6.bb} (62%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
deleted file mode 100644
index 75c91f51a7..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use-AC_SYS_LARGEFILE.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fef3b16dba2c5f6ad88951b80cdfbedd423e80a0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Dec 2022 20:16:52 -0800
-Subject: [PATCH v3 1/3] configure: use AC_SYS_LARGEFILE
-
-The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=64
-where necessary to ensure that off_t and all interfaces using off_t
-are 64bit, even on 32bit systems.
-
-Pass -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=66 via CFLAGS
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-1-raj.khem@gmail.com/T/#t]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a736ff0..e8bb003 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,6 +13,8 @@ AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_AUX_DIR(config)
- AM_INIT_AUTOMAKE([foreign -Wall])
- 
-+AC_SYS_LARGEFILE
-+
- # Checks for programs.
- AM_PROG_AR
- AC_PROG_CC
-@@ -319,6 +321,9 @@ if test "x$enable_lzma" = "xyes"; then
-   CPPFLAGS="${saved_CPPFLAGS}"
- fi
- 
-+# Enable 64-bit off_t
-+CFLAGS+=" -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
-+
- # Set up needed symbols, conditionals and compiler/linker flags
- AM_CONDITIONAL([ENABLE_LZ4], [test "x${have_lz4}" = "xyes"])
- AM_CONDITIONAL([ENABLE_LZ4HC], [test "x${have_lz4hc}" = "xyes"])
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
deleted file mode 100644
index d12bebbf87..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 856189c324834b838f0e9cfc0d2e05f12518f264 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Dec 2022 22:17:35 -0800
-Subject: [PATCH v3 2/3] erofs: replace [l]stat64 by equivalent [l]stat
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-2-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/inode.c | 10 +++++-----
- lib/xattr.c |  4 ++--
- mkfs/main.c |  4 ++--
- 3 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/lib/inode.c b/lib/inode.c
-index f192510..38003fc 100644
---- a/lib/inode.c
-+++ b/lib/inode.c
-@@ -773,7 +773,7 @@ static u32 erofs_new_encode_dev(dev_t dev)
- 
- #ifdef WITH_ANDROID
- int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
--			       struct stat64 *st,
-+			       struct stat *st,
- 			       const char *path)
- {
- 	/* filesystem_config does not preserve file type bits */
-@@ -818,7 +818,7 @@ int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
- }
- #else
- static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
--				      struct stat64 *st,
-+				      struct stat *st,
- 				      const char *path)
- {
- 	return 0;
-@@ -826,7 +826,7 @@ static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
- #endif
- 
- static int erofs_fill_inode(struct erofs_inode *inode,
--			    struct stat64 *st,
-+			    struct stat *st,
- 			    const char *path)
- {
- 	int err = erofs_droid_inode_fsconfig(inode, st, path);
-@@ -910,7 +910,7 @@ static struct erofs_inode *erofs_new_inode(void)
- /* get the inode from the (source) path */
- static struct erofs_inode *erofs_iget_from_path(const char *path, bool is_src)
- {
--	struct stat64 st;
-+	struct stat st;
- 	struct erofs_inode *inode;
- 	int ret;
- 
-@@ -918,7 +918,7 @@ static struct erofs_inode *erofs_iget_from_path(const char *path, bool is_src)
- 	if (!is_src)
- 		return ERR_PTR(-EINVAL);
- 
--	ret = lstat64(path, &st);
-+	ret = lstat(path, &st);
- 	if (ret)
- 		return ERR_PTR(-errno);
- 
-diff --git a/lib/xattr.c b/lib/xattr.c
-index 71ffe3e..fd0e728 100644
---- a/lib/xattr.c
-+++ b/lib/xattr.c
-@@ -467,7 +467,7 @@ static int erofs_count_all_xattrs_from_path(const char *path)
- {
- 	int ret;
- 	DIR *_dir;
--	struct stat64 st;
-+	struct stat st;
- 
- 	_dir = opendir(path);
- 	if (!_dir) {
-@@ -502,7 +502,7 @@ static int erofs_count_all_xattrs_from_path(const char *path)
- 			goto fail;
- 		}
- 
--		ret = lstat64(buf, &st);
-+		ret = lstat(buf, &st);
- 		if (ret) {
- 			ret = -errno;
- 			goto fail;
-diff --git a/mkfs/main.c b/mkfs/main.c
-index d2c9830..5279805 100644
---- a/mkfs/main.c
-+++ b/mkfs/main.c
-@@ -581,7 +581,7 @@ int main(int argc, char **argv)
- 	struct erofs_buffer_head *sb_bh;
- 	struct erofs_inode *root_inode;
- 	erofs_nid_t root_nid;
--	struct stat64 st;
-+	struct stat st;
- 	erofs_blk_t nblocks;
- 	struct timeval t;
- 	char uuid_str[37] = "not available";
-@@ -609,7 +609,7 @@ int main(int argc, char **argv)
- 			return 1;
- 	}
- 
--	err = lstat64(cfg.c_src_path, &st);
-+	err = lstat(cfg.c_src_path, &st);
- 	if (err)
- 		return 1;
- 	if (!S_ISDIR(st.st_mode)) {
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch b/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
deleted file mode 100644
index 97faa5d673..0000000000
--- a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8f8cbc7b773da63bce8226249784ba6824635c9c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Dec 2022 20:19:27 -0800
-Subject: [PATCH v3 3/3] internal.h: Make LFS mandatory for all usecases
-
-erosfs depend on the consistent use of a 64bit offset
-type, force downstreams to use transparent LFS (_FILE_OFFSET_BITS=64),
-so that it becomes impossible for them to use 32bit interfaces.
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221215064758.93821-3-raj.khem@gmail.com/T/#u]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/erofs/internal.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/include/erofs/internal.h b/include/erofs/internal.h
-index 6a70f11..d3b2986 100644
---- a/include/erofs/internal.h
-+++ b/include/erofs/internal.h
-@@ -21,6 +21,7 @@ typedef unsigned short umode_t;
- 
- #include "erofs_fs.h"
- #include <fcntl.h>
-+#include <sys/types.h> /* for off_t definition */
- 
- #ifndef PATH_MAX
- #define PATH_MAX        4096    /* # chars in a path name including nul */
-@@ -104,6 +105,10 @@ struct erofs_sb_info {
- 	};
- };
- 
-+
-+/* make sure that any user of the erofs headers has atleast 64bit off_t type */
-+extern int erofs_assert_largefile[sizeof(off_t)-8];
-+
- /* global sbi */
- extern struct erofs_sb_info sbi;
- 
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
similarity index 62%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
index 2b5861882d..43643e07bb 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
@@ -5,12 +5,8 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "a2821a66b42aee5430bccee82c280e38d1e9ab29"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
-           file://0001-configure-use-AC_SYS_LARGEFILE.patch \
-           file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch \
-           file://0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch \
-           "
+SRCREV = "21710612d35cd952490959bfa6ea9fe87aaa52dd"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
@@ -23,7 +19,7 @@ inherit pkgconfig autotools
 PACKAGECONFIG ??= "lz4"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 
-EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse --enable-largefile"
+EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
 CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"
 
-- 
2.25.1


