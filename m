Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E555C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.2832.1668262217273896503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y0thQOj3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l6so6741122pjj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LF7MUPENG2fRUG5d/chtvgCmsAXhlqNinyFKx1srS/4=;
        b=y0thQOj3+QIaWyD9WM0ufgXs3w1EW6a27+kT4q1AfICU8qY8FsmQvrPY12J//my0+k
         rPd6UF1mSRFYBq3Id19HiOhuP/BopiUCFUTBnnn4lVYnw3iHGJ9vkN3YnZYXabO4BqQL
         rLYJqzxcQ4dTSi+xLmxuhBSDBBa6dFSykxJGLgr6Pgn/EsN/iwf0bT14BQitlSxp8aB9
         OJWncNFssTwZeX2IWSrI00dNpowdwTdFY6Rqx3S7FDMOR6k5EXH0szB8eVT6nuZ8Q2eT
         anDwp5VWZTituXOXTs368v60qo9fUiw1nboQTh23Da9gF6U19pCn5Eay8ymPQA23JVqz
         Osqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LF7MUPENG2fRUG5d/chtvgCmsAXhlqNinyFKx1srS/4=;
        b=rKE5Q56bMYR+bJG3K/ajOCT6Fvp+netTfyjsgKeXcvRRLcfV2F5hZHMtYpVfrx+HnB
         7NYsqVyZX8MwGA3hjSIGe3Bk4XxulId4V/Z7gRn2cWB6LeQc2vOgppjSbmMa5jlltwMZ
         Sp9P36WDENatdpHRRdcJEEFYGOlbPi0l6Z27w0/PLdzUFe0hT/78SrwxERmK93UyX5uY
         gNblBZPSUvCmy9HdoTEzm8EAIwZm3m03hKhCsJtHkmdQ23EcWEYy6m27tA995K7Bfnhd
         X/P2zr4AIxj5geELnchQNAhGUwNDY/z1t8/YrXYk8fkBRCRqdAya2M8jKbYQ9ZsvApbC
         VV4w==
X-Gm-Message-State: ANoB5pmpF6pBvLo1D8L5cA5nDsTevKwTkdZ8i1UwlbCFbQPlGp7r0KfI
	LGliKAy7IxIUxWxU/aEeqBVWYRCZp3vvNajl
X-Google-Smtp-Source: AA0mqf5ATnSfA/zxofKiBpqsaMAwxGsBVnayYQmldAE4KgWkf5cwMmfFYzoGDoU4lW31WKqzc2w+mw==
X-Received: by 2002:a17:902:7598:b0:188:6c5b:ffb0 with SMTP id j24-20020a170902759800b001886c5bffb0mr6986871pll.125.1668262216068;
        Sat, 12 Nov 2022 06:10:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/11] binutils: stable 2.34 branch updates
Date: Sat, 12 Nov 2022 04:09:53 -1000
Message-Id: <ad15d44b6c56ccbbe8e4c12717e7dfe3492a659a.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173154

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Below commits on binutils-2.34 stable branch are updated.
c4e78c0868a PR27755, powerpc-ld infinite loop
33973d228c9 gas, arm: PR26858 Fix availability of single precision vmul/vmla in arm mode
0c8652fe288 x86: Update GNU property tests
5c1bd3f52c6 x86: Properly merge -z ibt and -z shstk
93b9bf1651a PowerPC TPREL_HA/LO optimisation
58950a3bfd4 Date update
e3b314d3a61 aarch64: set sh_entsize of .plt to 0
26b6ab7a0e4 S/390: z13: Accept vector alignment hints
7324292cd94 gas: Fix checking for backwards .org with negative offset
463ec189fe9 Prevent a potential use-after-fee memory corruption bug in the linker (for PE format files).
ef2826c0fdb Fix the ARM assembler to generate a Realtime profile for armv8-r.
8524bb5bd28 Re: Fix tight loop on recursively-defined symbols
5768460022b Fix tight loop on recursively-defined symbols
a72427b1ae0 gas: PR 25863: Fix scalar vmul inside it block when assembling for MVE
9f57ab49b32 BFD: Exclude sections with no content from compress check.
aaf3f0599a2 Arm: Fix LSB of GOT for Thumb2 only PLT.
97f92b3e90a Arm: Fix thumb2 PLT branch offsets.
3053d7a163c include: Sync plugin-api.h with GCC
f7aec2b8e09 PR25745, powerpc64-ld overflows string buffer in --stats mode
1b2bf0f65c1 include: Sync plugin-api.h with GCC
5e8619b9597 include: Sync lto-symtab.h and plugin-api.h with GCC
23820109ced plugin: Don't invoke LTO-wrapper
64f5c0afcc4 plugin: Use LDPT_ADD_SYMBOLS_V2 to get symbol type
aaa1e160040 Silence warnings due to plugin API change
e7c0ee5110c Include: Sync lto-symtab.h and plugin-api.h with GCC
b6520be37fd Fix dwarf.c build with GCC 10
a560c29ca5a bfd: Change num_group to unsigned int
3ca4cd1ebde gas, arm: Fix bad backport
b3174859c4b gas, arm: PR25660L Fix vadd/vsub with lt and le condition codes for MVE
de9c1b7cfe6 powerpc64-ld infinite loop
0318fc4e18e Adjust PR25355 testcase
40bfb976274 Re: PR24511, nm should not mark symbols in .init_array as "t"
42b2380cdce Don't call lto-wrapper for ar and ranlib
acc4a8b8ac8 PR25585, PHDR segment not covered by LOAD segment

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  2 +-
 .../binutils/binutils/CVE-2020-16593.patch    |  4 +-
 .../binutils/binutils/CVE-2021-3549.patch     | 80 +++++++++----------
 3 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index ff0d467132..713e428a3e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -24,7 +24,7 @@ BRANCH ?= "binutils-2_34-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "d4b50999b3b287b5f984ade2f8734aa8c9359440"
+SRCREV ?= "c4e78c0868a22971680217a41fdb73516a26813d"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
index cbe4a50507..c7c7829261 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
@@ -199,6 +199,6 @@ Index: git/bfd/ChangeLog
 +       * dwarf2.c (scan_unit_for_symbols): Wrap overlong lines.  Don't
 +       strdup(0).
 +
- 2020-02-19  H.J. Lu  <hongjiu.lu@intel.com>
+ 2021-05-03  Alan Modra  <amodra@gmail.com>
  
- 	PR binutils/25355
+ 	PR 27755
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch b/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
index 4391db340a..5f56dd7696 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
@@ -7,31 +7,49 @@ Adds missing sanity checks for avr device info note, to avoid
 potential buffer overflows.  Uses bfd_malloc_and_get_section for
 sanity checking section size.
 
-	PR 27290
-	PR 27293
-	PR 27295
-	* od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
-	Use bfd_malloc_and_get_section.
-	(elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
-	check namesz.  Return NULL if descsz is too small.  Ensure
-	string table is terminated.
-	(elf32_avr_get_device_info): Formatting.  Add note_size param.
-	Sanity check note.
-	(elf32_avr_dump_mem_usage): Adjust to suit.
+        PR 27290
+        PR 27293
+        PR 27295
+        * od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
+        Use bfd_malloc_and_get_section.
+        (elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
+        check namesz.  Return NULL if descsz is too small.  Ensure
+        string table is terminated.
+        (elf32_avr_get_device_info): Formatting.  Add note_size param.
+        Sanity check note.
+        (elf32_avr_dump_mem_usage): Adjust to suit.
 
 Upstream-Status: Backport
 CVE: CVE-2021-3549
 Signed-of-by: Armin Kuster <akuster@mvista.com>
 
 ---
- binutils/ChangeLog      | 14 +++++++++
- binutils/od-elf32_avr.c | 66 ++++++++++++++++++++++++++---------------
- 2 files changed, 56 insertions(+), 24 deletions(-)
-
-Index: git/binutils/od-elf32_avr.c
-===================================================================
---- git.orig/binutils/od-elf32_avr.c
-+++ git/binutils/od-elf32_avr.c
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index 1e9a96c9bb6..02e5019204e 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,17 @@
++2021-02-11  Alan Modra  <amodra@gmail.com>
++
++	   PR 27290
++	   PR 27293
++	   PR 27295
++	   * od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
++	   Use bfd_malloc_and_get_section.
++	   (elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
++	   check namesz.  Return NULL if descsz is too small.  Ensure
++	   string table is terminated.
++	   (elf32_avr_get_device_info): Formatting.  Add note_size param.
++	   Sanity check note.
++	   (elf32_avr_dump_mem_usage): Adjust to suit.
++
+ 2020-03-25  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+ 	* ar.c (main): Update bfd_plugin_set_program_name call.
+diff --git a/binutils/od-elf32_avr.c b/binutils/od-elf32_avr.c
+index 5ec99957fe9..1d32bce918e 100644
+--- a/binutils/od-elf32_avr.c
++++ b/binutils/od-elf32_avr.c
 @@ -77,23 +77,29 @@ elf32_avr_filter (bfd *abfd)
    return bfd_get_flavour (abfd) == bfd_target_elf_flavour;
  }
@@ -70,7 +88,7 @@ Index: git/binutils/od-elf32_avr.c
  {
    Elf_External_Note *xnp = (Elf_External_Note *) contents;
    Elf_Internal_Note in;
-@@ -107,42 +113,54 @@ static char* elf32_avr_get_note_desc (bf
+@@ -107,42 +113,54 @@ static char* elf32_avr_get_note_desc (bfd *abfd, char *contents,
    if (in.namesz > contents - in.namedata + size)
      return NULL;
  
@@ -163,25 +181,3 @@ Index: git/binutils/od-elf32_avr.c
      }
  
    elf32_avr_get_memory_usage (abfd, &text_usage, &data_usage,
-Index: git/binutils/ChangeLog
-===================================================================
---- git.orig/binutils/ChangeLog
-+++ git/binutils/ChangeLog
-@@ -1,3 +1,17 @@
-+2021-02-11  Alan Modra  <amodra@gmail.com>
-+
-+       PR 27290
-+       PR 27293
-+       PR 27295
-+       * od-elf32_avr.c (elf32_avr_get_note_section_contents): Formatting.
-+       Use bfd_malloc_and_get_section.
-+       (elf32_avr_get_note_desc): Formatting.  Return descsz.  Sanity
-+       check namesz.  Return NULL if descsz is too small.  Ensure
-+       string table is terminated.
-+       (elf32_avr_get_device_info): Formatting.  Add note_size param.
-+       Sanity check note.
-+       (elf32_avr_dump_mem_usage): Adjust to suit.
-+
- 2020-02-01  Nick Clifton  <nickc@redhat.com>
- 
- 	* configure: Regenerate.
-- 
2.25.1


