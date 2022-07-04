Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82209CCA47F
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 07:18:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.69451.1656919119747861266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 00:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lIAvAMPZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id f85so4350169pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 00:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWrx1HAlEjw584ixwsuny+ZjlYYLNFNxa9S6rfpiTyY=;
        b=lIAvAMPZNbEG7eyyQMTCnglJTDnT0HL0iEvdqF3MTAe4mUx1EKzCTaGgl/clr9SdrA
         EEJvo80yU06BorrrtyXS5bY91QQRMIr2HQ0lQ4poqkgWUZbNaPf15OvlgYRsBdkStnhM
         qbLqdE9+GcWVxAPmCo2kmEsc/QKKxxSaGFltoVRqF7P+62VPSdTWu43Ijl6kPzA6kngj
         XyuA3vLBWY6rHuY7SYc/YxU9HVgQfd1IrXyBnhMEG9RcgFotJ43dUJLRUy5c6wr3mAHc
         ZoxOelNeK7ASWr2YRtEZeR1oNFKdh9ACduGBwlgZe+asdQnCIzyk5hyUpQ+SSaoLO9no
         1izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RWrx1HAlEjw584ixwsuny+ZjlYYLNFNxa9S6rfpiTyY=;
        b=yRV6OdgSvJb7uQ0Zorb2kNhLBL3OdC7YnXuD4JKgAq04+Gc2saJRsweHTQtVRraqry
         ZKRzUbbncn/dAX8JdeR7J97+qeBP5t+Eu5v2NA8qcmnmypAbIUCNwx8WsESAHR4f3+iD
         K2UvloHlg3WXoIKvzRgG1zbOsoT9xL8oyP4JoV6dQpMkRClplEnaMm1th9vkc546IeBn
         qoNMmo7Xjjj1s3lI/qeKgjZB9pD9CWv4BgOKqf41YW1jO4oX/Ux4tg+eItz8pbZJ99D+
         aFMGIWJ3BPM6ETWzciTBCdSevaJlfK55UJhvM9EZihyP05Ipt9s4+p9QtjLr1apHv9uW
         PXBQ==
X-Gm-Message-State: AJIora8ldj9qNaTHhRWdG3tKXoq/DEed2w8pRt3smxaUYPrlHPNdHdio
	oEIm89W3Dk6QeI0ERVNsOlW2oPStbKY=
X-Google-Smtp-Source: 
 AGRyM1u9z1f21elv3QJDA2vsBcLqE6/U8MTXhMkGneaxI43xw4DXgPDRB+B7tY3QP2l2EPK6y2xK3A==
X-Received: by 2002:a65:6a50:0:b0:3f6:4566:581d with SMTP id
 o16-20020a656a50000000b003f64566581dmr23437821pgu.122.1656919118827;
        Mon, 04 Jul 2022 00:18:38 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 m18-20020a634c52000000b0040c74f0cdb5sm19741769pgl.6.2022.07.04.00.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 00:18:38 -0700 (PDT)
From: Sundeep KOKKONDA <pgowda.cve@gmail.com>
X-Google-Original-From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com
Subject: [kirkstone] Binutils, Glibc: Updated with latest commits
Date: Mon,  4 Jul 2022 12:48:32 +0530
Message-Id: <20220704071832.3400931-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 07:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167596

From: Pgowda <pgowda.cve@gmail.com>

Below commits are on Binutils-2.38 and Glibc-2.35 development branches are updated.

glibc:
b6aade18a7 nss: handle stat failure in check_reload_and_get (BZ #28752)
ccac2d6d95 nss: add assert to DB_LOOKUP_FCT (BZ #28752)
9d8ae95604 nios2: Remove _dl_skip_args usage (BZ# 29187)
8468be8433 hppa: Remove _dl_skip_args usage (BZ# 29165)
99978cd42c NEWS: Add a bug fix entry for BZ #29225
97dd8b3f70 nptl: Fix __libc_cleanup_pop_restore asynchronous restore (BZ#29214)
0a1572b8bb powerpc: Fix VSX register number on __strncpy_power9 [BZ #29197]
fe9ca732ac socket: Fix mistyped define statement in socket/sys/socket.h (BZ #29225)
d7d1eebd4d iconv: Use 64 bit stat for gconv_parseconfdir (BZ# 29213)
c5a75ecec8 catgets: Use 64 bit stat for __open_catalog (BZ# 29211)
e429695805 inet: Use 64 bit stat for ruserpass (BZ# 29210)
6ea3c0aba4 socket: Use 64 bit stat for isfdtype (BZ# 29209)
9bcf5b12f8 posix: Use 64 bit stat for fpathconf (_PC_ASYNC_IO) (BZ# 29208)
45e5d0f533 posix: Use 64 bit stat for posix_fallocate fallback (BZ# 29207)
37c94dc999 misc: Use 64 bit stat for getusershell (BZ# 29204)
cb49c14183 misc: Use 64 bit stat for daemon (BZ# 29203)
6abb4002df Fix deadlock when pthread_atfork handler calls pthread_atfork or dlclose
ac87df8d75 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #29127]
478cd506ea string.h: fix __fortified_attr_access macro call [BZ #29162]
2b128a7d30 linux: Add a getauxval test [BZ #23293]
f5f7144dfc rtld: Use generic argv adjustment in ld.so [BZ #23293]
04892c543e S390: Enable static PIE
72d9dcfd16 csu: Implement and use _dl_early_allocate during static startup
b5ddf33c6e Linux: Introduce __brk_call for invoking the brk system call
2d05ba7f8e Linux: Implement a useful version of _startup_fatal
55ee3afa0d ia64: Always define IA64_USE_NEW_STUB as a flag macro
d66cca3fbb Linux: Define MMAP_CALL_INTERNAL
a7b122a7b4 i386: Honor I386_USE_SYSENTER for 6-argument Linux system calls
d1772c9376 i386: Remove OPTIMIZE_FOR_GCC_5 from Linux libc-do-syscall.S
58bb3aeaae elf: Remove __libc_init_secure
0a5c6c9d99 Linux: Consolidate auxiliary vector parsing (redo)
76304dfdaf Linux: Include <dl-auxv.h> in dl-sysdep.c only for SHARED
788eb21ff0 Revert "Linux: Consolidate auxiliary vector parsing"
150039ff07 Linux: Consolidate auxiliary vector parsing
3948c6ca89 Linux: Assume that NEED_DL_SYSINFO_DSO is always defined
29f833f5ab Linux: Remove DL_FIND_ARG_COMPONENTS
1695c5e0f6 Linux: Remove HAVE_AUX_SECURE, HAVE_AUX_XID, HAVE_AUX_PAGESIZE
756d583c9e elf: Merge dl-sysdep.c into the Linux version
2c4fc8e5ca x86: Optimize {str|wcs}rchr-evex
fdbc8439ac x86: Optimize {str|wcs}rchr-avx2
b05c0c8b28 x86: Optimize {str|wcs}rchr-sse2
bc35e22be4 x86-64: Fix SSE2 memcmp and SSSE3 memmove for x32
4d1841deb7 x86: Fix missing __wmemcmp def for disable-multiarch build
cee9939f67 x86: Cleanup page cross code in memcmp-avx2-movbe.S
0909286ffa x86: Remove memcmp-sse4.S
5a8df6485c x86: Optimize memcmp SSE2 in memcmp.S
af0865571a x86: Small improvements for wcslen
3b710e32d8 x86: Remove AVX str{n}casecmp
fc5d42bf82 x86: Add EVEX optimized str{n}casecmp
33fcf8344f x86: Add AVX2 optimized str{n}casecmp
3496d64d69 x86: Optimize str{n}casecmp TOLOWER logic in strcmp-sse42.S
283982b362 x86: Optimize str{n}casecmp TOLOWER logic in strcmp.S
420cd6f155 x86: Remove strspn-sse2.S and use the generic implementation
4b61d76521 x86: Remove strpbrk-sse2.S and use the generic implementation
2fef1961a7 x86: Remove strcspn-sse2.S and use the generic implementation
1ed2813eb1 x86: Optimize strspn in strspn-c.c
3214c878f2 x86: Optimize strcspn and strpbrk in strcspn-c.c
ff9772ac19 x86: Code cleanup in strchr-evex and comment justifying branch
424bbd4d25 x86: Code cleanup in strchr-avx2 and comment justifying branch
0a10b8b181 x86_64: Remove bcopy optimizations
f0a53588da x86-64: Define __memcmpeq in ld.so
a133623048 x86-64: Remove bzero weak alias in SS2 memset
18baf86f51 x86_64/multiarch: Sort sysdep_routines and put one entry per line
d422197a69 x86: Improve L to support L(XXX_SYMBOL (YYY, ZZZ))
58947e1fa5 fortify: Ensure that __glibc_fortify condition is a constant [BZ #29141]
28ea43f8d6 dlfcn: Implement the RTLD_DI_PHDR request type for dlinfo
78f82ab4ef manual: Document the dlinfo function
bbb017a2bb NEWS: Add a bug fix entry for BZ #29109
5c0d94d780 linux: Fix posix_spawn return code if clone fails (BZ#29109)
059e36d9ed x86: Fix fallback for wcsncmp_avx2 in strcmp-avx2.S [BZ #28896]
676f7bcf11 x86: Fix bug in strncmp-evex and strncmp-avx2 [BZ #28895]
c394d7e11a x86: Set .text section in memset-vec-unaligned-erms
de0cd691b2 x86-64: Optimize bzero
0bf9c8b5fe x86: Remove SSSE3 instruction for broadcast in memset.S (SSE2 Only)
58596411ad x86: Improve vec generation in memset-vec-unaligned-erms.S
36766c02af x86-64: Fix strcmp-evex.S
250e277797 x86-64: Fix strcmp-avx2.S
34ef810945 x86: Optimize strcmp-evex.S
b68e782f8e x86: Optimize strcmp-avx2.S
ec5b79aac7 manual: Clarify that abbreviations of long options are allowed
0bcba53020 Add HWCAP2_AFP, HWCAP2_RPRES from Linux 5.17 to AArch64 bits/hwcap.h
95759abbf3 Add SOL_MPTCP, SOL_MCTP from Linux 5.16 to bits/socket.h
eed29011f9 Update kernel version to 5.17 in tst-mman-consts.py
e72c363a15 Update kernel version to 5.16 in tst-mman-consts.py
edc06fdd62 Update syscall lists for Linux 5.17
dde291ab53 posix/glob.c: update from gnulib
7d96aa2d7d linux: Fix fchmodat with AT_SYMLINK_NOFOLLOW for 64 bit time_t (BZ#29097)
14b1e32a4d i386: Regenerate ulps
ef87599348 linux: Fix missing internal 64 bit time_t stat usage
10fe3cd309 elf: Fix DFS sorting algorithm for LD_TRACE_LOADED_OBJECTS with missing libraries (BZ #28868)
cb4d670d8f scripts/glibcelf.py: Mark as UNSUPPORTED on Python 3.5 and earlier
106b7e0e45 dlfcn: Do not use rtld_active () to determine ld.so state (bug 29078)
e5cf8ccca6 INSTALL: Rephrase -with-default-link documentation
c8ee1c85c0 misc: Fix rare fortify crash on wchar funcs. [BZ 29030]
499a601796 Default to --with-default-link=no (bug 25812)
70f1eecdc1 scripts: Add glibcelf.py module
d3feff2232 m68k: Handle fewer relocations for RTLD_BOOTSTRAP (#BZ29071)
68d3a9a696 nptl: Fix pthread_cancel cancelhandling atomic operations
8e8d46d598 mips: Fix mips64n32 64 bit time_t stat support (BZ#29069)
bd415684df hurd: Fix arbitrary error code
ba9c42ac0e nptl: Handle spurious EINTR when thread cancellation is disabled (BZ#29029)
6583d53445 S390: Add new s390 platform z16.
cc9a4a664f elf: Fix memory leak in _dl_find_object_update (bug 29062)
db03235895 NEWS: Move PLT tracking slowdown to glibc 2.35.
9be62976af hppa: Use END instead of PSEUDO_END in swapcontext.S
01d5214bb4 hppa: Implement swapcontext in assembler (bug 28960)
123bd1ec66 nss: Protect against errno changes in function lookup (bug 28953)
c54c5cd8e3 nss: Do not mention NSS test modules in <gnu/lib-names.h>
3149f47b80 io: Add fsync call in tst-stat
e30c1c73da nptl: Fix cleanups for stack grows up [BZ# 28899]
ca0570fee3 hppa: Fix warnings from _dl_lookup_address
d82d9cdff4 hppa: Revise gettext trampoline design
2631d3b3a6 hppa: Fix swapcontext
1f77081178 Fix elf/tst-audit2 on hppa
c60e6a458b hppa: Fix bind-now audit (BZ #28857)
90797f4972 localedef: Handle symbolic links when generating locale-archive
732dd3a63d localedata: Do not generate output if warnings were present.
3feecd8001 localedef: Update LC_MONETARY handling (Bug 28845)
a787325e83 NEWS: Add a bug fix entry for BZ #28688
264ad5d7d6 resolv: Fix tst-resolv tests for 2.35 ABIs and later
e247a3b118 elf: Replace tst-audit24bmod2.so with tst-audit24bmod2
1dd783fafd elf: Check invalid hole in PT_LOAD segments [BZ #28838]
3226ffde07 NEWS: Add a bug fix entry for BZ #28896
676f85759c x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
d001088e22 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
fd412fff6d x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #28896]
a30807b7db string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
f055faf801 linux: Use socket-constants-time64.h on tst-socket-timestamp-compat
491f2ef1f0 linux: fix accuracy of get_nprocs and get_nprocs_conf [BZ #28865]

binutils:
eed56ee299b Automatic date update in version.in
8e001ed8f2c Automatic date update in version.in
6b2a26c63ba Automatic date update in version.in
f0b5a0b5687 Automatic date update in version.in
5cc2bdc75bf Automatic date update in version.in
a06ed65fce8 Automatic date update in version.in
164daf3d644 Automatic date update in version.in
8b1dda80a5d Automatic date update in version.in
a4577d4f18f Automatic date update in version.in
614000f9d7b Automatic date update in version.in
ebd859d2cc4 Automatic date update in version.in
d2823f8c27c Automatic date update in version.in
949c11728ca Automatic date update in version.in
fe36d34f258 Automatic date update in version.in
0dae8bed68e Automatic date update in version.in
884e81eeb2c Automatic date update in version.in
d61f79dc474 Automatic date update in version.in
c86fbb1d885 Automatic date update in version.in
724f6468fb1 Automatic date update in version.in
aef4bdb2ed5 Automatic date update in version.in
db802012a3e Automatic date update in version.in
b28a1fd5055 Automatic date update in version.in
e1ea1dafff6 x86: Properly handle IFUNC function pointer reference
e35ea91a86c Automatic date update in version.in
1d81266d92e Automatic date update in version.in
b0530a6f3dc Automatic date update in version.in
81d275cb83f Automatic date update in version.in
794474ead0b Automatic date update in version.in
220b941f1e0 Automatic date update in version.in
912f2e4449d Automatic date update in version.in
93054037f1e Automatic date update in version.in
bc8ba34fc24 Automatic date update in version.in
af58abfd800 Automatic date update in version.in
d200cde62c8 Automatic date update in version.in
31fd6cd3d76 Automatic date update in version.in
475549dc3ac Automatic date update in version.in
ffc7aa903b9 AArch64: Enable FP16 by default for Armv9-A.
f20245c35f2 Automatic date update in version.in
39c6088537b Automatic date update in version.in
6a8f2255438 Automatic date update in version.in

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc        | 2 +-
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 080e905b6e..99017ce1d4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "24962427071fa532c3c48c918e9d64d719cc8a6c"
+SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc0a2a4054..c2502e0901 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
+SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


