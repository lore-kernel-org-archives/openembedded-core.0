Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 210987846C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:42:53 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 123so17073pga.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nfEhOVICjn5C7qRJ/NDPWBraSTe7pJ5hJ2o6D0QwdVo=;
	b=Pl+xCz3NB8ElR05ASYqqZsbdn3qxXWBCIwZOuTf2HHXOFhfDRlz08lzso34Mip0eL4
	hYiI4P4sQ3y5VhHklMeVIf9J3gntGHIMBtB9liPtxs9a83F1kEacIDNXdWOJ3U77QHIi
	yn5fNumTMujGXrgMELLtwgnM3JFoaXzl6bTssDXzI2SXtHZI1s/aBapcWiqE/JxMC50C
	/opzqIBuDXJtzJe+nUpUgETeoIa2VBGvNJWH2uCkeal8hBNjohOQX12AoGCrvuW4SoSj
	ly1KgGeThCddg2xlcCkFUrq9pMUniyXz0eRAND5nNzKs8HFyR+rgzBQa8fZ0U7Mpx/bu
	XdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nfEhOVICjn5C7qRJ/NDPWBraSTe7pJ5hJ2o6D0QwdVo=;
	b=hVVtg59ERY8H0wrD3kKevGMi1mIiWw7c4kOcLBlYV+WhmPftwFqgNsIs4f7+nIli8Z
	akXiH62a7PdZ4t5RNlgMiSx3Wn57nDo9mCQImlv9Xj1F1WPfNlYIIaSJktPsfOVmV5Gg
	PfNXhXkGW3DI9ReKU98QFfyAQOcQ065YVtGx9MMgZDhcZZaooWVmbRfrvggZuajO9FP3
	PNnPVwDkM6h0Xt8fHq+0QiNsHHGjyCaVNmvY0h3+Lf54FQJOO9gqF+u51s25JT3+0BD8
	tz4f3SbtbRNBtKa72N1rnrypCP+HKLtjDuBMk70cXpJ6a5YU3rNtomIZvIEhVvUqD7/p
	txjg==
X-Gm-Message-State: AHYfb5i7IwuyjVWYqg4kh1l77bLSh5nQmfC2HVoYbuUml8CnAJ4kOPuA
	ouNetM19kRL+Fc5s
X-Received: by 10.84.225.129 with SMTP id u1mr29979371plj.255.1502775774714;
	Mon, 14 Aug 2017 22:42:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	g1sm15512666pfk.92.2017.08.14.22.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Aug 2017 22:42:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 22:42:44 -0700
Message-Id: <20170815054244.29669-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] gcc: Upgrade to 7.2.0 release
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
X-List-Received-Date: Tue, 15 Aug 2017 05:42:54 -0000

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch |  81 -----------
 ...0-replace-struct-ucontext-with-ucontext_t.patch | 149 ---------------------
 .../gcc/{gcc-7.1.inc => gcc-7.2.inc}               |  14 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
 .../{gcc-7.1 => gcc-7.2}/0008-c99-snprintf.patch   |   0
 .../0009-gcc-poison-system-directories.patch       |   0
 .../0010-gcc-poison-dir-extend.patch               |   0
 .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0012-64-bit-multilib-hack.patch                |   0
 .../0013-optional-libstdc.patch                    |   0
 ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
 .../0015-COLLECT_GCC_OPTIONS.patch                 |   0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0017-fortran-cross-compile-hack.patch          |   0
 .../0018-cpp-honor-sysroot.patch                   |   0
 .../0019-MIPS64-Default-to-N64-ABI.patch           |   0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...0021-gcc-Fix-argument-list-too-long-error.patch |   0
 .../{gcc-7.1 => gcc-7.2}/0022-Disable-sdt.patch    |   0
 .../gcc/{gcc-7.1 => gcc-7.2}/0023-libtool.patch    |   0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...tilib-config-files-from-B-instead-of-usin.patch |   0
 ...-libdir-from-.la-which-usually-points-to-.patch |   0
 .../gcc/{gcc-7.1 => gcc-7.2}/0027-export-CPP.patch |   0
 ...AltiVec-generation-on-powepc-linux-target.patch |   0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
 ...Ensure-target-gcc-headers-can-be-included.patch |   0
 ...-t-build-with-disable-dependency-tracking.patch |   0
 ...h-host-directory-during-relink-if-inst_pr.patch |   0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
 .../0034-aarch64-Add-support-for-musl-ldso.patch   |   0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
 ...-various-_FOR_BUILD-and-related-variables.patch |   0
 .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
 ...shared-to-link-commandline-for-musl-targe.patch |   0
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
 .../0047-sync-gcc-stddef.h-with-musl.patch         |   0
 .../0048-gcc-Enable-static-PIE.patch               |   0
 .../fix-segmentation-fault-precompiled-hdr.patch   |   0
 ...s-canadian_7.1.bb => gcc-cross-canadian_7.2.bb} |   0
 ...oss-initial_7.1.bb => gcc-cross-initial_7.2.bb} |   0
 .../gcc/{gcc-cross_7.1.bb => gcc-cross_7.2.bb}     |   0
 ...-initial_7.1.bb => gcc-crosssdk-initial_7.2.bb} |   0
 .../{gcc-crosssdk_7.1.bb => gcc-crosssdk_7.2.bb}   |   0
 .../gcc/{gcc-runtime_7.1.bb => gcc-runtime_7.2.bb} |   0
 ...gcc-sanitizers_7.1.bb => gcc-sanitizers_7.2.bb} |   0
 .../gcc/{gcc-source_7.1.bb => gcc-source_7.2.bb}   |   0
 .../gcc/{gcc_7.1.bb => gcc_7.2.bb}                 |   0
 ...libgcc-initial_7.1.bb => libgcc-initial_7.2.bb} |   0
 .../gcc/{libgcc_7.1.bb => libgcc_7.2.bb}           |   0
 .../gcc/{libgfortran_7.1.bb => libgfortran_7.2.bb} |   0
 58 files changed, 6 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/gcc/{gcc-7.1.inc => gcc-7.2.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0008-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0009-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0010-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0012-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0013-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0015-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0017-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0018-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0019-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0021-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0022-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0023-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0027-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0030-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0034-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0036-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0038-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0047-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/0048-gcc-Enable-static-PIE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-7.1 => gcc-7.2}/fix-segmentation-fault-precompiled-hdr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_7.1.bb => gcc-cross-canadian_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_7.1.bb => gcc-cross-initial_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_7.1.bb => gcc-cross_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_7.1.bb => gcc-crosssdk-initial_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_7.1.bb => gcc-crosssdk_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_7.1.bb => gcc-runtime_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_7.1.bb => gcc-sanitizers_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_7.1.bb => gcc-source_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_7.1.bb => gcc_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_7.1.bb => libgcc-initial_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_7.1.bb => libgcc_7.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_7.1.bb => libgfortran_7.2.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
deleted file mode 100644
index 165258b5d3..0000000000
--- a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 4c07606bb77bbd30f02adb947d480516da3fa3f7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 11 Jun 2017 10:09:13 -0700
-Subject: [PATCH] libsanitizer: Use stack_t instead of struct sigaltstack
-
-https://reviews.llvm.org/D35246
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libsanitizer/sanitizer_common/sanitizer_linux.cc                    | 4 ++--
- libsanitizer/sanitizer_common/sanitizer_linux.h                     | 6 +++---
- .../sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc        | 3 ++-
- 3 files changed, 7 insertions(+), 6 deletions(-)
-
-
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
-===================================================================
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
-@@ -21,17 +21,15 @@
- #include "sanitizer_platform_limits_posix.h"
- 
- struct link_map;  // Opaque type returned by dlopen().
--struct sigaltstack;
- 
- namespace __sanitizer {
- // Dirent structure for getdents(). Note that this structure is different from
- // the one in <dirent.h>, which is used by readdir().
- struct linux_dirent;
- 
- // Syscall wrappers.
- uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int count);
--uptr internal_sigaltstack(const struct sigaltstack* ss,
--                          struct sigaltstack* oss);
-+uptr internal_sigaltstack(const void* ss, void* oss);
- uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
-     __sanitizer_sigset_t *oldset);
- 
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
-===================================================================
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
-@@ -631,8 +631,7 @@
- }
- #endif
- 
--uptr internal_sigaltstack(const struct sigaltstack *ss,
--                         struct sigaltstack *oss) {
-+uptr internal_sigaltstack(const void *ss, void *oss) {
-   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
- }
- 
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-===================================================================
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
-@@ -287,7 +287,7 @@
- 
-   // Alternate stack for signal handling.
-   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
--  struct sigaltstack handler_stack;
-+  stack_t handler_stack;
-   internal_memset(&handler_stack, 0, sizeof(handler_stack));
-   handler_stack.ss_sp = handler_stack_memory.data();
-   handler_stack.ss_size = kHandlerStackSize;
-Index: gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
-===================================================================
---- gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
-+++ gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
-@@ -288,7 +288,7 @@
- int ExtractResolvFDs(void *state, int *fds, int nfd) {
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
-   int cnt = 0;
--  __res_state *statp = (__res_state*)state;
-+  struct __res_state *statp = (struct __res_state*)state;
-   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
-     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
-       fds[cnt++] = statp->_u._ext.nssocks[i];
-
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch b/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
deleted file mode 100644
index e814992e44..0000000000
--- a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 7b3cb36ab07d0c36b500bb5d0548b190d4b5a9f6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Jun 2017 00:25:57 -0700
-Subject: [PATCH 50/50] replace struct ucontext with ucontext_t
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libgcc/config/aarch64/linux-unwind.h | 2 +-
- libgcc/config/alpha/linux-unwind.h   | 2 +-
- libgcc/config/bfin/linux-unwind.h    | 2 +-
- libgcc/config/i386/linux-unwind.h    | 4 ++--
- libgcc/config/pa/linux-unwind.h      | 2 +-
- libgcc/config/riscv/linux-unwind.h   | 2 +-
- libgcc/config/sh/linux-unwind.h      | 2 +-
- libgcc/config/tilepro/linux-unwind.h | 2 +-
- libgcc/config/xtensa/linux-unwind.h  | 2 +-
- 9 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/linux-unwind.h
-index d5d6980442f..d46d5f53be3 100644
---- a/libgcc/config/aarch64/linux-unwind.h
-+++ b/libgcc/config/aarch64/linux-unwind.h
-@@ -55,7 +55,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe
-   {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   };
- 
-   struct rt_sigframe *rt_;
-diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linux-unwind.h
-index a91a5f4fe26..7202516581d 100644
---- a/libgcc/config/alpha/linux-unwind.h
-+++ b/libgcc/config/alpha/linux-unwind.h
-@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       sc = &rt_->uc.uc_mcontext;
-     }
-diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-unwind.h
-index 9412c7652b8..37e9feb6965 100644
---- a/libgcc/config/bfin/linux-unwind.h
-+++ b/libgcc/config/bfin/linux-unwind.h
-@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *context,
- 	void *puc;
- 	char retcode[8];
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
- 
-       /* The void * cast is necessary to avoid an aliasing warning.
-diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-unwind.h
-index b1d5040a687..2009ad72260 100644
---- a/libgcc/config/i386/linux-unwind.h
-+++ b/libgcc/config/i386/linux-unwind.h
-@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *context,
-   if (*(unsigned char *)(pc+0) == 0x48
-       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
-     {
--      struct ucontext *uc_ = context->cfa;
-+      ucontext_t *uc_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-          because it does not alias anything.  */
-@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *context,
- 	siginfo_t *pinfo;
- 	void *puc;
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwind.h
-index 580c18dad69..c2c3409bcc1 100644
---- a/libgcc/config/pa/linux-unwind.h
-+++ b/libgcc/config/pa/linux-unwind.h
-@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *context,
-   struct sigcontext *sc;
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *frame;
- 
-   /* rt_sigreturn trampoline:
-diff --git a/libgcc/config/riscv/linux-unwind.h b/libgcc/config/riscv/linux-unwind.h
-index a051a2869d4..1c8aeff7ef0 100644
---- a/libgcc/config/riscv/linux-unwind.h
-+++ b/libgcc/config/riscv/linux-unwind.h
-@@ -42,7 +42,7 @@ riscv_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe
-   {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   };
- 
-   struct rt_sigframe *rt_;
-diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwind.h
-index 1038caeb5c3..a8c98220282 100644
---- a/libgcc/config/sh/linux-unwind.h
-+++ b/libgcc/config/sh/linux-unwind.h
-@@ -82,7 +82,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context,
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/linux-unwind.h
-index a8dc4405715..dba3b410279 100644
---- a/libgcc/config/tilepro/linux-unwind.h
-+++ b/libgcc/config/tilepro/linux-unwind.h
-@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *context,
-   struct rt_sigframe {
-     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* Return if this is not a signal handler.  */
-diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/linux-unwind.h
-index 67c272820d0..b37b8b31bbf 100644
---- a/libgcc/config/xtensa/linux-unwind.h
-+++ b/libgcc/config/xtensa/linux-unwind.h
-@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *context,
- 
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    struct ucontext_t uc;
-   } *rt_;
- 
-   /* movi a2, __NR_rt_sigreturn; syscall */
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-7.1.inc
rename to meta/recipes-devtools/gcc/gcc-7.2.inc
index 2d9ca82de9..796e6b1eef 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
@@ -2,13 +2,13 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "7.1.0"
+PV = "7.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "7.1.0"
+BINV = "7.2.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.1:${FILE_DIRNAME}/gcc-7.1/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 #RELEASE = "7-20170504"
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 #SRCREV = "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
 #BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
 #BASEURI ?= "http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.bz2"
@@ -73,15 +73,13 @@ SRC_URI = "\
            file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
-           file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
-           file://0050-replace-struct-ucontext-with-ucontext_t.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
 "
-SRC_URI[md5sum] = "6bf56a2bca9dac9dbbf8e8d1036964a8"
-SRC_URI[sha256sum] = "8a8136c235f64c6fef69cac0d73a46a1a09bb250776a050aec8f9fc880bebc17"
+SRC_URI[md5sum] = "ff370482573133a7fcdd96cd2f552292"
+SRC_URI[sha256sum] = "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch b/meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch
rename to meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.1.bb b/meta/recipes-devtools/gcc/gcc-cross_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_7.1.bb b/meta/recipes-devtools/gcc/gcc-source_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_7.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_7.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc_7.1.bb b/meta/recipes-devtools/gcc/gcc_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_7.1.bb
rename to meta/recipes-devtools/gcc/gcc_7.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_7.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_7.1.bb b/meta/recipes-devtools/gcc/libgcc_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_7.1.bb
rename to meta/recipes-devtools/gcc/libgcc_7.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_7.1.bb b/meta/recipes-devtools/gcc/libgfortran_7.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_7.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_7.2.bb
-- 
2.14.1


