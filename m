Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30954.1793872614020656141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 01:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iWnAJNza;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8841; q=dns/txt;
  s=iport01; t=1793872614; x=1795082214;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sqm0phA4QByv/VG0gPuN+u5PEnLhGW+MfvdnQLhq7DY=;
  b=iWnAJNzae+viZiPX55GRP0Vch/tFCwKQodTt+91VJ+2A5o0e9x5RFh8y
   qMVWsK9kdKdEoQT+QawNrjPCEdhauWJPNmxZznrluRkK0AJ84KdSY49W/
   9G7F0Lpks6N3UOfVoP2dHinNmVclfa/VW6aFzv2yvgfPcNFvLUyB9I9L0
   Ar8vCR3i3ZA7oVEhuYJEvrV7Crhs6uC2lemfuX0JDMBdC62CSD8PQFIvk
   CQGYlMAUU2+f9gKuEs4zF/0oV9IyvvtbTtTf351zNDy5mKn6quMP8K8hv
   +3s/uTpl9LkgPkMXc63BYGkwis3ElTnptW9xjqOjDwhrInV5LjXtERDJ4
   w==;
X-CSE-ConnectionGUID: nzEYM5lVTD6xWaaIzaOYSg==
X-CSE-MsgGUID: tdH6WCMmRDCcVndNmBwIxg==
X-IPAS-Result: =?us-ascii?q?A0BDAgBzUexq/5QQJK1aHgEBCxIMggULgld1YUJJlCqCI?=
 =?us-ascii?q?Z4kgX4PAQEBD0QNBAEBkyQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBLQsBGAFZAwECWiMZCIMCAYJ0AxG8OYF5M4EBgykBP?=
 =?us-ascii?q?wJDUNszAQsUAYE4hUCII10YAUSEOScbG4FygRWDaYEFgVwBAYEnhn8EgiKBD?=
 =?us-ascii?q?IFaHox6AoFShnFIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEegRKBB12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL?=
 =?us-ascii?q?4MKBwEsThMBBxQQUEGBGxGjRIIeoRQKKIN4jCSVOhozqnELmH2OCpZRhGmBa?=
 =?us-ascii?q?DyBRwsHcBWDIglKGQ+OOYNrgX/MOzw1AgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:1MoueqNTS9U9T0bvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUongz1Un
 2oWW27QaPmJN2PyKdAgYduw80lU75DRy9JlHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8g2Msawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/N8IXATYIkmxsopEV5H/
 N0KIRc8VR/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FwgjOCzaoGII7RmQ+1JkmbGm
 Unj+l7VKRokMtC5zBCa02Kj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:pGwb+qv9IqaMkmM0TxlEqyDC7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:1lSsx2+k7nt646Chd62Vv0gGN/EAL3nj8FuOM3CxAEd7QZqkclDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AMbT+sQ5JE1szphm0XKRptqLtxox074TwN2solK8?=
 =?us-ascii?q?qkMK6MyBWPh2CrSS4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="894062351"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 09:56:53 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id AF09318000381
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 09:56:52 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id A85B0CC1295; Thu,  5 Nov 2026 15:26:50 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] gnupg: Fix CVE-2026-105712
Date: Thu,  5 Nov 2026 15:26:43 +0530
Message-Id: <20261105095643.1484894-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 09:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249524
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch backports the upstream gpgtar security fix and its
follow-up to GnuPG 2.5.17. The security fix, directory handling
follow-up, and public CVE advisory are referenced in [1], [2],
and [3]. The follow-up includes a regression check for dry-run
extraction with a non-existing -C directory.

[1] https://github.com/gpg/gnupg/commit/7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88
[2] https://github.com/gpg/gnupg/commit/1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-105712

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../gnupg/CVE-2026-105712-regression.patch    |  39 ++++
 .../gnupg/gnupg/CVE-2026-105712.patch         | 194 ++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   2 +
 3 files changed, 235 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
new file mode 100644
index 0000000000..6097da38c3
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
@@ -0,0 +1,39 @@
+From 1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Tue, 14 Apr 2026 04:32:00 +0000
+Subject: [PATCH] tools:gpgtar: Fix for a case of non existing dir with -C.
+
+* tools/gpgtar-extract.c (gpgtar_extract): Call the
+check_output_directory function only when DIRNAME exists.
+
+--
+GnuPG-bug-id: 8159
+
+CVE: CVE-2026-105712
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5]
+
+Backport Changes:
+- Used gnupg_access() for the existence check because 2.5.17 does not
+  have the upstream COMPAT_NO_DIR_CHECK compatibility flag.
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 1bdd1f5bb4d192d9700dd6ab2540b0a940c23dd5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tools/gpgtar-extract.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/gpgtar-extract.c b/tools/gpgtar-extract.c
+index 5ca80cb..a5a925c 100644
+--- a/tools/gpgtar-extract.c
++++ b/tools/gpgtar-extract.c
+@@ -504,7 +504,8 @@ gpgtar_extract (const char *filename, int decrypt)
+           goto leave;
+         }
+ 
+-      if (!check_output_directory (dirname))
++      if (gnupg_access (dirname, F_OK) == 0
++          && !check_output_directory (dirname))
+         {
+           err = gpg_error (GPG_ERR_INV_ARG);
+           goto leave;
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch
new file mode 100644
index 0000000000..9b0bc1ca66
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch
@@ -0,0 +1,194 @@
+From 8df56dd913f3c910c9b265691efaac6c36a007a1 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 20 Mar 2026 13:33:00 +0900
+Subject: [PATCH] tool:gpgtar: Check the output directory with --directory.
+
+* doc/tools.texi (gpgtar): Clarify about the --directory option.
+* tools/gpgtar-extract.c (check_output_directory): New.
+(gpgtar_extract): Call check_output_directory.
+
+--
+
+GnuPG-bug-id: 8159
+
+CVE: CVE-2026-105712
+Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88]
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+(cherry picked from commit 7a2692fe5e580ae3bbb2a47abc4baaf1af65aa88)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ doc/tools.texi         |  11 ++--
+ tools/gpgtar-extract.c | 123 ++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 128 insertions(+), 6 deletions(-)
+
+diff --git a/doc/tools.texi b/doc/tools.texi
+index 45f3e897d..691b7dc9c 100644
+--- a/doc/tools.texi
++++ b/doc/tools.texi
+@@ -2024,11 +2024,12 @@ Do not actually output the extracted files.
+ @item --directory @var{dir}
+ @itemx -C @var{dir}
+ @opindex directory
+-Extract the files into the directory @var{dir}.  The default is to
+-take the directory name from the input filename.  If no input filename
+-is known a directory named @file{GPGARCH} is used.  For tarball
+-creation, switch to directory @var{dir} before performing any
+-operations.
++Extract the files into the directory @var{dir}.  It raises an error
++when @var{dir} is not empty, or @var{dir} is a symlink to other
++directory.  When this option is not given, the default is to take the
++directory name from the input filename.  If no input filename is known
++a directory, named @file{GPGARCH} is used.  For tarball creation,
++switch to directory @var{dir} before performing any operations.
+ 
+ @item --files-from @var{file}
+ @itemx -T @var{file}
+diff --git a/tools/gpgtar-extract.c b/tools/gpgtar-extract.c
+index d23ccc579..5ca80cb89 100644
+--- a/tools/gpgtar-extract.c
++++ b/tools/gpgtar-extract.c
+@@ -24,6 +24,8 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <dirent.h>
++#include <fcntl.h>
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+@@ -369,6 +371,112 @@ create_directory (const char *dirprefix)
+ }
+ 
+ 
++/* Check the output directory DIRNAME if it's not symlink and empty.
++   Return 1 if good, 0 otherwise.  */
++static int
++check_output_directory (const char *dirname)
++{
++#ifdef HAVE_W32_SYSTEM
++#define dirent _wdirent
++#define DIR _WDIR
++#define readdir _wreaddir
++#define closedir _wclosedir
++#endif
++  DIR *d;
++  struct dirent *dent;
++  int count = 0;
++
++#ifdef HAVE_W32_SYSTEM
++  wchar_t *wdirname;
++  DWORD attr;
++
++  wdirname = utf8_to_wchar (dirname);
++  if (!wdirname)
++    return 0;
++
++  attr = GetFileAttributesW (wdirname);
++
++  if (attr == INVALID_FILE_ATTRIBUTES)
++    {
++      log_error ("error getting attributes '%s': %s\n", dirname, w32_strerror (-1));
++      xfree (wdirname);
++      return 0;
++    }
++  else if ((attr & FILE_ATTRIBUTE_REPARSE_POINT))
++    {
++      /* It's reparse point (possibly symlink), not good.  */
++      log_error ("Not a regular directory (may be symlink): %s\n", dirname);
++      xfree (wdirname);
++      return 0;
++    }
++
++  d = _wopendir (wdirname);
++  xfree (wdirname);
++#else
++# if O_NOFOLLOW == 0
++  struct stat sbuf;
++
++  if (lstat (dirname, &sbuf))
++    return 0;
++
++  if (S_ISLNK (sbuf.st_mode))
++    {
++      /* It's symlink, not good.  */
++      log_error ("It's symbolic link: %s\n", dirname);
++      return 0;
++    }
++
++  d = opendir (dirname);
++# else
++  int fd;
++
++  /* With O_NOFOLLOW, make sure it's not symlink.  */
++  fd = open (dirname, (O_RDONLY | O_NOFOLLOW));
++  if (fd < 0)
++    {
++      log_error ("Can't open (symlink?): %s\n", dirname);
++      return 0;
++    }
++
++  d = fdopendir (fd);
++# endif
++#endif
++
++  if (d == NULL)
++    return 0;
++
++  while ((dent = readdir (d)) != NULL)
++    {
++      if (dent->d_name[0] == '.' && dent->d_name[1] == 0)
++        continue;
++
++      if (dent->d_name[0] == '.' && dent->d_name[1] == '.'
++          && dent->d_name[2] == 0)
++        continue;
++
++      count++;
++    }
++
++  /* In case of fdopendir, FD is released by closedir. */
++  closedir (d);
++
++  if (count)
++    {
++      /* It's not empty, not good.  */
++      log_error ("Directory not empty: %s\n", dirname);
++      return 0;
++    }
++
++  /* Good.  */
++  return 1;
++}
++
++#ifdef HAVE_W32_SYSTEM
++#undef dirent
++#undef DIR
++#undef readdir
++#undef closedir
++#endif
+ 
+ gpg_error_t
+ gpgtar_extract (const char *filename, int decrypt)
+@@ -388,7 +496,20 @@ gpgtar_extract (const char *filename, int decrypt)
+   memset (&tarinfo_buffer, 0, sizeof tarinfo_buffer);
+ 
+   if (opt.directory)
+-    dirname = xtrystrdup (opt.directory);
++    {
++      dirname = xtrystrdup (opt.directory);
++      if (!dirname)
++        {
++          err = gpg_error_from_syserror ();
++          goto leave;
++        }
++
++      if (!check_output_directory (dirname))
++        {
++          err = gpg_error (GPG_ERR_INV_ARG);
++          goto leave;
++        }
++    }
+   else
+     {
+       if (opt.filename)
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
index 6b2af1c96c..04666ee8d7 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
@@ -20,6 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            file://CVE-2026-57062.patch \
+           file://CVE-2026-105712.patch \
+           file://CVE-2026-105712-regression.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
-- 
2.35.6
