Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0270561FE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 11:55:26 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so2646343wib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=s/8SYQqTr9QxZ0I58IDfR33ijhVzEIp2pOgaqGTqPEw=;
	b=TEXruc62PSB+Jvyy+cBo45nYJ2SXGhTV9qZeyGOK24myKwSzpVsD3DtXaLecJ2H6m0
	Dmaq1L63eZeuEbB7nXaXAeXY/xEG3sTbovmo86Yu2+sWD3A1V9MqBQU1maxoZHfB2WW4
	twypLJ3x/CyXmLWxP6xJfTI6TcBL9zrjvtUggbKEdAtz4V0iCfc78Sh7QH0R6MyNHWOA
	QkXSUDsKV2aZ/pQhKTiaG80uj4GxsdUS/TQwt/mxQvJ6fjpJ4vfmQ7r/cCXfsO5aykti
	N2ulPxI3q+TdNZy9ti4wrab8EhCG+xu7hBiUfTGjBDhnkyMqXn4UGvBOJF2l3XjvTT9P
	Cy/A==
X-Received: by 10.180.9.209 with SMTP id c17mr5083667wib.13.1389009327620;
	Mon, 06 Jan 2014 03:55:27 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83]) by mx.google.com with ESMTPSA id
	jw4sm42403054wjc.20.2014.01.06.03.55.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jan 2014 03:55:26 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 11:55:14 +0000
Message-Id: <1389009314-21716-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH] libarchive: Upgrade to v3.1.2
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
X-List-Received-Date: Mon, 06 Jan 2014 11:55:28 -0000

All patches against libarchive in oe-core appear to be merged into the latest
release. The license checksum has changed because a couple of referenced files
have been renamed but there is no change to the license terms themselves.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0001-Patch-from-upstream-revision-1990.patch   | 42 ----------------------
 .../0002-Patch-from-upstream-revision-1991.patch   | 31 ----------------
 .../0004-Patch-from-upstream-rev-2514.patch        | 33 -----------------
 .../0005-Patch-from-upstream-rev-2520.patch        | 31 ----------------
 .../0006-Patch-from-upstream-rev-2521.patch        | 28 ---------------
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch | 31 ----------------
 .../{libarchive_2.8.5.bb => libarchive_3.1.2.bb}   | 14 +++-----
 7 files changed, 4 insertions(+), 206 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
 rename meta/recipes-extended/libarchive/{libarchive_2.8.5.bb => libarchive_3.1.2.bb} (64%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch b/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
deleted file mode 100644
index f65f89f..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-libarchive: Backport patch from upstream (revision 1990)
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
-index 7473c50..27671df 100644
---- a/libarchive/archive_read_disk_entry_from_file.c
-+++ b/libarchive/archive_read_disk_entry_from_file.c
-@@ -163,15 +163,26 @@ archive_read_disk_entry_from_file(struct archive *_a,
- 
- #ifdef HAVE_READLINK
- 	if (S_ISLNK(st->st_mode)) {
--		char linkbuffer[PATH_MAX + 1];
--		int lnklen = readlink(path, linkbuffer, PATH_MAX);
-+		size_t linkbuffer_len = st->st_size + 1;
-+		char *linkbuffer;
-+		int lnklen;
-+
-+		linkbuffer = malloc(linkbuffer_len);
-+		if (linkbuffer == NULL) {
-+			archive_set_error(&a->archive, ENOMEM,
-+			    "Couldn't read link data");
-+			return (ARCHIVE_FAILED);
-+		}
-+		lnklen = readlink(path, linkbuffer, linkbuffer_len);
- 		if (lnklen < 0) {
- 			archive_set_error(&a->archive, errno,
- 			    "Couldn't read link data");
-+			free(linkbuffer);
- 			return (ARCHIVE_FAILED);
- 		}
- 		linkbuffer[lnklen] = 0;
- 		archive_entry_set_symlink(entry, linkbuffer);
-+		free(linkbuffer);
- 	}
- #endif
- 
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch b/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
deleted file mode 100644
index 6ece7f3..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-libarchive: Backport patch from upstream (revision 1991)
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_write_disk.c b/libarchive/archive_write_disk.c
-index caf958e..60699e0 100644
---- a/libarchive/archive_write_disk.c
-+++ b/libarchive/archive_write_disk.c
-@@ -434,7 +434,7 @@ _archive_write_header(struct archive *_a, struct archive_entry *entry)
- 		if (ret != ARCHIVE_OK)
- 			goto done;
- 	}
--#ifdef HAVE_FCHDIR
-+#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
- 	/* If path exceeds PATH_MAX, shorten the path. */
- 	edit_deep_directories(a);
- #endif
-@@ -866,7 +866,7 @@ archive_write_disk_new(void)
-  * object creation is likely to fail, but any error will get handled
-  * at that time.
-  */
--#ifdef HAVE_FCHDIR
-+#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
- static void
- edit_deep_directories(struct archive_write_disk *a)
- {
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch b/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
deleted file mode 100644
index eaa9ad0..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-libarchive: Backport patch from upstream (rev 2514)
-
-Enable version stripping code in joliet extension support for iso9660.
-
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=587316
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index fdef3fb..8dcfeb4 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -1755,7 +1755,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
- 		}
- 		*wp = L'\0';
- 
--#if 0 /* untested code, is it at all useful on Joliet? */
- 		/* trim trailing first version and dot from filename.
- 		 *
- 		 * Remember we where in UTF-16BE land!
-@@ -1775,7 +1774,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
- 		/* Chop off trailing '.' from filenames. */
- 		if (*(wp-1) == '.')
- 			*(--wp) = L'\0';
--#endif
- 
- 		/* store the result in the file name field. */
- 		archive_strappend_w_utf8(&file->name, wbuff);
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch b/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
deleted file mode 100644
index dd8ac6a..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-libarchive: Backport patch from upstream (rev 2520)
-
-Fix version/dot stripping code in joliet extension of iso9660.
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index 8dcfeb4..2d3a855 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -1766,13 +1766,13 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
- 		 *       *, /, :, ;, ? and \.
- 		 */
- 		/* Chop off trailing ';1' from files. */
--		if (*(wp-2) == ';' && *(wp-1) == '1') {
-+		if (*(wp-2) == L';' && *(wp-1) == L'1') {
- 			wp-=2;
- 			*wp = L'\0';
- 		}
- 
- 		/* Chop off trailing '.' from filenames. */
--		if (*(wp-1) == '.')
-+		if (*(wp-1) == L'.')
- 			*(--wp) = L'\0';
- 
- 		/* store the result in the file name field. */
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch b/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
deleted file mode 100644
index b55ae17..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-libarchive: Backport patch from upstream (rev 2521).
-
-Disable dot stripping code since it's still broken
-and noone has been able to figure it out (yet).
-
-Upstream-Status: Backport
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index 2d3a855..8661532 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -1771,9 +1771,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
- 			*wp = L'\0';
- 		}
- 
-+#if 0 /* XXX: this somehow manages to strip of single-character file extensions, like '.c'. */
- 		/* Chop off trailing '.' from filenames. */
- 		if (*(wp-1) == L'.')
- 			*(--wp) = L'\0';
-+#endif
- 
- 		/* store the result in the file name field. */
- 		archive_strappend_w_utf8(&file->name, wbuff);
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch b/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
deleted file mode 100644
index b5465a3..0000000
--- a/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-libarchive: Ignore ENOSYS error when setting up xattrs. (Closes: #588925)
-
-Modestas Vainius found out that HPPA returns errno ENOSYS
-on listxattrs. Currently, ENOTSUP is ignored so we'll do the
-same for ENOSYS as well.
-
-For full debug info about this see Modestas Vainius awesome
-report at:
-
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=588925#10
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
-index 27671df..c49e755 100644
---- a/libarchive/archive_read_disk_entry_from_file.c
-+++ b/libarchive/archive_read_disk_entry_from_file.c
-@@ -398,7 +398,7 @@ setup_xattrs(struct archive_read_disk *a,
- 		list_size = listxattr(path, NULL, 0);
- 
- 	if (list_size == -1) {
--		if (errno == ENOTSUP)
-+		if (errno == ENOTSUP || errno == ENOSYS)
- 			return (ARCHIVE_OK);
- 		archive_set_error(&a->archive, errno,
- 			"Couldn't list extended attributes");
--- 
-1.7.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
similarity index 64%
rename from meta/recipes-extended/libarchive/libarchive_2.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 5ba9a52..ffe0b2e 100644
--- a/meta/recipes-extended/libarchive/libarchive_2.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
@@ -25,17 +25,11 @@ PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[libxml2] = "--with-xml2,--without-xml2,libxml2,"
 PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat,"
 
-SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
-           file://0001-Patch-from-upstream-revision-1990.patch \
-           file://0002-Patch-from-upstream-revision-1991.patch \
-           file://0004-Patch-from-upstream-rev-2514.patch \
-           file://0005-Patch-from-upstream-rev-2520.patch \
-           file://0006-Patch-from-upstream-rev-2521.patch \
-           file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            "
 
-SRC_URI[md5sum] = "9caf51dcf6213e9c9f5a1c27448b9c90"
-SRC_URI[sha256sum] = "13993e0ffbd121ccda46ea226b1f8eac218de0fa8da7d8b1f998093d5c32a72d"
+SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
+SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
 
 inherit autotools lib_package
 
-- 
1.8.5.2


