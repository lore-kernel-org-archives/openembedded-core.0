Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 60E0B73174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745454"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:13 +0300
Message-Id: <1467101180-23116-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/10] libarchive: update to 3.2.1
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:37 -0000

Drop merged 0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...c-check-acl-libacl.h-and-sys-acl.h-based-.patch | 66 ----------------------
 .../{libarchive_3.2.0.bb => libarchive_3.2.1.bb}   |  5 +-
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.2.0.bb => libarchive_3.2.1.bb} (91%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch b/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
deleted file mode 100644
index 4b41d62..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From b30c530aaf5068a652a479f3e46c74eb1716861a Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 2 Jun 2016 16:08:02 +0300
-Subject: [PATCH] configure.ac: check acl/libacl.h and sys/acl.h based on
- requirement
-
-acl/libacl.h and sys/acl.h check should not happen when we explicitly
-disable it with --disable-acl.
-
-Similarly, update attr/xattr.h for --disable-xattr option.
-
-Update the help texts to reflect what it really does.
-
-Upstream-Status: Accepted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- configure.ac | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cb6943f..0638182 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -252,7 +252,7 @@ esac
- # Checks for header files.
- AC_HEADER_DIRENT
- AC_HEADER_SYS_WAIT
--AC_CHECK_HEADERS([acl/libacl.h attr/xattr.h copyfile.h ctype.h])
-+AC_CHECK_HEADERS([copyfile.h ctype.h])
- AC_CHECK_HEADERS([errno.h ext2fs/ext2_fs.h fcntl.h grp.h])
- 
- AC_CACHE_CHECK([whether EXT2_IOC_GETFLAGS is usable],
-@@ -272,7 +272,7 @@ AC_CHECK_HEADERS([linux/fiemap.h linux/fs.h linux/magic.h linux/types.h])
- AC_CHECK_HEADERS([locale.h paths.h poll.h pthread.h pwd.h])
- AC_CHECK_HEADERS([readpassphrase.h signal.h spawn.h])
- AC_CHECK_HEADERS([stdarg.h stdint.h stdlib.h string.h])
--AC_CHECK_HEADERS([sys/acl.h sys/cdefs.h sys/extattr.h])
-+AC_CHECK_HEADERS([sys/cdefs.h sys/extattr.h])
- AC_CHECK_HEADERS([sys/ioctl.h sys/mkdev.h sys/mount.h])
- AC_CHECK_HEADERS([sys/param.h sys/poll.h sys/select.h sys/statfs.h sys/statvfs.h])
- AC_CHECK_HEADERS([sys/time.h sys/utime.h sys/utsname.h sys/vfs.h])
-@@ -644,7 +644,7 @@ AC_CHECK_MEMBER(struct dirent.d_namlen,,,
- # Check for Extended Attributes support
- AC_ARG_ENABLE([xattr],
- 		AS_HELP_STRING([--disable-xattr],
--		[Enable Extended Attributes support (default: check)]))
-+		[Disable Extended Attributes support (default: check)]))
- 
- if test "x$enable_xattr" != "xno"; then
- 	AC_CHECK_HEADERS([attr/xattr.h])
-@@ -670,9 +670,10 @@ fi
- #
- AC_ARG_ENABLE([acl],
- 		AS_HELP_STRING([--disable-acl],
--		[Enable ACL support (default: check)]))
-+		[Disable ACL support (default: check)]))
- 
- if test "x$enable_acl" != "xno"; then
-+   AC_CHECK_HEADERS([acl/libacl.h])
-    AC_CHECK_HEADERS([sys/acl.h])
-    AC_CHECK_LIB([acl],[acl_get_file])
-    AC_CHECK_FUNCS([acl_create_entry acl_init acl_set_fd acl_set_fd_np acl_set_file])
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb b/meta/recipes-extended/libarchive/libarchive_3.2.1.bb
similarity index 91%
rename from meta/recipes-extended/libarchive/libarchive_3.2.0.bb
rename to meta/recipes-extended/libarchive/libarchive_3.2.1.bb
index f183b74..b65b5df 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.1.bb
@@ -32,11 +32,10 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch \
            "
 
-SRC_URI[md5sum] = "596210b5a9c2ff74a0f7ca34838d655f"
-SRC_URI[sha256sum] = "7bce45fd71ff01dc20d19edd78322d4965583d81b8bed8e26cacb65d6f5baa87"
+SRC_URI[md5sum] = "afa257047d1941a565216edbf0171e72"
+SRC_URI[sha256sum] = "72ee1a4e3fd534525f13a0ba1aa7b05b203d186e0c6072a8a4738649d0b3cfd2"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.8.1


