Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7A37962E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 21:16:38 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id k38-v6so13585209qtk.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 14:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=k/EL0UXyPIJJNvMG4ZUZkM4Jg6l7nmIJp9jD3oh2zB4=;
	b=UL1p1H7MV8qQyP02xsj2aSsgZa2mWkn4oluLius8UVFBSUW/j7OTRE38Pol1noGpZ4
	3+QeiNlPZ4NTQYmpHVg0ELRPNyTk/lt60R/XfQcTMZ6HitrN8HQEhQzy2cKhNZyltJ7x
	u0o0ta1oodt+jVQUd4ASjbDJ+igwIA40xW924BHv2me7f8J6osF0fC4tmjmKu6FP88P/
	sdrqeM3COQB5nnOyaywWX6IwE+IRple6Sb3qNb2uS9Kg1twZGqAZJtsxno6cgUwrfG29
	fGgBSvgoJPNiznmQ/V3QKGpivhsu8DBSmhxHFeA/+HWB2h0nPyln9Mpe/xOWwr5AVaR9
	IErA==
X-Gm-Message-State: APzg51ANewspz17DAnXbCbniEjak3BkT3dWrpPXRhjBEaTeyTjpGq+Uw
	ehSTfVsB8AbSb0wuAvfcCvz5cpPKRpc=
X-Google-Smtp-Source: ANB0VdbQGt6o9/sxVHV1y8dHL1TCwCO+yiEkJilwu/aPN4mS2SQJ5xp2xSv9hRlxR5cUhsv712lFBg==
X-Received: by 2002:a0c:aa06:: with SMTP id
	d6-v6mr15979890qvb.26.1537132598902; 
	Sun, 16 Sep 2018 14:16:38 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	e29-v6sm9714412qte.47.2018.09.16.14.16.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 14:16:38 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 16 Sep 2018 18:16:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Sep 2018 18:16:23 -0300
Message-Id: <20180916211625.18597-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180916211625.18597-1-otavio@ossystems.com.br>
References: <20180916211625.18597-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/4] libarchive: Update 3.3.2 -> 3.3.3
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
X-List-Received-Date: Sun, 16 Sep 2018 21:16:38 -0000
Content-Transfer-Encoding: 8bit

This upgrades to 3.3.3 release and drop the backported patches when
doing the recipe update.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../libarchive/CVE-2017-14166.patch           | 37 ---------
 .../libarchive/CVE-2017-14501.patch           | 79 -------------------
 .../libarchive/CVE-2017-14502.patch           | 37 ---------
 .../libarchive/CVE-2017-14503.patch           | 33 --------
 .../libarchive/libarchive/bug929.patch        | 38 ---------
 ...ibarchive_3.3.2.bb => libarchive_3.3.3.bb} | 11 +--
 6 files changed, 3 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/bug929.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.3.2.bb => libarchive_3.3.3.bb} (86%)

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
deleted file mode 100644
index e85fec40aa..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14166.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-libarchive-3.3.2: Fix CVE-2017-14166
-
-[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/935
-
-archive_read_support_format_xar: heap-based buffer overflow in xml_data
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/fa7438a0ff4033e4741c807394a9af6207940d71]
-CVE: CVE-2017-14166
-Bug: 935
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/libarchive/archive_read_support_format_xar.c b/libarchive/archive_read_support_format_xar.c
-index 7a22beb..93eeacc 100644
---- a/libarchive/archive_read_support_format_xar.c
-+++ b/libarchive/archive_read_support_format_xar.c
-@@ -1040,6 +1040,9 @@ atol10(const char *p, size_t char_cnt)
- 	uint64_t l;
- 	int digit;
- 
-+	if (char_cnt == 0)
-+		return (0);
-+
- 	l = 0;
- 	digit = *p - '0';
- 	while (digit >= 0 && digit < 10  && char_cnt-- > 0) {
-@@ -1054,7 +1057,10 @@ atol8(const char *p, size_t char_cnt)
- {
- 	int64_t l;
- 	int digit;
--        
-+
-+	if (char_cnt == 0)
-+		return (0);
-+
- 	l = 0;
- 	while (char_cnt-- > 0) {
- 		if (*p >= '0' && *p <= '7')
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch
deleted file mode 100644
index 1038102e6b..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From f9569c086ff29259c73790db9cbf39fe8fb9d862 Mon Sep 17 00:00:00 2001
-From: John Starks <jostarks@microsoft.com>
-Date: Wed, 25 Jul 2018 12:16:34 -0700
-Subject: [PATCH] iso9660: validate directory record length
-
-CVE: CVE-2017-14501
-Upstream-Status: Backport [https://github.com/mmatuska/libarchive/commit/13e87dcd9c37b533127cceb9f3e1e5a38d95e784]
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- libarchive/archive_read_support_format_iso9660.c | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
-index f01d37bf..089bb723 100644
---- a/libarchive/archive_read_support_format_iso9660.c
-+++ b/libarchive/archive_read_support_format_iso9660.c
-@@ -409,7 +409,8 @@ static int	next_entry_seek(struct archive_read *, struct iso9660 *,
- 		    struct file_info **);
- static struct file_info *
- 		parse_file_info(struct archive_read *a,
--		    struct file_info *parent, const unsigned char *isodirrec);
-+		    struct file_info *parent, const unsigned char *isodirrec,
-+		    size_t reclen);
- static int	parse_rockridge(struct archive_read *a,
- 		    struct file_info *file, const unsigned char *start,
- 		    const unsigned char *end);
-@@ -1022,7 +1023,7 @@ read_children(struct archive_read *a, struct file_info *parent)
- 			if (*(p + DR_name_len_offset) == 1
- 			    && *(p + DR_name_offset) == '\001')
- 				continue;
--			child = parse_file_info(a, parent, p);
-+			child = parse_file_info(a, parent, p, b - p);
- 			if (child == NULL) {
- 				__archive_read_consume(a, skip_size);
- 				return (ARCHIVE_FATAL);
-@@ -1112,7 +1113,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
- 	 */
- 	seenJoliet = iso9660->seenJoliet;/* Save flag. */
- 	iso9660->seenJoliet = 0;
--	file = parse_file_info(a, NULL, block);
-+	file = parse_file_info(a, NULL, block, vd->size);
- 	if (file == NULL)
- 		return (ARCHIVE_FATAL);
- 	iso9660->seenJoliet = seenJoliet;
-@@ -1144,7 +1145,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
- 			return (ARCHIVE_FATAL);
- 		}
- 		iso9660->seenJoliet = 0;
--		file = parse_file_info(a, NULL, block);
-+		file = parse_file_info(a, NULL, block, vd->size);
- 		if (file == NULL)
- 			return (ARCHIVE_FATAL);
- 		iso9660->seenJoliet = seenJoliet;
-@@ -1749,7 +1750,7 @@ archive_read_format_iso9660_cleanup(struct archive_read *a)
-  */
- static struct file_info *
- parse_file_info(struct archive_read *a, struct file_info *parent,
--    const unsigned char *isodirrec)
-+    const unsigned char *isodirrec, size_t reclen)
- {
- 	struct iso9660 *iso9660;
- 	struct file_info *file, *filep;
-@@ -1763,7 +1764,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
- 
- 	iso9660 = (struct iso9660 *)(a->format->data);
- 
--	dr_len = (size_t)isodirrec[DR_length_offset];
-+	if (reclen == 0 || reclen < (dr_len = (size_t)isodirrec[DR_length_offset])) {
-+		archive_set_error(&a->archive, ARCHIVE_ERRNO_MISC,
-+			"Invalid directory record length");
-+		return (NULL);
-+	}
- 	name_len = (size_t)isodirrec[DR_name_len_offset];
- 	location = archive_le32dec(isodirrec + DR_extent_offset);
- 	fsize = toi(isodirrec + DR_size_offset, DR_size_size);
--- 
-2.13.3
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
deleted file mode 100644
index 72e1546435..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14502.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5562545b5562f6d12a4ef991fae158bf4ccf92b6 Mon Sep 17 00:00:00 2001
-From: Joerg Sonnenberger <joerg@bec.de>
-Date: Sat, 9 Sep 2017 17:47:32 +0200
-Subject: [PATCH] Avoid a read off-by-one error for UTF16 names in RAR
- archives.
-
-Reported-By: OSS-Fuzz issue 573
-
-CVE: CVE-2017-14502
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- libarchive/archive_read_support_format_rar.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index cbb14c3..751de69 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -1496,7 +1496,11 @@ read_header(struct archive_read *a, struct archive_entry *entry,
-         return (ARCHIVE_FATAL);
-       }
-       filename[filename_size++] = '\0';
--      filename[filename_size++] = '\0';
-+      /*
-+       * Do not increment filename_size here as the computations below
-+       * add the space for the terminating NUL explicitly.
-+       */
-+      filename[filename_size] = '\0';
- 
-       /* Decoded unicode form is UTF-16BE, so we have to update a string
-        * conversion object for it. */
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
deleted file mode 100644
index 779ca854eb..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14503.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2c8c83b9731ff822fad6cc8c670ea5519c366a14 Mon Sep 17 00:00:00 2001
-From: Joerg Sonnenberger <joerg@bec.de>
-Date: Thu, 19 Jul 2018 21:14:53 +0200
-Subject: [PATCH] Reject LHA archive entries with negative size.
-
-CVE: CVE-2017-14503
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/2c8c83b9731ff822fad6cc8c670ea5519c366a14]
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com> 
----
- libarchive/archive_read_support_format_lha.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
-index b8ef4ae1..95c99bb1 100644
---- a/libarchive/archive_read_support_format_lha.c
-+++ b/libarchive/archive_read_support_format_lha.c
-@@ -701,6 +701,12 @@ archive_read_format_lha_read_header(struct archive_read *a,
- 	 * Prepare variables used to read a file content.
- 	 */
- 	lha->entry_bytes_remaining = lha->compsize;
-+	if (lha->entry_bytes_remaining < 0) {
-+		archive_set_error(&a->archive,
-+		    ARCHIVE_ERRNO_FILE_FORMAT,
-+		    "Invalid LHa entry size");
-+		return (ARCHIVE_FATAL);
-+	}
- 	lha->entry_offset = 0;
- 	lha->entry_crc_calculated = 0;
- 
--- 
-2.13.3
-
diff --git a/meta/recipes-extended/libarchive/libarchive/bug929.patch b/meta/recipes-extended/libarchive/libarchive/bug929.patch
deleted file mode 100644
index 2f3254c8dc..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/bug929.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-libarchive-3.3.2: Fix bug929
-
-[No upstream tracking] -- https://github.com/libarchive/libarchive/pull/929
-
-archive_read_support_format_cpio: header_newc(): Avoid overflow when reading corrupt
-cpio archive
-
-A cpio "newc" archive with a namelength of "FFFFFFFF", if read on a
-system with a 32-bit size_t, would result in namelength + name_pad
-overflowing 32 bits and libarchive attempting to copy 2^32-1 bytes
-from a 2-byte buffer, with appropriately hilarious results.
-
-Check for this overflow and fail; there's no legitimate reason for a
-cpio archive to contain a file with a name over 4 billion characters
-in length.
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bac4659e0b970990e7e3f3a3d239294e96311630]
-Bug: 929
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/libarchive/archive_read_support_format_cpio.c b/libarchive/archive_read_support_format_cpio.c
-index ad9f782..1faa64d 100644
---- a/libarchive/archive_read_support_format_cpio.c
-+++ b/libarchive/archive_read_support_format_cpio.c
-@@ -633,6 +633,13 @@ header_newc(struct archive_read *a, struct cpio *cpio,
- 	/* Pad name to 2 more than a multiple of 4. */
- 	*name_pad = (2 - *namelength) & 3;
- 
-+	/* Make sure that the padded name length fits into size_t. */
-+	if ((size_t)(*namelength + *name_pad) < *namelength) {
-+		archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+		    "cpio archive has invalid namelength");
-+		return (ARCHIVE_FATAL);
-+	}
-+
- 	/*
- 	 * Note: entry_bytes_remaining is at least 64 bits and
- 	 * therefore guaranteed to be big enough for a 33-bit file
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
similarity index 86%
rename from meta/recipes-extended/libarchive/libarchive_3.3.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.3.3.bb
index e3d90b276a..eabab16770 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
@@ -32,16 +32,11 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://bug929.patch \
-           file://CVE-2017-14166.patch \
-           file://CVE-2017-14502.patch \
            file://non-recursive-extract-and-list.patch \
-           file://CVE-2017-14503.patch \
-           file://CVE-2017-14501.patch \
-          "
+"
 
-SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
-SRC_URI[sha256sum] = "ed2dbd6954792b2c054ccf8ec4b330a54b85904a80cef477a1c74643ddafa0ce"
+SRC_URI[md5sum] = "4038e366ca5b659dae3efcc744e72120"
+SRC_URI[sha256sum] = "ba7eb1781c9fbbae178c4c6bad1c6eb08edab9a1496c64833d1715d022b30e2e"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.19.0


