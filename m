Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfBTT-0007Ru-U5
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 15:52:08 +0200
Received: by yib18 with SMTP id 18so834389yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 06:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=D/n71IoI94RaaHjkZpFDJ/2oO8gk3XdxViMOjfgQ/Gc=;
	b=ZZ5zv7BV7DgoyLAEr8Z4og+aI6sCaGYPBBQPr3ouqRjdu3NJkS2yKLQ8cpvXYBhm0l
	TziIsiVE1bJd65hqvYjDvR31rYbCDvCfHatfFhGgmSSt+vdmize1Zv0uT7S1li71zXsd
	t4b6eztmXyWX2LwvKtuH6fvFCIDfMnxy15Tcg=
Received: by 10.236.18.225 with SMTP id l61mr2565501yhl.519.1310132894619;
	Fri, 08 Jul 2011 06:48:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id p50sm2650140yhj.0.2011.07.08.06.48.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 06:48:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 13:47:44 +0000
Message-Id: <b81093b9840677dd5c63bbed58ebfe2150791504.1310132765.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1310132765.git.otavio@ossystems.com.br>
References: <cover.1310132765.git.otavio@ossystems.com.br>
Subject: [PATCH 5/8] libarchive: add 2.8.4 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 13:52:08 -0000

This recipe has been imported from OpenEmbedded (rev
6db4b9050e0e8b963e2a6b63790e48e3042ea99e).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../0001-Patch-from-upstream-revision-1990.patch   |   42 +++++++++++++
 .../0002-Patch-from-upstream-revision-1991.patch   |   31 ++++++++++
 .../0003-Patch-from-upstream-rev-2516.patch        |   63 ++++++++++++++++++++
 .../0004-Patch-from-upstream-rev-2514.patch        |   33 ++++++++++
 .../0005-Patch-from-upstream-rev-2520.patch        |   31 ++++++++++
 .../0006-Patch-from-upstream-rev-2521.patch        |   28 +++++++++
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |   31 ++++++++++
 .../libarchive/libarchive_2.8.4.bb                 |   25 ++++++++
 8 files changed, 284 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive_2.8.4.bb

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch b/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
new file mode 100644
index 0000000..f65f89f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
@@ -0,0 +1,42 @@
+libarchive: Backport patch from upstream (revision 1990)
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 7473c50..27671df 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -163,15 +163,26 @@ archive_read_disk_entry_from_file(struct archive *_a,
+ 
+ #ifdef HAVE_READLINK
+ 	if (S_ISLNK(st->st_mode)) {
+-		char linkbuffer[PATH_MAX + 1];
+-		int lnklen = readlink(path, linkbuffer, PATH_MAX);
++		size_t linkbuffer_len = st->st_size + 1;
++		char *linkbuffer;
++		int lnklen;
++
++		linkbuffer = malloc(linkbuffer_len);
++		if (linkbuffer == NULL) {
++			archive_set_error(&a->archive, ENOMEM,
++			    "Couldn't read link data");
++			return (ARCHIVE_FAILED);
++		}
++		lnklen = readlink(path, linkbuffer, linkbuffer_len);
+ 		if (lnklen < 0) {
+ 			archive_set_error(&a->archive, errno,
+ 			    "Couldn't read link data");
++			free(linkbuffer);
+ 			return (ARCHIVE_FAILED);
+ 		}
+ 		linkbuffer[lnklen] = 0;
+ 		archive_entry_set_symlink(entry, linkbuffer);
++		free(linkbuffer);
+ 	}
+ #endif
+ 
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch b/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
new file mode 100644
index 0000000..6ece7f3
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
@@ -0,0 +1,31 @@
+libarchive: Backport patch from upstream (revision 1991)
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_write_disk.c b/libarchive/archive_write_disk.c
+index caf958e..60699e0 100644
+--- a/libarchive/archive_write_disk.c
++++ b/libarchive/archive_write_disk.c
+@@ -434,7 +434,7 @@ _archive_write_header(struct archive *_a, struct archive_entry *entry)
+ 		if (ret != ARCHIVE_OK)
+ 			goto done;
+ 	}
+-#ifdef HAVE_FCHDIR
++#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
+ 	/* If path exceeds PATH_MAX, shorten the path. */
+ 	edit_deep_directories(a);
+ #endif
+@@ -866,7 +866,7 @@ archive_write_disk_new(void)
+  * object creation is likely to fail, but any error will get handled
+  * at that time.
+  */
+-#ifdef HAVE_FCHDIR
++#if defined(HAVE_FCHDIR) && defined(PATH_MAX)
+ static void
+ edit_deep_directories(struct archive_write_disk *a)
+ {
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch b/meta/recipes-extended/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
new file mode 100644
index 0000000..0193a07
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Patch-from-upstream-rev-2516.patch
@@ -0,0 +1,63 @@
+libarchive: Backport patch from upstream (rev 2516)
+
+Fix Issue 100:  Allow a zero for the Type M Path Table Location, since
+WinISO (and probably other programs) set it this way.
+
+http://code.google.com/p/libarchive/source/detail?r=2516
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 0c640c8..fdef3fb 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -714,11 +714,13 @@ isSVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
+ 		return (0);
+ 
+-	/* Location of Occurrence of Type M Path Table must be
+-	 * available location,
++	/* The Type M Path Table must be at a valid location (WinISO
++	 * and probably other programs omit this, so we allow zero)
++	 *
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+SVD_type_M_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Read Root Directory Record in Volume Descriptor. */
+@@ -790,7 +792,8 @@ isEVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	 * available location,
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+PVD_type_m_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Reserved field must be 0. */
+@@ -865,11 +868,14 @@ isPVD(struct iso9660 *iso9660, const unsigned char *h)
+ 	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
+ 		return (0);
+ 
+-	/* Location of Occurrence of Type M Path Table must be
+-	 * available location,
++	/* The Type M Path Table must also be at a valid location
++	 * (although ECMA 119 requires a Type M Path Table, WinISO and
++	 * probably other programs omit it, so we permit a zero here)
++	 *
+ 	 * > SYSTEM_AREA_BLOCK(16) + 2 and < Volume Space Size. */
+ 	location = archive_be32dec(h+PVD_type_m_path_table_offset);
+-	if (location <= SYSTEM_AREA_BLOCK+2 || location >= volume_block)
++	if ((location > 0 && location <= SYSTEM_AREA_BLOCK+2)
++	    || location >= volume_block)
+ 		return (0);
+ 
+ 	/* Reserved field must be 0. */
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch b/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
new file mode 100644
index 0000000..eaa9ad0
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
@@ -0,0 +1,33 @@
+libarchive: Backport patch from upstream (rev 2514)
+
+Enable version stripping code in joliet extension support for iso9660.
+
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=587316
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index fdef3fb..8dcfeb4 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1755,7 +1755,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		}
+ 		*wp = L'\0';
+ 
+-#if 0 /* untested code, is it at all useful on Joliet? */
+ 		/* trim trailing first version and dot from filename.
+ 		 *
+ 		 * Remember we where in UTF-16BE land!
+@@ -1775,7 +1774,6 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		/* Chop off trailing '.' from filenames. */
+ 		if (*(wp-1) == '.')
+ 			*(--wp) = L'\0';
+-#endif
+ 
+ 		/* store the result in the file name field. */
+ 		archive_strappend_w_utf8(&file->name, wbuff);
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch b/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
new file mode 100644
index 0000000..dd8ac6a
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
@@ -0,0 +1,31 @@
+libarchive: Backport patch from upstream (rev 2520)
+
+Fix version/dot stripping code in joliet extension of iso9660.
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 8dcfeb4..2d3a855 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1766,13 +1766,13 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 		 *       *, /, :, ;, ? and \.
+ 		 */
+ 		/* Chop off trailing ';1' from files. */
+-		if (*(wp-2) == ';' && *(wp-1) == '1') {
++		if (*(wp-2) == L';' && *(wp-1) == L'1') {
+ 			wp-=2;
+ 			*wp = L'\0';
+ 		}
+ 
+ 		/* Chop off trailing '.' from filenames. */
+-		if (*(wp-1) == '.')
++		if (*(wp-1) == L'.')
+ 			*(--wp) = L'\0';
+ 
+ 		/* store the result in the file name field. */
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch b/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
new file mode 100644
index 0000000..b55ae17
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
@@ -0,0 +1,28 @@
+libarchive: Backport patch from upstream (rev 2521).
+
+Disable dot stripping code since it's still broken
+and noone has been able to figure it out (yet).
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index 2d3a855..8661532 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -1771,9 +1771,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 			*wp = L'\0';
+ 		}
+ 
++#if 0 /* XXX: this somehow manages to strip of single-character file extensions, like '.c'. */
+ 		/* Chop off trailing '.' from filenames. */
+ 		if (*(wp-1) == L'.')
+ 			*(--wp) = L'\0';
++#endif
+ 
+ 		/* store the result in the file name field. */
+ 		archive_strappend_w_utf8(&file->name, wbuff);
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch b/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
new file mode 100644
index 0000000..b5465a3
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
@@ -0,0 +1,31 @@
+libarchive: Ignore ENOSYS error when setting up xattrs. (Closes: #588925)
+
+Modestas Vainius found out that HPPA returns errno ENOSYS
+on listxattrs. Currently, ENOTSUP is ignored so we'll do the
+same for ENOSYS as well.
+
+For full debug info about this see Modestas Vainius awesome
+report at:
+
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=588925#10
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 27671df..c49e755 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -398,7 +398,7 @@ setup_xattrs(struct archive_read_disk *a,
+ 		list_size = listxattr(path, NULL, 0);
+ 
+ 	if (list_size == -1) {
+-		if (errno == ENOTSUP)
++		if (errno == ENOTSUP || errno == ENOSYS)
+ 			return (ARCHIVE_OK);
+ 		archive_set_error(&a->archive, errno,
+ 			"Couldn't list extended attributes");
+-- 
+1.7.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_2.8.4.bb b/meta/recipes-extended/libarchive/libarchive_2.8.4.bb
new file mode 100644
index 0000000..6d4fb39
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive_2.8.4.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "C library and command-line tools for reading and writing tar, cpio, zip, ISO, and other archive formats"
+HOMEPAGE = "http://code.google.com/p/libarchive/"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4255e2e6f0349a4ac8fbd68459296e46"
+PR = "r0"
+
+DEPENDS = "libxml2"
+
+SRC_URI = "http://libarchive.googlecode.com/files/libarchive-${PV}.tar.gz \
+           file://0001-Patch-from-upstream-revision-1990.patch \
+           file://0002-Patch-from-upstream-revision-1991.patch \
+           file://0003-Patch-from-upstream-rev-2516.patch \
+           file://0004-Patch-from-upstream-rev-2514.patch \
+           file://0005-Patch-from-upstream-rev-2520.patch \
+           file://0006-Patch-from-upstream-rev-2521.patch \
+           file://0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch \
+           "
+
+SRC_URI[md5sum] = "83b237a542f27969a8d68ac217dc3796"
+SRC_URI[sha256sum] = "86cffa3eaa28d3116f5d0b20284026c3762cf4a2b52b9844df2b494d4a89f688"
+
+inherit autotools lib_package
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.2.5



