Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF1578860
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:22 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b16-v6so9165786oic.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UR86oIdX2THr3mNX1DwPu4JKBBd0175zIOVpDdrwOiw=;
	b=adFgk1DMWE7fkB+iflnwRlpae0XJYI+LtFTq7dUh4Jv9DDLH5kR1GdtXDDaL7KZHLH
	iQtThxHusw1e5bdUKeHnNmBjRFFoOm15T6C6anSAEDmMChHf2Um1x0ZTcu4JoXcOBHQm
	joppA3zJJ57UHWvRM3jv5XKDwTM5joUHqTYWTrFXKoZG3FxV+TReoNu6YS75ygKwhLfb
	94/l/rG7TmIei6B4+hWpqfLO4R0oRNfb1mQEh7XLi+5fkbYcGTgySU2ZVSRM2LG41J0v
	SpihofPtop2rJLQzrYEP3HXD/C+a9qZjSDsVcFfOVIS5e4QpGRhbNmcGV9SnAT/XjCkb
	bqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UR86oIdX2THr3mNX1DwPu4JKBBd0175zIOVpDdrwOiw=;
	b=H1QR+o3QJrODpfnPZ/gr0HOC6ZHt5ANmczS3fplpr35NbVjXtPNgBvumg3KyI0/hvx
	12DsFP56JorKIIlipb5bS3Wahortsg+lcIZQn0OP5vrt4ceYj4Qd87i8QeQIKjYeJZbp
	AKjEN2qCawFtiwtPmLfBY720eKBXlDSj7T0MsOF9ujU0wkrFoG3cSg97aoIx2r5cxQtf
	2Fw/T9oA4snIj2ApRjwNi0cHoZZ8p/cvuD5T+zFddDZxfFXM0br3EAZD+YL2KMalO/RD
	FdyzjE3/WG9fMdE/W1jvcUsj4ht3i9DX2agBrjxOcHsNJI+TAbUWVMMN/Hu96uVV8n2j
	SCFA==
X-Gm-Message-State: AOUpUlE5C6ObGznEC5H92Z3uuz73FP4MODf9uHAIzdJBnuRvKTRWiJV+
	gzu9rtIp4mFyME8Z2JT7BjYFyUWI
X-Google-Smtp-Source: AA+uWPwYJzTIc8725sSpXnis6G0xhc0EOEkJ5L/ABQtH5hGCE7MtasiqUu9afaBPULMDQ5mB0X+qGg==
X-Received: by 2002:aca:c601:: with SMTP id
	w1-v6mr15917329oif.27.1533565763577; 
	Mon, 06 Aug 2018 07:29:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:10 -0700
Message-Id: <1533565758-2467-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 04/12] binutls: Security fix CVE-2018-6759
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:22 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |   1 +
 .../binutils/binutils/CVE-2018-6759.patch          | 108 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 23625d1..1621e5b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -38,6 +38,7 @@ SRC_URI = "\
      file://CVE-2018-8945.patch \
      file://CVE-2018-7643.patch \
      file://CVE-2018-6872.patch \ 
+     file://CVE-2018-6759.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch
new file mode 100644
index 0000000..fff4979
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch
@@ -0,0 +1,108 @@
+From 64e234d417d5685a4aec0edc618114d9991c031b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 6 Feb 2018 15:48:29 +0000
+Subject: [PATCH] Prevent attempts to call strncpy with a zero-length field by
+ chacking the size of debuglink sections.
+
+	PR 22794
+	* opncls.c (bfd_get_debug_link_info_1): Check the size of the
+	section before attempting to read it in.
+	(bfd_get_alt_debug_link_info): Likewise.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-6759
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  7 +++++++
+ bfd/opncls.c  | 22 +++++++++++++++++-----
+ 2 files changed, 24 insertions(+), 5 deletions(-)
+
+Index: git/bfd/opncls.c
+===================================================================
+--- git.orig/bfd/opncls.c
++++ git/bfd/opncls.c
+@@ -1179,6 +1179,7 @@ bfd_get_debug_link_info_1 (bfd *abfd, vo
+   bfd_byte *contents;
+   unsigned int crc_offset;
+   char *name;
++  bfd_size_type size;
+ 
+   BFD_ASSERT (abfd);
+   BFD_ASSERT (crc32_out);
+@@ -1188,6 +1189,12 @@ bfd_get_debug_link_info_1 (bfd *abfd, vo
+   if (sect == NULL)
+     return NULL;
+ 
++  size = bfd_get_section_size (sect);
++
++  /* PR 22794: Make sure that the section has a reasonable size.  */
++  if (size < 8 || size >= bfd_get_size (abfd))
++    return NULL;
++
+   if (!bfd_malloc_and_get_section (abfd, sect, &contents))
+     {
+       if (contents != NULL)
+@@ -1197,10 +1204,10 @@ bfd_get_debug_link_info_1 (bfd *abfd, vo
+ 
+   /* CRC value is stored after the filename, aligned up to 4 bytes.  */
+   name = (char *) contents;
+-  /* PR 17597: avoid reading off the end of the buffer.  */
+-  crc_offset = strnlen (name, bfd_get_section_size (sect)) + 1;
++  /* PR 17597: Avoid reading off the end of the buffer.  */
++  crc_offset = strnlen (name, size) + 1;
+   crc_offset = (crc_offset + 3) & ~3;
+-  if (crc_offset + 4 > bfd_get_section_size (sect))
++  if (crc_offset + 4 > size)
+     return NULL;
+ 
+   *crc32 = bfd_get_32 (abfd, contents + crc_offset);
+@@ -1261,6 +1268,7 @@ bfd_get_alt_debug_link_info (bfd * abfd,
+   bfd_byte *contents;
+   unsigned int buildid_offset;
+   char *name;
++  bfd_size_type size;
+ 
+   BFD_ASSERT (abfd);
+   BFD_ASSERT (buildid_len);
+@@ -1271,6 +1279,10 @@ bfd_get_alt_debug_link_info (bfd * abfd,
+   if (sect == NULL)
+     return NULL;
+ 
++  size = bfd_get_section_size (sect);
++  if (size < 8 || size >= bfd_get_size (abfd))
++    return NULL;
++
+   if (!bfd_malloc_and_get_section (abfd, sect, & contents))
+     {
+       if (contents != NULL)
+@@ -1280,11 +1292,11 @@ bfd_get_alt_debug_link_info (bfd * abfd,
+ 
+   /* BuildID value is stored after the filename.  */
+   name = (char *) contents;
+-  buildid_offset = strnlen (name, bfd_get_section_size (sect)) + 1;
++  buildid_offset = strnlen (name, size) + 1;
+   if (buildid_offset >= bfd_get_section_size (sect))
+     return NULL;
+ 
+-  *buildid_len = bfd_get_section_size (sect) - buildid_offset;
++  *buildid_len = size - buildid_offset;
+   *buildid_out = bfd_malloc (*buildid_len);
+   memcpy (*buildid_out, contents + buildid_offset, *buildid_len);
+ 
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2018-02-06  Nick Clifton  <nickc@redhat.com>
++
++       PR 22794
++       * opncls.c (bfd_get_debug_link_info_1): Check the size of the
++       section before attempting to read it in.
++       (bfd_get_alt_debug_link_info): Likewise.
++
+ 2018-02-09  Nick Clifton  <nickc@redhat.com>
+ 
+        Import patch from mainline:
-- 
2.7.4


