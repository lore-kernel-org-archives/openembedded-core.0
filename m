Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E742C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:38 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.26327.1668880113173982499
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ur86gpIv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 6so7659501pgm.6
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njIN5T94heYkTh699CuQS1+M4s6byRtQaSHmQAT/GVQ=;
        b=ur86gpIvAbWfyyIaVuxnIuSL03zjHiLyQjlSulqvonvgDyqO32+zY0iNRMUpxdJSAp
         +rejFwruKJkKkJn7U1RPJswOzVwBYIqw51j8EnKn0KQbF9G2ZbO52KgQ0HAwmMvX99B7
         /bUVEWTJEtKuCqFDDkxASIudb3+ACmW92A843Vvh3/383UV1o5OIQPLXFiD3ZT5alYRC
         KlybLyOPDtcfW6fu6+jXLVcjjqEPaG13rs7eq09uZVegig0InJH/VxfxvNQW2NVfvXZO
         dQLcCzE14Owne+pYmKXvF/4+P0BRaVt5Qp8yh2vwk4o43J3SgCDMTMGXm+hbTeYvytVD
         QwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njIN5T94heYkTh699CuQS1+M4s6byRtQaSHmQAT/GVQ=;
        b=oWgaUwtZlj+ZoLbBCs8sFcKa326t9KmGj3r3soRHBsN8CyXDVxqGR10eLUzDfEgcZg
         ijGOBkyuoLjLlsbeBUu5u0FjPaknYMSkJQcCfjWjxbnrPbdecPx5cclE5204chYrDcEP
         dkcziwyMJn14U5aQUewWz79i/UTYH8XigDFoNUbXfObVTkEmsNU05+484hL4uEohkDMo
         yGA1jy+VS/UG8KNrZxEHMOGdzlcCIt3Jd4ZVlqjbPfR10/lLUiX62cxMXF3pDYrvZNCT
         ASovPfkXDpByc58KOzWKRfDdZH5IYl2qRjNB8nUJhjfJRPAdad/JCTibIrbNipt4RWcP
         rRLg==
X-Gm-Message-State: ANoB5plz+HxymVaXie+Nr+GifUD1Ja0Bp6D7W1hy3YHaKkU6lOCK9z0y
	+zzad00cERfWZ0AiRY/+mh73+FN5N2DvijUSbJY=
X-Google-Smtp-Source: AA0mqf6bQdkoYrVkqCTQebdpBJupEb2Mf2fqd/inK8gf0iysRpiJf62Wg2rIUreEY2oM67wG/J9qzA==
X-Received: by 2002:a63:5148:0:b0:439:3c55:3df1 with SMTP id r8-20020a635148000000b004393c553df1mr11277788pgl.606.1668880109971;
        Sat, 19 Nov 2022 09:48:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/21] gcc : upgrade to v9.5
Date: Sat, 19 Nov 2022 07:47:46 -1000
Message-Id: <60984f7119a4b54cbefda48f93762b4f2b179c70.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173537

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

gcc stable version upgraded from v9.3 to v9.5

Below is the bug fix list for v9.5
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=9.5

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ----
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ------------------
 ...x-missing-dependencies-for-selftests.patch |  45 --
 .../gcc/{gcc-9.3.inc => gcc-9.5.inc}          |  13 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   0
 .../0002-gcc-poison-system-directories.patch  |   0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0004-64-bit-multilib-hack.patch           |   0
 .../0005-optional-libstdc.patch               |   0
 .../0006-COLLECT_GCC_OPTIONS.patch            |   0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0008-fortran-cross-compile-hack.patch     |   0
 .../0009-cpp-honor-sysroot.patch              |   0
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...gcc-Fix-argument-list-too-long-error.patch |   0
 .../0013-Disable-sdt.patch                    |   0
 .../{gcc-9.3 => gcc-9.5}/0014-libtool.patch   |   0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...-config-files-from-B-instead-of-usin.patch |   0
 ...ir-from-.la-which-usually-points-to-.patch |   0
 .../0018-export-CPP.patch                     |   0
 ...e-target-gcc-headers-can-be-included.patch |   0
 ...ild-with-disable-dependency-tracking.patch |   0
 ...t-directory-during-relink-if-inst_pr.patch |   0
 ...IR-replacement-instead-of-hardcoding.patch |   0
 ...23-aarch64-Add-support-for-musl-ldso.patch |   0
 ...-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...le-sysroot-support-for-nativesdk-gcc.patch |   0
 ...sroot-gcc-version-specific-dirs-with.patch |   0
 ...ous-_FOR_BUILD-and-related-variables.patch |   0
 ...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   0
 ...d-to-link-commandline-for-musl-targe.patch |   0
 .../0030-ldbl128-config.patch                 |   0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...as-for-__cpu_indicator_init-instead-.patch |   0
 .../0033-sync-gcc-stddef.h-with-musl.patch    |   0
 ...-fault-in-precompiled-header-generat.patch |   0
 .../0035-Fix-for-testsuite-failure.patch      |   0
 ...Re-introduce-spe-commandline-options.patch |   0
 ...heck-zero-value-in-simple_object_elf.patch |   0
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   0
 ...ands-Don-t-match-user-defined-regs-o.patch |   0
 ...adian_9.3.bb => gcc-cross-canadian_9.5.bb} |   0
 .../{gcc-cross_9.3.bb => gcc-cross_9.5.bb}    |   0
 ...cc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} |   0
 ...{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} |   0
 ...anitizers_9.3.bb => gcc-sanitizers_9.5.bb} |   0
 .../{gcc-source_9.3.bb => gcc-source_9.5.bb}  |   0
 .../gcc/{gcc_9.3.bb => gcc_9.5.bb}            |   0
 ...c-initial_9.3.bb => libgcc-initial_9.5.bb} |   0
 .../gcc/{libgcc_9.3.bb => libgcc_9.5.bb}      |   0
 ...{libgfortran_9.3.bb => libgfortran_9.5.bb} |   0
 55 files changed, 4 insertions(+), 1636 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
 rename meta/recipes-devtools/gcc/{gcc-9.3.inc => gcc-9.5.inc} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0002-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0004-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0005-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0006-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0008-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0009-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0010-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0012-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0013-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0014-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0018-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0019-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0023-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0025-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0027-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0030-ldbl128-config.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0033-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0034-fix-segmentation-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0035-Fix-for-testsuite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0036-Re-introduce-spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb => gcc-cross-canadian_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb => gcc-cross_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb => gcc-sanitizers_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb => gcc-source_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.3.bb => gcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb => libgcc-initial_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.3.bb => libgcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb => libgfortran_9.5.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
deleted file mode 100644
index dc1039dcc8..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=97b668f9a8c6ec565c278a60e7d1492a6932e409]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-From 97b668f9a8c6ec565c278a60e7d1492a6932e409 Mon Sep 17 00:00:00 2001
-From: Matthias Klose <doko@ubuntu.com>
-Date: Tue, 6 Oct 2020 13:41:37 +0200
-Subject: [PATCH] Backport fix for PR/tree-optimization/97236 - fix bad use of
- VMAT_CONTIGUOUS
-
-This avoids using VMAT_CONTIGUOUS with single-element interleaving
-when using V1mode vectors.  Instead keep VMAT_ELEMENTWISE but
-continue to avoid load-lanes and gathers.
-
-2020-10-01  Richard Biener  <rguenther@suse.de>
-
-	PR tree-optimization/97236
-	* tree-vect-stmts.c (get_group_load_store_type): Keep
-	VMAT_ELEMENTWISE for single-element vectors.
-
-	* gcc.dg/vect/pr97236.c: New testcase.
-
-(cherry picked from commit 1ab88985631dd2c5a5e3b5c0dce47cf8b6ed2f82)
----
- gcc/testsuite/gcc.dg/vect/pr97236.c | 43 +++++++++++++++++++++++++++++
- gcc/tree-vect-stmts.c               | 20 ++++++--------
- 2 files changed, 52 insertions(+), 11 deletions(-)
- create mode 100644 gcc/testsuite/gcc.dg/vect/pr97236.c
-
-diff --git a/gcc/testsuite/gcc.dg/vect/pr97236.c b/gcc/testsuite/gcc.dg/vect/pr97236.c
-new file mode 100644
-index 000000000000..9d3dc20d953d
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/vect/pr97236.c
-@@ -0,0 +1,43 @@
-+typedef unsigned char __uint8_t;
-+typedef __uint8_t uint8_t;
-+typedef struct plane_t {
-+  uint8_t *p_pixels;
-+  int i_lines;
-+  int i_pitch;
-+} plane_t;
-+
-+typedef struct {
-+  plane_t p[5];
-+} picture_t;
-+
-+#define N 4
-+
-+void __attribute__((noipa))
-+picture_Clone(picture_t *picture, picture_t *res)
-+{
-+  for (int i = 0; i < N; i++) {
-+    res->p[i].p_pixels = picture->p[i].p_pixels;
-+    res->p[i].i_lines = picture->p[i].i_lines;
-+    res->p[i].i_pitch = picture->p[i].i_pitch;
-+  }
-+}
-+
-+int
-+main()
-+{
-+  picture_t aaa, bbb;
-+  uint8_t pixels[10] = {1, 1, 1, 1, 1, 1, 1, 1};
-+
-+  for (unsigned i = 0; i < N; i++)
-+    aaa.p[i].p_pixels = pixels;
-+
-+  picture_Clone (&aaa, &bbb);
-+
-+  uint8_t c = 0;
-+  for (unsigned i = 0; i < N; i++)
-+    c += bbb.p[i].p_pixels[0];
-+
-+  if (c != N)
-+    __builtin_abort ();
-+  return 0;
-+}
-diff --git a/gcc/tree-vect-stmts.c b/gcc/tree-vect-stmts.c
-index 507f81b0a0e8..ffbba3441de2 100644
---- a/gcc/tree-vect-stmts.c
-+++ b/gcc/tree-vect-stmts.c
-@@ -2355,25 +2355,23 @@ get_group_load_store_type (stmt_vec_info stmt_info, tree vectype, bool slp,
- 	  /* First cope with the degenerate case of a single-element
- 	     vector.  */
- 	  if (known_eq (TYPE_VECTOR_SUBPARTS (vectype), 1U))
--	    *memory_access_type = VMAT_CONTIGUOUS;
-+	    ;
- 
- 	  /* Otherwise try using LOAD/STORE_LANES.  */
--	  if (*memory_access_type == VMAT_ELEMENTWISE
--	      && (vls_type == VLS_LOAD
--		  ? vect_load_lanes_supported (vectype, group_size, masked_p)
--		  : vect_store_lanes_supported (vectype, group_size,
--						masked_p)))
-+	  else if (vls_type == VLS_LOAD
-+		   ? vect_load_lanes_supported (vectype, group_size, masked_p)
-+		   : vect_store_lanes_supported (vectype, group_size,
-+						 masked_p))
- 	    {
- 	      *memory_access_type = VMAT_LOAD_STORE_LANES;
- 	      overrun_p = would_overrun_p;
- 	    }
- 
- 	  /* If that fails, try using permuting loads.  */
--	  if (*memory_access_type == VMAT_ELEMENTWISE
--	      && (vls_type == VLS_LOAD
--		  ? vect_grouped_load_supported (vectype, single_element_p,
--						 group_size)
--		  : vect_grouped_store_supported (vectype, group_size)))
-+	  else if (vls_type == VLS_LOAD
-+		   ? vect_grouped_load_supported (vectype, single_element_p,
-+						  group_size)
-+		   : vect_grouped_store_supported (vectype, group_size))
- 	    {
- 	      *memory_access_type = VMAT_CONTIGUOUS_PERMUTE;
- 	      overrun_p = would_overrun_p;
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
deleted file mode 100644
index a7e29f4bd7..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 20da13e395bde597d8337167c712039c8f923c3b Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:58 +0100
-Subject: [PATCH 1/3] aarch64: New Straight Line Speculation (SLS) mitigation
- flags
-
-Here we introduce the flags that will be used for straight line speculation.
-
-The new flag introduced is `-mharden-sls=`.
-This flag can take arguments of `none`, `all`, or a comma seperated list
-of one or more of `retbr` or `blr`.
-`none` indicates no special mitigation of the straight line speculation
-vulnerability.
-`all` requests all mitigations currently implemented.
-`retbr` requests that the RET and BR instructions have a speculation
-barrier inserted after them.
-`blr` requests that BLR instructions are replaced by a BL to a function
-stub using a BR with a speculation barrier after it.
-
-Setting this on a per-function basis using attributes or the like is not
-enabled, but may be in the future.
-
-(cherry picked from commit a9ba2a9b77bec7eacaf066801f22d1c366a2bc86)
-
-gcc/ChangeLog:
-
-2020-06-02  Matthew Malcomson  <matthew.malcomson@arm.com>
-
-	* config/aarch64/aarch64-protos.h (aarch64_harden_sls_retbr_p):
-	New.
-	(aarch64_harden_sls_blr_p): New.
-	* config/aarch64/aarch64.c (enum aarch64_sls_hardening_type):
-	New.
-	(aarch64_harden_sls_retbr_p): New.
-	(aarch64_harden_sls_blr_p): New.
-	(aarch64_validate_sls_mitigation): New.
-	(aarch64_override_options): Parse options for SLS mitigation.
-	* config/aarch64/aarch64.opt (-mharden-sls): New option.
-	* doc/invoke.texi: Document new option.
----
- gcc/config/aarch64/aarch64-protos.h |  3 ++
- gcc/config/aarch64/aarch64.c        | 76 +++++++++++++++++++++++++++++
- gcc/config/aarch64/aarch64.opt      |  4 ++
- gcc/doc/invoke.texi                 | 12 +++++
- 4 files changed, 95 insertions(+)
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index c083cad53..31493f412 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -644,4 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode);
- 
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
- 
-+extern bool aarch64_harden_sls_retbr_p (void);
-+extern bool aarch64_harden_sls_blr_p (void);
-+
- #endif /* GCC_AARCH64_PROTOS_H */
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index b452a53af..269ff6c92 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -11734,6 +11734,79 @@ aarch64_validate_mcpu (const char *str, const struct processor **res,
-   return false;
- }
- 
-+/* Straight line speculation indicators.  */
-+enum aarch64_sls_hardening_type
-+{
-+  SLS_NONE = 0,
-+  SLS_RETBR = 1,
-+  SLS_BLR = 2,
-+  SLS_ALL = 3,
-+};
-+static enum aarch64_sls_hardening_type aarch64_sls_hardening;
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the RET
-+   and BR instructions.  */
-+bool
-+aarch64_harden_sls_retbr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_RETBR;
-+}
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the BLR
-+   instruction.  */
-+bool
-+aarch64_harden_sls_blr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_BLR;
-+}
-+
-+/* As of yet we only allow setting these options globally, in the future we may
-+   allow setting them per function.  */
-+static void
-+aarch64_validate_sls_mitigation (const char *const_str)
-+{
-+  char *token_save = NULL;
-+  char *str = NULL;
-+
-+  if (strcmp (const_str, "none") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_NONE;
-+      return;
-+    }
-+  if (strcmp (const_str, "all") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_ALL;
-+      return;
-+    }
-+
-+  char *str_root = xstrdup (const_str);
-+  str = strtok_r (str_root, ",", &token_save);
-+  if (!str)
-+    error ("invalid argument given to %<-mharden-sls=%>");
-+
-+  int temp = SLS_NONE;
-+  while (str)
-+    {
-+      if (strcmp (str, "blr") == 0)
-+	temp |= SLS_BLR;
-+      else if (strcmp (str, "retbr") == 0)
-+	temp |= SLS_RETBR;
-+      else if (strcmp (str, "none") == 0 || strcmp (str, "all") == 0)
-+	{
-+	  error ("%<%s%> must be by itself for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      else
-+	{
-+	  error ("invalid argument %<%s%> for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      str = strtok_r (NULL, ",", &token_save);
-+    }
-+  aarch64_sls_hardening = (aarch64_sls_hardening_type) temp;
-+  free (str_root);
-+}
-+
- /* Parses CONST_STR for branch protection features specified in
-    aarch64_branch_protect_types, and set any global variables required.  Returns
-    the parsing result and assigns LAST_STR to the last processed token from
-@@ -11972,6 +12045,9 @@ aarch64_override_options (void)
-   selected_arch = NULL;
-   selected_tune = NULL;
- 
-+  if (aarch64_harden_sls_string)
-+    aarch64_validate_sls_mitigation (aarch64_harden_sls_string);
-+
-   if (aarch64_branch_protection_string)
-     aarch64_validate_mbranch_protection (aarch64_branch_protection_string);
- 
-diff --git a/gcc/config/aarch64/aarch64.opt b/gcc/config/aarch64/aarch64.opt
-index 3c6d1cc90..d27ab6df8 100644
---- a/gcc/config/aarch64/aarch64.opt
-+++ b/gcc/config/aarch64/aarch64.opt
-@@ -71,6 +71,10 @@ mgeneral-regs-only
- Target Report RejectNegative Mask(GENERAL_REGS_ONLY) Save
- Generate code which uses only the general registers.
- 
-+mharden-sls=
-+Target RejectNegative Joined Var(aarch64_harden_sls_string)
-+Generate code to mitigate against straight line speculation.
-+
- mfix-cortex-a53-835769
- Target Report Var(aarch64_fix_a53_err835769) Init(2) Save
- Workaround for ARM Cortex-A53 Erratum number 835769.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 2f7ffe456..5f04a7d2b 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -638,6 +638,7 @@ Objective-C and Objective-C++ Dialects}.
- -mpc-relative-literal-loads @gol
- -msign-return-address=@var{scope} @gol
- -mbranch-protection=@var{none}|@var{standard}|@var{pac-ret}[+@var{leaf}]|@var{bti} @gol
-+-mharden-sls=@var{opts} @gol
- -march=@var{name}  -mcpu=@var{name}  -mtune=@var{name}  @gol
- -moverride=@var{string}  -mverbose-cost-dump @gol
- -mstack-protector-guard=@var{guard} -mstack-protector-guard-reg=@var{sysreg} @gol
-@@ -15955,6 +15956,17 @@ argument @samp{leaf} can be used to extend the signing to include leaf
- functions.
- @samp{bti} turns on branch target identification mechanism.
- 
-+@item -mharden-sls=@var{opts}
-+@opindex mharden-sls
-+Enable compiler hardening against straight line speculation (SLS).
-+@var{opts} is a comma-separated list of the following options:
-+@table @samp
-+@item retbr
-+@item blr
-+@end table
-+In addition, @samp{-mharden-sls=all} enables all SLS hardening while
-+@samp{-mharden-sls=none} disables all SLS hardening.
-+
- @item -msve-vector-bits=@var{bits}
- @opindex msve-vector-bits
- Specify the number of bits in an SVE vector register.  This option only has
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
deleted file mode 100644
index c972088d2b..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
+++ /dev/null
@@ -1,600 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dc586a749228ecfb71f72ec2ca10e6f7b6874af3 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 2/3] aarch64: Introduce SLS mitigation for RET and BR
- instructions
-
-Instructions following RET or BR are not necessarily executed.  In order
-to avoid speculation past RET and BR we can simply append a speculation
-barrier.
-
-Since these speculation barriers will not be architecturally executed,
-they are not expected to add a high performance penalty.
-
-The speculation barrier is to be SB when targeting architectures which
-have this enabled, and DSB SY + ISB otherwise.
-
-We add tests for each of the cases where such an instruction was seen.
-
-This is implemented by modifying each machine description pattern that
-emits either a RET or a BR instruction.  We choose not to use something
-like `TARGET_ASM_FUNCTION_EPILOGUE` since it does not affect the
-`indirect_jump`, `jump`, `sibcall_insn` and `sibcall_value_insn`
-patterns and we find it preferable to implement the functionality in the
-same way for every pattern.
-
-There is one particular case which is slightly tricky.  The
-implementation of TARGET_ASM_TRAMPOLINE_TEMPLATE uses a BR which needs
-to be mitigated against.  The trampoline template is used *once* per
-compilation unit, and the TRAMPOLINE_SIZE is exposed to the user via the
-builtin macro __LIBGCC_TRAMPOLINE_SIZE__.
-In the future we may implement function specific attributes to turn on
-and off hardening on a per-function basis.
-The fixed nature of the trampoline described above implies it will be
-safer to ensure this speculation barrier is always used.
-
-Testing:
-  Bootstrap and regtest done on aarch64-none-linux
-  Used a temporary hack(1) to use these options on every test in the
-  testsuite and a script to check that the output never emitted an
-  unmitigated RET or BR.
-
-1) Temporary hack was a change to the testsuite to always use
-`-save-temps` and run a script on the assembly output of those
-compilations which produced one to ensure every RET or BR is immediately
-followed by a speculation barrier.
-
-(cherry picked from be178ecd5ac1fe1510d960ff95c66d0ff831afe1)
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_sls_barrier): New.
-	* config/aarch64/aarch64.c (aarch64_output_casesi): Emit
-	speculation barrier after BR instruction if needs be.
-	(aarch64_trampoline_init): Handle ptr_mode value & adjust size
-	of code copied.
-	(aarch64_sls_barrier): New.
-	(aarch64_asm_trampoline_template): Add needed barriers.
-	* config/aarch64/aarch64.h (AARCH64_ISA_SB): New.
-	(TARGET_SB): New.
-	(TRAMPOLINE_SIZE): Account for barrier.
-	* config/aarch64/aarch64.md (indirect_jump, *casesi_dispatch,
-	simple_return, *do_return, *sibcall_insn, *sibcall_value_insn):
-	Emit barrier if needs be, also account for possible barrier using
-	"sls_length" attribute.
-	(sls_length): New attribute.
-	(length): Determine default using any non-default sls_length
-	value.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c:
-	New test.
-	* gcc.target/aarch64/sls-mitigation/sls-mitigation.exp: New file.
-	* lib/target-supports.exp (check_effective_target_aarch64_asm_sb_ok):
-	New proc.
----
- gcc/config/aarch64/aarch64-protos.h           |   1 +
- gcc/config/aarch64/aarch64.c                  |  41 +++++-
- gcc/config/aarch64/aarch64.h                  |  10 +-
- gcc/config/aarch64/aarch64.md                 |  75 ++++++++---
- .../sls-mitigation/sls-miti-retbr-pacret.c    |  15 +++
- .../aarch64/sls-mitigation/sls-miti-retbr.c   | 119 ++++++++++++++++++
- .../aarch64/sls-mitigation/sls-mitigation.exp |  73 +++++++++++
- gcc/testsuite/lib/target-supports.exp         |   3 +-
- 8 files changed, 312 insertions(+), 25 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index 31493f412..885eae893 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -644,6 +644,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode);
- 
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
- 
-+const char *aarch64_sls_barrier (int);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 269ff6c92..dff61105c 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8412,8 +8412,8 @@ aarch64_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
- static void
- aarch64_asm_trampoline_template (FILE *f)
- {
--  int offset1 = 16;
--  int offset2 = 20;
-+  int offset1 = 24;
-+  int offset2 = 28;
- 
-   if (aarch64_bti_enabled ())
-     {
-@@ -8436,6 +8436,17 @@ aarch64_asm_trampoline_template (FILE *f)
-     }
-   asm_fprintf (f, "\tbr\t%s\n", reg_names [IP1_REGNUM]);
- 
-+  /* We always emit a speculation barrier.
-+     This is because the same trampoline template is used for every nested
-+     function.  Since nested functions are not particularly common or
-+     performant we don't worry too much about the extra instructions to copy
-+     around.
-+     This is not yet a problem, since we have not yet implemented function
-+     specific attributes to choose between hardening against straight line
-+     speculation or not, but such function specific attributes are likely to
-+     happen in the future.  */
-+  asm_fprintf (f, "\tdsb\tsy\n\tisb\n");
-+
-   /* The trampoline needs an extra padding instruction.  In case if BTI is
-      enabled the padding instruction is replaced by the BTI instruction at
-      the beginning.  */
-@@ -8450,10 +8461,14 @@ static void
- aarch64_trampoline_init (rtx m_tramp, tree fndecl, rtx chain_value)
- {
-   rtx fnaddr, mem, a_tramp;
--  const int tramp_code_sz = 16;
-+  const int tramp_code_sz = 24;
- 
-   /* Don't need to copy the trailing D-words, we fill those in below.  */
--  emit_block_move (m_tramp, assemble_trampoline_template (),
-+  /* We create our own memory address in Pmode so that `emit_block_move` can
-+     use parts of the backend which expect Pmode addresses.  */
-+  rtx temp = convert_memory_address (Pmode, XEXP (m_tramp, 0));
-+  emit_block_move (gen_rtx_MEM (BLKmode, temp),
-+		   assemble_trampoline_template (),
- 		   GEN_INT (tramp_code_sz), BLOCK_OP_NORMAL);
-   mem = adjust_address (m_tramp, ptr_mode, tramp_code_sz);
-   fnaddr = XEXP (DECL_RTL (fndecl), 0);
-@@ -8640,6 +8655,8 @@ aarch64_output_casesi (rtx *operands)
-   output_asm_insn (buf, operands);
-   output_asm_insn (patterns[index][1], operands);
-   output_asm_insn ("br\t%3", operands);
-+  output_asm_insn (aarch64_sls_barrier (aarch64_harden_sls_retbr_p ()),
-+		   operands);
-   assemble_label (asm_out_file, label);
-   return "";
- }
-@@ -18976,6 +18993,22 @@ aarch64_file_end_indicate_exec_stack ()
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_BTI
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_AND
- 
-+/* Helper function for straight line speculation.
-+   Return what barrier should be emitted for straight line speculation
-+   mitigation.
-+   When not mitigating against straight line speculation this function returns
-+   an empty string.
-+   When mitigating against straight line speculation, use:
-+   * SB when the v8.5-A SB extension is enabled.
-+   * DSB+ISB otherwise.  */
-+const char *
-+aarch64_sls_barrier (int mitigation_required)
-+{
-+  return mitigation_required
-+    ? (TARGET_SB ? "sb" : "dsb\tsy\n\tisb")
-+    : "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 772a97296..72ddc6fd9 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -235,6 +235,7 @@ extern unsigned aarch64_architecture_version;
- #define AARCH64_ISA_F16FML	   (aarch64_isa_flags & AARCH64_FL_F16FML)
- #define AARCH64_ISA_RCPC8_4	   (aarch64_isa_flags & AARCH64_FL_RCPC8_4)
- #define AARCH64_ISA_V8_5	   (aarch64_isa_flags & AARCH64_FL_V8_5)
-+#define AARCH64_ISA_SB		   (aarch64_isa_flags & AARCH64_FL_SB)
- 
- /* Crypto is an optional extension to AdvSIMD.  */
- #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
-@@ -285,6 +286,9 @@ extern unsigned aarch64_architecture_version;
- #define TARGET_FIX_ERR_A53_835769_DEFAULT 1
- #endif
- 
-+/* SB instruction is enabled through +sb.  */
-+#define TARGET_SB (AARCH64_ISA_SB)
-+
- /* Apply the workaround for Cortex-A53 erratum 835769.  */
- #define TARGET_FIX_ERR_A53_835769	\
-   ((aarch64_fix_a53_err835769 == 2)	\
-@@ -931,8 +935,10 @@ typedef struct
- 
- #define RETURN_ADDR_RTX aarch64_return_addr
- 
--/* BTI c + 3 insns + 2 pointer-sized entries.  */
--#define TRAMPOLINE_SIZE	(TARGET_ILP32 ? 24 : 32)
-+/* BTI c + 3 insns
-+   + sls barrier of DSB + ISB.
-+   + 2 pointer-sized entries.  */
-+#define TRAMPOLINE_SIZE	(24 + (TARGET_ILP32 ? 8 : 16))
- 
- /* Trampolines contain dwords, so must be dword aligned.  */
- #define TRAMPOLINE_ALIGNMENT 64
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index cc5a887d4..494aee964 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -331,10 +331,25 @@
- ;; Attribute that specifies whether the alternative uses MOVPRFX.
- (define_attr "movprfx" "no,yes" (const_string "no"))
- 
-+;; Attribute to specify that an alternative has the length of a single
-+;; instruction plus a speculation barrier.
-+(define_attr "sls_length" "none,retbr,casesi" (const_string "none"))
-+
- (define_attr "length" ""
-   (cond [(eq_attr "movprfx" "yes")
-            (const_int 8)
--        ] (const_int 4)))
-+
-+	 (eq_attr "sls_length" "retbr")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 4)
-+		  (match_test "TARGET_SB") (const_int 8)]
-+		 (const_int 12))
-+
-+	 (eq_attr "sls_length" "casesi")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 16)
-+		  (match_test "TARGET_SB") (const_int 20)]
-+		 (const_int 24))
-+	]
-+	  (const_int 4)))
- 
- ;; Strictly for compatibility with AArch32 in pipeline models, since AArch64 has
- ;; no predicated insns.
-@@ -370,8 +385,12 @@
- (define_insn "indirect_jump"
-   [(set (pc) (match_operand:DI 0 "register_operand" "r"))]
-   ""
--  "br\\t%0"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("br\\t%0", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "jump"
-@@ -657,7 +676,7 @@
-   "*
-   return aarch64_output_casesi (operands);
-   "
--  [(set_attr "length" "16")
-+  [(set_attr "sls_length" "casesi")
-    (set_attr "type" "branch")]
- )
- 
-@@ -736,14 +755,18 @@
-   [(return)]
-   ""
-   {
-+    const char *ret = NULL;
-     if (aarch64_return_address_signing_enabled ()
- 	&& TARGET_ARMV8_3
- 	&& !crtl->calls_eh_return)
--      return "retaa";
--
--    return "ret";
-+      ret = "retaa";
-+    else
-+      ret = "ret";
-+    output_asm_insn (ret, operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-   }
--  [(set_attr "type" "branch")]
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_expand "return"
-@@ -755,8 +778,12 @@
- (define_insn "simple_return"
-   [(simple_return)]
-   "aarch64_use_simple_return_insn_p ()"
--  "ret"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("ret", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "*cb<optab><mode>1"
-@@ -947,10 +974,16 @@
- 	 (match_operand 1 "" ""))
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%0
--   b\\t%c0"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%0", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c0";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- (define_insn "*sibcall_value_insn"
-@@ -960,10 +993,16 @@
- 	      (match_operand 2 "" "")))
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%1
--   b\\t%c1"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%1", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c1";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- ;; Call subroutine returning any type.
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-new file mode 100644
-index 000000000..7656123ee
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-@@ -0,0 +1,15 @@
-+/* Avoid ILP32 since pacret is only available for LP64 */
-+/* { dg-do compile { target { ! ilp32 } } } */
-+/* { dg-additional-options "-mharden-sls=retbr -mbranch-protection=pac-ret -march=armv8.3-a" } */
-+
-+/* Testing the do_return pattern for retaa.  */
-+long retbr_subcall(void);
-+long retbr_do_return_retaa(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb)} } } */
-+/* { dg-final { scan-assembler-not {ret\t} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-new file mode 100644
-index 000000000..573b30cdc
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-@@ -0,0 +1,119 @@
-+/* We ensure that -Wpedantic is off since it complains about the trampolines
-+   we explicitly want to test.  */
-+/* { dg-additional-options "-mharden-sls=retbr -Wno-pedantic " } */
-+/*
-+   Ensure that the SLS hardening of RET and BR leaves no unprotected RET/BR
-+   instructions.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+int
-+retbr_sibcall_value_insn (struct sls_testclass x)
-+{
-+  return x.x(x.left, x.right);
-+}
-+
-+void
-+retbr_sibcall_insn (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+}
-+
-+/* Aim to test two different returns.
-+   One that introduces a tail call in the middle of the function, and one that
-+   has a normal return.  */
-+int
-+retbr_multiple_returns (struct sls_testclass x)
-+{
-+  int temp;
-+  if (x.left % 10)
-+    return x.x(x.left, 100);
-+  else if (x.right % 20)
-+    {
-+      return x.x(x.left * x.right, 100);
-+    }
-+  temp = x.left % x.right;
-+  temp *= 100;
-+  temp /= 2;
-+  return temp % 3;
-+}
-+
-+void
-+retbr_multiple_returns_void (struct sls_testclass x)
-+{
-+  if (x.left % 10)
-+    {
-+      x.y(x.left, 100);
-+    }
-+  else if (x.right % 20)
-+    {
-+      x.y(x.left * x.right, 100);
-+    }
-+  return;
-+}
-+
-+/* Testing the casesi jump via register.  */
-+__attribute__ ((optimize ("Os")))
-+int
-+retbr_casesi_dispatch (struct sls_testclass x)
-+{
-+  switch (x.left)
-+    {
-+    case -5:
-+      return -2;
-+    case -3:
-+      return -1;
-+    case 0:
-+      return 0;
-+    case 3:
-+      return 1;
-+    case 5:
-+      break;
-+    default:
-+      __builtin_unreachable ();
-+    }
-+  return x.right;
-+}
-+
-+/* Testing the BR in trampolines is mitigated against.  */
-+void f1 (void *);
-+void f3 (void *, void (*)(void *));
-+void f2 (void *);
-+
-+int
-+retbr_trampolines (void *a, int b)
-+{
-+  if (!b)
-+    {
-+      f1 (a);
-+      return 1;
-+    }
-+  if (b)
-+    {
-+      void retbr_tramp_internal (void *c)
-+      {
-+	if (c == a)
-+	  f2 (c);
-+      }
-+      f3 (a, retbr_tramp_internal);
-+    }
-+  return 0;
-+}
-+
-+/* Testing the indirect_jump pattern.  */
-+void
-+retbr_indirect_jump (int *buf)
-+{
-+  __builtin_longjmp(buf, 1);
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb|sb)} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-new file mode 100644
-index 000000000..812250379
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-@@ -0,0 +1,73 @@
-+#  Regression driver for SLS mitigation on AArch64.
-+#  Copyright (C) 2020 Free Software Foundation, Inc.
-+#  Contributed by ARM Ltd.
-+#
-+#  This file is part of GCC.
-+#
-+#  GCC is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU General Public License as published by
-+#  the Free Software Foundation; either version 3, or (at your option)
-+#  any later version.
-+#
-+#  GCC is distributed in the hope that it will be useful, but
-+#  WITHOUT ANY WARRANTY; without even the implied warranty of
-+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+#  General Public License for more details.
-+#
-+#  You should have received a copy of the GNU General Public License
-+#  along with GCC; see the file COPYING3.  If not see
-+#  <http://www.gnu.org/licenses/>.  */
-+
-+# Exit immediately if this isn't an AArch64 target.
-+if {![istarget aarch64*-*-*] } then {
-+  return
-+}
-+
-+# Load support procs.
-+load_lib gcc-dg.exp
-+load_lib torture-options.exp
-+
-+# If a testcase doesn't have special options, use these.
-+global DEFAULT_CFLAGS
-+if ![info exists DEFAULT_CFLAGS] then {
-+    set DEFAULT_CFLAGS " "
-+}
-+
-+# Initialize `dg'.
-+dg-init
-+torture-init
-+
-+# Use different architectures as well as the normal optimisation options.
-+# (i.e. use both SB and DSB+ISB barriers).
-+
-+set save-dg-do-what-default ${dg-do-what-default}
-+# Main loop.
-+# Run with torture tests (i.e. a bunch of different optimisation levels) just
-+# to increase test coverage.
-+set dg-do-what-default assemble
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+
-+# Run the same tests but this time with SB extension.
-+# Since not all supported assemblers will support that extension we decide
-+# whether to assemble or just compile based on whether the extension is
-+# supported for the available assembler.
-+
-+set templist {}
-+foreach x $DG_TORTURE_OPTIONS {
-+  lappend templist "$x -march=armv8.3-a+sb "
-+  lappend templist "$x -march=armv8-a+sb "
-+}
-+set-torture-options $templist
-+if { [check_effective_target_aarch64_asm_sb_ok] } {
-+    set dg-do-what-default assemble
-+} else {
-+    set dg-do-what-default compile
-+}
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+set dg-do-what-default ${save-dg-do-what-default}
-+
-+# All done.
-+torture-finish
-+dg-finish
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index ea9a50ccb..79482f9b6 100644
---- a/gcc/testsuite/lib/target-supports.exp
-+++ b/gcc/testsuite/lib/target-supports.exp
-@@ -8579,7 +8579,8 @@ proc check_effective_target_aarch64_tiny { } {
- # Create functions to check that the AArch64 assembler supports the
- # various architecture extensions via the .arch_extension pseudo-op.
- 
--foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve"} {
-+foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve"
-+			  "sb"} {
-     eval [string map [list FUNC $aarch64_ext] {
- 	proc check_effective_target_aarch64_asm_FUNC_ok { } {
- 	  if { [istarget aarch64*-*-*] } {
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
deleted file mode 100644
index 6dffef0a34..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
+++ /dev/null
@@ -1,659 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 2155170525f93093b90a1a065e7ed71a925566e9 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 3/3] aarch64: Mitigate SLS for BLR instruction
-
-This patch introduces the mitigation for Straight Line Speculation past
-the BLR instruction.
-
-This mitigation replaces BLR instructions with a BL to a stub which uses
-a BR to jump to the original value.  These function stubs are then
-appended with a speculation barrier to ensure no straight line
-speculation happens after these jumps.
-
-When optimising for speed we use a set of stubs for each function since
-this should help the branch predictor make more accurate predictions
-about where a stub should branch.
-
-When optimising for size we use one set of stubs for all functions.
-This set of stubs can have human readable names, and we are using
-`__call_indirect_x<N>` for register x<N>.
-
-When BTI branch protection is enabled the BLR instruction can jump to a
-`BTI c` instruction using any register, while the BR instruction can
-only jump to a `BTI c` instruction using the x16 or x17 registers.
-Hence, in order to ensure this transformation is safe we mov the value
-of the original register into x16 and use x16 for the BR.
-
-As an example when optimising for size:
-a
-    BLR x0
-instruction would get transformed to something like
-    BL __call_indirect_x0
-where __call_indirect_x0 labels a thunk that contains
-__call_indirect_x0:
-    MOV X16, X0
-    BR X16
-    <speculation barrier>
-
-The first version of this patch used local symbols specific to a
-compilation unit to try and avoid relocations.
-This was mistaken since functions coming from the same compilation unit
-can still be in different sections, and the assembler will insert
-relocations at jumps between sections.
-
-On any relocation the linker is permitted to emit a veneer to handle
-jumps between symbols that are very far apart.  The registers x16 and
-x17 may be clobbered by these veneers.
-Hence the function stubs cannot rely on the values of x16 and x17 being
-the same as just before the function stub is called.
-
-Similar can be said for the hot/cold partitioning of single functions,
-so function-local stubs have the same restriction.
-
-This updated version of the patch never emits function stubs for x16 and
-x17, and instead forces other registers to be used.
-
-Given the above, there is now no benefit to local symbols (since they
-are not enough to avoid dealing with linker intricacies).  This patch
-now uses global symbols with hidden visibility each stored in their own
-COMDAT section.  This means stubs can be shared between compilation
-units while still avoiding the PLT indirection.
-
-This patch also removes the `__call_indirect_x30` stub (and
-function-local equivalent) which would simply jump back to the original
-location.
-
-The function-local stubs are emitted to the assembly output file in one
-chunk, which means we need not add the speculation barrier directly
-after each one.
-This is because we know for certain that the instructions directly after
-the BR in all but the last function stub will be from another one of
-these stubs and hence will not contain a speculation gadget.
-Instead we add a speculation barrier at the end of the sequence of
-stubs.
-
-The global stubs are emitted in COMDAT/.linkonce sections by
-themselves so that the linker can remove duplicates from multiple object
-files.  This means they are not emitted in one chunk, and each one must
-include the speculation barrier.
-
-Another difference is that since the global stubs are shared across
-compilation units we do not know that all functions will be targeting an
-architecture supporting the SB instruction.
-Rather than provide multiple stubs for each architecture, we provide a
-stub that will work for all architectures -- using the DSB+ISB barrier.
-
-This mitigation does not apply for BLR instructions in the following
-places:
-- Some accesses to thread-local variables use a code sequence with a BLR
-  instruction.  This code sequence is part of the binary interface between
-  compiler and linker. If this BLR instruction needs to be mitigated, it'd
-  probably be best to do so in the linker. It seems that the code sequence
-  for thread-local variable access is unlikely to lead to a Spectre Revalation
-  Gadget.
-- PLT stubs are produced by the linker and each contain a BLR instruction.
-  It seems that at most only after the last PLT stub a Spectre Revalation
-  Gadget might appear.
-
-Testing:
-  Bootstrap and regtest on AArch64
-    (with BOOT_CFLAGS="-mharden-sls=retbr,blr")
-  Used a temporary hack(1) in gcc-dg.exp to use these options on every
-  test in the testsuite, a slight modification to emit the speculation
-  barrier after every function stub, and a script to check that the
-  output never emitted a BLR, or unmitigated BR or RET instruction.
-  Similar on an aarch64-none-elf cross-compiler.
-
-1) Temporary hack emitted a speculation barrier at the end of every stub
-function, and used a script to ensure that:
-  a) Every RET or BR is immediately followed by a speculation barrier.
-  b) No BLR instruction is emitted by compiler.
-
-(cherry picked from 96b7f495f9269d5448822e4fc28882edb35a58d7)
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_indirect_call_asm):
-	New declaration.
-	* config/aarch64/aarch64.c (aarch64_regno_regclass): Handle new
-	stub registers class.
-	(aarch64_class_max_nregs): Likewise.
-	(aarch64_register_move_cost): Likewise.
-	(aarch64_sls_shared_thunks): Global array to store stub labels.
-	(aarch64_sls_emit_function_stub): New.
-	(aarch64_create_blr_label): New.
-	(aarch64_sls_emit_blr_function_thunks): New.
-	(aarch64_sls_emit_shared_blr_thunks): New.
-	(aarch64_asm_file_end): New.
-	(aarch64_indirect_call_asm): New.
-	(TARGET_ASM_FILE_END): Use aarch64_asm_file_end.
-	(TARGET_ASM_FUNCTION_EPILOGUE): Use
-	aarch64_sls_emit_blr_function_thunks.
-	* config/aarch64/aarch64.h (STB_REGNUM_P): New.
-	(enum reg_class): Add STUB_REGS class.
-	(machine_function): Introduce `call_via` array for
-	function-local stub labels.
-	* config/aarch64/aarch64.md (*call_insn, *call_value_insn): Use
-	aarch64_indirect_call_asm to emit code when hardening BLR
-	instructions.
-	* config/aarch64/constraints.md (Ucr): New constraint
-	representing registers for indirect calls.  Is GENERAL_REGS
-	usually, and STUB_REGS when hardening BLR instruction against
-	SLS.
-	* config/aarch64/predicates.md (aarch64_general_reg): STUB_REGS class
-	is also a general register.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr.c: New test.
----
- gcc/config/aarch64/aarch64-protos.h           |   1 +
- gcc/config/aarch64/aarch64.c                  | 225 +++++++++++++++++-
- gcc/config/aarch64/aarch64.h                  |  15 ++
- gcc/config/aarch64/aarch64.md                 |  11 +-
- gcc/config/aarch64/constraints.md             |   9 +
- gcc/config/aarch64/predicates.md              |   3 +-
- .../aarch64/sls-mitigation/sls-miti-blr-bti.c |  40 ++++
- .../aarch64/sls-mitigation/sls-miti-blr.c     |  33 +++
- 8 files changed, 328 insertions(+), 9 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index 885eae893..2676e43ae 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -645,6 +645,7 @@ poly_uint64 aarch64_regmode_natural_size (machine_mode);
- bool aarch64_high_bits_all_ones_p (HOST_WIDE_INT);
- 
- const char *aarch64_sls_barrier (int);
-+const char *aarch64_indirect_call_asm (rtx);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index dff61105c..bc6c02c3a 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -8190,6 +8190,9 @@ aarch64_label_mentioned_p (rtx x)
- enum reg_class
- aarch64_regno_regclass (unsigned regno)
- {
-+  if (STUB_REGNUM_P (regno))
-+    return STUB_REGS;
-+
-   if (GP_REGNUM_P (regno))
-     return GENERAL_REGS;
- 
-@@ -8499,6 +8502,7 @@ aarch64_class_max_nregs (reg_class_t regclass, machine_mode mode)
-   unsigned int nregs;
-   switch (regclass)
-     {
-+    case STUB_REGS:
-     case TAILCALL_ADDR_REGS:
-     case POINTER_REGS:
-     case GENERAL_REGS:
-@@ -10693,10 +10697,12 @@ aarch64_register_move_cost (machine_mode mode,
-     = aarch64_tune_params.regmove_cost;
- 
-   /* Caller save and pointer regs are equivalent to GENERAL_REGS.  */
--  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS)
-+  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS
-+      || to == STUB_REGS)
-     to = GENERAL_REGS;
- 
--  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS)
-+  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS
-+      || from == STUB_REGS)
-     from = GENERAL_REGS;
- 
-   /* Moving between GPR and stack cost is the same as GP2GP.  */
-@@ -19009,6 +19015,215 @@ aarch64_sls_barrier (int mitigation_required)
-     : "";
- }
- 
-+static GTY (()) tree aarch64_sls_shared_thunks[30];
-+static GTY (()) bool aarch64_sls_shared_thunks_needed = false;
-+const char *indirect_symbol_names[30] = {
-+    "__call_indirect_x0",
-+    "__call_indirect_x1",
-+    "__call_indirect_x2",
-+    "__call_indirect_x3",
-+    "__call_indirect_x4",
-+    "__call_indirect_x5",
-+    "__call_indirect_x6",
-+    "__call_indirect_x7",
-+    "__call_indirect_x8",
-+    "__call_indirect_x9",
-+    "__call_indirect_x10",
-+    "__call_indirect_x11",
-+    "__call_indirect_x12",
-+    "__call_indirect_x13",
-+    "__call_indirect_x14",
-+    "__call_indirect_x15",
-+    "", /* "__call_indirect_x16",  */
-+    "", /* "__call_indirect_x17",  */
-+    "__call_indirect_x18",
-+    "__call_indirect_x19",
-+    "__call_indirect_x20",
-+    "__call_indirect_x21",
-+    "__call_indirect_x22",
-+    "__call_indirect_x23",
-+    "__call_indirect_x24",
-+    "__call_indirect_x25",
-+    "__call_indirect_x26",
-+    "__call_indirect_x27",
-+    "__call_indirect_x28",
-+    "__call_indirect_x29",
-+};
-+
-+/* Function to create a BLR thunk.  This thunk is used to mitigate straight
-+   line speculation.  Instead of a simple BLR that can be speculated past,
-+   we emit a BL to this thunk, and this thunk contains a BR to the relevant
-+   register.  These thunks have the relevant speculation barries put after
-+   their indirect branch so that speculation is blocked.
-+
-+   We use such a thunk so the speculation barriers are kept off the
-+   architecturally executed path in order to reduce the performance overhead.
-+
-+   When optimizing for size we use stubs shared by the linked object.
-+   When optimizing for performance we emit stubs for each function in the hope
-+   that the branch predictor can better train on jumps specific for a given
-+   function.  */
-+rtx
-+aarch64_sls_create_blr_label (int regnum)
-+{
-+  gcc_assert (STUB_REGNUM_P (regnum));
-+  if (optimize_function_for_size_p (cfun))
-+    {
-+      /* For the thunks shared between different functions in this compilation
-+	 unit we use a named symbol -- this is just for users to more easily
-+	 understand the generated assembly.  */
-+      aarch64_sls_shared_thunks_needed = true;
-+      const char *thunk_name = indirect_symbol_names[regnum];
-+      if (aarch64_sls_shared_thunks[regnum] == NULL)
-+	{
-+	  /* Build a decl representing this function stub and record it for
-+	     later.  We build a decl here so we can use the GCC machinery for
-+	     handling sections automatically (through `get_named_section` and
-+	     `make_decl_one_only`).  That saves us a lot of trouble handling
-+	     the specifics of different output file formats.  */
-+	  tree decl = build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
-+				  get_identifier (thunk_name),
-+				  build_function_type_list (void_type_node,
-+							    NULL_TREE));
-+	  DECL_RESULT (decl) = build_decl (BUILTINS_LOCATION, RESULT_DECL,
-+					   NULL_TREE, void_type_node);
-+	  TREE_PUBLIC (decl) = 1;
-+	  TREE_STATIC (decl) = 1;
-+	  DECL_IGNORED_P (decl) = 1;
-+	  DECL_ARTIFICIAL (decl) = 1;
-+	  make_decl_one_only (decl, DECL_ASSEMBLER_NAME (decl));
-+	  resolve_unique_section (decl, 0, false);
-+	  aarch64_sls_shared_thunks[regnum] = decl;
-+	}
-+
-+      return gen_rtx_SYMBOL_REF (Pmode, thunk_name);
-+    }
-+
-+  if (cfun->machine->call_via[regnum] == NULL)
-+    cfun->machine->call_via[regnum]
-+      = gen_rtx_LABEL_REF (Pmode, gen_label_rtx ());
-+  return cfun->machine->call_via[regnum];
-+}
-+
-+/* Helper function for aarch64_sls_emit_blr_function_thunks and
-+   aarch64_sls_emit_shared_blr_thunks below.  */
-+static void
-+aarch64_sls_emit_function_stub (FILE *out_file, int regnum)
-+{
-+  /* Save in x16 and branch to that function so this transformation does
-+     not prevent jumping to `BTI c` instructions.  */
-+  asm_fprintf (out_file, "\tmov\tx16, x%d\n", regnum);
-+  asm_fprintf (out_file, "\tbr\tx16\n");
-+}
-+
-+/* Emit all BLR stubs for this particular function.
-+   Here we emit all the BLR stubs needed for the current function.  Since we
-+   emit these stubs in a consecutive block we know there will be no speculation
-+   gadgets between each stub, and hence we only emit a speculation barrier at
-+   the end of the stub sequences.
-+
-+   This is called in the TARGET_ASM_FUNCTION_EPILOGUE hook.  */
-+void
-+aarch64_sls_emit_blr_function_thunks (FILE *out_file)
-+{
-+  if (! aarch64_harden_sls_blr_p ())
-+    return;
-+
-+  bool any_functions_emitted = false;
-+  /* We must save and restore the current function section since this assembly
-+     is emitted at the end of the function.  This means it can be emitted *just
-+     after* the cold section of a function.  That cold part would be emitted in
-+     a different section.  That switch would trigger a `.cfi_endproc` directive
-+     to be emitted in the original section and a `.cfi_startproc` directive to
-+     be emitted in the new section.  Switching to the original section without
-+     restoring would mean that the `.cfi_endproc` emitted as a function ends
-+     would happen in a different section -- leaving an unmatched
-+     `.cfi_startproc` in the cold text section and an unmatched `.cfi_endproc`
-+     in the standard text section.  */
-+  section *save_text_section = in_section;
-+  switch_to_section (function_section (current_function_decl));
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      rtx specu_label = cfun->machine->call_via[regnum];
-+      if (specu_label == NULL)
-+	continue;
-+
-+      targetm.asm_out.print_operand (out_file, specu_label, 0);
-+      asm_fprintf (out_file, ":\n");
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      any_functions_emitted = true;
-+    }
-+  if (any_functions_emitted)
-+    /* Can use the SB if needs be here, since this stub will only be used
-+      by the current function, and hence for the current target.  */
-+    asm_fprintf (out_file, "\t%s\n", aarch64_sls_barrier (true));
-+  switch_to_section (save_text_section);
-+}
-+
-+/* Emit shared BLR stubs for the current compilation unit.
-+   Over the course of compiling this unit we may have converted some BLR
-+   instructions to a BL to a shared stub function.  This is where we emit those
-+   stub functions.
-+   This function is for the stubs shared between different functions in this
-+   compilation unit.  We share when optimizing for size instead of speed.
-+
-+   This function is called through the TARGET_ASM_FILE_END hook.  */
-+void
-+aarch64_sls_emit_shared_blr_thunks (FILE *out_file)
-+{
-+  if (! aarch64_sls_shared_thunks_needed)
-+    return;
-+
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      tree decl = aarch64_sls_shared_thunks[regnum];
-+      if (!decl)
-+	continue;
-+
-+      const char *name = indirect_symbol_names[regnum];
-+      switch_to_section (get_named_section (decl, NULL, 0));
-+      ASM_OUTPUT_ALIGN (out_file, 2);
-+      targetm.asm_out.globalize_label (out_file, name);
-+      /* Only emits if the compiler is configured for an assembler that can
-+	 handle visibility directives.  */
-+      targetm.asm_out.assemble_visibility (decl, VISIBILITY_HIDDEN);
-+      ASM_OUTPUT_TYPE_DIRECTIVE (out_file, name, "function");
-+      ASM_OUTPUT_LABEL (out_file, name);
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      /* Use the most conservative target to ensure it can always be used by any
-+	 function in the translation unit.  */
-+      asm_fprintf (out_file, "\tdsb\tsy\n\tisb\n");
-+      ASM_DECLARE_FUNCTION_SIZE (out_file, name, decl);
-+    }
-+}
-+
-+/* Implement TARGET_ASM_FILE_END.  */
-+void
-+aarch64_asm_file_end ()
-+{
-+  aarch64_sls_emit_shared_blr_thunks (asm_out_file);
-+  /* Since this function will be called for the ASM_FILE_END hook, we ensure
-+     that what would be called otherwise (e.g. `file_end_indicate_exec_stack`
-+     for FreeBSD) still gets called.  */
-+#ifdef TARGET_ASM_FILE_END
-+  TARGET_ASM_FILE_END ();
-+#endif
-+}
-+
-+const char *
-+aarch64_indirect_call_asm (rtx addr)
-+{
-+  gcc_assert (REG_P (addr));
-+  if (aarch64_harden_sls_blr_p ())
-+    {
-+      rtx stub_label = aarch64_sls_create_blr_label (REGNO (addr));
-+      output_asm_insn ("bl\t%0", &stub_label);
-+    }
-+  else
-+   output_asm_insn ("blr\t%0", &addr);
-+  return "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-@@ -19529,6 +19744,12 @@ aarch64_libgcc_floating_mode_supported_p
- #define TARGET_RUN_TARGET_SELFTESTS selftest::aarch64_run_selftests
- #endif /* #if CHECKING_P */
- 
-+#undef TARGET_ASM_FILE_END
-+#define TARGET_ASM_FILE_END aarch64_asm_file_end
-+
-+#undef TARGET_ASM_FUNCTION_EPILOGUE
-+#define TARGET_ASM_FUNCTION_EPILOGUE aarch64_sls_emit_blr_function_thunks
-+
- struct gcc_target targetm = TARGET_INITIALIZER;
- 
- #include "gt-aarch64.h"
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 72ddc6fd9..60682a100 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -540,6 +540,16 @@ extern unsigned aarch64_architecture_version;
- #define GP_REGNUM_P(REGNO)						\
-   (((unsigned) (REGNO - R0_REGNUM)) <= (R30_REGNUM - R0_REGNUM))
- 
-+/* Registers known to be preserved over a BL instruction.  This consists of the
-+   GENERAL_REGS without x16, x17, and x30.  The x30 register is changed by the
-+   BL instruction itself, while the x16 and x17 registers may be used by
-+   veneers which can be inserted by the linker.  */
-+#define STUB_REGNUM_P(REGNO) \
-+  (GP_REGNUM_P (REGNO) \
-+   && (REGNO) != R16_REGNUM \
-+   && (REGNO) != R17_REGNUM \
-+   && (REGNO) != R30_REGNUM) \
-+
- #define FP_REGNUM_P(REGNO)			\
-   (((unsigned) (REGNO - V0_REGNUM)) <= (V31_REGNUM - V0_REGNUM))
- 
-@@ -561,6 +571,7 @@ enum reg_class
- {
-   NO_REGS,
-   TAILCALL_ADDR_REGS,
-+  STUB_REGS,
-   GENERAL_REGS,
-   STACK_REG,
-   POINTER_REGS,
-@@ -580,6 +591,7 @@ enum reg_class
- {						\
-   "NO_REGS",					\
-   "TAILCALL_ADDR_REGS",				\
-+  "STUB_REGS",					\
-   "GENERAL_REGS",				\
-   "STACK_REG",					\
-   "POINTER_REGS",				\
-@@ -596,6 +608,7 @@ enum reg_class
- {									\
-   { 0x00000000, 0x00000000, 0x00000000 },	/* NO_REGS */		\
-   { 0x00030000, 0x00000000, 0x00000000 },	/* TAILCALL_ADDR_REGS */\
-+  { 0x3ffcffff, 0x00000000, 0x00000000 },	/* STUB_REGS */		\
-   { 0x7fffffff, 0x00000000, 0x00000003 },	/* GENERAL_REGS */	\
-   { 0x80000000, 0x00000000, 0x00000000 },	/* STACK_REG */		\
-   { 0xffffffff, 0x00000000, 0x00000003 },	/* POINTER_REGS */	\
-@@ -735,6 +748,8 @@ typedef struct GTY (()) machine_function
-   struct aarch64_frame frame;
-   /* One entry for each hard register.  */
-   bool reg_is_wrapped_separately[LAST_SAVED_REGNUM];
-+  /* One entry for each general purpose register.  */
-+  rtx call_via[SP_REGNUM];
-   bool label_is_assembled;
- } machine_function;
- #endif
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index 494aee964..ed8cf8ece 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -908,15 +908,14 @@
- )
- 
- (define_insn "*call_insn"
--  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "r, Usf"))
-+  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "Ucr, Usf"))
- 	 (match_operand 1 "" ""))
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%0
-+  * return aarch64_indirect_call_asm (operands[0]);
-   bl\\t%c0"
--  [(set_attr "type" "call, call")]
--)
-+  [(set_attr "type" "call, call")])
- 
- (define_expand "call_value"
-   [(parallel [(set (match_operand 0 "" "")
-@@ -934,12 +933,12 @@
- 
- (define_insn "*call_value_insn"
-   [(set (match_operand 0 "" "")
--	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "r, Usf"))
-+	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "Ucr, Usf"))
- 		      (match_operand 2 "" "")))
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%1
-+  * return aarch64_indirect_call_asm (operands[1]);
-   bl\\t%c1"
-   [(set_attr "type" "call, call")]
- )
-diff --git a/gcc/config/aarch64/constraints.md b/gcc/config/aarch64/constraints.md
-index 21f9549e6..7756dbe83 100644
---- a/gcc/config/aarch64/constraints.md
-+++ b/gcc/config/aarch64/constraints.md
-@@ -24,6 +24,15 @@
- (define_register_constraint "Ucs" "TAILCALL_ADDR_REGS"
-   "@internal Registers suitable for an indirect tail call")
- 
-+(define_register_constraint "Ucr"
-+    "aarch64_harden_sls_blr_p () ? STUB_REGS : GENERAL_REGS"
-+  "@internal Registers to be used for an indirect call.
-+   This is usually the general registers, but when we are hardening against
-+   Straight Line Speculation we disallow x16, x17, and x30 so we can use
-+   indirection stubs.  These indirection stubs cannot use the above registers
-+   since they will be reached by a BL that may have to go through a linker
-+   veneer.")
-+
- (define_register_constraint "w" "FP_REGS"
-   "Floating point and SIMD vector registers.")
- 
-diff --git a/gcc/config/aarch64/predicates.md b/gcc/config/aarch64/predicates.md
-index 8e1b78421..4250aecb3 100644
---- a/gcc/config/aarch64/predicates.md
-+++ b/gcc/config/aarch64/predicates.md
-@@ -32,7 +32,8 @@
- 
- (define_predicate "aarch64_general_reg"
-   (and (match_operand 0 "register_operand")
--       (match_test "REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
-+       (match_test "REGNO_REG_CLASS (REGNO (op)) == STUB_REGS
-+		    || REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
- 
- ;; Return true if OP a (const_int 0) operand.
- (define_predicate "const0_operand"
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-new file mode 100644
-index 000000000..b1fb754c7
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-@@ -0,0 +1,40 @@
-+/* { dg-do compile } */
-+/* { dg-additional-options "-mharden-sls=blr -mbranch-protection=bti" } */
-+/*
-+   Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   Here we also check that there are no BR instructions with anything except an
-+   x16 or x17 register.  This is because a `BTI c` instruction can be branched
-+   to using a BLR instruction using any register, but can only be branched to
-+   with a BR using an x16 or x17 register.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler-not {\tbr\tx(?!16|17)} } } */
-+/* { dg-final { scan-assembler {\tbr\tx(16|17)} } } */
-+
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-new file mode 100644
-index 000000000..88baffffe
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-@@ -0,0 +1,33 @@
-+/* { dg-additional-options "-mharden-sls=blr -save-temps" } */
-+/* Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   We only test that all BLR instructions have been removed, not that the
-+   resulting code makes sense.  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler {\tbr\tx[0-9][0-9]?} } } */
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
deleted file mode 100644
index c8960c6098..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From b19d8aac15649f31a7588b2634411a1922906ea8 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Wed, 3 Jun 2020 12:30:57 -0600
-Subject: [PATCH] Fix missing dependencies for selftests which occasionally
- causes failed builds.
-
-gcc/
-
-	* Makefile.in (SELFTEST_DEPS): Move before including language makefile
-	fragments.
-	
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b19d8aac15649f31a7588b2634411a1922906ea8]
-Signed-off-by:Steve Sakoman <steve@sakoman.com>
-
----
- gcc/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index aab1dbba57b..be11311b60d 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1735,6 +1735,10 @@ $(FULL_DRIVER_NAME): ./xgcc$(exeext)
- 	$(LN_S) $< $@
- 
- #
-+# SELFTEST_DEPS need to be set before including language makefile fragments.
-+# Otherwise $(SELFTEST_DEPS) is empty when used from <LANG>/Make-lang.in.
-+SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
-+
- # Language makefile fragments.
- 
- # The following targets define the interface between us and the languages.
-@@ -2010,8 +2014,6 @@ DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
- SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
- 	-fself-test=$(srcdir)/testsuite/selftests
- 
--SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
--
- # Run the selftests during the build once we have a driver and the frontend,
- # so that self-test failures are caught as early as possible.
- # Use "s-selftest-FE" to ensure that we only run the selftests if the
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.5.inc
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-9.3.inc
rename to meta/recipes-devtools/gcc/gcc-9.5.inc
index c171f673e9..6a0a892b10 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "9.3.0"
+PV = "9.5.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "9.3.0"
+BINV = "9.5.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.3:${FILE_DIRNAME}/gcc-9.3/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-9.5:${FILE_DIRNAME}/gcc-9.5/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -69,14 +69,9 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
-           file://0040-fix-missing-dependencies-for-selftests.patch \
-           file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
-           file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
-           file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
+SRC_URI[sha256sum] = "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f"
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0002-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0002-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0004-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0005-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0005-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0006-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0006-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-9.5/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0008-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0008-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0009-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0010-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0010-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-9.5/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0012-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0013-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0013-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc-9.5/0014-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0014-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-9.5/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-9.5/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-9.5/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0018-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0019-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-9.5/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-9.5/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-9.5/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0023-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0025-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-9.5/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-9.5/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch b/meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0030-ldbl128-config.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-9.5/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-9.5/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0033-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-9.5/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0035-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0035-Fix-for-testsuite-failure.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-spe-commandline-options.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0036-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0036-Re-introduce-spe-commandline-options.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch b/meta/recipes-devtools/gcc/gcc-9.5/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc-9.5/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch b/meta/recipes-devtools/gcc/gcc-9.5/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
rename to meta/recipes-devtools/gcc/gcc-9.5/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_9.3.bb b/meta/recipes-devtools/gcc/gcc-cross_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_9.3.bb b/meta/recipes-devtools/gcc/gcc-source_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_9.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_9.5.bb
diff --git a/meta/recipes-devtools/gcc/gcc_9.3.bb b/meta/recipes-devtools/gcc/gcc_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_9.3.bb
rename to meta/recipes-devtools/gcc/gcc_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_9.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_9.3.bb b/meta/recipes-devtools/gcc/libgcc_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_9.3.bb
rename to meta/recipes-devtools/gcc/libgcc_9.5.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_9.3.bb b/meta/recipes-devtools/gcc/libgfortran_9.5.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_9.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_9.5.bb
-- 
2.25.1


