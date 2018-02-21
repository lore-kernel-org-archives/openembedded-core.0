Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED15271A18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 03:12:58 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s13so200958plq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 19:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YvTinWxTJ+v8C2ZghQTdAJ2pKWYdlJPh6x+dFqPYwp4=;
	b=rVDYACPyhb704GjewfTuSHPYENFZrzJZG2hpzJzwlZDsXej/t9D7h4Jj1rphY4yfH8
	VkayumBs5gUWqSzX1NlLlOyqm+Dr3eRElsAH6Fxrn980kAI5Os4ERxdXGhrbOWqEPO/M
	DWfHuFnRu8x9LyvQzlZtVWZ+YA1SMMvfrDM42B/zhB8ZcIz4weUaTJY5FLZhppyRzvfp
	tgcX9qc3PbB+Zf4WrdB9XLxLoL7rDGjKL5AlcdaE4Qtp7Jygl5lKeG1czPIzxtZiD/mr
	0yCw3QP5WPawdXmw9PF6dJioH+/80AFNR2OKrYMWLKActW7tCKXWF22K2PaXvwGjDEEt
	FbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YvTinWxTJ+v8C2ZghQTdAJ2pKWYdlJPh6x+dFqPYwp4=;
	b=iACdDIh7LJOIsg9GNRZq3m9MVgU23CQEJJF5nVm+Ac9XovW1ZucrbHWAAAylhjj7e1
	bEFDABRS/JiLWPxm1ApCBYl7/hc+p6MgcAjHoB00lwhcyHG8IRd9QVykCIkfs15tSE2M
	7vH3Bbxbi0N3EP81LmXlXbQRmziIHbh6J6I9l23WY7c7uufAee7vCGDHyyNINkVGOGyK
	q9JRZLG38ozv/vuj9TJMjsAJXzVt6Wf/nlFxD7l76RLKlMI2HOjAEwJG64AGXnwVb6in
	JW0rxdl0C0TKVp47uuANGvKDHEktCmsFNCOq+HQyqLK9yz+Wr6JOI4g5qUKxb5E73G+a
	GaYg==
X-Gm-Message-State: APf1xPCIi/mOIOLCqeCZcQ36xto8IueYK3VKHoWzXwnOxydrM4JB82Hb
	5TavJUL7L4o0+XROKoqCtm04qA==
X-Google-Smtp-Source: AH8x2271F5Bfpb5ql/LFJITfn4hC1U5bom74oLd/dDAo/NUWoUZBgIZINRZ1zu990o4SteaaPfkvKg==
X-Received: by 2002:a17:902:7b88:: with SMTP id
	w8-v6mr1728317pll.306.1519182779432; 
	Tue, 20 Feb 2018 19:12:59 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::436d])
	by smtp.gmail.com with ESMTPSA id
	c14sm21205462pfn.185.2018.02.20.19.12.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 19:12:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 19:12:49 -0800
Message-Id: <20180221031249.43075-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180221031249.43075-1-raj.khem@gmail.com>
References: <20180221031249.43075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc: Update to tip of 2.26
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
X-List-Received-Date: Wed, 21 Feb 2018 03:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will make it easy to backport to rocko if needed after 2.27 is landed in master
plus it fixes the aarch64 build issue seen with binutils 2.30

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.26.bb           |   2 +-
 ...loc-add-missing-arena-lock-in-malloc-info.patch | 172 ---------------------
 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch |  65 --------
 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch | 151 ------------------
 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch |  53 -------
 meta/recipes-core/glibc/glibc_2.26.bb              |   6 +-
 6 files changed, 2 insertions(+), 447 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.26.bb b/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
index fc5d70dbb9..af02a0ce1d 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
@@ -21,7 +21,7 @@ SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "1c9a5c270d8b66f30dcfaf1cb2d6cf39d3e18369"
+SRCREV_glibc ?= "d300041c533a3d837c9f37a099bcc95466860e98"
 SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch b/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
deleted file mode 100644
index 626e0e9039..0000000000
--- a/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From: Florian Weimer <fweimer@redhat.com>
-Date: Wed, 15 Nov 2017 11:39:01 +0100
-Subject: [PATCH] malloc: Add missing arena lock in malloc_info [BZ #22408]
-
-Obtain the size information while the arena lock is acquired, and only
-print it later.
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
-Index: git/malloc/Makefile
-===================================================================
---- git.orig/malloc/Makefile	2017-09-04 17:34:06.758018978 +0800
-+++ git/malloc/Makefile	2017-11-20 14:57:43.440337572 +0800
-@@ -35,6 +35,7 @@
- 	 tst-interpose-thread \
- 	 tst-alloc_buffer \
- 	 tst-malloc-tcache-leak \
-+	 tst-malloc_info \
- 
- tests-static := \
- 	 tst-interpose-static-nothread \
-@@ -245,3 +246,5 @@
- 	$(evaluate-test)
- 
- $(objpfx)tst-malloc-tcache-leak: $(shared-thread-library)
-+
-+$(objpfx)tst-malloc_info: $(shared-thread-library)
-Index: git/malloc/malloc.c
-===================================================================
---- git.orig/malloc/malloc.c	2017-09-04 17:34:06.758018978 +0800
-+++ git/malloc/malloc.c	2017-11-20 15:01:02.412338959 +0800
-@@ -5547,6 +5547,15 @@
- 	  avail += sizes[NFASTBINS - 1 + i].total;
- 	}
- 
-+      size_t heap_size = 0;
-+      size_t heap_mprotect_size = 0;
-+      if (ar_ptr != &main_arena)
-+	{
-+	  heap_info *heap = heap_for_ptr (top (ar_ptr));
-+	  heap_size = heap->size;
-+	  heap_mprotect_size = heap->mprotect_size;
-+	}
-+
-       __libc_lock_unlock (ar_ptr->mutex);
- 
-       total_nfastblocks += nfastblocks;
-@@ -5580,13 +5589,12 @@
- 
-       if (ar_ptr != &main_arena)
- 	{
--	  heap_info *heap = heap_for_ptr (top (ar_ptr));
- 	  fprintf (fp,
- 		   "<aspace type=\"total\" size=\"%zu\"/>\n"
- 		   "<aspace type=\"mprotect\" size=\"%zu\"/>\n",
--		   heap->size, heap->mprotect_size);
--	  total_aspace += heap->size;
--	  total_aspace_mprotect += heap->mprotect_size;
-+		   heap_size, heap_mprotect_size);
-+	  total_aspace += heap_size;
-+	  total_aspace_mprotect += heap_mprotect_size;
- 	}
-       else
- 	{
-Index: git/malloc/tst-malloc_info.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/malloc/tst-malloc_info.c	2017-11-20 15:02:03.208339383 +0800
-@@ -0,0 +1,101 @@
-+/* Smoke test for malloc_info.
-+   Copyright (C) 2017 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* The purpose of this test is to provide a quick way to run
-+   malloc_info in a multi-threaded process.  */
-+
-+#include <array_length.h>
-+#include <malloc.h>
-+#include <stdlib.h>
-+#include <support/support.h>
-+#include <support/xthread.h>
-+
-+/* This barrier is used to have the main thread wait until the helper
-+   threads have performed their allocations.  */
-+static pthread_barrier_t barrier;
-+
-+enum
-+  {
-+    /* Number of threads performing allocations.  */
-+    thread_count  = 4,
-+
-+    /* Amount of memory allocation per thread.  This should be large
-+       enough to cause the allocation of multiple heaps per arena.  */
-+    per_thread_allocations
-+      = sizeof (void *) == 4 ? 16 * 1024 * 1024 : 128 * 1024 * 1024,
-+  };
-+
-+static void *
-+allocation_thread_function (void *closure)
-+{
-+  struct list
-+  {
-+    struct list *next;
-+    long dummy[4];
-+  };
-+
-+  struct list *head = NULL;
-+  size_t allocated = 0;
-+  while (allocated < per_thread_allocations)
-+    {
-+      struct list *new_head = xmalloc (sizeof (*new_head));
-+      allocated += sizeof (*new_head);
-+      new_head->next = head;
-+      head = new_head;
-+    }
-+
-+  xpthread_barrier_wait (&barrier);
-+
-+  /* Main thread prints first statistics here.  */
-+
-+  xpthread_barrier_wait (&barrier);
-+
-+  while (head != NULL)
-+    {
-+      struct list *next_head = head->next;
-+      free (head);
-+      head = next_head;
-+    }
-+
-+  return NULL;
-+}
-+
-+static int
-+do_test (void)
-+{
-+  xpthread_barrier_init (&barrier, NULL, thread_count + 1);
-+
-+  pthread_t threads[thread_count];
-+  for (size_t i = 0; i < array_length (threads); ++i)
-+    threads[i] = xpthread_create (NULL, allocation_thread_function, NULL);
-+
-+  xpthread_barrier_wait (&barrier);
-+  puts ("info: After allocation:");
-+  malloc_info (0, stdout);
-+
-+  xpthread_barrier_wait (&barrier);
-+  for (size_t i = 0; i < array_length (threads); ++i)
-+    xpthread_join (threads[i]);
-+
-+  puts ("\ninfo: After deallocation:");
-+  malloc_info (0, stdout);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch b/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
deleted file mode 100644
index 9a08784106..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From f1cf98b583787cfb6278baea46e286a0ee7567fd Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Sun, 22 Oct 2017 10:00:57 +0200
-Subject: [PATCH] glob: Fix buffer overflow during GLOB_TILDE unescaping [BZ
- #22332]
-
-(cherry picked from commit a159b53fa059947cc2548e3b0d5bdcf7b9630ba8)
-
-Upstream-Status: Backport
-CVE: CVE-2017-15671
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- ChangeLog    | 6 ++++++
- NEWS         | 4 ++++
- posix/glob.c | 4 ++--
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-Index: git/NEWS
-===================================================================
---- git.orig/NEWS
-+++ git/NEWS
-@@ -20,6 +20,10 @@ Security related changes:
-   on the stack or the heap, depending on the length of the user name).
-   Reported by Tim Rühsen.
- 
-+  The glob function, when invoked with GLOB_TILDE and without
-+  GLOB_NOESCAPE, could write past the end of a buffer while
-+  unescaping user names.  Reported by Tim Rühsen.
-+
- The following bugs are resolved with this release:
- 
-   [16750] ldd: Never run file directly.
-Index: git/posix/glob.c
-===================================================================
---- git.orig/posix/glob.c
-+++ git/posix/glob.c
-@@ -850,11 +850,11 @@ glob (const char *pattern, int flags, in
- 		  char *p = mempcpy (newp, dirname + 1,
- 				     unescape - dirname - 1);
- 		  char *q = unescape;
--		  while (*q != '\0')
-+		  while (q != end_name)
- 		    {
- 		      if (*q == '\\')
- 			{
--			  if (q[1] == '\0')
-+			  if (q + 1 == end_name)
- 			    {
- 			      /* "~fo\\o\\" unescape to user_name "foo\\",
- 				 but "~fo\\o\\/" unescape to user_name
-Index: git/ChangeLog
-===================================================================
---- git.orig/ChangeLog
-+++ git/ChangeLog
-@@ -1,3 +1,9 @@
-+2017-10-22  Paul Eggert <eggert@cs.ucla.edu>
-+
-+       [BZ #22332]
-+       * posix/glob.c (__glob): Fix buffer overflow during GLOB_TILDE
-+       unescaping.
-+
- 2017-10-13  James Clarke  <jrtc27@jrtc27.com>
- 
- 	* sysdeps/powerpc/powerpc32/dl-machine.h (elf_machine_rela):
diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch b/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
deleted file mode 100644
index d9bde7f20a..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 4ebd0c4191c6073cc8a7c5fdcf1d182c4719bcbb Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sat, 30 Dec 2017 10:54:23 +0100
-Subject: [PATCH] elf: Check for empty tokens before dynamic string token
- expansion [BZ #22625]
-
-The fillin_rpath function in elf/dl-load.c loops over each RPATH or
-RUNPATH tokens and interprets empty tokens as the current directory
-("./"). In practice the check for empty token is done *after* the
-dynamic string token expansion. The expansion process can return an
-empty string for the $ORIGIN token if __libc_enable_secure is set
-or if the path of the binary can not be determined (/proc not mounted).
-
-Fix that by moving the check for empty tokens before the dynamic string
-token expansion. In addition, check for NULL pointer or empty strings
-return by expand_dynamic_string_token.
-
-The above changes highlighted a bug in decompose_rpath, an empty array
-is represented by the first element being NULL at the fillin_rpath
-level, but by using a -1 pointer in decompose_rpath and other functions.
-
-Changelog:
-	[BZ #22625]
-	* elf/dl-load.c (fillin_rpath): Check for empty tokens before dynamic
-	string token expansion. Check for NULL pointer or empty string possibly
-	returned by expand_dynamic_string_token.
-	(decompose_rpath): Check for empty path after dynamic string
-	token expansion.
-(cherry picked from commit 3e3c904daef69b8bf7d5cc07f793c9f07c3553ef)
-
-Upstream-Status: Backport
-CVE: CVE-2017-16997
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- ChangeLog     | 10 ++++++++++
- NEWS          |  4 ++++
- elf/dl-load.c | 49 +++++++++++++++++++++++++++++++++----------------
- 3 files changed, 47 insertions(+), 16 deletions(-)
-
-Index: git/NEWS
-===================================================================
---- git.orig/NEWS
-+++ git/NEWS
-@@ -211,6 +211,10 @@ Security related changes:
-   on the stack or the heap, depending on the length of the user name).
-   Reported by Tim Rühsen.
- 
-+  CVE-2017-16997: Incorrect handling of RPATH or RUNPATH containing $ORIGIN
-+  for AT_SECURE or SUID binaries could be used to load libraries from the
-+  current directory.
-+
- The following bugs are resolved with this release:
- 
-   [984] network: Respond to changed resolv.conf in gethostbyname
-Index: git/elf/dl-load.c
-===================================================================
---- git.orig/elf/dl-load.c
-+++ git/elf/dl-load.c
-@@ -433,32 +433,41 @@ fillin_rpath (char *rpath, struct r_sear
- {
-   char *cp;
-   size_t nelems = 0;
--  char *to_free;
- 
-   while ((cp = __strsep (&rpath, sep)) != NULL)
-     {
-       struct r_search_path_elem *dirp;
-+      char *to_free = NULL;
-+      size_t len = 0;
- 
--      to_free = cp = expand_dynamic_string_token (l, cp, 1);
-+      /* `strsep' can pass an empty string.  */
-+      if (*cp != '\0')
-+	{
-+	  to_free = cp = expand_dynamic_string_token (l, cp, 1);
- 
--      size_t len = strlen (cp);
-+	  /* expand_dynamic_string_token can return NULL in case of empty
-+	     path or memory allocation failure.  */
-+	  if (cp == NULL)
-+	    continue;
-+
-+	  /* Compute the length after dynamic string token expansion and
-+	     ignore empty paths.  */
-+	  len = strlen (cp);
-+	  if (len == 0)
-+	    {
-+	      free (to_free);
-+	      continue;
-+	    }
- 
--      /* `strsep' can pass an empty string.  This has to be
--	 interpreted as `use the current directory'. */
--      if (len == 0)
--	{
--	  static const char curwd[] = "./";
--	  cp = (char *) curwd;
-+	  /* Remove trailing slashes (except for "/").  */
-+	  while (len > 1 && cp[len - 1] == '/')
-+	    --len;
-+
-+	  /* Now add one if there is none so far.  */
-+	  if (len > 0 && cp[len - 1] != '/')
-+	    cp[len++] = '/';
- 	}
- 
--      /* Remove trailing slashes (except for "/").  */
--      while (len > 1 && cp[len - 1] == '/')
--	--len;
--
--      /* Now add one if there is none so far.  */
--      if (len > 0 && cp[len - 1] != '/')
--	cp[len++] = '/';
--
-       /* Make sure we don't use untrusted directories if we run SUID.  */
-       if (__glibc_unlikely (check_trusted) && !is_trusted_path (cp, len))
- 	{
-@@ -621,6 +630,14 @@ decompose_rpath (struct r_search_path_st
-      necessary.  */
-   free (copy);
- 
-+  /* There is no path after expansion.  */
-+  if (result[0] == NULL)
-+    {
-+      free (result);
-+      sps->dirs = (struct r_search_path_elem **) -1;
-+      return false;
-+    }
-+
-   sps->dirs = result;
-   /* The caller will change this value if we haven't used a real malloc.  */
-   sps->malloced = 1;
-Index: git/ChangeLog
-===================================================================
---- git.orig/ChangeLog
-+++ git/ChangeLog
-@@ -1,3 +1,13 @@
-+2017-12-30  Aurelien Jarno  <aurelien@aurel32.net>
-+           Dmitry V. Levin  <ldv@altlinux.org>
-+
-+       [BZ #22625]
-+       * elf/dl-load.c (fillin_rpath): Check for empty tokens before dynamic
-+       string token expansion. Check for NULL pointer or empty string possibly
-+       returned by expand_dynamic_string_token.
-+       (decompose_rpath): Check for empty path after dynamic string
-+       token expansion.
-+
- 2017-10-22  Paul Eggert <eggert@cs.ucla.edu>
- 
-        [BZ #22332]
diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch b/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
deleted file mode 100644
index bfa58bc1d6..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 34697694e8a93b325b18f25f7dcded55d6baeaf6 Mon Sep 17 00:00:00 2001
-From: Arjun Shankar <arjun@redhat.com>
-Date: Thu, 30 Nov 2017 13:31:45 +0100
-Subject: [PATCH] Fix integer overflow in malloc when tcache is enabled [BZ
- #22375]
-
-When the per-thread cache is enabled, __libc_malloc uses request2size (which
-does not perform an overflow check) to calculate the chunk size from the
-requested allocation size. This leads to an integer overflow causing malloc
-to incorrectly return the last successfully allocated block when called with
-a very large size argument (close to SIZE_MAX).
-
-This commit uses checked_request2size instead, removing the overflow.
-
-Upstream-Status: Backport
-CVE: CVE-2017-17426
-Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
-Rebase on new master
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- ChangeLog       | 6 ++++++
- malloc/malloc.c | 3 ++-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-Index: git/malloc/malloc.c
-===================================================================
---- git.orig/malloc/malloc.c
-+++ git/malloc/malloc.c
-@@ -3064,7 +3064,8 @@ __libc_malloc (size_t bytes)
-     return (*hook)(bytes, RETURN_ADDRESS (0));
- #if USE_TCACHE
-   /* int_free also calls request2size, be careful to not pad twice.  */
--  size_t tbytes = request2size (bytes);
-+  size_t tbytes;
-+  checked_request2size (bytes, tbytes);
-   size_t tc_idx = csize2tidx (tbytes);
- 
-   MAYBE_INIT_TCACHE ();
-Index: git/ChangeLog
-===================================================================
---- git.orig/ChangeLog
-+++ git/ChangeLog
-@@ -1,3 +1,9 @@
-+2017-11-30  Arjun Shankar  <arjun@redhat.com>
-+
-+       [BZ #22375]
-+       * malloc/malloc.c (__libc_malloc): Use checked_request2size
-+       instead of request2size.
-+
- 2017-12-30  Aurelien Jarno  <aurelien@aurel32.net>
-            Dmitry V. Levin  <ldv@altlinux.org>
- 
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 7eb56b328a..464b65434e 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native bison-native"
 
-SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
+SRCREV ?= "d300041c533a3d837c9f37a099bcc95466860e98"
 
 SRCBRANCH ?= "release/${PV}/master"
 
@@ -42,10 +42,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
-           file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
-           file://CVE-2017-15671.patch \
-           file://CVE-2017-16997.patch \
-           file://CVE-2017-17426.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.16.2


