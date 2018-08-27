Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2A66D7602A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:13:29 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id q204-v6so28577587oig.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yW6NEdPmHNqa6oAy4hANseu+11mA1jdvIag7Tz9FyBo=;
	b=BaEHGgYGorujZrNilCWj5TlB/3/vZL2aIYa4NSiGsceK/XZ6MB3rwvIhT3XwidnmPD
	wt1MYpxpfvn82vj5aUZ5/0Kqg/JLDYcdbM4KxPJJ4Q3Sb0cPuFh6ruX28/coAV+/72vq
	NRQejK5tOpW5cXQdeBvYbniqK+eDH3SBSHawa8obhAd3K2bbIDeaYOMkTWDlA5XRMkia
	zQv2K0XvV/a0tneNiwY1zy8sKmu7J7XYPCBBT1/AOlWFn9ciNITK9dzlSUxPRd/30w21
	zH2iLPZwT+1cKH8xULSVbMAxouaPAoCAk42B3sO1tll7R7uzq/RABdpXT3fwuuvRP3/D
	nD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yW6NEdPmHNqa6oAy4hANseu+11mA1jdvIag7Tz9FyBo=;
	b=LpTy1X533mKc1lelpSSe++KtUcPGeemrDCiB2zBdW75LpZ46Iz2xNgaRZk0wi+lftn
	gcaE1IaFZapE+QScH6oCF0CN8M4fl6gKXlkf9A4tE8zl6S46pmdgWU+SxcRGBgeq77rf
	1G+UNMhm3ACOJnhCnKDX5m4ceD7e1LcMp7XZwIERQwKHLJyGein/ZfBsDaz3IL0GYesX
	e8XGukfyVeJp8HNs7S7GYC0FNhjullM4dxXgEbutwW/WHesoA5mL5ehvbjzKXaA/WImz
	LV6aX/nhQ0Ed9GOdrM6IDcINKXB0PMx1YF1ShuoqFIe4imWBBNm+R432VEF5CwLnM55A
	NePw==
X-Gm-Message-State: APzg51C55c7M6aJiWn+A615hN8q6vjVsLr/BVuHCdMIOW29LOqYuJ8oq
	G/1ppRL8/6deOcbf/sAZePU9VVkt7L0=
X-Google-Smtp-Source: ANB0VdYPjfMDn+2WAda5i3kVJgtD2KBwu0Yylfys7GDorkBKVsZRwVnNLaCece836ITKOpLZFAJ2hw==
X-Received: by 2002:aca:d9c5:: with SMTP id
	q188-v6mr13542770oig.239.1535390009877; 
	Mon, 27 Aug 2018 10:13:29 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.180.62])
	by smtp.gmail.com with ESMTPSA id
	y85-v6sm15109448oie.25.2018.08.27.10.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Aug 2018 10:13:29 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 22:43:19 +0530
Message-Id: <1535390000-7057-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH resend 1/2] libarchive: CVE-2017-14501
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
X-List-Received-Date: Mon, 27 Aug 2018 17:13:35 -0000

iso9660: validate directory record length

Affects libarchive <= 3.3.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libarchive/libarchive/CVE-2017-14501.patch     | 79 ++++++++++++++++++++++
 .../libarchive/libarchive_3.3.2.bb                 |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch
new file mode 100644
index 0000000..1038102
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2017-14501.patch
@@ -0,0 +1,79 @@
+From f9569c086ff29259c73790db9cbf39fe8fb9d862 Mon Sep 17 00:00:00 2001
+From: John Starks <jostarks@microsoft.com>
+Date: Wed, 25 Jul 2018 12:16:34 -0700
+Subject: [PATCH] iso9660: validate directory record length
+
+CVE: CVE-2017-14501
+Upstream-Status: Backport [https://github.com/mmatuska/libarchive/commit/13e87dcd9c37b533127cceb9f3e1e5a38d95e784]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ libarchive/archive_read_support_format_iso9660.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_iso9660.c b/libarchive/archive_read_support_format_iso9660.c
+index f01d37bf..089bb723 100644
+--- a/libarchive/archive_read_support_format_iso9660.c
++++ b/libarchive/archive_read_support_format_iso9660.c
+@@ -409,7 +409,8 @@ static int	next_entry_seek(struct archive_read *, struct iso9660 *,
+ 		    struct file_info **);
+ static struct file_info *
+ 		parse_file_info(struct archive_read *a,
+-		    struct file_info *parent, const unsigned char *isodirrec);
++		    struct file_info *parent, const unsigned char *isodirrec,
++		    size_t reclen);
+ static int	parse_rockridge(struct archive_read *a,
+ 		    struct file_info *file, const unsigned char *start,
+ 		    const unsigned char *end);
+@@ -1022,7 +1023,7 @@ read_children(struct archive_read *a, struct file_info *parent)
+ 			if (*(p + DR_name_len_offset) == 1
+ 			    && *(p + DR_name_offset) == '\001')
+ 				continue;
+-			child = parse_file_info(a, parent, p);
++			child = parse_file_info(a, parent, p, b - p);
+ 			if (child == NULL) {
+ 				__archive_read_consume(a, skip_size);
+ 				return (ARCHIVE_FATAL);
+@@ -1112,7 +1113,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
+ 	 */
+ 	seenJoliet = iso9660->seenJoliet;/* Save flag. */
+ 	iso9660->seenJoliet = 0;
+-	file = parse_file_info(a, NULL, block);
++	file = parse_file_info(a, NULL, block, vd->size);
+ 	if (file == NULL)
+ 		return (ARCHIVE_FATAL);
+ 	iso9660->seenJoliet = seenJoliet;
+@@ -1144,7 +1145,7 @@ choose_volume(struct archive_read *a, struct iso9660 *iso9660)
+ 			return (ARCHIVE_FATAL);
+ 		}
+ 		iso9660->seenJoliet = 0;
+-		file = parse_file_info(a, NULL, block);
++		file = parse_file_info(a, NULL, block, vd->size);
+ 		if (file == NULL)
+ 			return (ARCHIVE_FATAL);
+ 		iso9660->seenJoliet = seenJoliet;
+@@ -1749,7 +1750,7 @@ archive_read_format_iso9660_cleanup(struct archive_read *a)
+  */
+ static struct file_info *
+ parse_file_info(struct archive_read *a, struct file_info *parent,
+-    const unsigned char *isodirrec)
++    const unsigned char *isodirrec, size_t reclen)
+ {
+ 	struct iso9660 *iso9660;
+ 	struct file_info *file, *filep;
+@@ -1763,7 +1764,11 @@ parse_file_info(struct archive_read *a, struct file_info *parent,
+ 
+ 	iso9660 = (struct iso9660 *)(a->format->data);
+ 
+-	dr_len = (size_t)isodirrec[DR_length_offset];
++	if (reclen == 0 || reclen < (dr_len = (size_t)isodirrec[DR_length_offset])) {
++		archive_set_error(&a->archive, ARCHIVE_ERRNO_MISC,
++			"Invalid directory record length");
++		return (NULL);
++	}
+ 	name_len = (size_t)isodirrec[DR_name_len_offset];
+ 	location = archive_le32dec(isodirrec + DR_extent_offset);
+ 	fsize = toi(isodirrec + DR_size_offset, DR_size_size);
+-- 
+2.13.3
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 3269716..e3d90b2 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2017-14502.patch \
            file://non-recursive-extract-and-list.patch \
            file://CVE-2017-14503.patch \
+           file://CVE-2017-14501.patch \
           "
 
 SRC_URI[md5sum] = "4583bd6b2ebf7e0e8963d90879eb1b27"
-- 
2.7.4


