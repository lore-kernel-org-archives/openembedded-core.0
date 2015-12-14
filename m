Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 66F52608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:19 +0000 (UTC)
Received: by qkck189 with SMTP id k189so85833970qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3USlXmZlmwYQkTjMx1kmE00/eoJ5oGzEX9cn5WHMrlI=;
	b=Jq74ujPARrkkTLIzzyb6pFmiD8gDxDiLwdqlypkVHEu3I8IwTDRA7G2KBnNseFQCMo
	F8FAePswvv7baOcbddo0sBT6MIBp935Gqco1fYBYT9e/IiegivVr854QVjOTcOxnZcMo
	b10yUsNBlV+FXKdR9HfSz1JjjVzErGRbHQI/Tx5oQ/5RYq/qW4AcYwKwZEsHTusSJgOJ
	eIp0XnACUUNRrEarRy7m85PNlcBk02GPcIqwgf2wMTXUntQcE7ieNLiMDse1at5vf87d
	xGaJ/Ye+gd84rih38DAskVkalb21zyMKVMmgXPFoKR3HDdfCNEBRRUHuNlmyxIUxQmOD
	Y8GA==
X-Received: by 10.55.72.140 with SMTP id v134mr6163238qka.24.1450074199764;
	Sun, 13 Dec 2015 22:23:19 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:08 +0000
Message-Id: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] gcc5: Upgrade gcc-5.2 -> gcc-5.3
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:19 -0000

Minor bugfix upgrade to gcc 5.3 for detailed list of fixes in 5.3 see

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=132738&resolution=FIXED&target_milestone=5.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-5.2/0037-pr65779.patch                 | 173 ---------------------
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |  39 -----
 .../gcc/{gcc-5.2.inc => gcc-5.3.inc}               |  31 ++--
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch    |   6 +-
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch  |  18 +--
 .../0005-uclibc-locale-no__x.patch                 |   6 +-
 .../0006-uclibc-locale-wchar_fix.patch             |   6 +-
 .../0007-uclibc-locale-update.patch                |   6 +-
 .../0008-missing-execinfo_h.patch                  |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch   |   6 +-
 .../0010-gcc-poison-system-directories.patch       |  26 ++--
 .../0011-gcc-poison-dir-extend.patch               |   6 +-
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   8 +-
 .../0013-64-bit-multilib-hack.patch                |   6 +-
 .../0014-optional-libstdc.patch                    |  12 +-
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  14 +-
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   6 +-
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  14 +-
 .../0018-fortran-cross-compile-hack.patch          |  10 +-
 .../0019-libgcc-sjlj-check.patch                   |  10 +-
 .../0020-cpp-honor-sysroot.patch                   |   6 +-
 .../0021-MIPS64-Default-to-N64-ABI.patch           |  10 +-
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   8 +-
 ...0023-gcc-Fix-argument-list-too-long-error.patch |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch    |  22 +--
 .../gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch    |   6 +-
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 ...tilib-config-files-from-B-instead-of-usin.patch |  14 +-
 ...-libdir-from-.la-which-usually-points-to-.patch |   6 +-
 .../gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch |   6 +-
 ...AltiVec-generation-on-powepc-linux-target.patch |  10 +-
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   6 +-
 ...Ensure-target-gcc-headers-can-be-included.patch |  10 +-
 ...-t-build-with-disable-dependency-tracking.patch |   6 +-
 ...h-host-directory-during-relink-if-inst_pr.patch |   6 +-
 ...-link-the-plugins-with-libgomp-explicitly.patch |   6 +-
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   8 +-
 .../0037-aarch64-Add-support-for-musl-ldso.patch   |  26 ++++
 .../0038-fix-g-sysroot.patch}                      |  32 ++--
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  11 +-
 ...handle-sysroot-support-for-nativesdk-gcc.patch} |  21 ++-
 ...t-sysroot-gcc-version-specific-dirs-with.patch} |  38 +++--
 ...various-_FOR_BUILD-and-related-variables.patch} |  24 ++-
 .../0043-libstdc-Support-musl.patch}               |  22 ++-
 ...-as-a-musl-libc-specifier-and-the-necess.patch} | 149 +++++++++---------
 .../0045-Support-for-arm-linux-musl.patch}         | 146 +++++++++--------
 ...t-rid-of-ever-broken-fixincludes-on-musl.patch} |  22 ++-
 ...s-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} |   0
 ...oss-initial_5.2.bb => gcc-cross-initial_5.3.bb} |   0
 .../gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb}     |   0
 ...-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} |   0
 .../{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb}   |   0
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   4 +-
 .../gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} |   0
 ...gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} |   0
 .../gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb}   |   0
 .../gcc/{gcc_5.2.bb => gcc_5.3.bb}                 |   0
 ...libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} |   0
 .../gcc/{libgcc_5.2.bb => libgcc_5.3.bb}           |   0
 .../gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} |   0
 62 files changed, 488 insertions(+), 578 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2.inc => gcc-5.3.inc} (83%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0005-uclibc-locale-no__x.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0006-uclibc-locale-wchar_fix.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0007-uclibc-locale-update.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0008-missing-execinfo_h.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0010-gcc-poison-system-directories.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0011-gcc-poison-dir-extend.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0013-64-bit-multilib-hack.patch (97%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0014-optional-libstdc.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0016-COLLECT_GCC_OPTIONS.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0018-fortran-cross-compile-hack.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0019-libgcc-sjlj-check.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0020-cpp-honor-sysroot.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0021-MIPS64-Default-to-N64-ABI.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0023-gcc-Fix-argument-list-too-long-error.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0032-Ensure-target-gcc-headers-can-be-included.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (82%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2/0038-fix-g++-sysroot.patch => gcc-5.3/0038-fix-g-sysroot.patch} (64%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0040-nativesdk-gcc-support.patch => gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0041-handle-target-sysroot-multilib.patch => gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (73%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0042-cxxflags-for-build.patch => gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0043-libstdc-musl.patch => gcc-5.3/0043-libstdc-Support-musl.patch} (56%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0044-gcc-musl-support.patch => gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch} (75%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0045-musl-dynamic-linker.patch => gcc-5.3/0045-Support-for-arm-linux-musl.patch} (68%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0046-musl-no-fixincludes.patch => gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch} (45%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_5.2.bb => gcc-cross-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_5.2.bb => gcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_5.2.bb => libgcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch b/meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
deleted file mode 100644
index 1424673..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-List-Id: <gcc-patches.gcc.gnu.org>
-List-Archive: <http://gcc.gnu.org/ml/gcc-patches/>
-List-Post: <mailto:gcc-patches at gcc dot gnu dot org>
-List-Help: <mailto:gcc-patches-help at gcc dot gnu dot org>
-Date: Mon, 20 Apr 2015 12:40:49 +0930
-From: Alan Modra <amodra at gmail dot com>
-To: gcc-patches at gcc dot gnu dot org
-Subject: [Patch] pr65779 - [5/6 Regression] undefined local symbol on powerpc
-
-This patch removes bogus debug info left around by shrink-wrapping,
-which on some powerpc targets with just the right register allocation
-led to assembly errors.
-
-Bootstrapped and regression tested powerpc64-linux and x86_64-linux.
-
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65779
-
-gcc/
-	PR debug/65779
-	* shrink-wrap.c (insn_uses_reg): New function.
-	(move_insn_for_shrink_wrap): Remove debug insns using regs set
-	by the moved insn.
-gcc/testsuite/
-	* gcc.dg/pr65779.c: New.
-	
-Upstream-Status: Pending (from mailing list, not merged yet)
-
-Index: a/gcc/shrink-wrap.c
-===================================================================
---- a/gcc/shrink-wrap.c.orig
-+++ b/gcc/shrink-wrap.c
-@@ -182,6 +182,21 @@ live_edge_for_reg (basic_block bb, int r
-   return live_edge;
- }
- 
-+static bool
-+insn_uses_reg (rtx_insn *insn, unsigned int regno, unsigned int end_regno)
-+{
-+  df_ref use;
-+
-+  FOR_EACH_INSN_USE (use, insn)
-+    {
-+      rtx reg = DF_REF_REG (use);
-+
-+      if (REG_P (reg) && REGNO (reg) >= regno && REGNO (reg) < end_regno)
-+	return true;
-+    }
-+  return false;
-+}
-+
- /* Try to move INSN from BB to a successor.  Return true on success.
-    USES and DEFS are the set of registers that are used and defined
-    after INSN in BB.  SPLIT_P indicates whether a live edge from BB
-@@ -340,10 +355,15 @@ move_insn_for_shrink_wrap (basic_block b
-       *split_p = true;
-     }
- 
-+  vec<basic_block> live_bbs;
-+  if (MAY_HAVE_DEBUG_INSNS)
-+    live_bbs.create (5);
-   /* At this point we are committed to moving INSN, but let's try to
-      move it as far as we can.  */
-   do
-     {
-+      if (MAY_HAVE_DEBUG_INSNS)
-+	live_bbs.safe_push (bb);
-       live_out = df_get_live_out (bb);
-       live_in = df_get_live_in (next_block);
-       bb = next_block;
-@@ -426,6 +446,34 @@ move_insn_for_shrink_wrap (basic_block b
- 	SET_REGNO_REG_SET (bb_uses, i);
-     }
- 
-+  /* Remove debug insns using regs set by the insn we are moving.  */
-+  if (MAY_HAVE_DEBUG_INSNS)
-+    {
-+      while (!live_bbs.is_empty ())
-+	{
-+	  rtx_insn *dinsn;
-+	  basic_block tmp_bb = live_bbs.pop ();
-+
-+	  FOR_BB_INSNS_REVERSE (tmp_bb, dinsn)
-+	    {
-+	      if (dinsn == insn)
-+		break;
-+	      if (DEBUG_INSN_P (dinsn)
-+		  && insn_uses_reg (dinsn, dregno, end_dregno))
-+		{
-+		  if (*split_p)
-+		    /* If split, then we will be moving insn into a
-+		       newly created block immediately after the entry
-+		       block.  Move the debug info there too.  */
-+		    emit_debug_insn_after (PATTERN (dinsn), bb_note (bb));
-+		  delete_insn (dinsn);
-+		  break;
-+		}
-+	    }
-+	}
-+      live_bbs.release ();
-+    }
-+
-   emit_insn_after (PATTERN (insn), bb_note (bb));
-   delete_insn (insn);
-   return true;
-Index: b/gcc/testsuite/gcc.dg/pr65779.c
-===================================================================
---- /dev/null
-+++ b/gcc/testsuite/gcc.dg/pr65779.c
-@@ -0,0 +1,64 @@
-+/* { dg-do run } */
-+/* { dg-options "-O2 -g" } */
-+/* { dg-additional-options "-mrelocatable" { target powerpc-*-rtems* } } */
-+
-+unsigned long __attribute__ ((noinline))
-+adler32 (unsigned long adler, unsigned char *buf, unsigned int len)
-+{
-+  unsigned long s1 = adler & 0xffff;
-+  unsigned long s2 = (adler >> 16) & 0xffff;
-+  int k;
-+
-+  if (buf == 0)
-+    return 1L;
-+
-+  while (len > 0)
-+    {
-+      k = len < 5552 ? len : 5552;
-+      len -= k;
-+      while (k >= 16)
-+	{
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  s1 += *buf++; s2 += s1;
-+	  k -= 16;
-+	}
-+      if (k != 0)
-+	do
-+	  {
-+	    s1 += *buf++; s2 += s1;
-+	  } while (--k);
-+      s1 &= 0xffffffffUL;
-+      s2 &= 0xffffffffUL;
-+      s1 %= 65521L;
-+      s2 %= 65521L;
-+    }
-+  return (s2 << 16) | s1;
-+}
-+
-+unsigned char buf[] = { 0, 1, 2, 3, 4, 5, 6, 7,
-+			8, 9, 10, 11, 12, 13, 14, 15,
-+			0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
-+			0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f,
-+			0x55, 0xaa };
-+int
-+main ()
-+{
-+  unsigned long x = adler32 (0, buf, sizeof buf);
-+  if (x != 0x640409efUL)
-+    __builtin_abort ();
-+  return 0;
-+}
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch b/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
deleted file mode 100644
index 2f262e3..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Accepted
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
-
-2015-11-25  Vladimir Makarov  <vmakarov@redhat.com>
-
-	PR rtl-optimization/67954
-	* lra-constraints.c (curr_insn_transform): Add check on scratch
-	pseudo when change class to NO_REGS.  Add an assert.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@230894 138bc75d-0d04-0410-961f-82ee72b054a4
----
-
-diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
-index 4670e81..c62bf6a 100644
---- a/gcc/lra-constraints.c
-+++ b/gcc/lra-constraints.c
-@@ -3725,7 +3725,8 @@ curr_insn_transform (bool check_only_p)
- 		 assigment pass and the scratch pseudo will be
- 		 spilled.  Spilled scratch pseudos are transformed
- 		 back to scratches at the LRA end.  */
--	      && lra_former_scratch_operand_p (curr_insn, i))
-+	      && lra_former_scratch_operand_p (curr_insn, i)
-+	      && lra_former_scratch_p (REGNO (op)))
- 	    {
- 	      int regno = REGNO (op);
- 	      lra_change_class (regno, NO_REGS, "      Change to", true);
-@@ -3734,6 +3735,8 @@ curr_insn_transform (bool check_only_p)
- 		   spilled pseudo as there is only one such insn, the
- 		   current one.  */
- 		reg_renumber[regno] = -1;
-+	      lra_assert (bitmap_single_bit_set_p
-+			  (&lra_reg_info[REGNO (op)].insn_bitmap));
- 	    }
- 	  /* We can do an optional reload.  If the pseudo got a hard
- 	     reg, we might improve the code through inheritance.  If
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
similarity index 83%
rename from meta/recipes-devtools/gcc/gcc-5.2.inc
rename to meta/recipes-devtools/gcc/gcc-5.3.inc
index 2ebc675..3ce0893 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -2,15 +2,15 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "5.2.0"
+PV = "5.3.0"
 
 #SNAP = "5-20150405"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "5.2.0"
+BINV = "5.3.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.2:${FILE_DIRNAME}/gcc-5.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.3:${FILE_DIRNAME}/gcc-5.3/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -26,8 +26,6 @@ LIC_FILES_CHKSUM = "\
 "
 #BASEURI = "http://www.netgull.com/gcc/snapshots/${SNAP}/gcc-${SNAP}.tar.bz2"
 BASEURI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
-SRC_URI[md5sum] = "a51bcfeb3da7dd4c623e27207ed43467"
-SRC_URI[sha256sum] = "5f835b04b5f7dd4f4d2dc96190ec1621b8d89f2dc6f638f9f8bc1b1014ba8cad"
 
 SRC_URI = "\
            ${BASEURI} \
@@ -68,20 +66,23 @@ SRC_URI = "\
            file://0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
            file://0035-Dont-link-the-plugins-with-libgomp-explicitly.patch \
            file://0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
-           file://0037-pr65779.patch \
-           file://0038-fix-g++-sysroot.patch \
+           file://0037-aarch64-Add-support-for-musl-ldso.patch \
+           file://0038-fix-g-sysroot.patch \
            file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0040-nativesdk-gcc-support.patch \
-           file://0041-handle-target-sysroot-multilib.patch \
-           file://0042-cxxflags-for-build.patch \
-           file://0043-fix-arm-thumb.patch \
-           file://0043-libstdc-musl.patch \
-           file://0044-gcc-musl-support.patch \
-           file://0045-musl-dynamic-linker.patch \
-           file://0046-musl-no-fixincludes.patch \
+           file://0040-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0042-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0043-libstdc-Support-musl.patch \
+           file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch \
+           file://0045-Support-for-arm-linux-musl.patch \
+           file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
           "
 
 BACKPORTS = ""
+
+SRC_URI[md5sum] = "c9616fd448f980259c31de613e575719"
+SRC_URI[sha256sum] = "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"
+
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-5.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 2c766f4..1aead96 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From a0fee0cee3d4bd4aab1e3a8e04446f99d918c4ff Mon Sep 17 00:00:00 2001
+From 6029bb338305a5d1403ee23427ed8d58eae1ff53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH 01/35] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+Subject: [PATCH 01/46] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -12,7 +12,7 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 7616f88..50e7cbc 100755
+index a3f66ba..1cba3a9 100755
 --- a/configure
 +++ b/configure
 @@ -7464,7 +7464,7 @@ fi
@@ -25,7 +25,7 @@ index 7616f88..50e7cbc 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 8c85a08..f34af7e 100644
+index 987dfab..d3adb95 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3104,7 +3104,7 @@ fi
@@ -38,5 +38,5 @@ index 8c85a08..f34af7e 100644
   *" newlib "*)
    case " $target_configargs " in
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-5.3/0002-uclibc-conf.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-5.2/0002-uclibc-conf.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0002-uclibc-conf.patch
index 69d33a0..8d6aeb5 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0002-uclibc-conf.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0002-uclibc-conf.patch
@@ -1,7 +1,7 @@
-From 7635248a4c9b51d723d721acaeeb5f2f11957987 Mon Sep 17 00:00:00 2001
+From b67c3a844bccec1766a7ec120e2d18cdcbc5f114 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:38:25 +0400
-Subject: [PATCH 02/35] uclibc-conf
+Subject: [PATCH 02/46] uclibc-conf
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -49,5 +49,5 @@ index 743d951..ae4ea60 100755
    need_lib_prefix=no
    need_version=no
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-5.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-5.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
index bca254d..bd03263 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
@@ -1,7 +1,7 @@
-From 3aee58ad043af33ab00c9cd7bc88f0cade83f236 Mon Sep 17 00:00:00 2001
+From 9bcb3a1848ff0f8990301ca09a25b15c2cf90c6f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:40:12 +0400
-Subject: [PATCH 03/35] gcc-uclibc-locale-ctype_touplow_t
+Subject: [PATCH 03/46] gcc-uclibc-locale-ctype_touplow_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -83,5 +83,5 @@ index fd52b73..2627cf3 100644
      // NB: Offsets into ctype<char>::_M_table force a particular size
      // on the mask type. Because of this, we don't use an enum.
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-5.3/0004-uclibc-locale.patch
similarity index 99%
rename from meta/recipes-devtools/gcc/gcc-5.2/0004-uclibc-locale.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0004-uclibc-locale.patch
index 03947a7..656265a 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0004-uclibc-locale.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0004-uclibc-locale.patch
@@ -1,7 +1,7 @@
-From 9f73e06315c94629fb902bd94219667cf8307b8f Mon Sep 17 00:00:00 2001
+From bd9dd472d162fc72522f96f70f6391c7c63d2bf7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:41:39 +0400
-Subject: [PATCH 04/35] uclibc-locale
+Subject: [PATCH 04/46] uclibc-locale
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -38,10 +38,10 @@ Upstream-Status: Pending
  create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.h
 
 diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
-index a1e301f..0fe9326 100644
+index 826ef86..79cc716 100644
 --- a/libstdc++-v3/acinclude.m4
 +++ b/libstdc++-v3/acinclude.m4
-@@ -1983,6 +1983,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+@@ -2029,6 +2029,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
    # Default to "generic".
    if test $enable_clocale_flag = auto; then
      case ${target_os} in
@@ -51,7 +51,7 @@ index a1e301f..0fe9326 100644
        linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
  	enable_clocale_flag=gnu
  	;;
-@@ -2167,6 +2170,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+@@ -2213,6 +2216,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
        CTIME_CC=config/locale/generic/time_members.cc
        CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
        ;;
@@ -2737,10 +2737,10 @@ index 0000000..ba8e858
 +      _S_destroy_c_locale(_M_c_locale_timepunct);
 +    }
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index f5b28f4..fbad667 100755
+index 8cd4c76..217012e 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -15913,6 +15913,9 @@ fi
+@@ -15918,6 +15918,9 @@ fi
    # Default to "generic".
    if test $enable_clocale_flag = auto; then
      case ${target_os} in
@@ -2750,7 +2750,7 @@ index f5b28f4..fbad667 100755
        linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
  	enable_clocale_flag=gnu
  	;;
-@@ -16191,6 +16194,78 @@ $as_echo "newlib" >&6; }
+@@ -16196,6 +16199,78 @@ $as_echo "newlib" >&6; }
        CTIME_CC=config/locale/generic/time_members.cc
        CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
        ;;
@@ -2858,5 +2858,5 @@ index aa1b2fa..45c4617 100644
    using ::wcsncat;
    using ::wcsncmp;
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-5.3/0005-uclibc-locale-no__x.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-5.2/0005-uclibc-locale-no__x.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0005-uclibc-locale-no__x.patch
index ac053ea..19a86a4 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0005-uclibc-locale-no__x.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0005-uclibc-locale-no__x.patch
@@ -1,7 +1,7 @@
-From a8e683917a3e8a6642639e65c06d4d4fc46cc8ab Mon Sep 17 00:00:00 2001
+From 72a1a4af3c18627f59aa5ba1f753a89011b4e4f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:42:36 +0400
-Subject: [PATCH 05/35] uclibc-locale-no__x
+Subject: [PATCH 05/46] uclibc-locale-no__x
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -253,5 +253,5 @@ index e0707d7..d848ed5 100644
  namespace std
  {
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-5.3/0006-uclibc-locale-wchar_fix.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-5.2/0006-uclibc-locale-wchar_fix.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0006-uclibc-locale-wchar_fix.patch
index 9112a2b..d7dbe68 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0006-uclibc-locale-wchar_fix.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0006-uclibc-locale-wchar_fix.patch
@@ -1,7 +1,7 @@
-From cdb9e9c9440beb59bc20476eea5a9cf2538cd194 Mon Sep 17 00:00:00 2001
+From b1298344f0c221c382a95af689f7f3ecd864f531 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:45:57 +0400
-Subject: [PATCH 06/35] uclibc-locale-wchar_fix
+Subject: [PATCH 06/46] uclibc-locale-wchar_fix
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -64,5 +64,5 @@ index 2c70642..d5c8961 100644
  	  if (_M_data->_M_thousands_sep == L'\0')
  	    _M_data->_M_grouping = "";
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-5.3/0007-uclibc-locale-update.patch
similarity index 99%
rename from meta/recipes-devtools/gcc/gcc-5.2/0007-uclibc-locale-update.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0007-uclibc-locale-update.patch
index 728b790..cde7499 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0007-uclibc-locale-update.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0007-uclibc-locale-update.patch
@@ -1,7 +1,7 @@
-From 244b9d1b5cc6d5382935192998531ee70afb262d Mon Sep 17 00:00:00 2001
+From e9d7cb62741c22d667fe56e98d50753d89aefdc3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:46:58 +0400
-Subject: [PATCH 07/35] uclibc-locale-update
+Subject: [PATCH 07/46] uclibc-locale-update
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -538,5 +538,5 @@ index ba8e858..1665dde 100644
  
    template<typename _CharT>
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-5.3/0008-missing-execinfo_h.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-5.2/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0008-missing-execinfo_h.patch
index b2f6b18..9f87931 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0008-missing-execinfo_h.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0008-missing-execinfo_h.patch
@@ -1,7 +1,7 @@
-From 0a80f60de08bd5829ca1b3758f70a92b61dda143 Mon Sep 17 00:00:00 2001
+From 9b7442069eb68a42d2437181c1b2e710dd077e8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:48:10 +0400
-Subject: [PATCH 08/35] missing-execinfo_h
+Subject: [PATCH 08/46] missing-execinfo_h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -24,5 +24,5 @@ index 6b38f2d..fca98ff 100644
  #     define GC_HAVE_BUILTIN_BACKTRACE
  #   endif
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-5.3/0009-c99-snprintf.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-5.2/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0009-c99-snprintf.patch
index 525b2a1..6b236c6 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0009-c99-snprintf.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0009-c99-snprintf.patch
@@ -1,7 +1,7 @@
-From 7b7caf4305a54fa4dfdd0efd5bd41cb94cbcf43d Mon Sep 17 00:00:00 2001
+From fde97f80d2d931ed3fa4a86294799366b2359331 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:49:03 +0400
-Subject: [PATCH 09/35] c99-snprintf
+Subject: [PATCH 09/46] c99-snprintf
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -24,5 +24,5 @@ index 37f01ca..f00c06d 100644
  #undef snprintf
  #undef vfscanf
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-5.3/0010-gcc-poison-system-directories.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-5.2/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0010-gcc-poison-system-directories.patch
index 4e02ef8..2da8877 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0010-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0010-gcc-poison-system-directories.patch
@@ -1,7 +1,7 @@
-From d1e85a363ffcd259e9b0841b85ca10af2f31bd72 Mon Sep 17 00:00:00 2001
+From 7a90e62d557c78ae52006dff30c99006e10d9357 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
-Subject: [PATCH 10/35] gcc: poison-system-directories
+Subject: [PATCH 10/46] gcc: poison-system-directories
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -17,7 +17,7 @@ Upstream-Status: Inappropriate [distribution: codesourcery]
  7 files changed, 66 insertions(+)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index b49ac46..783d231 100644
+index 1218a71..bfba114 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -623,6 +623,10 @@ Wreturn-local-addr
@@ -32,7 +32,7 @@ index b49ac46..783d231 100644
  Common Var(warn_shadow) Warning
  Warn when one local variable shadows another
 diff --git a/gcc/config.in b/gcc/config.in
-index f2ed301..f290c6b 100644
+index 5335258..f079826 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -168,6 +168,12 @@
@@ -49,10 +49,10 @@ index f2ed301..f290c6b 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 9523773..181748e 100755
+index 3c92795..34371a3 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -932,6 +932,7 @@ with_system_zlib
+@@ -933,6 +933,7 @@ with_system_zlib
  enable_maintainer_mode
  enable_link_mutex
  enable_version_specific_runtime_libs
@@ -60,7 +60,7 @@ index 9523773..181748e 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1661,6 +1662,8 @@ Optional Features:
+@@ -1670,6 +1671,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -69,7 +69,7 @@ index 9523773..181748e 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -28087,6 +28090,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -28211,6 +28214,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -90,10 +90,10 @@ index 9523773..181748e 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 68b0ee8..8b07078 100644
+index d414081..240d322 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5571,6 +5571,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -5654,6 +5654,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -111,7 +111,7 @@ index 68b0ee8..8b07078 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 520c2c5..0df8a47 100644
+index d3be589..c81b55b 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -269,6 +269,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -122,7 +122,7 @@ index 520c2c5..0df8a47 100644
  -Wredundant-decls  -Wno-return-local-addr @gol
  -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
  -Wshift-count-negative -Wshift-count-overflow @gol
-@@ -4432,6 +4433,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -4433,6 +4434,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -188,5 +188,5 @@ index 6c54ca6..cc0c921 100644
  
  /* Use given -I paths for #include "..." but not #include <...>, and
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-5.3/0011-gcc-poison-dir-extend.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-5.2/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0011-gcc-poison-dir-extend.patch
index 067d985..511e694 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0011-gcc-poison-dir-extend.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0011-gcc-poison-dir-extend.patch
@@ -1,7 +1,7 @@
-From f158fcc084e88b1d8d1ecf5b005d377765aef16e Mon Sep 17 00:00:00 2001
+From db406054de6b0967cd76cbb998f05b0c5af0bd94 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:00:34 +0400
-Subject: [PATCH 11/35] gcc-poison-dir-extend
+Subject: [PATCH 11/46] gcc-poison-dir-extend
 
 Add /sw/include and /opt/include based on the original
 zecke-no-host-includes.patch patch.  The original patch checked for
@@ -35,5 +35,5 @@ index cc0c921..0bc1f67 100644
                       "include location \"%s\" is unsafe for "
                       "cross-compilation",
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-5.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index befca73..750bbc8 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From a54239cbdc6f93c6d74ea6b078f1470770c4f5aa Mon Sep 17 00:00:00 2001
+From 278d293c4cee9482a23aa3443741861ff2f67212 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH 12/35] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+Subject: [PATCH 12/46] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
 
 Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
 
@@ -26,7 +26,7 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 50e7cbc..6b97693 100755
+index 1cba3a9..9cae8da 100755
 --- a/configure
 +++ b/configure
 @@ -6733,6 +6733,38 @@ fi
@@ -69,5 +69,5 @@ index 50e7cbc..6b97693 100755
  # the named directory are copied to $(tooldir)/sys-include.
  if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-5.3/0013-64-bit-multilib-hack.patch
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-5.2/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0013-64-bit-multilib-hack.patch
index 67c0661..45aaf4c 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0013-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0013-64-bit-multilib-hack.patch
@@ -1,7 +1,7 @@
-From d5151bebd079e981dc710f2a031830d89cb1e72e Mon Sep 17 00:00:00 2001
+From bdde4f5efa3c89ac7ee0bc05f322f27e3dabeab9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH 13/35] 64-bit multilib hack.
+Subject: [PATCH 13/46] 64-bit multilib hack.
 
 GCC has internal multilib handling code but it assumes a very specific rigid directory
 layout. The build system implementation of multilib layout is very generic and allows
@@ -81,5 +81,5 @@ index b6b351d..1d5b37a 100644
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
  	$(COMPILE) $<
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-5.3/0014-optional-libstdc.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-5.2/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0014-optional-libstdc.patch
index 374fe43..73741f8 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0014-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0014-optional-libstdc.patch
@@ -1,7 +1,7 @@
-From d7b42d93d077b2523c26f0dff0b6c44fdfff9d3c Mon Sep 17 00:00:00 2001
+From a13763f8a1d413a432e7b40835a062f86208f29a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH 14/35] optional libstdc
+Subject: [PATCH 14/46] optional libstdc
 
 gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
 will not run correctly since by default the linker will try to link against libstdc++
@@ -25,7 +25,7 @@ Upstream-Status: Inappropriate [embedded specific]
  4 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 983f4a8..96924f6 100644
+index 4162566..453ec8e 100644
 --- a/gcc/c-family/c.opt
 +++ b/gcc/c-family/c.opt
 @@ -1543,6 +1543,10 @@ nostdinc++
@@ -52,7 +52,7 @@ index 6536d7e..f57a5d4 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 0df8a47..73856d0 100644
+index c81b55b..6d3f68c 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -195,6 +195,7 @@ in the following sections.
@@ -72,7 +72,7 @@ index 0df8a47..73856d0 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol} -z @var{keyword}}
  
-@@ -11185,6 +11186,11 @@ These entries are usually resolved by entries in
+@@ -11187,6 +11188,11 @@ These entries are usually resolved by entries in
  libc.  These entry points should be supplied through some other
  mechanism when this option is specified.
  
@@ -97,5 +97,5 @@ index 675bcc1..a37ec8b 100644
  #endif
  
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-5.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-5.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
index 6cf1e3d..1b62ef8 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
@@ -1,7 +1,7 @@
-From ad1592791698286b80626ddd5679ff2ef457ab76 Mon Sep 17 00:00:00 2001
+From 4bd21a1d63cfb14e261d90adc0c5d4f9462dc555 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:14:20 +0400
-Subject: [PATCH 15/35] gcc: disable MASK_RELAX_PIC_CALLS bit
+Subject: [PATCH 15/46] gcc: disable MASK_RELAX_PIC_CALLS bit
 
 The new feature added after 4.3.3
 "http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
@@ -19,10 +19,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 14 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 181748e..9009064 100755
+index 34371a3..8caecdc 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -26451,13 +26451,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
+@@ -26479,13 +26479,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
          rm -f conftest.*
        fi
      fi
@@ -37,10 +37,10 @@ index 181748e..9009064 100755
  $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 8b07078..c7a28b4 100644
+index 240d322..57819ff 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -4361,13 +4361,6 @@ x:
+@@ -4384,13 +4384,6 @@ x:
          rm -f conftest.*
        fi
      fi
@@ -55,5 +55,5 @@ index 8b07078..c7a28b4 100644
  
      AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-5.3/0016-COLLECT_GCC_OPTIONS.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-5.2/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0016-COLLECT_GCC_OPTIONS.patch
index 359de35..e6ae262 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0016-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0016-COLLECT_GCC_OPTIONS.patch
@@ -1,7 +1,7 @@
-From 2b22ee2e44688f8a72b9af76a0431d86bac00d47 Mon Sep 17 00:00:00 2001
+From 92427ebb94dc66f8e64ebf3ffbcd6dd5ce0935c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH 16/35] COLLECT_GCC_OPTIONS
+Subject: [PATCH 16/46] COLLECT_GCC_OPTIONS
 
 This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
 invoke collect2.
@@ -34,5 +34,5 @@ index a37ec8b..87b47c5 100644
      {
        const char *const *args;
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-5.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 8506131..b89a279 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,7 +1,7 @@
-From 12f467bc6d8953ba342fe5166b9a2f397b334794 Mon Sep 17 00:00:00 2001
+From b1f3118e439459c26a3e19c617b7b0c93745e77a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH 17/35] Use the defaults.h in ${B} instead of ${S}, and t-oe in
+Subject: [PATCH 17/46] Use the defaults.h in ${B} instead of ${S}, and t-oe in
  ${B}
 
 Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
@@ -27,7 +27,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 4ab7405..661ae17 100644
+index 07c6f0a..e1e63e8 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -502,7 +502,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -40,10 +40,10 @@ index 4ab7405..661ae17 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 9009064..f059c2f 100755
+index 8caecdc..8ec3d40 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -11841,8 +11841,8 @@ for f in $tm_file; do
+@@ -11850,8 +11850,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -55,7 +55,7 @@ index 9009064..f059c2f 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index c7a28b4..2e668a5 100644
+index 57819ff..643a47e 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1832,8 +1832,8 @@ for f in $tm_file; do
@@ -92,5 +92,5 @@ index c32f087..6803ab9 100644
  
  # Add multiple inclusion protection guard, part two.
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-5.3/0018-fortran-cross-compile-hack.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-5.2/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0018-fortran-cross-compile-hack.patch
index da73392..e8ba325 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0018-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0018-fortran-cross-compile-hack.patch
@@ -1,7 +1,7 @@
-From 95506b44c9ef4725fef52fa864d3d3fcf931e443 Mon Sep 17 00:00:00 2001
+From d11c73c1295565ff3766ae04e2a410a89fc84dd5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH 18/35] fortran cross-compile hack.
+Subject: [PATCH 18/46] fortran cross-compile hack.
 
 * Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
 used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index e1592f7..76d19b3 100755
+index bb3107b..5d47e65 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
 @@ -12747,7 +12747,7 @@ esac
@@ -29,7 +29,7 @@ index e1592f7..76d19b3 100755
  ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
  ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
 diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index 35a8b39..6a0d8a9 100644
+index adafb3f..b4ade28 100644
 --- a/libgfortran/configure.ac
 +++ b/libgfortran/configure.ac
 @@ -240,7 +240,7 @@ AC_SUBST(enable_static)
@@ -42,5 +42,5 @@ index 35a8b39..6a0d8a9 100644
  
  # extra LD Flags which are required for targets
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0019-libgcc-sjlj-check.patch b/meta/recipes-devtools/gcc/gcc-5.3/0019-libgcc-sjlj-check.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-5.2/0019-libgcc-sjlj-check.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0019-libgcc-sjlj-check.patch
index ec5394a..01a4d1f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0019-libgcc-sjlj-check.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0019-libgcc-sjlj-check.patch
@@ -1,7 +1,7 @@
-From 94f619cd3257e35e20a877640d0cb90c2b3efc15 Mon Sep 17 00:00:00 2001
+From 7b40212ed6c0c9fe4efe51f31bccd3d9f892f238 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:50 +0400
-Subject: [PATCH 19/35] libgcc-sjlj-check
+Subject: [PATCH 19/46] libgcc-sjlj-check
 
 ac_fn_c_try_compile doesnt seem to keep the intermediate files
 which are needed for sjlj test to pass since it greps into the
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  2 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/libgcc/configure b/libgcc/configure
-index 08c9319..5ffaeb3 100644
+index 203d384..6aef3e7 100644
 --- a/libgcc/configure
 +++ b/libgcc/configure
 @@ -4570,17 +4570,19 @@ void foo ()
@@ -45,7 +45,7 @@ index 08c9319..5ffaeb3 100644
  
  fi
 diff --git a/libgcc/configure.ac b/libgcc/configure.ac
-index 1c405e8..f52975d 100644
+index a10a952..cc324f3 100644
 --- a/libgcc/configure.ac
 +++ b/libgcc/configure.ac
 @@ -255,16 +255,14 @@ void foo ()
@@ -70,5 +70,5 @@ index 1c405e8..f52975d 100644
  ])
  
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0020-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.3/0020-cpp-honor-sysroot.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-5.2/0020-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0020-cpp-honor-sysroot.patch
index 71bc68b..13f66d4 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0020-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0020-cpp-honor-sysroot.patch
@@ -1,7 +1,7 @@
-From 6e6283d645c83ca534219a02ae882a3d7be95ff1 Mon Sep 17 00:00:00 2001
+From 5f9759a85fff3d78e3f71ae01c970b10d326c406 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH 20/35] cpp: honor sysroot.
+Subject: [PATCH 20/46] cpp: honor sysroot.
 
 Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
 preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
@@ -50,5 +50,5 @@ index 87b47c5..e6efae7 100644
    {"@assembler",
     "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0021-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-5.3/0021-MIPS64-Default-to-N64-ABI.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-5.2/0021-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0021-MIPS64-Default-to-N64-ABI.patch
index caad489..c7cffe4 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0021-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0021-MIPS64-Default-to-N64-ABI.patch
@@ -1,7 +1,7 @@
-From 7f766fc47f9388dd0094852a43f1af2568b4b9b2 Mon Sep 17 00:00:00 2001
+From 34d22ab6cfd2dfe6dd171c8d0b31cafcdeb86298 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH 21/35] MIPS64: Default to N64 ABI
+Subject: [PATCH 21/46] MIPS64: Default to N64 ABI
 
 MIPS64 defaults to n32 ABI, this patch makes it
 so that it defaults to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index cb08a5c..b155744 100644
+index c835734..dd0739d 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2011,29 +2011,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2017,29 +2017,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
@@ -53,5 +53,5 @@ index cb08a5c..b155744 100644
  			;;
  	esac
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-5.3/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-5.2/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 54520d0..6208351 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,7 +1,7 @@
-From 4f94added8b7043642386b31ed4c3a1bd016f316 Mon Sep 17 00:00:00 2001
+From f6b41b62ea62a0f1447d9fc235f7fd2bbf3fe7c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH 22/35] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+Subject: [PATCH 22/46] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
  relative to SYSTEMLIBS_DIR
 
 This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -60,7 +60,7 @@ index e9d65dc..cfdf3f0 100644
  
  #define GLIBC_DYNAMIC_LINKER \
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index 1279cba..1dde747 100644
+index 49ad954..a5ab559 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -62,7 +62,7 @@
@@ -212,5 +212,5 @@ index fa805fd..0eb4acd 100644
  #ifdef SPARC_BI_ARCH
  
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0023-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-5.3/0023-gcc-Fix-argument-list-too-long-error.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-5.2/0023-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0023-gcc-Fix-argument-list-too-long-error.patch
index b337df5..be91c9e 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0023-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0023-gcc-Fix-argument-list-too-long-error.patch
@@ -1,7 +1,7 @@
-From 8db606205487ebb03eae788826faf64bd6918450 Mon Sep 17 00:00:00 2001
+From 9701f596bbe5bf51bbf48661bc515b45d4b6f4d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 23/35] gcc: Fix argument list too long error.
+Subject: [PATCH 23/46] gcc: Fix argument list too long error.
 
 There would be an "Argument list too long" error when the
 build directory is longer than 200, this is caused by:
@@ -23,10 +23,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 661ae17..9470a92 100644
+index e1e63e8..7b49f88 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3255,7 +3255,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3262,7 +3262,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  # We keep the directory structure for files in config or c-family and .def
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
@@ -36,5 +36,5 @@ index 661ae17..9470a92 100644
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0024-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-5.3/0024-Disable-sdt.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-5.2/0024-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0024-Disable-sdt.patch
index 9f219ca..b23ce97 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0024-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0024-Disable-sdt.patch
@@ -1,7 +1,7 @@
-From e136342d2f7c0bdb1cf4b57ad3440d3c9e710322 Mon Sep 17 00:00:00 2001
+From 946e047614103e1f2982613c7aa5f76587500c0e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH 24/35] Disable sdt.
+Subject: [PATCH 24/46] Disable sdt.
 
 We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
 It may or may not exist from preivous builds though. To be determinstic, disable
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index f059c2f..98853b3 100755
+index 8ec3d40..eaa3b07 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -27733,12 +27733,12 @@ fi
+@@ -27857,12 +27857,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index f059c2f..98853b3 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 2e668a5..52cdcb8 100644
+index 643a47e..9f6cacb 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5232,15 +5232,15 @@ if test x$gcc_cv_libc_provides_ssp = xyes; then
+@@ -5315,15 +5315,15 @@ if test x$gcc_cv_libc_provides_ssp = xyes; then
  fi
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index 2e668a5..52cdcb8 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index fbad667..7d5a6c6 100755
+index 217012e..81240b9 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -20897,11 +20897,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -20964,11 +20964,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,10 +96,10 @@ index fbad667..7d5a6c6 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 7a7c1d8..b13eabc 100644
+index 580fb8b..5a41083 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -229,7 +229,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
@@ -109,5 +109,5 @@ index 7a7c1d8..b13eabc 100644
  # Check for available headers.
  AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0025-libtool.patch b/meta/recipes-devtools/gcc/gcc-5.3/0025-libtool.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.2/0025-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0025-libtool.patch
index b8977d6..8d5eb97 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0025-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0025-libtool.patch
@@ -1,7 +1,7 @@
-From 1ca54967d8f67ab0eca772334e5c925a5e8c80cc Mon Sep 17 00:00:00 2001
+From f68c5b78751660505b22b46dad99240db0df3456 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH 25/35] libtool
+Subject: [PATCH 25/46] libtool
 
 libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
 when running on am x86_64 build host.
@@ -38,5 +38,5 @@ index 9503ec8..0121fba 100644
        oldlibs=
        if test -z "$rpath"; then
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-5.3/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.2/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index a8a652a..a22d95f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,7 +1,7 @@
-From 5f5ca57fcec4bafe3780371d1342acd40c608697 Mon Sep 17 00:00:00 2001
+From 4c75e349aa7abd1e285720328b23690636bea242 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH 26/35] gcc: armv4: pass fix-v4bx to linker to support EABI.
+Subject: [PATCH 26/46] gcc: armv4: pass fix-v4bx to linker to support EABI.
 
 The LINK_SPEC for linux gets overwritten by linux-eabi.h which
 means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
@@ -39,5 +39,5 @@ index cfdf3f0..048a062 100644
  		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
  
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-5.3/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-5.2/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 445da37..46815d1 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,7 +1,7 @@
-From 484e8c1e8d43e626ee2ddbde9eb8e0af7a176aef Mon Sep 17 00:00:00 2001
+From 8217dd7fb318f9abc6564f67b424c433d8398d61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH 27/35] Use the multilib config files from ${B} instead of
+Subject: [PATCH 27/46] Use the multilib config files from ${B} instead of
  using the ones from ${S}
 
 Use the multilib config files from ${B} instead of using the ones from ${S}
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 98853b3..d0ec50f 100755
+index eaa3b07..9b60aad 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -11821,10 +11821,20 @@ done
+@@ -11830,10 +11830,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 98853b3..d0ec50f 100755
  done
  tmake_file="${tmake_file_}"
  
-@@ -11835,6 +11845,10 @@ tm_file_list="options.h"
+@@ -11844,6 +11854,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,7 +58,7 @@ index 98853b3..d0ec50f 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 52cdcb8..3cf606a 100644
+index 9f6cacb..e1e54f2 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1812,10 +1812,20 @@ done
@@ -98,5 +98,5 @@ index 52cdcb8..3cf606a 100644
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-5.3/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-5.2/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 4902e90..60ddd9c 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,7 +1,7 @@
-From 112ca9f860114bc79273a79ed42722fdc9ded6ea Mon Sep 17 00:00:00 2001
+From 08a0e45b308fc97d06f5c3ef77a257e7a6bd1a48 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH 28/35] Avoid using libdir from .la which usually points to a
+Subject: [PATCH 28/46] Avoid using libdir from .la which usually points to a
  host path
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -27,5 +27,5 @@ index 0121fba..52bdbdb 100644
  	    absdir="$libdir"
  	  fi
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0029-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-5.3/0029-export-CPP.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-5.2/0029-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0029-export-CPP.patch
index 0a05ae5..62195aa 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0029-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0029-export-CPP.patch
@@ -1,7 +1,7 @@
-From a983033f1327a692af55be8d1aa61aede18c4afb Mon Sep 17 00:00:00 2001
+From 95f494d1544857ad38949a7da37e2d7264475233 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH 29/35] export CPP
+Subject: [PATCH 29/46] export CPP
 
 The OE environment sets and exports CPP as being the target gcc. When
 building gcc-cross-canadian for a mingw targetted sdk, the following can be found
@@ -49,5 +49,5 @@ index 36b4008..a783e1e 100644
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-5.2/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
index 873dca9..e7ca360 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
@@ -1,7 +1,7 @@
-From 3d870a184c05df1338db1870301c4144ba99fc3d Mon Sep 17 00:00:00 2001
+From 4ed8c1fd9dc05f7a9db9298a55396c8f0ff549a7 Mon Sep 17 00:00:00 2001
 From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
 Date: Wed, 5 Feb 2014 16:52:31 +0200
-Subject: [PATCH 30/35] Enable SPE & AltiVec generation on powepc*linux target
+Subject: [PATCH 30/46] Enable SPE & AltiVec generation on powepc*linux target
 
 When is configured with --target=powerpc-linux, the resulting GCC will
 not be able to generate code for SPE targets (e500v1/v2).
@@ -20,10 +20,10 @@ Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index b155744..0541b8a 100644
+index dd0739d..3825bd5 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2337,7 +2337,14 @@ powerpc-*-rtems*)
+@@ -2343,7 +2343,14 @@ powerpc-*-rtems*)
  	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-rtems rs6000/t-ppccomm"
  	;;
  powerpc*-*-linux*)
@@ -40,5 +40,5 @@ index b155744..0541b8a 100644
  	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-ppccomm"
  	extra_objs="$extra_objs rs6000-linux.o"
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-5.3/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.2/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
index f06cba8..f2bc664 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
@@ -1,7 +1,7 @@
-From a824cd3f45875f6c1c47ccdbf33534947bd2b587 Mon Sep 17 00:00:00 2001
+From bb6fea821483aa3259b34e101a39c993edd01411 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:21:55 +0000
-Subject: [PATCH 31/35] Disable the MULTILIB_OSDIRNAMES and other multilib
+Subject: [PATCH 31/46] Disable the MULTILIB_OSDIRNAMES and other multilib
  options.
 
 Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
@@ -38,5 +38,5 @@ index c296376..3bb59bf 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0032-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-5.3/0032-Ensure-target-gcc-headers-can-be-included.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-5.2/0032-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0032-Ensure-target-gcc-headers-can-be-included.patch
index 4513306..89503ff 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0032-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0032-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,7 +1,7 @@
-From e60090f7c537c84fd1b22307edd9f386228c7339 Mon Sep 17 00:00:00 2001
+From bb26f90f5e0accc3539f62b6fec663682959dd36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH 32/35] Ensure target gcc headers can be included
+Subject: [PATCH 32/46] Ensure target gcc headers can be included
 
 There are a few headers installed as part of the OpenEmbedded
 gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 15 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 9470a92..1497ede 100644
+index 7b49f88..cd5bc4a 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -582,6 +582,7 @@ libexecdir = @libexecdir@
@@ -34,7 +34,7 @@ index 9470a92..1497ede 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2603,6 +2604,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2610,6 +2611,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -94,5 +94,5 @@ index e6efae7..3ca27b9 100644
  #undef MD_EXEC_PREFIX
  #undef MD_STARTFILE_PREFIX
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-5.3/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-5.2/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
index 519e413..19d480f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -1,7 +1,7 @@
-From 997f9e939f85f651b22a48251cfb1444831d54ca Mon Sep 17 00:00:00 2001
+From 629fcc7d0075c9b4261da6435e122429fb028ec0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 11:17:19 +0000
-Subject: [PATCH 33/35] gcc 4.8+ won't build with --disable-dependency-tracking
+Subject: [PATCH 33/46] gcc 4.8+ won't build with --disable-dependency-tracking
 
 since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
 
@@ -50,5 +50,5 @@ index 9288652..3720256 100644
  M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
  M_FILE = $(PAT_BASE)_n.c
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-5.3/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-5.2/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index 207cd7c..a453fa6 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,7 +1,7 @@
-From c94da257a219873b946e08306141af7749679f67 Mon Sep 17 00:00:00 2001
+From a4efc9ca85734c283d4da09b628121e1c1f49c4e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH 34/35] Don't search host directory during "relink" if
+Subject: [PATCH 34/46] Don't search host directory during "relink" if
  $inst_prefix is provided
 
 http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
@@ -34,5 +34,5 @@ index 52bdbdb..82bcec3 100644
  		esac
  	      fi
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch b/meta/recipes-devtools/gcc/gcc-5.3/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc-5.2/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
index b75f385..6ed589b 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
@@ -1,7 +1,7 @@
-From 3a09545f3d18ce492ef55639215a072282de03d0 Mon Sep 17 00:00:00 2001
+From 5b0125a792842ae02df507bc55555661cb10f9a3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 8 Mar 2015 03:41:39 +0000
-Subject: [PATCH 35/35] Dont link the plugins with libgomp explicitly
+Subject: [PATCH 35/46] Dont link the plugins with libgomp explicitly
 
 They are dlopened by libgomp anyway. This fixes
 the libtool relink issue which causes issues during
@@ -79,5 +79,5 @@ index 167485f..d2c5428 100644
 -libgomp_plugin_host_nonshm_la_LIBADD = libgomp.la
  libgomp_plugin_host_nonshm_la_LIBTOOLFLAGS = --tag=disable-static
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-5.3/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 82%
rename from meta/recipes-devtools/gcc/gcc-5.2/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index b691946..41c0294 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,7 +1,7 @@
-From 861bcfd4ae814f351e0c668ee26d01d1331e0422 Mon Sep 17 00:00:00 2001
+From b0b0688176a9482777e9b2e98408bfc4505d31af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
-Subject: [PATCH 36/37] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+Subject: [PATCH 36/46] Use SYSTEMLIBS_DIR replacement instead of hardcoding
  base_libdir
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -10,7 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 9abb252..79525ee 100644
+index 257acf0..abeb948 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,7 +21,7 @@
@@ -23,5 +23,5 @@ index 9abb252..79525ee 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 -- 
-2.1.4
+2.6.3
 
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000..30dbe74
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,26 @@
+From 420ca64a86d560a77ee596a9774d672b08ca8278 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:18:39 -0700
+Subject: [PATCH 37/46] aarch64: Add support for musl ldso
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index abeb948..f9e65fc 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -23,6 +23,8 @@
+ 
+ #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
++
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+ 
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0038-fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.3/0038-fix-g-sysroot.patch
similarity index 64%
rename from meta/recipes-devtools/gcc/gcc-5.2/0038-fix-g++-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0038-fix-g-sysroot.patch
index f024dd5..9ba574a 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0038-fix-g++-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0038-fix-g-sysroot.patch
@@ -1,3 +1,8 @@
+From 8df3e7007a22c9d6be5d5ae4b9b169c5c8431917 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 27 May 2015 17:06:06 -0700
+Subject: [PATCH 38/46] fix g++ sysroot
+
 Portions of
 
 http://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg26013.html
@@ -11,12 +16,16 @@ with c++ test.cpp fails unable to find the header. strace shows it looking in
 usr/include/xxxx rather than /usr/include/xxxx
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/configure    | 4 +++-
+ gcc/configure.ac | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
 
-Index: gcc-4.8.1/gcc/configure.ac
-===================================================================
---- gcc-4.8.1.orig/gcc/configure.ac	2013-07-15 15:55:49.488399132 -0700
-+++ gcc-4.8.1/gcc/configure.ac	2013-07-15 16:02:31.772406679 -0700
-@@ -148,7 +148,9 @@
+diff --git a/gcc/configure b/gcc/configure
+index 9b60aad..6df594c 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -3375,7 +3375,9 @@ gcc_gxx_include_dir_add_sysroot=0
  if test "${with_sysroot+set}" = set; then
    gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
    if test "${gcc_gxx_without_sysroot}"; then
@@ -27,11 +36,11 @@ Index: gcc-4.8.1/gcc/configure.ac
      gcc_gxx_include_dir_add_sysroot=1
    fi
  fi
-Index: gcc-4.8.1/gcc/configure
-===================================================================
---- gcc-4.8.1.orig/gcc/configure	2013-07-15 15:55:49.472399132 -0700
-+++ gcc-4.8.1/gcc/configure	2013-07-15 16:02:31.780406680 -0700
-@@ -3325,7 +3325,9 @@
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index e1e54f2..3bb2173 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -152,7 +152,9 @@ gcc_gxx_include_dir_add_sysroot=0
  if test "${with_sysroot+set}" = set; then
    gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
    if test "${gcc_gxx_without_sysroot}"; then
@@ -42,3 +51,6 @@ Index: gcc-4.8.1/gcc/configure
      gcc_gxx_include_dir_add_sysroot=1
    fi
  fi
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-5.3/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-5.2/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 2f025c6..2e0df96 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,7 +1,7 @@
-From acea0df9997a47f8b8224b6ca1618c8c9dfbe6d5 Mon Sep 17 00:00:00 2001
+From 1eede9e4a10d3532db826a6eeced695df3ad5b89 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH] libcc1: fix libcc1's install path and rpath
+Subject: [PATCH 39/46] libcc1: fix libcc1's install path and rpath
 
 * Install libcc1.so and libcc1plugin.so into
   $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
@@ -15,8 +15,8 @@ Upstream-Status: Inappropriate [OE configuration]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- libcc1/Makefile.am  |    4 ++--
- libcc1/Makefile.in  |    4 ++--
+ libcc1/Makefile.am | 4 ++--
+ libcc1/Makefile.in | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
@@ -49,3 +49,6 @@ index 1916134..c8995d2 100644
  @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la
  @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
  BUILT_SOURCES = compiler-name.h
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch b/meta/recipes-devtools/gcc/gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch
index fd81ae2..11e1310 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0040-nativesdk-gcc-support.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,3 +1,8 @@
+From b41674d357c4ba320b9860e0f313d2f5a332f27d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:39:54 +0000
+Subject: [PATCH 40/46] handle sysroot support for nativesdk-gcc
+
 Being able to build a nativesdk gcc is useful, particularly in cases
 where the host compiler may be of an incompatible version (or a 32
 bit compiler is needed).
@@ -15,11 +20,18 @@ a) Add %r into spec file markup which can be used for injected paths
 b) Add other paths which need relocation into a .gccrelocprefix section
    which the relocation code will notice and adjust automatically.
 
-
 Upstream-Status: Inappropriate
 RP 2015/7/28
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++++-------------
+ gcc/cppdefault.h |  3 ++-
+ gcc/gcc.c        | 20 ++++++++++++++------
+ 3 files changed, 53 insertions(+), 20 deletions(-)
+
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 03a0287..f44c1d8 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
 @@ -35,6 +35,30 @@
@@ -123,6 +135,7 @@ diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
      { 0, 0, 0, 0, 0, 0 }
    };
 diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index c98644f..4198669 100644
 --- a/gcc/cppdefault.h
 +++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
@@ -136,6 +149,7 @@ diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
  				   (see update_path in prefix.c) */
    const char cplusplus;		/* Only look here if we're compiling C++.  */
 diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 3ca27b9..2b7756e 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -120,6 +120,8 @@ static const char *target_system_root = TARGET_SYSTEM_ROOT;
@@ -182,7 +196,7 @@ diff --git a/gcc/gcc.c b/gcc/gcc.c
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5550,6 +5553,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -5523,6 +5526,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -194,3 +208,6 @@ diff --git a/gcc/gcc.c b/gcc/gcc.c
  	  case 'S':
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch b/meta/recipes-devtools/gcc/gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 73%
rename from meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index 5356984..5a504a1 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0041-handle-target-sysroot-multilib.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,18 +1,24 @@
-Search target sysroot gcc version specific dirs with multilib.
+From 99cadb4d8415dd5a275d7d6410f20db33d0f8433 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:41:45 +0000
+Subject: [PATCH 41/46] Search target sysroot gcc version specific dirs with
+ multilib.
 
 We install the gcc libraries (such as crtbegin.p) into
 <sysroot><libdir>/<target-sys>/5.2.0/
-which is a default search path for GCC (aka multi_suffix in the 
+which is a default search path for GCC (aka multi_suffix in the
 code below). <target-sys> is 'machine' in gcc's terminology. We use
-these directories so that multiple gcc versions could in theory 
+these directories so that multiple gcc versions could in theory
 co-exist on target.
 
-We only want to build one gcc-cross-canadian per arch and have this work 
+We only want to build one gcc-cross-canadian per arch and have this work
 for all multilibs. <target-sys> can be handled by mapping the multilib
-<target-sys> to the one used by gcc-cross-canadian, e.g. mips64-polkmllib32-linux 
+<target-sys> to the one used by gcc-cross-canadian, e.g.
+mips64-polkmllib32-linux
 is symlinked to by mips64-poky-linux.
 
-The default gcc search path in the target sysroot for a "lib64" mutlilib is:
+The default gcc search path in the target sysroot for a "lib64" mutlilib
+is:
 
 <sysroot>/lib32/mips64-poky-linux/5.2.0/
 <sysroot>/lib32/../lib64/
@@ -39,11 +45,16 @@ binaries can be found first. With this change the search path becomes:
 Upstream-Status: Pending
 RP 2015/7/31
 
-Index: gcc-5.2.0/gcc/gcc.c
-===================================================================
---- gcc-5.2.0.orig/gcc/gcc.c
-+++ gcc-5.2.0/gcc/gcc.c
-@@ -2305,7 +2305,7 @@ for_each_path (const struct path_prefix
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 2b7756e..8f53aea 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -2305,7 +2305,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -52,7 +63,7 @@ Index: gcc-5.2.0/gcc/gcc.c
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2317,6 +2317,33 @@ for_each_path (const struct path_prefix
+@@ -2317,6 +2317,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
@@ -86,3 +97,6 @@ Index: gcc-5.2.0/gcc/gcc.c
  	      memcpy (path + len, multi_suffix, suffix_len + 1);
  	      ret = callback (path, callback_info);
  	      if (ret)
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch b/meta/recipes-devtools/gcc/gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
index 1105e29..5af764b 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,7 @@
-Fix various _FOR_BUILD and related variables
+From 78e77206902349c9256f06c3dd179197a39af2e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:42:45 +0000
+Subject: [PATCH 42/46] Fix various _FOR_BUILD and related variables
 
 When doing a FOR_BUILD thing, you have to override CFLAGS with
 CFLAGS_FOR_BUILD. And if you use C++, you also have to override
@@ -13,9 +16,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in      | 6 ++++++
+ Makefile.tpl     | 5 +++++
+ gcc/Makefile.in  | 2 +-
+ gcc/configure    | 2 +-
+ gcc/configure.ac | 2 +-
+ 5 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 9370174..011c29a 100644
+index a783e1e..8b6d3d2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -152,6 +152,7 @@ BUILD_EXPORTS = \
@@ -44,7 +55,7 @@ index 9370174..011c29a 100644
  	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-@@ -711,6 +715,7 @@ BASE_FLAGS_TO_PASS = \
+@@ -710,6 +715,7 @@ BASE_FLAGS_TO_PASS = \
  	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
  	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
  	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
@@ -96,7 +107,7 @@ index cd5bc4a..98ae4f4 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index c7ac14b..5ac63e4 100755
+index 6df594c..fcb05e7 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -11521,7 +11521,7 @@ else
@@ -109,7 +120,7 @@ index c7ac14b..5ac63e4 100755
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 50856e6..17a4dfd 100644
+index 3bb2173..923bc9a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1633,7 +1633,7 @@ else
@@ -121,3 +132,6 @@ index 50856e6..17a4dfd 100644
  	${realsrcdir}/configure \
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch b/meta/recipes-devtools/gcc/gcc-5.3/0043-libstdc-Support-musl.patch
similarity index 56%
rename from meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0043-libstdc-Support-musl.patch
index 048e481..bad8402 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0043-libstdc-Support-musl.patch
@@ -1,11 +1,20 @@
+From df430b943a2df6b72054c808d4b93338a82562de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Dec 2015 08:23:34 +0000
+Subject: [PATCH 43/46] libstdc++: Support musl
+
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libstdc++-v3/configure.host | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
 
-Index: gcc-4.9-20140316/libstdc++-v3/configure.host
-===================================================================
---- gcc-4.9-20140316.orig/libstdc++-v3/configure.host	2014-03-26 01:12:19.466008193 -0700
-+++ gcc-4.9-20140316/libstdc++-v3/configure.host	2014-03-26 01:43:48.222684357 -0700
-@@ -264,14 +264,24 @@
+diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
+index 640199c..1756444 100644
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
+@@ -274,14 +274,24 @@ case "${host_os}" in
      os_include_dir="os/bsd/freebsd"
      ;;
    gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
@@ -30,3 +39,6 @@ Index: gcc-4.9-20140316/libstdc++-v3/configure.host
    hpux*)
      os_include_dir="os/hpux"
      ;;
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
similarity index 75%
rename from meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
index 4d1ab87..b91c02d 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
@@ -1,15 +1,25 @@
-# HG changeset patch
-# Parent e5b4564f249f8634194bdabef4b3057d0e54ee97
-Adding -mmusl as a musl libc specifier, and the necessary hacks for it to know how to find musl's dynamic linker.
+From 0b54799d80fb859c7b142467e4d42c99db59df50 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Dec 2015 08:30:35 +0000
+Subject: [PATCH 44/46] Adding -mmusl as a musl libc specifier, and the
+ necessary hacks for it to know how to find musl's dynamic linker.
 
 Upstream-Status: Backport [partial]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config.gcc                |  10 ++++-
+ gcc/config/linux.h            | 100 +++++++++++++++++++++++++++++++++++++-----
+ gcc/config/linux.opt          |   4 ++
+ gcc/config/rs6000/secureplt.h |   1 +
+ gcc/config/rs6000/sysv4.h     |   5 +++
+ gcc/ginclude/stddef.h         |   3 ++
+ 6 files changed, 110 insertions(+), 13 deletions(-)
 
-Index: gcc-4.9.0/gcc/config.gcc
-===================================================================
---- gcc-4.9.0.orig/gcc/config.gcc	2014-04-22 22:44:17.153567150 -0700
-+++ gcc-4.9.0/gcc/config.gcc	2014-04-23 23:54:31.427357051 -0700
-@@ -594,7 +594,7 @@
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 3825bd5..39ce047 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -575,7 +575,7 @@ case ${target} in
  esac
  
  # Common C libraries.
@@ -18,7 +28,7 @@ Index: gcc-4.9.0/gcc/config.gcc
  
  # 32-bit x86 processors supported by --with-arch=.  Each processor
  # MUST be separated by exactly one space.
-@@ -719,6 +719,9 @@
+@@ -720,6 +720,9 @@ case ${target} in
      *-*-*uclibc*)
        tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
        ;;
@@ -28,7 +38,7 @@ Index: gcc-4.9.0/gcc/config.gcc
      *)
        tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
        ;;
-@@ -2328,6 +2331,11 @@
+@@ -2420,6 +2423,11 @@ powerpc*-*-linux*)
  	    powerpc*-*-linux*paired*)
  		tm_file="${tm_file} rs6000/750cl.h" ;;
  	esac
@@ -40,11 +50,11 @@ Index: gcc-4.9.0/gcc/config.gcc
  	if test x${enable_secureplt} = xyes; then
  		tm_file="rs6000/secureplt.h ${tm_file}"
  	fi
-Index: gcc-4.9.0/gcc/config/linux.h
-===================================================================
---- gcc-4.9.0.orig/gcc/config/linux.h	2014-01-02 14:23:26.000000000 -0800
-+++ gcc-4.9.0/gcc/config/linux.h	2014-04-24 00:11:29.034028895 -0700
-@@ -32,10 +32,12 @@
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 22b9be5..ca9a17f 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -32,10 +32,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
  #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
  #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
@@ -57,7 +67,7 @@ Index: gcc-4.9.0/gcc/config/linux.h
  #endif
  
  #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
-@@ -53,18 +55,21 @@
+@@ -53,18 +55,21 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
     uClibc or Bionic is the default C library and whether
     -muclibc or -mglibc or -mbionic has been passed to change the default.  */
  
@@ -87,7 +97,7 @@ Index: gcc-4.9.0/gcc/config/linux.h
  #else
  #error "Unsupported DEFAULT_LIBC"
  #endif /* DEFAULT_LIBC */
-@@ -84,16 +89,16 @@
+@@ -84,16 +89,16 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  
  #define GNU_USER_DYNAMIC_LINKER						\
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
@@ -108,7 +118,7 @@ Index: gcc-4.9.0/gcc/config/linux.h
  
  /* Whether we have Bionic libc runtime */
  #undef TARGET_HAS_BIONIC
-@@ -127,3 +132,74 @@
+@@ -123,3 +128,74 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  # define TARGET_LIBC_HAS_FUNCTION linux_libc_has_function
  
  #endif
@@ -183,11 +193,11 @@ Index: gcc-4.9.0/gcc/config/linux.h
 +    { 0, 0, 0, 0, 0, 0 }				\
 +  }
 +#endif
-Index: gcc-4.9.0/gcc/config/linux.opt
-===================================================================
---- gcc-4.9.0.orig/gcc/config/linux.opt	2014-01-02 14:23:26.000000000 -0800
-+++ gcc-4.9.0/gcc/config/linux.opt	2014-04-22 22:44:17.280233817 -0700
-@@ -30,3 +30,7 @@
+diff --git a/gcc/config/linux.opt b/gcc/config/linux.opt
+index c054338..9334f74 100644
+--- a/gcc/config/linux.opt
++++ b/gcc/config/linux.opt
+@@ -30,3 +30,7 @@ Use GNU C library
  muclibc
  Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
  Use uClibc C library
@@ -195,48 +205,20 @@ Index: gcc-4.9.0/gcc/config/linux.opt
 +mmusl
 +Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
 +Use musl C library
-Index: gcc-4.9.0/gcc/ginclude/stddef.h
-===================================================================
---- gcc-4.9.0.orig/gcc/ginclude/stddef.h	2014-01-02 14:23:26.000000000 -0800
-+++ gcc-4.9.0/gcc/ginclude/stddef.h	2014-04-22 22:44:17.280233817 -0700
-@@ -181,6 +181,7 @@
- #ifndef _GCC_SIZE_T
- #ifndef _SIZET_
- #ifndef __size_t
-+#ifndef __DEFINED_size_t /* musl */
- #define __size_t__	/* BeOS */
- #define __SIZE_T__	/* Cray Unicos/Mk */
- #define _SIZE_T
-@@ -197,6 +198,7 @@
- #define ___int_size_t_h
- #define _GCC_SIZE_T
- #define _SIZET_
-+#define __DEFINED_size_t /* musl */
- #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
-   || defined(__FreeBSD_kernel__)
- /* __size_t is a typedef on FreeBSD 5, must not trash it. */
-@@ -214,6 +216,7 @@
- typedef long ssize_t;
- #endif /* __BEOS__ */
- #endif /* !(defined (__GNUG__) && defined (size_t)) */
-+#endif /* __DEFINED_size_t */
- #endif /* __size_t */
- #endif /* _SIZET_ */
- #endif /* _GCC_SIZE_T */
-Index: gcc-4.9.0/gcc/config/rs6000/secureplt.h
-===================================================================
---- gcc-4.9.0.orig/gcc/config/rs6000/secureplt.h	2014-01-02 14:23:26.000000000 -0800
-+++ gcc-4.9.0/gcc/config/rs6000/secureplt.h	2014-04-23 23:55:15.114024175 -0700
-@@ -18,3 +18,4 @@
+diff --git a/gcc/config/rs6000/secureplt.h b/gcc/config/rs6000/secureplt.h
+index b463463..77edf2a 100644
+--- a/gcc/config/rs6000/secureplt.h
++++ b/gcc/config/rs6000/secureplt.h
+@@ -18,3 +18,4 @@ along with GCC; see the file COPYING3.  If not see
  <http://www.gnu.org/licenses/>.  */
  
  #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
 +#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
-===================================================================
---- gcc-4.9.0.orig/gcc/config/rs6000/sysv4.h	2014-04-23 23:52:13.854023015 -0700
-+++ gcc-4.9.0/gcc/config/rs6000/sysv4.h	2014-04-24 00:10:55.550695334 -0700
-@@ -538,6 +538,10 @@
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index c6c31dc..7cd07e0 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -538,6 +538,10 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
  #define CC1_SECURE_PLT_DEFAULT_SPEC ""
  #endif
  
@@ -245,19 +227,9 @@ Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
 +#endif
 +
  /* Pass -G xxx to the compiler.  */
+ #undef CC1_SPEC
  #define	CC1_SPEC "%{G*} %(cc1_cpu)" \
- "%{meabi: %{!mcall-*: -mcall-sysv }} \
-@@ -585,7 +589,8 @@
- 
- /* Override the default target of the linker.  */
- #define	LINK_TARGET_SPEC \
--  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "")
-+  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "") \
-+  "%{!mbss-plt: %{!msecure-plt: %(link_secure_plt_default)}}"
- 
- /* Any specific OS flags.  */
- #define LINK_OS_SPEC "\
-@@ -894,6 +899,7 @@
+@@ -889,6 +893,7 @@ ncrtn.o%s"
    { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
    { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
    { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
@@ -265,3 +237,34 @@ Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
    { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
    { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
    { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
+diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
+index f20a41b..eb879ef 100644
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
+@@ -184,6 +184,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -200,6 +201,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__DragonFly__) \
+   || defined(__FreeBSD_kernel__)
+@@ -218,6 +220,7 @@ typedef __SIZE_TYPE__ size_t;
+ typedef long ssize_t;
+ #endif /* __BEOS__ */
+ #endif /* !(defined (__GNUG__) && defined (size_t)) */
++#endif /* __DEFINED_size_t */
+ #endif /* __size_t */
+ #endif /* _SIZET_ */
+ #endif /* _GCC_SIZE_T */
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch b/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
similarity index 68%
rename from meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
index 3dadb95..7f7307b 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
@@ -1,15 +1,38 @@
-# HG changeset patch
-# Parent 6738fd6f6fcc2a72f2ba527bda3325642af26885
-Support for arm-linux-musl.
+From a32a7901315bf01d0605e43cb7d0427a6d7e4b75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Dec 2015 08:31:52 +0000
+Subject: [PATCH 45/46] Support for arm-linux-musl.
 
 Upstream-Status: backport [partial]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h |  1 +
+ gcc/config/arm/linux-eabi.h        | 17 +++++++++++++++++
+ gcc/config/i386/linux.h            |  1 +
+ gcc/config/i386/linux64.h          |  5 +++++
+ gcc/config/mips/linux.h            |  6 +++++-
+ gcc/config/rs6000/linux64.h        | 13 +++++++++----
+ gcc/config/rs6000/sysv4.h          | 10 +++++++---
+ libitm/config/arm/hwcap.cc         |  4 ++++
+ libitm/config/linux/x86/tls.h      |  8 ++++++--
+ 9 files changed, 55 insertions(+), 10 deletions(-)
 
-
-Index: gcc-5.1.0/gcc/config/arm/linux-eabi.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/arm/linux-eabi.h
-+++ gcc-5.1.0/gcc/config/arm/linux-eabi.h
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index f9e65fc..1b2d0c0 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -22,6 +22,7 @@
+ #define GCC_AARCH64_LINUX_H
+ 
+ #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
+ 
+ #define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
+ 
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 048a062..adb9c44 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
 @@ -81,6 +81,23 @@
  #undef TARGET_FIX_V4BX_SPEC
  #define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
@@ -34,36 +57,20 @@ Index: gcc-5.1.0/gcc/config/arm/linux-eabi.h
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
  #undef  LINK_SPEC
-Index: gcc-5.1.0/libitm/config/arm/hwcap.cc
-===================================================================
---- gcc-5.1.0.orig/libitm/config/arm/hwcap.cc
-+++ gcc-5.1.0/libitm/config/arm/hwcap.cc
-@@ -40,7 +40,11 @@ int GTM_hwcap HIDDEN = 0
- 
- #ifdef __linux__
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <sys/fcntl.h>
-+#else
-+#include <fcntl.h>
-+#endif
- #include <elf.h>
- 
- static void __attribute__((constructor))
-Index: gcc-5.1.0/gcc/config/i386/linux.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/i386/linux.h
-+++ gcc-5.1.0/gcc/config/i386/linux.h
-@@ -21,3 +21,4 @@ along with GCC; see the file COPYING3.
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index 21ba2b2..e2b81e5 100644
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
+@@ -21,3 +21,4 @@ along with GCC; see the file COPYING3.  If not see
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
  #define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
-Index: gcc-5.1.0/gcc/config/i386/linux64.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/i386/linux64.h
-+++ gcc-5.1.0/gcc/config/i386/linux64.h
-@@ -30,3 +30,8 @@ see the files COPYING3 and COPYING.RUNTI
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index 6185cce..5a3a977 100644
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
+@@ -30,3 +30,8 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
  #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
  #define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
@@ -72,11 +79,11 @@ Index: gcc-5.1.0/gcc/config/i386/linux64.h
 +#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
 +
-Index: gcc-5.1.0/gcc/config/mips/linux.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/mips/linux.h
-+++ gcc-5.1.0/gcc/config/mips/linux.h
-@@ -21,6 +21,10 @@ along with GCC; see the file COPYING3.
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index c306afb..44d4c12 100644
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -21,6 +21,10 @@ along with GCC; see the file COPYING3.  If not see
  #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
@@ -87,16 +94,16 @@ Index: gcc-5.1.0/gcc/config/mips/linux.h
  #define GLIBC_DYNAMIC_LINKER32 \
    "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
  #define GLIBC_DYNAMIC_LINKER64 \
-@@ -40,4 +44,4 @@ along with GCC; see the file COPYING3.
+@@ -40,4 +44,4 @@ along with GCC; see the file COPYING3.  If not see
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
 -                         BIONIC_DYNAMIC_LINKERN32)
 +                         BIONIC_DYNAMIC_LINKERN32,  MUSL_DYNAMIC_LINKERN32)
-Index: gcc-5.1.0/gcc/config/rs6000/linux64.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/rs6000/linux64.h
-+++ gcc-5.1.0/gcc/config/rs6000/linux64.h
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 31c4338..679da4b 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
 @@ -365,17 +365,22 @@ extern int dot_symbols;
  #endif
  #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
@@ -124,11 +131,11 @@ Index: gcc-5.1.0/gcc/config/rs6000/linux64.h
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-Index: gcc-5.1.0/gcc/config/rs6000/sysv4.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/rs6000/sysv4.h
-+++ gcc-5.1.0/gcc/config/rs6000/sysv4.h
-@@ -769,15 +769,19 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEF
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index 7cd07e0..8794fa5 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -763,15 +763,19 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
  
  #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
  #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
@@ -151,10 +158,26 @@ Index: gcc-5.1.0/gcc/config/rs6000/sysv4.h
  
  #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
    %{rdynamic:-export-dynamic} \
-Index: gcc-5.1.0/libitm/config/linux/x86/tls.h
-===================================================================
---- gcc-5.1.0.orig/libitm/config/linux/x86/tls.h
-+++ gcc-5.1.0/libitm/config/linux/x86/tls.h
+diff --git a/libitm/config/arm/hwcap.cc b/libitm/config/arm/hwcap.cc
+index a1c2cfd..dd4fad2 100644
+--- a/libitm/config/arm/hwcap.cc
++++ b/libitm/config/arm/hwcap.cc
+@@ -40,7 +40,11 @@ int GTM_hwcap HIDDEN = 0
+ 
+ #ifdef __linux__
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <sys/fcntl.h>
++#else
++#include <fcntl.h>
++#endif
+ #include <elf.h>
+ 
+ static void __attribute__((constructor))
+diff --git a/libitm/config/linux/x86/tls.h b/libitm/config/linux/x86/tls.h
+index e731ab7..54ad8b6 100644
+--- a/libitm/config/linux/x86/tls.h
++++ b/libitm/config/linux/x86/tls.h
 @@ -25,16 +25,19 @@
  #ifndef LIBITM_X86_TLS_H
  #define LIBITM_X86_TLS_H 1
@@ -177,22 +200,13 @@ Index: gcc-5.1.0/libitm/config/linux/x86/tls.h
  namespace GTM HIDDEN {
  
  #ifdef __x86_64__
-@@ -101,5 +104,6 @@ static inline void set_abi_disp(struct a
+@@ -101,5 +104,6 @@ static inline void set_abi_disp(struct abi_dispatch *x)
  
  } // namespace GTM
  #endif /* >= GLIBC 2.10 */
 +#endif
  
  #endif // LIBITM_X86_TLS_H
-Index: gcc-5.1.0/gcc/config/aarch64/aarch64-linux.h
-===================================================================
---- gcc-5.1.0.orig/gcc/config/aarch64/aarch64-linux.h
-+++ gcc-5.1.0/gcc/config/aarch64/aarch64-linux.h
-@@ -22,6 +22,7 @@
- #define GCC_AARCH64_LINUX_H
- 
- #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
- 
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch b/meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
similarity index 45%
rename from meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
rename to meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
index 05fe52f..ddb0fc4 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
@@ -1,15 +1,18 @@
-# HG changeset patch
-# Parent 600a8a422ccaf5627ad1f5a138e7398df2b9e9d8
-Get rid of ever-broken fixincludes on musl.
+From 047116e8c9cbb340264f4f28db3f21a68ba57ff3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Dec 2015 08:32:24 +0000
+Subject: [PATCH 46/46] Get rid of ever-broken fixincludes on musl.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fixincludes/mkfixinc.sh | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-
-Index: gcc-4.9-20140316/fixincludes/mkfixinc.sh
-===================================================================
---- gcc-4.9-20140316.orig/fixincludes/mkfixinc.sh
-+++ gcc-4.9-20140316/fixincludes/mkfixinc.sh
+diff --git a/fixincludes/mkfixinc.sh b/fixincludes/mkfixinc.sh
+index 6653fedb..0d96c8c 100755
+--- a/fixincludes/mkfixinc.sh
++++ b/fixincludes/mkfixinc.sh
 @@ -19,7 +19,8 @@ case $machine in
      powerpc-*-eabi*    | \
      powerpc-*-rtems*   | \
@@ -20,3 +23,6 @@ Index: gcc-4.9-20140316/fixincludes/mkfixinc.sh
  	#  IF there is no include fixing,
  	#  THEN create a no-op fixer and exit
  	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
+-- 
+2.6.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_5.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_5.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_5.2.bb b/meta/recipes-devtools/gcc/gcc-cross_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_5.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 690d780..c31072a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -143,11 +143,11 @@ FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
     ${includedir}/c++/ \
     ${libdir}/libstdc++.so \
-    ${libdir}/libstdc++.la \
+    ${libdir}/libstdc++*.la \
     ${libdir}/libsupc++.la \
 "
 FILES_libstdc++-staticdev = "\
-    ${libdir}/libstdc++.a \
+    ${libdir}/libstdc++*.a \
     ${libdir}/libsupc++.a \
 "
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_5.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb b/meta/recipes-devtools/gcc/gcc-source_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_5.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_5.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_5.2.bb b/meta/recipes-devtools/gcc/gcc_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_5.2.bb
rename to meta/recipes-devtools/gcc/gcc_5.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_5.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_5.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_5.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_5.2.bb b/meta/recipes-devtools/gcc/libgcc_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_5.2.bb
rename to meta/recipes-devtools/gcc/libgcc_5.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_5.2.bb b/meta/recipes-devtools/gcc/libgfortran_5.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_5.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_5.3.bb
-- 
2.6.4


