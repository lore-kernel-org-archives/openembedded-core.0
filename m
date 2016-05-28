Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 64C5F6FF78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 13:26:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a136so7672267wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hbVxqw65PXiLkBPtNqhhtukz0BxFwOImPyBkioQlpM8=;
	b=JbPvrM0Pjao79ZSD3/sZETRaubLAAY2XAlOjThD9UmgNkT1dxo5F+uTw42I1/BF+6h
	i7L0X26YKULGd2DSoIzCWKcWYaBLlpXMdn/3Lcw6qdE8FjWsfR0oFNRVizZ8Wm7vVdSc
	n3t2lAF2nkhjlc8A83qSXVSclLX7hWsbEg2vUpTTiFLl13ARUkJ5olRZglvn2KOdf4FJ
	TFetLdbXsOVEx6obbM2fy6tjB8qWbcAzyMNM0PO1AuqpYf6a2TwE2aWbMMkyWsz4qMVR
	aA99MUNflz61x5B39dBFW2S9yR+T7en6x3U2NPB4goI7nkzFwFzlhCTmYKugmYNetebP
	Ijtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=hbVxqw65PXiLkBPtNqhhtukz0BxFwOImPyBkioQlpM8=;
	b=fEUxd2mFaWxa/i8cNgr7+LSSgaFqRuqIZV2KZSAWtEmEozF2Wabzs67LhjJMbWuWcm
	gMBMrJKGzD80ZOthj79dBnAm6OQeCreuA+YWl3xzW5ulN0Gg0u8AmkU7oc80cL7PP0+u
	a+J7dwuRklPsB4esRlXq5bFhw2jLS/5jGeJdrnxT9m6lv98KwIfwQHLbCVT8bSQ7OxYs
	Qusqr2QM0rhIWSQ+xT5Tq8pGWJPLdFyzY4KJfoAm2L58gOApv4g6zpLIo546eY+dZoZT
	Wp+fUdRAscVGRT5QlMniznwIjOCmOOw4ZmeOnFr5637RRkFrA+/udt90CDfYuH22iksa
	I/7w==
X-Gm-Message-State: ALyK8tLd9LJp/hQfD4U8ESChLKLwxmZsuvdoJPZpFU/foeY3N8UfveQgG5pWGbpZFkF04g==
X-Received: by 10.194.175.36 with SMTP id bx4mr19222931wjc.35.1464441970940;
	Sat, 28 May 2016 06:26:10 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	m3sm24386895wjc.27.2016.05.28.06.26.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 May 2016 06:26:10 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2016 14:26:15 +0100
Message-Id: <1464441975-10342-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464441975-10342-1-git-send-email-paul@paulbarker.me.uk>
References: <1464441975-10342-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH] libarchive: Upgrade to v3.2.0
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
X-List-Received-Date: Sat, 28 May 2016 13:26:14 -0000

All patches are removed as they are no longer needed. Most were merged into this
release of libarchive. "0001-Set-xattrs-after-setting-times.patch" was dropped
upstream after discussion, see https://github.com/libarchive/libarchive/pull/664.

The COPYING file in libarchive had a couple of minor changes to clarify which
files are under which copyrights but the overall license is unaffected.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0001-Set-xattrs-after-setting-times.patch      |  59 --------
 .../libarchive/libarchive-CVE-2013-0211.patch      |  39 ------
 .../libarchive/libarchive-CVE-2015-2304.patch      | 152 ---------------------
 .../libarchive/libarchive/mkdir.patch              |  45 ------
 .../libarchive/libarchive/pkgconfig.patch          |  25 ----
 .../{libarchive_3.1.2.bb => libarchive_3.2.0.bb}   |  11 +-
 6 files changed, 3 insertions(+), 328 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/mkdir.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.1.2.bb => libarchive_3.2.0.bb} (83%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch b/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
deleted file mode 100644
index 6d74e86..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 545ded56095c570426fe102ff2192889681ea75c Mon Sep 17 00:00:00 2001
-From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
-Date: Mon, 29 Feb 2016 14:38:25 +0200
-Subject: [PATCH] Set xattrs after setting times
-
-With Integrity Measurement Architecture (IMA) enabled in Linux
-kernel the security.ima extended attribute gets overwritten
-when setting times on a file with a futimens() call. So it's safer
-to set xattrs after times.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/664]
-
-Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
-
----
- libarchive/archive_write_disk_posix.c | 21 +++++++++++----------
- 1 file changed, 11 insertions(+), 10 deletions(-)
-
-diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
-index 0fc6193..27c9c1e 100644
---- a/libarchive/archive_write_disk_posix.c
-+++ b/libarchive/archive_write_disk_posix.c
-@@ -1620,16 +1620,6 @@ _archive_write_disk_finish_entry(struct archive *_a)
-	}
-
-	/*
--	 * Security-related extended attributes (such as
--	 * security.capability on Linux) have to be restored last,
--	 * since they're implicitly removed by other file changes.
--	 */
--	if (a->todo & TODO_XATTR) {
--		int r2 = set_xattrs(a);
--		if (r2 < ret) ret = r2;
--	}
--
--	/*
-	 * Some flags prevent file modification; they must be restored after
-	 * file contents are written.
-	 */
-@@ -1648,6 +1638,17 @@ _archive_write_disk_finish_entry(struct archive *_a)
-	}
-
-	/*
-+	 * Security-related extended attributes (such as
-+	 * security.capability or security.ima on Linux) have to be restored last,
-+	 * since they're implicitly removed by other file changes like setting
-+	 * times.
-+	 */
-+	if (a->todo & TODO_XATTR) {
-+		int r2 = set_xattrs(a);
-+		if (r2 < ret) ret = r2;
-+	}
-+
-+	/*
-	 * Mac extended metadata includes ACLs.
-	 */
-	if (a->todo & TODO_MAC_METADATA) {
---
-2.5.0
diff --git a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
deleted file mode 100644
index 19523f4..0000000
--- a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2f55d6bd308ea61975558c2469ae349dba297e89 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sat, 22 Feb 2014 14:35:59 +0800
-Subject: [PATCH] Fix CVE-2013-0211
-
-This patch comes from:https://github.com/libarchive/libarchive/commit/22531545514043e04633e1c015c7540b9de9dbe4
-
-Upstream-Status: Backport
-CVE: CVE-2013-0211
-
-Signed-off-by: Baogen shang <baogen.shang@windriver.com>
-
-Update the patch because of uprev on 20140222
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libarchive/archive_write.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
-index a3d1a33..a323588 100644
---- a/libarchive/archive_write.c
-+++ b/libarchive/archive_write.c
-@@ -671,8 +671,12 @@ static ssize_t
- _archive_write_data(struct archive *_a, const void *buff, size_t s)
- {
- 	struct archive_write *a = (struct archive_write *)_a;
-+	const size_t max_write = INT_MAX;
- 	archive_check_magic(&a->archive, ARCHIVE_WRITE_MAGIC,
- 	    ARCHIVE_STATE_DATA, "archive_write_data");
-+	/* In particular, this catches attempts to pass negative values. */
-+	if (s > max_write)
-+		s = max_write;
- 	archive_clear_error(&a->archive);
- 	return ((a->format_write_data)(a, buff, s));
- }
--- 
-1.8.2.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch b/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
deleted file mode 100644
index 5c24396..0000000
--- a/meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 59357157706d47c365b2227739e17daba3607526 Mon Sep 17 00:00:00 2001
-From: Alessandro Ghedini <alessandro@ghedini.me>
-Date: Sun, 1 Mar 2015 12:07:45 +0100
-Subject: [PATCH] Add ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS option
-
-This fixes a directory traversal in the cpio tool.
-
-
-Upstream-Status: backport
-CVE: CVE-2015-2304
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- cpio/bsdcpio.1                           |    3 ++-
- cpio/cpio.c                              |    2 ++
- libarchive/archive.h                     |    2 ++
- libarchive/archive_write_disk.3          |    3 +++
- libarchive/archive_write_disk_posix.c    |   14 +++++++++++---
- libarchive/test/test_write_disk_secure.c |   23 +++++++++++++++++++++++
- 6 files changed, 43 insertions(+), 4 deletions(-)
-
-diff --git a/cpio/bsdcpio.1 b/cpio/bsdcpio.1
-index f966aa0..e52546e 100644
---- a/cpio/bsdcpio.1
-+++ b/cpio/bsdcpio.1
-@@ -156,7 +156,8 @@ See above for description.
- .It Fl Fl insecure
- (i and p mode only)
- Disable security checks during extraction or copying.
--This allows extraction via symbolic links and path names containing
-+This allows extraction via symbolic links, absolute paths,
-+and path names containing
- .Sq ..
- in the name.
- .It Fl J , Fl Fl xz
-diff --git a/cpio/cpio.c b/cpio/cpio.c
-index 0acde11..b267e9b 100644
---- a/cpio/cpio.c
-+++ b/cpio/cpio.c
-@@ -171,6 +171,7 @@ main(int argc, char *argv[])
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER;
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_SYMLINKS;
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_NODOTDOT;
-+	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS;
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_PERM;
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_FFLAGS;
- 	cpio->extract_flags |= ARCHIVE_EXTRACT_ACL;
-@@ -256,6 +257,7 @@ main(int argc, char *argv[])
- 		case OPTION_INSECURE:
- 			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_SYMLINKS;
- 			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_NODOTDOT;
-+			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS;
- 			break;
- 		case 'L': /* GNU cpio */
- 			cpio->option_follow_links = 1;
-diff --git a/libarchive/archive.h b/libarchive/archive.h
-index 1f0fc38..ef635ac 100644
---- a/libarchive/archive.h
-+++ b/libarchive/archive.h
-@@ -649,6 +649,8 @@ __LA_DECL int archive_read_set_passphrase_callback(struct archive *,
- /* Default: Do not use HFS+ compression if it was not compressed. */
- /* This has no effect except on Mac OS v10.6 or later. */
- #define	ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED	(0x8000)
-+/* Default: Do not reject entries with absolute paths */
-+#define ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS (0x10000)
- 
- __LA_DECL int archive_read_extract(struct archive *, struct archive_entry *,
- 		     int flags);
-diff --git a/libarchive/archive_write_disk.3 b/libarchive/archive_write_disk.3
-index fa925cc..a2e7afa 100644
---- a/libarchive/archive_write_disk.3
-+++ b/libarchive/archive_write_disk.3
-@@ -177,6 +177,9 @@ The default is to not refuse such paths.
- Note that paths ending in
- .Pa ..
- always cause an error, regardless of this flag.
-+.It Cm ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS
-+Refuse to extract an absolute path.
-+The default is to not refuse such paths.
- .It Cm ARCHIVE_EXTRACT_SPARSE
- Scan data for blocks of NUL bytes and try to recreate them with holes.
- This results in sparse files, independent of whether the archive format
-diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
-index ab3bdac..c1290eb 100644
---- a/libarchive/archive_write_disk_posix.c
-+++ b/libarchive/archive_write_disk_posix.c
-@@ -2509,8 +2509,9 @@ cleanup_pathname_win(struct archive_write_disk *a)
- /*
-  * Canonicalize the pathname.  In particular, this strips duplicate
-  * '/' characters, '.' elements, and trailing '/'.  It also raises an
-- * error for an empty path, a trailing '..' or (if _SECURE_NODOTDOT is
-- * set) any '..' in the path.
-+ * error for an empty path, a trailing '..', (if _SECURE_NODOTDOT is
-+ * set) any '..' in the path or (if ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS
-+ * is set) if the path is absolute.
-  */
- static int
- cleanup_pathname(struct archive_write_disk *a)
-@@ -2529,8 +2530,15 @@ cleanup_pathname(struct archive_write_disk *a)
- 	cleanup_pathname_win(a);
- #endif
- 	/* Skip leading '/'. */
--	if (*src == '/')
-+	if (*src == '/') {
-+		if (a->flags & ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS) {
-+			archive_set_error(&a->archive, ARCHIVE_ERRNO_MISC,
-+			                  "Path is absolute");
-+			return (ARCHIVE_FAILED);
-+		}
-+
- 		separator = *src++;
-+	}
- 
- 	/* Scan the pathname one element at a time. */
- 	for (;;) {
-diff --git a/libarchive/test/test_write_disk_secure.c b/libarchive/test/test_write_disk_secure.c
-index 31c5bfd..2c94206 100644
---- a/libarchive/test/test_write_disk_secure.c
-+++ b/libarchive/test/test_write_disk_secure.c
-@@ -178,6 +178,29 @@ DEFINE_TEST(test_write_disk_secure)
- 	assert(S_ISDIR(st.st_mode));
- 	archive_entry_free(ae);
- 
-+	/*
-+	 * Without security checks, we should be able to
-+	 * extract an absolute path.
-+	 */
-+	assert((ae = archive_entry_new()) != NULL);
-+	archive_entry_copy_pathname(ae, "/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
-+	archive_entry_set_mode(ae, S_IFREG | 0777);
-+	assert(0 == archive_write_header(a, ae));
-+	assert(0 == archive_write_finish_entry(a));
-+	assertFileExists("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
-+	assert(0 == unlink("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp"));
-+
-+	/* But with security checks enabled, this should fail. */
-+	assert(archive_entry_clear(ae) != NULL);
-+	archive_entry_copy_pathname(ae, "/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
-+	archive_entry_set_mode(ae, S_IFREG | 0777);
-+	archive_write_disk_set_options(a, ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS);
-+	failure("Extracting an absolute path should fail here.");
-+	assertEqualInt(ARCHIVE_FAILED, archive_write_header(a, ae));
-+	archive_entry_free(ae);
-+	assert(0 == archive_write_finish_entry(a));
-+	assertFileNotExists("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
-+
- 	assertEqualInt(ARCHIVE_OK, archive_write_free(a));
- 
- 	/* Test the entries on disk. */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-extended/libarchive/libarchive/mkdir.patch b/meta/recipes-extended/libarchive/libarchive/mkdir.patch
deleted file mode 100644
index 509a295..0000000
--- a/meta/recipes-extended/libarchive/libarchive/mkdir.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Add missing mkdir calls so that out-of-tree builds work.
-
-Upstream-Status: Submitted (https://github.com/libarchive/libarchive/pull/534)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 3fa2d22..5ecca52 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -508,6 +508,7 @@ libarchive_test_LDADD= $(LTLIBICONV)
- # Building it automatically provides a sanity-check on libarchive_test_SOURCES
- # above.
- libarchive/test/list.h: Makefile
-+	$(MKDIR_P) libarchive/test
- 	cat $(top_srcdir)/libarchive/test/test_*.c | grep DEFINE_TEST > libarchive/test/list.h
- 
- libarchive_TESTS_ENVIRONMENT= LIBARCHIVE_TEST_FILES=`cd $(top_srcdir);/bin/pwd`/libarchive/test LRZIP=NOCONFIG
-@@ -835,6 +836,7 @@ bsdtar_test_CPPFLAGS=\
- 	$(PLATFORMCPPFLAGS)
- 
- tar/test/list.h: Makefile
-+	$(MKDIR_P) tar/test
- 	cat $(top_srcdir)/tar/test/test_*.c | grep DEFINE_TEST > tar/test/list.h
- 
- if BUILD_BSDTAR
-@@ -975,6 +977,7 @@ bsdcpio_test_CPPFLAGS= \
- bsdcpio_test_LDADD=libarchive_fe.la
- 
- cpio/test/list.h: Makefile
-+	$(MKDIR_P) cpio/test
- 	cat $(top_srcdir)/cpio/test/test_*.c | grep DEFINE_TEST > cpio/test/list.h
- 
- if BUILD_BSDCPIO
-diff --git a/configure.ac b/configure.ac
-index 38bd299..7bdb00c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -102,6 +102,7 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
- AC_CHECK_TOOL([STRIP],[strip])
-+AC_PROG_MKDIR_P
- 
- #
- # Options for building bsdtar.
diff --git a/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch b/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
deleted file mode 100644
index 346af91..0000000
--- a/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Use pkg-config for the libxml2 dependency, not the -config script.
-
-Upstream-Status: Pending
-
-RP 2014/5/22
-
-Index: libarchive-3.1.2/configure.ac
-===================================================================
---- libarchive-3.1.2.orig/configure.ac	2013-02-09 17:23:03.000000000 +0000
-+++ libarchive-3.1.2/configure.ac	2014-05-13 15:26:45.446499108 +0000
-@@ -329,10 +329,10 @@
-   AS_HELP_STRING([--without-expat], [Don't build support for xar through expat]))
- 
- if test "x$with_xml2" != "xno"; then
--  AC_PATH_PROG([XML2_CONFIG], [xml2-config],, [${PATH}])
--  if test "x$XML2_CONFIG" != "x"; then
--    CPPFLAGS="${CPPFLAGS} `${XML2_CONFIG} --cflags`"
--    LIBS="${LIBS} `${XML2_CONFIG} --libs`"
-+  PKG_CHECK_MODULES(PKG_XML2, [libxml-2.0],,)
-+  if test "x$PKG_XML2_CFLAGS" != "x"; then
-+    CPPFLAGS="${CPPFLAGS} ${PKG_XML2_CFLAGS}"
-+    LIBS="${LIBS} ${PKG_XML2_LIBS}"
-     AC_CHECK_LIB(xml2,xmlInitParser,[true],AC_MSG_FAILURE(Missing xml2 library))
-   else
-     AC_CHECK_LIB(xml2,xmlInitParser)
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
similarity index 83%
rename from meta/recipes-extended/libarchive/libarchive_3.1.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.2.0.bb
index ed677ac..e1f0202 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.2.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ed99aca006bc346974bb745a35336425"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -31,15 +31,10 @@ PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://libarchive-CVE-2013-0211.patch \
-           file://pkgconfig.patch \
-           file://libarchive-CVE-2015-2304.patch \
-           file://mkdir.patch \
-           file://0001-Set-xattrs-after-setting-times.patch \
            "
 
-SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
-SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
+SRC_URI[md5sum] = "596210b5a9c2ff74a0f7ca34838d655f"
+SRC_URI[sha256sum] = "7bce45fd71ff01dc20d19edd78322d4965583d81b8bed8e26cacb65d6f5baa87"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.1.4


