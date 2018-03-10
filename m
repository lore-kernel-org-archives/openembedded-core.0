Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 21D5D78888
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 01:42:59 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id e9so4228531pgs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 17:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqINv9tw5PbEUcRL7TPGnxeam4nvTv+2FP6MqFMrJv8=;
	b=MnVhYSGTNE8sQUKXyoKBKjKJQ7zHrDhW9Rtw0NXnk8nVUBuaSJ0lyHXMNNO7Pofuv6
	Fd15VZUjqgf+uCm74iBuIPyf4Vj6dd2MQoMMcY9lIDERkHw0oPFsHyDdYemeo4bKLksO
	Amz9L7ENdOG8Lt/ttDYQFL0sJMuT0Q6aPm2+SiY6HfcVcAK/hyZSSNK5MoRvAiiB4VOT
	sNPwLk2F34SGQ9kXJrBqqSwW9aYqbqgyqCav61KQG5Rqvc65RLGBm6snq5Zbi7rofNEK
	UYnMbVc3dChxzo27xlMd8eiC8zrjKfxjSFzFHNyil0ztomVrxjE//D+tqHwfARokqAgG
	7dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqINv9tw5PbEUcRL7TPGnxeam4nvTv+2FP6MqFMrJv8=;
	b=OYRGaHdlVu4Ex+3kmfvXWf/v0BacxUomo7mHtrMQGshRBRpZWj7Dj8CcLa7KoR48+C
	qdpwdGpyo02x/VXv05T/JKRfMGZQQiOu167fsj+KKJJW+eZIQtes0u0s4hH0PQ/KYC3R
	uKfDCNXXZLe8isGhvQHCUtF267DGwD797W/7yu+Xv+oVouM/SLcFd0Eac713NYIMwzIi
	o5SJH75lS9rMHEJy6LsWZGIklPL+nf4YY0A2rBNpM08iOA/CSknhmurfrJNMcHGvYZ4l
	mKkVrV1aYdfVPAVwsY2d1jwcNCcSuf+J0GWG/izb6rh5E2CfxsawodPrXOJxid46nIOJ
	G+pg==
X-Gm-Message-State: AElRT7E7XXmhTV/JntvC+U/LQx9HVxqGLxkcMGW+3g+4YyDsxa7abriZ
	L67rqkXR9YXnqMd6OHmbVxB2HpVikldtvaxvm+g=
X-Google-Smtp-Source: AG47ELsHp6Z+JP0yGJF2xXqd2DNtA/Sl0hOzosXuZ+B/Bijge3X7dg1AussHRpWFYvqHFlo9bZK3jJ4L47cFiNymajQ=
X-Received: by 10.98.229.21 with SMTP id n21mr490005pff.158.1520646180506;
	Fri, 09 Mar 2018 17:43:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.179.2 with HTTP; Fri, 9 Mar 2018 17:42:30 -0800 (PST)
In-Reply-To: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Mar 2018 17:42:30 -0800
Message-ID: <CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 01:43:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 9, 2018 at 3:49 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> Second attempt. Added some more patches, mostly ARM specific.
> AFAIK this patchset passed all x86-64 tests.
>
> I also did some limited testing with meta-raspberrypi and musl library.
>
> (raspberrypi did not build with v1 of the patchset)

There were patches to fix the pi issue. So we upgraded to 6.4 to ensure that
we can backport exact set as needed. I am bit lost what went missing.

> Juro Bystricky (1):
>   gcc6: Upgrade to 6.4.0 (latest stable series release)
>
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   92 -
>  .../gcc/gcc-6.2/CVE-2016-4490.patch                |  290 ---
>  .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch |   28 -
>  .../gcc/{gcc-6.2.inc => gcc-6.4.inc}               |   31 +-
>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
>  .../{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch    |    0
>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0
>  .../{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch  |    0
>  .../0005-uclibc-locale-no__x.patch                 |    0
>  .../0006-uclibc-locale-wchar_fix.patch             |    0
>  .../0007-uclibc-locale-update.patch                |    0
>  .../0008-missing-execinfo_h.patch                  |    0
>  .../{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch   |    0
>  .../0010-gcc-poison-system-directories.patch       |    0
>  .../0011-gcc-poison-dir-extend.patch               |    0
>  .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0
>  .../0013-64-bit-multilib-hack.patch                |    0
>  .../0014-optional-libstdc.patch                    |    0
>  ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0
>  .../0016-COLLECT_GCC_OPTIONS.patch                 |    0
>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0
>  .../0018-fortran-cross-compile-hack.patch          |    0
>  .../0019-cpp-honor-sysroot.patch                   |    0
>  .../0020-MIPS64-Default-to-N64-ABI.patch           |    0
>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0
>  ...0022-gcc-Fix-argument-list-too-long-error.patch |    0
>  .../{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch    |    0
>  .../gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch    |    0
>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
>  ...tilib-config-files-from-B-instead-of-usin.patch |    0
>  ...-libdir-from-.la-which-usually-points-to-.patch |    0
>  .../gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch |    0
>  ...AltiVec-generation-on-powepc-linux-target.patch |    0
>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0
>  ...Ensure-target-gcc-headers-can-be-included.patch |    0
>  ...-t-build-with-disable-dependency-tracking.patch |    0
>  ...h-host-directory-during-relink-if-inst_pr.patch |    0
>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0
>  .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0
>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0
>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0
>  ...et-sysroot-gcc-version-specific-dirs-with.patch |    0
>  ...-various-_FOR_BUILD-and-related-variables.patch |    0
>  .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0
>  .../{gcc-6.2 => gcc-6.4}/0041-ssp_nonshared.patch  |    0
>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0
>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0
>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0
>  ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0
>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0
>  ...e-alias-for-__cpu_indicator_init-instead-.patch |    0
>  .../gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch |   91 +
>  .../gcc/gcc-6.4/0054_all_nopie-all-flags.patch     |   22 +
>  .../gcc/gcc-6.4/0055-unwind_h-glibc26.patch        |  139 ++
>  ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
>  ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |   67 +
>  ...ove-struct-ix86_frame-to-machine_function.patch |  247 +++
>  ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   74 +
>  ...nst-reference-of-struct-ix86_frame-to-avo.patch |  131 ++
>  .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++++++++
>  .../backport/0005-x86-Add-mfunction-return.patch   | 1570 ++++++++++++++
>  .../0006-x86-Add-mindirect-branch-register.patch   |  946 +++++++++
>  .../0007-x86-Add-V-register-operand-modifier.patch |  139 ++
>  ...w-mindirect-branch-mfunction-return-with-.patch |  304 +++
>  ...VALID_REGNUM-in-indirect-thunk-processing.patch |  126 ++
>  ...INVALID_REGNUM-as-invalid-register-number.patch |   46 +
>  ...date-mfunction-return-for-return-with-pop.patch |  453 ++++
>  ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1004 +++++++++
>  ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
>  .../gcc/gcc-6.4/backport/CVE-2016-6131.patch       |  223 ++
>  ...s-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} |    0
>  ...oss-initial_6.2.bb => gcc-cross-initial_6.4.bb} |    0
>  .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb}     |    0
>  ...-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} |    0
>  .../{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb}   |    0
>  .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} |    0
>  ...gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} |    0
>  .../gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb}   |    0
>  .../gcc/{gcc_6.2.bb => gcc_6.4.bb}                 |    0
>  ...libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} |    0
>  .../gcc/{libgcc_6.2.bb => libgcc_6.4.bb}           |    0
>  .../gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} |    0
>  83 files changed, 8149 insertions(+), 418 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
>  rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.4.inc} (77%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0005-uclibc-locale-no__x.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0006-uclibc-locale-wchar_fix.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0007-uclibc-locale-update.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0008-missing-execinfo_h.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0014-optional-libstdc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0041-ssp_nonshared.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} (100%)
>
> --
> 2.7.4
>

