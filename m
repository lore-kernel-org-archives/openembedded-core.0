Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91369C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 03:04:57 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.2634.1668049492797978607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 19:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdOvNtvB;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s196so497697pgs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jhXcuRlI2Pcc13PhNWcP/LmHCSSxe7h4QpONxwqDcNI=;
        b=RdOvNtvB0FwOkoXKUoKdG9QWu4WawhMvWi6b+nqTrKbD02I41/QJ40JJzt/xh+XThw
         N8hJfdWEyon4GfUfFKg9RxjjCDL7Xk3PgKCctox9inPd9d2HwIGR+afY3utKgSA+tIZg
         JQjpfcdg0Qb2ZPjfVA4QPqrOCGrhd4OiiYtGLK2Gxamlxauwo8U1QkvXHlOTeExfwTMN
         IaXBVwE0Fhe93Ut9vx8ve7XgOwf8aryL3sH/Q7c3rhRPnAxXHIOSkhMsZ7i/8lEitKnt
         OifgVaiWNwQJbqkcist9vdUFr1Lbh6A3UE+6eZEU/wZ5v28xskQ5HqN29aNCzW3wOIPe
         zXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhXcuRlI2Pcc13PhNWcP/LmHCSSxe7h4QpONxwqDcNI=;
        b=au80fqImWDINO9wnlu50dVI/M3GBEl1I9XRR23mwFDmXp35yvOqcHfOejfeYdxDVn5
         9SAudopfBkuWuN0V08e5EgpJRoUV34O+cpqF+jIRwWqG8ZnijY/ANU0oWr5gHjzrgsJG
         /gZV6GqACCBWO25XDOEsxmQJJKFeO2XyaVOKZob0TQy1YEVO/+QSA7tMdbpozzDvmZsu
         4BYiu1/ogRxMUyfDtJHR/yBF3K9JQKE899dZ0BLpIjYZhJUFdll05b8xYtTXH4cEWwAg
         5Xzrh+vM6ygdo6ATeQUvZ6Unf/2/OA77ALhDPLK8mtEatqP6PpFTcnF2B0AaDRrepVN9
         Z5Bg==
X-Gm-Message-State: ACrzQf0HgtokrJVqqNWi4KFKMDT2fD6xgoInH7bZoCL0Jwpux/UUj+YF
	uqPUpcORRlqnRHK26dxK0w34SrPi58E=
X-Google-Smtp-Source: AMsMyM6zHTHseH+A+7qrwE/6c+NBFxWBw45PaPjpDM6laWUL7KJ56q8uQxz2u9ZeA8vH4ObT48U6Hg==
X-Received: by 2002:aa7:85c2:0:b0:56e:ad31:b98b with SMTP id z2-20020aa785c2000000b0056ead31b98bmr1329283pfn.40.1668049491660;
        Wed, 09 Nov 2022 19:04:51 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903120e00b0016be834d54asm9914171plh.306.2022.11.09.19.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 19:04:51 -0800 (PST)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [dunfell] binutils: stable 2.34 branch updates
Date: Thu, 10 Nov 2022 08:34:16 +0530
Message-Id: <20221110030416.1054652-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 03:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173064

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


