Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D856D77CF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:04:05 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id n4so37012196pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=myfl+zjOP/QaABd3L93ELq1/CQhDrGu0uBLh02sCHPk=;
	b=vTc5rJwgnnOd33LBFdzaAs+w2RSSY4FfOcnx8I0/csHU8mJzzCMUC/msnFCINeSh6q
	pkhctMXju2E5j2wRKV+55esUau+42GJI1XWlilMz1mGUIGhw7eTEXIQo1p+Y2/t21Vzd
	e9fXwOMvrSMOxs+3lPbAJWWna8wG/M8UW2Kc//ztQA/1zNYs7P4H4Ep4cuSQSQlzFkCj
	EnhbllEZQrt8xZ03hwQTn+0NOr+tO83LAF/mixt2OhRvOxFA0hxQVT64EYHGrg1ubud5
	SQ0zYJdt3N0efkA78heo+qg7H6FW36ozHPRdkzQDMZWMDbsvlqqD2dOdmLG//Q/qBvZr
	HI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=myfl+zjOP/QaABd3L93ELq1/CQhDrGu0uBLh02sCHPk=;
	b=YypWoxHaWgZX+NFWJvriSyaw0cZnXFcdQIkD1ML2wYSEsOfVAjbAHfdUtNasLa1Iwd
	nrhYDGBA7uAVsVwTuAhyJaHZaULYUKrN2dkKxhL8+nqcR+XvRxrfbuky5zSrf61+Dv1Q
	m+zdH7aoXDVBROEXYPpYIoVqkOo7dtZzhG5ExRORbEfzKFB67K63uCq+dApY6OpAs40I
	DXmMh5Hvg2iDzzRYS+0vB3XCsb5tgd0fA1DIt95ByyfG/jU6MdZmf6gIeovHNMAsPS5X
	l4qXPm1Iw35V3EWDlsFBRnO6E44tmotGjFB1x/XHFGeQ5yR0HtT2m6KlqCBHetASEudQ
	Gpmw==
X-Gm-Message-State: AHYfb5i6okKwkmkLocioom7j3xwq+20Dy88e2jWq+/TFLqQumxa7pGAV
	bN6ULfCNy/I0h7o28Qv+72tH/ZcySw==
X-Received: by 10.84.138.129 with SMTP id 1mr19927220plp.223.1503324246756;
	Mon, 21 Aug 2017 07:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20170815054244.29669-1-raj.khem@gmail.com>
	<CA+chaQcMh-o75055KntpT7kjuB9yuNsniLaR=2By0Yhg1sXCqQ@mail.gmail.com>
	<CAMKF1sqpqWKR=3RxuJX_e0ftRrNDLCZ5bzi43EWcK+mtL6z0ow@mail.gmail.com>
	<CA+chaQfBHKc2CmQt-ZacNJ+5zPMB4mj73NFZrQxpwMG+2_xDQQ@mail.gmail.com>
In-Reply-To: <CA+chaQfBHKc2CmQt-ZacNJ+5zPMB4mj73NFZrQxpwMG+2_xDQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Aug 2017 14:03:55 +0000
Message-ID: <CAMKF1spcRYLyfrr64NW1-H=3OH3rOXO4teZggihfr9SdL-AGjw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Upgrade to 7.2.0 release
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
X-List-Received-Date: Mon, 21 Aug 2017 14:04:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c14536cb5d472055743f321"

--94eb2c14536cb5d472055743f321
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 12:12 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> Still reproducible without thumb:
> http://errors.yoctoproject.org/Errors/Details/152666/
>
> this might be also triggered by this upgrade:
> http://errors.yoctoproject.org/Errors/Details/152770/
>

May be passing -cpperraswarn to swig will help

> <http://errors.yoctoproject.org/Errors/Details/152770/>
>
> or from glibc final upgrade or something else, hard to know when exactly
> it started as previous world builds were pretty much useless with all those
> openssl caused issues.
>
> On Mon, Aug 21, 2017 at 2:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> On Sun, Aug 20, 2017 at 5:31 PM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> Seems like python-matplotlib reliably triggers ICE in this version of
>>> gcc:
>>>
>>> http://errors.yoctoproject.org/Errors/Details/152664/
>>>
>>> I think I haven't seen this one with 7.1.
>>>
>>
>> Can you try disabling thumb mode and see if this works ?
>>
>>>
>>> On Tue, Aug 15, 2017 at 7:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> Drop upstreamed patches
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  ...r-Use-stack_t-instead-of-struct-sigaltsta.patch |  81 -----------
>>>>  ...0-replace-struct-ucontext-with-ucontext_t.patch | 149
>>>> ---------------------
>>>>  .../gcc/{gcc-7.1.inc => gcc-7.2.inc}               |  14 +-
>>>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
>>>>  .../{gcc-7.1 => gcc-7.2}/0008-c99-snprintf.patch   |   0
>>>>  .../0009-gcc-poison-system-directories.patch       |   0
>>>>  .../0010-gcc-poison-dir-extend.patch               |   0
>>>>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
>>>>  .../0012-64-bit-multilib-hack.patch                |   0
>>>>  .../0013-optional-libstdc.patch                    |   0
>>>>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
>>>>  .../0015-COLLECT_GCC_OPTIONS.patch                 |   0
>>>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
>>>>  .../0017-fortran-cross-compile-hack.patch          |   0
>>>>  .../0018-cpp-honor-sysroot.patch                   |   0
>>>>  .../0019-MIPS64-Default-to-N64-ABI.patch           |   0
>>>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
>>>>  ...0021-gcc-Fix-argument-list-too-long-error.patch |   0
>>>>  .../{gcc-7.1 => gcc-7.2}/0022-Disable-sdt.patch    |   0
>>>>  .../gcc/{gcc-7.1 => gcc-7.2}/0023-libtool.patch    |   0
>>>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
>>>>  ...tilib-config-files-from-B-instead-of-usin.patch |   0
>>>>  ...-libdir-from-.la-which-usually-points-to-.patch |   0
>>>>  .../gcc/{gcc-7.1 => gcc-7.2}/0027-export-CPP.patch |   0
>>>>  ...AltiVec-generation-on-powepc-linux-target.patch |   0
>>>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
>>>>  ...Ensure-target-gcc-headers-can-be-included.patch |   0
>>>>  ...-t-build-with-disable-dependency-tracking.patch |   0
>>>>  ...h-host-directory-during-relink-if-inst_pr.patch |   0
>>>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
>>>>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |   0
>>>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
>>>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
>>>>  ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
>>>>  ...-various-_FOR_BUILD-and-related-variables.patch |   0
>>>>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
>>>>  ...shared-to-link-commandline-for-musl-targe.patch |   0
>>>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
>>>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
>>>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
>>>>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
>>>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
>>>>  ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
>>>>  .../0047-sync-gcc-stddef.h-with-musl.patch         |   0
>>>>  .../0048-gcc-Enable-static-PIE.patch               |   0
>>>>  .../fix-segmentation-fault-precompiled-hdr.patch   |   0
>>>>  ...s-canadian_7.1.bb => gcc-cross-canadian_7.2.bb} |   0
>>>>  ...oss-initial_7.1.bb => gcc-cross-initial_7.2.bb} |   0
>>>>  .../gcc/{gcc-cross_7.1.bb => gcc-cross_7.2.bb}     |   0
>>>>  ...-initial_7.1.bb => gcc-crosssdk-initial_7.2.bb} |   0
>>>>  .../{gcc-crosssdk_7.1.bb => gcc-crosssdk_7.2.bb}   |   0
>>>>  .../gcc/{gcc-runtime_7.1.bb => gcc-runtime_7.2.bb} |   0
>>>>  ...gcc-sanitizers_7.1.bb => gcc-sanitizers_7.2.bb} |   0
>>>>  .../gcc/{gcc-source_7.1.bb => gcc-source_7.2.bb}   |   0
>>>>  .../gcc/{gcc_7.1.bb => gcc_7.2.bb}                 |   0
>>>>  ...libgcc-initial_7.1.bb => libgcc-initial_7.2.bb} |   0
>>>>  .../gcc/{libgcc_7.1.bb => libgcc_7.2.bb}           |   0
>>>>  .../gcc/{libgfortran_7.1.bb => libgfortran_7.2.bb} |   0
>>>>  58 files changed, 6 insertions(+), 238 deletions(-)
>>>>  delete mode 100644
>>>> meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
>>>>  delete mode 100644
>>>> meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1.inc => gcc-7.2.inc} (91%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0008-c99-snprintf.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0009-gcc-poison-system-directories.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0010-gcc-poison-dir-extend.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0012-64-bit-multilib-hack.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0013-optional-libstdc.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0015-COLLECT_GCC_OPTIONS.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0017-fortran-cross-compile-hack.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0018-cpp-honor-sysroot.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0019-MIPS64-Default-to-N64-ABI.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0021-gcc-Fix-argument-list-too-long-error.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0022-Disable-sdt.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0023-libtool.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0027-export-CPP.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0030-Ensure-target-gcc-headers-can-be-included.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0034-aarch64-Add-support-for-musl-ldso.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0036-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0038-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0047-sync-gcc-stddef.h-with-musl.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/0048-gcc-Enable-static-PIE.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-7.1 =>
>>>> gcc-7.2}/fix-segmentation-fault-precompiled-hdr.patch (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_7.1.bb =>
>>>> gcc-cross-canadian_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_7.1.bb =>
>>>> gcc-cross-initial_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-cross_7.1.bb => gcc-cross_7.2.bb}
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_7.1.bb =>
>>>> gcc-crosssdk-initial_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_7.1.bb =>
>>>> gcc-crosssdk_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-runtime_7.1.bb =>
>>>> gcc-runtime_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_7.1.bb =>
>>>> gcc-sanitizers_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc-source_7.1.bb =>
>>>> gcc-source_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{gcc_7.1.bb => gcc_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{libgcc-initial_7.1.bb =>
>>>> libgcc-initial_7.2.bb} (100%)
>>>>  rename meta/recipes-devtools/gcc/{libgcc_7.1.bb => libgcc_7.2.bb}
>>>> (100%)
>>>>  rename meta/recipes-devtools/gcc/{libgfortran_7.1.bb =>
>>>> libgfortran_7.2.bb} (100%)
>>>>
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
>>>> deleted file mode 100644
>>>> index 165258b5d3..0000000000
>>>> ---
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
>>>> +++ /dev/null
>>>> @@ -1,81 +0,0 @@
>>>> -From 4c07606bb77bbd30f02adb947d480516da3fa3f7 Mon Sep 17 00:00:00 2001
>>>> -From: Khem Raj <raj.khem@gmail.com>
>>>> -Date: Sun, 11 Jun 2017 10:09:13 -0700
>>>> -Subject: [PATCH] libsanitizer: Use stack_t instead of struct
>>>> sigaltstack
>>>> -
>>>> -https://reviews.llvm.org/D35246
>>>> -
>>>> -Upstream-Status: Submitted
>>>> -
>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ----
>>>> - libsanitizer/sanitizer_common/sanitizer_linux.cc                    |
>>>> 4 ++--
>>>> - libsanitizer/sanitizer_common/sanitizer_linux.h                     |
>>>> 6 +++---
>>>> - .../sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc        |
>>>> 3 ++-
>>>> - 3 files changed, 7 insertions(+), 6 deletions(-)
>>>> -
>>>> -
>>>> -Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
>>>> -===================================================================
>>>> ---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
>>>> -+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h
>>>> -@@ -21,17 +21,15 @@
>>>> - #include "sanitizer_platform_limits_posix.h"
>>>> -
>>>> - struct link_map;  // Opaque type returned by dlopen().
>>>> --struct sigaltstack;
>>>> -
>>>> - namespace __sanitizer {
>>>> - // Dirent structure for getdents(). Note that this structure is
>>>> different from
>>>> - // the one in <dirent.h>, which is used by readdir().
>>>> - struct linux_dirent;
>>>> -
>>>> - // Syscall wrappers.
>>>> - uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned
>>>> int count);
>>>> --uptr internal_sigaltstack(const struct sigaltstack* ss,
>>>> --                          struct sigaltstack* oss);
>>>> -+uptr internal_sigaltstack(const void* ss, void* oss);
>>>> - uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,
>>>> -     __sanitizer_sigset_t *oldset);
>>>> -
>>>> -Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
>>>> -===================================================================
>>>> ---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
>>>> -+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
>>>> -@@ -631,8 +631,7 @@
>>>> - }
>>>> - #endif
>>>> -
>>>> --uptr internal_sigaltstack(const struct sigaltstack *ss,
>>>> --                         struct sigaltstack *oss) {
>>>> -+uptr internal_sigaltstack(const void *ss, void *oss) {
>>>> -   return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr)oss);
>>>> - }
>>>> -
>>>> -Index:
>>>> gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
>>>> -===================================================================
>>>> ----
>>>> gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
>>>> -+++
>>>> gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc
>>>> -@@ -287,7 +287,7 @@
>>>> -
>>>> -   // Alternate stack for signal handling.
>>>> -   InternalScopedBuffer<char> handler_stack_memory(kHandlerStackSize);
>>>> --  struct sigaltstack handler_stack;
>>>> -+  stack_t handler_stack;
>>>> -   internal_memset(&handler_stack, 0, sizeof(handler_stack));
>>>> -   handler_stack.ss_sp = handler_stack_memory.data();
>>>> -   handler_stack.ss_size = kHandlerStackSize;
>>>> -Index: gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
>>>> -===================================================================
>>>> ---- gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
>>>> -+++ gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc
>>>> -@@ -288,7 +288,7 @@
>>>> - int ExtractResolvFDs(void *state, int *fds, int nfd) {
>>>> - #if SANITIZER_LINUX && !SANITIZER_ANDROID
>>>> -   int cnt = 0;
>>>> --  __res_state *statp = (__res_state*)state;
>>>> -+  struct __res_state *statp = (struct __res_state*)state;
>>>> -   for (int i = 0; i < MAXNS && cnt < nfd; i++) {
>>>> -     if (statp->_u._ext.nsaddrs[i] && statp->_u._ext.nssocks[i] != -1)
>>>> -       fds[cnt++] = statp->_u._ext.nssocks[i];
>>>> -
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
>>>> deleted file mode 100644
>>>> index e814992e44..0000000000
>>>> ---
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
>>>> +++ /dev/null
>>>> @@ -1,149 +0,0 @@
>>>> -From 7b3cb36ab07d0c36b500bb5d0548b190d4b5a9f6 Mon Sep 17 00:00:00 2001
>>>> -From: Khem Raj <raj.khem@gmail.com>
>>>> -Date: Wed, 28 Jun 2017 00:25:57 -0700
>>>> -Subject: [PATCH 50/50] replace struct ucontext with ucontext_t
>>>> -
>>>> -Upstream-Status: Pending
>>>> -
>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ----
>>>> - libgcc/config/aarch64/linux-unwind.h | 2 +-
>>>> - libgcc/config/alpha/linux-unwind.h   | 2 +-
>>>> - libgcc/config/bfin/linux-unwind.h    | 2 +-
>>>> - libgcc/config/i386/linux-unwind.h    | 4 ++--
>>>> - libgcc/config/pa/linux-unwind.h      | 2 +-
>>>> - libgcc/config/riscv/linux-unwind.h   | 2 +-
>>>> - libgcc/config/sh/linux-unwind.h      | 2 +-
>>>> - libgcc/config/tilepro/linux-unwind.h | 2 +-
>>>> - libgcc/config/xtensa/linux-unwind.h  | 2 +-
>>>> - 9 files changed, 10 insertions(+), 10 deletions(-)
>>>> -
>>>> -diff --git a/libgcc/config/aarch64/linux-unwind.h
>>>> b/libgcc/config/aarch64/linux-unwind.h
>>>> -index d5d6980442f..d46d5f53be3 100644
>>>> ---- a/libgcc/config/aarch64/linux-unwind.h
>>>> -+++ b/libgcc/config/aarch64/linux-unwind.h
>>>> -@@ -55,7 +55,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -   struct rt_sigframe
>>>> -   {
>>>> -     siginfo_t info;
>>>> --    struct ucontext uc;
>>>> -+    ucontext_t uc;
>>>> -   };
>>>> -
>>>> -   struct rt_sigframe *rt_;
>>>> -diff --git a/libgcc/config/alpha/linux-unwind.h
>>>> b/libgcc/config/alpha/linux-unwind.h
>>>> -index a91a5f4fe26..7202516581d 100644
>>>> ---- a/libgcc/config/alpha/linux-unwind.h
>>>> -+++ b/libgcc/config/alpha/linux-unwind.h
>>>> -@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -     {
>>>> -       struct rt_sigframe {
>>>> -       siginfo_t info;
>>>> --      struct ucontext uc;
>>>> -+      ucontext_t uc;
>>>> -       } *rt_ = context->cfa;
>>>> -       sc = &rt_->uc.uc_mcontext;
>>>> -     }
>>>> -diff --git a/libgcc/config/bfin/linux-unwind.h
>>>> b/libgcc/config/bfin/linux-unwind.h
>>>> -index 9412c7652b8..37e9feb6965 100644
>>>> ---- a/libgcc/config/bfin/linux-unwind.h
>>>> -+++ b/libgcc/config/bfin/linux-unwind.h
>>>> -@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -       void *puc;
>>>> -       char retcode[8];
>>>> -       siginfo_t info;
>>>> --      struct ucontext uc;
>>>> -+      ucontext_t uc;
>>>> -       } *rt_ = context->cfa;
>>>> -
>>>> -       /* The void * cast is necessary to avoid an aliasing warning.
>>>> -diff --git a/libgcc/config/i386/linux-unwind.h
>>>> b/libgcc/config/i386/linux-unwind.h
>>>> -index b1d5040a687..2009ad72260 100644
>>>> ---- a/libgcc/config/i386/linux-unwind.h
>>>> -+++ b/libgcc/config/i386/linux-unwind.h
>>>> -@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -   if (*(unsigned char *)(pc+0) == 0x48
>>>> -       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
>>>> -     {
>>>> --      struct ucontext *uc_ = context->cfa;
>>>> -+      ucontext_t *uc_ = context->cfa;
>>>> -       /* The void * cast is necessary to avoid an aliasing warning.
>>>> -          The aliasing warning is correct, but should not be a problem
>>>> -          because it does not alias anything.  */
>>>> -@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -       siginfo_t *pinfo;
>>>> -       void *puc;
>>>> -       siginfo_t info;
>>>> --      struct ucontext uc;
>>>> -+      ucontext_t uc;
>>>> -       } *rt_ = context->cfa;
>>>> -       /* The void * cast is necessary to avoid an aliasing warning.
>>>> -          The aliasing warning is correct, but should not be a problem
>>>> -diff --git a/libgcc/config/pa/linux-unwind.h
>>>> b/libgcc/config/pa/linux-unwind.h
>>>> -index 580c18dad69..c2c3409bcc1 100644
>>>> ---- a/libgcc/config/pa/linux-unwind.h
>>>> -+++ b/libgcc/config/pa/linux-unwind.h
>>>> -@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -   struct sigcontext *sc;
>>>> -   struct rt_sigframe {
>>>> -     siginfo_t info;
>>>> --    struct ucontext uc;
>>>> -+    ucontext_t uc;
>>>> -   } *frame;
>>>> -
>>>> -   /* rt_sigreturn trampoline:
>>>> -diff --git a/libgcc/config/riscv/linux-unwind.h
>>>> b/libgcc/config/riscv/linux-unwind.h
>>>> -index a051a2869d4..1c8aeff7ef0 100644
>>>> ---- a/libgcc/config/riscv/linux-unwind.h
>>>> -+++ b/libgcc/config/riscv/linux-unwind.h
>>>> -@@ -42,7 +42,7 @@ riscv_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -   struct rt_sigframe
>>>> -   {
>>>> -     siginfo_t info;
>>>> --    struct ucontext uc;
>>>> -+    ucontext_t uc;
>>>> -   };
>>>> -
>>>> -   struct rt_sigframe *rt_;
>>>> -diff --git a/libgcc/config/sh/linux-unwind.h
>>>> b/libgcc/config/sh/linux-unwind.h
>>>> -index 1038caeb5c3..a8c98220282 100644
>>>> ---- a/libgcc/config/sh/linux-unwind.h
>>>> -+++ b/libgcc/config/sh/linux-unwind.h
>>>> -@@ -82,7 +82,7 @@ sh_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -     {
>>>> -       struct rt_sigframe {
>>>> -       siginfo_t info;
>>>> --      struct ucontext uc;
>>>> -+      ucontext_t uc;
>>>> -       } *rt_ = context->cfa;
>>>> -       /* The void * cast is necessary to avoid an aliasing warning.
>>>> -          The aliasing warning is correct, but should not be a problem
>>>> -diff --git a/libgcc/config/tilepro/linux-unwind.h
>>>> b/libgcc/config/tilepro/linux-unwind.h
>>>> -index a8dc4405715..dba3b410279 100644
>>>> ---- a/libgcc/config/tilepro/linux-unwind.h
>>>> -+++ b/libgcc/config/tilepro/linux-unwind.h
>>>> -@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -   struct rt_sigframe {
>>>> -     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
>>>> -     siginfo_t info;
>>>> --    struct ucontext uc;
>>>> -+    ucontext_t uc;
>>>> -   } *rt_;
>>>> -
>>>> -   /* Return if this is not a signal handler.  */
>>>> -diff --git a/libgcc/config/xtensa/linux-unwind.h
>>>> b/libgcc/config/xtensa/linux-unwind.h
>>>> -index 67c272820d0..b37b8b31bbf 100644
>>>> ---- a/libgcc/config/xtensa/linux-unwind.h
>>>> -+++ b/libgcc/config/xtensa/linux-unwind.h
>>>> -@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context
>>>> *context,
>>>> -
>>>> -   struct rt_sigframe {
>>>> -     siginfo_t info;
>>>> --    struct ucontext uc;
>>>> -+    struct ucontext_t uc;
>>>> -   } *rt_;
>>>> -
>>>> -   /* movi a2, __NR_rt_sigreturn; syscall */
>>>> ---
>>>> -2.13.2
>>>> -
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc
>>>> b/meta/recipes-devtools/gcc/gcc-7.2.inc
>>>> similarity index 91%
>>>> rename from meta/recipes-devtools/gcc/gcc-7.1.inc
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2.inc
>>>> index 2d9ca82de9..796e6b1eef 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-7.1.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
>>>> @@ -2,13 +2,13 @@ require gcc-common.inc
>>>>
>>>>  # Third digit in PV should be incremented after a minor release
>>>>
>>>> -PV = "7.1.0"
>>>> +PV = "7.2.0"
>>>>
>>>>  # BINV should be incremented to a revision after a minor gcc release
>>>>
>>>> -BINV = "7.1.0"
>>>> +BINV = "7.2.0"
>>>>
>>>> -FILESEXTRAPATHS =.
>>>> "${FILE_DIRNAME}/gcc-7.1:${FILE_DIRNAME}/gcc-7.1/backport:"
>>>> +FILESEXTRAPATHS =.
>>>> "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
>>>>
>>>>  DEPENDS =+ "mpfr gmp libmpc zlib"
>>>>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>>>> @@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "\
>>>>  "
>>>>
>>>>  #RELEASE = "7-20170504"
>>>> -BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>>>> +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
>>>>  #SRCREV = "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
>>>>  #BASEURI ?= "git://
>>>> github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
>>>>  #BASEURI ?= "
>>>> http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.bz2
>>>> "
>>>> @@ -73,15 +73,13 @@ SRC_URI = "\
>>>>
>>>> file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
>>>>             file://0047-sync-gcc-stddef.h-with-musl.patch \
>>>>             file://0048-gcc-Enable-static-PIE.patch \
>>>> -
>>>>  file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
>>>> -           file://0050-replace-struct-ucontext-with-ucontext_t.patch \
>>>>             file://fix-segmentation-fault-precompiled-hdr.patch \
>>>>             ${BACKPORTS} \
>>>>  "
>>>>  BACKPORTS = "\
>>>>  "
>>>> -SRC_URI[md5sum] = "6bf56a2bca9dac9dbbf8e8d1036964a8"
>>>> -SRC_URI[sha256sum] =
>>>> "8a8136c235f64c6fef69cac0d73a46a1a09bb250776a050aec8f9fc880bebc17"
>>>> +SRC_URI[md5sum] = "ff370482573133a7fcdd96cd2f552292"
>>>> +SRC_URI[sha256sum] =
>>>> "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"
>>>>
>>>>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>>>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-directories.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-directories.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-hack.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-hack.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-too-long-error.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-too-long-error.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch
>>>> rename to meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-headers-can-be-included.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-headers-can-be-included.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-musl-ldso.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-musl-ldso.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-for-nativesdk-gcc.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-for-nativesdk-gcc.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
>>>> diff --git
>>>> a/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch
>>>> b/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch
>>>> rename to
>>>> meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-cross_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-cross_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-cross_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-runtime_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-source_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc-source_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc-source_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc-source_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/gcc_7.1.bb
>>>> b/meta/recipes-devtools/gcc/gcc_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/gcc_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/gcc_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.1.bb
>>>> b/meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/libgcc-initial_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/libgcc_7.1.bb
>>>> b/meta/recipes-devtools/gcc/libgcc_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/libgcc_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/libgcc_7.2.bb
>>>> diff --git a/meta/recipes-devtools/gcc/libgfortran_7.1.bb
>>>> b/meta/recipes-devtools/gcc/libgfortran_7.2.bb
>>>> similarity index 100%
>>>> rename from meta/recipes-devtools/gcc/libgfortran_7.1.bb
>>>> rename to meta/recipes-devtools/gcc/libgfortran_7.2.bb
>>>>
>>> --
>>>> 2.14.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>

--94eb2c14536cb5d472055743f321
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Aug 21, 2017 =
at 12:12 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div>Still reproducible without thumb:<div><a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/152666/" target=3D"_blank">http://errors.yoctoproje=
ct.org/Errors/Details/152666/</a><br></div><div><br></div><div>this might b=
e also triggered by this upgrade:</div><div><a href=3D"http://errors.yoctop=
roject.org/Errors/Details/152770/" target=3D"_blank">http://errors.yoctopro=
ject.org/Errors/Details/152770/</a></div></div></blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">May be passing=C2=A0<span style=3D"color:rgb=
(51,51,51);font-family:Monaco,Menlo,Consolas,&#39;Courier New&#39;,monospac=
e;font-size:13px;white-space:pre-wrap;background-color:rgb(245,245,245)">-c=
pperraswarn to swig will help</span></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div><a href=3D"http://errors.yoctoproject.org/Errors/Details/152770/" t=
arget=3D"_blank"></a><br></div><div><br></div><div>or from glibc final upgr=
ade or something else, hard to know when exactly it started as previous wor=
ld builds were pretty much useless with all those openssl caused issues.</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, =
Aug 21, 2017 at 2:37 AM, Khem Raj <span>&lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div><br><div class=3D"gmail_quote"><span><div dir=
=3D"auto">On Sun, Aug 20, 2017 at 5:31 PM Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div>Seems like=C2=A0python-=
matplotlib reliably triggers ICE in this version of gcc:<div><br></div><div=
><a href=3D"http://errors.yoctoproject.org/Errors/Details/152664/" target=
=3D"_blank">http://errors.yoctoproject.org/Errors/Details/152664/</a><br></=
div><div><br></div><div>I think I haven&#39;t seen this one with 7.1.</div>=
</div></blockquote><div dir=3D"auto"><br></div></span><div dir=3D"auto">Can=
 you try disabling thumb mode and see if this works ?</div><div><div class=
=3D"m_-3744808089106427872h5"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"></div></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Aug 15, 20=
17 at 7:42 AM, Khem Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br></div></div><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Drop upstreamed patches<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...r-Use-stack_t-instead-of-struct-sigaltsta.patch |=C2=A0 81 -------=
----<br>
=C2=A0...0-replace-struct-ucontext-with-ucontext_t.patch | 149 ------------=
---------<br>
=C2=A0.../gcc/{gcc-7.1.inc =3D&gt; gcc-7.2.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 +-<br>
=C2=A0.../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../{gcc-7.1 =3D&gt; gcc-7.2}/0008-c99-snprintf.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../0009-gcc-poison-system-directories.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A0.../0010-gcc-poison-dir-extend.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0012-64-bit-multilib-hack.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../0013-optional-libstdc.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0015-COLLECT_GCC_OPTIONS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0017-fortran-cross-compile-hack.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../0018-cpp-honor-sysroot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../0019-MIPS64-Default-to-N64-ABI.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...0021-gcc-Fix-argument-list-too-long-error.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../{gcc-7.1 =3D&gt; gcc-7.2}/0022-Disable-sdt.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0023-libtool.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...tilib-config-files-from-B-instead-of-usin.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-libdir-from-.la-which-usually-points-to-.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0027-export-CPP.patch |=C2=A0 =C2=
=A00<br>
=C2=A0...AltiVec-generation-on-powepc-linux-target.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...Ensure-target-gcc-headers-can-be-included.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-t-build-with-disable-dependency-tracking.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...h-host-directory-during-relink-if-inst_pr.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...IBS_DIR-replacement-instead-of-hardcoding.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0034-aarch64-Add-support-for-musl-ldso.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-handle-sysroot-support-for-nativesdk-gcc.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...et-sysroot-gcc-version-specific-dirs-with.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-various-_FOR_BUILD-and-related-variables.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0...shared-to-link-commandline-for-musl-targe.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...c-libcpp-support-ffile-prefix-map-old-new.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...ug-prefix-map-to-replace-ffile-prefix-map.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-fdebug-prefix-map-support-to-remap-sourc.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...e-alias-for-__cpu_indicator_init-instead-.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0047-sync-gcc-stddef.h-with-musl.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../0048-gcc-Enable-static-PIE.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../fix-segmentation-fault-precompiled-hdr.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0...<a href=3D"http://s-canadian_7.1.bb" rel=3D"noreferrer" target=3D"=
_blank">s-canadian_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://oss-initial_7.1.bb" rel=3D"noreferrer" target=3D=
"_blank">oss-initial_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross-initial=
_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-cross_7.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-cross_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross_7.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.2.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...-<a href=3D"http://initial_7.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">initial_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb</a>} =
|=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://gcc-crosssdk_7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-crosssdk_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.2.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-runtime_7.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-runtime=
_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.2.bb</a>} |=C2=
=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://gcc-sanitizers_7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-sanitizers_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-sanitiz=
ers_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-source_7.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-source_7.1.bb</a> =3D&gt; <a href=3D"http://gcc-source_7.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.2.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_7.1.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc_7.1.bb</a> =3D&gt; <a href=3D"http://gcc_7.2.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc_7.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://libgcc-initial_7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc-initial_7.1.bb</a> =3D&gt; <a href=3D"http://libgcc-init=
ial_7.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.2.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_7.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_7.1.bb</a> =3D&gt; <a href=3D"http://libgcc_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://libgfortran_7.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_7.1.bb</a> =3D&gt; <a href=3D"http://libgfortran=
_7.2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.2.bb</a>} |=C2=
=A0 =C2=A00<br>
=C2=A058 files changed, 6 insertions(+), 238 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitize=
r-Use-stack_t-instead-of-struct-sigaltsta.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-str=
uct-ucontext-with-ucontext_t.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1.inc =3D&gt; gcc-7.2.inc} (9=
1%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0008-c99-s=
nprintf.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0009-gcc-p=
oison-system-directories.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0010-gcc-p=
oison-dir-extend.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0011-gcc-4=
.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0012-64-bi=
t-multilib-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0013-optio=
nal-libstdc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0014-gcc-d=
isable-MASK_RELAX_PIC_CALLS-bit.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0015-COLLE=
CT_GCC_OPTIONS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0016-Use-t=
he-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0017-fortr=
an-cross-compile-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0018-cpp-h=
onor-sysroot.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0019-MIPS6=
4-Default-to-N64-ABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0020-Defin=
e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0021-gcc-F=
ix-argument-list-too-long-error.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0022-Disab=
le-sdt.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0023-libto=
ol.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0024-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0025-Use-t=
he-multilib-config-files-from-B-instead-of-usin.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0026-Avoid=
-using-libdir-from-.la-which-usually-points-to-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0027-expor=
t-CPP.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0028-Enabl=
e-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0029-Disab=
le-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0030-Ensur=
e-target-gcc-headers-can-be-included.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0031-gcc-4=
.8-won-t-build-with-disable-dependency-tracking.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0032-Don-t=
-search-host-directory-during-relink-if-inst_pr.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0033-Use-S=
YSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0034-aarch=
64-Add-support-for-musl-ldso.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0035-libcc=
1-fix-libcc1-s-install-path-and-rpath.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0036-handl=
e-sysroot-support-for-nativesdk-gcc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0037-Searc=
h-target-sysroot-gcc-version-specific-dirs-with.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0038-Fix-v=
arious-_FOR_BUILD-and-related-variables.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0039-nios2=
-Define-MUSL_DYNAMIC_LINKER.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0040-Add-s=
sp_nonshared-to-link-commandline-for-musl-targe.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0041-gcc-l=
ibcpp-support-ffile-prefix-map-old-new.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0042-Reuse=
-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0043-gcc-f=
inal.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0044-libgc=
c-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0045-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0046-libgc=
c_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0047-sync-=
gcc-stddef.h-with-musl.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/0048-gcc-E=
nable-static-PIE.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.1 =3D&gt; gcc-7.2}/fix-segmen=
tation-fault-precompiled-hdr.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.1.bb</a=
> =3D&gt; <a href=3D"http://gcc-cross-canadian_7.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-cross-canadian_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-initial=
_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.1.bb</a> =
=3D&gt; <a href=3D"http://gcc-cross-initial_7.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-cross-initial_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_7.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.1.bb</a> =3D&gt; <a href=
=3D"http://gcc-cross_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross=
_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk-init=
ial_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.1.b=
b</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_7.2.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.1.bb</a> =3D&gt; <a=
 href=3D"http://gcc-crosssdk_7.2.bb" rel=3D"noreferrer" target=3D"_blank">g=
cc-crosssdk_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.1.bb</a> =3D&gt; <a h=
ref=3D"http://gcc-runtime_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-=
runtime_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_7.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.1.bb</a> =3D&gt=
; <a href=3D"http://gcc-sanitizers_7.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-sanitizers_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_7.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.1.bb</a> =3D&gt; <a hre=
f=3D"http://gcc-source_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sou=
rce_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc_7.1.bb</a> =3D&gt; <a href=3D"http://=
gcc_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_7.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.1.bb</a> =3D&gt=
; <a href=3D"http://libgcc-initial_7.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libgcc-initial_7.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_7.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libgcc_7.1.bb</a> =3D&gt; <a href=3D"htt=
p://libgcc_7.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.2.bb</a>} =
(100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.1.bb</a> =3D&gt; <a h=
ref=3D"http://libgfortran_7.2.bb" rel=3D"noreferrer" target=3D"_blank">libg=
fortran_7.2.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_=
t-instead-of-struct-sigaltsta.patch b/meta/recipes-devtools/gcc/gcc-7.1/004=
9-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch<br>
deleted file mode 100644<br>
index 165258b5d3..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-inste=
ad-of-struct-sigaltsta.patch<br>
+++ /dev/null<br>
@@ -1,81 +0,0 @@<br>
-From 4c07606bb77bbd30f02adb947d480516da3fa3f7 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 11 Jun 2017 10:09:13 -0700<br>
-Subject: [PATCH] libsanitizer: Use stack_t instead of struct sigaltstack<b=
r>
-<br>
-<a href=3D"https://reviews.llvm.org/D35246" rel=3D"noreferrer" target=3D"_=
blank">https://reviews.llvm.org/D35246</a><br>
-<br>
-Upstream-Status: Submitted<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- libsanitizer/sanitizer_common/sanitizer_linux.cc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
- libsanitizer/sanitizer_common/sanitizer_linux.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
- .../sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cc=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 3 ++-<br>
- 3 files changed, 7 insertions(+), 6 deletions(-)<br>
-<br>
-<br>
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h<br>
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h<br>
-@@ -21,17 +21,15 @@<br>
- #include &quot;sanitizer_platform_limits_posix.h&quot;<br>
-<br>
- struct link_map;=C2=A0 // Opaque type returned by dlopen().<br>
--struct sigaltstack;<br>
-<br>
- namespace __sanitizer {<br>
- // Dirent structure for getdents(). Note that this structure is different=
 from<br>
- // the one in &lt;dirent.h&gt;, which is used by readdir().<br>
- struct linux_dirent;<br>
-<br>
- // Syscall wrappers.<br>
- uptr internal_getdents(fd_t fd, struct linux_dirent *dirp, unsigned int c=
ount);<br>
--uptr internal_sigaltstack(const struct sigaltstack* ss,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct sigaltstack* oss);<br>
-+uptr internal_sigaltstack(const void* ss, void* oss);<br>
- uptr internal_sigprocmask(int how, __sanitizer_sigset_t *set,<br>
-=C2=A0 =C2=A0 =C2=A0__sanitizer_sigset_t *oldset);<br>
-<br>
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc<br>
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.cc<br>
-@@ -631,8 +631,7 @@<br>
- }<br>
- #endif<br>
-<br>
--uptr internal_sigaltstack(const struct sigaltstack *ss,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct sigaltstack *oss) {<br>
-+uptr internal_sigaltstack(const void *ss, void *oss) {<br>
-=C2=A0 =C2=A0return internal_syscall(SYSCALL(sigaltstack), (uptr)ss, (uptr=
)oss);<br>
- }<br>
-<br>
-Index: gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linu=
x_libcdep.cc<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_l=
ibcdep.cc<br>
-+++ gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_stoptheworld_linux_l=
ibcdep.cc<br>
-@@ -287,7 +287,7 @@<br>
-<br>
-=C2=A0 =C2=A0// Alternate stack for signal handling.<br>
-=C2=A0 =C2=A0InternalScopedBuffer&lt;char&gt; handler_stack_memory(kHandle=
rStackSize);<br>
--=C2=A0 struct sigaltstack handler_stack;<br>
-+=C2=A0 stack_t handler_stack;<br>
-=C2=A0 =C2=A0internal_memset(&amp;handler_stack, 0, sizeof(handler_stack))=
;<br>
-=C2=A0 =C2=A0handler_stack.ss_sp =3D handler_stack_memory.data();<br>
-=C2=A0 =C2=A0handler_stack.ss_size =3D kHandlerStackSize;<br>
-Index: gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc<br>
-+++ gcc-7.1.0/libsanitizer/tsan/tsan_platform_linux.cc<br>
-@@ -288,7 +288,7 @@<br>
- int ExtractResolvFDs(void *state, int *fds, int nfd) {<br>
- #if SANITIZER_LINUX &amp;&amp; !SANITIZER_ANDROID<br>
-=C2=A0 =C2=A0int cnt =3D 0;<br>
--=C2=A0 __res_state *statp =3D (__res_state*)state;<br>
-+=C2=A0 struct __res_state *statp =3D (struct __res_state*)state;<br>
-=C2=A0 =C2=A0for (int i =3D 0; i &lt; MAXNS &amp;&amp; cnt &lt; nfd; i++) =
{<br>
-=C2=A0 =C2=A0 =C2=A0if (statp-&gt;_u._ext.nsaddrs[i] &amp;&amp; statp-&gt;=
_u._ext.nssocks[i] !=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fds[cnt++] =3D statp-&gt;_u._ext.nssocks[i];<br=
>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext=
-with-ucontext_t.patch b/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-str=
uct-ucontext-with-ucontext_t.patch<br>
deleted file mode 100644<br>
index e814992e44..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-u=
context_t.patch<br>
+++ /dev/null<br>
@@ -1,149 +0,0 @@<br>
-From 7b3cb36ab07d0c36b500bb5d0548b190d4b5a9f6 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 28 Jun 2017 00:25:57 -0700<br>
-Subject: [PATCH 50/50] replace struct ucontext with ucontext_t<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- libgcc/config/aarch64/linux-unwind.h | 2 +-<br>
- libgcc/config/alpha/linux-unwind.h=C2=A0 =C2=A0| 2 +-<br>
- libgcc/config/bfin/linux-unwind.h=C2=A0 =C2=A0 | 2 +-<br>
- libgcc/config/i386/linux-unwind.h=C2=A0 =C2=A0 | 4 ++--<br>
- libgcc/config/pa/linux-unwind.h=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- libgcc/config/riscv/linux-unwind.h=C2=A0 =C2=A0| 2 +-<br>
- libgcc/config/sh/linux-unwind.h=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- libgcc/config/tilepro/linux-unwind.h | 2 +-<br>
- libgcc/config/xtensa/linux-unwind.h=C2=A0 | 2 +-<br>
- 9 files changed, 10 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/libgcc/config/aarch64/linux-unwind.h b/libgcc/config/aarch64/=
linux-unwind.h<br>
-index d5d6980442f..d46d5f53be3 100644<br>
---- a/libgcc/config/aarch64/linux-unwind.h<br>
-+++ b/libgcc/config/aarch64/linux-unwind.h<br>
-@@ -55,7 +55,7 @@ aarch64_fallback_frame_state (struct _Unwind_Context *co=
ntext,<br>
-=C2=A0 =C2=A0struct rt_sigframe<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0struct rt_sigframe *rt_;<br>
-diff --git a/libgcc/config/alpha/linux-unwind.h b/libgcc/config/alpha/linu=
x-unwind.h<br>
-index a91a5f4fe26..7202516581d 100644<br>
---- a/libgcc/config/alpha/linux-unwind.h<br>
-+++ b/libgcc/config/alpha/linux-unwind.h<br>
-@@ -51,7 +51,7 @@ alpha_fallback_frame_state (struct _Unwind_Context *cont=
ext,<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rt_sigframe {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} *rt_ =3D context-&gt;cfa;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sc =3D &amp;rt_-&gt;uc.uc_mcontext;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-diff --git a/libgcc/config/bfin/linux-unwind.h b/libgcc/config/bfin/linux-=
unwind.h<br>
-index 9412c7652b8..37e9feb6965 100644<br>
---- a/libgcc/config/bfin/linux-unwind.h<br>
-+++ b/libgcc/config/bfin/linux-unwind.h<br>
-@@ -52,7 +52,7 @@ bfin_fallback_frame_state (struct _Unwind_Context *conte=
xt,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *puc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char retcode[8];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} *rt_ =3D context-&gt;cfa;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The void * cast is necessary to avoid an ali=
asing warning.<br>
-diff --git a/libgcc/config/i386/linux-unwind.h b/libgcc/config/i386/linux-=
unwind.h<br>
-index b1d5040a687..2009ad72260 100644<br>
---- a/libgcc/config/i386/linux-unwind.h<br>
-+++ b/libgcc/config/i386/linux-unwind.h<br>
-@@ -58,7 +58,7 @@ x86_64_fallback_frame_state (struct _Unwind_Context *con=
text,<br>
-=C2=A0 =C2=A0if (*(unsigned char *)(pc+0) =3D=3D 0x48<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; *(unsigned long long *)(pc+1) =3D=3D=
 RT_SIGRETURN_SYSCALL)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 struct ucontext *uc_ =3D context-&gt;cfa;<br>
-+=C2=A0 =C2=A0 =C2=A0 ucontext_t *uc_ =3D context-&gt;cfa;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The void * cast is necessary to avoid an ali=
asing warning.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The aliasing warning is correct, but sh=
ould not be a problem<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because it does not alias anything.=C2=
=A0 */<br>
-@@ -138,7 +138,7 @@ x86_fallback_frame_state (struct _Unwind_Context *cont=
ext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_t *pinfo;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *puc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} *rt_ =3D context-&gt;cfa;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The void * cast is necessary to avoid an ali=
asing warning.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The aliasing warning is correct, but sh=
ould not be a problem<br>
-diff --git a/libgcc/config/pa/linux-unwind.h b/libgcc/config/pa/linux-unwi=
nd.h<br>
-index 580c18dad69..c2c3409bcc1 100644<br>
---- a/libgcc/config/pa/linux-unwind.h<br>
-+++ b/libgcc/config/pa/linux-unwind.h<br>
-@@ -80,7 +80,7 @@ pa32_fallback_frame_state (struct _Unwind_Context *conte=
xt,<br>
-=C2=A0 =C2=A0struct sigcontext *sc;<br>
-=C2=A0 =C2=A0struct rt_sigframe {<br>
-=C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0} *frame;<br>
-<br>
-=C2=A0 =C2=A0/* rt_sigreturn trampoline:<br>
-diff --git a/libgcc/config/riscv/linux-unwind.h b/libgcc/config/riscv/linu=
x-unwind.h<br>
-index a051a2869d4..1c8aeff7ef0 100644<br>
---- a/libgcc/config/riscv/linux-unwind.h<br>
-+++ b/libgcc/config/riscv/linux-unwind.h<br>
-@@ -42,7 +42,7 @@ riscv_fallback_frame_state (struct _Unwind_Context *cont=
ext,<br>
-=C2=A0 =C2=A0struct rt_sigframe<br>
-=C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0};<br>
-<br>
-=C2=A0 =C2=A0struct rt_sigframe *rt_;<br>
-diff --git a/libgcc/config/sh/linux-unwind.h b/libgcc/config/sh/linux-unwi=
nd.h<br>
-index 1038caeb5c3..a8c98220282 100644<br>
---- a/libgcc/config/sh/linux-unwind.h<br>
-+++ b/libgcc/config/sh/linux-unwind.h<br>
-@@ -82,7 +82,7 @@ sh_fallback_frame_state (struct _Unwind_Context *context=
,<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rt_sigframe {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} *rt_ =3D context-&gt;cfa;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The void * cast is necessary to avoid an ali=
asing warning.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The aliasing warning is correct, but sh=
ould not be a problem<br>
-diff --git a/libgcc/config/tilepro/linux-unwind.h b/libgcc/config/tilepro/=
linux-unwind.h<br>
-index a8dc4405715..dba3b410279 100644<br>
---- a/libgcc/config/tilepro/linux-unwind.h<br>
-+++ b/libgcc/config/tilepro/linux-unwind.h<br>
-@@ -61,7 +61,7 @@ tile_fallback_frame_state (struct _Unwind_Context *conte=
xt,<br>
-=C2=A0 =C2=A0struct rt_sigframe {<br>
-=C2=A0 =C2=A0 =C2=A0unsigned char save_area[C_ABI_SAVE_AREA_SIZE];<br>
-=C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 ucontext_t uc;<br>
-=C2=A0 =C2=A0} *rt_;<br>
-<br>
-=C2=A0 =C2=A0/* Return if this is not a signal handler.=C2=A0 */<br>
-diff --git a/libgcc/config/xtensa/linux-unwind.h b/libgcc/config/xtensa/li=
nux-unwind.h<br>
-index 67c272820d0..b37b8b31bbf 100644<br>
---- a/libgcc/config/xtensa/linux-unwind.h<br>
-+++ b/libgcc/config/xtensa/linux-unwind.h<br>
-@@ -67,7 +67,7 @@ xtensa_fallback_frame_state (struct _Unwind_Context *con=
text,<br>
-<br>
-=C2=A0 =C2=A0struct rt_sigframe {<br>
-=C2=A0 =C2=A0 =C2=A0siginfo_t info;<br>
--=C2=A0 =C2=A0 struct ucontext uc;<br>
-+=C2=A0 =C2=A0 struct ucontext_t uc;<br>
-=C2=A0 =C2=A0} *rt_;<br>
-<br>
-=C2=A0 =C2=A0/* movi a2, __NR_rt_sigreturn; syscall */<br>
---<br>
-2.13.2<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/=
gcc/gcc-7.2.inc<br>
similarity index 91%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1.inc<br>
rename to meta/recipes-devtools/gcc/gcc-7.2.inc<br>
index 2d9ca82de9..796e6b1eef 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.2.inc<br>
@@ -2,13 +2,13 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;7.1.0&quot;<br>
+PV =3D &quot;7.2.0&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;7.1.0&quot;<br>
+BINV =3D &quot;7.2.0&quot;<br>
<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-7.1:${FILE_DIRNAME}/gcc-7.1=
/backport:&quot;<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2=
/backport:&quot;<br>
<br>
=C2=A0DEPENDS =3D+ &quot;mpfr gmp libmpc zlib&quot;<br>
=C2=A0NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
&quot;<br>
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0#RELEASE =3D &quot;7-20170504&quot;<br>
-BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2&quot;<br>
+BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz&quot;<br>
=C2=A0#SRCREV =3D &quot;f7cf798b73fd1a07098f9a490deec1e2a36e0bed&quot;<br>
=C2=A0#BASEURI ?=3D &quot;git://<a href=3D"http://github.com/gcc-mirror/gcc=
;branch=3Dgcc-6-branch;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank"=
>github.com/gcc-mirror/gcc;branch=3Dgcc-6-branch;protocol=3Dgit</a>&quot;<b=
r>
=C2=A0#BASEURI ?=3D &quot;<a href=3D"http://mirrors.concertpass.com/gcc/sna=
pshots/$%7BRELEASE%7D/gcc-$%7BRELEASE%7D.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${R=
ELEASE}.tar.bz2</a>&quot;<br>
@@ -73,15 +73,13 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0046-libgcc_s-Use-alias-fo=
r-__cpu_indicator_init-instead-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0047-sync-gcc-stddef.h-wit=
h-musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0048-gcc-Enable-static-PIE=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0049-libsanitizer-Use-stac=
k_t-instead-of-struct-sigaltsta.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0050-replace-struct-uconte=
xt-with-ucontext_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-segmentation-fault-pre=
compiled-hdr.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;6bf56a2bca9dac9dbbf8e8d1036964a8&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8a8136c235f64c6fef69cac0d73a46a1a09bb250776a0=
50aec8f9fc880bebc17&quot;<br>
+SRC_URI[md5sum] =3D &quot;ff370482573133a7fcdd96cd2f552292&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029=
aae0f4e48841088479a&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
=C2=A0#S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/git&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch b/me=
ta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-direc=
tories.patch b/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-dir=
ectories.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-direct=
ories.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-director=
ies.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.p=
atch b/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch<b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.pa=
tch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patc=
h<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAG=
S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSRO=
OT_CFLAGS_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.pa=
tch b/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.pat=
ch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch=
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_=
PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MA=
SK_RELAX_PIC_CALLS-bit.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_P=
IC_CALLS-bit.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC=
_CALLS-bit.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.pat=
ch b/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patc=
h<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.2/0016-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-ha=
ck.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-ha=
ck.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack=
.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch<=
br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch<br=
>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-A=
BI.patch b/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-AB=
I.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7.2/002=
0-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-t=
oo-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argume=
nt-list-too-long-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-to=
o-long-error.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-=
long-error.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch b/met=
a/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch b/meta/re=
cipes-devtools/gcc/gcc-7.2/0023-libtool.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.2/0024-g=
cc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7.2/002=
5-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7.2/002=
6-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch b/meta=
/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-gene=
ration-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7.2/002=
8-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-gener=
ation-on-powepc-linux-target.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generat=
ion-on-powepc-linux-target.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OS=
DIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7.2/002=
9-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSD=
IRNAMES-and-other-multilib-o.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIR=
NAMES-and-other-multilib-o.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-heade=
rs-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-ta=
rget-gcc-headers-can-be-included.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-header=
s-can-be-included.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-=
can-be-included.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-wit=
h-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7.2/003=
1-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-d=
isable-dependency-tracking.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7.2/003=
2-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7.2/003=
3-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for=
-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-suppo=
rt-for-musl-ldso.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-=
musl-ldso.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-mu=
sl-ldso.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-f=
ix-libcc1-s-install-path-and-rpath.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-=
for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sys=
root-support-for-nativesdk-gcc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-f=
or-nativesdk-gcc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for=
-nativesdk-gcc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7.2/003=
7-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-=
and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-va=
rious-_FOR_BUILD-and-related-variables.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and=
-related-variables.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.2/004=
0-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffil=
e-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-lib=
cpp-support-ffile-prefix-map-old-new.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile=
-prefix-map-old-new.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-p=
refix-map-old-new.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map=
-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.2/0042=
-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-=
to-replace-ffile-prefix-map.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to=
-replace-ffile-prefix-map.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-pref=
ix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7.2/004=
3-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefi=
x-map-support-to-remap-sourc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-=
map-support-to-remap-sourc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-=
ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-k=
nob-to-use-ldbl-128-on-ppc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-l=
dbl-128-on-ppc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldb=
l-128-on-ppc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.2/0045-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-7.2/004=
6-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-=
musl.patch b/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-=
musl.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-m=
usl.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-mus=
l.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.p=
atch b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch<b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.pa=
tch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patc=
h<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-preco=
mpiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault=
-precompiled-hdr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precom=
piled-hdr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompi=
led-hdr.patch<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian=
_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.1.bb</a>=
 b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_7.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.1.bb</a><=
br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_7.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a><br=
>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_=
7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.1.bb</a> b=
/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7=
.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.1.bb</a><br=
>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.1.bb</a> b/meta/recipes-de=
vtools/gcc/<a href=3D"http://gcc-cross_7.2.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-cross_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initi=
al_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.1.bb=
</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb</a><b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initia=
l_7.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.1.bb<=
/a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb</a=
><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.1.bb</a> b/meta/reci=
pes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.2.bb" rel=3D"noreferrer" =
target=3D"_blank">gcc-crosssdk_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.2.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.1.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-runtime_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.1.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-source_7.1.bb</a> b/meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-source_7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-source_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-source_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gcc_7.1.bb</a> b/meta/recipes-devtools/gcc/<=
a href=3D"http://gcc_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.2.b=
b</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.1.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.2.bb" rel=3D"no=
referrer" target=3D"_blank">gcc_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.1.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">libgcc-initial_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.1.bb</a> b/meta/recipes-devtools=
/gcc/<a href=3D"http://libgcc_7.2.bb" rel=3D"noreferrer" target=3D"_blank">=
libgcc_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libgcc_7.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.1.bb=
" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.1.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://libgfortran_7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_7.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgfortran_7.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libgfortran_7.2.bb</a><br>
</blockquote></div></div><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"m_-3744808089106427872m_-=
2378271318891652576m_-8027269075179986059HOEnZb"><font color=3D"#888888">--=
<br>
2.14.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div></div></blockquote></div></div></div></div=
>
</blockquote></div><br></div>
</blockquote></div></div>

--94eb2c14536cb5d472055743f321--
