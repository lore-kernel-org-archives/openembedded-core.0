Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC8EC433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 11:15:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.7200.1642850122734786889
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FfxOwny0;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d1so11036954plh.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AA71xrIv3MRefflTuLGRlwbxbeGVE5sFAGTmpxUH+0c=;
        b=FfxOwny0KN/hupYJokE8hoWcNp1cwOri13oFHWje5+RnQKAh0IR2ogaRRx5k8n7m6S
         1/43/odfZ3oWVt7Xy23PZnw8FTWwwjU1NzNGkxbRDvAAsw+P/B9tnmfVlHi5lv81Woi3
         g73B5eF5oi/9EGxf7vME0rNV9emsqe+27lqpzZjnwINv9gs8lrkpZ88v8srFk6ReMkfx
         iF++YYy4bU0l96VbJf22/SA0+e+UxtUn00b2NWI8UwbSCgEz6ii4YWzujSnEJE4O0h2/
         ex/HIHSn3/x108EOj/AQRV4N7X8OlRqdVJQj3LziS4uz2FRzNF/4bs+aQaiYjTVypJRQ
         EUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AA71xrIv3MRefflTuLGRlwbxbeGVE5sFAGTmpxUH+0c=;
        b=a3cDW6tycti1ifM8Sd3lgXIRf4EhEHZfp8/UOJnjATRZVGxJMbkXM27upxBoI2nNNM
         zpaivCNVE7PwZOEGduArggx03a0hVKFWJYYcsY3JzcGorSz5eTDp2ux3f5f2benXyYyj
         NnMIRM+3uNQgYt7Z1SXxcxb9dY5kWPTaokDdvQq7TpOqkkY4cHMo9QqpnOLAyRKdGRXm
         yOAlNHwIAqeqL5doie6UU1U4mGYsb31Xx0lWg6E7jOgXX7LI1PZCcSQyrSNSkdyuciYU
         DyncpJrMQac9ON2N47l6uKjhGM04kFfUuXS19yM+3i8AGDqD4H+F4a4Y15J5UG4VxJqF
         /Owg==
X-Gm-Message-State: AOAM530o/UmpJYzClfeqmF33faeEcVLZhbZI0vwgBMnXIIg+7fVNIIZz
	qfdn8DnbLfexSi4TgljXAiU7AxF7vFc68w==
X-Google-Smtp-Source: 
 ABdhPJxDc9t3tWj9Agz39vUQhhCyIHsnkkofbBxNLepp39oIYidi7vVKmRtiY5jhGgnSVFE+wFtWfQ==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr4757738pjb.49.1642850121785;
        Sat, 22 Jan 2022 03:15:21 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 n1sm9314343pfa.165.2022.01.22.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 03:15:21 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 2/3] binutils: upgrade binutils-2.36 to latest
 version
Date: Sat, 22 Jan 2022 03:15:14 -0800
Message-Id: <20220122111516.6312-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220122111516.6312-1-pgowda.cve@gmail.com>
References: <20220122111516.6312-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 11:15:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160856

binutils-2.36 in Hardknott branch has been upgraded to latest version
that includes many bug fixes.
Regression tested on X86-64, Arm and Aarch64 without any new issues.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.36.inc                |   5 +-
 .../binutils/0001-CVE-2021-20197.patch        | 201 ------------------
 .../binutils/0001-CVE-2021-42574.patch        |   4 +-
 .../binutils/0002-CVE-2021-20197.patch        | 170 ---------------
 .../binutils/0003-CVE-2021-20197.patch        | 171 ---------------
 5 files changed, 3 insertions(+), 548 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 9574ddb6e1..fa28358c2d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -24,7 +24,7 @@ BRANCH ?= "binutils-2_36-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
+SRCREV ?= "a281816c8aeb12619d34eec8959a43dfa5c6b4ec"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -41,9 +41,6 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
-     file://0001-CVE-2021-20197.patch \
-     file://0002-CVE-2021-20197.patch \
-     file://0003-CVE-2021-20197.patch \
      file://0017-CVE-2021-3530.patch \
      file://0018-CVE-2021-3530.patch \
      file://0001-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch
deleted file mode 100644
index 2b4eaba26d..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-20197.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From 8e03235147a9e774d3ba084e93c2da1aa94d1cec Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@gotplt.org>
-Date: Mon, 22 Feb 2021 20:45:50 +0530
-Subject: [PATCH] binutils: Avoid renaming over existing files
-
-Renaming over existing files needs additional care to restore
-permissions and ownership, which may not always succeed.
-Additionally, other properties of the file such as extended attributes
-may be lost, making the operation flaky.
-
-For predictable results, resort to rename() only if the file does not
-exist, otherwise copy the file contents into the existing file.  This
-ensures that no additional tricks are needed to retain file
-properties.
-
-This also allows dropping of the redundant set_times on the tmpfile in
-objcopy/strip since now we no longer rename over existing files.
-
-binutils/
-
-	* ar.c (write_archive): Adjust call to SMART_RENAME.
-	* arsup.c (ar_save): Likewise.
-	* objcopy (strip_main): Don't set times on temporary file and
-	adjust call to SMART_RENAME.
-	(copy_main): Likewise.
-	* rename.c [!S_ISLNK]: Remove definitions.
-	(try_preserve_permissions): Remove function.
-	(smart_rename): Replace PRESERVE_DATES argument with
-	TARGET_STAT.  Use rename system call only if TO does not exist.
-	* bucomm.h (smart_rename): Adjust declaration.
-
-(cherry picked from commit 3685de750e6a091663a0abe42528cad29e960e35)
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=8e03235147a9e774d3ba084e93c2da1aa94d1cec]
-CVE: CVE-2021-20197
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- binutils/ar.c      |  2 +-
- binutils/arsup.c   |  2 +-
- binutils/bucomm.h  |  3 ++-
- binutils/objcopy.c |  8 ++-----
- binutils/rename.c  | 55 +++++++++-------------------------------------
- 6 files changed, 29 insertions(+), 54 deletions(-)
-
-diff --git a/binutils/ar.c b/binutils/ar.c
-index 45a34e3a6cf..3a91708b51c 100644
---- a/binutils/ar.c
-+++ b/binutils/ar.c
-@@ -1308,7 +1308,7 @@ write_archive (bfd *iarch)
-   /* We don't care if this fails; we might be creating the archive.  */
-   bfd_close (iarch);
- 
--  if (smart_rename (new_name, old_name, 0) != 0)
-+  if (smart_rename (new_name, old_name, NULL) != 0)
-     xexit (1);
-   free (old_name);
-   free (new_name);
-diff --git a/binutils/arsup.c b/binutils/arsup.c
-index 5403a0c5d74..0a1f63f6456 100644
---- a/binutils/arsup.c
-+++ b/binutils/arsup.c
-@@ -351,7 +351,7 @@ ar_save (void)
- 
-       bfd_close (obfd);
- 
--      smart_rename (ofilename, real_name, 0);
-+      smart_rename (ofilename, real_name, NULL);
-       obfd = 0;
-       free (ofilename);
-     }
-diff --git a/binutils/bucomm.h b/binutils/bucomm.h
-index 91f6a5b228f..aa7e33d8cd1 100644
---- a/binutils/bucomm.h
-+++ b/binutils/bucomm.h
-@@ -71,7 +71,8 @@ extern void print_version (const char *);
- /* In rename.c.  */
- extern void set_times (const char *, const struct stat *);
- 
--extern int smart_rename (const char *, const char *, int);
-+extern int smart_rename (const char *, const char *, struct stat *);
-+
- 
- /* In libiberty.  */
- void *xmalloc (size_t);
-diff --git a/binutils/objcopy.c b/binutils/objcopy.c
-index eab3b6db585..07a872b5a80 100644
---- a/binutils/objcopy.c
-+++ b/binutils/objcopy.c
-@@ -4861,12 +4861,10 @@ strip_main (int argc, char *argv[])
- 		 output_target, NULL);
-       if (status == 0)
- 	{
--	  if (preserve_dates)
--	    set_times (tmpname, &statbuf);
- 	  if (output_file != tmpname)
- 	    status = (smart_rename (tmpname,
- 				    output_file ? output_file : argv[i],
--				    preserve_dates) != 0);
-+				    preserve_dates ? &statbuf : NULL) != 0);
- 	  if (status == 0)
- 	    status = hold_status;
- 	}
-@@ -5931,11 +5929,9 @@ copy_main (int argc, char *argv[])
- 	     output_target, input_arch);
-   if (status == 0)
-     {
--      if (preserve_dates)
--	set_times (tmpname, &statbuf);
-       if (tmpname != output_filename)
- 	status = (smart_rename (tmpname, input_filename,
--				preserve_dates) != 0);
-+				preserve_dates ? &statbuf : NULL) != 0);
-     }
-   else
-     unlink_if_ordinary (tmpname);
-diff --git a/binutils/rename.c b/binutils/rename.c
-index 65ad5bf52c4..f471b45fd3f 100644
---- a/binutils/rename.c
-+++ b/binutils/rename.c
-@@ -122,20 +122,13 @@ set_times (const char *destination, const struct stat *statbuf)
-     non_fatal (_("%s: cannot set time: %s"), destination, strerror (errno));
- }
- 
--#ifndef S_ISLNK
--#ifdef S_IFLNK
--#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
--#else
--#define S_ISLNK(m) 0
--#define lstat stat
--#endif
--#endif
--
--/* Rename FROM to TO, copying if TO is a link.
--   Return 0 if ok, -1 if error.  */
-+/* Rename FROM to TO, copying if TO exists.  TARGET_STAT has the file status
-+   that, if non-NULL, is used to fix up timestamps after rename.  Return 0 if
-+   ok, -1 if error.  */
- 
- int
--smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNUSED)
-+smart_rename (const char *from, const char *to,
-+	      struct stat *target_stat ATTRIBUTE_UNUSED)
- {
-   bfd_boolean exists;
-   struct stat s;
-@@ -158,38 +151,10 @@ smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNU
-       unlink (from);
-     }
- #else
--  /* Use rename only if TO is not a symbolic link and has
--     only one hard link, and we have permission to write to it.  */
--  if (! exists
--      || (!S_ISLNK (s.st_mode)
--	  && S_ISREG (s.st_mode)
--	  && (s.st_mode & S_IWUSR)
--	  && s.st_nlink == 1)
--      )
-+  /* Avoid a full copy and use rename if TO does not exist.  */
-+  if (!exists)
-     {
--      ret = rename (from, to);
--      if (ret == 0)
--	{
--	  if (exists)
--	    {
--	      /* Try to preserve the permission bits and ownership of
--		 TO.  First get the mode right except for the setuid
--		 bit.  Then change the ownership.  Then fix the setuid
--		 bit.  We do the chmod before the chown because if the
--		 chown succeeds, and we are a normal user, we won't be
--		 able to do the chmod afterward.  We don't bother to
--		 fix the setuid bit first because that might introduce
--		 a fleeting security problem, and because the chown
--		 will clear the setuid bit anyhow.  We only fix the
--		 setuid bit if the chown succeeds, because we don't
--		 want to introduce an unexpected setuid file owned by
--		 the user running objcopy.  */
--	      chmod (to, s.st_mode & 0777);
--	      if (chown (to, s.st_uid, s.st_gid) >= 0)
--		chmod (to, s.st_mode & 07777);
--	    }
--	}
--      else
-+      if ((ret = rename (from, to)) != 0)
- 	{
- 	  /* We have to clean up here.  */
- 	  non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
-@@ -202,8 +167,8 @@ smart_rename (const char *from, const char *to, int preserve_dates ATTRIBUTE_UNU
-       if (ret != 0)
- 	non_fatal (_("unable to copy file '%s'; reason: %s"), to, strerror (errno));
- 
--      if (preserve_dates)
--	set_times (to, &s);
-+      if (target_stat != NULL)
-+	set_times (to, target_stat);
-       unlink (from);
-     }
- #endif /* _WIN32 && !__CYGWIN32__ */
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
index c93fd770b3..6adc438b5c 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
@@ -50,9 +50,9 @@ diff --git a/binutils/ChangeLog b/binutils/ChangeLog
 +	* testsuite/binutils-all/objdump.highlight.unicode
 +	* testsuite/binutils-all/readelf.invalid.unicode
 +
- 2021-02-09  Alan Modra  <amodra@gmail.com>
+ 2021-04-15  Alan Modra  <amodra@gmail.com>
  
- 	PR 27382
+ 	PR 27456
 diff --git a/binutils/doc/binutils.texi b/binutils/doc/binutils.texi
 --- a/binutils/doc/binutils.texi	2021-12-23 03:23:38.441843395 -0800
 +++ b/binutils/doc/binutils.texi	2021-12-23 03:30:31.094968942 -0800
diff --git a/meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch
deleted file mode 100644
index 3771f571eb..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0002-CVE-2021-20197.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From d3edaa91d4cf7202ec14342410194841e2f67f12 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Fri, 26 Feb 2021 11:30:32 +1030
-Subject: [PATCH] Reinstate various pieces backed out from smart_rename changes
-
-In the interests of a stable release various last minute smart_rename
-patches were backed out of the 2.36 branch.  The main reason to
-reinstate some of those backed out changes here is to make necessary
-followup fixes to commit 8e03235147a9 simple cherry-picks from
-mainline.  A secondary reason is that ar -M support isn't fixed for
-pr26945 without this patch.
-
-	PR 26945
-	* ar.c: Don't include libbfd.h.
-	(write_archive): Replace xmalloc+strcpy with xstrdup.
-	* arsup.c (temp_name, real_ofd): New static variables.
-	(ar_open): Use make_tempname and bfd_fdopenw.
-	(ar_save): Adjust to suit ar_open changes.
-	* objcopy.c: Don't include libbfd.h.
-	* rename.c: Rename and reorder variables.
-
-(cherry picked from commit 95b91a043aeaeb546d2fea556d84a2de1e917770)
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=d3edaa91d4cf7202ec14342410194841e2f67f12]
-CVE: CVE-2021-20197
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- binutils/ar.c      |  4 +---
- binutils/arsup.c   | 37 +++++++++++++++++++++++++------------
- binutils/objcopy.c |  1 -
- binutils/rename.c  |  6 +++---
- 5 files changed, 42 insertions(+), 19 deletions(-)
-
-diff --git a/binutils/ar.c b/binutils/ar.c
-index 3a91708b51c..44df48c5c67 100644
---- a/binutils/ar.c
-+++ b/binutils/ar.c
-@@ -25,7 +25,6 @@
- 
- #include "sysdep.h"
- #include "bfd.h"
--#include "libbfd.h"
- #include "libiberty.h"
- #include "progress.h"
- #include "getopt.h"
-@@ -1255,8 +1254,7 @@ write_archive (bfd *iarch)
-   bfd *contents_head = iarch->archive_next;
-   int ofd = -1;
- 
--  old_name = (char *) xmalloc (strlen (bfd_get_filename (iarch)) + 1);
--  strcpy (old_name, bfd_get_filename (iarch));
-+  old_name = xstrdup (bfd_get_filename (iarch));
-   new_name = make_tempname (old_name, &ofd);
- 
-   if (new_name == NULL)
-diff --git a/binutils/arsup.c b/binutils/arsup.c
-index 0a1f63f6456..f7ce8f0bc82 100644
---- a/binutils/arsup.c
-+++ b/binutils/arsup.c
-@@ -42,6 +42,8 @@ extern int deterministic;
- 
- static bfd *obfd;
- static char *real_name;
-+static char *temp_name;
-+static int real_ofd;
- static FILE *outfile;
- 
- static void
-@@ -149,27 +151,24 @@ maybequit (void)
- void
- ar_open (char *name, int t)
- {
--  char *tname;
--  const char *bname = lbasename (name);
--  real_name = name;
-+  real_name = xstrdup (name);
-+  temp_name = make_tempname (real_name, &real_ofd);
- 
--  /* Prepend tmp- to the beginning, to avoid file-name clashes after
--     truncation on filesystems with limited namespaces (DOS).  */
--  if (asprintf (&tname, "%.*stmp-%s", (int) (bname - name), name, bname) == -1)
-+  if (temp_name == NULL)
-     {
--      fprintf (stderr, _("%s: Can't allocate memory for temp name (%s)\n"),
-+      fprintf (stderr, _("%s: Can't open temporary file (%s)\n"),
- 	       program_name, strerror(errno));
-       maybequit ();
-       return;
-     }
- 
--  obfd = bfd_openw (tname, NULL);
-+  obfd = bfd_fdopenw (temp_name, NULL, real_ofd);
- 
-   if (!obfd)
-     {
-       fprintf (stderr,
- 	       _("%s: Can't open output archive %s\n"),
--	       program_name,  tname);
-+	       program_name, temp_name);
- 
-       maybequit ();
-     }
-@@ -344,16 +343,30 @@ ar_save (void)
-     }
-   else
-     {
--      char *ofilename = xstrdup (bfd_get_filename (obfd));
-+      struct stat target_stat;
- 
-       if (deterministic > 0)
-         obfd->flags |= BFD_DETERMINISTIC_OUTPUT;
- 
-       bfd_close (obfd);
- 
--      smart_rename (ofilename, real_name, NULL);
-+      if (stat (real_name, &target_stat) != 0)
-+	{
-+	  /* The temp file created in ar_open has mode 0600 as per mkstemp.
-+	     Create the real empty output file here so smart_rename will
-+	     update the mode according to the process umask.  */
-+	  obfd = bfd_openw (real_name, NULL);
-+	  if (obfd != NULL)
-+	    {
-+	      bfd_set_format (obfd, bfd_archive);
-+	      bfd_close (obfd);
-+	    }
-+	}
-+
-+      smart_rename (temp_name, real_name, NULL);
-       obfd = 0;
--      free (ofilename);
-+      free (temp_name);
-+      free (real_name);
-     }
- }
- 
-diff --git a/binutils/objcopy.c b/binutils/objcopy.c
-index 07a872b5a80..73aa8bc2514 100644
---- a/binutils/objcopy.c
-+++ b/binutils/objcopy.c
-@@ -20,7 +20,6 @@
- 
- #include "sysdep.h"
- #include "bfd.h"
--#include "libbfd.h"
- #include "progress.h"
- #include "getopt.h"
- #include "libiberty.h"
-diff --git a/binutils/rename.c b/binutils/rename.c
-index f471b45fd3f..2ff092ee22b 100644
---- a/binutils/rename.c
-+++ b/binutils/rename.c
-@@ -130,11 +130,11 @@ int
- smart_rename (const char *from, const char *to,
- 	      struct stat *target_stat ATTRIBUTE_UNUSED)
- {
--  bfd_boolean exists;
--  struct stat s;
-   int ret = 0;
-+  struct stat to_stat;
-+  bfd_boolean exists;
- 
--  exists = lstat (to, &s) == 0;
-+  exists = lstat (to, &to_stat) == 0;
- 
- #if defined (_WIN32) && !defined (__CYGWIN32__)
-   /* Win32, unlike unix, will not erase `to' in `rename(from, to)' but
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch b/meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch
deleted file mode 100644
index 082b28b29c..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0003-CVE-2021-20197.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 8b69e61d4be276bb862698aaafddc3e779d23c8f Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 23 Feb 2021 09:37:39 +1030
-Subject: [PATCH] PR27456, lstat in rename.c on MinGW
-
-	PR 27456
-	* rename.c: Tidy throughout.
-	(smart_rename): Always copy.  Remove windows specific code.
-
-(cherry picked from commit cca8873dd5a6015d5557ea44bc1ea9c252435a29)
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=8b69e61d4be276bb862698aaafddc3e779d23c8f]
-CVE: CVE-2021-20197
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- binutils/rename.c  | 111 ++++++++++++++-------------------------------
- 2 files changed, 40 insertions(+), 76 deletions(-)
-
-diff --git a/binutils/rename.c b/binutils/rename.c
-index 2ff092ee22b..72a9323d72c 100644
---- a/binutils/rename.c
-+++ b/binutils/rename.c
-@@ -24,14 +24,9 @@
- 
- #ifdef HAVE_GOOD_UTIME_H
- #include <utime.h>
--#else /* ! HAVE_GOOD_UTIME_H */
--#ifdef HAVE_UTIMES
-+#elif defined HAVE_UTIMES
- #include <sys/time.h>
--#endif /* HAVE_UTIMES */
--#endif /* ! HAVE_GOOD_UTIME_H */
--
--#if ! defined (_WIN32) || defined (__CYGWIN32__)
--static int simple_copy (const char *, const char *);
-+#endif
- 
- /* The number of bytes to copy at once.  */
- #define COPY_BUF 8192
-@@ -82,7 +77,6 @@ simple_copy (const char *from, const char *to)
-     }
-   return 0;
- }
--#endif /* __CYGWIN32__ or not _WIN32 */
- 
- /* Set the times of the file DESTINATION to be the same as those in
-    STATBUF.  */
-@@ -91,87 +85,52 @@ void
- set_times (const char *destination, const struct stat *statbuf)
- {
-   int result;
--
--  {
- #ifdef HAVE_GOOD_UTIME_H
--    struct utimbuf tb;
--
--    tb.actime = statbuf->st_atime;
--    tb.modtime = statbuf->st_mtime;
--    result = utime (destination, &tb);
--#else /* ! HAVE_GOOD_UTIME_H */
--#ifndef HAVE_UTIMES
--    long tb[2];
--
--    tb[0] = statbuf->st_atime;
--    tb[1] = statbuf->st_mtime;
--    result = utime (destination, tb);
--#else /* HAVE_UTIMES */
--    struct timeval tv[2];
--
--    tv[0].tv_sec = statbuf->st_atime;
--    tv[0].tv_usec = 0;
--    tv[1].tv_sec = statbuf->st_mtime;
--    tv[1].tv_usec = 0;
--    result = utimes (destination, tv);
--#endif /* HAVE_UTIMES */
--#endif /* ! HAVE_GOOD_UTIME_H */
--  }
-+  struct utimbuf tb;
-+
-+  tb.actime = statbuf->st_atime;
-+  tb.modtime = statbuf->st_mtime;
-+  result = utime (destination, &tb);
-+#elif defined HAVE_UTIMES
-+  struct timeval tv[2];
-+
-+  tv[0].tv_sec = statbuf->st_atime;
-+  tv[0].tv_usec = 0;
-+  tv[1].tv_sec = statbuf->st_mtime;
-+  tv[1].tv_usec = 0;
-+  result = utimes (destination, tv);
-+#else
-+  long tb[2];
-+
-+  tb[0] = statbuf->st_atime;
-+  tb[1] = statbuf->st_mtime;
-+  result = utime (destination, tb);
-+#endif
- 
-   if (result != 0)
-     non_fatal (_("%s: cannot set time: %s"), destination, strerror (errno));
- }
- 
--/* Rename FROM to TO, copying if TO exists.  TARGET_STAT has the file status
--   that, if non-NULL, is used to fix up timestamps after rename.  Return 0 if
--   ok, -1 if error.  */
-+/* Copy FROM to TO.  TARGET_STAT has the file status that, if non-NULL,
-+   is used to fix up timestamps.  Return 0 if ok, -1 if error.
-+   At one time this function renamed files, but file permissions are
-+   tricky to update given the number of different schemes used by
-+   various systems.  So now we just copy.  */
- 
- int
- smart_rename (const char *from, const char *to,
--	      struct stat *target_stat ATTRIBUTE_UNUSED)
-+	      struct stat *target_stat)
- {
--  int ret = 0;
--  struct stat to_stat;
--  bfd_boolean exists;
--
--  exists = lstat (to, &to_stat) == 0;
--
--#if defined (_WIN32) && !defined (__CYGWIN32__)
--  /* Win32, unlike unix, will not erase `to' in `rename(from, to)' but
--     fail instead.  Also, chown is not present.  */
--
--  if (exists)
--    remove (to);
-+  int ret;
- 
--  ret = rename (from, to);
-+  ret = simple_copy (from, to);
-   if (ret != 0)
--    {
--      /* We have to clean up here.  */
--      non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
--      unlink (from);
--    }
--#else
--  /* Avoid a full copy and use rename if TO does not exist.  */
--  if (!exists)
--    {
--      if ((ret = rename (from, to)) != 0)
--	{
--	  /* We have to clean up here.  */
--	  non_fatal (_("unable to rename '%s'; reason: %s"), to, strerror (errno));
--	  unlink (from);
--	}
--    }
--  else
--    {
--      ret = simple_copy (from, to);
--      if (ret != 0)
--	non_fatal (_("unable to copy file '%s'; reason: %s"), to, strerror (errno));
-+    non_fatal (_("unable to copy file '%s'; reason: %s"),
-+	       to, strerror (errno));
- 
--      if (target_stat != NULL)
--	set_times (to, target_stat);
--      unlink (from);
--    }
--#endif /* _WIN32 && !__CYGWIN32__ */
-+  if (target_stat != NULL)
-+    set_times (to, target_stat);
-+  unlink (from);
- 
-   return ret;
- }
--- 
-2.31.1
-
-- 
2.31.1


