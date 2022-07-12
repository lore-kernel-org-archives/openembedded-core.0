Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5294CC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 11:57:09 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.8099.1657627024234410961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 04:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: skokkond@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 26CBuw3L003696
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 12 Jul 2022 04:56:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 26CBuwip002869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Jul 2022 04:56:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Jul 2022 04:56:58 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 12 Jul 2022 04:56:58 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22326)
	id 110B3900D66; Tue, 12 Jul 2022 04:56:58 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rwmacleod@gmail.com>, <umesh.kalappa0@gmail.com>, <pgowda.cve@gmail.com>,
        <shivams@gmail.com>
Subject: [master] glibc: stable 2.35 branch updates
Date: Tue, 12 Jul 2022 04:56:44 -0700
Message-ID: <20220712115644.189179-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 11:57:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167923

Below commits on glibc-2.35 development branch are updated.

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

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 5fea8b33ef..99017ce1d4 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "499a60179657d2945c6ad01bdac90e8427a6310e"
+SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.35.1


