Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8B07678D5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:28 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id j205-v6so6437273oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hSVB/76lKd26afJxUPuAdDxkXI4J3RrjBARMFnZN+30=;
	b=HgX/kTJcgM/x9TetHUS3/NRkCnby8aoNSITFPjzAYhSD1pWqe2bK6AyN4ClTO0nkH1
	qZLyBBTk23/MkC8rWS8IRTqgtD2w5+qXvJG4KwzGVfzzTTYuPyP5RIO1yU3h/BDcXwAw
	euqsCq4787bA+RnuiwVrA06Q/oCWa+DNEpm8ZU83iKoBF/wNLrMpQ1oi+7W4dO1R57CR
	fj6qgG5JTE8g6LGBXf+eblY9Z3IdgWMSIY+SMV8i1WfamIiwyEwvwOfoM/Nz+ZLJ70zh
	IlRGaW9h5hWaoi3M/Z+cdw9dUBoZi86IWt1jhK27tMgDhiznqaSmD8T0rWK7d5C1CymV
	mR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hSVB/76lKd26afJxUPuAdDxkXI4J3RrjBARMFnZN+30=;
	b=pLfCjQbCHRyJbo2K+Iaa1S/lnuEXDskB/FLuPmonwCOeWCCg9p9RMa8bUdAh9Gvrik
	tp+t2oqw8P5skNprNS4S/MXO7pwYszSqF8m/RbbzU4muEIP9Ov7y6oKSOM/TbBp7z9Vi
	X+QKMh7ISRZKEHgc2rHVQ6eWKpmKjPALDLG8Hos2p7gQY7HBhi5HMmIsQ53HX4X4wZuj
	hF5RZ6P9n1QZWBnPrEP1oIO7yHb3PTjb1jBh0wKlCifWZN0IC/Y5Tvb3xyzlwhE/CN5q
	YByTi8DLE0s7W8jmtd5uJFKm8hfdQQDMkToqH8ST64JaRF7ALMs3qTdiOFSEUGZB+lmf
	2yzg==
X-Gm-Message-State: AOUpUlE0gqxrOg6g2ZQiimgBbdSaYv++05ogeOgdVyg4IjtIacAovryy
	3eERNxEY3lGdUuGQ0sqz+YY=
X-Google-Smtp-Source: AA+uWPy/jBBRbTtF+2dVuQpa+wGWg0vQ8aKBLDqnrHIMTWyORZtytH40PAGPeC8rBYFK1nPwtK/m5Q==
X-Received: by 2002:aca:3057:: with SMTP id
	w84-v6mr4712514oiw.231.1533765269511; 
	Wed, 08 Aug 2018 14:54:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:15 -0700
Message-Id: <1533765259-10091-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 08/12] Binutils: Security fix for CVE-2018-6759
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:28 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2018-6759.patch          | 108 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index db7305a..c668e63 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
      file://CVE-2018-10535.patch \
      file://CVE-2018-13033.patch \
      file://CVE-2018-6323.patch \
+     file://CVE-2018-6759.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-6759.patch
new file mode 100644
index 0000000..3b0e98a
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
+Affects: <= 2.30
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
+ 2018-01-25  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22746
-- 
2.7.4


