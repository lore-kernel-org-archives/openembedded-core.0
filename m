Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE3D37E27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 02:45:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,435,1559491200"; d="scan'208";a="74318690"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 10:45:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E0C244CE045E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 10:45:44 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 27 Aug 2019 10:45:52 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2019 10:45:16 +0800
Message-ID: <20190827024516.7248-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E0C244CE045E.AC256
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libarchive:upgrade 3.3.3 -> 3.4.0
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
X-List-Received-Date: Tue, 27 Aug 2019 02:45:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-libarchive/CVE-2018-1000877.patch
-libarchive/CVE-2018-1000878.patch
-libarchive/CVE-2018-1000879.patch
-libarchive/CVE-2018-1000880.patch
-libarchive/CVE-2019-1000019.patch
-libarchive/CVE-2019-1000020.patch
-libarchive/bug1066.patch
-libarchive/non-recursive-extract-and-list.patch
 Removed since these are included in 3.4.0.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libarchive/libarchive/CVE-2018-1000877.patch   |  38 -----
 .../libarchive/libarchive/CVE-2018-1000878.patch   |  79 -----------
 .../libarchive/libarchive/CVE-2018-1000879.patch   |  50 -------
 .../libarchive/libarchive/CVE-2018-1000880.patch   |  44 ------
 .../libarchive/libarchive/CVE-2019-1000019.patch   |  59 --------
 .../libarchive/libarchive/CVE-2019-1000020.patch   |  61 --------
 .../libarchive/libarchive/bug1066.patch            |  54 --------
 .../non-recursive-extract-and-list.patch           | 153 ---------------------
 .../{libarchive_3.3.3.bb => libarchive_3.4.0.bb}   |  14 +-
 9 files changed, 3 insertions(+), 549 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2018-1000877.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2018-1000878.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2018-1000879.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2018-1000880.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/bug1066.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.3.3.bb => libarchive_3.4.0.bb} (78%)

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000877.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000877.patch
deleted file mode 100644
index ce63837..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000877.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-CVE: CVE-2018-1000877
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 021efa522ad729ff0f5806c4ce53e4a6cc1daa31 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 20 Nov 2018 17:56:29 +1100
-Subject: [PATCH] Avoid a double-free when a window size of 0 is specified
-
-new_size can be 0 with a malicious or corrupted RAR archive.
-
-realloc(area, 0) is equivalent to free(area), so the region would
-be free()d here and the free()d again in the cleanup function.
-
-Found with a setup running AFL, afl-rb, and qsym.
----
- libarchive/archive_read_support_format_rar.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 23452222..6f419c27 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -2300,6 +2300,11 @@ parse_codes(struct archive_read *a)
-       new_size = DICTIONARY_MAX_SIZE;
-     else
-       new_size = rar_fls((unsigned int)rar->unp_size) << 1;
-+    if (new_size == 0) {
-+      archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+                        "Zero window size is invalid.");
-+      return (ARCHIVE_FATAL);
-+    }
-     new_window = realloc(rar->lzss.window, new_size);
-     if (new_window == NULL) {
-       archive_set_error(&a->archive, ENOMEM,
--- 
-2.20.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000878.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000878.patch
deleted file mode 100644
index 7468fd3..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000878.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-CVE: CVE-2018-1000878
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From bfcfe6f04ed20db2504db8a254d1f40a1d84eb28 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 00:55:22 +1100
-Subject: [PATCH] rar: file split across multi-part archives must match
-
-Fuzzing uncovered some UAF and memory overrun bugs where a file in a
-single file archive reported that it was split across multiple
-volumes. This was caused by ppmd7 operations calling
-rar_br_fillup. This would invoke rar_read_ahead, which would in some
-situations invoke archive_read_format_rar_read_header.  That would
-check the new file name against the old file name, and if they didn't
-match up it would free the ppmd7 buffer and allocate a new
-one. However, because the ppmd7 decoder wasn't actually done with the
-buffer, it would continue to used the freed buffer. Both reads and
-writes to the freed region can be observed.
-
-This is quite tricky to solve: once the buffer has been freed it is
-too late, as the ppmd7 decoder functions almost universally assume
-success - there's no way for ppmd_read to signal error, nor are there
-good ways for functions like Range_Normalise to propagate them. So we
-can't detect after the fact that we're in an invalid state - e.g. by
-checking rar->cursor, we have to prevent ourselves from ever ending up
-there. So, when we are in the dangerous part or rar_read_ahead that
-assumes a valid split, we set a flag force read_header to either go
-down the path for split files or bail. This means that the ppmd7
-decoder keeps a valid buffer and just runs out of data.
-
-Found with a combination of AFL, afl-rb and qsym.
----
- libarchive/archive_read_support_format_rar.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 6f419c27..a8cc5c94 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -258,6 +258,7 @@ struct rar
-   struct data_block_offsets *dbo;
-   unsigned int cursor;
-   unsigned int nodes;
-+  char filename_must_match;
- 
-   /* LZSS members */
-   struct huffman_code maincode;
-@@ -1560,6 +1561,12 @@ read_header(struct archive_read *a, struct archive_entry *entry,
-     }
-     return ret;
-   }
-+  else if (rar->filename_must_match)
-+  {
-+    archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+      "Mismatch of file parts split across multi-volume archive");
-+    return (ARCHIVE_FATAL);
-+  }
- 
-   rar->filename_save = (char*)realloc(rar->filename_save,
-                                       filename_size + 1);
-@@ -2933,12 +2940,14 @@ rar_read_ahead(struct archive_read *a, size_t min, ssize_t *avail)
-     else if (*avail == 0 && rar->main_flags & MHD_VOLUME &&
-       rar->file_flags & FHD_SPLIT_AFTER)
-     {
-+      rar->filename_must_match = 1;
-       ret = archive_read_format_rar_read_header(a, a->entry);
-       if (ret == (ARCHIVE_EOF))
-       {
-         rar->has_endarc_header = 1;
-         ret = archive_read_format_rar_read_header(a, a->entry);
-       }
-+      rar->filename_must_match = 0;
-       if (ret != (ARCHIVE_OK))
-         return NULL;
-       return rar_read_ahead(a, min, avail);
--- 
-2.20.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000879.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000879.patch
deleted file mode 100644
index 9f25932..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000879.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-CVE: CVE-2018-1000879
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 15bf44fd2c1ad0e3fd87048b3fcc90c4dcff1175 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 14:29:42 +1100
-Subject: [PATCH] Skip 0-length ACL fields
-
-Currently, it is possible to create an archive that crashes bsdtar
-with a malformed ACL:
-
-Program received signal SIGSEGV, Segmentation fault.
-archive_acl_from_text_l (acl=<optimised out>, text=0x7e2e92 "", want_type=<optimised out>, sc=<optimised out>) at libarchive/archive_acl.c:1726
-1726				switch (*s) {
-(gdb) p n
-$1 = 1
-(gdb) p field[n]
-$2 = {start = 0x0, end = 0x0}
-
-Stop this by checking that the length is not zero before beginning
-the switch statement.
-
-I am pretty sure this is the bug mentioned in the qsym paper [1],
-and I was able to replicate it with a qsym + AFL + afl-rb setup.
-
-[1] https://www.usenix.org/conference/usenixsecurity18/presentation/yun
----
- libarchive/archive_acl.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libarchive/archive_acl.c b/libarchive/archive_acl.c
-index 512beee1..7beeee86 100644
---- a/libarchive/archive_acl.c
-+++ b/libarchive/archive_acl.c
-@@ -1723,6 +1723,11 @@ archive_acl_from_text_l(struct archive_acl *acl, const char *text,
- 			st = field[n].start + 1;
- 			len = field[n].end - field[n].start;
- 
-+			if (len == 0) {
-+				ret = ARCHIVE_WARN;
-+				continue;
-+			}
-+
- 			switch (*s) {
- 			case 'u':
- 				if (len == 1 || (len == 4
--- 
-2.20.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000880.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000880.patch
deleted file mode 100644
index bc264a1..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2018-1000880.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-CVE: CVE-2018-1000880
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 9c84b7426660c09c18cc349f6d70b5f8168b5680 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 4 Dec 2018 16:33:42 +1100
-Subject: [PATCH] warc: consume data once read
-
-The warc decoder only used read ahead, it wouldn't actually consume
-data that had previously been printed. This means that if you specify
-an invalid content length, it will just reprint the same data over
-and over and over again until it hits the desired length.
-
-This means that a WARC resource with e.g.
-Content-Length: 666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666665
-but only a few hundred bytes of data, causes a quasi-infinite loop.
-
-Consume data in subsequent calls to _warc_read.
-
-Found with an AFL + afl-rb + qsym setup.
----
- libarchive/archive_read_support_format_warc.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
-index e8753853..e8fc8428 100644
---- a/libarchive/archive_read_support_format_warc.c
-+++ b/libarchive/archive_read_support_format_warc.c
-@@ -386,6 +386,11 @@ _warc_read(struct archive_read *a, const void **buf, size_t *bsz, int64_t *off)
- 		return (ARCHIVE_EOF);
- 	}
- 
-+	if (w->unconsumed) {
-+		__archive_read_consume(a, w->unconsumed);
-+		w->unconsumed = 0U;
-+	}
-+
- 	rab = __archive_read_ahead(a, 1U, &nrd);
- 	if (nrd < 0) {
- 		*bsz = 0U;
--- 
-2.20.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
deleted file mode 100644
index 7f39893..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-CVE: CVE-2019-1000019
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 65a23f5dbee4497064e9bb467f81138a62b0dae1 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 1 Jan 2019 16:01:40 +1100
-Subject: [PATCH 2/2] 7zip: fix crash when parsing certain archives
-
-Fuzzing with CRCs disabled revealed that a call to get_uncompressed_data()
-would sometimes fail to return at least 'minimum' bytes. This can cause
-the crc32() invocation in header_bytes to read off into invalid memory.
-
-A specially crafted archive can use this to cause a crash.
-
-An ASAN trace is below, but ASAN is not required - an uninstrumented
-binary will also crash.
-
-==7719==ERROR: AddressSanitizer: SEGV on unknown address 0x631000040000 (pc 0x7fbdb3b3ec1d bp 0x7ffe77a51310 sp 0x7ffe77a51150 T0)
-==7719==The signal is caused by a READ memory access.
-    #0 0x7fbdb3b3ec1c in crc32_z (/lib/x86_64-linux-gnu/libz.so.1+0x2c1c)
-    #1 0x84f5eb in header_bytes (/tmp/libarchive/bsdtar+0x84f5eb)
-    #2 0x856156 in read_Header (/tmp/libarchive/bsdtar+0x856156)
-    #3 0x84e134 in slurp_central_directory (/tmp/libarchive/bsdtar+0x84e134)
-    #4 0x849690 in archive_read_format_7zip_read_header (/tmp/libarchive/bsdtar+0x849690)
-    #5 0x5713b7 in _archive_read_next_header2 (/tmp/libarchive/bsdtar+0x5713b7)
-    #6 0x570e63 in _archive_read_next_header (/tmp/libarchive/bsdtar+0x570e63)
-    #7 0x6f08bd in archive_read_next_header (/tmp/libarchive/bsdtar+0x6f08bd)
-    #8 0x52373f in read_archive (/tmp/libarchive/bsdtar+0x52373f)
-    #9 0x5257be in tar_mode_x (/tmp/libarchive/bsdtar+0x5257be)
-    #10 0x51daeb in main (/tmp/libarchive/bsdtar+0x51daeb)
-    #11 0x7fbdb27cab96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
-    #12 0x41dd09 in _start (/tmp/libarchive/bsdtar+0x41dd09)
-
-This was primarly done with afl and FairFuzz. Some early corpus entries
-may have been generated by qsym.
----
- libarchive/archive_read_support_format_7zip.c | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/libarchive/archive_read_support_format_7zip.c b/libarchive/archive_read_support_format_7zip.c
-index bccbf8966..b6d1505d3 100644
---- a/libarchive/archive_read_support_format_7zip.c
-+++ b/libarchive/archive_read_support_format_7zip.c
-@@ -2964,13 +2964,7 @@ get_uncompressed_data(struct archive_read *a, const void **buff, size_t size,
- 	if (zip->codec == _7Z_COPY && zip->codec2 == (unsigned long)-1) {
- 		/* Copy mode. */
- 
--		/*
--		 * Note: '1' here is a performance optimization.
--		 * Recall that the decompression layer returns a count of
--		 * available bytes; asking for more than that forces the
--		 * decompressor to combine reads by copying data.
--		 */
--		*buff = __archive_read_ahead(a, 1, &bytes_avail);
-+		*buff = __archive_read_ahead(a, minimum, &bytes_avail);
- 		if (bytes_avail <= 0) {
- 			archive_set_error(&a->archive,
- 			    ARCHIVE_ERRNO_FILE_FORMAT,
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
deleted file mode 100644
index 25a76fd..0000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-CVE: CVE-2019-1000020
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 8312eaa576014cd9b965012af51bc1f967b12423 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 1 Jan 2019 17:10:49 +1100
-Subject: [PATCH 1/2] iso9660: Fail when expected Rockridge extensions is
- missing
-
-A corrupted or malicious ISO9660 image can cause read_CE() to loop
-forever.
-
-read_CE() calls parse_rockridge(), expecting a Rockridge extension
-to be read. However, parse_rockridge() is structured as a while
-loop starting with a sanity check, and if the sanity check fails
-before the loop has run, the function returns ARCHIVE_OK without
-advancing the position in the file. This causes read_CE() to retry
-indefinitely.
-
-Make parse_rockridge() return ARCHIVE_WARN if it didn't read an
-extension. As someone with no real knowledge of the format, this
-seems more apt than ARCHIVE_FATAL, but both the call-sites escalate
-it to a fatal error immediately anyway.
-
-Found with a combination of AFL, afl-rb (FairFuzz) and qsym.
----
- libarchive/archive_read_support_format_iso9660.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index 28acfefbb..bad8f1dfe 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -2102,6 +2102,7 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
-     const unsigned char *p, const unsigned char *end)
- {
- 	struct iso9660 *iso9660;
-+	int entry_seen = 0;
- 
- 	iso9660 = (struct iso9660 *)(a->format->data);
- 
-@@ -2257,8 +2258,16 @@ parse_rockridge(struct archive_read *a, struct file_info *file,
- 		}
- 
- 		p += p[2];
-+		entry_seen = 1;
-+	}
-+
-+	if (entry_seen)
-+		return (ARCHIVE_OK);
-+	else {
-+		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+				  "Tried to parse Rockridge extensions, but none found");
-+		return (ARCHIVE_WARN);
- 	}
--	return (ARCHIVE_OK);
- }
- 
- static int
-
diff --git a/meta/recipes-extended/libarchive/libarchive/bug1066.patch b/meta/recipes-extended/libarchive/libarchive/bug1066.patch
deleted file mode 100644
index 0a662b5..0000000
--- a/meta/recipes-extended/libarchive/libarchive/bug1066.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-libarchive-3.3.3: Fix bug1066
-
-[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/1066
-
-archive_write_set_format_*.c: fix out of bounds read on empty string () filename
-for guntar, pax and v7tar
-
-There is an out of bounds read flaw in the archive_write_gnutar_header,
-archive_write_pax_header and archive_write_v7tar_header functions which
-could leds to cause a denial of service.
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c246ec5d058a3f70a2d3fb765f92fe9db77b25df]
-Bug: 1066
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/libarchive/archive_write_set_format_gnutar.c b/libarchive/archive_write_set_format_gnutar.c
-index 2d858c9..1966c53 100644
---- a/libarchive/archive_write_set_format_gnutar.c
-+++ b/libarchive/archive_write_set_format_gnutar.c
-@@ -339,7 +339,7 @@ archive_write_gnutar_header(struct archive_write *a,
- 		 * case getting WCS failed. On POSIX, this is a
- 		 * normal operation.
- 		 */
--		if (p != NULL && p[strlen(p) - 1] != '/') {
-+		if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
- 			struct archive_string as;
- 
- 			archive_string_init(&as);
-diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
-index 6a301ac..4cfa8ff 100644
---- a/libarchive/archive_write_set_format_pax.c
-+++ b/libarchive/archive_write_set_format_pax.c
-@@ -660,7 +660,7 @@ archive_write_pax_header(struct archive_write *a,
- 			 * case getting WCS failed. On POSIX, this is a
- 			 * normal operation.
- 			 */
--			if (p != NULL && p[strlen(p) - 1] != '/') {
-+			if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
- 				struct archive_string as;
- 
- 				archive_string_init(&as);
-diff --git a/libarchive/archive_write_set_format_v7tar.c b/libarchive/archive_write_set_format_v7tar.c
-index 62b1522..53c0db0 100644
---- a/libarchive/archive_write_set_format_v7tar.c
-+++ b/libarchive/archive_write_set_format_v7tar.c
-@@ -284,7 +284,7 @@ archive_write_v7tar_header(struct archive_write *a, struct archive_entry *entry)
- 		 * case getting WCS failed. On POSIX, this is a
- 		 * normal operation.
- 		 */
--		if (p != NULL && p[strlen(p) - 1] != '/') {
-+		if (p != NULL && p[0] != '\0' && p[strlen(p) - 1] != '/') {
- 			struct archive_string as;
- 
- 			archive_string_init(&as);
diff --git a/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch b/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch
deleted file mode 100644
index cd7be51..0000000
--- a/meta/recipes-extended/libarchive/libarchive/non-recursive-extract-and-list.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 47f7566f6829c2b14e21bbbba699916de4998c72 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Mon, 24 Oct 2016 12:54:48 +0200
-Subject: [PATCH 1/1] non-recursive extract and list
-
-Sometimes it makes sense to extract or list a directory contained in
-an archive without also doing the same for the content of the
-directory, i.e. allowing -n (= --no-recursion) in combination with the
-x and t modes.
-
-bsdtar uses the match functionality in libarchive to track include
-matches. A new libarchive API call
-archive_match_include_directories_recursively() gets introduced to
-influence the matching behavior, with the default behavior as before.
-
-Non-recursive matching can be achieved by anchoring the path match at
-both start and end. Asking for a directory which itself isn't in the
-archive when in non-recursive mode is an error and handled by the
-existing mechanism for tracking unused inclusion entries.
-
-Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/812]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
----
- libarchive/archive.h       |  2 ++
- libarchive/archive_match.c | 30 +++++++++++++++++++++++++++++-
- tar/bsdtar.1               |  3 +--
- tar/bsdtar.c               | 12 ++++++++++--
- 4 files changed, 42 insertions(+), 5 deletions(-)
-
-diff --git a/libarchive/archive.h b/libarchive/archive.h
-index 32710201..59fb4aa6 100644
---- a/libarchive/archive.h
-+++ b/libarchive/archive.h
-@@ -1093,6 +1093,8 @@ __LA_DECL int	archive_match_excluded(struct archive *,
-  */
- __LA_DECL int	archive_match_path_excluded(struct archive *,
- 		    struct archive_entry *);
-+/* Control recursive inclusion of directory content when directory is included. Default on. */
-+__LA_DECL int	archive_match_include_directories_recursively(struct archive *, int _enabled);
- /* Add exclusion pathname pattern. */
- __LA_DECL int	archive_match_exclude_pattern(struct archive *, const char *);
- __LA_DECL int	archive_match_exclude_pattern_w(struct archive *,
-diff --git a/libarchive/archive_match.c b/libarchive/archive_match.c
-index be72066e..bb6a3407 100644
---- a/libarchive/archive_match.c
-+++ b/libarchive/archive_match.c
-@@ -93,6 +93,9 @@ struct archive_match {
- 	/* exclusion/inclusion set flag. */
- 	int			 setflag;
- 
-+	/* Recursively include directory content? */
-+	int			 recursive_include;
-+
- 	/*
- 	 * Matching filename patterns.
- 	 */
-@@ -223,6 +226,7 @@ archive_match_new(void)
- 		return (NULL);
- 	a->archive.magic = ARCHIVE_MATCH_MAGIC;
- 	a->archive.state = ARCHIVE_STATE_NEW;
-+	a->recursive_include = 1;
- 	match_list_init(&(a->inclusions));
- 	match_list_init(&(a->exclusions));
- 	__archive_rb_tree_init(&(a->exclusion_tree), &rb_ops_mbs);
-@@ -471,6 +475,28 @@ archive_match_path_excluded(struct archive *_a,
- }
- 
- /*
-+ * When recursive inclusion of directory content is enabled,
-+ * an inclusion pattern that matches a directory will also
-+ * include everything beneath that directory. Enabled by default.
-+ *
-+ * For compatibility with GNU tar, exclusion patterns always
-+ * match if a subset of the full patch matches (i.e., they are
-+ * are not rooted at the beginning of the path) and thus there
-+ * is no corresponding non-recursive exclusion mode.
-+ */
-+int
-+archive_match_include_directories_recursively(struct archive *_a, int _enabled)
-+{
-+	struct archive_match *a;
-+
-+	archive_check_magic(_a, ARCHIVE_MATCH_MAGIC,
-+	    ARCHIVE_STATE_NEW, "archive_match_include_directories_recursively");
-+	a = (struct archive_match *)_a;
-+	a->recursive_include = _enabled;
-+	return (ARCHIVE_OK);
-+}
-+
-+/*
-  * Utility functions to get statistic information for inclusion patterns.
-  */
- int
-@@ -781,7 +807,9 @@ static int
- match_path_inclusion(struct archive_match *a, struct match *m,
-     int mbs, const void *pn)
- {
--	int flag = PATHMATCH_NO_ANCHOR_END;
-+	int flag = a->recursive_include ?
-+		PATHMATCH_NO_ANCHOR_END : /* Prefix match is good enough. */
-+		0; /* Full match required. */
- 	int r;
- 
- 	if (mbs) {
-diff --git a/tar/bsdtar.1 b/tar/bsdtar.1
-index 132e1145..1dd2a847 100644
---- a/tar/bsdtar.1
-+++ b/tar/bsdtar.1
-@@ -386,8 +386,7 @@ and the default behavior in c, r, and u modes or if
- .Nm
- is run in x mode as root.
- .It Fl n , Fl Fl norecurse , Fl Fl no-recursion
--(c, r, u modes only)
--Do not recursively archive the contents of directories.
-+Do not recursively archive (c, r, u), extract (x) or list (t) the contents of directories.
- .It Fl Fl newer Ar date
- (c, r, u modes only)
- Only include files and directories newer than the specified date.
-diff --git a/tar/bsdtar.c b/tar/bsdtar.c
-index 11dedbf9..d014cc3e 100644
---- a/tar/bsdtar.c
-+++ b/tar/bsdtar.c
-@@ -794,8 +794,6 @@ main(int argc, char **argv)
- 			break;
- 		}
- 	}
--	if (bsdtar->flags & OPTFLAG_NO_SUBDIRS)
--		only_mode(bsdtar, "-n", "cru");
- 	if (bsdtar->flags & OPTFLAG_STDOUT)
- 		only_mode(bsdtar, "-O", "xt");
- 	if (bsdtar->flags & OPTFLAG_UNLINK_FIRST)
-@@ -845,6 +843,16 @@ main(int argc, char **argv)
- 		only_mode(bsdtar, buff, "cru");
- 	}
- 
-+	/*
-+	 * When creating an archive from a directory tree, the directory
-+	 * walking code will already avoid entering directories when
-+	 * recursive inclusion of directory content is disabled, therefore
-+	 * changing the matching behavior has no effect for creation modes.
-+	 * It is relevant for extraction or listing.
-+	 */
-+	archive_match_include_directories_recursively(bsdtar->matching,
-+						      !(bsdtar->flags & OPTFLAG_NO_SUBDIRS));
-+
- 	/* Filename "-" implies stdio. */
- 	if (strcmp(bsdtar->filename, "-") == 0)
- 		bsdtar->filename = NULL;
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
similarity index 78%
rename from meta/recipes-extended/libarchive/libarchive_3.3.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.0.bb
index af5ca65..c789cd4 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C library and command-line tools for reading and writing tar, cpi
 HOMEPAGE = "http://www.libarchive.org/"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ed99aca006bc346974bb745a35336425"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fe01f5e02b1f0cc934d593a7b0ddceb6"
 
 DEPENDS = "e2fsprogs-native"
 
@@ -32,18 +32,10 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://non-recursive-extract-and-list.patch \
-           file://bug1066.patch \
-           file://CVE-2018-1000877.patch \
-           file://CVE-2018-1000878.patch \
-           file://CVE-2018-1000879.patch \
-           file://CVE-2018-1000880.patch \
-           file://CVE-2019-1000019.patch \
-           file://CVE-2019-1000020.patch \
 "
 
-SRC_URI[md5sum] = "4038e366ca5b659dae3efcc744e72120"
-SRC_URI[sha256sum] = "ba7eb1781c9fbbae178c4c6bad1c6eb08edab9a1496c64833d1715d022b30e2e"
+SRC_URI[md5sum] = "6046396255bd7cf6d0f6603a9bda39ac"
+SRC_URI[sha256sum] = "8643d50ed40c759f5412a3af4e353cffbce4fdf3b5cf321cb72cacf06b2d825e"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.7.4




