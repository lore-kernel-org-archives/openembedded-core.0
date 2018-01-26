Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 76078787A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 23:52:38 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id g16so1219151pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 15:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ygX33dZNqPgaSNhkfvnncJ66QvN2vMQZWL59kQ1U1v4=;
	b=rB6jh9cvIWuQEdDHt81o+sy2PeIqjjMD5L+xD7x5L60CFYM28jQreUOMPb0eFeJ+Iv
	0ZDXW6+JDSi6ef5odzHrSajyJIn16l1f3r/NZV0eoUqryYKYbNWG+UpMBHp+FlDS+C4m
	gBJwLQ5llgJDPRdZZkQXdEWv9PKOUzUo8nDcXlVgXzkBWmEiqWmHRmCiV1Ny83YsninR
	xpbLp34pHvWP0gKl70LpfyTad6TUWxel58LpI5EPuawursz2IPSbxE0ZdvKn0B4QybLX
	xly08i8VgKIa4fZPX4WQ+sfwAbf6Ftpncz9rNlK/fht8xCqrVEIme0mEm7LZYFcloDgc
	ox6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ygX33dZNqPgaSNhkfvnncJ66QvN2vMQZWL59kQ1U1v4=;
	b=IVB9rTKUxFqTUs2coTaDxRYNodEUzNXVfDiaBKlrLMFWjEgPAR+Boz61ZlsRi0apWZ
	yv3UPGJot1PYfEeVUeUTrkZKfjpZBNCFQCaewTQa5qwd/nx4HcUCHOJVnoRsPiSRev8l
	vY9q3UiiDWUzsOgJc5pfKQAv7H28x3+llDf4BTXBPmyqwdtot6MQ5QrQ0FRVk9PdLhqJ
	ZBGz2gKJ//zNobuz0hfvrPO9ka+wbD44/HmLmx68jGUG9eiadNVXDida9XAllTKlmBxT
	aE9BGOwylRbhAFZniKI9Xam6AiAHORwrHQUCinb24dCwosvJykwyvVI3tV+s99eeHVg+
	7aJg==
X-Gm-Message-State: AKwxytf3MNUpZhsaZu/YazQlynLv0e4kneRUBcL8ygUnshGzjczR8BHJ
	iiwyas/rotY3otic3334SKmnl1fHo3dLiUUxbiE=
X-Google-Smtp-Source: AH8x2271VIPUTn8PhhC2c7l3XM0vURqPxWyLL2C5ikFdJpZ1aSGCrkRqxL+Pmo+f4z0UhoxEljtzmOGLWOQp50DZg9w=
X-Received: by 10.98.156.71 with SMTP id f68mr20722968pfe.29.1517010759313;
	Fri, 26 Jan 2018 15:52:39 -0800 (PST)
MIME-Version: 1.0
References: <1517009120-10582-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1517009120-10582-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jan 2018 23:52:28 +0000
Message-ID: <CAMKF1sozzohSvj0kp1Jjgs3B-aPhZLQQhMO895kWWWrHrVroyQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade 7.2 -> 7.3
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
X-List-Received-Date: Fri, 26 Jan 2018 23:52:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ec3506dee990563b697a3"

--94eb2c0ec3506dee990563b697a3
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 26, 2018 at 3:25 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The static PIE patch was updated by Juro Bystricky <
> juro.bystricky@intel.com>
> to work with gcc 7.3.
>
> This update from the stable gcc 7 branch includes the retpoline
> functionality which is useful to assist with recent security issues.
>
> Two backported patches were dropped as they're included in 7.3.



As confirmed on IRC Looks good to install

Reviewed-by: Khem Raj <raj.khem@gmail.com>

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../gcc-7.2/0001-PR-rtl-optimization-81803.patch   |  52 ------
>  .../gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch   |  37 ----
>  ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194
> ---------------------
>  .../gcc/{gcc-7.2.inc => gcc-7.3.inc}               |  13 +-
>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   0
>  .../{gcc-7.2 => gcc-7.3}/0008-c99-snprintf.patch   |   0
>  .../0009-gcc-poison-system-directories.patch       |   6 +-
>  .../0010-gcc-poison-dir-extend.patch               |   0
>  .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
>  .../0012-64-bit-multilib-hack.patch                |   0
>  .../0013-optional-libstdc.patch                    |   0
>  ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   0
>  .../0015-COLLECT_GCC_OPTIONS.patch                 |   0
>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
>  .../0017-fortran-cross-compile-hack.patch          |   0
>  .../0018-cpp-honor-sysroot.patch                   |   0
>  .../0019-MIPS64-Default-to-N64-ABI.patch           |   0
>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
>  ...0021-gcc-Fix-argument-list-too-long-error.patch |   0
>  .../{gcc-7.2 => gcc-7.3}/0022-Disable-sdt.patch    |   0
>  .../gcc/{gcc-7.2 => gcc-7.3}/0023-libtool.patch    |   0
>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   0
>  ...tilib-config-files-from-B-instead-of-usin.patch |   0
>  ...-libdir-from-.la-which-usually-points-to-.patch |   0
>  .../gcc/{gcc-7.2 => gcc-7.3}/0027-export-CPP.patch |   0
>  ...AltiVec-generation-on-powepc-linux-target.patch |   0
>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   0
>  ...Ensure-target-gcc-headers-can-be-included.patch |   0
>  ...-t-build-with-disable-dependency-tracking.patch |   0
>  ...h-host-directory-during-relink-if-inst_pr.patch |   0
>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |   0
>  .../0034-aarch64-Add-support-for-musl-ldso.patch   |   0
>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   0
>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |   0
>  ...et-sysroot-gcc-version-specific-dirs-with.patch |   0
>  ...-various-_FOR_BUILD-and-related-variables.patch |   0
>  .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   0
>  ...shared-to-link-commandline-for-musl-targe.patch |   0
>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |   0
>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   0
>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |   0
>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |   0
>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
>  ...e-alias-for-__cpu_indicator_init-instead-.patch |   0
>  .../0047-sync-gcc-stddef.h-with-musl.patch         |   0
>  .../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch   |  46 +++++
>  ...le-non-legitimate-address-in-riscv_legiti.patch |   0
>  .../fix-segmentation-fault-precompiled-hdr.patch   |   0
>  meta/recipes-devtools/gcc/gcc-common.inc           |   1 +
>  ...s-canadian_7.2.bb => gcc-cross-canadian_7.3.bb} |   0
>  ...oss-initial_7.2.bb => gcc-cross-initial_7.3.bb} |   0
>  .../gcc/{gcc-cross_7.2.bb => gcc-cross_7.3.bb}     |   0
>  ...-initial_7.2.bb => gcc-crosssdk-initial_7.3.bb} |   0
>  .../{gcc-crosssdk_7.2.bb => gcc-crosssdk_7.3.bb}   |   0
>  .../gcc/{gcc-runtime_7.2.bb => gcc-runtime_7.3.bb} |   0
>  ...gcc-sanitizers_7.2.bb => gcc-sanitizers_7.3.bb} |   0
>  .../gcc/{gcc-source_7.2.bb => gcc-source_7.3.bb}   |   0
>  .../gcc/{gcc_7.2.bb => gcc_7.3.bb}                 |   0
>  ...libgcc-initial_7.2.bb => libgcc-initial_7.3.bb} |   0
>  .../gcc/{libgcc_7.2.bb => libgcc_7.3.bb}           |   0
>  .../gcc/{libgfortran_7.2.bb => libgfortran_7.3.bb} |   0
>  61 files changed, 56 insertions(+), 293 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
>  rename meta/recipes-devtools/gcc/{gcc-7.2.inc => gcc-7.3.inc} (92%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0008-c99-snprintf.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0009-gcc-poison-system-directories.patch (97%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0010-gcc-poison-dir-extend.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0012-64-bit-multilib-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0013-optional-libstdc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0015-COLLECT_GCC_OPTIONS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0017-fortran-cross-compile-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0018-cpp-honor-sysroot.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0019-MIPS64-Default-to-N64-ABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0021-gcc-Fix-argument-list-too-long-error.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0022-Disable-sdt.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 => gcc-7.3}/0023-libtool.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0027-export-CPP.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0030-Ensure-target-gcc-headers-can-be-included.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0034-aarch64-Add-support-for-musl-ldso.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0036-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0038-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0047-sync-gcc-stddef.h-with-musl.patch (100%)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-7.2 =>
> gcc-7.3}/fix-segmentation-fault-precompiled-hdr.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_7.2.bb =>
> gcc-cross-canadian_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_7.2.bb =>
> gcc-cross-initial_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_7.2.bb => gcc-cross_7.3.bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_7.2.bb =>
> gcc-crosssdk-initial_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_7.2.bb =>
> gcc-crosssdk_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_7.2.bb =>
> gcc-runtime_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_7.2.bb =>
> gcc-sanitizers_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_7.2.bb => gcc-source_7.3.bb}
> (100%)
>  rename meta/recipes-devtools/gcc/{gcc_7.2.bb => gcc_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_7.2.bb =>
> libgcc-initial_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_7.2.bb => libgcc_7.3.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgfortran_7.2.bb =>
> libgfortran_7.3.bb} (100%)
>
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
> b/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
> deleted file mode 100644
> index 292e734..0000000
> ---
> a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 5cbb8e6b1122092b3eaabd4270b2f316aa40407c Mon Sep 17 00:00:00 2001
> -From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Tue, 31 Oct 2017 18:27:52 +0000
> -Subject: [PATCH]       PR rtl-optimization/81803       * lra-constraints.c
> - (curr_insn_transform): Also reload the whole  register for a strict
> subreg
> - no wider than a word if this is for   a WORD_REGISTER_OPERATIONS target.
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@254275
> 138bc75d-0d04-0410-961f-82ee72b054a4
> -
> -Upstream-Status: Backport
> -
> -This patch removes changes to Changelog from the original patch upstream.
> This is
> -because we are backporting a patch to a stable version, making changes to
> Changelog,
> -especially up '* GCC 7.2.0 released.', feels a little weird.
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - gcc/lra-constraints.c | 11 ++++++++---
> - 2 files changed, 16 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
> -index a423f069836..3758409bb9c 100644
> ---- a/gcc/lra-constraints.c
> -+++ b/gcc/lra-constraints.c
> -@@ -4207,8 +4207,9 @@ curr_insn_transform (bool check_only_p)
> -             reg = SUBREG_REG (*loc);
> -             byte = SUBREG_BYTE (*loc);
> -             if (REG_P (reg)
> --                /* Strict_low_part requires reload the register not
> --                   the sub-register.  */
> -+                /* Strict_low_part requires reloading the register and
> not
> -+                   just the subreg.  Likewise for a strict subreg no
> wider
> -+                   than a word for WORD_REGISTER_OPERATIONS targets.  */
> -                 && (curr_static_id->operand[i].strict_low
> -                     || (!paradoxical_subreg_p (mode, GET_MODE (reg))
> -                         && (hard_regno
> -@@ -4219,7 +4220,11 @@ curr_insn_transform (bool check_only_p)
> -                         && (goal_alt[i] == NO_REGS
> -                             || (simplify_subreg_regno
> -                                 (ira_class_hard_regs[goal_alt[i]][0],
> --                                 GET_MODE (reg), byte, mode) >= 0)))))
> -+                                 GET_MODE (reg), byte, mode) >= 0)))
> -+                    || (GET_MODE_PRECISION (mode)
> -+                        < GET_MODE_PRECISION (GET_MODE (reg))
> -+                        && GET_MODE_SIZE (GET_MODE (reg)) <=
> UNITS_PER_WORD
> -+                        && WORD_REGISTER_OPERATIONS)))
> -               {
> -                 /* An OP_INOUT is required when reloading a subreg of a
> -                    mode wider than a word to ensure that data beyond the
> ---
> -2.13.0
> -
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
> b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
> deleted file mode 100644
> index 879e360..0000000
> --- a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 13 Jun 2017 12:12:52 -0700
> -Subject: [PATCH 49/49] gcc: Enable static PIE
> -
> -Static PIE support in GCC
> -see
> -https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/gnu-user.h | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
> -index 2787a3d16be..ee7b781319e 100644
> ---- a/gcc/config/gnu-user.h
> -+++ b/gcc/config/gnu-user.h
> -@@ -51,10 +51,10 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> - #if defined HAVE_LD_PIE
> - #define GNU_USER_TARGET_STARTFILE_SPEC \
> -   "%{!shared: %{pg|p|profile:gcrt1.o%s;: \
> --    %{" PIE_SPEC ":Scrt1.o%s} %{" NO_PIE_SPEC ":crt1.o%s}}} \
> --   crti.o%s %{static:crtbeginT.o%s;: %{shared:crtbeginS.o%s} \
> -+    %{" PIE_SPEC ":%{static:rcrt1.o%s;:Scrt1.o%s}} %{" NO_PIE_SPEC
> ":crt1.o%s}}} \
> -+   crti.o%s %{shared:crtbeginS.o%s;: \
> -             %{" PIE_SPEC ":crtbeginS.o%s} \
> --            %{" NO_PIE_SPEC ":crtbegin.o%s}} \
> -+            %{" NO_PIE_SPEC ":%{static:crtbeginT.o%s;:crtbegin.o%s}}} \
> -    %{fvtable-verify=none:%s; \
> -      fvtable-verify=preinit:vtv_start_preinit.o%s; \
> -      fvtable-verify=std:vtv_start.o%s} \
> ---
> -2.13.1
> -
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
> b/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
> deleted file mode 100644
> index 0212507..0000000
> ---
> a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
> +++ /dev/null
> @@ -1,194 +0,0 @@
> -From 8c18b422211878ba02503462cb22a2cc25a0a325 Mon Sep 17 00:00:00 2001
> -From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
> -Date: Thu, 19 Oct 2017 13:14:55 +0000
> -Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd
> peepholing
> - with -mno-unaligned-access
> -
> -Peephole patterns exist in the arm backend to spot load/store
> -operations to adjacent memory operations in order to convert them into
> -ldrd/strd instructions.  However, when we have strict alignment
> -enforced, then we can only do this if the accesses are known to be
> -64-bit aligned; this is unlikely to be the case for most loads.  The
> -patch adds some alignment checking to the code that validates the
> -addresses for use in the peephole patterns.  This should also fix
> -incorrect generation of ldrd/strd with unaligned accesses that could
> -previously have occurred on ARMv5e where all such operations must be
> -64-bit aligned.
> -
> -I've added some new tests as well.  In doing so I discovered that the
> -ldrd/strd peephole tests could never fail since they would match the
> -source file name in the scanned assembly as well as any instructions
> -of the intended type.  I've fixed those by tightening the scan results
> -slightly.
> -
> -gcc:
> -
> -* config/arm/arm.c (align_ok_ldrd_strd): New function.
> -(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
> -mem into it.
> -(gen_operands_ldrd_strd): Validate the alignment of the accesses.
> -
> -testsuite:
> -
> -* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
> -* gcc.target/arm/peep-strd-1.c: Likewise.
> -* gcc.target/arm/peep-ldrd-2.c: New test.
> -* gcc.target/arm/peep-strd-2.c: New test.
> -
> -
> -
> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@253891
> 138bc75d-0d04-0410-961f-82ee72b054a4
> ----
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - gcc/ChangeLog                                      |  8 +++++++
> - gcc/config/arm/arm.c                               | 27
> ++++++++++++++++++----
> - gcc/testsuite/ChangeLog                            |  8 +++++++
> - gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
> - .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
> - gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
> - .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
> - 7 files changed, 44 insertions(+), 11 deletions(-)
> - copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
> - copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
> -
> -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> -index 1ded0d2a17d..989957f048e 100644
> ---- a/gcc/config/arm/arm.c
> -+++ b/gcc/config/arm/arm.c
> -@@ -15199,12 +15199,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn,
> HOST_WIDE_INT offset,
> -   return true;
> - }
> -
> -+/* Return true if a 64-bit access with alignment ALIGN and with a
> -+   constant offset OFFSET from the base pointer is permitted on this
> -+   architecture.  */
> -+static bool
> -+align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
> -+{
> -+  return (unaligned_access
> -+        ? (align >= BITS_PER_WORD && (offset & 3) == 0)
> -+        : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
> -+}
> -+
> - /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
> -    operand MEM's address contains an immediate offset from the base
> --   register and has no side effects, in which case it sets BASE and
> --   OFFSET accordingly.  */
> -+   register and has no side effects, in which case it sets BASE,
> -+   OFFSET and ALIGN accordingly.  */
> - static bool
> --mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
> -+mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT
> *align)
> - {
> -   rtx addr;
> -
> -@@ -15223,6 +15234,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx
> *offset)
> -   gcc_assert (MEM_P (mem));
> -
> -   *offset = const0_rtx;
> -+  *align = MEM_ALIGN (mem);
> -
> -   addr = XEXP (mem, 0);
> -
> -@@ -15263,7 +15275,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
> -                         bool const_store, bool commute)
> - {
> -   int nops = 2;
> --  HOST_WIDE_INT offsets[2], offset;
> -+  HOST_WIDE_INT offsets[2], offset, align[2];
> -   rtx base = NULL_RTX;
> -   rtx cur_base, cur_offset, tmp;
> -   int i, gap;
> -@@ -15275,7 +15287,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
> -      registers, and the corresponding memory offsets.  */
> -   for (i = 0; i < nops; i++)
> -     {
> --      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base,
> &cur_offset))
> -+      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base,
> &cur_offset,
> -+                               &align[i]))
> -         return false;
> -
> -       if (i == 0)
> -@@ -15389,6 +15402,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
> -       /* Swap the instructions such that lower memory is accessed
> first.  */
> -       std::swap (operands[0], operands[1]);
> -       std::swap (operands[2], operands[3]);
> -+      std::swap (align[0], align[1]);
> -       if (const_store)
> -         std::swap (operands[4], operands[5]);
> -     }
> -@@ -15402,6 +15416,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
> -   if (gap != 4)
> -     return false;
> -
> -+  if (!align_ok_ldrd_strd (align[0], offset))
> -+    return false;
> -+
> -   /* Make sure we generate legal instructions.  */
> -   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
> -                              false, load))
> -diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> -index eb2b86ee7b6..d49eff6b87e 100644
> ---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> -+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> -@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
> -   *p = a;
> -   return a;
> - }
> --/* { dg-final { scan-assembler "ldrd" } } */
> -+/* { dg-final { scan-assembler "ldrd\\t" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
> -similarity index 63%
> -copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> -copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
> -index eb2b86ee7b6..6822c2b1454 100644
> ---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
> -+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-require-effective-target arm_prefer_ldrd_strd } */
> --/* { dg-options "-O2" }  */
> -+/* { dg-options "-O2 -mno-unaligned-access" }  */
> - int foo(int a, int b, int* p, int *q)
> - {
> -   a = p[2] + p[3];
> -@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
> -   *p = a;
> -   return a;
> - }
> --/* { dg-final { scan-assembler "ldrd" } } */
> -+/* { dg-final { scan-assembler-not "ldrd\\t" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> -index bd330769599..fe1beac7229 100644
> ---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> -+++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> -@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
> -   p[2] = a;
> -   p[3] = b;
> - }
> --/* { dg-final { scan-assembler "strd" } } */
> -+/* { dg-final { scan-assembler "strd\\t" } } */
> -diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
> -similarity index 58%
> -copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
> -copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
> -index bd330769599..bfc5ebe9eec 100644
> ---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
> -+++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
> -@@ -1,9 +1,9 @@
> - /* { dg-do compile } */
> - /* { dg-require-effective-target arm_prefer_ldrd_strd } */
> --/* { dg-options "-O2" }  */
> -+/* { dg-options "-O2 -mno-unaligned-access" }  */
> - void foo(int a, int b, int* p)
> - {
> -   p[2] = a;
> -   p[3] = b;
> - }
> --/* { dg-final { scan-assembler "strd" } } */
> -+/* { dg-final { scan-assembler-not "strd\\t" } } */
> ---
> -2.15.0
> -
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc
> b/meta/recipes-devtools/gcc/gcc-7.3.inc
> similarity index 92%
> rename from meta/recipes-devtools/gcc/gcc-7.2.inc
> rename to meta/recipes-devtools/gcc/gcc-7.3.inc
> index f3d8a5e..efa62ea 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -2,13 +2,13 @@ require gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
>
> -PV = "7.2.0"
> +PV = "7.3.0"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV = "7.2.0"
> +BINV = "7.3.0"
>
> -FILESEXTRAPATHS =.
> "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
> +FILESEXTRAPATHS =.
> "${FILE_DIRNAME}/gcc-7.3:${FILE_DIRNAME}/gcc-7.3/backport:"
>
>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native
> flex-native"
> @@ -78,11 +78,10 @@ SRC_URI = "\
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> -
>  file://0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
> -           file://0001-PR-rtl-optimization-81803.patch \
>  "
> -SRC_URI[md5sum] = "ff370482573133a7fcdd96cd2f552292"
> -SRC_URI[sha256sum] =
> "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"
> +
> +SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
> +SRC_URI[sha256sum] =
> "832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"
>
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
> similarity index 97%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
> index 4d4e987..fe13ed6 100644
> ---
> a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.patch
> +++
> b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.patch
> @@ -138,16 +138,16 @@ index 68a558e9992..060cd7169c6 100644
>   @opindex Wfloat-equal
>   @opindex Wno-float-equal
>  diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 120c5c0792a..6315aa0dd16 100644
> +index c48178f..f63d53d 100644
>  --- a/gcc/gcc.c
>  +++ b/gcc/gcc.c
> -@@ -1035,6 +1035,8 @@ proper position among the other output files.  */
> +@@ -1029,6 +1029,8 @@ proper position among the other output files.  */
>      "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
>      "%X %{o*} %{e*} %{N} %{n} %{r}\
>       %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
>  +    %{Wno-poison-system-directories:--no-poison-system-directories} \
>  +
> %{Werror=poison-system-directories:--error-poison-system-directories} \
> -     %{static:} %{L*} %(mfwrap) %(link_libgcc) " \
> +     %{static|no-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
>       VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC "
> \
>       %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
>  diff --git a/gcc/incpath.c b/gcc/incpath.c
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-hack.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-ABI.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-long-error.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-too-long-error.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-long-error.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch
> rename to meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-headers-can-be-included.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-can-be-included.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-musl-ldso.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-musl-ldso.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-musl-ldso.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for-nativesdk-gcc.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-for-nativesdk-gcc.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for-nativesdk-gcc.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-musl.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-musl.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
> new file mode 100644
> index 0000000..a96e913
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch
> @@ -0,0 +1,46 @@
> +From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 13 Jun 2017 12:12:52 -0700
> +Subject: [PATCH 49/49] gcc: Enable static PIE
> +
> +Static PIE support in GCC
> +see
> +https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html
> +
> +startfiles before patch:
> + -static -> crt1.o crti.o crtbeginT.o
> + -static -PIE -> crt1.o crti.o crtbeginT.o
> +
> +after patch:
> + -static -> crt1.o crti.o crtbeginT.o
> + -static -PIE -> rcrt1.o crti.o crtbeginS.o
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +---
> + gcc/config/gnu-user.h | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h
> +index de605b0..b035bbe 100644
> +--- a/gcc/config/gnu-user.h
> ++++ b/gcc/config/gnu-user.h
> +@@ -52,11 +52,11 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> + #define GNU_USER_TARGET_STARTFILE_SPEC \
> +   "%{shared:; \
> +      pg|p|profile:gcrt1.o%s; \
> +-     static:crt1.o%s; \
> ++     static: %{" PIE_SPEC ": rcrt1.o%s; :crt1.o%s}; \
> +      " PIE_SPEC ":Scrt1.o%s; \
> +      :crt1.o%s} \
> +    crti.o%s \
> +-   %{static:crtbeginT.o%s; \
> ++   %{static: %{" PIE_SPEC ": crtbeginS.o%s; :crtbeginT.o%s}; \
> +      shared|" PIE_SPEC ":crtbeginS.o%s; \
> +      :crtbegin.o%s} \
> +    %{fvtable-verify=none:%s; \
> +
> +2.13.1
> +
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
> b/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompiled-hdr.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precompiled-hdr.patch
> rename to
> meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompiled-hdr.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc
> b/meta/recipes-devtools/gcc/gcc-common.inc
> index b5975b5..aa3b53e 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -105,6 +105,7 @@ gcclibdir = "${libdir}/gcc"
>  BINV = "${PV}"
>  #S = "${WORKDIR}/gcc-${PV}"
>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> +
>  B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>
>  target_includedir ?= "${includedir}"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross-initial_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-initial_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-cross_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-crosssdk_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-crosssdk_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-runtime_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-runtime_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-sanitizers_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-sanitizers_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-source_7.2.bb
> b/meta/recipes-devtools/gcc/gcc-source_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc-source_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc-source_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/gcc_7.2.bb
> b/meta/recipes-devtools/gcc/gcc_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/gcc_7.2.bb
> rename to meta/recipes-devtools/gcc/gcc_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
> b/meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc-initial_7.2.bb
> rename to meta/recipes-devtools/gcc/libgcc-initial_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgcc_7.2.bb
> b/meta/recipes-devtools/gcc/libgcc_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgcc_7.2.bb
> rename to meta/recipes-devtools/gcc/libgcc_7.3.bb
> diff --git a/meta/recipes-devtools/gcc/libgfortran_7.2.bb
> b/meta/recipes-devtools/gcc/libgfortran_7.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/gcc/libgfortran_7.2.bb
> rename to meta/recipes-devtools/gcc/libgfortran_7.3.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0ec3506dee990563b697a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Jan 26, 2018 =
at 3:25 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The static PIE patch was updated by Juro Bystricky =
&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.byst=
ricky@intel.com</a>&gt;<br>
to work with gcc 7.3.<br>
<br>
This update from the stable gcc 7 branch includes the retpoline<br>
functionality which is useful to assist with recent security issues.<br>
<br>
Two backported patches were dropped as they&#39;re included in 7.3.</blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">As confirmed on IRC Looks good to install=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Reviewed-by: Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt;</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../gcc-7.2/0001-PR-rtl-optimization-81803.patch=C2=A0 =C2=A0|=C2=A0 =
52 ------<br>
=C2=A0.../gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch=C2=A0 =C2=A0|=C2=A0 =
37 ----<br>
=C2=A0...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 ------------=
---------<br>
=C2=A0.../gcc/{gcc-7.2.inc =3D&gt; gcc-7.3.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
=C2=A0.../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../{gcc-7.2 =3D&gt; gcc-7.3}/0008-c99-snprintf.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0.../0009-gcc-poison-system-directories.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
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
=C2=A0.../{gcc-7.2 =3D&gt; gcc-7.3}/0022-Disable-sdt.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0023-libtool.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...tilib-config-files-from-B-instead-of-usin.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-libdir-from-.la-which-usually-points-to-.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0027-export-CPP.patch |=C2=A0 =C2=
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
=C2=A0.../gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch=C2=A0 =C2=A0|=C2=A0 =
46 +++++<br>
=C2=A0...le-non-legitimate-address-in-riscv_legiti.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../fix-segmentation-fault-precompiled-hdr.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0meta/recipes-devtools/gcc/gcc-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://s-canadian_7.2.bb" rel=3D"noreferrer" target=3D"=
_blank">s-canadian_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.3.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://oss-initial_7.2.bb" rel=3D"noreferrer" target=3D=
"_blank">oss-initial_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-initial=
_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.3.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-cross_7.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-cross_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross_7.3.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.3.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...-<a href=3D"http://initial_7.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">initial_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_7.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.3.bb</a>} =
|=C2=A0 =C2=A00<br>
=C2=A0.../{<a href=3D"http://gcc-crosssdk_7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-crosssdk_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.3.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-runtime_7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-runtime=
_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.3.bb</a>} |=C2=
=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://gcc-sanitizers_7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-sanitizers_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-sanitiz=
ers_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.3.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-source_7.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-source_7.2.bb</a> =3D&gt; <a href=3D"http://gcc-source_7.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.3.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_7.2.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc_7.2.bb</a> =3D&gt; <a href=3D"http://gcc_7.3.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc_7.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0...<a href=3D"http://libgcc-initial_7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc-initial_7.2.bb</a> =3D&gt; <a href=3D"http://libgcc-init=
ial_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.3.bb</a>}=
 |=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_7.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_7.2.bb</a> =3D&gt; <a href=3D"http://libgcc_7.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../gcc/{<a href=3D"http://libgfortran_7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_7.2.bb</a> =3D&gt; <a href=3D"http://libgfortran=
_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.3.bb</a>} |=C2=
=A0 =C2=A00<br>
=C2=A061 files changed, 56 insertions(+), 293 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-opti=
mization-81803.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-=
static-PIE.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-8244=
5-suppress-32-bit-aligned-ldrd-strd-peeph.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2.inc =3D&gt; gcc-7.3.inc} (9=
2%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0008-c99-s=
nprintf.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0009-gcc-p=
oison-system-directories.patch (97%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0010-gcc-p=
oison-dir-extend.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0011-gcc-4=
.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0012-64-bi=
t-multilib-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0013-optio=
nal-libstdc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0014-gcc-d=
isable-MASK_RELAX_PIC_CALLS-bit.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0015-COLLE=
CT_GCC_OPTIONS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0016-Use-t=
he-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0017-fortr=
an-cross-compile-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0018-cpp-h=
onor-sysroot.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0019-MIPS6=
4-Default-to-N64-ABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0020-Defin=
e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0021-gcc-F=
ix-argument-list-too-long-error.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0022-Disab=
le-sdt.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0023-libto=
ol.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0024-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0025-Use-t=
he-multilib-config-files-from-B-instead-of-usin.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0026-Avoid=
-using-libdir-from-.la-which-usually-points-to-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0027-expor=
t-CPP.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0028-Enabl=
e-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0029-Disab=
le-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0030-Ensur=
e-target-gcc-headers-can-be-included.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0031-gcc-4=
.8-won-t-build-with-disable-dependency-tracking.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0032-Don-t=
-search-host-directory-during-relink-if-inst_pr.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0033-Use-S=
YSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0034-aarch=
64-Add-support-for-musl-ldso.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0035-libcc=
1-fix-libcc1-s-install-path-and-rpath.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0036-handl=
e-sysroot-support-for-nativesdk-gcc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0037-Searc=
h-target-sysroot-gcc-version-specific-dirs-with.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0038-Fix-v=
arious-_FOR_BUILD-and-related-variables.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0039-nios2=
-Define-MUSL_DYNAMIC_LINKER.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0040-Add-s=
sp_nonshared-to-link-commandline-for-musl-targe.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0041-gcc-l=
ibcpp-support-ffile-prefix-map-old-new.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0042-Reuse=
-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0043-gcc-f=
inal.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0044-libgc=
c-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0045-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0046-libgc=
c_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0047-sync-=
gcc-stddef.h-with-musl.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-=
static-PIE.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/0050-RISC-=
V-Handle-non-legitimate-address-in-riscv_legiti.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-7.2 =3D&gt; gcc-7.3}/fix-segmen=
tation-fault-precompiled-hdr.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a=
> =3D&gt; <a href=3D"http://gcc-cross-canadian_7.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-cross-canadian_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-initial=
_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a> =
=3D&gt; <a href=3D"http://gcc-cross-initial_7.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-cross-initial_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_7.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.2.bb</a> =3D&gt; <a href=
=3D"http://gcc-cross_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross=
_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk-init=
ial_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.b=
b</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_7.3.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-crosssdk-initial_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_7.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.2.bb</a> =3D&gt; <a=
 href=3D"http://gcc-crosssdk_7.3.bb" rel=3D"noreferrer" target=3D"_blank">g=
cc-crosssdk_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_7.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.2.bb</a> =3D&gt; <a h=
ref=3D"http://gcc-runtime_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-=
runtime_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_7.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a> =3D&gt=
; <a href=3D"http://gcc-sanitizers_7.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-sanitizers_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-source_7.2.bb</a> =3D&gt; <a hre=
f=3D"http://gcc-source_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sou=
rce_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc_7.2.bb</a> =3D&gt; <a href=3D"http://=
gcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_7.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.2.bb</a> =3D&gt=
; <a href=3D"http://libgcc-initial_7.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libgcc-initial_7.3.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_7.2.bb" re=
l=3D"noreferrer" target=3D"_blank">libgcc_7.2.bb</a> =3D&gt; <a href=3D"htt=
p://libgcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_7.3.bb</a>} =
(100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_7.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.2.bb</a> =3D&gt; <a h=
ref=3D"http://libgfortran_7.3.bb" rel=3D"noreferrer" target=3D"_blank">libg=
fortran_7.3.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-818=
03.patch b/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803=
.patch<br>
deleted file mode 100644<br>
index 292e734..0000000<br>
--- a/meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patc=
h<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 5cbb8e6b1122092b3eaabd4270b2f316aa40407c Mon Sep 17 00:00:00 2001<br>
-From: ebotcazou &lt;ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
-Date: Tue, 31 Oct 2017 18:27:52 +0000<br>
-Subject: [PATCH]=C2=A0 =C2=A0 =C2=A0 =C2=A0PR rtl-optimization/81803=C2=A0=
 =C2=A0 =C2=A0 =C2=A0* lra-constraints.c<br>
- (curr_insn_transform): Also reload the whole=C2=A0 register for a strict =
subreg<br>
- no wider than a word if this is for=C2=A0 =C2=A0a WORD_REGISTER_OPERATION=
S target.<br>
-<br>
-git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/trunk@254275" =
rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/trunk@254275</a> 1=
38bc75d-0d04-0410-961f-82ee72b054a4<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-This patch removes changes to Changelog from the original patch upstream. =
This is<br>
-because we are backporting a patch to a stable version, making changes to =
Changelog,<br>
-especially up &#39;* GCC 7.2.0 released.&#39;, feels a little weird.<br>
-<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
----<br>
- gcc/lra-constraints.c | 11 ++++++++---<br>
- 2 files changed, 16 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c<br>
-index a423f069836..3758409bb9c 100644<br>
---- a/gcc/lra-constraints.c<br>
-+++ b/gcc/lra-constraints.c<br>
-@@ -4207,8 +4207,9 @@ curr_insn_transform (bool check_only_p)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D SUBREG_REG (*loc);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0byte =3D SUBREG_BYTE (*loc=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (REG_P (reg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Strict_low_par=
t requires reload the register not<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the =
sub-register.=C2=A0 */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Strict_low_par=
t requires reloading the register and not<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0just=
 the subreg.=C2=A0 Likewise for a strict subreg no wider<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0than=
 a word for WORD_REGISTER_OPERATIONS targets.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (=
curr_static_id-&gt;operand[i].strict_low<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|| (!paradoxical_subreg_p (mode, GET_MODE (reg))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;&amp; (hard_regno<br>
-@@ -4219,7 +4220,11 @@ curr_insn_transform (bool check_only_p)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;&amp; (goal_alt[i] =3D=3D NO_REGS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (simplify_subreg_regno<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ira_class_hard_regs[goal_alt[=
i]][0],<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_MODE (reg), byte, mode) &g=
t;=3D 0)))))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_MODE (reg), byte, mode) &g=
t;=3D 0)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || =
(GET_MODE_PRECISION (mode)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt; GET_MODE_PRECISION (GET_MODE (reg))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;&amp; GET_MODE_SIZE (GET_MODE (reg)) &lt;=3D UNITS_PER_WORD=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;&amp; WORD_REGISTER_OPERATIONS)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* An OP_INO=
UT is required when reloading a subreg of a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode=
 wider than a word to ensure that data beyond the<br>
---<br>
-2.13.0<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.p=
atch b/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch<b=
r>
deleted file mode 100644<br>
index 879e360..0000000<br>
--- a/meta/recipes-devtools/gcc/gcc-7.2/0048-gcc-Enable-static-PIE.patch<br=
>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 13 Jun 2017 12:12:52 -0700<br>
-Subject: [PATCH 49/49] gcc: Enable static PIE<br>
-<br>
-Static PIE support in GCC<br>
-see<br>
-<a href=3D"https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html</a=
><br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- gcc/config/gnu-user.h | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h<br>
-index 2787a3d16be..ee7b781319e 100644<br>
---- a/gcc/config/gnu-user.h<br>
-+++ b/gcc/config/gnu-user.h<br>
-@@ -51,10 +51,10 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.=C2=A0 If not, see<br>
- #if defined HAVE_LD_PIE<br>
- #define GNU_USER_TARGET_STARTFILE_SPEC \<br>
-=C2=A0 =C2=A0&quot;%{!shared: %{pg|p|profile:gcrt1.o%s;: \<br>
--=C2=A0 =C2=A0 %{&quot; PIE_SPEC &quot;:Scrt1.o%s} %{&quot; NO_PIE_SPEC &q=
uot;:crt1.o%s}}} \<br>
--=C2=A0 =C2=A0crti.o%s %{static:crtbeginT.o%s;: %{shared:crtbeginS.o%s} \<=
br>
-+=C2=A0 =C2=A0 %{&quot; PIE_SPEC &quot;:%{static:rcrt1.o%s;:Scrt1.o%s}} %{=
&quot; NO_PIE_SPEC &quot;:crt1.o%s}}} \<br>
-+=C2=A0 =C2=A0crti.o%s %{shared:crtbeginS.o%s;: \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%{&quot; PIE_SPEC &quot;:c=
rtbeginS.o%s} \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %{&quot; NO_PIE_SPEC &quot;:crt=
begin.o%s}} \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %{&quot; NO_PIE_SPEC &quot;:%{s=
tatic:crtbeginT.o%s;:crtbegin.o%s}}} \<br>
-=C2=A0 =C2=A0 %{fvtable-verify=3Dnone:%s; \<br>
-=C2=A0 =C2=A0 =C2=A0 fvtable-verify=3Dpreinit:vtv_start_preinit.o%s; \<br>
-=C2=A0 =C2=A0 =C2=A0 fvtable-verify=3Dstd:vtv_start.o%s} \<br>
---<br>
-2.13.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-3=
2-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-7.2/005=
1-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch<br>
deleted file mode 100644<br>
index 0212507..0000000<br>
--- a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-a=
ligned-ldrd-strd-peeph.patch<br>
+++ /dev/null<br>
@@ -1,194 +0,0 @@<br>
-From 8c18b422211878ba02503462cb22a2cc25a0a325 Mon Sep 17 00:00:00 2001<br>
-From: rearnsha &lt;rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
-Date: Thu, 19 Oct 2017 13:14:55 +0000<br>
-Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepho=
ling<br>
- with -mno-unaligned-access<br>
-<br>
-Peephole patterns exist in the arm backend to spot load/store<br>
-operations to adjacent memory operations in order to convert them into<br>
-ldrd/strd instructions.=C2=A0 However, when we have strict alignment<br>
-enforced, then we can only do this if the accesses are known to be<br>
-64-bit aligned; this is unlikely to be the case for most loads.=C2=A0 The<=
br>
-patch adds some alignment checking to the code that validates the<br>
-addresses for use in the peephole patterns.=C2=A0 This should also fix<br>
-incorrect generation of ldrd/strd with unaligned accesses that could<br>
-previously have occurred on ARMv5e where all such operations must be<br>
-64-bit aligned.<br>
-<br>
-I&#39;ve added some new tests as well.=C2=A0 In doing so I discovered that=
 the<br>
-ldrd/strd peephole tests could never fail since they would match the<br>
-source file name in the scanned assembly as well as any instructions<br>
-of the intended type.=C2=A0 I&#39;ve fixed those by tightening the scan re=
sults<br>
-slightly.<br>
-<br>
-gcc:<br>
-<br>
-* config/arm/arm.c (align_ok_ldrd_strd): New function.<br>
-(mem_ok_for_ldrd_strd): New parameter align.=C2=A0 Extract the alignment o=
f the<br>
-mem into it.<br>
-(gen_operands_ldrd_strd): Validate the alignment of the accesses.<br>
-<br>
-testsuite:<br>
-<br>
-* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.<br>
-* gcc.target/arm/peep-strd-1.c: Likewise.<br>
-* gcc.target/arm/peep-ldrd-2.c: New test.<br>
-* gcc.target/arm/peep-strd-2.c: New test.<br>
-<br>
-<br>
-<br>
-git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-7=
-branch@253891" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/br=
anches/gcc-7-branch@253891</a> 138bc75d-0d04-0410-961f-82ee72b054a4<br>
----<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-<br>
- gcc/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 +++++++<br>
- gcc/config/arm/arm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++++++=
+++++++----<br>
- gcc/testsuite/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++<br>
- gcc/testsuite/gcc.target/arm/peep-ldrd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
- .../arm/{peep-ldrd-1.c =3D&gt; peep-ldrd-2.c}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- gcc/testsuite/gcc.target/arm/peep-strd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
- .../arm/{peep-strd-1.c =3D&gt; peep-strd-2.c}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- 7 files changed, 44 insertions(+), 11 deletions(-)<br>
- copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c =3D&gt; peep-ldrd-2.c} (=
63%)<br>
- copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c =3D&gt; peep-strd-2.c} (=
58%)<br>
-<br>
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c<br>
-index 1ded0d2a17d..989957f048e 100644<br>
---- a/gcc/config/arm/arm.c<br>
-+++ b/gcc/config/arm/arm.c<br>
-@@ -15199,12 +15199,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, =
HOST_WIDE_INT offset,<br>
-=C2=A0 =C2=A0return true;<br>
- }<br>
-<br>
-+/* Return true if a 64-bit access with alignment ALIGN and with a<br>
-+=C2=A0 =C2=A0constant offset OFFSET from the base pointer is permitted on=
 this<br>
-+=C2=A0 =C2=A0architecture.=C2=A0 */<br>
-+static bool<br>
-+align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)<br>
-+{<br>
-+=C2=A0 return (unaligned_access<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ? (align &gt;=3D BITS_PER_WORD &amp;&amp; (of=
fset &amp; 3) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 : (align &gt;=3D 2 * BITS_PER_WORD &amp;&amp;=
 (offset &amp; 7) =3D=3D 0));<br>
-+}<br>
-+<br>
- /* Helper for gen_operands_ldrd_strd.=C2=A0 Returns true iff the memory<b=
r>
-=C2=A0 =C2=A0 operand MEM&#39;s address contains an immediate offset from =
the base<br>
--=C2=A0 =C2=A0register and has no side effects, in which case it sets BASE=
 and<br>
--=C2=A0 =C2=A0OFFSET accordingly.=C2=A0 */<br>
-+=C2=A0 =C2=A0register and has no side effects, in which case it sets BASE=
,<br>
-+=C2=A0 =C2=A0OFFSET and ALIGN accordingly.=C2=A0 */<br>
- static bool<br>
--mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)<br>
-+mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *ali=
gn)<br>
- {<br>
-=C2=A0 =C2=A0rtx addr;<br>
-<br>
-@@ -15223,6 +15234,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *off=
set)<br>
-=C2=A0 =C2=A0gcc_assert (MEM_P (mem));<br>
-<br>
-=C2=A0 =C2=A0*offset =3D const0_rtx;<br>
-+=C2=A0 *align =3D MEM_ALIGN (mem);<br>
-<br>
-=C2=A0 =C2=A0addr =3D XEXP (mem, 0);<br>
-<br>
-@@ -15263,7 +15275,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool const_store, bool commute)<br>
- {<br>
-=C2=A0 =C2=A0int nops =3D 2;<br>
--=C2=A0 HOST_WIDE_INT offsets[2], offset;<br>
-+=C2=A0 HOST_WIDE_INT offsets[2], offset, align[2];<br>
-=C2=A0 =C2=A0rtx base =3D NULL_RTX;<br>
-=C2=A0 =C2=A0rtx cur_base, cur_offset, tmp;<br>
-=C2=A0 =C2=A0int i, gap;<br>
-@@ -15275,7 +15287,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,<=
br>
-=C2=A0 =C2=A0 =C2=A0 registers, and the corresponding memory offsets.=C2=
=A0 */<br>
-=C2=A0 =C2=A0for (i =3D 0; i &lt; nops; i++)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 if (!mem_ok_for_ldrd_strd (operands[nops+i], &amp;cu=
r_base, &amp;cur_offset))<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!mem_ok_for_ldrd_strd (operands[nops+i], &amp;cu=
r_base, &amp;cur_offset,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;align[i]))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0)<br>
-@@ -15389,6 +15402,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Swap the instructions such that lower memory=
 is accessed first.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0std::swap (operands[0], operands[1]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0std::swap (operands[2], operands[3]);<br>
-+=C2=A0 =C2=A0 =C2=A0 std::swap (align[0], align[1]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (const_store)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::swap (operands[4], operands[5]);<br=
>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -15402,6 +15416,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,<=
br>
-=C2=A0 =C2=A0if (gap !=3D 4)<br>
-=C2=A0 =C2=A0 =C2=A0return false;<br>
-<br>
-+=C2=A0 if (!align_ok_ldrd_strd (align[0], offset))<br>
-+=C2=A0 =C2=A0 return false;<br>
-+<br>
-=C2=A0 =C2=A0/* Make sure we generate legal instructions.=C2=A0 */<br>
-=C2=A0 =C2=A0if (operands_ok_ldrd_strd (operands[0], operands[1], base, of=
fset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false, load))<br>
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gc=
c.target/arm/peep-ldrd-1.c<br>
-index eb2b86ee7b6..d49eff6b87e 100644<br>
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c<br>
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c<br>
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)<br>
-=C2=A0 =C2=A0*p =3D a;<br>
-=C2=A0 =C2=A0return a;<br>
- }<br>
--/* { dg-final { scan-assembler &quot;ldrd&quot; } } */<br>
-+/* { dg-final { scan-assembler &quot;ldrd\\t&quot; } } */<br>
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gc=
c.target/arm/peep-ldrd-2.c<br>
-similarity index 63%<br>
-copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c<br>
-copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c<br>
-index eb2b86ee7b6..6822c2b1454 100644<br>
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c<br>
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c<br>
-@@ -1,6 +1,6 @@<br>
- /* { dg-do compile } */<br>
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */<br>
--/* { dg-options &quot;-O2&quot; }=C2=A0 */<br>
-+/* { dg-options &quot;-O2 -mno-unaligned-access&quot; }=C2=A0 */<br>
- int foo(int a, int b, int* p, int *q)<br>
- {<br>
-=C2=A0 =C2=A0a =3D p[2] + p[3];<br>
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)<br>
-=C2=A0 =C2=A0*p =3D a;<br>
-=C2=A0 =C2=A0return a;<br>
- }<br>
--/* { dg-final { scan-assembler &quot;ldrd&quot; } } */<br>
-+/* { dg-final { scan-assembler-not &quot;ldrd\\t&quot; } } */<br>
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gc=
c.target/arm/peep-strd-1.c<br>
-index bd330769599..fe1beac7229 100644<br>
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c<br>
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c<br>
-@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)<br>
-=C2=A0 =C2=A0p[2] =3D a;<br>
-=C2=A0 =C2=A0p[3] =3D b;<br>
- }<br>
--/* { dg-final { scan-assembler &quot;strd&quot; } } */<br>
-+/* { dg-final { scan-assembler &quot;strd\\t&quot; } } */<br>
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gc=
c.target/arm/peep-strd-2.c<br>
-similarity index 58%<br>
-copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c<br>
-copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c<br>
-index bd330769599..bfc5ebe9eec 100644<br>
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c<br>
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c<br>
-@@ -1,9 +1,9 @@<br>
- /* { dg-do compile } */<br>
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */<br>
--/* { dg-options &quot;-O2&quot; }=C2=A0 */<br>
-+/* { dg-options &quot;-O2 -mno-unaligned-access&quot; }=C2=A0 */<br>
- void foo(int a, int b, int* p)<br>
- {<br>
-=C2=A0 =C2=A0p[2] =3D a;<br>
-=C2=A0 =C2=A0p[3] =3D b;<br>
- }<br>
--/* { dg-final { scan-assembler &quot;strd&quot; } } */<br>
-+/* { dg-final { scan-assembler-not &quot;strd\\t&quot; } } */<br>
---<br>
-2.15.0<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/=
gcc/gcc-7.3.inc<br>
similarity index 92%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2.inc<br>
rename to meta/recipes-devtools/gcc/gcc-7.3.inc<br>
index f3d8a5e..efa62ea 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc<br>
@@ -2,13 +2,13 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;7.2.0&quot;<br>
+PV =3D &quot;7.3.0&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;7.2.0&quot;<br>
+BINV =3D &quot;7.3.0&quot;<br>
<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2=
/backport:&quot;<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-7.3:${FILE_DIRNAME}/gcc-7.3=
/backport:&quot;<br>
<br>
=C2=A0DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot;<br>
=C2=A0NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native&quot;<br>
@@ -78,11 +78,10 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0051-ARM-PR-82445-suppress=
-32-bit-aligned-ldrd-strd-peeph.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-PR-rtl-optimization-8=
1803.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;ff370482573133a7fcdd96cd2f552292&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029=
aae0f4e48841088479a&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;be2da21680f27624f3a87055c4ba5af2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;832ca6ae04636adbb430e865a1451adf6979ab44ca1c8=
374f61fba65645ce15c&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
=C2=A0#S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/git&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch b/me=
ta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0008-c99-snprintf.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0008-c99-snprintf.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-direc=
tories.patch b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-dir=
ectories.patch<br>
similarity index 97%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-direct=
ories.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-director=
ies.patch<br>
index 4d4e987..fe13ed6 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.2/0009-gcc-poison-system-directories.=
patch<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0009-gcc-poison-system-directories.=
patch<br>
@@ -138,16 +138,16 @@ index 68a558e9992..060cd7169c6 100644<br>
=C2=A0 @opindex Wfloat-equal<br>
=C2=A0 @opindex Wno-float-equal<br>
=C2=A0diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
-index 120c5c0792a..6315aa0dd16 100644<br>
+index c48178f..f63d53d 100644<br>
=C2=A0--- a/gcc/gcc.c<br>
=C2=A0+++ b/gcc/gcc.c<br>
-@@ -1035,6 +1035,8 @@ proper position among the other output files.=C2=A0 =
*/<br>
+@@ -1029,6 +1029,8 @@ proper position among the other output files.=C2=A0 =
*/<br>
=C2=A0 =C2=A0 =C2=A0&quot;%{fuse-ld=3D*:-fuse-ld=3D%*} &quot; LINK_COMPRESS=
_DEBUG_SPEC \<br>
=C2=A0 =C2=A0 =C2=A0&quot;%X %{o*} %{e*} %{N} %{n} %{r}\<br>
=C2=A0 =C2=A0 =C2=A0 %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:=
%S}} \<br>
=C2=A0+=C2=A0 =C2=A0 %{Wno-poison-system-directories:--no-poison-system-dir=
ectories} \<br>
=C2=A0+=C2=A0 =C2=A0 %{Werror=3Dpoison-system-directories:--error-poison-sy=
stem-directories} \<br>
-=C2=A0 =C2=A0 =C2=A0%{static:} %{L*} %(mfwrap) %(link_libgcc) &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0%{static|no-pie:} %{L*} %(mfwrap) %(link_libgcc) &quot=
; \<br>
=C2=A0 =C2=A0 =C2=A0 VTABLE_VERIFICATION_SPEC &quot; &quot; SANITIZER_EARLY=
_SPEC &quot; %o &quot; CHKP_SPEC &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:=
%*} 1):\<br>
=C2=A0diff --git a/gcc/incpath.c b/gcc/incpath.c<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.p=
atch b/meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patch<b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0010-gcc-poison-dir-extend.pa=
tch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0010-gcc-poison-dir-extend.patc=
h<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAG=
S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSRO=
OT_CFLAGS_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0011-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0011-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.pa=
tch b/meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0012-64-bit-multilib-hack.pat=
ch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0012-64-bit-multilib-hack.patch=
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0013-optional-libstdc.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-7.3/0013-optional-libstdc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_=
PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MA=
SK_RELAX_PIC_CALLS-bit.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0014-gcc-disable-MASK_RELAX_P=
IC_CALLS-bit.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0014-gcc-disable-MASK_RELAX_PIC=
_CALLS-bit.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.pat=
ch b/meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0015-COLLECT_GCC_OPTIONS.patc=
h<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0015-COLLECT_GCC_OPTIONS.patch<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-7.3/0016-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0016-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0016-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-ha=
ck.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0017-fortran-cross-compile-ha=
ck.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0017-fortran-cross-compile-hack=
.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0018-cpp-honor-sysroot.patch<=
br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0018-cpp-honor-sysroot.patch<br=
>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-A=
BI.patch b/meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0019-MIPS64-Default-to-N64-AB=
I.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0019-MIPS64-Default-to-N64-ABI.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-7.3/002=
0-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0020-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0020-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-t=
oo-long-error.patch b/meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argume=
nt-list-too-long-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0021-gcc-Fix-argument-list-to=
o-long-error.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0021-gcc-Fix-argument-list-too-=
long-error.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch b/met=
a/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0022-Disable-sdt.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0022-Disable-sdt.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch b/meta/re=
cipes-devtools/gcc/gcc-7.3/0023-libtool.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0023-libtool.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0023-libtool.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-7.3/0024-g=
cc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0024-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0024-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-7.3/002=
5-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0025-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0025-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-7.3/002=
6-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0026-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0026-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch b/meta=
/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0027-export-CPP.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0027-export-CPP.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-gene=
ration-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-7.3/002=
8-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0028-Enable-SPE-AltiVec-gener=
ation-on-powepc-linux-target.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0028-Enable-SPE-AltiVec-generat=
ion-on-powepc-linux-target.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OS=
DIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-7.3/002=
9-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0029-Disable-the-MULTILIB_OSD=
IRNAMES-and-other-multilib-o.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0029-Disable-the-MULTILIB_OSDIR=
NAMES-and-other-multilib-o.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-heade=
rs-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-ta=
rget-gcc-headers-can-be-included.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0030-Ensure-target-gcc-header=
s-can-be-included.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0030-Ensure-target-gcc-headers-=
can-be-included.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-wit=
h-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-7.3/003=
1-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0031-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0031-gcc-4.8-won-t-build-with-d=
isable-dependency-tracking.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-7.3/003=
2-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0032-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0032-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-7.3/003=
3-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0033-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0033-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for=
-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-suppo=
rt-for-musl-ldso.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0034-aarch64-Add-support-for-=
musl-ldso.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0034-aarch64-Add-support-for-mu=
sl-ldso.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-f=
ix-libcc1-s-install-path-and-rpath.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0035-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0035-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-=
for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sys=
root-support-for-nativesdk-gcc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0036-handle-sysroot-support-f=
or-nativesdk-gcc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0036-handle-sysroot-support-for=
-nativesdk-gcc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-7.3/003=
7-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0037-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0037-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-=
and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-va=
rious-_FOR_BUILD-and-related-variables.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0038-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0038-Fix-various-_FOR_BUILD-and=
-related-variables.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0039-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0039-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.3/004=
0-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0040-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0040-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffil=
e-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-lib=
cpp-support-ffile-prefix-map-old-new.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0041-gcc-libcpp-support-ffile=
-prefix-map-old-new.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0041-gcc-libcpp-support-ffile-p=
refix-map-old-new.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map=
-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-7.3/0042=
-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0042-Reuse-fdebug-prefix-map-=
to-replace-ffile-prefix-map.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0042-Reuse-fdebug-prefix-map-to=
-replace-ffile-prefix-map.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-pref=
ix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-7.3/004=
3-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0043-gcc-final.c-fdebug-prefi=
x-map-support-to-remap-sourc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0043-gcc-final.c-fdebug-prefix-=
map-support-to-remap-sourc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-=
ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-k=
nob-to-use-ldbl-128-on-ppc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0044-libgcc-Add-knob-to-use-l=
dbl-128-on-ppc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0044-libgcc-Add-knob-to-use-ldb=
l-128-on-ppc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-7.3/0045-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0045-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0045-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-7.3/004=
6-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0046-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-=
musl.patch b/meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-=
musl.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0047-sync-gcc-stddef.h-with-m=
usl.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0047-sync-gcc-stddef.h-with-mus=
l.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.p=
atch b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch<b=
r>
new file mode 100644<br>
index 0000000..a96e913<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0048-gcc-Enable-static-PIE.patch<br=
>
@@ -0,0 +1,46 @@<br>
+From 44ef80688b56beea85c0070840dea1e2a4e34aed Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 13 Jun 2017 12:12:52 -0700<br>
+Subject: [PATCH 49/49] gcc: Enable static PIE<br>
+<br>
+Static PIE support in GCC<br>
+see<br>
+<a href=3D"https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/ml/gcc/2015-06/msg00008.html</a=
><br>
+<br>
+startfiles before patch:<br>
+ -static -&gt; crt1.o crti.o crtbeginT.o<br>
+ -static -PIE -&gt; crt1.o crti.o crtbeginT.o<br>
+<br>
+after patch:<br>
+ -static -&gt; crt1.o crti.o crtbeginT.o<br>
+ -static -PIE -&gt; rcrt1.o crti.o crtbeginS.o<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
+<br>
+---<br>
+ gcc/config/gnu-user.h | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/gcc/config/gnu-user.h b/gcc/config/gnu-user.h<br>
+index de605b0..b035bbe 100644<br>
+--- a/gcc/config/gnu-user.h<br>
++++ b/gcc/config/gnu-user.h<br>
+@@ -52,11 +52,11 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.=C2=A0 If not, see<br>
+ #define GNU_USER_TARGET_STARTFILE_SPEC \<br>
+=C2=A0 =C2=A0&quot;%{shared:; \<br>
+=C2=A0 =C2=A0 =C2=A0 pg|p|profile:gcrt1.o%s; \<br>
+-=C2=A0 =C2=A0 =C2=A0static:crt1.o%s; \<br>
++=C2=A0 =C2=A0 =C2=A0static: %{&quot; PIE_SPEC &quot;: rcrt1.o%s; :crt1.o%=
s}; \<br>
+=C2=A0 =C2=A0 =C2=A0 &quot; PIE_SPEC &quot;:Scrt1.o%s; \<br>
+=C2=A0 =C2=A0 =C2=A0 :crt1.o%s} \<br>
+=C2=A0 =C2=A0 crti.o%s \<br>
+-=C2=A0 =C2=A0%{static:crtbeginT.o%s; \<br>
++=C2=A0 =C2=A0%{static: %{&quot; PIE_SPEC &quot;: crtbeginS.o%s; :crtbegin=
T.o%s}; \<br>
+=C2=A0 =C2=A0 =C2=A0 shared|&quot; PIE_SPEC &quot;:crtbeginS.o%s; \<br>
+=C2=A0 =C2=A0 =C2=A0 :crtbegin.o%s} \<br>
+=C2=A0 =C2=A0 %{fvtable-verify=3Dnone:%s; \<br>
+<br>
+2.13.1<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legit=
imate-address-in-riscv_legiti.patch b/meta/recipes-devtools/gcc/gcc-7.3/005=
0-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legiti=
mate-address-in-riscv_legiti.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitima=
te-address-in-riscv_legiti.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-preco=
mpiled-hdr.patch b/meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault=
-precompiled-hdr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-7.2/fix-segmentation-fault-precom=
piled-hdr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-7.3/fix-segmentation-fault-precompi=
led-hdr.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtoo=
ls/gcc/gcc-common.inc<br>
index b5975b5..aa3b53e 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-common.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-common.inc<br>
@@ -105,6 +105,7 @@ gcclibdir =3D &quot;${libdir}/gcc&quot;<br>
=C2=A0BINV =3D &quot;${PV}&quot;<br>
=C2=A0#S =3D &quot;${WORKDIR}/gcc-${PV}&quot;<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
+<br>
=C2=A0B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}&quot=
;<br>
<br>
=C2=A0target_includedir ?=3D &quot;${includedir}&quot;<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian=
_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a>=
 b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.2.bb</a><=
br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_7.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_7.3.bb</a><br=
>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a> b=
/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.2.bb</a><br=
>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_7.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.2.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-cross_7.2.bb</a> b/meta/recipes-de=
vtools/gcc/<a href=3D"http://gcc-cross_7.3.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-cross_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_7.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initi=
al_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb=
</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_7.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.3.bb</a><b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initia=
l_7.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.2.bb<=
/a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_7.3.bb</a=
><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.2.bb</a> b/meta/reci=
pes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.3.bb" rel=3D"noreferrer" =
target=3D"_blank">gcc-crosssdk_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_7.3.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.2.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_7.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-runtime_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-runtime_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcc-sanitizers_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_7.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-source_7.2.bb</a> b/meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-source_7.3.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.2.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-source_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_7.3.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-source_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.2.bb" rel=3D=
"noreferrer" target=3D"_blank">gcc_7.2.bb</a> b/meta/recipes-devtools/gcc/<=
a href=3D"http://gcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc_7.3.b=
b</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_7.3.bb" rel=3D"no=
referrer" target=3D"_blank">gcc_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.2=
.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.2.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">libgcc-initial_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_7.3.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.2.bb</a> b/meta/recipes-devtools=
/gcc/<a href=3D"http://libgcc_7.3.bb" rel=3D"noreferrer" target=3D"_blank">=
libgcc_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_7.3.bb" rel=3D=
"noreferrer" target=3D"_blank">libgcc_7.3.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libgfortran_7.2.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://libgfortran_7.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_7.3.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgfortran_7.2.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_7.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libgfortran_7.3.bb</a><br>
--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0ec3506dee990563b697a3--
