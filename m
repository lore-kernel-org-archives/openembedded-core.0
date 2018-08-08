Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0F978E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:41 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u24-v6so1304225pfn.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZE78ezwjwvIQoURThvMgsjGAEj/mmabnEbQUc5s1q2Y=;
	b=dmPexUtUlfiut2tIfE4rrCp00Wshc1QvJEva+tFRxrzx1qff3isKOS+fDBv4vjctFy
	v/lO2igU276N2GJY7tBcxs4kLSE35kk+yXEoaAVpfUzf/dXx1MJNcK75faRXcXMT63uJ
	OCbd4p4DkkDkkJlD3/xZv/PqO4ue1+SDJ3PWKTJy5OYi1M/JxusQ2IXuoK1MH/49RdK4
	OsNDh7C1an5Bx/3UxPpIwTvZ6hKnrFe8uTN5JyiAoB8iicq5ml1XPGvLHqqKF+yHqlPE
	vKsdRRuflTM1gS7A6Vzg4CPt82nn7sn7vX7zD5lh/GieyCqa6gC7PY6PGaFQerrGVNUL
	0G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZE78ezwjwvIQoURThvMgsjGAEj/mmabnEbQUc5s1q2Y=;
	b=CBhK6IdjKbJ9BVZKnx+QcWAchQmaw90AwbnHh8EVbqRXsoX78zop5/1BL+4TPyN5g3
	K7FOwjrofb6MaZqpGOFyYe0PLpSNaXIVQiy+5uKuZu8000XOgOI/mPQU/7psEylY/tWO
	bSGLn3h7HueFqIT5FkK2nM0hovE2Iq2vE9VQuweAgOurlZe/t39DeHryDdzSi5Uzdk1A
	UyftzQyAgHrvWmOeW4O9xosxeqwZxBKvKidSX6UU8CRx3k/klOIrXQZEONu4hvPZ18om
	Tok7B8bSYUQRBdk+CB2rGY0tv7mRPSeiI/fiSXea0bFrXh2V/pYWrsdsuxcaxaEjK03b
	fC8Q==
X-Gm-Message-State: AOUpUlEiDGAHbeTAN/1jRaBTURPCzEFkwjAjiaLmR0hPbI6cegGKmgvH
	fW/mXRga6OjspoOyGoa9Znc59p5Q
X-Google-Smtp-Source: AA+uWPzhq5JfCLl3kA0TZBAbo9Sa6T3qJZ9cd8sNGNXS630Yr2O62MhJ6J9YykkEKLMAz2Au2znbvg==
X-Received: by 2002:a62:47c4:: with SMTP id
	p65-v6mr3561074pfi.170.1533742542710; 
	Wed, 08 Aug 2018 08:35:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:14 -0700
Message-Id: <1533742522-24357-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 19/27] binutls: Security fix for CVE-2017-16828
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:41 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   2 +
 .../binutils/binutils/CVE-2017-16828_p1.patch      |  79 +++++++++++
 .../binutils/binutils/CVE-2017-16828_p2.patch      | 149 +++++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 7d05046..65d3c34 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -54,6 +54,8 @@ SRC_URI = "\
      file://CVE-2017-15996.patch \
      file://CVE-2017-16826.patch \
      file://CVE-2017-16827.patch \
+     file://CVE-2017-16828_p1.patch \
+     file://CVE-2017-16828_p2.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p1.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p1.patch
new file mode 100644
index 0000000..310908f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p1.patch
@@ -0,0 +1,79 @@
+From 9c0f3d3f2017829ffd908c9893b85094985c3b58 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 5 Oct 2017 17:32:18 +1030
+Subject: [PATCH] PR22239 - invalid memory read in display_debug_frames
+
+Pointer comparisons have traps for the unwary.  After adding a large
+unknown value to "start", the test "start < end" depends on where
+"start" is originally in memory.
+
+	PR 22239
+	* dwarf.c (read_cie): Don't compare "start" and "end" pointers
+	after adding a possibly wild length to "start", compare the length
+	to the difference of the pointers instead.  Remove now redundant
+	"negative" length test.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16828 patch1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  8 ++++++++
+ binutils/dwarf.c   | 15 ++++-----------
+ 2 files changed, 12 insertions(+), 11 deletions(-)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -6652,14 +6652,14 @@ read_cie (unsigned char *start, unsigned
+     {
+       READ_ULEB (augmentation_data_len);
+       augmentation_data = start;
+-      start += augmentation_data_len;
+       /* PR 17512: file: 11042-2589-0.004.  */
+-      if (start > end)
++      if (augmentation_data_len > (size_t) (end - start))
+ 	{
+ 	  warn (_("Augmentation data too long: %#lx, expected at most %#lx\n"),
+-		augmentation_data_len, (long)((end - start) + augmentation_data_len));
++		augmentation_data_len, (unsigned long) (end - start));
+ 	  return end;
+ 	}
++      start += augmentation_data_len;
+     }
+ 
+   if (augmentation_data_len)
+@@ -6672,14 +6672,7 @@ read_cie (unsigned char *start, unsigned
+       q = augmentation_data;
+       qend = q + augmentation_data_len;
+ 
+-      /* PR 17531: file: 015adfaa.  */
+-      if (qend < q)
+-	{
+-	  warn (_("Negative augmentation data length: 0x%lx"), augmentation_data_len);
+-	  augmentation_data_len = 0;
+-	}
+-
+-      while (p < end && q < augmentation_data + augmentation_data_len)
++      while (p < end && q < qend)
+ 	{
+ 	  if (*p == 'L')
+ 	    q++;
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,11 @@
++2017-10-05  Alan Modra  <amodra@gmail.com>
++
++       PR 22239
++       * dwarf.c (read_cie): Don't compare "start" and "end" pointers
++       after adding a possibly wild length to "start", compare the length
++       to the difference of the pointers instead.  Remove now redundant
++       "negative" length test.
++
+ 2017-09-27  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22219
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p2.patch
new file mode 100644
index 0000000..5073d31
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-16828_p2.patch
@@ -0,0 +1,149 @@
+From bf59c5d5f4f5b8b4da1f5f605cfa546f8029b43d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 3 Nov 2017 13:57:15 +0000
+Subject: [PATCH] Fix integer overflow problems when reading an ELF binary with
+ corrupt augmentation data.
+
+	PR 22386
+	* dwarf.c (read_cie): Use bfd_size_type for
+	augmentation_data_len.
+	(display_augmentation_data): New function.
+	(display_debug_frames): Use it.
+	Check for integer overflow when testing augmentation_data_len.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-16828 patch2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 10 +++++++++
+ binutils/dwarf.c   | 65 +++++++++++++++++++++++++++++++++---------------------
+ 2 files changed, 50 insertions(+), 25 deletions(-)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -6577,13 +6577,13 @@ frame_display_row (Frame_Chunk *fc, int
+ static unsigned char *
+ read_cie (unsigned char *start, unsigned char *end,
+ 	  Frame_Chunk **p_cie, int *p_version,
+-	  unsigned long *p_aug_len, unsigned char **p_aug)
++	  bfd_size_type *p_aug_len, unsigned char **p_aug)
+ {
+   int version;
+   Frame_Chunk *fc;
+   unsigned int length_return;
+   unsigned char *augmentation_data = NULL;
+-  unsigned long augmentation_data_len = 0;
++  bfd_size_type augmentation_data_len = 0;
+ 
+   * p_cie = NULL;
+   /* PR 17512: file: 001-228113-0.004.  */
+@@ -6653,10 +6653,11 @@ read_cie (unsigned char *start, unsigned
+       READ_ULEB (augmentation_data_len);
+       augmentation_data = start;
+       /* PR 17512: file: 11042-2589-0.004.  */
+-      if (augmentation_data_len > (size_t) (end - start))
++      if (augmentation_data_len > (bfd_size_type) (end - start))
+ 	{
+-	  warn (_("Augmentation data too long: %#lx, expected at most %#lx\n"),
+-		augmentation_data_len, (unsigned long) (end - start));
++	  warn (_("Augmentation data too long: 0x%s, expected at most %#lx\n"),
++		dwarf_vmatoa ("x", augmentation_data_len),
++		(unsigned long) (end - start));
+ 	  return end;
+ 	}
+       start += augmentation_data_len;
+@@ -6701,6 +6702,31 @@ read_cie (unsigned char *start, unsigned
+   return start;
+ }
+ 
++/* Prints out the contents on the augmentation data array.
++   If do_wide is not enabled, then formats the output to fit into 80 columns.  */
++
++static void
++display_augmentation_data (const unsigned char * data, const bfd_size_type len)
++{
++  bfd_size_type i;
++
++  i = printf (_("  Augmentation data:    "));
++
++  if (do_wide || len < ((80 - i) / 3))
++    for (i = 0; i < len; ++i)
++      printf (" %02x", data[i]);
++  else
++    {
++      for (i = 0; i < len; ++i)
++	{
++	  if (i % (80 / 3) == 0)
++	    putchar ('\n');
++	  printf (" %02x", data[i]);
++	}
++    }
++  putchar ('\n');
++}
++
+ static int
+ display_debug_frames (struct dwarf_section *section,
+ 		      void *file ATTRIBUTE_UNUSED)
+@@ -6729,7 +6755,7 @@ display_debug_frames (struct dwarf_secti
+       Frame_Chunk *cie;
+       int need_col_headers = 1;
+       unsigned char *augmentation_data = NULL;
+-      unsigned long augmentation_data_len = 0;
++      bfd_size_type augmentation_data_len = 0;
+       unsigned int encoded_ptr_size = saved_eh_addr_size;
+       unsigned int offset_size;
+       unsigned int initial_length_size;
+@@ -6823,16 +6849,8 @@ display_debug_frames (struct dwarf_secti
+ 	      printf ("  Return address column: %d\n", fc->ra);
+ 
+ 	      if (augmentation_data_len)
+-		{
+-		  unsigned long i;
++		display_augmentation_data (augmentation_data, augmentation_data_len);
+ 
+-		  printf ("  Augmentation data:    ");
+-		  for (i = 0; i < augmentation_data_len; ++i)
+-		    /* FIXME: If do_wide is FALSE, then we should
+-		       add carriage returns at 80 columns...  */
+-		    printf (" %02x", augmentation_data[i]);
+-		  putchar ('\n');
+-		}
+ 	      putchar ('\n');
+ 	    }
+ 	}
+@@ -6988,11 +7006,13 @@ display_debug_frames (struct dwarf_secti
+ 	      READ_ULEB (augmentation_data_len);
+ 	      augmentation_data = start;
+ 	      start += augmentation_data_len;
+-	      /* PR 17512: file: 722-8446-0.004.  */
+-	      if (start >= end || ((signed long) augmentation_data_len) < 0)
++	      /* PR 17512 file: 722-8446-0.004 and PR 22386.  */
++	      if (start >= end
++		  || ((bfd_signed_vma) augmentation_data_len) < 0
++		  || augmentation_data > start)
+ 		{
+-		  warn (_("Corrupt augmentation data length: %lx\n"),
+-			augmentation_data_len);
++		  warn (_("Corrupt augmentation data length: 0x%s\n"),
++			dwarf_vmatoa ("x", augmentation_data_len));
+ 		  start = end;
+ 		  augmentation_data = NULL;
+ 		  augmentation_data_len = 0;
+@@ -7014,12 +7034,7 @@ display_debug_frames (struct dwarf_secti
+ 
+ 	  if (! do_debug_frames_interp && augmentation_data_len)
+ 	    {
+-	      unsigned long i;
+-
+-	      printf ("  Augmentation data:    ");
+-	      for (i = 0; i < augmentation_data_len; ++i)
+-		printf (" %02x", augmentation_data[i]);
+-	      putchar ('\n');
++	      display_augmentation_data (augmentation_data, augmentation_data_len);
+ 	      putchar ('\n');
+ 	    }
+ 	}
-- 
2.7.4


