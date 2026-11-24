Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13151.1795505766475609485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=deNgISAi;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11369; q=dns/txt;
  s=iport01; t=1795505766; x=1796715366;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uZCyP0qde7IRo7lvffkLoQp3m3d3PTkLDNVCQwP8BBo=;
  b=deNgISAi4H5/vtLbH6DqcrdVcPu/aai72EJJjnJ8WlD1hsvTrIIEGsGV
   W73ERJCS/tmL/zvrriMlQv/ezmyEpbl1vAut2RhmICcYb7ouRo++ZNR3z
   aLrQFsDAJrMIx7M+gE4H1qdjM1p1P+95u+4yQgn04Uo+8ChvrPcJ2XPQ4
   fqtDXiEbsrvyYgvF80joKgIOTMcO0or/yPD+Lolzrh4Cd99GHI8W2Mism
   8b0DmfOAwbdlCDEQ3UFFAHLy3Xx+bXQUGxvq7utDfciUDg27UgxBMyVyz
   iDq5+46Ee+LaZ+IqIdzh33pQImLD4nFCMsv8Cfi03/phmNJ+T4P35EaL5
   g==;
X-CSE-ConnectionGUID: UWsCu4EdQbeOb2r5xKHmMA==
X-CSE-MsgGUID: XUfQs461R5q4OtNxGRg2Dw==
X-IPAS-Result: =?us-ascii?q?A0AnAABAPAVr/9RK/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKIbWyBFp0WgX4PAQEBD0QNBAEBhQWOJAImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDAQJaIyGDA?=
 =?us-ascii?q?gGCdAMRum2BeTOBAYMpAd0HAQsUAYE4AYVBiCRdGAGEfScbG4FygRWCdHaCY?=
 =?us-ascii?q?QQYgQ2GfwSCInoSgVQYBox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuM?=
 =?us-ascii?q?h2BIzsXgQcbBgWBHIEegRKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ+bgeUFIJNRgcBLE4TARMYF2QFGTQHa?=
 =?us-ascii?q?QuSdS48j1mCIZ5NgkQKKIN5jCSVOhozhVulF5kIjgqVdF2EaoFoPIFZcBWDI?=
 =?us-ascii?q?gkJQRkPji8ViHPJSCYyAgEBBzICBwIHDgMLkWiBHmABAQ?=
IronPort-Data: A9a23:nyy5GKl9I9ULQt29jfzJ8+Do5gyNJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXGGCafaPNGbyftpwaIXn/EIE65bXytA1HlZu/39hRltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbAn4c1qXUxCz
 PYVDzpXdE2TpMKz5ZvuH4GAhux7RCXqFIoSoDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQVUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGISNJoXVGZ0K9qqej
 lL78V3iXk9DDoGGlR2Z1GKDvOCVsTyuDer+E5X9rJaGmma7z2geGDUSVF2mveO+jE+uHd5SQ
 2QO+yEupLI+slS2VNX8UjW8oXiZrhAbRtxcGvE77wfLzbDbiy6eHmUCQztLZdAqucNzTjsw2
 3eNnsj1HnpoqLCTRHeX+7uYoD/0PjIaRVLufgcNQBFA55zop5s+y0uWCN1iC6WyyNbyHFkc3
 gy3kcT3vJ1L5eZj6klx1Qmvb+6EznQRcjMI2w==
IronPort-HdrOrdr: A9a23:++HN6q/B5p8yMbwcPDZuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AhqasvmsfdZS1uDdh2oibsFha6IsYTWb20Sv9L3a?=
 =?us-ascii?q?yBEFjEqfIWXyw/YZNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A5GJX9w+ST1BUlwCjWXLzYgKQf/dV7Z21VB5Uq8g?=
 =?us-ascii?q?f5+6YEzxfATjHoCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60417407"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 07:36:02 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 0C69F1800040B;
	Tue, 24 Nov 2026 07:36:02 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B1894CC1611; Mon, 23 Nov 2026 23:36:00 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH] acl: upgrade 2.3.2 -> 2.4.0
Date: Mon, 23 Nov 2026 23:35:57 -0800
Message-Id: <20261124073557.219159-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250963
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

Backport a patch to tar to avoid name clashes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2830d1319eec866947f4fa4a1ac16e2ea6584be5)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...0001-Avoid-acl_-prefix-for-functions.patch | 90 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         | 22 ++---
 ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 ----------
 ...isc.test-Don-t-mix-stdout-and-stderr.patch | 35 --------
 .../attr/{acl_2.3.2.bb => acl_2.4.0.bb}       |  4 +-
 5 files changed, 102 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
 rename meta/recipes-support/attr/{acl_2.3.2.bb => acl_2.4.0.bb} (90%)

diff --git a/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch b/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
new file mode 100644
index 00000000000..a736d5f2292
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
@@ -0,0 +1,90 @@
+From 78a6e620515a0ca7e3481a9d8277225c800262a7 Mon Sep 17 00:00:00 2001
+From: Pavel Cahyna <pcahyna@redhat.com>
+Date: Wed, 24 Jun 2026 18:45:30 +0200
+Subject: [PATCH] Avoid acl_ prefix for functions
+
+The acl.h header from libacl uses acl_ prefix for its functions. Avoid
+defining functions with the same name in order to protect its namespace.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=08c3fc2e9337094aff01a511170fd35fdb8f1ee3]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/xattrs.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/xattrs.c b/src/xattrs.c
+index 86a7e59..bf2c4f0 100644
+--- a/src/xattrs.c
++++ b/src/xattrs.c
+@@ -139,13 +139,13 @@ static struct
+ #ifdef HAVE_POSIX_ACLS
+ 
+ /* acl-at wrappers, TODO: move to gnulib in future? */
+-static acl_t acl_get_file_at (int, const char *, acl_type_t);
+-static int acl_set_file_at (int, const char *, acl_type_t, acl_t);
++static acl_t tar_acl_get_file_at (int, const char *, acl_type_t);
++static int tar_acl_set_file_at (int, const char *, acl_type_t, acl_t);
+ static int file_has_acl_at (int, char const *, struct stat const *);
+-static int acl_delete_def_file_at (int, char const *);
++static int tar_acl_delete_def_file_at (int, char const *);
+ 
+-/* acl_get_file_at */
+-#define AT_FUNC_NAME acl_get_file_at
++/* tar_acl_get_file_at */
++#define AT_FUNC_NAME tar_acl_get_file_at
+ #define AT_FUNC_RESULT acl_t
+ #define AT_FUNC_FAIL (acl_t)NULL
+ #define AT_FUNC_F1 acl_get_file
+@@ -159,8 +159,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_set_file_at */
+-#define AT_FUNC_NAME acl_set_file_at
++/* tar_acl_set_file_at */
++#define AT_FUNC_NAME tar_acl_set_file_at
+ #define AT_FUNC_F1 acl_set_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS   , acl_type_t type, acl_t acl
+ #define AT_FUNC_POST_FILE_ARGS          , type, acl
+@@ -170,8 +170,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_delete_def_file_at */
+-#define AT_FUNC_NAME acl_delete_def_file_at
++/* tar_acl_delete_def_file_at */
++#define AT_FUNC_NAME tar_acl_delete_def_file_at
+ #define AT_FUNC_F1 acl_delete_def_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS
+ #define AT_FUNC_POST_FILE_ARGS
+@@ -299,7 +299,7 @@ xattrs__acls_set (struct tar_stat_info const *st,
+       /* No "default" IEEE 1003.1e ACL set for directory.  At this moment,
+          FILE_NAME may already have inherited default acls from parent
+          directory;  clean them up. */
+-      if (acl_delete_def_file_at (chdir_fd, file_name))
++      if (tar_acl_delete_def_file_at (chdir_fd, file_name))
+         WARNOPT (WARN_XATTR_WRITE,
+                 (0, errno,
+                  _("acl_delete_def_file_at: Cannot drop default POSIX ACLs "
+@@ -316,7 +316,7 @@ xattrs__acls_set (struct tar_stat_info const *st,
+       return;
+     }
+ 
+-  if (acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
++  if (tar_acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
+     /* warn even if filesystem does not support acls */
+     WARNOPT (WARN_XATTR_WRITE,
+ 	     (0, errno,
+@@ -357,10 +357,10 @@ acls_get_text (int parentfd, const char *file_name, acl_type_t type,
+   char *val = NULL;
+   acl_t acl;
+ 
+-  if (!(acl = acl_get_file_at (parentfd, file_name, type)))
++  if (!(acl = tar_acl_get_file_at (parentfd, file_name, type)))
+     {
+       if (errno != ENOTSUP)
+-        call_arg_warn ("acl_get_file_at", file_name);
++        call_arg_warn ("tar_acl_get_file_at", file_name);
+       return;
+     }
+ 
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index d15e7f8a4e5..eb71863231a 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -6,7 +6,17 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://run-ptest \
+           file://0001-tests-fix-TESTSUITE_AT.patch \
+           file://0002-tests-check-for-recently-fixed-bug.patch \
+           file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
+           file://CVE-2026-5704-dependent_p1.patch \
+           file://CVE-2026-5704-dependent_p2.patch \
+           file://CVE-2026-5704.patch \
+           file://CVE-2026-5704-regression.patch \
+           file://0001-Avoid-acl_-prefix-for-functions.patch \
+           "
 
 SRC_URI[sha256sum] = "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd0f9ee7e690775985"
 
@@ -37,16 +47,6 @@ do_install:append:class-target() {
 }
 
 # add for ptest support
-SRC_URI += " \
-    file://run-ptest \
-    file://0001-tests-fix-TESTSUITE_AT.patch \
-    file://0002-tests-check-for-recently-fixed-bug.patch \
-    file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
-    file://CVE-2026-5704-dependent_p1.patch \
-    file://CVE-2026-5704-dependent_p2.patch \
-    file://CVE-2026-5704.patch \
-    file://CVE-2026-5704-regression.patch \
-"
 
 inherit ptest
 
diff --git a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch b/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
deleted file mode 100644
index 5052bdaa2f1..00000000000
--- a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 56abe432b65801f31277fb9a3bca0f9e31502315 Mon Sep 17 00:00:00 2001
-From: Matthias Gerstner <matthias.gerstner@suse.de>
-Date: Thu, 25 Apr 2024 12:43:49 +0200
-Subject: [PATCH] libmisc: __acl_get_uid(): fix memory wasting loop if user
- does not exist
-
-I noticed that `acl_from_text()` unexpectedly returns ENOMEM for invalid
-user names. The reason for this is a missing break statement in the for
-loop in `__acl_get_uid()`, which causes the loop to act as if ERANGE was
-returned from `getpwnam_r()`, thereby exponentially increasing the
-buffer size to (in my case) multiple gigabytes, until `grow_buffer()`
-reports ENOMEM, which terminates the `__acl_get_uid()` function.
-
-This is a pretty costly "no such user" lookup that can disturb a
-process's heap memory management, but can also cause a process to fail
-e.g. if it is multithreaded and other threads encounter an ENOMEM,
-before `__acl_get_uid()` frees the gigantic heap buffer and returns.
-The allocated memory isn't actually used. Therefore on Linux it should
-not affect other processes by default, due to its overcommit memory
-and lazy memory allocation strategy.
-
-Fix this by properly terminating the for loop on any conditions except
-an ERANGE error being reported. The same break statement correctly
-exists in `__acl_get_gid()` already.
-
-Fixes: 3737f00 ("use thread-safe getpwnam_r and getgrnam_r")
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libmisc/uid_gid_lookup.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libmisc/uid_gid_lookup.c b/libmisc/uid_gid_lookup.c
-index a4f21f6..74baab4 100644
---- a/libmisc/uid_gid_lookup.c
-+++ b/libmisc/uid_gid_lookup.c
-@@ -91,6 +91,7 @@ __acl_get_uid(const char *token, uid_t *uid_p)
- 		if (err == ERANGE)
- 			continue;
- 		errno = err ? err : EINVAL;
-+		break;
- 	}
- 	free(buffer);
- 	return result ? 0 : -1;
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch b/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
deleted file mode 100644
index 5aa3f3224cb..00000000000
--- a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 47f8039ec9bd08b629775c8e788d11e41fa95f14 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruenba@redhat.com>
-Date: Mon, 24 Mar 2025 21:14:09 +0100
-Subject: [PATCH] test/misc.test: Don't mix stdout and stderr
-
-In different environments, we may not get the stdout and stderr output
-in the order the run script expects, so check both separately.
-
-Fixes: https://savannah.nongnu.org/bugs/?66944
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- test/misc.test | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/test/misc.test b/test/misc.test
-index 06b3136..57c02e5 100644
---- a/test/misc.test
-+++ b/test/misc.test
-@@ -440,8 +440,9 @@ Dangling symlink test https://savannah.nongnu.org/bugs/?28131
- 	> other::r-x
- 	> 
- 	$ setfacl -R -m u:bin:rw d
--	$ getfacl -RL d
-+	$ getfacl -RL d > /dev/null
- 	> getfacl: d/b: No such file or directory
-+	$ getfacl -RL d 2> /dev/null
- 	> # file: d
- 	> # owner: %TUSER
- 	> # group: %TGROUP
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.4.0.bb
similarity index 90%
rename from meta/recipes-support/attr/acl_2.3.2.bb
rename to meta/recipes-support/attr/acl_2.4.0.bb
index a405cc2692e..ef9ee492a08 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.4.0.bb
@@ -16,11 +16,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
-           file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch \
-           file://0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
+SRC_URI[sha256sum] = "73c853c3d44e1f693e5a96a986f1bd19d3d0dac2c7d453e796177774bc4e5f6a"
 
 inherit autotools gettext ptest
 
-- 
2.35.6
