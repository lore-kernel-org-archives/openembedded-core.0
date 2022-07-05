Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8AEC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:29 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.84423.1657028243767790285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kLMiugjq;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id i11so13639138qtr.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=K0sNnxh2igiD2Dqn0FptIXbxds9Bsfr9McV4iKckqv0=;
        b=kLMiugjq4es7fdzSBpk+c+DxJ6IsbVCSrgrjufGupmvpa8i8YWiB4XQsHgafb0bZ3W
         eq2eYbBpeadxYuTmVNEyYlrukW4cNq1oL5h0AkM7y3TSKsOjsd1o/TtzZ/ouDf4I+Wvz
         FEMwsibHUFfZxlWMIWOh0ZKy8Zk/c4kUH9lnhm3CX4cdW2hqn0qP79FIAegvlgefu5TC
         yDWjaF58QdOif3ULbeSY2tAx/dqP/gqkELp1hsB+YG7x3m+SUL1sVzjT7GVPDPRtHfo3
         VMgqsQXy8f5nIqM5YlUMmSpG9C5tJq+GcFeRuMIVTyMg/Nza0aQ2Gdt2eOKoWVyi0NE3
         nK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=K0sNnxh2igiD2Dqn0FptIXbxds9Bsfr9McV4iKckqv0=;
        b=SZ0z365zvLSoiK7VhfDZSGfpbqufiOztM2qyUoYLWO1QIXNAkaONRPesJtp/nYNBv8
         LbbMecwpXgSAPpSO8MSPItnzOUmQhG6W88TeNWONP6nBA780xpE0uMB+QEPGAl6nFDZF
         CHELKjssVD864ftbSiFv2iFyx3Xq42hKVEBjhwYOupGzNy1BSzv7WUPz+0CC3C0WG+DE
         QeKb7qNLeU8a1xWopy7gqkr6y5Vs+UYD3E/V8tPnfzUSYQBz33tnTYD3YnJzKcBzRAHX
         KlqHgnI5RVoc9SZvu7W8cjnRhRsiJYucCweqRDJ2tuq5kfgfAyfA7N5kql4bcOeaNmI7
         aW0A==
X-Gm-Message-State: AJIora9AlavGsX7knELsdd9Xz69UczLQ0KffY9Gm+VbOuF8j9UbjEqP2
	1aTZZybAmsDFBV36zNCreKc=
X-Google-Smtp-Source: 
 AGRyM1s4gMteAhZDS6lF4Brg/wAM2UeXw9+8cxL1CPf3doUpyzK4cCXcqzPCIJrlYVA3Dxh0aAUkKA==
X-Received: by 2002:a05:6214:c89:b0:470:b9e6:4908 with SMTP id
 r9-20020a0562140c8900b00470b9e64908mr32598241qvr.20.1657028242515;
        Tue, 05 Jul 2022 06:37:22 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:959d:d09a:db6c:637c?
 ([2607:fea8:95df:9730:959d:d09a:db6c:637c])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a05620a254700b006a65c58db99sm28559489qko.64.2022.07.05.06.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:37:21 -0700 (PDT)
Message-ID: <6b0dae2c-6623-e4fd-74a1-c715c687ecd7@gmail.com>
Date: Tue, 5 Jul 2022 09:37:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [OE-core] [kirkstone] Glibc: Glibc-2.35 Stable release updated
 with latest commits
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
 shivams@gmail.com
References: <20220705040139.165670-1-sundeep.kokkonda@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220705040139.165670-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:37:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167652

this is fine, although it would be good to know what testing was done on 
this

On 7/5/22 12:01 AM, Sundeep KOKKONDA wrote:
> Below commits on Glibc-2.35 development branch are updated.
>
> glibc:
> b6aade18a7 nss: handle stat failure in check_reload_and_get (BZ #28752)
> ccac2d6d95 nss: add assert to DB_LOOKUP_FCT (BZ #28752)
> 9d8ae95604 nios2: Remove _dl_skip_args usage (BZ# 29187)
> 8468be8433 hppa: Remove _dl_skip_args usage (BZ# 29165)
> 99978cd42c NEWS: Add a bug fix entry for BZ #29225
> 97dd8b3f70 nptl: Fix __libc_cleanup_pop_restore asynchronous restore (BZ#29214)
> 0a1572b8bb powerpc: Fix VSX register number on __strncpy_power9 [BZ #29197]
> fe9ca732ac socket: Fix mistyped define statement in socket/sys/socket.h (BZ #29225)
> d7d1eebd4d iconv: Use 64 bit stat for gconv_parseconfdir (BZ# 29213)
> c5a75ecec8 catgets: Use 64 bit stat for __open_catalog (BZ# 29211)
> e429695805 inet: Use 64 bit stat for ruserpass (BZ# 29210)
> 6ea3c0aba4 socket: Use 64 bit stat for isfdtype (BZ# 29209)
> 9bcf5b12f8 posix: Use 64 bit stat for fpathconf (_PC_ASYNC_IO) (BZ# 29208)
> 45e5d0f533 posix: Use 64 bit stat for posix_fallocate fallback (BZ# 29207)
> 37c94dc999 misc: Use 64 bit stat for getusershell (BZ# 29204)
> cb49c14183 misc: Use 64 bit stat for daemon (BZ# 29203)
> 6abb4002df Fix deadlock when pthread_atfork handler calls pthread_atfork or dlclose
> ac87df8d75 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #29127]
> 478cd506ea string.h: fix __fortified_attr_access macro call [BZ #29162]
> 2b128a7d30 linux: Add a getauxval test [BZ #23293]
> f5f7144dfc rtld: Use generic argv adjustment in ld.so [BZ #23293]
> 04892c543e S390: Enable static PIE
> 72d9dcfd16 csu: Implement and use _dl_early_allocate during static startup
> b5ddf33c6e Linux: Introduce __brk_call for invoking the brk system call
> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
> 55ee3afa0d ia64: Always define IA64_USE_NEW_STUB as a flag macro
> d66cca3fbb Linux: Define MMAP_CALL_INTERNAL
> a7b122a7b4 i386: Honor I386_USE_SYSENTER for 6-argument Linux system calls
> d1772c9376 i386: Remove OPTIMIZE_FOR_GCC_5 from Linux libc-do-syscall.S
> 58bb3aeaae elf: Remove __libc_init_secure
> 0a5c6c9d99 Linux: Consolidate auxiliary vector parsing (redo)
> 76304dfdaf Linux: Include <dl-auxv.h> in dl-sysdep.c only for SHARED
> 788eb21ff0 Revert "Linux: Consolidate auxiliary vector parsing"
> 150039ff07 Linux: Consolidate auxiliary vector parsing
> 3948c6ca89 Linux: Assume that NEED_DL_SYSINFO_DSO is always defined
> 29f833f5ab Linux: Remove DL_FIND_ARG_COMPONENTS
> 1695c5e0f6 Linux: Remove HAVE_AUX_SECURE, HAVE_AUX_XID, HAVE_AUX_PAGESIZE
> 756d583c9e elf: Merge dl-sysdep.c into the Linux version
> 2c4fc8e5ca x86: Optimize {str|wcs}rchr-evex
> fdbc8439ac x86: Optimize {str|wcs}rchr-avx2
> b05c0c8b28 x86: Optimize {str|wcs}rchr-sse2
> bc35e22be4 x86-64: Fix SSE2 memcmp and SSSE3 memmove for x32
> 4d1841deb7 x86: Fix missing __wmemcmp def for disable-multiarch build
> cee9939f67 x86: Cleanup page cross code in memcmp-avx2-movbe.S
> 0909286ffa x86: Remove memcmp-sse4.S
> 5a8df6485c x86: Optimize memcmp SSE2 in memcmp.S
> af0865571a x86: Small improvements for wcslen
> 3b710e32d8 x86: Remove AVX str{n}casecmp
> fc5d42bf82 x86: Add EVEX optimized str{n}casecmp
> 33fcf8344f x86: Add AVX2 optimized str{n}casecmp
> 3496d64d69 x86: Optimize str{n}casecmp TOLOWER logic in strcmp-sse42.S
> 283982b362 x86: Optimize str{n}casecmp TOLOWER logic in strcmp.S
> 420cd6f155 x86: Remove strspn-sse2.S and use the generic implementation
> 4b61d76521 x86: Remove strpbrk-sse2.S and use the generic implementation
> 2fef1961a7 x86: Remove strcspn-sse2.S and use the generic implementation
> 1ed2813eb1 x86: Optimize strspn in strspn-c.c
> 3214c878f2 x86: Optimize strcspn and strpbrk in strcspn-c.c
> ff9772ac19 x86: Code cleanup in strchr-evex and comment justifying branch
> 424bbd4d25 x86: Code cleanup in strchr-avx2 and comment justifying branch
> 0a10b8b181 x86_64: Remove bcopy optimizations
> f0a53588da x86-64: Define __memcmpeq in ld.so
> a133623048 x86-64: Remove bzero weak alias in SS2 memset
> 18baf86f51 x86_64/multiarch: Sort sysdep_routines and put one entry per line
> d422197a69 x86: Improve L to support L(XXX_SYMBOL (YYY, ZZZ))
> 58947e1fa5 fortify: Ensure that __glibc_fortify condition is a constant [BZ #29141]
> 28ea43f8d6 dlfcn: Implement the RTLD_DI_PHDR request type for dlinfo
> 78f82ab4ef manual: Document the dlinfo function
> bbb017a2bb NEWS: Add a bug fix entry for BZ #29109
> 5c0d94d780 linux: Fix posix_spawn return code if clone fails (BZ#29109)
> 059e36d9ed x86: Fix fallback for wcsncmp_avx2 in strcmp-avx2.S [BZ #28896]
> 676f7bcf11 x86: Fix bug in strncmp-evex and strncmp-avx2 [BZ #28895]
> c394d7e11a x86: Set .text section in memset-vec-unaligned-erms
> de0cd691b2 x86-64: Optimize bzero
> 0bf9c8b5fe x86: Remove SSSE3 instruction for broadcast in memset.S (SSE2 Only)
> 58596411ad x86: Improve vec generation in memset-vec-unaligned-erms.S
> 36766c02af x86-64: Fix strcmp-evex.S
> 250e277797 x86-64: Fix strcmp-avx2.S
> 34ef810945 x86: Optimize strcmp-evex.S
> b68e782f8e x86: Optimize strcmp-avx2.S
> ec5b79aac7 manual: Clarify that abbreviations of long options are allowed
> 0bcba53020 Add HWCAP2_AFP, HWCAP2_RPRES from Linux 5.17 to AArch64 bits/hwcap.h
> 95759abbf3 Add SOL_MPTCP, SOL_MCTP from Linux 5.16 to bits/socket.h
> eed29011f9 Update kernel version to 5.17 in tst-mman-consts.py
> e72c363a15 Update kernel version to 5.16 in tst-mman-consts.py
> edc06fdd62 Update syscall lists for Linux 5.17
> dde291ab53 posix/glob.c: update from gnulib
> 7d96aa2d7d linux: Fix fchmodat with AT_SYMLINK_NOFOLLOW for 64 bit time_t (BZ#29097)
> 14b1e32a4d i386: Regenerate ulps
> ef87599348 linux: Fix missing internal 64 bit time_t stat usage
> 10fe3cd309 elf: Fix DFS sorting algorithm for LD_TRACE_LOADED_OBJECTS with missing libraries (BZ #28868)
> cb4d670d8f scripts/glibcelf.py: Mark as UNSUPPORTED on Python 3.5 and earlier
> 106b7e0e45 dlfcn: Do not use rtld_active () to determine ld.so state (bug 29078)
> e5cf8ccca6 INSTALL: Rephrase -with-default-link documentation
> c8ee1c85c0 misc: Fix rare fortify crash on wchar funcs. [BZ 29030]
> 499a601796 Default to --with-default-link=no (bug 25812)
> 70f1eecdc1 scripts: Add glibcelf.py module
> d3feff2232 m68k: Handle fewer relocations for RTLD_BOOTSTRAP (#BZ29071)
> 68d3a9a696 nptl: Fix pthread_cancel cancelhandling atomic operations
> 8e8d46d598 mips: Fix mips64n32 64 bit time_t stat support (BZ#29069)
> bd415684df hurd: Fix arbitrary error code
> ba9c42ac0e nptl: Handle spurious EINTR when thread cancellation is disabled (BZ#29029)
> 6583d53445 S390: Add new s390 platform z16.
> cc9a4a664f elf: Fix memory leak in _dl_find_object_update (bug 29062)
> db03235895 NEWS: Move PLT tracking slowdown to glibc 2.35.
> 9be62976af hppa: Use END instead of PSEUDO_END in swapcontext.S
> 01d5214bb4 hppa: Implement swapcontext in assembler (bug 28960)
> 123bd1ec66 nss: Protect against errno changes in function lookup (bug 28953)
> c54c5cd8e3 nss: Do not mention NSS test modules in <gnu/lib-names.h>
> 3149f47b80 io: Add fsync call in tst-stat
> e30c1c73da nptl: Fix cleanups for stack grows up [BZ# 28899]
> ca0570fee3 hppa: Fix warnings from _dl_lookup_address
> d82d9cdff4 hppa: Revise gettext trampoline design
> 2631d3b3a6 hppa: Fix swapcontext
> 1f77081178 Fix elf/tst-audit2 on hppa
> c60e6a458b hppa: Fix bind-now audit (BZ #28857)
> 90797f4972 localedef: Handle symbolic links when generating locale-archive
> 732dd3a63d localedata: Do not generate output if warnings were present.
> 3feecd8001 localedef: Update LC_MONETARY handling (Bug 28845)
> a787325e83 NEWS: Add a bug fix entry for BZ #28688
> 264ad5d7d6 resolv: Fix tst-resolv tests for 2.35 ABIs and later
> e247a3b118 elf: Replace tst-audit24bmod2.so with tst-audit24bmod2
> 1dd783fafd elf: Check invalid hole in PT_LOAD segments [BZ #28838]
> 3226ffde07 NEWS: Add a bug fix entry for BZ #28896
> 676f85759c x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
> d001088e22 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
> fd412fff6d x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ #28896]
> a30807b7db string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
> f055faf801 linux: Use socket-constants-time64.h on tst-socket-timestamp-compat
> 491f2ef1f0 linux: fix accuracy of get_nprocs and get_nprocs_conf [BZ #28865]
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 080e905b6e..99017ce1d4 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.35/master"
>   PV = "2.35"
> -SRCREV_glibc ?= "24962427071fa532c3c48c918e9d64d719cc8a6c"
> +SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
>   SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167635): https://lists.openembedded.org/g/openembedded-core/message/167635
> Mute This Topic: https://lists.openembedded.org/mt/92179092/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

