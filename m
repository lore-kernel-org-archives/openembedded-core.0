Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.194.1630174432517186348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RLtK8lWR;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.54, mailfrom: steve@sakoman.com)
Received: by mail-io1-f54.google.com with SMTP id f6so13646323iox.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qZkR0d1QI2znfGgbQXK76oUiHVbpPMcjbpfCnNiB0nw=;
        b=RLtK8lWREbi3cV7JhKoh9wyRvN/E85AbdcTs+hQvcQi/Lh6pAAOmL5zyQXsireGuZs
         nzMNVcnkIQ9fT+DgzGSXC5gYyJKxrBB+te3o9DVBetCC+qknyFBnaA2HGtijcBnOcuQd
         quX8esmfIDw9dlLvLVtSoKTG+K0bvXcLnl3pPqjsb5tFWFnM6qnL2ElLa/jqxw5BUCcV
         CE3MWMhQ2CfaABEPDwGF5GyDSi0IDFsSmf4m4NFf67VGdxls+eg0Hj4VVGUFuUIEmqBM
         QDyJphwRMQXLV/EN+UdBReISsNE2F1mtRGbrvgleY5jKMEScO8DCW4JmPbkLplsQptcH
         G1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qZkR0d1QI2znfGgbQXK76oUiHVbpPMcjbpfCnNiB0nw=;
        b=rWtSTbtptG1JenXJqvuigmZdXcRuSGZtgVNsOrHT18ik+5S7HOwrm+xVJc+wSsyeyz
         JYMX0jnAiUEum0WRbVfFq4/hWns0bDVAkd0YMnIsNYlYficMmAfv4LCjVktHOZlccMZI
         lDHzxenf1wZ6Ybkdi3ZEfRpurfa7sl6+UcSnS16CogDbd9/ddaSNePYnAv/FgcxbCdVB
         dyOeBPwQ+Q1rjzcTafhe0tjhgo+3t+lXMZISbOM7eI+P8dZGE2muZu7PVg+Qn1w89R+m
         9FRwzgkQVG8dswuERjch1tSdW5RP6y+hbvEva4E7j+O9kyLYAJHdbWJv0f8MXHshQbQY
         5zzg==
X-Gm-Message-State: AOAM533XsjZVpsr0n84ITWHFFG8lkBFjUeTYUV8MIYHpQ/tHC0H+j3KM
	EHa3y5avug9jESSD3f9/vK+RG0bzVqR1Xn0s
X-Google-Smtp-Source: ABdhPJwWSX+opZucxfbhRNlfh9pEjGb82Cpky5xw1uDpn1JcWy/HlY9IYStc1hUgw1TFhQ2JNN4lcg==
X-Received: by 2002:a02:908a:: with SMTP id x10mr13003700jaf.30.1630174431358;
        Sat, 28 Aug 2021 11:13:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/36] binutils: Security fix for CVE-2021-3549
Date: Sat, 28 Aug 2021 08:11:11 -1000
Message-Id: <3cb2e144f8b74f9d78d93ba15e2d66e432462860.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: git://sourceware.org/binutils-gdb.git
MR: 111523
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=1cfcf3004e1830f8fe9112cfcd15285508d2c2b7
ChangeID: 2d3161f601852eb8f9a9ca982c6b0cd44e036bc6
Description:

Affects <= 2.36

Fixup Changelog to apply to dunfel context.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2021-3549.patch     | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 3e10279b1d..1c1118df54 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -48,5 +48,6 @@ SRC_URI = "\
      file://CVE-2020-16598.patch \
      file://CVE-2021-20197.patch \
      file://CVE-2021-3487.patch \
+     file://CVE-2021-3549.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
new file mode 100644
index 0000000000..4391db340a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
@@ -0,0 +1,187 @@
+From 1cfcf3004e1830f8fe9112cfcd15285508d2c2b7 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 11 Feb 2021 16:56:42 +1030
+Subject: [PATCH] PR27290, PR27293, PR27295, various avr objdump fixes
+
+Adds missing sanity checks for avr device info note, to avoid
+potential buffer overflows.  Uses bfd_malloc_and_get_section for
+sanity checking section size.
+
+	PR 27290
+	PR 27293
+	PR 27295
+	* od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
+	Use bfd_malloc_and_get_section.
+	(elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
+	check namesz.  Return NULL if descsz is too small.  Ensure
+	string table is terminated.
+	(elf32_avr_get_device_info): Formatting.  Add note_size param.
+	Sanity check note.
+	(elf32_avr_dump_mem_usage): Adjust to suit.
+
+Upstream-Status: Backport
+CVE: CVE-2021-3549
+Signed-of-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog      | 14 +++++++++
+ binutils/od-elf32_avr.c | 66 ++++++++++++++++++++++++++---------------
+ 2 files changed, 56 insertions(+), 24 deletions(-)
+
+Index: git/binutils/od-elf32_avr.c
+===================================================================
+--- git.orig/binutils/od-elf32_avr.c
++++ git/binutils/od-elf32_avr.c
+@@ -77,23 +77,29 @@ elf32_avr_filter (bfd *abfd)
+   return bfd_get_flavour (abfd) == bfd_target_elf_flavour;
+ }
+ 
+-static char*
++static char *
+ elf32_avr_get_note_section_contents (bfd *abfd, bfd_size_type *size)
+ {
+   asection *section;
++  bfd_byte *contents;
+ 
+-  if ((section = bfd_get_section_by_name (abfd, ".note.gnu.avr.deviceinfo")) == NULL)
++  section = bfd_get_section_by_name (abfd, ".note.gnu.avr.deviceinfo");
++  if (section == NULL)
+     return NULL;
+ 
+-  *size = bfd_section_size (section);
+-  char *contents = (char *) xmalloc (*size);
+-  bfd_get_section_contents (abfd, section, contents, 0, *size);
++  if (!bfd_malloc_and_get_section (abfd, section, &contents))
++    {
++      free (contents);
++      contents = NULL;
++    }
+ 
+-  return contents;
++  *size = bfd_section_size (section);
++  return (char *) contents;
+ }
+ 
+-static char* elf32_avr_get_note_desc (bfd *abfd, char *contents,
+-        bfd_size_type size)
++static char *
++elf32_avr_get_note_desc (bfd *abfd, char *contents, bfd_size_type size,
++			 bfd_size_type *descsz)
+ {
+   Elf_External_Note *xnp = (Elf_External_Note *) contents;
+   Elf_Internal_Note in;
+@@ -107,42 +113,54 @@ static char* elf32_avr_get_note_desc (bf
+   if (in.namesz > contents - in.namedata + size)
+     return NULL;
+ 
++  if (in.namesz != 4 || strcmp (in.namedata, "AVR") != 0)
++    return NULL;
++
+   in.descsz = bfd_get_32 (abfd, xnp->descsz);
+   in.descdata = in.namedata + align_power (in.namesz, 2);
+-  if (in.descsz != 0
+-        && (in.descdata >= contents + size
+-            || in.descsz > contents - in.descdata + size))
++  if (in.descsz < 6 * sizeof (uint32_t)
++      || in.descdata >= contents + size
++      || in.descsz > contents - in.descdata + size)
+     return NULL;
+ 
+-  if (strcmp (in.namedata, "AVR") != 0)
+-    return NULL;
++  /* If the note has a string table, ensure it is 0 terminated.  */
++  if (in.descsz > 8 * sizeof (uint32_t))
++    in.descdata[in.descsz - 1] = 0;
+ 
++  *descsz = in.descsz;
+   return in.descdata;
+ }
+ 
+ static void
+ elf32_avr_get_device_info (bfd *abfd, char *description,
+-        deviceinfo *device)
++			   bfd_size_type desc_size, deviceinfo *device)
+ {
+   if (description == NULL)
+     return;
+ 
+   const bfd_size_type memory_sizes = 6;
+ 
+-  memcpy (device, description, memory_sizes * sizeof(uint32_t));
+-  device->name = NULL;
++  memcpy (device, description, memory_sizes * sizeof (uint32_t));
++  desc_size -= memory_sizes * sizeof (uint32_t);
++  if (desc_size < 8)
++    return;
+ 
+-  uint32_t *stroffset_table = ((uint32_t *) description) + memory_sizes;
++  uint32_t *stroffset_table = (uint32_t *) description + memory_sizes;
+   bfd_size_type stroffset_table_size = bfd_get_32 (abfd, stroffset_table);
+-  char *str_table = ((char *) stroffset_table) + stroffset_table_size;
+ 
+   /* If the only content is the size itself, there's nothing in the table */
+-  if (stroffset_table_size == 4)
++  if (stroffset_table_size < 8)
+     return;
++  if (desc_size <= stroffset_table_size)
++    return;
++  desc_size -= stroffset_table_size;
+ 
+   /* First entry is the device name index. */
+   uint32_t device_name_index = bfd_get_32 (abfd, stroffset_table + 1);
++  if (device_name_index >= desc_size)
++    return;
+ 
++  char *str_table = (char *) stroffset_table + stroffset_table_size;
+   device->name = str_table + device_name_index;
+ }
+ 
+@@ -183,7 +201,7 @@ static void
+ elf32_avr_dump_mem_usage (bfd *abfd)
+ {
+   char *description = NULL;
+-  bfd_size_type note_section_size = 0;
++  bfd_size_type sec_size, desc_size;
+ 
+   deviceinfo device = { 0, 0, 0, 0, 0, 0, NULL };
+   device.name = "Unknown";
+@@ -192,13 +210,13 @@ elf32_avr_dump_mem_usage (bfd *abfd)
+   bfd_size_type text_usage = 0;
+   bfd_size_type eeprom_usage = 0;
+ 
+-  char *contents = elf32_avr_get_note_section_contents (abfd,
+-    &note_section_size);
++  char *contents = elf32_avr_get_note_section_contents (abfd, &sec_size);
+ 
+   if (contents != NULL)
+     {
+-      description = elf32_avr_get_note_desc (abfd, contents, note_section_size);
+-      elf32_avr_get_device_info (abfd, description, &device);
++      description = elf32_avr_get_note_desc (abfd, contents, sec_size,
++					     &desc_size);
++      elf32_avr_get_device_info (abfd, description, desc_size, &device);
+     }
+ 
+   elf32_avr_get_memory_usage (abfd, &text_usage, &data_usage,
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,17 @@
++2021-02-11  Alan Modra  <amodra@gmail.com>
++
++       PR 27290
++       PR 27293
++       PR 27295
++       * od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
++       Use bfd_malloc_and_get_section.
++       (elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
++       check namesz.  Return NULL if descsz is too small.  Ensure
++       string table is terminated.
++       (elf32_avr_get_device_info): Formatting.  Add note_size param.
++       Sanity check note.
++       (elf32_avr_dump_mem_usage): Adjust to suit.
++
+ 2020-02-01  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* configure: Regenerate.
-- 
2.25.1

