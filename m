Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 24DFE6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 15:53:23 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hf6so9315365pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3k7RVo0Q3LADmpbVPpREdefEy6PLsvepQ4nw0rd1bGY=;
	b=G72VHzp16ZPy+tCneuMM8mL89+8CmZgGfDm3j3BcKm+BlKIroQMZ5uRiWAV70QVKJd
	tjEG3L09zEI1N2w6yigfpAEKx1Hotp1eU7roTwoBsP1gm7OdnvLyRhe/jgSzxdkf6zTj
	21EjGVOVHWoQTQQNi/fdcFiaFXAKulb3pjbEeNwVBSOPRQZtD821axCpzwcDneFpab9D
	RlKmQ8a8WOTJecO6IqcdNtp3njvIvXHwKEHNPaPsGg2SnqQgvJikgBI5OJRUw0+NdytB
	LAlizKXmGNyHsObtqeSeWpu92X1cy4pcPhG8QfYS67FcdLPKofE7qNSHQfF7XkZ2b+K2
	qUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3k7RVo0Q3LADmpbVPpREdefEy6PLsvepQ4nw0rd1bGY=;
	b=OWTAc+tpSkVQxfa3aRxt7Mw6jjGEIXsBjE2+pu6H6O7IN+06a3xriFXeTwku5M2AaR
	0taDpy2KziJBviwPsDwOqIjPn76I0rh9ULraFadLh8/JD26E6DvlEhVE1mn5w523f0el
	02im/jXJrAxZpNn5zEG4999RtzsJWy7WgOwWAeHWKkAYEsPSe78E4CfQbf4GfoAp1lw6
	SaozPgWoEMjW6RDiaGleDl9aHahW5K3XHBc9aPWaNIfO0p93QXIPVUHZfh+rw/B+RJYh
	5mrc/il/WlAKVa5IYqSXtNvTjLYBFssdxA8tU7NH/cjUkmR2hadBYGH7luKwXcKSwhsx
	2pzA==
X-Gm-Message-State: ALyK8tJb+zhhKY/ziHPvcwXG0xayImKT1HNL3omSoFDU5hkcjQUaOF9IipoZHdGEpwxGUQ==
X-Received: by 10.66.178.49 with SMTP id cv17mr8827697pac.157.1466783602566;
	Fri, 24 Jun 2016 08:53:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e126sm1040245pfc.5.2016.06.24.08.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 08:53:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 08:53:09 -0700
Message-Id: <20160624155309.24605-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH] gcc5: Upgrade to gcc 5.4
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
X-List-Received-Date: Fri, 24 Jun 2016 15:53:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop patches which has been applied to gcc5 branch
until 5.4 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-5.3/0060-remove-prototypes-cfns.patch  | 153 ------------
 .../0061-nios2-Make-assert-less-restrictive.patch  |  35 ---
 .../gcc/gcc-5.3/CVE-2016-2226.patch                | 103 --------
 .../gcc/gcc-5.3/CVE-2016-4488.patch                |  73 ------
 .../gcc/gcc-5.3/CVE-2016-4489.patch                |  56 -----
 .../gcc/gcc-5.3/CVE-2016-4490.patch                | 270 ---------------------
 .../gcc/{gcc-5.3.inc => gcc-5.4.inc}               |  17 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
 .../{gcc-5.3 => gcc-5.4}/0002-uclibc-conf.patch    |   0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   0
 .../{gcc-5.3 => gcc-5.4}/0004-uclibc-locale.patch  |   0
 .../0005-uclibc-locale-no__x.patch                 |   0
 .../0006-uclibc-locale-wchar_fix.patch             |   0
 .../0007-uclibc-locale-update.patch                |   0
 .../0008-missing-execinfo_h.patch                  |   0
 .../{gcc-5.3 => gcc-5.4}/0009-c99-snprintf.patch   |   0
 .../0010-gcc-poison-system-directories.patch       |   0
 .../0011-gcc-poison-dir-extend.patch               |   0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0013-64-bit-multilib-hack.patch                |   0
 .../0014-optional-libstdc.patch                    |   0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0018-fortran-cross-compile-hack.patch          |   0
 .../0019-libgcc-sjlj-check.patch                   |   0
 .../0020-cpp-honor-sysroot.patch                   |   0
 .../0021-MIPS64-Default-to-N64-ABI.patch           |   0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...0023-gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-5.3 => gcc-5.4}/0024-Disable-sdt.patch    |   0
 .../gcc/{gcc-5.3 => gcc-5.4}/0025-libtool.patch    |   0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...tilib-config-files-from-B-instead-of-usin.patch |   0
 ...-libdir-from-.la-which-usually-points-to-.patch |   0
 .../gcc/{gcc-5.3 => gcc-5.4}/0029-export-CPP.patch |   0
 ...AltiVec-generation-on-powepc-linux-target.patch |   0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
 ...Ensure-target-gcc-headers-can-be-included.patch |   0
 ...-t-build-with-disable-dependency-tracking.patch |   0
 ...h-host-directory-during-relink-if-inst_pr.patch |   0
 ...-link-the-plugins-with-libgomp-explicitly.patch |   0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
 .../0037-aarch64-Add-support-for-musl-ldso.patch   |   0
 .../{gcc-5.3 => gcc-5.4}/0038-fix-g-sysroot.patch  |   0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
 ...-various-_FOR_BUILD-and-related-variables.patch |   0
 .../0043-libstdc-Support-musl.patch                |   0
 ...l-as-a-musl-libc-specifier-and-the-necess.patch |   0
 .../0045-Support-for-arm-linux-musl.patch          |   0
 ...et-rid-of-ever-broken-fixincludes-on-musl.patch |   0
 .../0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
 .../{gcc-5.3 => gcc-5.4}/0048-ssp_nonshared.patch  |   0
 ...-weak-reference-logic-in-gthr.h-for-os-ge.patch |   0
 ...050-powerpc-pass-secure-plt-to-the-linker.patch |   0
 ...ug-prefix-map-in-producer-string-by-Danie.patch |   0
 .../0052-nios2-use-ret-with-r31.patch              |   0
 ...arget-65358-Avoid-clobbering-partial-argu.patch |   0
 .../0054-support-ffile-prefix-map.patch            |   0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
 ...-provide-ssp-and-gcc_cv_target_dl_iterate.patch |   0
 .../0057-unwind-fix-for-musl.patch                 |   0
 ...prefix-map-support-to-remap-relative-path.patch |   0
 .../0059-libgcc-use-ldflags.patch                  |   0
 ...s-canadian_5.3.bb => gcc-cross-canadian_5.4.bb} |   0
 ...oss-initial_5.3.bb => gcc-cross-initial_5.4.bb} |   0
 .../gcc/{gcc-cross_5.3.bb => gcc-cross_5.4.bb}     |   0
 ...-initial_5.3.bb => gcc-crosssdk-initial_5.4.bb} |   0
 .../{gcc-crosssdk_5.3.bb => gcc-crosssdk_5.4.bb}   |   0
 .../gcc/{gcc-runtime_5.3.bb => gcc-runtime_5.4.bb} |   0
 ...gcc-sanitizers_5.3.bb => gcc-sanitizers_5.4.bb} |   0
 .../gcc/{gcc-source_5.3.bb => gcc-source_5.4.bb}   |   0
 .../gcc/{gcc_5.3.bb => gcc_5.4.bb}                 |   0
 ...libgcc-initial_5.3.bb => libgcc-initial_5.4.bb} |   0
 .../gcc/{libgcc_5.3.bb => libgcc_5.4.bb}           |   0
 .../gcc/{libgfortran_5.3.bb => libgfortran_5.4.bb} |   0
 78 files changed, 6 insertions(+), 701 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0060-remove-prototypes-cfns.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
 rename meta/recipes-devtools/gcc/{gcc-5.3.inc => gcc-5.4.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0019-libgcc-sjlj-check.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0020-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0021-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0023-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0024-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0025-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0029-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0032-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0037-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0038-fix-g-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0040-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0042-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0043-libstdc-Support-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0045-Support-for-arm-linux-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0048-ssp_nonshared.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0050-powerpc-pass-secure-plt-to-the-linker.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0052-nios2-use-ret-with-r31.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0054-support-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0057-unwind-fix-for-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0058-fdebug-prefix-map-support-to-remap-relative-path.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.3 => gcc-5.4}/0059-libgcc-use-ldflags.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_5.3.bb => gcc-cross-canadian_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_5.3.bb => gcc-cross-initial_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_5.3.bb => gcc-cross_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_5.3.bb => gcc-crosssdk-initial_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_5.3.bb => gcc-crosssdk_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_5.3.bb => gcc-runtime_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_5.3.bb => gcc-sanitizers_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_5.3.bb => gcc-source_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_5.3.bb => gcc_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_5.3.bb => libgcc-initial_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_5.3.bb => libgcc_5.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_5.3.bb => libgfortran_5.4.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0060-remove-prototypes-cfns.patch b/meta/recipes-devtools/gcc/gcc-5.3/0060-remove-prototypes-cfns.patch
deleted file mode 100644
index 2452b6f..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/0060-remove-prototypes-cfns.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-Upstream-Status: backport
-
-From 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 2001
-From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Feb 2016 15:33:50 +0000
-Subject: [PATCH] 2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        Backported from mainline
-        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
-                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        * Make-lang.in: Invoke gperf with -L C++.
-        * cfns.gperf: Remove prototypes for hash and libc_name_p
-        inlines.
-        * cfns.h: Regenerated.
-        * except.c (nothrow_libfn_p): Adjust.
-
-
----
- gcc/cp/Make-lang.in |  2 +-
- gcc/cp/cfns.gperf   | 10 ++--------
- gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
- gcc/cp/except.c     |  3 ++-
- 5 files changed, 31 insertions(+), 37 deletions(-)
-
-diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
-index e98beb1..b09fb02 100644
---- a/gcc/cp/Make-lang.in
-+++ b/gcc/cp/Make-lang.in
-@@ -111,7 +111,7 @@ else
- # deleting the $(srcdir)/cp/cfns.h file.
- $(srcdir)/cp/cfns.h:
- endif
--	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
-+	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
- 		$(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
- 
- #
-diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
-index 68acd3d..214ecf6 100644
---- a/gcc/cp/cfns.gperf
-+++ b/gcc/cp/cfns.gperf
-@@ -1,3 +1,5 @@
-+%language=C++
-+%define class-name libc_name
- %{
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -16,14 +18,6 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- %}
- %%
- # The standard C library functions, for feeding to gperf; the result is used
-diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
-index 1c6665d..596f413 100644
---- a/gcc/cp/cfns.h
-+++ b/gcc/cp/cfns.h
-@@ -1,5 +1,5 @@
--/* ANSI-C code produced by gperf version 3.0.3 */
--/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
-+/* C++ code produced by gperf version 3.0.4 */
-+/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
- 
- #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-@@ -28,7 +28,7 @@
- #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
- #endif
- 
--#line 1 "cfns.gperf"
-+#line 3 "cfns.gperf"
- 
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -47,25 +47,18 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- /* maximum key range = 391, duplicates = 0 */
- 
--#ifdef __GNUC__
--__inline
--#else
--#ifdef __cplusplus
--inline
--#endif
--#endif
--static unsigned int
--hash (register const char *str, register unsigned int len)
-+class libc_name
-+{
-+private:
-+  static inline unsigned int hash (const char *str, unsigned int len);
-+public:
-+  static const char *libc_name_p (const char *str, unsigned int len);
-+};
-+
-+inline unsigned int
-+libc_name::hash (register const char *str, register unsigned int len)
- {
-   static const unsigned short asso_values[] =
-     {
-@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
-   return hval + asso_values[(unsigned char)str[len - 1]];
- }
- 
--#ifdef __GNUC__
--__inline
--#ifdef __GNUC_STDC_INLINE__
--__attribute__ ((__gnu_inline__))
--#endif
--#endif
- const char *
--libc_name_p (register const char *str, register unsigned int len)
-+libc_name::libc_name_p (register const char *str, register unsigned int len)
- {
-   enum
-     {
-diff --git a/gcc/cp/except.c b/gcc/cp/except.c
-index 3ff1ce6..2f2e396 100644
---- a/gcc/cp/except.c
-+++ b/gcc/cp/except.c
-@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
-      unless the system headers are playing rename tricks, and if
-      they are, we don't want to be confused by them.  */
-   id = DECL_NAME (fn);
--  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
-+  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
-+				   IDENTIFIER_LENGTH (id));
- }
- 
- /* Returns nonzero if an exception of type FROM will be caught by a
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch b/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
deleted file mode 100644
index 6a20694..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 802c64857074cb7b002d91ce6352139c2353ca06 Mon Sep 17 00:00:00 2001
-From: cltang <cltang@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 21 May 2016 08:26:11 +0000
-Subject: [PATCH] 2016-05-21  Chung-Lin Tang  <cltang@codesourcery.com>
-
-	Backport from mainline
-	2015-06-29  Sandra Loosemore  <sandra@codesourcery.com>
-
-	* config/nios2/nios2.c (nios2_delegitimize_address): Make
-	assert less restrictive.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4
-Upstream-Status: Backport (git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4)
----
- gcc/config/nios2/nios2.c | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
-index 7b6b389..3b22331 100644
---- a/gcc/config/nios2/nios2.c
-+++ b/gcc/config/nios2/nios2.c
-@@ -1930,7 +1930,7 @@ nios2_delegitimize_address (rtx x)
- 	case UNSPEC_LOAD_TLS_IE:
- 	case UNSPEC_ADD_TLS_LE:
- 	  x = XVECEXP (XEXP (x, 0), 0, 0);
--	  gcc_assert (GET_CODE (x) == SYMBOL_REF);
-+	  gcc_assert (CONSTANT_P (x));
- 	  break;
- 	}
-     }
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
deleted file mode 100644
index 4decb84..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From b8106f544a7fd485b6959ebd197bdd99a8884416 Mon Sep 17 00:00:00 2001
-From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 8 Apr 2016 12:10:21 +0000
-Subject: [PATCH] =?UTF-8?q?Fix=20memory=20allocation=20size=20overflows=20?=
- =?UTF-8?q?(PR69687,=20patch=20by=20Marcel=20B=C3=B6hme)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-	PR c++/69687
-	* cplus-dem.c: Include <limits.h> if available.
-	(INT_MAX): Define if necessary.
-	(remember_type, remember_Ktype, register_Btype, string_need):
-	Abort if we detect cases where we the size of the allocation would
-	overflow.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234829 138bc75d-0d04-0410-961f-82ee72b054a4
-Upstream-Status: Backport
-CVE: CVE-2016-2226
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- libiberty/ChangeLog   |  7 +++++++
- libiberty/cplus-dem.c | 15 +++++++++++++++
- 2 files changed, 22 insertions(+)
-
-diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
-index 8e82a5f..2a34356 100644
---- a/libiberty/ChangeLog
-+++ b/libiberty/ChangeLog
-@@ -1,5 +1,12 @@
- 2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
- 
-+	PR c++/69687
-+	* cplus-dem.c: Include <limits.h> if available.
-+	(INT_MAX): Define if necessary.
-+	(remember_type, remember_Ktype, register_Btype, string_need):
-+	Abort if we detect cases where we the size of the allocation would
-+	overflow.
-+
- 	PR c++/70498
- 	* cplus-dem.c (gnu_special): Handle case where consume_count returns
- 	-1.
-diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
-index abba234..7514e57 100644
---- a/libiberty/cplus-dem.c
-+++ b/libiberty/cplus-dem.c
-@@ -56,6 +56,13 @@ void * malloc ();
- void * realloc ();
- #endif
- 
-+#ifdef HAVE_LIMITS_H
-+#include <limits.h>
-+#endif
-+#ifndef INT_MAX
-+# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */ 
-+#endif
-+
- #include <demangle.h>
- #undef CURRENT_DEMANGLING_STYLE
- #define CURRENT_DEMANGLING_STYLE work->options
-@@ -4261,6 +4268,8 @@ remember_type (struct work_stuff *work, const char *start, int len)
- 	}
-       else
- 	{
-+          if (work -> typevec_size > INT_MAX / 2)
-+	    xmalloc_failed (INT_MAX);
- 	  work -> typevec_size *= 2;
- 	  work -> typevec
- 	    = XRESIZEVEC (char *, work->typevec, work->typevec_size);
-@@ -4288,6 +4297,8 @@ remember_Ktype (struct work_stuff *work, const char *start, int len)
- 	}
-       else
- 	{
-+          if (work -> ksize > INT_MAX / 2)
-+	    xmalloc_failed (INT_MAX);
- 	  work -> ksize *= 2;
- 	  work -> ktypevec
- 	    = XRESIZEVEC (char *, work->ktypevec, work->ksize);
-@@ -4317,6 +4328,8 @@ register_Btype (struct work_stuff *work)
- 	}
-       else
- 	{
-+          if (work -> bsize > INT_MAX / 2)
-+	    xmalloc_failed (INT_MAX);
- 	  work -> bsize *= 2;
- 	  work -> btypevec
- 	    = XRESIZEVEC (char *, work->btypevec, work->bsize);
-@@ -4771,6 +4784,8 @@ string_need (string *s, int n)
-   else if (s->e - s->p < n)
-     {
-       tem = s->p - s->b;
-+      if (n > INT_MAX / 2 - tem)
-+        xmalloc_failed (INT_MAX); 
-       n += tem;
-       n *= 2;
-       s->b = XRESIZEVEC (char, s->b, n);
--- 
-2.3.5
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
deleted file mode 100644
index 30e0ffe..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From be3004dc350a820a5b0320b34bd05673ba534058 Mon Sep 17 00:00:00 2001
-From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 31 Mar 2016 17:20:53 +0000
-Subject: [PATCH] 	* cplus-dem.c (squangle_mop_up): Zero bsize/ksize
- after freeing 	btypevec/ktypevec. 	* testsuite/demangle-expected: Add
- coverage tests.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234645 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE:  CVE-2016-4488
-
-patched ChangeLog and demangle-expected as patch is from tip.
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-
----
- libiberty/ChangeLog                   |  7 +++++++
- libiberty/cplus-dem.c                 |  2 ++
- libiberty/testsuite/demangle-expected | 10 ++++++++++
- 3 files changed, 19 insertions(+)
-
-Index: gcc-5.3.0/libiberty/cplus-dem.c
-===================================================================
---- gcc-5.3.0.orig/libiberty/cplus-dem.c
-+++ gcc-5.3.0/libiberty/cplus-dem.c
-@@ -1237,11 +1237,13 @@ squangle_mop_up (struct work_stuff *work
-     {
-       free ((char *) work -> btypevec);
-       work->btypevec = NULL;
-+      work->bsize = 0;
-     }
-   if (work -> ktypevec != NULL)
-     {
-       free ((char *) work -> ktypevec);
-       work->ktypevec = NULL;
-+      work->ksize = 0;
-     }
- }
- 
-Index: gcc-5.3.0/libiberty/testsuite/demangle-expected
-===================================================================
---- gcc-5.3.0.orig/libiberty/testsuite/demangle-expected
-+++ gcc-5.3.0/libiberty/testsuite/demangle-expected
-@@ -4356,3 +4356,13 @@ _QueueNotification_QueueController__$4PP
- --format=gnu-v3
- _Z1fSsB3fooS_
- f(std::string[abi:foo], std::string[abi:foo])
-+#
-+# Tests a use-after-free problem
-+
-+_Q.__0
-+::Q.(void)
-+#
-+# Tests a use-after-free problem
-+
-+_Q10-__9cafebabe.
-+cafebabe.::-(void)
-Index: gcc-5.3.0/libiberty/ChangeLog
-===================================================================
---- gcc-5.3.0.orig/libiberty/ChangeLog
-+++ gcc-5.3.0/libiberty/ChangeLog
-@@ -1,3 +1,10 @@
-+2016-03-31  Mikhail Maltsev  <maltsevm@gmail.com>
-+           Marcel Bohme  boehme.marcel@gmail.com
-+
-+       * cplus-dem.c (squangle_mop_up): Zero bsize/ksize after freeing
-+       btypevec/ktypevec.
-+       * testsuite/demangle-expected: Add coverage tests.
-+
- 2015-12-04  Release Manager
- 
- 	* GCC 5.3.0 released.
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
deleted file mode 100644
index 68a0f85..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 053ec2207203a194d2ae82e2f164009aad3f14d2 Mon Sep 17 00:00:00 2001
-From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 8 Apr 2016 12:06:59 +0000
-Subject: [PATCH] =?UTF-8?q?Handle=20an=20overflow=20case=20(PR70498,=20pat?=
- =?UTF-8?q?ch=20by=20Marcel=20B=C3=B6hme).?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-	PR c++/70498
-	* cplus-dem.c (gnu_special): Handle case where consume_count returns
-	-1.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@234828 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE: CVE-2016-4489
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
----
- libiberty/ChangeLog   | 6 ++++++
- libiberty/cplus-dem.c | 5 +++++
- 2 files changed, 11 insertions(+)
-
-Index: gcc-5.3.0/libiberty/ChangeLog
-===================================================================
---- gcc-5.3.0.orig/libiberty/ChangeLog
-+++ gcc-5.3.0/libiberty/ChangeLog
-@@ -1,3 +1,9 @@
-+2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
-+
-+	PR c++/70498
-+	* cplus-dem.c (gnu_special): Handle case where consume_count returns
-+	-1.
-+
- 2016-03-31  Mikhail Maltsev  <maltsevm@gmail.com>
-            Marcel Bohme  boehme.marcel@gmail.com
- 
-Index: gcc-5.3.0/libiberty/cplus-dem.c
-===================================================================
---- gcc-5.3.0.orig/libiberty/cplus-dem.c
-+++ gcc-5.3.0/libiberty/cplus-dem.c
-@@ -3001,6 +3001,11 @@ gnu_special (struct work_stuff *work, co
- 		      success = 1;
- 		      break;
- 		    }
-+		  else if (n == -1)
-+		    {
-+		      success = 0;
-+		      break;
-+		    }
- 		}
- 	      else
- 		{
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
deleted file mode 100644
index 4a9ed69..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
+++ /dev/null
@@ -1,270 +0,0 @@
-From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
-From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 2 May 2016 17:06:40 +0000
-Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
- =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-	PR c++/70498
-	* cp-demangle.c: Parse numbers as integer instead of long to avoid
-	overflow after sanity checks. Include <limits.h> if available.
-	(INT_MAX): Define if necessary.
-	(d_make_template_param): Takes integer argument instead of long.
-	(d_make_function_param): Likewise.
-	(d_append_num): Likewise.
-	(d_identifier): Likewise.
-	(d_number): Parse as and return integer.
-	(d_compact_number): Handle overflow.
-	(d_source_name): Change variable type to integer for parsed number.
-	(d_java_resource): Likewise.
-	(d_special_name): Likewise.
-	(d_discriminator): Likewise.
-	(d_unnamed_type): Likewise.
-	* testsuite/demangle-expected: Add regression test cases.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4490
-hand applied ChangeLog
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- libiberty/ChangeLog                   | 19 +++++++++++++
- libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
- libiberty/testsuite/demangle-expected | 14 ++++++++--
- 3 files changed, 61 insertions(+), 24 deletions(-)
-
-Index: gcc-5.3.0/libiberty/cp-demangle.c
-===================================================================
---- gcc-5.3.0.orig/libiberty/cp-demangle.c
-+++ gcc-5.3.0/libiberty/cp-demangle.c
-@@ -124,6 +124,13 @@ extern char *alloca ();
- # endif /* alloca */
- #endif /* HAVE_ALLOCA_H */
- 
-+#ifdef HAVE_LIMITS_H
-+#include <limits.h>
-+#endif
-+#ifndef INT_MAX
-+# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
-+#endif
-+
- #include "ansidecl.h"
- #include "libiberty.h"
- #include "demangle.h"
-@@ -394,7 +401,7 @@ d_make_dtor (struct d_info *, enum gnu_v
-              struct demangle_component *);
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *, long);
-+d_make_template_param (struct d_info *, int);
- 
- static struct demangle_component *
- d_make_sub (struct d_info *, const char *, int);
-@@ -417,7 +424,7 @@ static struct demangle_component *d_unqu
- 
- static struct demangle_component *d_source_name (struct d_info *);
- 
--static long d_number (struct d_info *);
-+static int d_number (struct d_info *);
- 
- static struct demangle_component *d_identifier (struct d_info *, int);
- 
-@@ -1105,7 +1112,7 @@ d_make_dtor (struct d_info *di, enum gnu
- /* Add a new template parameter.  */
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *di, long i)
-+d_make_template_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1121,7 +1128,7 @@ d_make_template_param (struct d_info *di
- /* Add a new function parameter.  */
- 
- static struct demangle_component *
--d_make_function_param (struct d_info *di, long i)
-+d_make_function_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1595,7 +1602,7 @@ d_unqualified_name (struct d_info *di)
- static struct demangle_component *
- d_source_name (struct d_info *di)
- {
--  long len;
-+  int len;
-   struct demangle_component *ret;
- 
-   len = d_number (di);
-@@ -1608,12 +1615,12 @@ d_source_name (struct d_info *di)
- 
- /* number ::= [n] <(non-negative decimal integer)>  */
- 
--static long
-+static int
- d_number (struct d_info *di)
- {
-   int negative;
-   char peek;
--  long ret;
-+  int ret;
- 
-   negative = 0;
-   peek = d_peek_char (di);
-@@ -1840,7 +1847,7 @@ d_java_resource (struct d_info *di)
- {
-   struct demangle_component *p = NULL;
-   struct demangle_component *next = NULL;
--  long len, i;
-+  int len, i;
-   char c;
-   const char *str;
- 
-@@ -1982,7 +1989,7 @@ d_special_name (struct d_info *di)
- 	case 'C':
- 	  {
- 	    struct demangle_component *derived_type;
--	    long offset;
-+	    int offset;
- 	    struct demangle_component *base_type;
- 
- 	    derived_type = cplus_demangle_type (di);
-@@ -2905,10 +2912,10 @@ d_pointer_to_member_type (struct d_info
- 
- /* <non-negative number> _ */
- 
--static long
-+static int
- d_compact_number (struct d_info *di)
- {
--  long num;
-+  int num;
-   if (d_peek_char (di) == '_')
-     num = 0;
-   else if (d_peek_char (di) == 'n')
-@@ -2916,7 +2923,7 @@ d_compact_number (struct d_info *di)
-   else
-     num = d_number (di) + 1;
- 
--  if (! d_check_char (di, '_'))
-+  if (num < 0 || ! d_check_char (di, '_'))
-     return -1;
-   return num;
- }
-@@ -2928,7 +2935,7 @@ d_compact_number (struct d_info *di)
- static struct demangle_component *
- d_template_param (struct d_info *di)
- {
--  long param;
-+  int param;
- 
-   if (! d_check_char (di, 'T'))
-     return NULL;
-@@ -3130,9 +3137,10 @@ d_expression_1 (struct d_info *di)
- 	}
-       else
- 	{
--	  index = d_compact_number (di) + 1;
--	  if (index == 0)
-+	  index = d_compact_number (di);
-+	  if (index == INT_MAX || index == -1)
- 	    return NULL;
-+	  index ++;
- 	}
-       return d_make_function_param (di, index);
-     }
-@@ -3455,7 +3463,7 @@ d_local_name (struct d_info *di)
- static int
- d_discriminator (struct d_info *di)
- {
--  long discrim;
-+  int discrim;
- 
-   if (d_peek_char (di) != '_')
-     return 1;
-@@ -3511,7 +3519,7 @@ static struct demangle_component *
- d_unnamed_type (struct d_info *di)
- {
-   struct demangle_component *ret;
--  long num;
-+  int num;
- 
-   if (! d_check_char (di, 'U'))
-     return NULL;
-@@ -4037,10 +4045,10 @@ d_append_string (struct d_print_info *dp
- }
- 
- static inline void
--d_append_num (struct d_print_info *dpi, long l)
-+d_append_num (struct d_print_info *dpi, int l)
- {
-   char buf[25];
--  sprintf (buf,"%ld", l);
-+  sprintf (buf,"%d", l);
-   d_append_string (dpi, buf);
- }
- 
-Index: gcc-5.3.0/libiberty/testsuite/demangle-expected
-===================================================================
---- gcc-5.3.0.orig/libiberty/testsuite/demangle-expected
-+++ gcc-5.3.0/libiberty/testsuite/demangle-expected
-@@ -4357,12 +4357,22 @@ _QueueNotification_QueueController__$4PP
- _Z1fSsB3fooS_
- f(std::string[abi:foo], std::string[abi:foo])
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q.__0
- ::Q.(void)
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q10-__9cafebabe.
- cafebabe.::-(void)
-+#
-+# Tests integer overflow problem PR70492
-+
-+__vt_90000000000cafebabe
-+__vt_90000000000cafebabe
-+#
-+# Tests write access violation PR70498
-+
-+_Z80800000000000000000000
-+_Z80800000000000000000000
-Index: gcc-5.3.0/libiberty/ChangeLog
-===================================================================
---- gcc-5.3.0.orig/libiberty/ChangeLog
-+++ gcc-5.3.0/libiberty/ChangeLog
-@@ -1,3 +1,22 @@
-+2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
-+
-+   PR c++/70498
-+   * cp-demangle.c: Parse numbers as integer instead of long to avoid
-+   overflow after sanity checks. Include <limits.h> if available.
-+   (INT_MAX): Define if necessary.
-+   (d_make_template_param): Takes integer argument instead of long.
-+   (d_make_function_param): Likewise.
-+   (d_append_num): Likewise.
-+   (d_identifier): Likewise.
-+   (d_number): Parse as and return integer.
-+   (d_compact_number): Handle overflow.
-+   (d_source_name): Change variable type to integer for parsed number.
-+   (d_java_resource): Likewise.
-+   (d_special_name): Likewise.
-+   (d_discriminator): Likewise.
-+   (d_unnamed_type): Likewise.
-+   * testsuite/demangle-expected: Add regression test cases.
-+
- 2016-04-08  Marcel Böhme  <boehme.marcel@gmail.com>
- 
- 	PR c++/69687
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.4.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.3.inc
rename to meta/recipes-devtools/gcc/gcc-5.4.inc
index 8613a10..338530f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.4.inc
@@ -2,15 +2,15 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "5.3.0"
+PV = "5.4.0"
 
 #SNAP = "5-20150405"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "5.3.0"
+BINV = "5.4.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.3:${FILE_DIRNAME}/gcc-5.3/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.4:${FILE_DIRNAME}/gcc-5.4/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -89,18 +89,13 @@ SRC_URI = "\
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
            file://0059-libgcc-use-ldflags.patch \
-           file://0060-remove-prototypes-cfns.patch \
-	   file://0061-nios2-Make-assert-less-restrictive.patch \
-           file://CVE-2016-4488.patch \
-           file://CVE-2016-4489.patch \
-           file://CVE-2016-2226.patch \
-           file://CVE-2016-4490.patch \
 "
 
 BACKPORTS = ""
 
-SRC_URI[md5sum] = "c9616fd448f980259c31de613e575719"
-SRC_URI[sha256sum] = "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"
+SRC_URI[md5sum] = "4c626ac2a83ef30dfb9260e6f59c2b30"
+SRC_URI[sha256sum] = "608df76dec2d34de6558249d8af4cbee21eceddbcb580d666f7a5a583ca3303a"
+
 UPSTREAM_CHECK_REGEX = "gcc-(?P<pver>5\.\d+\.\d+).tar"
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-5.4/0002-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0002-uclibc-conf.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0002-uclibc-conf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-5.4/0003-gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0003-gcc-uclibc-locale-ctype_touplow_t.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0003-gcc-uclibc-locale-ctype_touplow_t.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-5.4/0004-uclibc-locale.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0004-uclibc-locale.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0004-uclibc-locale.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-5.4/0005-uclibc-locale-no__x.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0005-uclibc-locale-no__x.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0005-uclibc-locale-no__x.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-5.4/0006-uclibc-locale-wchar_fix.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0006-uclibc-locale-wchar_fix.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0006-uclibc-locale-wchar_fix.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-5.4/0007-uclibc-locale-update.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0007-uclibc-locale-update.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0007-uclibc-locale-update.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-5.4/0008-missing-execinfo_h.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0008-missing-execinfo_h.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-5.4/0009-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0009-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-5.4/0010-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0010-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-5.4/0011-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0011-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-5.4/0013-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0013-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-5.4/0014-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0014-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-5.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-5.4/0016-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0016-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-5.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-5.4/0018-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0018-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0019-libgcc-sjlj-check.patch b/meta/recipes-devtools/gcc/gcc-5.4/0019-libgcc-sjlj-check.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0019-libgcc-sjlj-check.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0019-libgcc-sjlj-check.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0020-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.4/0020-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0020-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0020-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0021-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-5.4/0021-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0021-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0021-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-5.4/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0023-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-5.4/0023-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0023-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0023-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0024-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-5.4/0024-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0024-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0024-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0025-libtool.patch b/meta/recipes-devtools/gcc/gcc-5.4/0025-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0025-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0025-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-5.4/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-5.4/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-5.4/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0029-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-5.4/0029-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0029-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0029-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-5.4/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-5.4/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0032-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-5.4/0032-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0032-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0032-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-5.4/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-5.4/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch b/meta/recipes-devtools/gcc/gcc-5.4/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-5.4/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-5.4/0037-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0037-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0038-fix-g-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.4/0038-fix-g-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0038-fix-g-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0038-fix-g-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-5.4/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-5.4/0040-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0040-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-5.4/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-5.4/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0042-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0043-libstdc-Support-musl.patch b/meta/recipes-devtools/gcc/gcc-5.4/0043-libstdc-Support-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0043-libstdc-Support-musl.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0043-libstdc-Support-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch b/meta/recipes-devtools/gcc/gcc-5.4/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch b/meta/recipes-devtools/gcc/gcc-5.4/0045-Support-for-arm-linux-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0045-Support-for-arm-linux-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch b/meta/recipes-devtools/gcc/gcc-5.4/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-5.4/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-5.4/0048-ssp_nonshared.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0048-ssp_nonshared.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch b/meta/recipes-devtools/gcc/gcc-5.4/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch b/meta/recipes-devtools/gcc/gcc-5.4/0050-powerpc-pass-secure-plt-to-the-linker.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0050-powerpc-pass-secure-plt-to-the-linker.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0050-powerpc-pass-secure-plt-to-the-linker.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch b/meta/recipes-devtools/gcc/gcc-5.4/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0052-nios2-use-ret-with-r31.patch b/meta/recipes-devtools/gcc/gcc-5.4/0052-nios2-use-ret-with-r31.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0052-nios2-use-ret-with-r31.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0052-nios2-use-ret-with-r31.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch b/meta/recipes-devtools/gcc/gcc-5.4/0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.4/0054-support-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0054-support-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0054-support-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-5.4/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch b/meta/recipes-devtools/gcc/gcc-5.4/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch b/meta/recipes-devtools/gcc/gcc-5.4/0057-unwind-fix-for-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0057-unwind-fix-for-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0058-fdebug-prefix-map-support-to-remap-relative-path.patch b/meta/recipes-devtools/gcc/gcc-5.4/0058-fdebug-prefix-map-support-to-remap-relative-path.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0058-fdebug-prefix-map-support-to-remap-relative-path.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0058-fdebug-prefix-map-support-to-remap-relative-path.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch b/meta/recipes-devtools/gcc/gcc-5.4/0059-libgcc-use-ldflags.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch
rename to meta/recipes-devtools/gcc/gcc-5.4/0059-libgcc-use-ldflags.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_5.3.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_5.3.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_5.3.bb b/meta/recipes-devtools/gcc/gcc-cross_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-cross_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_5.3.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_5.3.bb b/meta/recipes-devtools/gcc/gcc-runtime_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_5.3.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_5.3.bb b/meta/recipes-devtools/gcc/gcc-source_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_5.3.bb
rename to meta/recipes-devtools/gcc/gcc-source_5.4.bb
diff --git a/meta/recipes-devtools/gcc/gcc_5.3.bb b/meta/recipes-devtools/gcc/gcc_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_5.3.bb
rename to meta/recipes-devtools/gcc/gcc_5.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_5.3.bb b/meta/recipes-devtools/gcc/libgcc-initial_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_5.3.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_5.4.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_5.3.bb b/meta/recipes-devtools/gcc/libgcc_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_5.3.bb
rename to meta/recipes-devtools/gcc/libgcc_5.4.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_5.3.bb b/meta/recipes-devtools/gcc/libgfortran_5.4.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_5.3.bb
rename to meta/recipes-devtools/gcc/libgfortran_5.4.bb
-- 
2.9.0


