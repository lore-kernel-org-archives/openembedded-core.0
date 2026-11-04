Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2486.1793771621850235679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PkhNg39E;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6302; q=dns/txt;
  s=iport01; t=1793771621; x=1794981221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vhOcxDwaxGvCLRwvwddrl/bqIRNvtiEY5DJD2AfSULo=;
  b=PkhNg39EICR/5sTRYzoB2iAY3xAjBV3o+uf1+ADZqLlridzKemCjt1IE
   AH3/TyRqC7W9bKZgXV5EoQXELQgW3Jhip1ssuvPLY4a6CH48f7Rb1qC9d
   SYgovffFqSbXV8hWvlJPpGx3c6EfGv2CxD8RSr3sqZQz2R0pGNkqm1tBa
   jqgDm3crDfUurhrcu+Ca4aP5doPMjGzTWEfHh50O3p0oF8lDoTJlbGc2h
   k+6U5WJvv92nr/jOp9foT04FZcTD8mns0reJD6f8Z6M8l0QcLCL7EAdmy
   npqDIWiW55HUQ99pi3FBrCwbMNe5xMQqeaWJT31ZT+6vrHWTX9Ll0DlPG
   w==;
X-CSE-ConnectionGUID: br5fLyasThmFLH9FRZ+u6w==
X-CSE-MsgGUID: JNJgRv6iS6eaUxoSGTd9Dg==
X-IPAS-Result: =?us-ascii?q?A0BJAgCOx+pq/43/Ja1aFoJDgld1YENJA5ZIA54ggX4PA?=
 =?us-ascii?q?QEBDy4GHQQBAYUFAo4cAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAwExAUYQHAMBAi8nBCMIGYMCAYJ0AxG6QYIsgQGEf?=
 =?us-ascii?q?tszAQsUAYE4hUCII10ZhH0nGxuBcoEVg2mCYQEDGIgMBIIigQyBWhhrCYwPA?=
 =?us-ascii?q?ohCSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddg?=
 =?us-ascii?q?SsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/F?=
 =?us-ascii?q?QxmCxoFYQgCDQx0ORAwHiQvBRwmQBsKFBgNSBEsNxUZBD5uB5ItgxABgQ4BK?=
 =?us-ascii?q?4FUWBGTAC6QFoIhoREKKIN4jCSNPod8GjOpS4EmmQiOChaVU2iEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+SJIUTyUgmMgIBAQcDLwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:nWEJDKrL6D9Px/pdMFt44253YWZeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmDbKqCZWXxft5xbYi1ph9T7JHdndIwQFZtpS1hESJD8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8Eg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uxtXG9q5
 PUDFDAIQDSj1syM8vGmFPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXGZ4EwB/G+
 z6uE2LRIDc4O+aBlzu+rH+lu//IpgzHVNM+G+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:ril/3a+30KIitaVQp1Ruk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:xg8lZmwzOSe0Et7pwKqkBgUeAJ0rVmzU10vQJmGcKTdHco/WVAGPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A8dHQ8wzpwavsZk7/UebKH5s4JX+aqIaIKk83j8s?=
 =?us-ascii?q?HgJeJPBFgPAyysDjmboByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543961654"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 05:53:40 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B5010180005CE;
	Wed,  4 Nov 2026 05:53:40 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5C1A9CBF201; Tue,  3 Nov 2026 21:53:40 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/3] tar: avoid name conflicts with new libacl APIs
Date: Tue,  3 Nov 2026 21:53:33 -0800
Message-Id: <20261104055335.2080900-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104055335.2080900-1-dkelaiya@cisco.com>
References: <20261104055335.2080900-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249326
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

The following CVE-2026-54369 backport introduces public libacl
acl_get_file_at(), acl_set_file_at() and acl_delete_def_file_at()
declarations that conflict with GNU tar 1.35's private helpers.

Backport upstream commit 08c3fc2e9337094aff01a511170fd35fdb8f1ee3
to rename tar's helpers and their callers to tar_acl_* names.
Adapt the calls to tar 1.35's existing directory-fd interface.

Apply this compatibility change before introducing the new libacl
declarations so ACL-enabled tar continues to compile. The upstream
announcement explicitly identifies this namespace conflict [1].
This is a build-compatibility prerequisite, not a separate CVE fix.

Upstream commit:
https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=08c3fc2e9337094aff01a511170fd35fdb8f1ee3

[1] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=%2D%20libacl%20now%20exports%20the%20new%20functions,a%20fix%20is%20already%20on%20the%20way.%29

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../tar/Avoid-acl_-prefix-for-functions.patch | 103 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch

diff --git a/meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch b/meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch
new file mode 100644
index 00000000000..17f9393c376
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch
@@ -0,0 +1,103 @@
+From 2c34d378e3b4a63339ed7f6d82a6486402d5616a Mon Sep 17 00:00:00 2001
+From: Pavel Cahyna <pcahyna@redhat.com>
+Date: Wed, 24 Jun 2026 18:45:30 +0200
+Subject: [PATCH] Avoid acl_ prefix for functions
+
+The acl.h header from libacl uses acl_ prefix for its functions. Avoid
+defining functions with the same name in order to protect its namespace.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=08c3fc2e9337094aff01a511170fd35fdb8f1ee3]
+
+Backport Changes:
+- Adapt helper calls to tar 1.35's chdir_fd/file_name arguments
+  instead of upstream's newer fdbase interface.
+- Keep the existing acl_delete_def_file_at and acl_set_file_at
+  diagnostic text to preserve tar 1.35's gettext message IDs.
+  Diagnostic strings cannot conflict with libacl declarations.
+  Omitting those two diagnostic renames gives 13 insertions and
+  13 deletions instead of upstream's 15 insertions and deletions.
+
+(cherry picked from commit 08c3fc2e9337094aff01a511170fd35fdb8f1ee3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/xattrs.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/xattrs.c b/src/xattrs.c
+index 86a7e59c..bf2c4f0e 100644
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
+-- 
+2.35.6
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index d15e7f8a4e5..8be63cff092 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -46,6 +46,7 @@ SRC_URI += " \
     file://CVE-2026-5704-dependent_p2.patch \
     file://CVE-2026-5704.patch \
     file://CVE-2026-5704-regression.patch \
+    file://Avoid-acl_-prefix-for-functions.patch \
 "
 
 inherit ptest
-- 
2.35.6
