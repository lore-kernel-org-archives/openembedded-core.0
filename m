Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 60F987887F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:08:42 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id w128so10834307wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RNYzZ2xbU4JSWi+t+4ViItuW6WAB6BLwcBKiL2wQzuM=;
	b=YWXRxOMbMZhoERr2jKMS4SG8wqHZEoBH7S2L7RYPM52iHn124XM54XVivy5oNaqJDx
	/V1MS4tcqosObtt895gbLTN7DzcHr72i2rZsvI035A0KNSWyqbcInjIucrLdDBcO0MWB
	cPZEWaizRyFCReWw7C+JaMROYWFpbD1DmwbOkajOm52DbvGAGH/XxCPhSS7EcFIPIaGB
	OpAWnkvMZ4oCXm+60HLCxwYC/4INzjIHJGbHHMuk4SW3s06VNS8OAjYOyQGNMuEWmMrP
	cANA+q8CkN8jHItMVgHmOHNcreKJAzuaxkemlOWDzn22575B3bLGPaIuEIJzjtPmJS4f
	Gf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RNYzZ2xbU4JSWi+t+4ViItuW6WAB6BLwcBKiL2wQzuM=;
	b=bwz4RaDfrhQ2jNojnaF2RBHtqA+7gXKoJy1M0T30o0Fq4I/wsBhlxmZ4CvpDM5CbVS
	TVwAsbfjYL+fSw6q3FTZ2lYgf9foyJTNEOkMwEINqfE/35Rmsi6NUjTwkjUCN2RLYd0g
	oEXCr+kEH16AsUBMXiHfJ4C1Oq8Qscatz9CUjz2q6HdyWGtYNjUnW9cwLW4Lqjj+ZDRi
	UvRB8l09NZm26u2NwsQXPVnDv11h87gqVDC8h4LscEaTX7Srw5SmPoq8GXPQnaDRC6C4
	2zJJXtdpNojgNPI5bZKdqsbwxKZj0VM8epVvFELNyGljUMfz7ZXUpjlL4i7iQSuH6m1M
	W9Vg==
X-Gm-Message-State: AElRT7EWN0AO6+XqjIDuYVlCazn8/rKFrCxudXhJyybhc2pjntsiGz4t
	+F+Tjpi8aIZWifW+PSXmZZdO/lJOOXkJGcU4ecY=
X-Google-Smtp-Source: AG47ELtoxUVj4bKc5RbPa8RgliBhyOAcDHfWbn7J/c4mKMAhAxyT46Caf49E5DbUzOzbgig13NEamJmnSBtQ4Az51Bk=
X-Received: by 10.28.225.130 with SMTP id y124mr5490121wmg.60.1520165322408;
	Sun, 04 Mar 2018 04:08:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 04:08:41 -0800 (PST)
In-Reply-To: <CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
	<CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 13:08:41 +0100
Message-ID: <CA+chaQeKutNQ5G8=6ph4fYZVJb8KkF0OWeExCJUQTWArBZirKA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][pyro] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 12:08:43 -0000
Content-Type: multipart/alternative; boundary="001a114a4cfa0acb0f0566951230"

--001a114a4cfa0acb0f0566951230
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And the same with
meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
which isn't included in SRC_URI since:

commit 41ce4b438795108025c79cd3eec067367d53623e
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Aug 16 11:50:35 2016 -0700

    gcc: Upgrade to 6.2 RC1


On Sun, Mar 4, 2018 at 1:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:

> Also
> meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-
> Don-t-use-vectorized-builtins-wh.patch
> added in this patch doesn't seem to be used anywhere.
>
>
>
> On Sun, Mar 4, 2018 at 12:38 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Is this backport of https://patches.openembedded.org/patch/144961/ ?
>>
>> If yes, why does it have different author?
>>
>> On Sun, Mar 4, 2018 at 12:23 PM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> From: Juro Bystricky <juro.bystricky@intel.com>
>>>
>>> Changed BINV and PV to 6.4.0
>>> Modified BASEURI to load xz tarball instead of bz2
>>>
>>> Backported series of patches from https://github.com/hjl-tools/gcc.git
>>> branch /hjl/indirect/gcc-6-branch/master which contains
>>> an IA patch series for security related issues
>>>
>>> ubsan-fix-check-empty-string.patch : removed, already applied
>>> CVE-2016-6131.patch: Modified ChangeLog hunk to apply
>>>
>>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>>  .../gcc/gcc-6.3/ubsan-fix-check-empty-string.patch |   28 -
>>>  .../gcc/{gcc-6.3.inc =3D> gcc-6.4.inc}               |   26 +-
>>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
>>>  ...ove-struct-ix86_frame-to-machine_function.patch |  244 +++
>>>  ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   71 +
>>>  .../{gcc-6.3 =3D> gcc-6.4}/0002-uclibc-conf.patch    |    0
>>>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0
>>>  ...nst-reference-of-struct-ix86_frame-to-avo.patch |  128 ++
>>>  .../{gcc-6.3 =3D> gcc-6.4}/0004-uclibc-locale.patch  |    0
>>>  .../gcc-6.4/0004-x86-Add-mindirect-branch.patch    | 2151
>>> ++++++++++++++++++++
>>>  .../0005-uclibc-locale-no__x.patch                 |    0
>>>  .../gcc-6.4/0005-x86-Add-mfunction-return.patch    | 1567
>>> ++++++++++++++
>>>  .../0006-uclibc-locale-wchar_fix.patch             |    0
>>>  .../0006-x86-Add-mindirect-branch-register.patch   |  943 +++++++++
>>>  .../0007-uclibc-locale-update.patch                |    0
>>>  .../0007-x86-Add-V-register-operand-modifier.patch |  136 ++
>>>  .../0008-missing-execinfo_h.patch                  |    0
>>>  ...w-mindirect-branch-mfunction-return-with-.patch |  301 +++
>>>  ...VALID_REGNUM-in-indirect-thunk-processing.patch |  123 ++
>>>  .../{gcc-6.3 =3D> gcc-6.4}/0009-c99-snprintf.patch   |    0
>>>  .../0010-gcc-poison-system-directories.patch       |    0
>>>  ...INVALID_REGNUM-as-invalid-register-number.patch |   43 +
>>>  .../0011-gcc-poison-dir-extend.patch               |    0
>>>  ...date-mfunction-return-for-return-with-pop.patch |  450 ++++
>>>  .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0
>>>  ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1001 +++++++++
>>>  .../0013-64-bit-multilib-hack.patch                |    0
>>>  .../0014-optional-libstdc.patch                    |    0
>>>  ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0
>>>  .../0016-COLLECT_GCC_OPTIONS.patch                 |    0
>>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0
>>>  .../0018-fortran-cross-compile-hack.patch          |    0
>>>  .../0019-cpp-honor-sysroot.patch                   |    0
>>>  .../0020-MIPS64-Default-to-N64-ABI.patch           |    0
>>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0
>>>  ...0022-gcc-Fix-argument-list-too-long-error.patch |    0
>>>  .../{gcc-6.3 =3D> gcc-6.4}/0023-Disable-sdt.patch    |    0
>>>  .../gcc/{gcc-6.3 =3D> gcc-6.4}/0024-libtool.patch    |    0
>>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
>>>  ...tilib-config-files-from-B-instead-of-usin.patch |    0
>>>  ...-libdir-from-.la-which-usually-points-to-.patch |    0
>>>  .../gcc/{gcc-6.3 =3D> gcc-6.4}/0028-export-CPP.patch |    0
>>>  ...AltiVec-generation-on-powepc-linux-target.patch |    0
>>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0
>>>  ...Ensure-target-gcc-headers-can-be-included.patch |    0
>>>  ...-t-build-with-disable-dependency-tracking.patch |    0
>>>  ...h-host-directory-during-relink-if-inst_pr.patch |    0
>>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0
>>>  .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0
>>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0
>>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0
>>>  ...et-sysroot-gcc-version-specific-dirs-with.patch |    0
>>>  ...-various-_FOR_BUILD-and-related-variables.patch |    0
>>>  .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0
>>>  ...shared-to-link-commandline-for-musl-targe.patch |    0
>>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0
>>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0
>>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0
>>>  ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0
>>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0
>>>  ...e-alias-for-__cpu_indicator_init-instead-.patch |    0
>>>  .../0048-sync-gcc-stddef.h-with-musl.patch         |    0
>>>  .../0054_all_nopie-all-flags.patch                 |    0
>>>  .../0055-unwind_h-glibc26.patch                    |    0
>>>  .../gcc/{gcc-6.3 =3D> gcc-6.4}/CVE-2016-6131.patch   |   36 +-
>>>  ...s-canadian_6.3.bb =3D> gcc-cross-canadian_6.4.bb} |    0
>>>  ...oss-initial_6.3.bb =3D> gcc-cross-initial_6.4.bb} |    0
>>>  .../gcc/{gcc-cross_6.3.bb =3D> gcc-cross_6.4.bb}     |    0
>>>  ...-initial_6.3.bb =3D> gcc-crosssdk-initial_6.4.bb} |    0
>>>  .../{gcc-crosssdk_6.3.bb =3D> gcc-crosssdk_6.4.bb}   |    0
>>>  .../gcc/{gcc-runtime_6.3.bb =3D> gcc-runtime_6.4.bb} |    0
>>>  ...gcc-sanitizers_6.3.bb =3D> gcc-sanitizers_6.4.bb} |    0
>>>  .../gcc/{gcc-source_6.3.bb =3D> gcc-source_6.4.bb}   |    0
>>>  .../gcc/{gcc_6.3.bb =3D> gcc_6.4.bb}                 |    0
>>>  ...libgcc-initial_6.3.bb =3D> libgcc-initial_6.4.bb} |    0
>>>  .../gcc/{libgcc_6.3.bb =3D> libgcc_6.4.bb}           |    0
>>>  .../gcc/{libgfortran_6.3.bb =3D> libgfortran_6.4.bb} |    0
>>>  78 files changed, 7198 insertions(+), 52 deletions(-)
>>>  delete mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.3/ubsan-fix-check-empty-string.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3.inc =3D> gcc-6.4.inc} (81%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0002-uclibc-conf.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D> gcc-6.4}/
>>> 0004-uclibc-locale.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0004-x86-Add-mindirect-branch.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0005-uclibc-locale-no__x.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0005-x86-Add-mfunction-return.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0006-uclibc-locale-wchar_fix.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0006-x86-Add-mindirect-branch-register.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0007-uclibc-locale-update.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0007-x86-Add-V-register-operand-modifier.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0008-missing-execinfo_h.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0009-c99-snprintf.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0011-i386-Update-mfunction-return-for-return-with-pop.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>>>  create mode 100644 meta/recipes-devtools/gcc/gcc-
>>> 6.4/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0014-optional-libstdc.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0023-Disable-sdt.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0024-libtool.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0028-export-CPP.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patc=
h
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0048-sync-gcc-stddef.h-with-musl.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0054_all_nopie-all-flags.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/0055-unwind_h-glibc26.patch (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-6.3 =3D>
>>> gcc-6.4}/CVE-2016-6131.patch (89%)
>>>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.3.bb =3D>
>>> gcc-cross-canadian_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.3.bb =3D>
>>> gcc-cross-initial_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-cross_6.3.bb =3D> gcc-cross_6.4.=
bb}
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.3.bb =3D>
>>> gcc-crosssdk-initial_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.3.bb =3D>
>>> gcc-crosssdk_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-runtime_6.3.bb =3D>
>>> gcc-runtime_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.3.bb =3D>
>>> gcc-sanitizers_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc-source_6.3.bb =3D>
>>> gcc-source_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{gcc_6.3.bb =3D> gcc_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{libgcc-initial_6.3.bb =3D>
>>> libgcc-initial_6.4.bb} (100%)
>>>  rename meta/recipes-devtools/gcc/{libgcc_6.3.bb =3D> libgcc_6.4.bb}
>>> (100%)
>>>  rename meta/recipes-devtools/gcc/{libgfortran_6.3.bb =3D>
>>> libgfortran_6.4.bb} (100%)
>>>
>>> diff --git a/meta/conf/distro/include/tcmode-default.inc
>>> b/meta/conf/distro/include/tcmode-default.inc
>>> index 3db16e8..69cb762 100644
>>> --- a/meta/conf/distro/include/tcmode-default.inc
>>> +++ b/meta/conf/distro/include/tcmode-default.inc
>>> @@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initi=
al
>>> =3D "${TCLIBC}-initial"
>>>  PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=3D
>>> "nativesdk-glibc-initial"
>>>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>>>
>>> -GCCVERSION ?=3D "6.3%"
>>> +GCCVERSION ?=3D "6.4%"
>>>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>>>  BINUVERSION ?=3D "2.28%"
>>>  GDBVERSION ?=3D "7.12%"
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-st=
ring.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-string.patch
>>> deleted file mode 100644
>>> index c012719..0000000
>>> --- a/meta/recipes-devtools/gcc/gcc-6.3/ubsan-fix-check-empty-st
>>> ring.patch
>>> +++ /dev/null
>>> @@ -1,28 +0,0 @@
>>> -From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
>>> -From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> -Date: Sat, 3 Sep 2016 10:57:05 +0000
>>> -Subject: [PATCH] gcc/  * ubsan.c (ubsan_use_new_style_p): Fix check fo=
r
>>> empty
>>> - string.
>>> -
>>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971
>>> 138bc75d-0d04-0410-961f-82ee72b054a4
>>> -
>>> -Upstream-Status: Backport
>>> -Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>>> -
>>> ----
>>> - gcc/ubsan.c   | 2 +-
>>> - 2 files changed, 5 insertions(+), 1 deletion(-)
>>> -
>>> -Index: gcc-6.3.0/gcc/ubsan.c
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- gcc-6.3.0.orig/gcc/ubsan.c
>>> -+++ gcc-6.3.0/gcc/ubsan.c
>>> -@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
>>> -
>>> -   expanded_location xloc =3D expand_location (loc);
>>> -   if (xloc.file =3D=3D NULL || strncmp (xloc.file, "\1", 2) =3D=3D 0
>>> --      || xloc.file =3D=3D '\0' || xloc.file[0] =3D=3D '\xff'
>>> -+      || xloc.file[0] =3D=3D '\0' || xloc.file[0] =3D=3D '\xff'
>>> -       || xloc.file[1] =3D=3D '\xff')
>>> -     return false;
>>> -
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc
>>> b/meta/recipes-devtools/gcc/gcc-6.4.inc
>>> similarity index 81%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3.inc
>>> rename to meta/recipes-devtools/gcc/gcc-6.4.inc
>>> index 5c81a33..3514587 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
>>> @@ -2,13 +2,13 @@ require gcc-common.inc
>>>
>>>  # Third digit in PV should be incremented after a minor release
>>>
>>> -PV =3D "6.3.0"
>>> +PV =3D "6.4.0"
>>>
>>>  # BINV should be incremented to a revision after a minor gcc release
>>>
>>> -BINV =3D "6.3.0"
>>> +BINV =3D "6.4.0"
>>>
>>> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-6.3:${FIL
>>> E_DIRNAME}/gcc-6.3/backport:"
>>> +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-6.4:${FIL
>>> E_DIRNAME}/gcc-6.4/backport:"
>>>
>>>  DEPENDS =3D+ "mpfr gmp libmpc zlib"
>>>  NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native"
>>> @@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D "\
>>>  "
>>>
>>>
>>> -BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
>>> +BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
>>>  #SRCREV =3D "bd9a826d5448db11d29d2ec5884e7e679066f140"
>>>  #BASEURI ?=3D "git://github.com/gcc-mirror/g
>>> cc;branch=3Dgcc-6-branch;protocol=3Dgit"
>>>  #BASEURI ?=3D "ftp://sourceware.org/pub/gcc/
>>> snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
>>> @@ -85,10 +85,22 @@ SRC_URI =3D "\
>>>  "
>>>  BACKPORTS =3D "\
>>>             file://CVE-2016-6131.patch \
>>> -           file://ubsan-fix-check-empty-string.patch \
>>> +           file://0001-i386-Move-struct-ix86_frame-to-machine_function=
.patch
>>> \
>>> +           file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoi=
d-cop.patch
>>> \
>>> +           file://0003-i386-Use-const-reference-of-struct-ix86_frame-t=
o-avo.patch
>>> \
>>> +           file://0004-x86-Add-mindirect-branch.patch \
>>> +           file://0005-x86-Add-mfunction-return.patch \
>>> +           file://0006-x86-Add-mindirect-branch-register.patch \
>>> +           file://0007-x86-Add-V-register-operand-modifier.patch \
>>> +           file://0008-x86-Disallow-mindirect-branch-mfunction-return-=
with-.patch
>>> \
>>> +           file://0009-Use-INVALID_REGNUM-in-indirect-thunk-processing=
.patch
>>> \
>>> +           file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-nu=
mber.patch
>>> \
>>> +           file://0011-i386-Update-mfunction-return-for-return-with-po=
p.patch
>>> \
>>> +           file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch =
\
>>>  "
>>> -SRC_URI[md5sum] =3D "677a7623c7ef6ab99881bc4e048debb6"
>>> -SRC_URI[sha256sum] =3D "f06ae7f3f790fbf0f018f6d40e844
>>> 451e6bc3b7bc96e128e63b09825c1f8b29f"
>>> +
>>> +SRC_URI[md5sum] =3D "11ba51a0cfb8471927f387c8895fe232"
>>> +SRC_URI[sha256sum] =3D "850bf21eafdfe5cd5f6827148184c
>>> 08c4a0852a37ccf36ce69855334d2c914d4"
>>>
>>>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>>  #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAG
>>> S_FOR_TARGET.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0001-gcc-4.3.1-ARCH_FLAGS=
_
>>> FOR_TARGET.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_
>>> FOR_TARGET.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0001-i386-Move-struct-ix
>>> 86_frame-to-machine_function.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
>>> new file mode 100644
>>> index 0000000..3c2a8db
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0001-i386-Move-struct-ix
>>> 86_frame-to-machine_function.patch
>>> @@ -0,0 +1,244 @@
>>> +From c2c7775c5587dc59b6756162d390d89d60971a16 Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Mon, 15 Jan 2018 11:27:24 +0000
>>> +Subject: [PATCH 01/12] i386: Move struct ix86_frame to machine_functio=
n
>>> +
>>> +Make ix86_frame available to i386 code generation.  This is needed to
>>> +backport the patch set of -mindirect-branch=3D to mitigate variant #2 =
of
>>> +the speculative execution vulnerabilities on x86 processors identified
>>> +by CVE-2017-5715, aka Spectre.
>>> +
>>> +       Backport from mainline
>>> +       2017-06-01  Bernd Edlinger  <bernd.edlinger@hotmail.de>
>>> +
>>> +       * config/i386/i386.c (ix86_frame): Moved to ...
>>> +       * config/i386/i386.h (ix86_frame): Here.
>>> +       (machine_function): Add frame.
>>> +       * config/i386/i386.c (ix86_compute_frame_layout): Repace the
>>> +       frame argument with &cfun->machine->frame.
>>> +       (ix86_can_use_return_insn_p): Don't pass &frame to
>>> +       ix86_compute_frame_layout.  Copy frame from cfun->machine->fram=
e.
>>> +       (ix86_can_eliminate): Likewise.
>>> +       (ix86_expand_prologue): Likewise.
>>> +       (ix86_expand_epilogue): Likewise.
>>> +       (ix86_expand_split_stack_prologue): Likewise.
>>> +
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c | 68 ++++++++++--------------------
>>> --------------------
>>> + gcc/config/i386/i386.h | 53 ++++++++++++++++++++++++++++++++++++++-
>>> + 2 files changed, 65 insertions(+), 56 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 8b5faac..a1ff32b 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -2434,53 +2434,6 @@ struct GTY(()) stack_local_entry {
>>> +   struct stack_local_entry *next;
>>> + };
>>> +
>>> +-/* Structure describing stack frame layout.
>>> +-   Stack grows downward:
>>> +-
>>> +-   [arguments]
>>> +-                                      <- ARG_POINTER
>>> +-   saved pc
>>> +-
>>> +-   saved static chain                 if ix86_static_chain_on_stack
>>> +-
>>> +-   saved frame pointer                        if frame_pointer_needed
>>> +-                                      <- HARD_FRAME_POINTER
>>> +-   [saved regs]
>>> +-                                      <- regs_save_offset
>>> +-   [padding0]
>>> +-
>>> +-   [saved SSE regs]
>>> +-                                      <- sse_regs_save_offset
>>> +-   [padding1]          |
>>> +-                     |                <- FRAME_POINTER
>>> +-   [va_arg registers]  |
>>> +-                     |
>>> +-   [frame]           |
>>> +-                     |
>>> +-   [padding2]        | =3D to_allocate
>>> +-                                      <- STACK_POINTER
>>> +-  */
>>> +-struct ix86_frame
>>> +-{
>>> +-  int nsseregs;
>>> +-  int nregs;
>>> +-  int va_arg_size;
>>> +-  int red_zone_size;
>>> +-  int outgoing_arguments_size;
>>> +-
>>> +-  /* The offsets relative to ARG_POINTER.  */
>>> +-  HOST_WIDE_INT frame_pointer_offset;
>>> +-  HOST_WIDE_INT hard_frame_pointer_offset;
>>> +-  HOST_WIDE_INT stack_pointer_offset;
>>> +-  HOST_WIDE_INT hfp_save_offset;
>>> +-  HOST_WIDE_INT reg_save_offset;
>>> +-  HOST_WIDE_INT sse_reg_save_offset;
>>> +-
>>> +-  /* When save_regs_using_mov is set, emit prologue using
>>> +-     move instead of push instructions.  */
>>> +-  bool save_regs_using_mov;
>>> +-};
>>> +-
>>> + /* Which cpu are we scheduling for.  */
>>> + enum attr_cpu ix86_schedule;
>>> +
>>> +@@ -2572,7 +2525,7 @@ static unsigned int ix86_function_arg_boundary
>>> (machine_mode,
>>> +                                               const_tree);
>>> + static rtx ix86_static_chain (const_tree, bool);
>>> + static int ix86_function_regparm (const_tree, const_tree);
>>> +-static void ix86_compute_frame_layout (struct ix86_frame *);
>>> ++static void ix86_compute_frame_layout (void);
>>> + static bool ix86_expand_vector_init_one_nonzero (bool, machine_mode,
>>> +                                                rtx, rtx, int);
>>> + static void ix86_add_new_builtins (HOST_WIDE_INT);
>>> +@@ -10944,7 +10897,8 @@ ix86_can_use_return_insn_p (void)
>>> +   if (crtl->args.pops_args && crtl->args.size >=3D 32768)
>>> +     return 0;
>>> +
>>> +-  ix86_compute_frame_layout (&frame);
>>> ++  ix86_compute_frame_layout ();
>>> ++  frame =3D cfun->machine->frame;
>>> +   return (frame.stack_pointer_offset =3D=3D UNITS_PER_WORD
>>> +         && (frame.nregs + frame.nsseregs) =3D=3D 0);
>>> + }
>>> +@@ -11355,8 +11309,8 @@ ix86_can_eliminate (const int from, const int
>>> to)
>>> + HOST_WIDE_INT
>>> + ix86_initial_elimination_offset (int from, int to)
>>> + {
>>> +-  struct ix86_frame frame;
>>> +-  ix86_compute_frame_layout (&frame);
>>> ++  ix86_compute_frame_layout ();
>>> ++  struct ix86_frame frame =3D cfun->machine->frame;
>>> +
>>> +   if (from =3D=3D ARG_POINTER_REGNUM && to =3D=3D HARD_FRAME_POINTER_=
REGNUM)
>>> +     return frame.hard_frame_pointer_offset;
>>> +@@ -11395,8 +11349,9 @@ ix86_builtin_setjmp_frame_value (void)
>>> + /* Fill structure ix86_frame about frame of currently computed
>>> function.  */
>>> +
>>> + static void
>>> +-ix86_compute_frame_layout (struct ix86_frame *frame)
>>> ++ix86_compute_frame_layout (void)
>>> + {
>>> ++  struct ix86_frame *frame =3D &cfun->machine->frame;
>>> +   unsigned HOST_WIDE_INT stack_alignment_needed;
>>> +   HOST_WIDE_INT offset;
>>> +   unsigned HOST_WIDE_INT preferred_alignment;
>>> +@@ -12702,7 +12657,8 @@ ix86_expand_prologue (void)
>>> +   m->fs.sp_offset =3D INCOMING_FRAME_SP_OFFSET;
>>> +   m->fs.sp_valid =3D true;
>>> +
>>> +-  ix86_compute_frame_layout (&frame);
>>> ++  ix86_compute_frame_layout ();
>>> ++  frame =3D m->frame;
>>> +
>>> +   if (!TARGET_64BIT && ix86_function_ms_hook_prologue
>>> (current_function_decl))
>>> +     {
>>> +@@ -13379,7 +13335,8 @@ ix86_expand_epilogue (int style)
>>> +   bool using_drap;
>>> +
>>> +   ix86_finalize_stack_realign_flags ();
>>> +-  ix86_compute_frame_layout (&frame);
>>> ++  ix86_compute_frame_layout ();
>>> ++  frame =3D m->frame;
>>> +
>>> +   m->fs.sp_valid =3D (!frame_pointer_needed
>>> +                   || (crtl->sp_is_unchanging
>>> +@@ -13876,7 +13833,8 @@ ix86_expand_split_stack_prologue (void)
>>> +   gcc_assert (flag_split_stack && reload_completed);
>>> +
>>> +   ix86_finalize_stack_realign_flags ();
>>> +-  ix86_compute_frame_layout (&frame);
>>> ++  ix86_compute_frame_layout ();
>>> ++  frame =3D cfun->machine->frame;
>>> +   allocate =3D frame.stack_pointer_offset - INCOMING_FRAME_SP_OFFSET;
>>> +
>>> +   /* This is the label we will branch to if we have enough stack
>>> +diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
>>> +index 8113f83..5414416 100644
>>> +--- a/gcc/config/i386/i386.h
>>> ++++ b/gcc/config/i386/i386.h
>>> +@@ -2427,9 +2427,56 @@ enum avx_u128_state
>>> +
>>> + #define FASTCALL_PREFIX '@'
>>> +
>>> ++#ifndef USED_FOR_TARGET
>>> ++/* Structure describing stack frame layout.
>>> ++   Stack grows downward:
>>> ++
>>> ++   [arguments]
>>> ++                                      <- ARG_POINTER
>>> ++   saved pc
>>> ++
>>> ++   saved static chain                 if ix86_static_chain_on_stack
>>> ++
>>> ++   saved frame pointer                        if frame_pointer_needed
>>> ++                                      <- HARD_FRAME_POINTER
>>> ++   [saved regs]
>>> ++                                      <- regs_save_offset
>>> ++   [padding0]
>>> ++
>>> ++   [saved SSE regs]
>>> ++                                      <- sse_regs_save_offset
>>> ++   [padding1]          |
>>> ++                     |                <- FRAME_POINTER
>>> ++   [va_arg registers]  |
>>> ++                     |
>>> ++   [frame]           |
>>> ++                     |
>>> ++   [padding2]        | =3D to_allocate
>>> ++                                      <- STACK_POINTER
>>> ++  */
>>> ++struct GTY(()) ix86_frame
>>> ++{
>>> ++  int nsseregs;
>>> ++  int nregs;
>>> ++  int va_arg_size;
>>> ++  int red_zone_size;
>>> ++  int outgoing_arguments_size;
>>> ++
>>> ++  /* The offsets relative to ARG_POINTER.  */
>>> ++  HOST_WIDE_INT frame_pointer_offset;
>>> ++  HOST_WIDE_INT hard_frame_pointer_offset;
>>> ++  HOST_WIDE_INT stack_pointer_offset;
>>> ++  HOST_WIDE_INT hfp_save_offset;
>>> ++  HOST_WIDE_INT reg_save_offset;
>>> ++  HOST_WIDE_INT sse_reg_save_offset;
>>> ++
>>> ++  /* When save_regs_using_mov is set, emit prologue using
>>> ++     move instead of push instructions.  */
>>> ++  bool save_regs_using_mov;
>>> ++};
>>> ++
>>> + /* Machine specific frame tracking during prologue/epilogue
>>> generation.  */
>>> +
>>> +-#ifndef USED_FOR_TARGET
>>> + struct GTY(()) machine_frame_state
>>> + {
>>> +   /* This pair tracks the currently active CFA as reg+offset.  When r=
eg
>>> +@@ -2475,6 +2522,9 @@ struct GTY(()) machine_function {
>>> +   int varargs_fpr_size;
>>> +   int optimize_mode_switching[MAX_386_ENTITIES];
>>> +
>>> ++  /* Cached initial frame layout for the current function.  */
>>> ++  struct ix86_frame frame;
>>> ++
>>> +   /* Number of saved registers USE_FAST_PROLOGUE_EPILOGUE
>>> +      has been computed for.  */
>>> +   int use_fast_prologue_epilogue_nregs;
>>> +@@ -2554,6 +2604,7 @@ struct GTY(()) machine_function {
>>> + #define ix86_current_function_calls_tls_descriptor \
>>> +   (ix86_tls_descriptor_calls_expanded_in_cfun && df_regs_ever_live_p
>>> (SP_REG))
>>> + #define ix86_static_chain_on_stack (cfun->machine->static_chain_o
>>> n_stack)
>>> ++#define ix86_red_zone_size (cfun->machine->frame.red_zone_size)
>>> +
>>> + /* Control behavior of x86_file_start.  */
>>> + #define X86_FILE_START_VERSION_DIRECTIVE false
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0002-i386-Use-reference-
>>> of-struct-ix86_frame-to-avoid-cop.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
>>> new file mode 100644
>>> index 0000000..156a0a3
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0002-i386-Use-reference-
>>> of-struct-ix86_frame-to-avoid-cop.patch
>>> @@ -0,0 +1,71 @@
>>> +From fe2b3be3f4b6ec6b3a6f89c26016a3983b7cb351 Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Mon, 15 Jan 2018 11:28:44 +0000
>>> +Subject: [PATCH 02/12] i386: Use reference of struct ix86_frame to
>>> avoid copy
>>> +
>>> +When there is no need to make a copy of ix86_frame, we can use referen=
ce
>>> +of struct ix86_frame to avoid copy.
>>> +
>>> +       Backport from mainline
>>> +       2017-11-06  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/i386.c (ix86_can_use_return_insn_p): Use referenc=
e
>>> +       of struct ix86_frame.
>>> +       (ix86_initial_elimination_offset): Likewise.
>>> +       (ix86_expand_split_stack_prologue): Likewise.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c | 8 +++-----
>>> + 1 file changed, 3 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index a1ff32b..13ebf10 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -10887,7 +10887,6 @@ symbolic_reference_mentioned_p (rtx op)
>>> + bool
>>> + ix86_can_use_return_insn_p (void)
>>> + {
>>> +-  struct ix86_frame frame;
>>> +
>>> +   if (! reload_completed || frame_pointer_needed)
>>> +     return 0;
>>> +@@ -10898,7 +10897,7 @@ ix86_can_use_return_insn_p (void)
>>> +     return 0;
>>> +
>>> +   ix86_compute_frame_layout ();
>>> +-  frame =3D cfun->machine->frame;
>>> ++  struct ix86_frame &frame =3D cfun->machine->frame;
>>> +   return (frame.stack_pointer_offset =3D=3D UNITS_PER_WORD
>>> +         && (frame.nregs + frame.nsseregs) =3D=3D 0);
>>> + }
>>> +@@ -11310,7 +11309,7 @@ HOST_WIDE_INT
>>> + ix86_initial_elimination_offset (int from, int to)
>>> + {
>>> +   ix86_compute_frame_layout ();
>>> +-  struct ix86_frame frame =3D cfun->machine->frame;
>>> ++  struct ix86_frame &frame =3D cfun->machine->frame;
>>> +
>>> +   if (from =3D=3D ARG_POINTER_REGNUM && to =3D=3D HARD_FRAME_POINTER_=
REGNUM)
>>> +     return frame.hard_frame_pointer_offset;
>>> +@@ -13821,7 +13820,6 @@ static GTY(()) rtx split_stack_fn_large;
>>> + void
>>> + ix86_expand_split_stack_prologue (void)
>>> + {
>>> +-  struct ix86_frame frame;
>>> +   HOST_WIDE_INT allocate;
>>> +   unsigned HOST_WIDE_INT args_size;
>>> +   rtx_code_label *label;
>>> +@@ -13834,7 +13832,7 @@ ix86_expand_split_stack_prologue (void)
>>> +
>>> +   ix86_finalize_stack_realign_flags ();
>>> +   ix86_compute_frame_layout ();
>>> +-  frame =3D cfun->machine->frame;
>>> ++  struct ix86_frame &frame =3D cfun->machine->frame;
>>> +   allocate =3D frame.stack_pointer_offset - INCOMING_FRAME_SP_OFFSET;
>>> +
>>> +   /* This is the label we will branch to if we have enough stack
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0002-uclibc-conf.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0002-uclibc-conf.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0002-uclibc-conf.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-c=
type_touplow_t.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0003-gcc-uclibc-locale-c
>>> type_touplow_t.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0003-gcc-uclibc-locale-ct=
y
>>> pe_touplow_t.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0003-gcc-uclibc-locale-cty
>>> pe_touplow_t.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0003-i386-Use-const-refe
>>> rence-of-struct-ix86_frame-to-avo.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
>>> new file mode 100644
>>> index 0000000..9cb0a41
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0003-i386-Use-const-refe
>>> rence-of-struct-ix86_frame-to-avo.patch
>>> @@ -0,0 +1,128 @@
>>> +From 82243732dc63e9b90396a5ae4ad99ca36af81355 Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Sat, 27 Jan 2018 13:10:24 +0000
>>> +Subject: [PATCH 03/12] i386: Use const reference of struct ix86_frame
>>> to avoid
>>> + copy
>>> +
>>> +We can use const reference of struct ix86_frame to avoid making a loca=
l
>>> +copy of ix86_frame.  ix86_expand_epilogue makes a local copy of struct
>>> +ix86_frame and uses the reg_save_offset field as a local variable.  Th=
is
>>> +patch uses a separate local variable for reg_save_offset.
>>> +
>>> +Tested on x86-64 with ada.
>>> +
>>> +       Backport from mainline
>>> +       PR target/83905
>>> +       * config/i386/i386.c (ix86_expand_prologue): Use cost reference
>>> +       of struct ix86_frame.
>>> +       (ix86_expand_epilogue): Likewise.  Add a local variable for
>>> +       the reg_save_offset field in struct ix86_frame.
>>> +
>>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257123
>>> 138bc75d-0d04-0410-961f-82ee72b054a4
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c | 24 ++++++++++++------------
>>> + 1 file changed, 12 insertions(+), 12 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 13ebf10..6c98f75 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -12633,7 +12633,6 @@ ix86_expand_prologue (void)
>>> + {
>>> +   struct machine_function *m =3D cfun->machine;
>>> +   rtx insn, t;
>>> +-  struct ix86_frame frame;
>>> +   HOST_WIDE_INT allocate;
>>> +   bool int_registers_saved;
>>> +   bool sse_registers_saved;
>>> +@@ -12657,7 +12656,7 @@ ix86_expand_prologue (void)
>>> +   m->fs.sp_valid =3D true;
>>> +
>>> +   ix86_compute_frame_layout ();
>>> +-  frame =3D m->frame;
>>> ++  const struct ix86_frame &frame =3D cfun->machine->frame;
>>> +
>>> +   if (!TARGET_64BIT && ix86_function_ms_hook_prologue
>>> (current_function_decl))
>>> +     {
>>> +@@ -13329,13 +13328,12 @@ ix86_expand_epilogue (int style)
>>> + {
>>> +   struct machine_function *m =3D cfun->machine;
>>> +   struct machine_frame_state frame_state_save =3D m->fs;
>>> +-  struct ix86_frame frame;
>>> +   bool restore_regs_via_mov;
>>> +   bool using_drap;
>>> +
>>> +   ix86_finalize_stack_realign_flags ();
>>> +   ix86_compute_frame_layout ();
>>> +-  frame =3D m->frame;
>>> ++  const struct ix86_frame &frame =3D cfun->machine->frame;
>>> +
>>> +   m->fs.sp_valid =3D (!frame_pointer_needed
>>> +                   || (crtl->sp_is_unchanging
>>> +@@ -13377,11 +13375,13 @@ ix86_expand_epilogue (int style)
>>> +                                 + UNITS_PER_WORD);
>>> +     }
>>> +
>>> ++  HOST_WIDE_INT reg_save_offset =3D frame.reg_save_offset;
>>> ++
>>> +   /* Special care must be taken for the normal return case of a
>>> function
>>> +      using eh_return: the eax and edx registers are marked as saved,
>>> but
>>> +      not restored along this path.  Adjust the save location to
>>> match.  */
>>> +   if (crtl->calls_eh_return && style !=3D 2)
>>> +-    frame.reg_save_offset -=3D 2 * UNITS_PER_WORD;
>>> ++    reg_save_offset -=3D 2 * UNITS_PER_WORD;
>>> +
>>> +   /* EH_RETURN requires the use of moves to function properly.  */
>>> +   if (crtl->calls_eh_return)
>>> +@@ -13397,11 +13397,11 @@ ix86_expand_epilogue (int style)
>>> +   else if (TARGET_EPILOGUE_USING_MOVE
>>> +          && cfun->machine->use_fast_prologue_epilogue
>>> +          && (frame.nregs > 1
>>> +-             || m->fs.sp_offset !=3D frame.reg_save_offset))
>>> ++             || m->fs.sp_offset !=3D reg_save_offset))
>>> +     restore_regs_via_mov =3D true;
>>> +   else if (frame_pointer_needed
>>> +          && !frame.nregs
>>> +-         && m->fs.sp_offset !=3D frame.reg_save_offset)
>>> ++         && m->fs.sp_offset !=3D reg_save_offset)
>>> +     restore_regs_via_mov =3D true;
>>> +   else if (frame_pointer_needed
>>> +          && TARGET_USE_LEAVE
>>> +@@ -13439,7 +13439,7 @@ ix86_expand_epilogue (int style)
>>> +       rtx t;
>>> +
>>> +       if (frame.nregs)
>>> +-      ix86_emit_restore_regs_using_mov (frame.reg_save_offset, style
>>> =3D=3D 2);
>>> ++      ix86_emit_restore_regs_using_mov (reg_save_offset, style =3D=3D=
 2);
>>> +
>>> +       /* eh_return epilogues need %ecx added to the stack pointer.  *=
/
>>> +       if (style =3D=3D 2)
>>> +@@ -13529,19 +13529,19 @@ ix86_expand_epilogue (int style)
>>> +        epilogues.  */
>>> +       if (!m->fs.sp_valid
>>> +         || (TARGET_SEH
>>> +-            && (m->fs.sp_offset - frame.reg_save_offset
>>> ++            && (m->fs.sp_offset - reg_save_offset
>>> +                 >=3D SEH_MAX_FRAME_SIZE)))
>>> +       {
>>> +         pro_epilogue_adjust_stack (stack_pointer_rtx,
>>> hard_frame_pointer_rtx,
>>> +                                    GEN_INT (m->fs.fp_offset
>>> +-                                            - frame.reg_save_offset),
>>> ++                                            - reg_save_offset),
>>> +                                    style, false);
>>> +       }
>>> +-      else if (m->fs.sp_offset !=3D frame.reg_save_offset)
>>> ++      else if (m->fs.sp_offset !=3D reg_save_offset)
>>> +       {
>>> +         pro_epilogue_adjust_stack (stack_pointer_rtx,
>>> stack_pointer_rtx,
>>> +                                    GEN_INT (m->fs.sp_offset
>>> +-                                            - frame.reg_save_offset),
>>> ++                                            - reg_save_offset),
>>> +                                    style,
>>> +                                    m->fs.cfa_reg =3D=3D stack_pointer=
_rtx);
>>> +       }
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0004-uclibc-locale.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0004-uclibc-locale.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0004-uclibc-locale.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0004-x86-Add-mindirect-b=
ranch.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0004-x86-Add-mindirect-branch.patch
>>> new file mode 100644
>>> index 0000000..9a9b4e9
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0004-x86-Add-mindirect-b
>>> ranch.patch
>>> @@ -0,0 +1,2151 @@
>>> +From 6140c2c0bb2b61e69d0da84315e0433ff3520aaa Mon Sep 17 00:00:00 2001
>>> +From: "H.J. Lu" <hjl.tools@gmail.com>
>>> +Date: Sat, 6 Jan 2018 22:29:55 -0800
>>> +Subject: [PATCH 04/12] x86: Add -mindirect-branch=3D
>>> +
>>> +Add -mindirect-branch=3D option to convert indirect call and jump to c=
all
>>> +and return thunks.  The default is 'keep', which keeps indirect call a=
nd
>>> +jump unmodified.  'thunk' converts indirect call and jump to call and
>>> +return thunk.  'thunk-inline' converts indirect call and jump to inlin=
ed
>>> +call and return thunk.  'thunk-extern' converts indirect call and jump
>>> to
>>> +external call and return thunk provided in a separate object file.  Yo=
u
>>> +can control this behavior for a specific function by using the functio=
n
>>> +attribute indirect_branch.
>>> +
>>> +2 kinds of thunks are geneated.  Memory thunk where the function addre=
ss
>>> +is at the top of the stack:
>>> +
>>> +__x86_indirect_thunk:
>>> +       call L2
>>> +L1:
>>> +       pause
>>> +       lfence
>>> +       jmp L1
>>> +L2:
>>> +       lea 8(%rsp), %rsp|lea 4(%esp), %esp
>>> +       ret
>>> +
>>> +Indirect jmp via memory, "jmp mem", is converted to
>>> +
>>> +       push memory
>>> +       jmp __x86_indirect_thunk
>>> +
>>> +Indirect call via memory, "call mem", is converted to
>>> +
>>> +       jmp L2
>>> +L1:
>>> +       push [mem]
>>> +       jmp __x86_indirect_thunk
>>> +L2:
>>> +       call L1
>>> +
>>> +Register thunk where the function address is in a register, reg:
>>> +
>>> +__x86_indirect_thunk_reg:
>>> +       call    L2
>>> +L1:
>>> +       pause
>>> +       lfence
>>> +       jmp     L1
>>> +L2:
>>> +       movq    %reg, (%rsp)|movl    %reg, (%esp)
>>> +       ret
>>> +
>>> +where reg is one of (r|e)ax, (r|e)dx, (r|e)cx, (r|e)bx, (r|e)si,
>>> (r|e)di,
>>> +(r|e)bp, r8, r9, r10, r11, r12, r13, r14 and r15.
>>> +
>>> +Indirect jmp via register, "jmp reg", is converted to
>>> +
>>> +       jmp __x86_indirect_thunk_reg
>>> +
>>> +Indirect call via register, "call reg", is converted to
>>> +
>>> +       call __x86_indirect_thunk_reg
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/i386-opts.h (indirect_branch): New.
>>> +       * config/i386/i386-protos.h (ix86_output_indirect_jmp): Likewis=
e.
>>> +       * config/i386/i386.c (ix86_using_red_zone): Disallow red-zone
>>> +       with local indirect jump when converting indirect call and jump=
.
>>> +       (ix86_set_indirect_branch_type): New.
>>> +       (ix86_set_current_function): Call ix86_set_indirect_branch_type=
.
>>> +       (indirectlabelno): New.
>>> +       (indirect_thunk_needed): Likewise.
>>> +       (indirect_thunk_bnd_needed): Likewise.
>>> +       (indirect_thunks_used): Likewise.
>>> +       (indirect_thunks_bnd_used): Likewise.
>>> +       (INDIRECT_LABEL): Likewise.
>>> +       (indirect_thunk_name): Likewise.
>>> +       (output_indirect_thunk): Likewise.
>>> +       (output_indirect_thunk_function): Likewise.
>>> +       (ix86_output_indirect_branch_via_reg): Likewise.
>>> +       (ix86_output_indirect_branch_via_push): Likewise.
>>> +       (ix86_output_indirect_branch): Likewise.
>>> +       (ix86_output_indirect_jmp): Likewise.
>>> +       (ix86_code_end): Call output_indirect_thunk_function if needed.
>>> +       (ix86_output_call_insn): Call ix86_output_indirect_branch if
>>> +       needed.
>>> +       (ix86_handle_fndecl_attribute): Handle indirect_branch.
>>> +       (ix86_attribute_table): Add indirect_branch.
>>> +       * config/i386/i386.h (machine_function): Add indirect_branch_ty=
pe
>>> +       and has_local_indirect_jump.
>>> +       * config/i386/i386.md (indirect_jump): Set
>>> has_local_indirect_jump
>>> +       to true.
>>> +       (tablejump): Likewise.
>>> +       (*indirect_jump): Use ix86_output_indirect_jmp.
>>> +       (*tablejump_1): Likewise.
>>> +       (simple_return_indirect_internal): Likewise.
>>> +       * config/i386/i386.opt (mindirect-branch=3D): New option.
>>> +       (indirect_branch): New.
>>> +       (keep): Likewise.
>>> +       (thunk): Likewise.
>>> +       (thunk-inline): Likewise.
>>> +       (thunk-extern): Likewise.
>>> +       * doc/extend.texi: Document indirect_branch function attribute.
>>> +       * doc/invoke.texi: Document -mindirect-branch=3D option.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * gcc.target/i386/indirect-thunk-1.c: New test.
>>> +       * gcc.target/i386/indirect-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-8.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386-opts.h                        |  13 +
>>> + gcc/config/i386/i386-protos.h                      |   1 +
>>> + gcc/config/i386/i386.c                             | 639
>>> ++++++++++++++++++++-
>>> + gcc/config/i386/i386.h                             |   7 +
>>> + gcc/config/i386/i386.md                            |  26 +-
>>> + gcc/config/i386/i386.opt                           |  20 +
>>> + gcc/doc/extend.texi                                |  10 +
>>> + gcc/doc/invoke.texi                                |  13 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  20 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  20 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  21 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  21 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  17 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |  18 +
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  44 ++
>>> + .../gcc.target/i386/indirect-thunk-attr-1.c        |  23 +
>>> + .../gcc.target/i386/indirect-thunk-attr-2.c        |  21 +
>>> + .../gcc.target/i386/indirect-thunk-attr-3.c        |  23 +
>>> + .../gcc.target/i386/indirect-thunk-attr-4.c        |  22 +
>>> + .../gcc.target/i386/indirect-thunk-attr-5.c        |  22 +
>>> + .../gcc.target/i386/indirect-thunk-attr-6.c        |  21 +
>>> + .../gcc.target/i386/indirect-thunk-attr-7.c        |  44 ++
>>> + .../gcc.target/i386/indirect-thunk-attr-8.c        |  42 ++
>>> + .../gcc.target/i386/indirect-thunk-bnd-1.c         |  20 +
>>> + .../gcc.target/i386/indirect-thunk-bnd-2.c         |  21 +
>>> + .../gcc.target/i386/indirect-thunk-bnd-3.c         |  19 +
>>> + .../gcc.target/i386/indirect-thunk-bnd-4.c         |  20 +
>>> + .../gcc.target/i386/indirect-thunk-extern-1.c      |  19 +
>>> + .../gcc.target/i386/indirect-thunk-extern-2.c      |  19 +
>>> + .../gcc.target/i386/indirect-thunk-extern-3.c      |  20 +
>>> + .../gcc.target/i386/indirect-thunk-extern-4.c      |  20 +
>>> + .../gcc.target/i386/indirect-thunk-extern-5.c      |  16 +
>>> + .../gcc.target/i386/indirect-thunk-extern-6.c      |  17 +
>>> + .../gcc.target/i386/indirect-thunk-extern-7.c      |  43 ++
>>> + .../gcc.target/i386/indirect-thunk-inline-1.c      |  20 +
>>> + .../gcc.target/i386/indirect-thunk-inline-2.c      |  20 +
>>> + .../gcc.target/i386/indirect-thunk-inline-3.c      |  21 +
>>> + .../gcc.target/i386/indirect-thunk-inline-4.c      |  21 +
>>> + .../gcc.target/i386/indirect-thunk-inline-5.c      |  17 +
>>> + .../gcc.target/i386/indirect-thunk-inline-6.c      |  18 +
>>> + .../gcc.target/i386/indirect-thunk-inline-7.c      |  44 ++
>>> + 41 files changed, 1486 insertions(+), 17 deletions(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-5.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-6.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-7.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-8.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-bnd-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-bnd-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-bnd-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-bnd-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-5.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-6.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-extern-7.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-5.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-6.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-inline-7.c
>>> +
>>> +diff --git a/gcc/config/i386/i386-opts.h b/gcc/config/i386/i386-opts.h
>>> +index b7f92e3..cc21152 100644
>>> +--- a/gcc/config/i386/i386-opts.h
>>> ++++ b/gcc/config/i386/i386-opts.h
>>> +@@ -99,4 +99,17 @@ enum stack_protector_guard {
>>> +   SSP_GLOBAL    /* global canary */
>>> + };
>>> +
>>> ++/* This is used to mitigate variant #2 of the speculative execution
>>> ++   vulnerabilities on x86 processors identified by CVE-2017-5715, aka
>>> ++   Spectre.  They convert indirect branches and function returns to
>>> ++   call and return thunks to avoid speculative execution via indirect
>>> ++   call, jmp and ret.  */
>>> ++enum indirect_branch {
>>> ++  indirect_branch_unset =3D 0,
>>> ++  indirect_branch_keep,
>>> ++  indirect_branch_thunk,
>>> ++  indirect_branch_thunk_inline,
>>> ++  indirect_branch_thunk_extern
>>> ++};
>>> ++
>>> + #endif
>>> +diff --git a/gcc/config/i386/i386-protos.h
>>> b/gcc/config/i386/i386-protos.h
>>> +index ff47bc1..eca4cbf 100644
>>> +--- a/gcc/config/i386/i386-protos.h
>>> ++++ b/gcc/config/i386/i386-protos.h
>>> +@@ -311,6 +311,7 @@ extern enum attr_cpu ix86_schedule;
>>> + #endif
>>> +
>>> + extern const char * ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op);
>>> ++extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p=
);
>>> + extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool
>>> load,
>>> +                                               enum machine_mode mode)=
;
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 6c98f75..0b9fc4d 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -3662,12 +3662,23 @@ make_pass_stv (gcc::context *ctxt)
>>> +   return new pass_stv (ctxt);
>>> + }
>>> +
>>> +-/* Return true if a red-zone is in use.  */
>>> ++/* Return true if a red-zone is in use.  We can't use red-zone when
>>> ++   there are local indirect jumps, like "indirect_jump" or "tablejump=
",
>>> ++   which jumps to another place in the function, since "call" in the
>>> ++   indirect thunk pushes the return address onto stack, destroying
>>> ++   red-zone.
>>> ++
>>> ++   TODO: If we can reserve the first 2 WORDs, for PUSH and, another
>>> ++   for CALL, in red-zone, we can allow local indirect jumps with
>>> ++   indirect thunk.  */
>>> +
>>> + bool
>>> + ix86_using_red_zone (void)
>>> + {
>>> +-  return TARGET_RED_ZONE && !TARGET_64BIT_MS_ABI;
>>> ++  return (TARGET_RED_ZONE
>>> ++        && !TARGET_64BIT_MS_ABI
>>> ++        && (!cfun->machine->has_local_indirect_jump
>>> ++            || cfun->machine->indirect_branch_type =3D=3D
>>> indirect_branch_keep));
>>> + }
>>> +
>>> + /* Return a string that documents the current -m options.  The caller
>>> is
>>> +@@ -6350,6 +6361,37 @@ ix86_reset_previous_fndecl (void)
>>> +   ix86_previous_fndecl =3D NULL_TREE;
>>> + }
>>> +
>>> ++/* Set the indirect_branch_type field from the function FNDECL.  */
>>> ++
>>> ++static void
>>> ++ix86_set_indirect_branch_type (tree fndecl)
>>> ++{
>>> ++  if (cfun->machine->indirect_branch_type =3D=3D indirect_branch_unse=
t)
>>> ++    {
>>> ++      tree attr =3D lookup_attribute ("indirect_branch",
>>> ++                                  DECL_ATTRIBUTES (fndecl));
>>> ++      if (attr !=3D NULL)
>>> ++      {
>>> ++        tree args =3D TREE_VALUE (attr);
>>> ++        if (args =3D=3D NULL)
>>> ++          gcc_unreachable ();
>>> ++        tree cst =3D TREE_VALUE (args);
>>> ++        if (strcmp (TREE_STRING_POINTER (cst), "keep") =3D=3D 0)
>>> ++          cfun->machine->indirect_branch_type =3D indirect_branch_kee=
p;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk") =3D=3D 0=
)
>>> ++          cfun->machine->indirect_branch_type =3D indirect_branch_thu=
nk;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk-inline") =
=3D=3D
>>> 0)
>>> ++          cfun->machine->indirect_branch_type =3D
>>> indirect_branch_thunk_inline;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk-extern") =
=3D=3D
>>> 0)
>>> ++          cfun->machine->indirect_branch_type =3D
>>> indirect_branch_thunk_extern;
>>> ++        else
>>> ++          gcc_unreachable ();
>>> ++      }
>>> ++      else
>>> ++      cfun->machine->indirect_branch_type =3D ix86_indirect_branch;
>>> ++    }
>>> ++}
>>> ++
>>> + /* Establish appropriate back-end context for processing the function
>>> +    FNDECL.  The argument might be NULL to indicate processing at top
>>> +    level, outside of any function scope.  */
>>> +@@ -6360,7 +6402,13 @@ ix86_set_current_function (tree fndecl)
>>> +      several times in the course of compiling a function, and we don'=
t
>>> want to
>>> +      slow things down too much or call target_reinit when it isn't
>>> safe.  */
>>> +   if (fndecl =3D=3D ix86_previous_fndecl)
>>> +-    return;
>>> ++    {
>>> ++      /* There may be 2 function bodies for the same function FNDECL,
>>> ++       one is extern inline and one isn't.  */
>>> ++      if (fndecl !=3D NULL_TREE)
>>> ++      ix86_set_indirect_branch_type (fndecl);
>>> ++      return;
>>> ++    }
>>> +
>>> +   tree old_tree;
>>> +   if (ix86_previous_fndecl =3D=3D NULL_TREE)
>>> +@@ -6377,6 +6425,8 @@ ix86_set_current_function (tree fndecl)
>>> +       return;
>>> +     }
>>> +
>>> ++  ix86_set_indirect_branch_type (fndecl);
>>> ++
>>> +   tree new_tree =3D DECL_FUNCTION_SPECIFIC_TARGET (fndecl);
>>> +   if (new_tree =3D=3D NULL_TREE)
>>> +     new_tree =3D target_option_default_node;
>>> +@@ -10962,6 +11012,220 @@ ix86_setup_frame_addresses (void)
>>> + # endif
>>> + #endif
>>> +
>>> ++/* Label count for call and return thunks.  It is used to make unique
>>> ++   labels in call and return thunks.  */
>>> ++static int indirectlabelno;
>>> ++
>>> ++/* True if call and return thunk functions are needed.  */
>>> ++static bool indirect_thunk_needed =3D false;
>>> ++/* True if call and return thunk functions with the BND prefix are
>>> ++   needed.  */
>>> ++static bool indirect_thunk_bnd_needed =3D false;
>>> ++
>>> ++/* Bit masks of integer registers, which contain branch target, used
>>> ++   by call and return thunks functions.  */
>>> ++static int indirect_thunks_used;
>>> ++/* Bit masks of integer registers, which contain branch target, used
>>> ++   by call and return thunks functions with the BND prefix.  */
>>> ++static int indirect_thunks_bnd_used;
>>> ++
>>> ++#ifndef INDIRECT_LABEL
>>> ++# define INDIRECT_LABEL "LIND"
>>> ++#endif
>>> ++
>>> ++/* Fills in the label name that should be used for the indirect
>>> thunk.  */
>>> ++
>>> ++static void
>>> ++indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
>>> ++{
>>> ++  if (USE_HIDDEN_LINKONCE)
>>> ++    {
>>> ++      const char *bnd =3D need_bnd_p ? "_bnd" : "";
>>> ++      if (regno >=3D 0)
>>> ++      {
>>> ++        const char *reg_prefix;
>>> ++        if (LEGACY_INT_REGNO_P (regno))
>>> ++          reg_prefix =3D TARGET_64BIT ? "r" : "e";
>>> ++        else
>>> ++          reg_prefix =3D "";
>>> ++        sprintf (name, "__x86_indirect_thunk%s_%s%s",
>>> ++                 bnd, reg_prefix, reg_names[regno]);
>>> ++      }
>>> ++      else
>>> ++      sprintf (name, "__x86_indirect_thunk%s", bnd);
>>> ++    }
>>> ++  else
>>> ++    {
>>> ++      if (regno >=3D 0)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          ASM_GENERATE_INTERNAL_LABEL (name, "LITBR", regno);
>>> ++        else
>>> ++          ASM_GENERATE_INTERNAL_LABEL (name, "LITR", regno);
>>> ++      }
>>> ++      else
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
>>> ++        else
>>> ++          ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
>>> ++      }
>>> ++    }
>>> ++}
>>> ++
>>> ++/* Output a call and return thunk for indirect branch.  If BND_P is
>>> ++   true, the BND prefix is needed.   If REGNO !=3D -1,  the function
>>> ++   address is in REGNO and the call and return thunk looks like:
>>> ++
>>> ++      call    L2
>>> ++   L1:
>>> ++      pause
>>> ++      jmp     L1
>>> ++   L2:
>>> ++      mov     %REG, (%sp)
>>> ++      ret
>>> ++
>>> ++   Otherwise, the function address is on the top of stack and the
>>> ++   call and return thunk looks like:
>>> ++
>>> ++      call L2
>>> ++  L1:
>>> ++      pause
>>> ++      jmp L1
>>> ++  L2:
>>> ++      lea WORD_SIZE(%sp), %sp
>>> ++      ret
>>> ++ */
>>> ++
>>> ++static void
>>> ++output_indirect_thunk (bool need_bnd_p, int regno)
>>> ++{
>>> ++  char indirectlabel1[32];
>>> ++  char indirectlabel2[32];
>>> ++
>>> ++  ASM_GENERATE_INTERNAL_LABEL (indirectlabel1, INDIRECT_LABEL,
>>> ++                             indirectlabelno++);
>>> ++  ASM_GENERATE_INTERNAL_LABEL (indirectlabel2, INDIRECT_LABEL,
>>> ++                             indirectlabelno++);
>>> ++
>>> ++  /* Call */
>>> ++  if (need_bnd_p)
>>> ++    fputs ("\tbnd call\t", asm_out_file);
>>> ++  else
>>> ++    fputs ("\tcall\t", asm_out_file);
>>> ++  assemble_name_raw (asm_out_file, indirectlabel2);
>>> ++  fputc ('\n', asm_out_file);
>>> ++
>>> ++  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
>>> ++
>>> ++  /* Pause + lfence.  */
>>> ++  fprintf (asm_out_file, "\tpause\n\tlfence\n");
>>> ++
>>> ++  /* Jump.  */
>>> ++  fputs ("\tjmp\t", asm_out_file);
>>> ++  assemble_name_raw (asm_out_file, indirectlabel1);
>>> ++  fputc ('\n', asm_out_file);
>>> ++
>>> ++  ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
>>> ++
>>> ++  if (regno >=3D 0)
>>> ++    {
>>> ++      /* MOV.  */
>>> ++      rtx xops[2];
>>> ++      xops[0] =3D gen_rtx_MEM (word_mode, stack_pointer_rtx);
>>> ++      xops[1] =3D gen_rtx_REG (word_mode, regno);
>>> ++      output_asm_insn ("mov\t{%1, %0|%0, %1}", xops);
>>> ++    }
>>> ++  else
>>> ++    {
>>> ++      /* LEA.  */
>>> ++      rtx xops[2];
>>> ++      xops[0] =3D stack_pointer_rtx;
>>> ++      xops[1] =3D plus_constant (Pmode, stack_pointer_rtx,
>>> UNITS_PER_WORD);
>>> ++      output_asm_insn ("lea\t{%E1, %0|%0, %E1}", xops);
>>> ++    }
>>> ++
>>> ++  if (need_bnd_p)
>>> ++    fputs ("\tbnd ret\n", asm_out_file);
>>> ++  else
>>> ++    fputs ("\tret\n", asm_out_file);
>>> ++}
>>> ++
>>> ++/* Output a funtion with a call and return thunk for indirect branch.
>>> ++   If BND_P is true, the BND prefix is needed.   If REGNO !=3D -1,  t=
he
>>> ++   function address is in REGNO.  Otherwise, the function address is
>>> ++   on the top of stack.  */
>>> ++
>>> ++static void
>>> ++output_indirect_thunk_function (bool need_bnd_p, int regno)
>>> ++{
>>> ++  char name[32];
>>> ++  tree decl;
>>> ++
>>> ++  /* Create __x86_indirect_thunk/__x86_indirect_thunk_bnd.  */
>>> ++  indirect_thunk_name (name, regno, need_bnd_p);
>>> ++  decl =3D build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
>>> ++                   get_identifier (name),
>>> ++                   build_function_type_list (void_type_node,
>>> NULL_TREE));
>>> ++  DECL_RESULT (decl) =3D build_decl (BUILTINS_LOCATION, RESULT_DECL,
>>> ++                                 NULL_TREE, void_type_node);
>>> ++  TREE_PUBLIC (decl) =3D 1;
>>> ++  TREE_STATIC (decl) =3D 1;
>>> ++  DECL_IGNORED_P (decl) =3D 1;
>>> ++
>>> ++#if TARGET_MACHO
>>> ++  if (TARGET_MACHO)
>>> ++    {
>>> ++      switch_to_section (darwin_sections[picbase_thunk_section]);
>>> ++      fputs ("\t.weak_definition\t", asm_out_file);
>>> ++      assemble_name (asm_out_file, name);
>>> ++      fputs ("\n\t.private_extern\t", asm_out_file);
>>> ++      assemble_name (asm_out_file, name);
>>> ++      putc ('\n', asm_out_file);
>>> ++      ASM_OUTPUT_LABEL (asm_out_file, name);
>>> ++      DECL_WEAK (decl) =3D 1;
>>> ++    }
>>> ++  else
>>> ++#endif
>>> ++    if (USE_HIDDEN_LINKONCE)
>>> ++      {
>>> ++      cgraph_node::create (decl)->set_comdat_group
>>> (DECL_ASSEMBLER_NAME (decl));
>>> ++
>>> ++      targetm.asm_out.unique_section (decl, 0);
>>> ++      switch_to_section (get_named_section (decl, NULL, 0));
>>> ++
>>> ++      targetm.asm_out.globalize_label (asm_out_file, name);
>>> ++      fputs ("\t.hidden\t", asm_out_file);
>>> ++      assemble_name (asm_out_file, name);
>>> ++      putc ('\n', asm_out_file);
>>> ++      ASM_DECLARE_FUNCTION_NAME (asm_out_file, name, decl);
>>> ++      }
>>> ++    else
>>> ++      {
>>> ++      switch_to_section (text_section);
>>> ++      ASM_OUTPUT_LABEL (asm_out_file, name);
>>> ++      }
>>> ++
>>> ++  DECL_INITIAL (decl) =3D make_node (BLOCK);
>>> ++  current_function_decl =3D decl;
>>> ++  allocate_struct_function (decl, false);
>>> ++  init_function_start (decl);
>>> ++  /* We're about to hide the function body from callees of final_* by
>>> ++     emitting it directly; tell them we're a thunk, if they care.  */
>>> ++  cfun->is_thunk =3D true;
>>> ++  first_function_block_is_cold =3D false;
>>> ++  /* Make sure unwind info is emitted for the thunk if needed.  */
>>> ++  final_start_function (emit_barrier (), asm_out_file, 1);
>>> ++
>>> ++  output_indirect_thunk (need_bnd_p, regno);
>>> ++
>>> ++  final_end_function ();
>>> ++  init_insn_lengths ();
>>> ++  free_after_compilation (cfun);
>>> ++  set_cfun (NULL);
>>> ++  current_function_decl =3D NULL;
>>> ++}
>>> ++
>>> + static int pic_labels_used;
>>> +
>>> + /* Fills in the label name that should be used for a pc thunk for
>>> +@@ -10988,11 +11252,32 @@ ix86_code_end (void)
>>> +   rtx xops[2];
>>> +   int regno;
>>> +
>>> ++  if (indirect_thunk_needed)
>>> ++    output_indirect_thunk_function (false, -1);
>>> ++  if (indirect_thunk_bnd_needed)
>>> ++    output_indirect_thunk_function (true, -1);
>>> ++
>>> ++  for (regno =3D FIRST_REX_INT_REG; regno <=3D LAST_REX_INT_REG; regn=
o++)
>>> ++    {
>>> ++      int i =3D regno - FIRST_REX_INT_REG + LAST_INT_REG + 1;
>>> ++      if ((indirect_thunks_used & (1 << i)))
>>> ++      output_indirect_thunk_function (false, regno);
>>> ++
>>> ++      if ((indirect_thunks_bnd_used & (1 << i)))
>>> ++      output_indirect_thunk_function (true, regno);
>>> ++    }
>>> ++
>>> +   for (regno =3D AX_REG; regno <=3D SP_REG; regno++)
>>> +     {
>>> +       char name[32];
>>> +       tree decl;
>>> +
>>> ++      if ((indirect_thunks_used & (1 << regno)))
>>> ++      output_indirect_thunk_function (false, regno);
>>> ++
>>> ++      if ((indirect_thunks_bnd_used & (1 << regno)))
>>> ++      output_indirect_thunk_function (true, regno);
>>> ++
>>> +       if (!(pic_labels_used & (1 << regno)))
>>> +       continue;
>>> +
>>> +@@ -27369,12 +27654,292 @@ ix86_nopic_noplt_attribute_p (rtx call_op)
>>> +   return false;
>>> + }
>>> +
>>> ++/* Output indirect branch via a call and return thunk.  CALL_OP is a
>>> ++   register which contains the branch target.  XASM is the assembly
>>> ++   template for CALL_OP.  Branch is a tail call if SIBCALL_P is true.
>>> ++   A normal call is converted to:
>>> ++
>>> ++      call __x86_indirect_thunk_reg
>>> ++
>>> ++   and a tail call is converted to:
>>> ++
>>> ++      jmp __x86_indirect_thunk_reg
>>> ++ */
>>> ++
>>> ++static void
>>> ++ix86_output_indirect_branch_via_reg (rtx call_op, bool sibcall_p)
>>> ++{
>>> ++  char thunk_name_buf[32];
>>> ++  char *thunk_name;
>>> ++  bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_insn);
>>> ++  int regno =3D REGNO (call_op);
>>> ++
>>> ++  if (cfun->machine->indirect_branch_type
>>> ++      !=3D indirect_branch_thunk_inline)
>>> ++    {
>>> ++      if (cfun->machine->indirect_branch_type =3D=3D
>>> indirect_branch_thunk)
>>> ++      {
>>> ++        int i =3D regno;
>>> ++        if (i >=3D FIRST_REX_INT_REG)
>>> ++          i -=3D (FIRST_REX_INT_REG - LAST_INT_REG - 1);
>>> ++        if (need_bnd_p)
>>> ++          indirect_thunks_bnd_used |=3D 1 << i;
>>> ++        else
>>> ++          indirect_thunks_used |=3D 1 << i;
>>> ++      }
>>> ++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
>>> ++      thunk_name =3D thunk_name_buf;
>>> ++    }
>>> ++  else
>>> ++    thunk_name =3D NULL;
>>> ++
>>> ++  if (sibcall_p)
>>> ++    {
>>> ++      if (thunk_name !=3D NULL)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++        else
>>> ++          fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, regno);
>>> ++    }
>>> ++  else
>>> ++    {
>>> ++      if (thunk_name !=3D NULL)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          fprintf (asm_out_file, "\tbnd call\t%s\n", thunk_name);
>>> ++        else
>>> ++          fprintf (asm_out_file, "\tcall\t%s\n", thunk_name);
>>> ++        return;
>>> ++      }
>>> ++
>>> ++      char indirectlabel1[32];
>>> ++      char indirectlabel2[32];
>>> ++
>>> ++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,
>>> ++                                 INDIRECT_LABEL,
>>> ++                                 indirectlabelno++);
>>> ++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,
>>> ++                                 INDIRECT_LABEL,
>>> ++                                 indirectlabelno++);
>>> ++
>>> ++      /* Jump.  */
>>> ++      if (need_bnd_p)
>>> ++      fputs ("\tbnd jmp\t", asm_out_file);
>>> ++      else
>>> ++      fputs ("\tjmp\t", asm_out_file);
>>> ++      assemble_name_raw (asm_out_file, indirectlabel2);
>>> ++      fputc ('\n', asm_out_file);
>>> ++
>>> ++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
>>> ++
>>> ++      if (thunk_name !=3D NULL)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++        else
>>> ++          fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, regno);
>>> ++
>>> ++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
>>> ++
>>> ++      /* Call.  */
>>> ++      if (need_bnd_p)
>>> ++      fputs ("\tbnd call\t", asm_out_file);
>>> ++      else
>>> ++      fputs ("\tcall\t", asm_out_file);
>>> ++      assemble_name_raw (asm_out_file, indirectlabel1);
>>> ++      fputc ('\n', asm_out_file);
>>> ++    }
>>> ++}
>>> ++
>>> ++/* Output indirect branch via a call and return thunk.  CALL_OP is
>>> ++   the branch target.  XASM is the assembly template for CALL_OP.
>>> ++   Branch is a tail call if SIBCALL_P is true.  A normal call is
>>> ++   converted to:
>>> ++
>>> ++      jmp L2
>>> ++   L1:
>>> ++      push CALL_OP
>>> ++      jmp __x86_indirect_thunk
>>> ++   L2:
>>> ++      call L1
>>> ++
>>> ++   and a tail call is converted to:
>>> ++
>>> ++      push CALL_OP
>>> ++      jmp __x86_indirect_thunk
>>> ++ */
>>> ++
>>> ++static void
>>> ++ix86_output_indirect_branch_via_push (rtx call_op, const char *xasm,
>>> ++                                    bool sibcall_p)
>>> ++{
>>> ++  char thunk_name_buf[32];
>>> ++  char *thunk_name;
>>> ++  char push_buf[64];
>>> ++  bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_insn);
>>> ++  int regno =3D -1;
>>> ++
>>> ++  if (cfun->machine->indirect_branch_type
>>> ++      !=3D indirect_branch_thunk_inline)
>>> ++    {
>>> ++      if (cfun->machine->indirect_branch_type =3D=3D
>>> indirect_branch_thunk)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          indirect_thunk_bnd_needed =3D true;
>>> ++        else
>>> ++          indirect_thunk_needed =3D true;
>>> ++      }
>>> ++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
>>> ++      thunk_name =3D thunk_name_buf;
>>> ++    }
>>> ++  else
>>> ++    thunk_name =3D NULL;
>>> ++
>>> ++  snprintf (push_buf, sizeof (push_buf), "push{%c}\t%s",
>>> ++          TARGET_64BIT ? 'q' : 'l', xasm);
>>> ++
>>> ++  if (sibcall_p)
>>> ++    {
>>> ++      output_asm_insn (push_buf, &call_op);
>>> ++      if (thunk_name !=3D NULL)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++        else
>>> ++          fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, regno);
>>> ++    }
>>> ++  else
>>> ++    {
>>> ++      char indirectlabel1[32];
>>> ++      char indirectlabel2[32];
>>> ++
>>> ++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,
>>> ++                                 INDIRECT_LABEL,
>>> ++                                 indirectlabelno++);
>>> ++      ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,
>>> ++                                 INDIRECT_LABEL,
>>> ++                                 indirectlabelno++);
>>> ++
>>> ++      /* Jump.  */
>>> ++      if (need_bnd_p)
>>> ++      fputs ("\tbnd jmp\t", asm_out_file);
>>> ++      else
>>> ++      fputs ("\tjmp\t", asm_out_file);
>>> ++      assemble_name_raw (asm_out_file, indirectlabel2);
>>> ++      fputc ('\n', asm_out_file);
>>> ++
>>> ++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);
>>> ++
>>> ++      /* An external function may be called via GOT, instead of PLT.
>>> */
>>> ++      if (MEM_P (call_op))
>>> ++      {
>>> ++        struct ix86_address parts;
>>> ++        rtx addr =3D XEXP (call_op, 0);
>>> ++        if (ix86_decompose_address (addr, &parts)
>>> ++            && parts.base =3D=3D stack_pointer_rtx)
>>> ++          {
>>> ++            /* Since call will adjust stack by -UNITS_PER_WORD,
>>> ++               we must convert "disp(stack, index, scale)" to
>>> ++               "disp+UNITS_PER_WORD(stack, index, scale)".  */
>>> ++            if (parts.index)
>>> ++              {
>>> ++                addr =3D gen_rtx_MULT (Pmode, parts.index,
>>> ++                                     GEN_INT (parts.scale));
>>> ++                addr =3D gen_rtx_PLUS (Pmode, stack_pointer_rtx,
>>> ++                                     addr);
>>> ++              }
>>> ++            else
>>> ++              addr =3D stack_pointer_rtx;
>>> ++
>>> ++            rtx disp;
>>> ++            if (parts.disp !=3D NULL_RTX)
>>> ++              disp =3D plus_constant (Pmode, parts.disp,
>>> ++                                    UNITS_PER_WORD);
>>> ++            else
>>> ++              disp =3D GEN_INT (UNITS_PER_WORD);
>>> ++
>>> ++            addr =3D gen_rtx_PLUS (Pmode, addr, disp);
>>> ++            call_op =3D gen_rtx_MEM (GET_MODE (call_op), addr);
>>> ++          }
>>> ++      }
>>> ++
>>> ++      output_asm_insn (push_buf, &call_op);
>>> ++
>>> ++      if (thunk_name !=3D NULL)
>>> ++      {
>>> ++        if (need_bnd_p)
>>> ++          fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++        else
>>> ++          fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, regno);
>>> ++
>>> ++      ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
>>> ++
>>> ++      /* Call.  */
>>> ++      if (need_bnd_p)
>>> ++      fputs ("\tbnd call\t", asm_out_file);
>>> ++      else
>>> ++      fputs ("\tcall\t", asm_out_file);
>>> ++      assemble_name_raw (asm_out_file, indirectlabel1);
>>> ++      fputc ('\n', asm_out_file);
>>> ++    }
>>> ++}
>>> ++
>>> ++/* Output indirect branch via a call and return thunk.  CALL_OP is
>>> ++   the branch target.  XASM is the assembly template for CALL_OP.
>>> ++   Branch is a tail call if SIBCALL_P is true.   */
>>> ++
>>> ++static void
>>> ++ix86_output_indirect_branch (rtx call_op, const char *xasm,
>>> ++                           bool sibcall_p)
>>> ++{
>>> ++  if (REG_P (call_op))
>>> ++    ix86_output_indirect_branch_via_reg (call_op, sibcall_p);
>>> ++  else
>>> ++    ix86_output_indirect_branch_via_push (call_op, xasm, sibcall_p);
>>> ++}
>>> ++/* Output indirect jump.  CALL_OP is the jump target.  Jump is a
>>> ++   function return if RET_P is true.  */
>>> ++
>>> ++const char *
>>> ++ix86_output_indirect_jmp (rtx call_op, bool ret_p)
>>> ++{
>>> ++  if (cfun->machine->indirect_branch_type !=3D indirect_branch_keep)
>>> ++    {
>>> ++      /* We can't have red-zone if this isn't a function return since
>>> ++       "call" in the indirect thunk pushes the return address onto
>>> ++       stack, destroying red-zone.  */
>>> ++      if (!ret_p && ix86_red_zone_size !=3D 0)
>>> ++      gcc_unreachable ();
>>> ++
>>> ++      ix86_output_indirect_branch (call_op, "%0", true);
>>> ++      return "";
>>> ++    }
>>> ++  else
>>> ++    return "%!jmp\t%A0";
>>> ++}
>>> ++
>>> + /* Output the assembly for a call instruction.  */
>>> +
>>> + const char *
>>> + ix86_output_call_insn (rtx_insn *insn, rtx call_op)
>>> + {
>>> +   bool direct_p =3D constant_call_address_operand (call_op, VOIDmode)=
;
>>> ++  bool output_indirect_p
>>> ++    =3D (!TARGET_SEH
>>> ++       && cfun->machine->indirect_branch_type !=3D
>>> indirect_branch_keep);
>>> +   bool seh_nop_p =3D false;
>>> +   const char *xasm;
>>> +
>>> +@@ -27383,7 +27948,13 @@ ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op)
>>> +       if (direct_p)
>>> +       {
>>> +         if (ix86_nopic_noplt_attribute_p (call_op))
>>> +-          xasm =3D "%!jmp\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPC=
REL
>>> [rip]]}";
>>> ++          {
>>> ++            direct_p =3D false;
>>> ++            if (output_indirect_p)
>>> ++              xasm =3D "{%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL
>>> [rip]]}";
>>> ++            else
>>> ++              xasm =3D "%!jmp\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR
>>> %p0@GOTPCREL[rip]]}";
>>> ++          }
>>> +         else
>>> +           xasm =3D "%!jmp\t%P0";
>>> +       }
>>> +@@ -27392,9 +27963,17 @@ ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op)
>>> +       else if (TARGET_SEH)
>>> +       xasm =3D "%!rex.W jmp\t%A0";
>>> +       else
>>> +-      xasm =3D "%!jmp\t%A0";
>>> ++      {
>>> ++        if (output_indirect_p)
>>> ++          xasm =3D "%0";
>>> ++        else
>>> ++          xasm =3D "%!jmp\t%A0";
>>> ++      }
>>> +
>>> +-      output_asm_insn (xasm, &call_op);
>>> ++      if (output_indirect_p && !direct_p)
>>> ++      ix86_output_indirect_branch (call_op, xasm, true);
>>> ++      else
>>> ++      output_asm_insn (xasm, &call_op);
>>> +       return "";
>>> +     }
>>> +
>>> +@@ -27431,14 +28010,28 @@ ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op)
>>> +   if (direct_p)
>>> +     {
>>> +       if (ix86_nopic_noplt_attribute_p (call_op))
>>> +-      xasm =3D "%!call\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL
>>> [rip]]}";
>>> ++      {
>>> ++        direct_p =3D false;
>>> ++        if (output_indirect_p)
>>> ++          xasm =3D "{%p0@GOTPCREL(%%rip)|[QWORD PTR %p0@GOTPCREL
>>> [rip]]}";
>>> ++        else
>>> ++          xasm =3D "%!call\t{*%p0@GOTPCREL(%%rip)|[QWORD PTR
>>> %p0@GOTPCREL[rip]]}";
>>> ++      }
>>> +       else
>>> +       xasm =3D "%!call\t%P0";
>>> +     }
>>> +   else
>>> +-    xasm =3D "%!call\t%A0";
>>> ++    {
>>> ++      if (output_indirect_p)
>>> ++      xasm =3D "%0";
>>> ++      else
>>> ++      xasm =3D "%!call\t%A0";
>>> ++    }
>>> +
>>> +-  output_asm_insn (xasm, &call_op);
>>> ++  if (output_indirect_p && !direct_p)
>>> ++    ix86_output_indirect_branch (call_op, xasm, false);
>>> ++  else
>>> ++    output_asm_insn (xasm, &call_op);
>>> +
>>> +   if (seh_nop_p)
>>> +     return "nop";
>>> +@@ -44836,7 +45429,7 @@ ix86_handle_struct_attribute (tree *node, tree
>>> name, tree, int,
>>> + }
>>> +
>>> + static tree
>>> +-ix86_handle_fndecl_attribute (tree *node, tree name, tree, int,
>>> ++ix86_handle_fndecl_attribute (tree *node, tree name, tree args, int,
>>> +                             bool *no_add_attrs)
>>> + {
>>> +   if (TREE_CODE (*node) !=3D FUNCTION_DECL)
>>> +@@ -44845,6 +45438,29 @@ ix86_handle_fndecl_attribute (tree *node, tre=
e
>>> name, tree, int,
>>> +                name);
>>> +       *no_add_attrs =3D true;
>>> +     }
>>> ++
>>> ++  if (is_attribute_p ("indirect_branch", name))
>>> ++    {
>>> ++      tree cst =3D TREE_VALUE (args);
>>> ++      if (TREE_CODE (cst) !=3D STRING_CST)
>>> ++      {
>>> ++        warning (OPT_Wattributes,
>>> ++                 "%qE attribute requires a string constant argument",
>>> ++                 name);
>>> ++        *no_add_attrs =3D true;
>>> ++      }
>>> ++      else if (strcmp (TREE_STRING_POINTER (cst), "keep") !=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk") !=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk-inline") !=
=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk-extern") !=
=3D
>>> 0)
>>> ++      {
>>> ++        warning (OPT_Wattributes,
>>> ++                 "argument to %qE attribute is not "
>>> ++                 "(keep|thunk|thunk-inline|thunk-extern)", name);
>>> ++        *no_add_attrs =3D true;
>>> ++      }
>>> ++    }
>>> ++
>>> +   return NULL_TREE;
>>> + }
>>> +
>>> +@@ -49072,6 +49688,9 @@ static const struct attribute_spec
>>> ix86_attribute_table[] =3D
>>> +     false },
>>> +   { "callee_pop_aggregate_return", 1, 1, false, true, true,
>>> +     ix86_handle_callee_pop_aggregate_return, true },
>>> ++  { "indirect_branch", 1, 1, true, false, false,
>>> ++    ix86_handle_fndecl_attribute, false },
>>> ++
>>> +   /* End element.  */
>>> +   { NULL,        0, 0, false, false, false, NULL, false }
>>> + };
>>> +diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
>>> +index 5414416..9dccdb0 100644
>>> +--- a/gcc/config/i386/i386.h
>>> ++++ b/gcc/config/i386/i386.h
>>> +@@ -2572,6 +2572,13 @@ struct GTY(()) machine_function {
>>> +   /* If true, it is safe to not save/restore DRAP register.  */
>>> +   BOOL_BITFIELD no_drap_save_restore : 1;
>>> +
>>> ++  /* How to generate indirec branch.  */
>>> ++  ENUM_BITFIELD(indirect_branch) indirect_branch_type : 3;
>>> ++
>>> ++  /* If true, the current function has local indirect jumps, like
>>> ++     "indirect_jump" or "tablejump".  */
>>> ++  BOOL_BITFIELD has_local_indirect_jump : 1;
>>> ++
>>> +   /* If true, there is register available for argument passing.  This
>>> +      is used only in ix86_function_ok_for_sibcall by 32-bit to
>>> determine
>>> +      if there is scratch register available for indirect sibcall.  In
>>> +diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
>>> +index d2bfe31..153e162 100644
>>> +--- a/gcc/config/i386/i386.md
>>> ++++ b/gcc/config/i386/i386.md
>>> +@@ -11807,13 +11807,18 @@
>>> + {
>>> +   if (TARGET_X32)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> ++  cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +
>>> + (define_insn "*indirect_jump"
>>> +   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))]
>>> +   ""
>>> +-  "%!jmp\t%A0"
>>> +-  [(set_attr "type" "ibr")
>>> ++  "* return ix86_output_indirect_jmp (operands[0], false);"
>>> ++  [(set (attr "type")
>>> ++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> ++                               !=3D indirect_branch_keep)")
>>> ++      (const_string "multi")
>>> ++      (const_string "ibr")))
>>> +    (set_attr "length_immediate" "0")
>>> +    (set_attr "maybe_prefix_bnd" "1")])
>>> +
>>> +@@ -11856,14 +11861,19 @@
>>> +
>>> +   if (TARGET_X32)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> ++  cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +
>>> + (define_insn "*tablejump_1"
>>> +   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))
>>> +    (use (label_ref (match_operand 1)))]
>>> +   ""
>>> +-  "%!jmp\t%A0"
>>> +-  [(set_attr "type" "ibr")
>>> ++  "* return ix86_output_indirect_jmp (operands[0], false);"
>>> ++  [(set (attr "type")
>>> ++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> ++                               !=3D indirect_branch_keep)")
>>> ++      (const_string "multi")
>>> ++      (const_string "ibr")))
>>> +    (set_attr "length_immediate" "0")
>>> +    (set_attr "maybe_prefix_bnd" "1")])
>>> +
>>> +@@ -12520,8 +12530,12 @@
>>> +   [(simple_return)
>>> +    (use (match_operand:SI 0 "register_operand" "r"))]
>>> +   "reload_completed"
>>> +-  "%!jmp\t%A0"
>>> +-  [(set_attr "type" "ibr")
>>> ++  "* return ix86_output_indirect_jmp (operands[0], true);"
>>> ++  [(set (attr "type")
>>> ++     (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> ++                               !=3D indirect_branch_keep)")
>>> ++      (const_string "multi")
>>> ++      (const_string "ibr")))
>>> +    (set_attr "length_immediate" "0")
>>> +    (set_attr "maybe_prefix_bnd" "1")])
>>> +
>>> +diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
>>> +index f304b62..5ffa334 100644
>>> +--- a/gcc/config/i386/i386.opt
>>> ++++ b/gcc/config/i386/i386.opt
>>> +@@ -897,3 +897,23 @@ Enum(stack_protector_guard) String(global)
>>> Value(SSP_GLOBAL)
>>> + mmitigate-rop
>>> + Target Var(flag_mitigate_rop) Init(0)
>>> + Attempt to avoid generating instruction sequences containing ret byte=
s.
>>> ++
>>> ++mindirect-branch=3D
>>> ++Target Report RejectNegative Joined Enum(indirect_branch)
>>> Var(ix86_indirect_branch) Init(indirect_branch_keep)
>>> ++Convert indirect call and jump to call and return thunks.
>>> ++
>>> ++Enum
>>> ++Name(indirect_branch) Type(enum indirect_branch)
>>> ++Known indirect branch choices (for use with the -mindirect-branch=3D
>>> option):
>>> ++
>>> ++EnumValue
>>> ++Enum(indirect_branch) String(keep) Value(indirect_branch_keep)
>>> ++
>>> ++EnumValue
>>> ++Enum(indirect_branch) String(thunk) Value(indirect_branch_thunk)
>>> ++
>>> ++EnumValue
>>> ++Enum(indirect_branch) String(thunk-inline)
>>> Value(indirect_branch_thunk_inline)
>>> ++
>>> ++EnumValue
>>> ++Enum(indirect_branch) String(thunk-extern)
>>> Value(indirect_branch_thunk_extern)
>>> +diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
>>> +index 8cc4f7e..8668dae 100644
>>> +--- a/gcc/doc/extend.texi
>>> ++++ b/gcc/doc/extend.texi
>>> +@@ -5419,6 +5419,16 @@ Specify which floating-point unit to use.  You
>>> must specify the
>>> + @code{target("fpmath=3Dsse,387")} option as
>>> + @code{target("fpmath=3Dsse+387")} because the comma would separate
>>> + different options.
>>> ++
>>> ++@item indirect_branch("@var{choice}")
>>> ++@cindex @code{indirect_branch} function attribute, x86
>>> ++On x86 targets, the @code{indirect_branch} attribute causes the
>>> compiler
>>> ++to convert indirect call and jump with @var{choice}.  @samp{keep}
>>> ++keeps indirect call and jump unmodified.  @samp{thunk} converts
>>> indirect
>>> ++call and jump to call and return thunk.  @samp{thunk-inline} converts
>>> ++indirect call and jump to inlined call and return thunk.
>>> ++@samp{thunk-extern} converts indirect call and jump to external call
>>> ++and return thunk provided in a separate object file.
>>> + @end table
>>> +
>>> + On the x86, the inliner does not inline a
>>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
>>> +index b066f7b..ff9a194 100644
>>> +--- a/gcc/doc/invoke.texi
>>> ++++ b/gcc/doc/invoke.texi
>>> +@@ -1169,7 +1169,7 @@ See RS/6000 and PowerPC Options.
>>> + -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol
>>> + -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
>>> + -malign-data=3D@var{type} -mstack-protector-guard=3D@var{guard} @gol
>>> +--mmitigate-rop}
>>> ++-mmitigate-rop -mindirect-branch=3D@var{choice}}
>>> +
>>> + @emph{x86 Windows Options}
>>> + @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
>>> +@@ -24218,6 +24218,17 @@ opcodes, to mitigate against certain forms of
>>> attack. At the moment,
>>> + this option is limited in what it can do and should not be relied
>>> + on to provide serious protection.
>>> +
>>> ++@item -mindirect-branch=3D@var{choice}
>>> ++@opindex -mindirect-branch
>>> ++Convert indirect call and jump with @var{choice}.  The default is
>>> ++@samp{keep}, which keeps indirect call and jump unmodified.
>>> ++@samp{thunk} converts indirect call and jump to call and return thunk=
.
>>> ++@samp{thunk-inline} converts indirect call and jump to inlined call
>>> ++and return thunk.  @samp{thunk-extern} converts indirect call and jum=
p
>>> ++to external call and return thunk provided in a separate object file.
>>> ++You can control this behavior for a specific function by using the
>>> ++function attribute @code{indirect_branch}.  @xref{Function Attributes=
}.
>>> ++
>>> + @end table
>>> +
>>> + These @samp{-m} switches are supported in addition to the above
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +new file mode 100644
>>> +index 0000000..d983e1c
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +new file mode 100644
>>> +index 0000000..58f09b4
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +new file mode 100644
>>> +index 0000000..f20d35c
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +new file mode 100644
>>> +index 0000000..0eff8fb
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +new file mode 100644
>>> +index 0000000..a25b20d
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +@@ -0,0 +1,17 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +new file mode 100644
>>> +index 0000000..cff114a
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +@@ -0,0 +1,18 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +new file mode 100644
>>> +index 0000000..afdb600
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +@@ -0,0 +1,44 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++void func0 (void);
>>> ++void func1 (void);
>>> ++void func2 (void);
>>> ++void func3 (void);
>>> ++void func4 (void);
>>> ++void func4 (void);
>>> ++void func5 (void);
>>> ++
>>> ++void
>>> ++bar (int i)
>>> ++{
>>> ++  switch (i)
>>> ++    {
>>> ++    default:
>>> ++      func0 ();
>>> ++      break;
>>> ++    case 1:
>>> ++      func1 ();
>>> ++      break;
>>> ++    case 2:
>>> ++      func2 ();
>>> ++      break;
>>> ++    case 3:
>>> ++      func3 ();
>>> ++      break;
>>> ++    case 4:
>>> ++      func4 ();
>>> ++      break;
>>> ++    case 5:
>>> ++      func5 ();
>>> ++      break;
>>> ++    }
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +new file mode 100644
>>> +index 0000000..d64d978
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +@@ -0,0 +1,23 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++extern void male_indirect_jump (long)
>>> ++  __attribute__ ((indirect_branch("thunk")));
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +new file mode 100644
>>> +index 0000000..9306745
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk")))
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +new file mode 100644
>>> +index 0000000..97744d6
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +@@ -0,0 +1,23 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++extern int male_indirect_jump (long)
>>> ++  __attribute__ ((indirect_branch("thunk-inline")));
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +new file mode 100644
>>> +index 0000000..bfce3ea
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk-inline")))
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +new file mode 100644
>>> +index 0000000..0833606
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++extern int male_indirect_jump (long)
>>> ++  __attribute__ ((indirect_branch("thunk-extern")));
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +new file mode 100644
>>> +index 0000000..2eba0fb
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk-extern")))
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +new file mode 100644
>>> +index 0000000..f58427e
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +@@ -0,0 +1,44 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -fno-pic" } */
>>> ++
>>> ++void func0 (void);
>>> ++void func1 (void);
>>> ++void func2 (void);
>>> ++void func3 (void);
>>> ++void func4 (void);
>>> ++void func4 (void);
>>> ++void func5 (void);
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk-extern")))
>>> ++void
>>> ++bar (int i)
>>> ++{
>>> ++  switch (i)
>>> ++    {
>>> ++    default:
>>> ++      func0 ();
>>> ++      break;
>>> ++    case 1:
>>> ++      func1 ();
>>> ++      break;
>>> ++    case 2:
>>> ++      func2 ();
>>> ++      break;
>>> ++    case 3:
>>> ++      func3 ();
>>> ++      break;
>>> ++    case 4:
>>> ++      func4 ();
>>> ++      break;
>>> ++    case 5:
>>> ++      func5 ();
>>> ++      break;
>>> ++    }
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> +new file mode 100644
>>> +index 0000000..564ed39
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> +@@ -0,0 +1,42 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++void func0 (void);
>>> ++void func1 (void);
>>> ++void func2 (void);
>>> ++void func3 (void);
>>> ++void func4 (void);
>>> ++void func4 (void);
>>> ++void func5 (void);
>>> ++
>>> ++__attribute__ ((indirect_branch("keep")))
>>> ++void
>>> ++bar (int i)
>>> ++{
>>> ++  switch (i)
>>> ++    {
>>> ++    default:
>>> ++      func0 ();
>>> ++      break;
>>> ++    case 1:
>>> ++      func1 ();
>>> ++      break;
>>> ++    case 2:
>>> ++      func2 ();
>>> ++      break;
>>> ++    case 3:
>>> ++      func3 ();
>>> ++      break;
>>> ++    case 4:
>>> ++      func4 ();
>>> ++      break;
>>> ++    case 5:
>>> ++      func5 ();
>>> ++      break;
>>> ++    }
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +new file mode 100644
>>> +index 0000000..50fbee2
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile { target { ! x32 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fno-pic" } */
>>> ++
>>> ++void (*dispatch) (char *);
>>> ++char buf[10];
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  dispatch (buf);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> ++/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd ret" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +new file mode 100644
>>> +index 0000000..2976e67
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile { target { ! x32 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fno-pic" } */
>>> ++
>>> ++void (*dispatch) (char *);
>>> ++char buf[10];
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  dispatch (buf);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> ++/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd ret" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +new file mode 100644
>>> +index 0000000..da4bc98
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +@@ -0,0 +1,19 @@
>>> ++/* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fpic -fno-plt" } */
>>> ++
>>> ++void bar (char *);
>>> ++char buf[10];
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  bar (buf);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "bnd ret" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +new file mode 100644
>>> +index 0000000..c64d12e
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fpic -fno-plt" } */
>>> ++
>>> ++void bar (char *);
>>> ++char buf[10];
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar (buf);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 2 } } *=
/
>>> ++/* { dg-final { scan-assembler "bnd ret" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +new file mode 100644
>>> +index 0000000..49f27b4
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +@@ -0,0 +1,19 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +new file mode 100644
>>> +index 0000000..a1e3eb6
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +@@ -0,0 +1,19 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +new file mode 100644
>>> +index 0000000..395634e
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +new file mode 100644
>>> +index 0000000..fd3f633
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +new file mode 100644
>>> +index 0000000..ba2f92b
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +@@ -0,0 +1,16 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern"=
 }
>>> */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +new file mode 100644
>>> +index 0000000..0c5a2d4
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +@@ -0,0 +1,17 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern"=
 }
>>> */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +new file mode 100644
>>> +index 0000000..6652523
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +@@ -0,0 +1,43 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++void func0 (void);
>>> ++void func1 (void);
>>> ++void func2 (void);
>>> ++void func3 (void);
>>> ++void func4 (void);
>>> ++void func4 (void);
>>> ++void func5 (void);
>>> ++
>>> ++void
>>> ++bar (int i)
>>> ++{
>>> ++  switch (i)
>>> ++    {
>>> ++    default:
>>> ++      func0 ();
>>> ++      break;
>>> ++    case 1:
>>> ++      func1 ();
>>> ++      break;
>>> ++    case 2:
>>> ++      func2 ();
>>> ++      break;
>>> ++    case 3:
>>> ++      func3 ();
>>> ++      break;
>>> ++    case 4:
>>> ++      func4 ();
>>> ++      break;
>>> ++    case 5:
>>> ++      func5 ();
>>> ++      break;
>>> ++    }
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +new file mode 100644
>>> +index 0000000..68c0ff7
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +new file mode 100644
>>> +index 0000000..e2da1fc
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +new file mode 100644
>>> +index 0000000..244fec7
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +new file mode 100644
>>> +index 0000000..107ebe3
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +@@ -0,0 +1,21 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch[256];
>>> ++
>>> ++int
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch[offset](offset);
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +new file mode 100644
>>> +index 0000000..17b04ef
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +@@ -0,0 +1,17 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline"=
 }
>>> */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +new file mode 100644
>>> +index 0000000..d9eb112
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +@@ -0,0 +1,18 @@
>>> ++/* { dg-do compile { target *-*-linux* } } */
>>> ++/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline"=
 }
>>> */
>>> ++
>>> ++extern void bar (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +new file mode 100644
>>> +index 0000000..d02b1dc
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +@@ -0,0 +1,44 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++void func0 (void);
>>> ++void func1 (void);
>>> ++void func2 (void);
>>> ++void func3 (void);
>>> ++void func4 (void);
>>> ++void func4 (void);
>>> ++void func5 (void);
>>> ++
>>> ++void
>>> ++bar (int i)
>>> ++{
>>> ++  switch (i)
>>> ++    {
>>> ++    default:
>>> ++      func0 ();
>>> ++      break;
>>> ++    case 1:
>>> ++      func1 ();
>>> ++      break;
>>> ++    case 2:
>>> ++      func2 ();
>>> ++      break;
>>> ++    case 3:
>>> ++      func3 ();
>>> ++      break;
>>> ++    case 4:
>>> ++      func4 ();
>>> ++      break;
>>> ++    case 5:
>>> ++      func5 ();
>>> ++      break;
>>> ++    }
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x=
.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0005-uclibc-locale-no__x.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0005-uclibc-locale-no__x.=
p
>>> atch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0005-uclibc-locale-no__x.p
>>> atch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0005-x86-Add-mfunction-r=
eturn.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0005-x86-Add-mfunction-return.patch
>>> new file mode 100644
>>> index 0000000..2529bf2
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0005-x86-Add-mfunction-r
>>> eturn.patch
>>> @@ -0,0 +1,1567 @@
>>> +From e3270814b9e0caad63fbcdfd7ae9da2d52c97497 Mon Sep 17 00:00:00 2001
>>> +From: "H.J. Lu" <hjl.tools@gmail.com>
>>> +Date: Sat, 6 Jan 2018 22:29:56 -0800
>>> +Subject: [PATCH 05/12] x86: Add -mfunction-return=3D
>>> +
>>> +Add -mfunction-return=3D option to convert function return to call and
>>> +return thunks.  The default is 'keep', which keeps function return
>>> +unmodified.  'thunk' converts function return to call and return thunk=
.
>>> +'thunk-inline' converts function return to inlined call and return
>>> thunk.
>>> +'thunk-extern' converts function return to external call and return
>>> +thunk provided in a separate object file.  You can control this behavi=
or
>>> +for a specific function by using the function attribute function_retur=
n.
>>> +
>>> +Function return thunk is the same as memory thunk for -mindirect-branc=
h=3D
>>> +where the return address is at the top of the stack:
>>> +
>>> +__x86_return_thunk:
>>> +       call L2
>>> +L1:
>>> +       pause
>>> +       lfence
>>> +       jmp L1
>>> +L2:
>>> +       lea 8(%rsp), %rsp|lea 4(%esp), %esp
>>> +       ret
>>> +
>>> +and function return becomes
>>> +
>>> +       jmp __x86_return_thunk
>>> +
>>> +-mindirect-branch=3D tests are updated with -mfunction-return=3Dkeep t=
o
>>> +avoid false test failures when -mfunction-return=3Dthunk is added to
>>> +RUNTESTFLAGS for "make check".
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/i386-protos.h (ix86_output_function_return): New.
>>> +       * config/i386/i386.c (ix86_set_indirect_branch_type): Also
>>> +       set function_return_type.
>>> +       (indirect_thunk_name): Add ret_p to indicate thunk for function
>>> +       return.
>>> +       (output_indirect_thunk_function): Pass false to
>>> +       indirect_thunk_name.
>>> +       (ix86_output_indirect_branch_via_reg): Likewise.
>>> +       (ix86_output_indirect_branch_via_push): Likewise.
>>> +       (output_indirect_thunk_function): Create alias for function
>>> +       return thunk if regno < 0.
>>> +       (ix86_output_function_return): New function.
>>> +       (ix86_handle_fndecl_attribute): Handle function_return.
>>> +       (ix86_attribute_table): Add function_return.
>>> +       * config/i386/i386.h (machine_function): Add
>>> +       function_return_type.
>>> +       * config/i386/i386.md (simple_return_internal): Use
>>> +       ix86_output_function_return.
>>> +       (simple_return_internal_long): Likewise.
>>> +       * config/i386/i386.opt (mfunction-return=3D): New option.
>>> +       (indirect_branch): Mention -mfunction-return=3D.
>>> +       * doc/extend.texi: Document function_return function attribute.
>>> +       * doc/invoke.texi: Document -mfunction-return=3D option.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * gcc.target/i386/indirect-thunk-1.c (dg-options): Add
>>> +       -mfunction-return=3Dkeep.
>>> +       * gcc.target/i386/indirect-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-8.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-1.c: New test.
>>> +       * gcc.target/i386/ret-thunk-10.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-11.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-12.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-13.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-14.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-15.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-16.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-5.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-6.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-8.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-9.c: Likewise.
>>> +
>>> +i386: Don't use ASM_OUTPUT_DEF for TARGET_MACHO
>>> +
>>> +ASM_OUTPUT_DEF isn't defined for TARGET_MACHO.  Use ASM_OUTPUT_LABEL t=
o
>>> +generate the __x86_return_thunk label, instead of the set directive.
>>> +Update testcase to remove the __x86_return_thunk label check.  Since
>>> +-fno-pic is ignored on Darwin, update testcases to sscan or "push"
>>> +only on Linux.
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       PR target/83839
>>> +       * config/i386/i386.c (output_indirect_thunk_function): Use
>>> +       ASM_OUTPUT_LABEL, instead of ASM_OUTPUT_DEF, for TARGET_MACHO
>>> +       for  __x86.return_thunk.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       PR target/83839
>>> +       * gcc.target/i386/indirect-thunk-1.c: Scan for "push" only on
>>> +       Linux.
>>> +       * gcc.target/i386/indirect-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-register-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-register-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-register-4.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-10.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-11.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-12.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-13.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-14.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-15.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-9.c: Don't check the
>>> +       __x86_return_thunk label.
>>> +       Scan for "push" only for Linux.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386-protos.h                      |   1 +
>>> + gcc/config/i386/i386.c                             | 152
>>> +++++++++++++++++++--
>>> + gcc/config/i386/i386.h                             |   3 +
>>> + gcc/config/i386/i386.md                            |   9 +-
>>> + gcc/config/i386/i386.opt                           |   6 +-
>>> + gcc/doc/extend.texi                                |   9 ++
>>> + gcc/doc/invoke.texi                                |  14 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |   4 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |   4 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |   4 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |   4 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |   2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |   2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-1.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-2.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-3.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-4.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-5.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-6.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-7.c        |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-8.c        |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-1.c         |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-2.c         |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-3.c         |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-4.c         |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-1.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-2.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-3.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-4.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-5.c      |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-6.c      |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-7.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-1.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-2.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-3.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-4.c      |   4 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-5.c      |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-6.c      |   2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-7.c      |   4 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-1.c        |  13 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  23 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  23 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  22 +++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  22 +++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  22 +++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  22 +++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-16.c       |  18 +++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-2.c        |  13 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-3.c        |  12 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-4.c        |  12 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-5.c        |  15 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-6.c        |  14 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-7.c        |  13 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-8.c        |  14 ++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-9.c        |  24 ++++
>>> + 56 files changed, 516 insertions(+), 74 deletions(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-16.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-3.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-4.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-5.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-6.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-7.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-8.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +
>>> +diff --git a/gcc/config/i386/i386-protos.h
>>> b/gcc/config/i386/i386-protos.h
>>> +index eca4cbf..620d70e 100644
>>> +--- a/gcc/config/i386/i386-protos.h
>>> ++++ b/gcc/config/i386/i386-protos.h
>>> +@@ -312,6 +312,7 @@ extern enum attr_cpu ix86_schedule;
>>> +
>>> + extern const char * ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op);
>>> + extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p=
);
>>> ++extern const char * ix86_output_function_return (bool long_p);
>>> + extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool
>>> load,
>>> +                                               enum machine_mode mode)=
;
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 0b9fc4d..34e26a3 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -6390,6 +6390,31 @@ ix86_set_indirect_branch_type (tree fndecl)
>>> +       else
>>> +       cfun->machine->indirect_branch_type =3D ix86_indirect_branch;
>>> +     }
>>> ++
>>> ++  if (cfun->machine->function_return_type =3D=3D indirect_branch_unse=
t)
>>> ++    {
>>> ++      tree attr =3D lookup_attribute ("function_return",
>>> ++                                  DECL_ATTRIBUTES (fndecl));
>>> ++      if (attr !=3D NULL)
>>> ++      {
>>> ++        tree args =3D TREE_VALUE (attr);
>>> ++        if (args =3D=3D NULL)
>>> ++          gcc_unreachable ();
>>> ++        tree cst =3D TREE_VALUE (args);
>>> ++        if (strcmp (TREE_STRING_POINTER (cst), "keep") =3D=3D 0)
>>> ++          cfun->machine->function_return_type =3D indirect_branch_kee=
p;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk") =3D=3D 0=
)
>>> ++          cfun->machine->function_return_type =3D indirect_branch_thu=
nk;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk-inline") =
=3D=3D
>>> 0)
>>> ++          cfun->machine->function_return_type =3D
>>> indirect_branch_thunk_inline;
>>> ++        else if (strcmp (TREE_STRING_POINTER (cst), "thunk-extern") =
=3D=3D
>>> 0)
>>> ++          cfun->machine->function_return_type =3D
>>> indirect_branch_thunk_extern;
>>> ++        else
>>> ++          gcc_unreachable ();
>>> ++      }
>>> ++      else
>>> ++      cfun->machine->function_return_type =3D ix86_function_return;
>>> ++    }
>>> + }
>>> +
>>> + /* Establish appropriate back-end context for processing the function
>>> +@@ -11036,8 +11061,12 @@ static int indirect_thunks_bnd_used;
>>> + /* Fills in the label name that should be used for the indirect
>>> thunk.  */
>>> +
>>> + static void
>>> +-indirect_thunk_name (char name[32], int regno, bool need_bnd_p)
>>> ++indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
>>> ++                   bool ret_p)
>>> + {
>>> ++  if (regno >=3D 0 && ret_p)
>>> ++    gcc_unreachable ();
>>> ++
>>> +   if (USE_HIDDEN_LINKONCE)
>>> +     {
>>> +       const char *bnd =3D need_bnd_p ? "_bnd" : "";
>>> +@@ -11052,7 +11081,10 @@ indirect_thunk_name (char name[32], int regno=
,
>>> bool need_bnd_p)
>>> +                  bnd, reg_prefix, reg_names[regno]);
>>> +       }
>>> +       else
>>> +-      sprintf (name, "__x86_indirect_thunk%s", bnd);
>>> ++      {
>>> ++        const char *ret =3D ret_p ? "return" : "indirect";
>>> ++        sprintf (name, "__x86_%s_thunk%s", ret, bnd);
>>> ++      }
>>> +     }
>>> +   else
>>> +     {
>>> +@@ -11065,10 +11097,20 @@ indirect_thunk_name (char name[32], int
>>> regno, bool need_bnd_p)
>>> +       }
>>> +       else
>>> +       {
>>> +-        if (need_bnd_p)
>>> +-          ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
>>> ++        if (ret_p)
>>> ++          {
>>> ++            if (need_bnd_p)
>>> ++              ASM_GENERATE_INTERNAL_LABEL (name, "LRTB", 0);
>>> ++            else
>>> ++              ASM_GENERATE_INTERNAL_LABEL (name, "LRT", 0);
>>> ++          }
>>> +         else
>>> +-          ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
>>> ++          {
>>> ++            if (need_bnd_p)
>>> ++              ASM_GENERATE_INTERNAL_LABEL (name, "LITB", 0);
>>> ++            else
>>> ++              ASM_GENERATE_INTERNAL_LABEL (name, "LIT", 0);
>>> ++          }
>>> +       }
>>> +     }
>>> + }
>>> +@@ -11163,7 +11205,7 @@ output_indirect_thunk_function (bool
>>> need_bnd_p, int regno)
>>> +   tree decl;
>>> +
>>> +   /* Create __x86_indirect_thunk/__x86_indirect_thunk_bnd.  */
>>> +-  indirect_thunk_name (name, regno, need_bnd_p);
>>> ++  indirect_thunk_name (name, regno, need_bnd_p, false);
>>> +   decl =3D build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
>>> +                    get_identifier (name),
>>> +                    build_function_type_list (void_type_node,
>>> NULL_TREE));
>>> +@@ -11206,6 +11248,36 @@ output_indirect_thunk_function (bool
>>> need_bnd_p, int regno)
>>> +       ASM_OUTPUT_LABEL (asm_out_file, name);
>>> +       }
>>> +
>>> ++  if (regno < 0)
>>> ++    {
>>> ++      /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.
>>> */
>>> ++      char alias[32];
>>> ++
>>> ++      indirect_thunk_name (alias, regno, need_bnd_p, true);
>>> ++#if TARGET_MACHO
>>> ++      if (TARGET_MACHO)
>>> ++      {
>>> ++        fputs ("\t.weak_definition\t", asm_out_file);
>>> ++        assemble_name (asm_out_file, alias);
>>> ++        fputs ("\n\t.private_extern\t", asm_out_file);
>>> ++        assemble_name (asm_out_file, alias);
>>> ++        putc ('\n', asm_out_file);
>>> ++        ASM_OUTPUT_LABEL (asm_out_file, alias);
>>> ++      }
>>> ++#else
>>> ++      ASM_OUTPUT_DEF (asm_out_file, alias, name);
>>> ++      if (USE_HIDDEN_LINKONCE)
>>> ++      {
>>> ++        fputs ("\t.globl\t", asm_out_file);
>>> ++        assemble_name (asm_out_file, alias);
>>> ++        putc ('\n', asm_out_file);
>>> ++        fputs ("\t.hidden\t", asm_out_file);
>>> ++        assemble_name (asm_out_file, alias);
>>> ++        putc ('\n', asm_out_file);
>>> ++      }
>>> ++#endif
>>> ++    }
>>> ++
>>> +   DECL_INITIAL (decl) =3D make_node (BLOCK);
>>> +   current_function_decl =3D decl;
>>> +   allocate_struct_function (decl, false);
>>> +@@ -27687,7 +27759,7 @@ ix86_output_indirect_branch_via_reg (rtx
>>> call_op, bool sibcall_p)
>>> +         else
>>> +           indirect_thunks_used |=3D 1 << i;
>>> +       }
>>> +-      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
>>> ++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p, false);
>>> +       thunk_name =3D thunk_name_buf;
>>> +     }
>>> +   else
>>> +@@ -27796,7 +27868,7 @@ ix86_output_indirect_branch_via_push (rtx
>>> call_op, const char *xasm,
>>> +         else
>>> +           indirect_thunk_needed =3D true;
>>> +       }
>>> +-      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p);
>>> ++      indirect_thunk_name (thunk_name_buf, regno, need_bnd_p, false);
>>> +       thunk_name =3D thunk_name_buf;
>>> +     }
>>> +   else
>>> +@@ -27931,6 +28003,46 @@ ix86_output_indirect_jmp (rtx call_op, bool
>>> ret_p)
>>> +     return "%!jmp\t%A0";
>>> + }
>>> +
>>> ++/* Output function return.  CALL_OP is the jump target.  Add a REP
>>> ++   prefix to RET if LONG_P is true and function return is kept.  */
>>> ++
>>> ++const char *
>>> ++ix86_output_function_return (bool long_p)
>>> ++{
>>> ++  if (cfun->machine->function_return_type !=3D indirect_branch_keep)
>>> ++    {
>>> ++      char thunk_name[32];
>>> ++      bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_in=
sn);
>>> ++
>>> ++      if (cfun->machine->function_return_type
>>> ++        !=3D indirect_branch_thunk_inline)
>>> ++      {
>>> ++        bool need_thunk =3D (cfun->machine->function_return_type
>>> ++                           =3D=3D indirect_branch_thunk);
>>> ++        indirect_thunk_name (thunk_name, -1, need_bnd_p, true);
>>> ++        if (need_bnd_p)
>>> ++          {
>>> ++            indirect_thunk_bnd_needed |=3D need_thunk;
>>> ++            fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++          }
>>> ++        else
>>> ++          {
>>> ++            indirect_thunk_needed |=3D need_thunk;
>>> ++            fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++          }
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, -1);
>>> ++
>>> ++      return "";
>>> ++    }
>>> ++
>>> ++  if (!long_p || ix86_bnd_prefixed_insn_p (current_output_insn))
>>> ++    return "%!ret";
>>> ++
>>> ++  return "rep%; ret";
>>> ++}
>>> ++
>>> + /* Output the assembly for a call instruction.  */
>>> +
>>> + const char *
>>> +@@ -45461,6 +45573,28 @@ ix86_handle_fndecl_attribute (tree *node, tre=
e
>>> name, tree args, int,
>>> +       }
>>> +     }
>>> +
>>> ++  if (is_attribute_p ("function_return", name))
>>> ++    {
>>> ++      tree cst =3D TREE_VALUE (args);
>>> ++      if (TREE_CODE (cst) !=3D STRING_CST)
>>> ++      {
>>> ++        warning (OPT_Wattributes,
>>> ++                 "%qE attribute requires a string constant argument",
>>> ++                 name);
>>> ++        *no_add_attrs =3D true;
>>> ++      }
>>> ++      else if (strcmp (TREE_STRING_POINTER (cst), "keep") !=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk") !=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk-inline") !=
=3D 0
>>> ++             && strcmp (TREE_STRING_POINTER (cst), "thunk-extern") !=
=3D
>>> 0)
>>> ++      {
>>> ++        warning (OPT_Wattributes,
>>> ++                 "argument to %qE attribute is not "
>>> ++                 "(keep|thunk|thunk-inline|thunk-extern)", name);
>>> ++        *no_add_attrs =3D true;
>>> ++      }
>>> ++    }
>>> ++
>>> +   return NULL_TREE;
>>> + }
>>> +
>>> +@@ -49690,6 +49824,8 @@ static const struct attribute_spec
>>> ix86_attribute_table[] =3D
>>> +     ix86_handle_callee_pop_aggregate_return, true },
>>> +   { "indirect_branch", 1, 1, true, false, false,
>>> +     ix86_handle_fndecl_attribute, false },
>>> ++  { "function_return", 1, 1, true, false, false,
>>> ++    ix86_handle_fndecl_attribute, false },
>>> +
>>> +   /* End element.  */
>>> +   { NULL,        0, 0, false, false, false, NULL, false }
>>> +diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
>>> +index 9dccdb0..b34bc11 100644
>>> +--- a/gcc/config/i386/i386.h
>>> ++++ b/gcc/config/i386/i386.h
>>> +@@ -2579,6 +2579,9 @@ struct GTY(()) machine_function {
>>> +      "indirect_jump" or "tablejump".  */
>>> +   BOOL_BITFIELD has_local_indirect_jump : 1;
>>> +
>>> ++  /* How to generate function return.  */
>>> ++  ENUM_BITFIELD(indirect_branch) function_return_type : 3;
>>> ++
>>> +   /* If true, there is register available for argument passing.  This
>>> +      is used only in ix86_function_ok_for_sibcall by 32-bit to
>>> determine
>>> +      if there is scratch register available for indirect sibcall.  In
>>> +diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
>>> +index 153e162..2da671e 100644
>>> +--- a/gcc/config/i386/i386.md
>>> ++++ b/gcc/config/i386/i386.md
>>> +@@ -12489,7 +12489,7 @@
>>> + (define_insn "simple_return_internal"
>>> +   [(simple_return)]
>>> +   "reload_completed"
>>> +-  "%!ret"
>>> ++  "* return ix86_output_function_return (false);"
>>> +   [(set_attr "length" "1")
>>> +    (set_attr "atom_unit" "jeu")
>>> +    (set_attr "length_immediate" "0")
>>> +@@ -12503,12 +12503,7 @@
>>> +   [(simple_return)
>>> +    (unspec [(const_int 0)] UNSPEC_REP)]
>>> +   "reload_completed"
>>> +-{
>>> +-  if (ix86_bnd_prefixed_insn_p (insn))
>>> +-    return "%!ret";
>>> +-
>>> +-  return "rep%; ret";
>>> +-}
>>> ++  "* return ix86_output_function_return (true);"
>>> +   [(set_attr "length" "2")
>>> +    (set_attr "atom_unit" "jeu")
>>> +    (set_attr "length_immediate" "0")
>>> +diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
>>> +index 5ffa334..ad5916f 100644
>>> +--- a/gcc/config/i386/i386.opt
>>> ++++ b/gcc/config/i386/i386.opt
>>> +@@ -902,9 +902,13 @@ mindirect-branch=3D
>>> + Target Report RejectNegative Joined Enum(indirect_branch)
>>> Var(ix86_indirect_branch) Init(indirect_branch_keep)
>>> + Convert indirect call and jump to call and return thunks.
>>> +
>>> ++mfunction-return=3D
>>> ++Target Report RejectNegative Joined Enum(indirect_branch)
>>> Var(ix86_function_return) Init(indirect_branch_keep)
>>> ++Convert function return to call and return thunk.
>>> ++
>>> + Enum
>>> + Name(indirect_branch) Type(enum indirect_branch)
>>> +-Known indirect branch choices (for use with the -mindirect-branch=3D
>>> option):
>>> ++Known indirect branch choices (for use with the
>>> -mindirect-branch=3D/-mfunction-return=3D options):
>>> +
>>> + EnumValue
>>> + Enum(indirect_branch) String(keep) Value(indirect_branch_keep)
>>> +diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
>>> +index 8668dae..2cb6bd1 100644
>>> +--- a/gcc/doc/extend.texi
>>> ++++ b/gcc/doc/extend.texi
>>> +@@ -5429,6 +5429,15 @@ call and jump to call and return thunk.
>>> @samp{thunk-inline} converts
>>> + indirect call and jump to inlined call and return thunk.
>>> + @samp{thunk-extern} converts indirect call and jump to external call
>>> + and return thunk provided in a separate object file.
>>> ++
>>> ++@item function_return("@var{choice}")
>>> ++@cindex @code{function_return} function attribute, x86
>>> ++On x86 targets, the @code{function_return} attribute causes the
>>> compiler
>>> ++to convert function return with @var{choice}.  @samp{keep} keeps
>>> function
>>> ++return unmodified.  @samp{thunk} converts function return to call and
>>> ++return thunk.  @samp{thunk-inline} converts function return to inline=
d
>>> ++call and return thunk.  @samp{thunk-extern} converts function return =
to
>>> ++external call and return thunk provided in a separate object file.
>>> + @end table
>>> +
>>> + On the x86, the inliner does not inline a
>>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
>>> +index ff9a194..fa63dc5 100644
>>> +--- a/gcc/doc/invoke.texi
>>> ++++ b/gcc/doc/invoke.texi
>>> +@@ -1169,7 +1169,8 @@ See RS/6000 and PowerPC Options.
>>> + -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol
>>> + -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
>>> + -malign-data=3D@var{type} -mstack-protector-guard=3D@var{guard} @gol
>>> +--mmitigate-rop -mindirect-branch=3D@var{choice}}
>>> ++-mmitigate-rop -mindirect-branch=3D@var{choice} @gol
>>> ++-mfunction-return=3D@var{choice}}
>>> +
>>> + @emph{x86 Windows Options}
>>> + @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
>>> +@@ -24229,6 +24230,17 @@ to external call and return thunk provided in
>>> a separate object file.
>>> + You can control this behavior for a specific function by using the
>>> + function attribute @code{indirect_branch}.  @xref{Function Attributes=
}.
>>> +
>>> ++@item -mfunction-return=3D@var{choice}
>>> ++@opindex -mfunction-return
>>> ++Convert function return with @var{choice}.  The default is @samp{keep=
},
>>> ++which keeps function return unmodified.  @samp{thunk} converts functi=
on
>>> ++return to call and return thunk.  @samp{thunk-inline} converts functi=
on
>>> ++return to inlined call and return thunk.  @samp{thunk-extern} convert=
s
>>> ++function return to external call and return thunk provided in a
>>> separate
>>> ++object file.  You can control this behavior for a specific function b=
y
>>> ++using the function attribute @code{function_return}.
>>> ++@xref{Function Attributes}.
>>> ++
>>> + @end table
>>> +
>>> + These @samp{-m} switches are supported in addition to the above
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +index d983e1c..e365ef5 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +index 58f09b4..05a51ad 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +index f20d35c..3c0d4c3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +index 0eff8fb..14d4ef6 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +index a25b20d..b4836c3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +index cff114a..1f06bd1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +index afdb600..bc6b47a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +@@ -35,7 +35,7 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +index d64d978..2257be3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +index 9306745..e9cfdc5 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +index 97744d6..f938db0 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +index bfce3ea..4e58599 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -13,7 +13,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +index 0833606..b8d5024 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -14,7 +14,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +index 2eba0fb..455adab 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -13,7 +13,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +index f58427e..4595b84 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +@@ -36,7 +36,7 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> +index 564ed39..d730d31 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-8.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +index 50fbee2..5e3e118 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { ! x32 } } } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fno-pic" } */
>>> +
>>> + void (*dispatch) (char *);
>>> + char buf[10];
>>> +@@ -10,7 +10,7 @@ foo (void)
>>> +   dispatch (buf);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> + /* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +index 2976e67..2801aa4 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { ! x32 } } } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fno-pic" } */
>>> +
>>> + void (*dispatch) (char *);
>>> + char buf[10];
>>> +@@ -11,7 +11,7 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> + /* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> + /* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +index da4bc98..70b4fb3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fpic -fno-plt" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
>>> +
>>> + void bar (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +index c64d12e..3baf03e 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fpic -fno-plt" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
>>> +
>>> + void bar (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +index 49f27b4..edeb264 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +index a1e3eb6..1d00413 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +index 395634e..06ebf1c 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +index fd3f633..1c8f944 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +index ba2f92b..21740ac 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern"=
 }
>>> */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-extern" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +index 0c5a2d4..a77c1f4 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern"=
 }
>>> */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-extern" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +index 6652523..86e9fd1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +@@ -35,7 +35,7 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +index 68c0ff7..3ecde87 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +index e2da1fc..df32a19 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +index 244fec7..9540996 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +index 107ebe3..f3db6e2 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +index 17b04ef..0f687c3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline"=
 }
>>> */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-inline" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +index d9eb112..b27c6fc 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline"=
 }
>>> */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-inline" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +index d02b1dc..764a375 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +@@ -35,7 +35,7 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-1.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-1.c
>>> +new file mode 100644
>>> +index 0000000..7223f67
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-1.c
>>> +@@ -0,0 +1,13 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk" } */
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +new file mode 100644
>>> +index 0000000..3a6727b
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +@@ -0,0 +1,23 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-inline
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +new file mode 100644
>>> +index 0000000..b8f6818
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +@@ -0,0 +1,23 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-extern
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +new file mode 100644
>>> +index 0000000..01b0a02
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +new file mode 100644
>>> +index 0000000..4b497b5
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++extern int foo (void) __attribute__ ((function_return("thunk")));
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 3 } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 3 } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_indirect_thunk" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler-not "call\[
>>> \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +new file mode 100644
>>> +index 0000000..4ae4c44
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++__attribute__ ((function_return("thunk-inline")))
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +new file mode 100644
>>> +index 0000000..5b5bc76
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dkee=
p
>>> -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++__attribute__ ((function_return("thunk-extern"),
>>> indirect_branch("thunk")))
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-16.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-16.c
>>> +new file mode 100644
>>> +index 0000000..a16cad1
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-16.c
>>> +@@ -0,0 +1,18 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-inline
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++__attribute__ ((function_return("keep"), indirect_branch("keep")))
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-2.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-2.c
>>> +new file mode 100644
>>> +index 0000000..c6659e3
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-2.c
>>> +@@ -0,0 +1,13 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-inline" } */
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-3.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-3.c
>>> +new file mode 100644
>>> +index 0000000..0f7f388
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-3.c
>>> +@@ -0,0 +1,12 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-extern" } */
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-4.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-4.c
>>> +new file mode 100644
>>> +index 0000000..9ae37e8
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-4.c
>>> +@@ -0,0 +1,12 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep" } */
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-5.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-5.c
>>> +new file mode 100644
>>> +index 0000000..4bd0d2a
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-5.c
>>> +@@ -0,0 +1,15 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep" } */
>>> ++
>>> ++extern void foo (void) __attribute__ ((function_return("thunk")));
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-6.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-6.c
>>> +new file mode 100644
>>> +index 0000000..053841f
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-6.c
>>> +@@ -0,0 +1,14 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep" } */
>>> ++
>>> ++__attribute__ ((function_return("thunk-inline")))
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-7.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-7.c
>>> +new file mode 100644
>>> +index 0000000..262e678
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-7.c
>>> +@@ -0,0 +1,13 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep" } */
>>> ++
>>> ++__attribute__ ((function_return("thunk-extern")))
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-8.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-8.c
>>> +new file mode 100644
>>> +index 0000000..c1658e9
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-8.c
>>> +@@ -0,0 +1,14 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-inline" } */
>>> ++
>>> ++extern void foo (void) __attribute__ ((function_return("keep")));
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +new file mode 100644
>>> +index 0000000..fa24a1f
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +@@ -0,0 +1,24 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dth=
unk
>>> -fno-pic" } */
>>> ++
>>> ++extern void (*bar) (void);
>>> ++
>>> ++int
>>> ++foo (void)
>>> ++{
>>> ++  bar ();
>>> ++  return 0;
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk:" } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } }
>>> } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } =
}
>>> } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } }
>>> } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } } } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar=
_fix.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0006-uclibc-locale-wchar_fix.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0006-uclibc-locale-wchar_=
f
>>> ix.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0006-uclibc-locale-wchar_f
>>> ix.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0006-x86-Add-mindirect-b=
ranch-register.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0006-x86-Add-mindirect-b
>>> ranch-register.patch
>>> new file mode 100644
>>> index 0000000..50921aa
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0006-x86-Add-mindirect-b
>>> ranch-register.patch
>>> @@ -0,0 +1,943 @@
>>> +From 3f1c39fb543884d36e759a6dc196a8e914eb4f73 Mon Sep 17 00:00:00 2001
>>> +From: "H.J. Lu" <hjl.tools@gmail.com>
>>> +Date: Sat, 6 Jan 2018 22:29:56 -0800
>>> +Subject: [PATCH 06/12] x86: Add -mindirect-branch-register
>>> +
>>> +Add -mindirect-branch-register to force indirect branch via register.
>>> +This is implemented by disabling patterns of indirect branch via memor=
y,
>>> +similar to TARGET_X32.
>>> +
>>> +-mindirect-branch=3D and -mfunction-return=3D tests are updated with
>>> +-mno-indirect-branch-register to avoid false test failures when
>>> +-mindirect-branch-register is added to RUNTESTFLAGS for "make check".
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/constraints.md (Bs): Disallow memory operand for
>>> +       -mindirect-branch-register.
>>> +       (Bw): Likewise.
>>> +       * config/i386/predicates.md (indirect_branch_operand): Likewise=
.
>>> +       (GOT_memory_operand): Likewise.
>>> +       (call_insn_operand): Likewise.
>>> +       (sibcall_insn_operand): Likewise.
>>> +       (GOT32_symbol_operand): Likewise.
>>> +       * config/i386/i386.md (indirect_jump): Call
>>> convert_memory_address
>>> +       for -mindirect-branch-register.
>>> +       (tablejump): Likewise.
>>> +       (*sibcall_memory): Likewise.
>>> +       (*sibcall_value_memory): Likewise.
>>> +       Disallow peepholes of indirect call and jump via memory for
>>> +       -mindirect-branch-register.
>>> +       (*call_pop): Replace m with Bw.
>>> +       (*call_value_pop): Likewise.
>>> +       (*sibcall_pop_memory): Replace m with Bs.
>>> +       * config/i386/i386.opt (mindirect-branch-register): New option.
>>> +       * doc/invoke.texi: Document -mindirect-branch-register option.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * gcc.target/i386/indirect-thunk-1.c (dg-options): Add
>>> +       -mno-indirect-branch-register.
>>> +       * gcc.target/i386/indirect-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-10.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-11.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-12.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-13.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-14.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-15.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-9.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-register-1.c: New test.
>>> +       * gcc.target/i386/indirect-thunk-register-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-register-3.c: Likewise.
>>> +
>>> +i386: Rename to ix86_indirect_branch_register
>>> +
>>> +Rename the variable for -mindirect-branch-register to
>>> +ix86_indirect_branch_register to match the command-line option name.
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/constraints.md (Bs): Replace
>>> +       ix86_indirect_branch_thunk_register with
>>> +       ix86_indirect_branch_register.
>>> +       (Bw): Likewise.
>>> +       * config/i386/i386.md (indirect_jump): Likewise.
>>> +       (tablejump): Likewise.
>>> +       (*sibcall_memory): Likewise.
>>> +       (*sibcall_value_memory): Likewise.
>>> +       Peepholes of indirect call and jump via memory: Likewise.
>>> +       * config/i386/i386.opt: Likewise.
>>> +       * config/i386/predicates.md (indirect_branch_operand): Likewise=
.
>>> +       (GOT_memory_operand): Likewise.
>>> +       (call_insn_operand): Likewise.
>>> +       (sibcall_insn_operand): Likewise.
>>> +       (GOT32_symbol_operand): Likewise.
>>> +
>>> +x86: Rewrite ix86_indirect_branch_register logic
>>> +
>>> +Rewrite ix86_indirect_branch_register logic with
>>> +
>>> +(and (not (match_test "ix86_indirect_branch_register"))
>>> +     (original condition before r256662))
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/predicates.md (constant_call_address_operand):
>>> +       Rewrite ix86_indirect_branch_register logic.
>>> +       (sibcall_insn_operand): Likewise.
>>> +
>>> +Don't check ix86_indirect_branch_register for GOT operand
>>> +
>>> +Since GOT_memory_operand and GOT32_symbol_operand are simple pattern
>>> +matches, don't check ix86_indirect_branch_register here.  If needed,
>>> +-mindirect-branch=3D will convert indirect branch via GOT slot to a ca=
ll
>>> +and return thunk.
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/constraints.md (Bs): Update
>>> +       ix86_indirect_branch_register check.  Don't check
>>> +       ix86_indirect_branch_register with GOT_memory_operand.
>>> +       (Bw): Likewise.
>>> +       * config/i386/predicates.md (GOT_memory_operand): Don't check
>>> +       ix86_indirect_branch_register here.
>>> +       (GOT32_symbol_operand): Likewise.
>>> +
>>> +i386: Rewrite indirect_branch_operand logic
>>> +
>>> +       Backport from mainline
>>> +       2018-01-15  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/predicates.md (indirect_branch_operand): Rewrite
>>> +       ix86_indirect_branch_register logic.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/constraints.md                     |  6 ++--
>>> + gcc/config/i386/i386.md                            | 34
>>> ++++++++++++++--------
>>> + gcc/config/i386/i386.opt                           |  4 +++
>>> + gcc/config/i386/predicates.md                      | 21 +++++++------
>>> + gcc/doc/invoke.texi                                |  6 +++-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   |  2 +-
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-1.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-2.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-3.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-4.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-5.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-6.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-attr-7.c        |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-1.c         |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-2.c         |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-3.c         |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-bnd-4.c         |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-1.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-2.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-3.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-4.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-5.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-6.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-extern-7.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-1.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-2.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-3.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-4.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-5.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-6.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-7.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-register-1.c    | 22 +++++++++++++=
+
>>> + .../gcc.target/i386/indirect-thunk-register-2.c    | 20 +++++++++++++
>>> + .../gcc.target/i386/indirect-thunk-register-3.c    | 19 ++++++++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  2 +-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-9.c        |  2 +-
>>> + 47 files changed, 147 insertions(+), 63 deletions(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-register-1.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-register-2.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-register-3.c
>>> +
>>> +diff --git a/gcc/config/i386/constraints.md b/gcc/config/i386/
>>> constraints.md
>>> +index 1a4c701..9204c8e 100644
>>> +--- a/gcc/config/i386/constraints.md
>>> ++++ b/gcc/config/i386/constraints.md
>>> +@@ -172,14 +172,16 @@
>>> +
>>> + (define_constraint "Bs"
>>> +   "@internal Sibcall memory operand."
>>> +-  (ior (and (not (match_test "TARGET_X32"))
>>> ++  (ior (and (not (match_test "ix86_indirect_branch_register"))
>>> ++          (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "sibcall_memory_operand"))
>>> +        (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +           (match_operand 0 "GOT_memory_operand"))))
>>> +
>>> + (define_constraint "Bw"
>>> +   "@internal Call memory operand."
>>> +-  (ior (and (not (match_test "TARGET_X32"))
>>> ++  (ior (and (not (match_test "ix86_indirect_branch_register"))
>>> ++          (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "memory_operand"))
>>> +        (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +           (match_operand 0 "GOT_memory_operand"))))
>>> +diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
>>> +index 2da671e..05a88ff 100644
>>> +--- a/gcc/config/i386/i386.md
>>> ++++ b/gcc/config/i386/i386.md
>>> +@@ -11805,7 +11805,7 @@
>>> +   [(set (pc) (match_operand 0 "indirect_branch_operand"))]
>>> +   ""
>>> + {
>>> +-  if (TARGET_X32)
>>> ++  if (TARGET_X32 || ix86_indirect_branch_register)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> +   cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +@@ -11859,7 +11859,7 @@
>>> +                                        OPTAB_DIRECT);
>>> +     }
>>> +
>>> +-  if (TARGET_X32)
>>> ++  if (TARGET_X32 || ix86_indirect_branch_register)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> +   cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +@@ -12048,7 +12048,7 @@
>>> +   [(call (mem:QI (match_operand:W 0 "memory_operand" "m"))
>>> +        (match_operand 1))
>>> +    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
>>> +-  "!TARGET_X32"
>>> ++  "!TARGET_X32 && !ix86_indirect_branch_register"
>>> +   "* return ix86_output_call_insn (insn, operands[0]);"
>>> +   [(set_attr "type" "call")])
>>> +
>>> +@@ -12057,7 +12057,9 @@
>>> +       (match_operand:W 1 "memory_operand"))
>>> +    (call (mem:QI (match_dup 0))
>>> +        (match_operand 3))]
>>> +-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
>>> ++  "!TARGET_X32
>>> ++   && !ix86_indirect_branch_register
>>> ++   && SIBLING_CALL_P (peep2_next_insn (1))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))=
"
>>> +   [(parallel [(call (mem:QI (match_dup 1))
>>> +@@ -12070,7 +12072,9 @@
>>> +    (unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
>>> +    (call (mem:QI (match_dup 0))
>>> +        (match_operand 3))]
>>> +-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
>>> ++  "!TARGET_X32
>>> ++   && !ix86_indirect_branch_register
>>> ++   && SIBLING_CALL_P (peep2_next_insn (2))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))=
"
>>> +   [(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
>>> +@@ -12092,7 +12096,7 @@
>>> + })
>>> +
>>> + (define_insn "*call_pop"
>>> +-  [(call (mem:QI (match_operand:SI 0 "call_insn_operand" "lmBz"))
>>> ++  [(call (mem:QI (match_operand:SI 0 "call_insn_operand" "lBwBz"))
>>> +        (match_operand 1))
>>> +    (set (reg:SI SP_REG)
>>> +       (plus:SI (reg:SI SP_REG)
>>> +@@ -12112,7 +12116,7 @@
>>> +   [(set_attr "type" "call")])
>>> +
>>> + (define_insn "*sibcall_pop_memory"
>>> +-  [(call (mem:QI (match_operand:SI 0 "memory_operand" "m"))
>>> ++  [(call (mem:QI (match_operand:SI 0 "memory_operand" "Bs"))
>>> +        (match_operand 1))
>>> +    (set (reg:SI SP_REG)
>>> +       (plus:SI (reg:SI SP_REG)
>>> +@@ -12166,7 +12170,9 @@
>>> +   [(set (match_operand:W 0 "register_operand")
>>> +         (match_operand:W 1 "memory_operand"))
>>> +    (set (pc) (match_dup 0))]
>>> +-  "!TARGET_X32 && peep2_reg_dead_p (2, operands[0])"
>>> ++  "!TARGET_X32
>>> ++   && !ix86_indirect_branch_register
>>> ++   && peep2_reg_dead_p (2, operands[0])"
>>> +   [(set (pc) (match_dup 1))])
>>> +
>>> + ;; Call subroutine, returning value in operand 0
>>> +@@ -12244,7 +12250,7 @@
>>> +       (call (mem:QI (match_operand:W 1 "memory_operand" "m"))
>>> +             (match_operand 2)))
>>> +    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
>>> +-  "!TARGET_X32"
>>> ++  "!TARGET_X32 && !ix86_indirect_branch_register"
>>> +   "* return ix86_output_call_insn (insn, operands[1]);"
>>> +   [(set_attr "type" "callv")])
>>> +
>>> +@@ -12254,7 +12260,9 @@
>>> +    (set (match_operand 2)
>>> +    (call (mem:QI (match_dup 0))
>>> +                (match_operand 3)))]
>>> +-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
>>> ++  "!TARGET_X32
>>> ++   && !ix86_indirect_branch_register
>>> ++   && SIBLING_CALL_P (peep2_next_insn (1))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))=
"
>>> +   [(parallel [(set (match_dup 2)
>>> +@@ -12269,7 +12277,9 @@
>>> +    (set (match_operand 2)
>>> +       (call (mem:QI (match_dup 0))
>>> +             (match_operand 3)))]
>>> +-  "!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
>>> ++  "!TARGET_X32
>>> ++   && !ix86_indirect_branch_register
>>> ++   && SIBLING_CALL_P (peep2_next_insn (2))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))=
"
>>> +   [(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)
>>> +@@ -12294,7 +12304,7 @@
>>> +
>>> + (define_insn "*call_value_pop"
>>> +   [(set (match_operand 0)
>>> +-      (call (mem:QI (match_operand:SI 1 "call_insn_operand" "lmBz"))
>>> ++      (call (mem:QI (match_operand:SI 1 "call_insn_operand" "lBwBz"))
>>> +             (match_operand 2)))
>>> +    (set (reg:SI SP_REG)
>>> +       (plus:SI (reg:SI SP_REG)
>>> +diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt
>>> +index ad5916f..a97f84f 100644
>>> +--- a/gcc/config/i386/i386.opt
>>> ++++ b/gcc/config/i386/i386.opt
>>> +@@ -921,3 +921,7 @@ Enum(indirect_branch) String(thunk-inline)
>>> Value(indirect_branch_thunk_inline)
>>> +
>>> + EnumValue
>>> + Enum(indirect_branch) String(thunk-extern)
>>> Value(indirect_branch_thunk_extern)
>>> ++
>>> ++mindirect-branch-register
>>> ++Target Report Var(ix86_indirect_branch_register) Init(0)
>>> ++Force indirect call and jump via register.
>>> +diff --git a/gcc/config/i386/predicates.md b/gcc/config/i386/
>>> predicates.md
>>> +index 93dda7b..d1f0a7d 100644
>>> +--- a/gcc/config/i386/predicates.md
>>> ++++ b/gcc/config/i386/predicates.md
>>> +@@ -593,7 +593,8 @@
>>> + ;; Test for a valid operand for indirect branch.
>>> + (define_predicate "indirect_branch_operand"
>>> +   (ior (match_operand 0 "register_operand")
>>> +-       (and (not (match_test "TARGET_X32"))
>>> ++       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++          (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "memory_operand"))))
>>> +
>>> + ;; Return true if OP is a memory operands that can be used in sibcall=
s.
>>> +@@ -636,20 +637,22 @@
>>> +   (ior (match_test "constant_call_address_operand
>>> +                    (op, mode =3D=3D VOIDmode ? mode : Pmode)")
>>> +        (match_operand 0 "call_register_no_elim_operand")
>>> +-       (ior (and (not (match_test "TARGET_X32"))
>>> +-               (match_operand 0 "memory_operand"))
>>> +-          (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +-               (match_operand 0 "GOT_memory_operand")))))
>>> ++       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++          (ior (and (not (match_test "TARGET_X32"))
>>> ++                    (match_operand 0 "memory_operand"))
>>> ++               (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> ++                    (match_operand 0 "GOT_memory_operand"))))))
>>> +
>>> + ;; Similarly, but for tail calls, in which we cannot allow memory
>>> references.
>>> + (define_special_predicate "sibcall_insn_operand"
>>> +   (ior (match_test "constant_call_address_operand
>>> +                    (op, mode =3D=3D VOIDmode ? mode : Pmode)")
>>> +        (match_operand 0 "register_no_elim_operand")
>>> +-       (ior (and (not (match_test "TARGET_X32"))
>>> +-               (match_operand 0 "sibcall_memory_operand"))
>>> +-          (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +-               (match_operand 0 "GOT_memory_operand")))))
>>> ++       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++          (ior (and (not (match_test "TARGET_X32"))
>>> ++                    (match_operand 0 "sibcall_memory_operand"))
>>> ++               (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> ++                    (match_operand 0 "GOT_memory_operand"))))))
>>> +
>>> + ;; Return true if OP is a 32-bit GOT symbol operand.
>>> + (define_predicate "GOT32_symbol_operand"
>>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
>>> +index fa63dc5..ad9f295 100644
>>> +--- a/gcc/doc/invoke.texi
>>> ++++ b/gcc/doc/invoke.texi
>>> +@@ -1170,7 +1170,7 @@ See RS/6000 and PowerPC Options.
>>> + -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol
>>> + -malign-data=3D@var{type} -mstack-protector-guard=3D@var{guard} @gol
>>> + -mmitigate-rop -mindirect-branch=3D@var{choice} @gol
>>> +--mfunction-return=3D@var{choice}}
>>> ++-mfunction-return=3D@var{choice} -mindirect-branch-register}
>>> +
>>> + @emph{x86 Windows Options}
>>> + @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol
>>> +@@ -24241,6 +24241,10 @@ object file.  You can control this behavior
>>> for a specific function by
>>> + using the function attribute @code{function_return}.
>>> + @xref{Function Attributes}.
>>> +
>>> ++@item -mindirect-branch-register
>>> ++@opindex -mindirect-branch-register
>>> ++Force indirect call and jump via register.
>>> ++
>>> + @end table
>>> +
>>> + These @samp{-m} switches are supported in addition to the above
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +index e365ef5..60d0988 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +index 05a51ad..aac7516 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +index 3c0d4c3..9e24a38 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +index 14d4ef6..127b5d9 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +index b4836c3..fcaa18d 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +index 1f06bd1..e464928 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk" } */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +index bc6b47a..17c2d0f 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +index 2257be3..9194ccf 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +index e9cfdc5..e51f261 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +index f938db0..4aeec18 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +index 4e58599..ac0e599 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +index b8d5024..573cf1e 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +index 455adab..b2b37fc 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +index 4595b84..4a43e19 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fno-pic" } */
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +index 5e3e118..ac84ab6 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { ! x32 } } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-boun=
ds -mmpx
>>> -fno-pic" } */
>>> +
>>> + void (*dispatch) (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +index 2801aa4..ce655e8 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { ! x32 } } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-boun=
ds -mmpx
>>> -fno-pic" } */
>>> +
>>> + void (*dispatch) (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +index 70b4fb3..d34485a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-boun=
ds -mmpx
>>> -fpic -fno-plt" } */
>>> +
>>> + void bar (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +index 3baf03e..0e19830 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target { *-*-linux* && { ! x32 } } } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fcheck-pointer-bounds -mmpx -fpic -fno-plt" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk -fcheck-pointer-bounds -mmpx -fpic -fno-plt" =
} */
>>> +
>>> + void bar (char *);
>>> + char buf[10];
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +index edeb264..579441f 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +index 1d00413..c92e6f2 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +index 06ebf1c..d9964c2 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +index 1c8f944..d4dca4d 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +index 21740ac..5c07e02 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-extern" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-exter=
n" }
>>> */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +index a77c1f4..3eb4406 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-extern" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-exter=
n" }
>>> */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +index 86e9fd1..aece938 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +index 3ecde87..3aba5e8 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +index df32a19..0f0181d 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +index 9540996..2eef6f3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +index f3db6e2..e825a10 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + typedef void (*dispatch_t)(long offset);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +index 0f687c3..c6d77e1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-inline" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-inlin=
e" }
>>> */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +index b27c6fc..6454827 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile { target *-*-linux* } } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -fpic -fno-plt
>>> -mindirect-branch=3Dthunk-inline" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-inlin=
e" }
>>> */
>>> +
>>> + extern void bar (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +index 764a375..c67066c 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + void func0 (void);
>>> + void func1 (void);
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
>>> +new file mode 100644
>>> +index 0000000..7d396a3
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-1.c
>>> +@@ -0,0 +1,22 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk
>>> -mindirect-branch-register -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "mov\[ \t\](%eax|%rax),
>>> \\((%esp|%rsp)\\)" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  }
>>> } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk\n" } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk_bnd\n" } } *=
/
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
>>> +new file mode 100644
>>> +index 0000000..e7e616b
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-2.c
>>> +@@ -0,0 +1,20 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline
>>> -mindirect-branch-register -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "mov\[ \t\](%eax|%rax),
>>> \\((%esp|%rsp)\\)" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  }
>>> } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> ++/* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
>>> +new file mode 100644
>>> +index 0000000..5320e92
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-3.c
>>> +@@ -0,0 +1,19 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern
>>> -mindirect-branch-register -fno-pic" } */
>>> ++
>>> ++typedef void (*dispatch_t)(long offset);
>>> ++
>>> ++dispatch_t dispatch;
>>> ++
>>> ++void
>>> ++male_indirect_jump (long offset)
>>> ++{
>>> ++  dispatch(offset);
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler-not "push(?:l|q)\[ \t\]*_?dispatch"  }
>>> } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> ++/* { dg-final { scan-assembler-not {\t(pause|pause|nop)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +index 3a6727b..e6fea84 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dthunk-inline
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dthunk-inline
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +index b8f6818..e239ec4 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dthunk-extern
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dthunk-extern
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +index 01b0a02..fa31813 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dthu=
nk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +index 4b497b5..fd5b41f 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-inline -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic" } *=
/
>>> +
>>> + extern void (*bar) (void);
>>> + extern int foo (void) __attribute__ ((function_return("thunk")));
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +index 4ae4c44..d606373 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep
>>> -mindirect-branch=3Dthunk-extern -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mfunction-return=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic" } *=
/
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +index 5b5bc76..75e45e2 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dkee=
p
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dkeep -mindirect-branc=
h=3Dkeep
>>> -fno-pic" } */
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +index fa24a1f..d1db41c 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +@@ -1,5 +1,5 @@
>>> + /* { dg-do compile } */
>>> +-/* { dg-options "-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dth=
unk
>>> -fno-pic" } */
>>> ++/* { dg-options "-O2 -mno-indirect-branch-register
>>> -mno-indirect-branch-register -mfunction-return=3Dthunk
>>> -mindirect-branch=3Dthunk -fno-pic" } */
>>> +
>>> + extern void (*bar) (void);
>>> +
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-updat=
e.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0007-uclibc-locale-update.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0007-uclibc-locale-update=
.
>>> patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0007-uclibc-locale-update.
>>> patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0007-x86-Add-V-register-=
operand-modifier.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0007-x86-Add-V-register-
>>> operand-modifier.patch
>>> new file mode 100644
>>> index 0000000..714b0e1
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0007-x86-Add-V-register-
>>> operand-modifier.patch
>>> @@ -0,0 +1,136 @@
>>> +From 8f0efd692eb8db06d6c00b759c872bd2170b7f7b Mon Sep 17 00:00:00 2001
>>> +From: "H.J. Lu" <hjl.tools@gmail.com>
>>> +Date: Sat, 6 Jan 2018 22:29:56 -0800
>>> +Subject: [PATCH 07/12] x86: Add 'V' register operand modifier
>>> +
>>> +Add 'V', a special modifier which prints the name of the full integer
>>> +register without '%'.  For
>>> +
>>> +extern void (*func_p) (void);
>>> +
>>> +void
>>> +foo (void)
>>> +{
>>> +  asm ("call __x86_indirect_thunk_%V0" : : "a" (func_p));
>>> +}
>>> +
>>> +it generates:
>>> +
>>> +foo:
>>> +       movq    func_p(%rip), %rax
>>> +       call    __x86_indirect_thunk_rax
>>> +       ret
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/i386.c (print_reg): Print the name of the full
>>> +       integer register without '%'.
>>> +       (ix86_print_operand): Handle 'V'.
>>> +        * doc/extend.texi: Document 'V' modifier.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * gcc.target/i386/indirect-thunk-register-4.c: New test.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c                                    | 13
>>> ++++++++++++-
>>> + gcc/doc/extend.texi                                       |  3 +++
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c | 13
>>> +++++++++++++
>>> + 3 files changed, 28 insertions(+), 1 deletion(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-register-4.c
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 34e26a3..eeca7e5 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -16869,6 +16869,7 @@ put_condition_code (enum rtx_code code,
>>> machine_mode mode, bool reverse,
>>> +    If CODE is 'h', pretend the reg is the 'high' byte register.
>>> +    If CODE is 'y', print "st(0)" instead of "st", if the reg is stack
>>> op.
>>> +    If CODE is 'd', duplicate the operand for AVX instruction.
>>> ++   If CODE is 'V', print naked full integer register name without %.
>>> +  */
>>> +
>>> + void
>>> +@@ -16879,7 +16880,7 @@ print_reg (rtx x, int code, FILE *file)
>>> +   unsigned int regno;
>>> +   bool duplicated;
>>> +
>>> +-  if (ASSEMBLER_DIALECT =3D=3D ASM_ATT)
>>> ++  if (ASSEMBLER_DIALECT =3D=3D ASM_ATT && code !=3D 'V')
>>> +     putc ('%', file);
>>> +
>>> +   if (x =3D=3D pc_rtx)
>>> +@@ -16922,6 +16923,14 @@ print_reg (rtx x, int code, FILE *file)
>>> +             && regno !=3D FPSR_REG
>>> +             && regno !=3D FPCR_REG);
>>> +
>>> ++  if (code =3D=3D 'V')
>>> ++    {
>>> ++      if (GENERAL_REGNO_P (regno))
>>> ++      msize =3D GET_MODE_SIZE (word_mode);
>>> ++      else
>>> ++      error ("'V' modifier on non-integer register");
>>> ++    }
>>> ++
>>> +   duplicated =3D code =3D=3D 'd' && TARGET_AVX;
>>> +
>>> +   switch (msize)
>>> +@@ -17035,6 +17044,7 @@ print_reg (rtx x, int code, FILE *file)
>>> +    & -- print some in-use local-dynamic symbol name.
>>> +    H -- print a memory address offset by 8; used for sse high-parts
>>> +    Y -- print condition for XOP pcom* instruction.
>>> ++   V -- print naked full integer register name without %.
>>> +    + -- print a branch hint as 'cs' or 'ds' prefix
>>> +    ; -- print a semicolon (after prefixes due to bug in older gas).
>>> +    ~ -- print "i" if TARGET_AVX2, "f" otherwise.
>>> +@@ -17259,6 +17269,7 @@ ix86_print_operand (FILE *file, rtx x, int cod=
e)
>>> +       case 'X':
>>> +       case 'P':
>>> +       case 'p':
>>> ++      case 'V':
>>> +         break;
>>> +
>>> +       case 's':
>>> +diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi
>>> +index 2cb6bd1..76ba1d4 100644
>>> +--- a/gcc/doc/extend.texi
>>> ++++ b/gcc/doc/extend.texi
>>> +@@ -8511,6 +8511,9 @@ The table below shows the list of supported
>>> modifiers and their effects.
>>> + @tab @code{2}
>>> + @end multitable
>>> +
>>> ++@code{V} is a special modifier which prints the name of the full
>>> integer
>>> ++register without @code{%}.
>>> ++
>>> + @anchor{x86floatingpointasmoperands}
>>> + @subsubsection x86 Floating-Point @code{asm} Operands
>>> +
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
>>> +new file mode 100644
>>> +index 0000000..f0cd9b7
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-register-4.c
>>> +@@ -0,0 +1,13 @@
>>> ++/* { dg-do compile } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dkeep -fno-pic" } */
>>> ++
>>> ++extern void (*func_p) (void);
>>> ++
>>> ++void
>>> ++foo (void)
>>> ++{
>>> ++  asm("call __x86_indirect_thunk_%V0" : : "a" (func_p));
>>> ++}
>>> ++
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_eax"
>>> { target ia32 } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_rax"
>>> { target { ! ia32 } } } } */
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.=
patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0008-missing-execinfo_h.p=
a
>>> tch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.pa
>>> tch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0008-x86-Disallow-mindir
>>> ect-branch-mfunction-return-with-.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
>>> new file mode 100644
>>> index 0000000..8b95ec7
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0008-x86-Disallow-mindir
>>> ect-branch-mfunction-return-with-.patch
>>> @@ -0,0 +1,301 @@
>>> +From 8e0d9bf93e2e2ec03c544572aef4b03a8e7090f3 Mon Sep 17 00:00:00 2001
>>> +From: "H.J. Lu" <hjl.tools@gmail.com>
>>> +Date: Sat, 13 Jan 2018 18:01:54 -0800
>>> +Subject: [PATCH 08/12] x86: Disallow -mindirect-branch=3D/-mfunction-
>>> return=3D
>>> + with -mcmodel=3Dlarge
>>> +
>>> +Since the thunk function may not be reachable in large code model,
>>> +-mcmodel=3Dlarge is incompatible with -mindirect-branch=3Dthunk,
>>> +-mindirect-branch=3Dthunk-extern, -mfunction-return=3Dthunk and
>>> +-mfunction-return=3Dthunk-extern.  Issue an error when they are used w=
ith
>>> +-mcmodel=3Dlarge.
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * config/i386/i386.c (ix86_set_indirect_branch_type): Disallow
>>> +       -mcmodel=3Dlarge with -mindirect-branch=3Dthunk,
>>> +       -mindirect-branch=3Dthunk-extern, -mfunction-return=3Dthunk and
>>> +       -mfunction-return=3Dthunk-extern.
>>> +       * doc/invoke.texi: Document -mcmodel=3Dlarge is incompatible wi=
th
>>> +       -mindirect-branch=3Dthunk, -mindirect-branch=3Dthunk-extern,
>>> +       -mfunction-return=3Dthunk and -mfunction-return=3Dthunk-extern.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       2018-01-14  H.J. Lu  <hongjiu.lu@intel.com>
>>> +
>>> +       * gcc.target/i386/indirect-thunk-10.c: New test.
>>> +       * gcc.target/i386/indirect-thunk-8.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-9.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-10.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-11.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-9.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-17.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-18.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-19.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-20.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-21.c: Likewise.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c                             | 26
>>> ++++++++++++++++++++++
>>> + gcc/doc/invoke.texi                                | 11 +++++++++
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-10.c  |  7 ++++++
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-8.c   |  7 ++++++
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-9.c   |  7 ++++++
>>> + .../gcc.target/i386/indirect-thunk-attr-10.c       |  9 ++++++++
>>> + .../gcc.target/i386/indirect-thunk-attr-11.c       |  9 ++++++++
>>> + .../gcc.target/i386/indirect-thunk-attr-9.c        |  9 ++++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-17.c       |  7 ++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-18.c       |  8 +++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-19.c       |  8 +++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-20.c       |  9 ++++++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-21.c       |  9 ++++++++
>>> + 13 files changed, 126 insertions(+)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-10.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-11.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/
>>> indirect-thunk-attr-9.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-17.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-18.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-19.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-20.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-21.c
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index eeca7e5..9c038be 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -6389,6 +6389,19 @@ ix86_set_indirect_branch_type (tree fndecl)
>>> +       }
>>> +       else
>>> +       cfun->machine->indirect_branch_type =3D ix86_indirect_branch;
>>> ++
>>> ++      /* -mcmodel=3Dlarge is not compatible with -mindirect-branch=3D=
thunk
>>> ++       nor -mindirect-branch=3Dthunk-extern.  */
>>> ++      if ((ix86_cmodel =3D=3D CM_LARGE || ix86_cmodel =3D=3D CM_LARGE=
_PIC)
>>> ++        && ((cfun->machine->indirect_branch_type
>>> ++             =3D=3D indirect_branch_thunk_extern)
>>> ++            || (cfun->machine->indirect_branch_type
>>> ++                =3D=3D indirect_branch_thunk)))
>>> ++      error ("%<-mindirect-branch=3D%s%> and %<-mcmodel=3Dlarge%> are=
 not "
>>> ++             "compatible",
>>> ++             ((cfun->machine->indirect_branch_type
>>> ++               =3D=3D indirect_branch_thunk_extern)
>>> ++              ? "thunk-extern" : "thunk"));
>>> +     }
>>> +
>>> +   if (cfun->machine->function_return_type =3D=3D indirect_branch_unse=
t)
>>> +@@ -6414,6 +6427,19 @@ ix86_set_indirect_branch_type (tree fndecl)
>>> +       }
>>> +       else
>>> +       cfun->machine->function_return_type =3D ix86_function_return;
>>> ++
>>> ++      /* -mcmodel=3Dlarge is not compatible with -mfunction-return=3D=
thunk
>>> ++       nor -mfunction-return=3Dthunk-extern.  */
>>> ++      if ((ix86_cmodel =3D=3D CM_LARGE || ix86_cmodel =3D=3D CM_LARGE=
_PIC)
>>> ++        && ((cfun->machine->function_return_type
>>> ++             =3D=3D indirect_branch_thunk_extern)
>>> ++            || (cfun->machine->function_return_type
>>> ++                =3D=3D indirect_branch_thunk)))
>>> ++      error ("%<-mfunction-return=3D%s%> and %<-mcmodel=3Dlarge%> are=
 not "
>>> ++             "compatible",
>>> ++             ((cfun->machine->function_return_type
>>> ++               =3D=3D indirect_branch_thunk_extern)
>>> ++              ? "thunk-extern" : "thunk"));
>>> +     }
>>> + }
>>> +
>>> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
>>> +index ad9f295..48e827f 100644
>>> +--- a/gcc/doc/invoke.texi
>>> ++++ b/gcc/doc/invoke.texi
>>> +@@ -24230,6 +24230,11 @@ to external call and return thunk provided in
>>> a separate object file.
>>> + You can control this behavior for a specific function by using the
>>> + function attribute @code{indirect_branch}.  @xref{Function Attributes=
}.
>>> +
>>> ++Note that @option{-mcmodel=3Dlarge} is incompatible with
>>> ++@option{-mindirect-branch=3Dthunk} nor
>>> ++@option{-mindirect-branch=3Dthunk-extern} since the thunk function ma=
y
>>> ++not be reachable in large code model.
>>> ++
>>> + @item -mfunction-return=3D@var{choice}
>>> + @opindex -mfunction-return
>>> + Convert function return with @var{choice}.  The default is @samp{keep=
},
>>> +@@ -24241,6 +24246,12 @@ object file.  You can control this behavior
>>> for a specific function by
>>> + using the function attribute @code{function_return}.
>>> + @xref{Function Attributes}.
>>> +
>>> ++Note that @option{-mcmodel=3Dlarge} is incompatible with
>>> ++@option{-mfunction-return=3Dthunk} nor
>>> ++@option{-mfunction-return=3Dthunk-extern} since the thunk function ma=
y
>>> ++not be reachable in large code model.
>>> ++
>>> ++
>>> + @item -mindirect-branch-register
>>> + @opindex -mindirect-branch-register
>>> + Force indirect call and jump via register.
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
>>> +new file mode 100644
>>> +index 0000000..a0674bd
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-10.c
>>> +@@ -0,0 +1,7 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-inline
>>> -mfunction-return=3Dkeep -mcmodel=3Dlarge" } */
>>> ++
>>> ++void
>>> ++bar (void)
>>> ++{
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
>>> +new file mode 100644
>>> +index 0000000..7a80a89
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-8.c
>>> +@@ -0,0 +1,7 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk -mfunction-return=3Dke=
ep
>>> -mcmodel=3Dlarge" } */
>>> ++
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mindirect-branch=3Dthunk' and '-mcmodel=3Dlarge' a=
re
>>> not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
>>> +new file mode 100644
>>> +index 0000000..d4d45c5
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-9.c
>>> +@@ -0,0 +1,7 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dthunk-extern
>>> -mfunction-return=3Dkeep -mcmodel=3Dlarge" } */
>>> ++
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mindirect-branch=3Dthunk-extern' and
>>> '-mcmodel=3Dlarge' are not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
>>> +new file mode 100644
>>> +index 0000000..3a2aead
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-10.c
>>> +@@ -0,0 +1,9 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk-extern")))
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mindirect-branch=3Dthunk-extern' and
>>> '-mcmodel=3Dlarge' are not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
>>> +new file mode 100644
>>> +index 0000000..8e52f03
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-11.c
>>> +@@ -0,0 +1,9 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk-inline")))
>>> ++void
>>> ++bar (void)
>>> ++{
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
>>> +new file mode 100644
>>> +index 0000000..bdaa4f6
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-9.c
>>> +@@ -0,0 +1,9 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++__attribute__ ((indirect_branch("thunk")))
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mindirect-branch=3Dthunk' and '-mcmodel=3Dlarge' a=
re
>>> not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-17.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-17.c
>>> +new file mode 100644
>>> +index 0000000..0605e2c
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-17.c
>>> +@@ -0,0 +1,7 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dke=
ep
>>> -mcmodel=3Dlarge" } */
>>> ++
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mfunction-return=3Dthunk' and '-mcmodel=3Dlarge' a=
re
>>> not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-18.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-18.c
>>> +new file mode 100644
>>> +index 0000000..307019d
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-18.c
>>> +@@ -0,0 +1,8 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-extern
>>> -mindirect-branch=3Dkeep -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mfunction-return=3Dthunk-extern' and
>>> '-mcmodel=3Dlarge' are not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-19.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-19.c
>>> +new file mode 100644
>>> +index 0000000..772617f
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-19.c
>>> +@@ -0,0 +1,8 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++
>>> ++__attribute__ ((function_return("thunk")))
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mfunction-return=3Dthunk' and '-mcmodel=3Dlarge' a=
re
>>> not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-20.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-20.c
>>> +new file mode 100644
>>> +index 0000000..1e9f9bd
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-20.c
>>> +@@ -0,0 +1,9 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++__attribute__ ((function_return("thunk-extern")))
>>> ++void
>>> ++bar (void)
>>> ++{ /* { dg-error "'-mfunction-return=3Dthunk-extern' and
>>> '-mcmodel=3Dlarge' are not compatible" } */
>>> ++}
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-21.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-21.c
>>> +new file mode 100644
>>> +index 0000000..eea07f7
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-21.c
>>> +@@ -0,0 +1,9 @@
>>> ++/* { dg-do compile { target { lp64 } } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dkee=
p
>>> -mcmodel=3Dlarge" } */
>>> ++/* { dg-additional-options "-fPIC" { target fpic } } */
>>> ++
>>> ++__attribute__ ((function_return("thunk-inline")))
>>> ++void
>>> ++bar (void)
>>> ++{
>>> ++}
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0009-Use-INVALID_REGNUM-
>>> in-indirect-thunk-processing.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
>>> new file mode 100644
>>> index 0000000..735bf0e
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0009-Use-INVALID_REGNUM-
>>> in-indirect-thunk-processing.patch
>>> @@ -0,0 +1,123 @@
>>> +From 3eff2adada2b1667b0e76496fa559e0c248ecd84 Mon Sep 17 00:00:00 2001
>>> +From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Thu, 25 Jan 2018 19:39:01 +0000
>>> +Subject: [PATCH 09/12] Use INVALID_REGNUM in indirect thunk processing
>>> +
>>> +       Backport from mainline
>>> +       2018-01-17  Uros Bizjak  <ubizjak@gmail.com>
>>> +
>>> +       * config/i386/i386.c (indirect_thunk_name): Declare regno
>>> +       as unsigned int.  Compare regno with INVALID_REGNUM.
>>> +       (output_indirect_thunk): Ditto.
>>> +       (output_indirect_thunk_function): Ditto.
>>> +       (ix86_code_end): Declare regno as unsigned int.  Use
>>> INVALID_REGNUM
>>> +       in the call to output_indirect_thunk_function.
>>> +
>>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257067
>>> 138bc75d-0d04-0410-961f-82ee72b054a4
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c | 30 +++++++++++++++---------------
>>> + 1 file changed, 15 insertions(+), 15 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 9c038be..4012657 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -11087,16 +11087,16 @@ static int indirect_thunks_bnd_used;
>>> + /* Fills in the label name that should be used for the indirect
>>> thunk.  */
>>> +
>>> + static void
>>> +-indirect_thunk_name (char name[32], int regno, bool need_bnd_p,
>>> +-                   bool ret_p)
>>> ++indirect_thunk_name (char name[32], unsigned int regno,
>>> ++                   bool need_bnd_p, bool ret_p)
>>> + {
>>> +-  if (regno >=3D 0 && ret_p)
>>> ++  if (regno !=3D INVALID_REGNUM && ret_p)
>>> +     gcc_unreachable ();
>>> +
>>> +   if (USE_HIDDEN_LINKONCE)
>>> +     {
>>> +       const char *bnd =3D need_bnd_p ? "_bnd" : "";
>>> +-      if (regno >=3D 0)
>>> ++      if (regno !=3D INVALID_REGNUM)
>>> +       {
>>> +         const char *reg_prefix;
>>> +         if (LEGACY_INT_REGNO_P (regno))
>>> +@@ -11114,7 +11114,7 @@ indirect_thunk_name (char name[32], int regno,
>>> bool need_bnd_p,
>>> +     }
>>> +   else
>>> +     {
>>> +-      if (regno >=3D 0)
>>> ++      if (regno !=3D INVALID_REGNUM)
>>> +       {
>>> +         if (need_bnd_p)
>>> +           ASM_GENERATE_INTERNAL_LABEL (name, "LITBR", regno);
>>> +@@ -11166,7 +11166,7 @@ indirect_thunk_name (char name[32], int regno,
>>> bool need_bnd_p,
>>> +  */
>>> +
>>> + static void
>>> +-output_indirect_thunk (bool need_bnd_p, int regno)
>>> ++output_indirect_thunk (bool need_bnd_p, unsigned int regno)
>>> + {
>>> +   char indirectlabel1[32];
>>> +   char indirectlabel2[32];
>>> +@@ -11196,7 +11196,7 @@ output_indirect_thunk (bool need_bnd_p, int
>>> regno)
>>> +
>>> +   ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);
>>> +
>>> +-  if (regno >=3D 0)
>>> ++  if (regno !=3D INVALID_REGNUM)
>>> +     {
>>> +       /* MOV.  */
>>> +       rtx xops[2];
>>> +@@ -11220,12 +11220,12 @@ output_indirect_thunk (bool need_bnd_p, int
>>> regno)
>>> + }
>>> +
>>> + /* Output a funtion with a call and return thunk for indirect branch.
>>> +-   If BND_P is true, the BND prefix is needed.   If REGNO !=3D -1,  t=
he
>>> +-   function address is in REGNO.  Otherwise, the function address is
>>> ++   If BND_P is true, the BND prefix is needed.  If REGNO !=3D
>>> INVALID_REGNUM,
>>> ++   the function address is in REGNO.  Otherwise, the function address
>>> is
>>> +    on the top of stack.  */
>>> +
>>> + static void
>>> +-output_indirect_thunk_function (bool need_bnd_p, int regno)
>>> ++output_indirect_thunk_function (bool need_bnd_p, unsigned int regno)
>>> + {
>>> +   char name[32];
>>> +   tree decl;
>>> +@@ -11274,7 +11274,7 @@ output_indirect_thunk_function (bool
>>> need_bnd_p, int regno)
>>> +       ASM_OUTPUT_LABEL (asm_out_file, name);
>>> +       }
>>> +
>>> +-  if (regno < 0)
>>> ++  if (regno =3D=3D INVALID_REGNUM)
>>> +     {
>>> +       /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.
>>> */
>>> +       char alias[32];
>>> +@@ -11348,16 +11348,16 @@ static void
>>> + ix86_code_end (void)
>>> + {
>>> +   rtx xops[2];
>>> +-  int regno;
>>> ++  unsigned int regno;
>>> +
>>> +   if (indirect_thunk_needed)
>>> +-    output_indirect_thunk_function (false, -1);
>>> ++    output_indirect_thunk_function (false, INVALID_REGNUM);
>>> +   if (indirect_thunk_bnd_needed)
>>> +-    output_indirect_thunk_function (true, -1);
>>> ++    output_indirect_thunk_function (true, INVALID_REGNUM);
>>> +
>>> +   for (regno =3D FIRST_REX_INT_REG; regno <=3D LAST_REX_INT_REG; regn=
o++)
>>> +     {
>>> +-      int i =3D regno - FIRST_REX_INT_REG + LAST_INT_REG + 1;
>>> ++      unsigned int i =3D regno - FIRST_REX_INT_REG + LAST_INT_REG + 1=
;
>>> +       if ((indirect_thunks_used & (1 << i)))
>>> +       output_indirect_thunk_function (false, regno);
>>> +
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0009-c99-snprintf.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-d=
irectories.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-d
>>> irectories.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0010-gcc-poison-system-di=
r
>>> ectories.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-dir
>>> ectories.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0010-i386-Pass-INVALID_R
>>> EGNUM-as-invalid-register-number.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
>>> new file mode 100644
>>> index 0000000..1833a14
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0010-i386-Pass-INVALID_R
>>> EGNUM-as-invalid-register-number.patch
>>> @@ -0,0 +1,43 @@
>>> +From c4300d9ad683e693c90d02d4f1b13183bf2d4acc Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Fri, 2 Feb 2018 16:47:02 +0000
>>> +Subject: [PATCH 10/12] i386: Pass INVALID_REGNUM as invalid register
>>> number
>>> +
>>> +       Backport from mainline
>>> +       * config/i386/i386.c (ix86_output_function_return): Pass
>>> +       INVALID_REGNUM, instead of -1, as invalid register number to
>>> +       indirect_thunk_name and output_indirect_thunk.
>>> +
>>> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@257341
>>> 138bc75d-0d04-0410-961f-82ee72b054a4
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386.c | 5 +++--
>>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 4012657..66502ee 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -28056,7 +28056,8 @@ ix86_output_function_return (bool long_p)
>>> +       {
>>> +         bool need_thunk =3D (cfun->machine->function_return_type
>>> +                            =3D=3D indirect_branch_thunk);
>>> +-        indirect_thunk_name (thunk_name, -1, need_bnd_p, true);
>>> ++        indirect_thunk_name (thunk_name, INVALID_REGNUM, need_bnd_p,
>>> ++                             true);
>>> +         if (need_bnd_p)
>>> +           {
>>> +             indirect_thunk_bnd_needed |=3D need_thunk;
>>> +@@ -28069,7 +28070,7 @@ ix86_output_function_return (bool long_p)
>>> +           }
>>> +       }
>>> +       else
>>> +-      output_indirect_thunk (need_bnd_p, -1);
>>> ++      output_indirect_thunk (need_bnd_p, INVALID_REGNUM);
>>> +
>>> +       return "";
>>> +     }
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-exte=
nd.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0011-gcc-poison-dir-exten=
d
>>> .patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend
>>> .patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0011-i386-Update-mfuncti
>>> on-return-for-return-with-pop.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0011-i386-Update-mfunction-return-for-return-with-pop.patch
>>> new file mode 100644
>>> index 0000000..7dd325d
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0011-i386-Update-mfuncti
>>> on-return-for-return-with-pop.patch
>>> @@ -0,0 +1,450 @@
>>> +From b3a2269c7884378a9afd394ac7e669aab0443b57 Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Mon, 26 Feb 2018 15:29:30 +0000
>>> +Subject: [PATCH 11/12] i386: Update -mfunction-return=3D for return wi=
th
>>> pop
>>> +
>>> +When -mfunction-return=3D is used, simple_return_pop_internal should p=
op
>>> +return address into ECX register, adjust stack by bytes to pop from
>>> stack
>>> +and jump to the return thunk via ECX register.
>>> +
>>> +Revision 257992 removed the bool argument from ix86_output_indirect_jm=
p.
>>> +Update comments to reflect it.
>>> +
>>> +Tested on i686 and x86-64.
>>> +
>>> +       Backport from mainline
>>> +       * config/i386/i386.c (ix86_output_indirect_jmp): Update comment=
s.
>>> +
>>> +       PR target/84530
>>> +       * config/i386/i386-protos.h (ix86_output_indirect_jmp): Remove
>>> +       the bool argument.
>>> +       (ix86_output_indirect_function_return): New prototype.
>>> +       (ix86_split_simple_return_pop_internal): Likewise.
>>> +       * config/i386/i386.c (indirect_return_via_cx): New.
>>> +       (indirect_return_via_cx_bnd): Likewise.
>>> +       (indirect_thunk_name): Handle return va CX_REG.
>>> +       (output_indirect_thunk_function): Create alias for
>>> +       __x86_return_thunk_[re]cx and __x86_return_thunk_[re]cx_bnd.
>>> +       (ix86_output_indirect_jmp): Remove the bool argument.
>>> +       (ix86_output_indirect_function_return): New function.
>>> +       (ix86_split_simple_return_pop_internal): Likewise.
>>> +       * config/i386/i386.md (*indirect_jump): Don't pass false
>>> +       to ix86_output_indirect_jmp.
>>> +       (*tablejump_1): Likewise.
>>> +       (simple_return_pop_internal): Change it to define_insn_and_spli=
t.
>>> +       Call ix86_split_simple_return_pop_internal to split it for
>>> +       -mfunction-return=3D.
>>> +       (simple_return_indirect_internal): Call
>>> +       ix86_output_indirect_function_return instead of
>>> +       ix86_output_indirect_jmp.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       PR target/84530
>>> +       * gcc.target/i386/ret-thunk-22.c: New test.
>>> +       * gcc.target/i386/ret-thunk-23.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-24.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-25.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-26.c: Likewise.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/i386-protos.h                |   4 +-
>>> + gcc/config/i386/i386.c                       | 127
>>> +++++++++++++++++++++++----
>>> + gcc/config/i386/i386.md                      |  11 ++-
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-22.c |  15 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-23.c |  15 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-24.c |  15 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-25.c |  15 ++++
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-26.c |  40 +++++++++
>>> + 8 files changed, 222 insertions(+), 20 deletions(-)
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-22.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-23.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-24.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-25.c
>>> + create mode 100644 gcc/testsuite/gcc.target/i386/ret-thunk-26.c
>>> +
>>> +diff --git a/gcc/config/i386/i386-protos.h
>>> b/gcc/config/i386/i386-protos.h
>>> +index 620d70e..c7a0ccb5 100644
>>> +--- a/gcc/config/i386/i386-protos.h
>>> ++++ b/gcc/config/i386/i386-protos.h
>>> +@@ -311,8 +311,10 @@ extern enum attr_cpu ix86_schedule;
>>> + #endif
>>> +
>>> + extern const char * ix86_output_call_insn (rtx_insn *insn, rtx
>>> call_op);
>>> +-extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p=
);
>>> ++extern const char * ix86_output_indirect_jmp (rtx call_op);
>>> + extern const char * ix86_output_function_return (bool long_p);
>>> ++extern const char * ix86_output_indirect_function_return (rtx ret_op)=
;
>>> ++extern void ix86_split_simple_return_pop_internal (rtx);
>>> + extern bool ix86_operands_ok_for_move_multiple (rtx *operands, bool
>>> load,
>>> +                                               enum machine_mode mode)=
;
>>> +
>>> +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
>>> +index 66502ee..21c3c18 100644
>>> +--- a/gcc/config/i386/i386.c
>>> ++++ b/gcc/config/i386/i386.c
>>> +@@ -11080,6 +11080,12 @@ static int indirect_thunks_used;
>>> +    by call and return thunks functions with the BND prefix.  */
>>> + static int indirect_thunks_bnd_used;
>>> +
>>> ++/* True if return thunk function via CX is needed.  */
>>> ++static bool indirect_return_via_cx;
>>> ++/* True if return thunk function via CX with the BND prefix is
>>> ++   needed.  */
>>> ++static bool indirect_return_via_cx_bnd;
>>> ++
>>> + #ifndef INDIRECT_LABEL
>>> + # define INDIRECT_LABEL "LIND"
>>> + #endif
>>> +@@ -11090,12 +11096,13 @@ static void
>>> + indirect_thunk_name (char name[32], unsigned int regno,
>>> +                    bool need_bnd_p, bool ret_p)
>>> + {
>>> +-  if (regno !=3D INVALID_REGNUM && ret_p)
>>> ++  if (regno !=3D INVALID_REGNUM && regno !=3D CX_REG && ret_p)
>>> +     gcc_unreachable ();
>>> +
>>> +   if (USE_HIDDEN_LINKONCE)
>>> +     {
>>> +       const char *bnd =3D need_bnd_p ? "_bnd" : "";
>>> ++      const char *ret =3D ret_p ? "return" : "indirect";
>>> +       if (regno !=3D INVALID_REGNUM)
>>> +       {
>>> +         const char *reg_prefix;
>>> +@@ -11103,14 +11110,11 @@ indirect_thunk_name (char name[32], unsigned
>>> int regno,
>>> +           reg_prefix =3D TARGET_64BIT ? "r" : "e";
>>> +         else
>>> +           reg_prefix =3D "";
>>> +-        sprintf (name, "__x86_indirect_thunk%s_%s%s",
>>> +-                 bnd, reg_prefix, reg_names[regno]);
>>> ++        sprintf (name, "__x86_%s_thunk%s_%s%s",
>>> ++                 ret, bnd, reg_prefix, reg_names[regno]);
>>> +       }
>>> +       else
>>> +-      {
>>> +-        const char *ret =3D ret_p ? "return" : "indirect";
>>> +-        sprintf (name, "__x86_%s_thunk%s", ret, bnd);
>>> +-      }
>>> ++      sprintf (name, "__x86_%s_thunk%s", ret, bnd);
>>> +     }
>>> +   else
>>> +     {
>>> +@@ -11274,9 +11278,23 @@ output_indirect_thunk_function (bool
>>> need_bnd_p, unsigned int regno)
>>> +       ASM_OUTPUT_LABEL (asm_out_file, name);
>>> +       }
>>> +
>>> ++  /* Create alias for __x86_return_thunk/__x86_return_thunk_bnd or
>>> ++     __x86_return_thunk_ecx/__x86_return_thunk_ecx_bnd.  */
>>> ++  bool need_alias;
>>> +   if (regno =3D=3D INVALID_REGNUM)
>>> ++    need_alias =3D true;
>>> ++  else if (regno =3D=3D CX_REG)
>>> ++    {
>>> ++      if (need_bnd_p)
>>> ++      need_alias =3D indirect_return_via_cx_bnd;
>>> ++      else
>>> ++      need_alias =3D indirect_return_via_cx;
>>> ++    }
>>> ++  else
>>> ++    need_alias =3D false;
>>> ++
>>> ++  if (need_alias)
>>> +     {
>>> +-      /* Create alias for __x86.return_thunk/__x86.return_thunk_bnd.
>>> */
>>> +       char alias[32];
>>> +
>>> +       indirect_thunk_name (alias, regno, need_bnd_p, true);
>>> +@@ -28019,18 +28037,17 @@ ix86_output_indirect_branch (rtx call_op,
>>> const char *xasm,
>>> +   else
>>> +     ix86_output_indirect_branch_via_push (call_op, xasm, sibcall_p);
>>> + }
>>> +-/* Output indirect jump.  CALL_OP is the jump target.  Jump is a
>>> +-   function return if RET_P is true.  */
>>> ++
>>> ++/* Output indirect jump.  CALL_OP is the jump target.  */
>>> +
>>> + const char *
>>> +-ix86_output_indirect_jmp (rtx call_op, bool ret_p)
>>> ++ix86_output_indirect_jmp (rtx call_op)
>>> + {
>>> +   if (cfun->machine->indirect_branch_type !=3D indirect_branch_keep)
>>> +     {
>>> +-      /* We can't have red-zone if this isn't a function return since
>>> +-       "call" in the indirect thunk pushes the return address onto
>>> +-       stack, destroying red-zone.  */
>>> +-      if (!ret_p && ix86_red_zone_size !=3D 0)
>>> ++      /* We can't have red-zone since "call" in the indirect thunk
>>> ++         pushes the return address onto stack, destroying red-zone.  =
*/
>>> ++      if (ix86_red_zone_size !=3D 0)
>>> +       gcc_unreachable ();
>>> +
>>> +       ix86_output_indirect_branch (call_op, "%0", true);
>>> +@@ -28081,6 +28098,86 @@ ix86_output_function_return (bool long_p)
>>> +   return "rep%; ret";
>>> + }
>>> +
>>> ++/* Output indirect function return.  RET_OP is the function return
>>> ++   target.  */
>>> ++
>>> ++const char *
>>> ++ix86_output_indirect_function_return (rtx ret_op)
>>> ++{
>>> ++  if (cfun->machine->function_return_type !=3D indirect_branch_keep)
>>> ++    {
>>> ++      char thunk_name[32];
>>> ++      bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_in=
sn);
>>> ++      unsigned int regno =3D REGNO (ret_op);
>>> ++      gcc_assert (regno =3D=3D CX_REG);
>>> ++
>>> ++      if (cfun->machine->function_return_type
>>> ++        !=3D indirect_branch_thunk_inline)
>>> ++      {
>>> ++        bool need_thunk =3D (cfun->machine->function_return_type
>>> ++                           =3D=3D indirect_branch_thunk);
>>> ++        indirect_thunk_name (thunk_name, regno, need_bnd_p, true);
>>> ++        if (need_bnd_p)
>>> ++          {
>>> ++            if (need_thunk)
>>> ++              {
>>> ++                indirect_return_via_cx_bnd =3D true;
>>> ++                indirect_thunks_bnd_used |=3D 1 << CX_REG;
>>> ++              }
>>> ++            fprintf (asm_out_file, "\tbnd jmp\t%s\n", thunk_name);
>>> ++          }
>>> ++        else
>>> ++          {
>>> ++            if (need_thunk)
>>> ++              {
>>> ++                indirect_return_via_cx =3D true;
>>> ++                indirect_thunks_used |=3D 1 << CX_REG;
>>> ++              }
>>> ++            fprintf (asm_out_file, "\tjmp\t%s\n", thunk_name);
>>> ++          }
>>> ++      }
>>> ++      else
>>> ++      output_indirect_thunk (need_bnd_p, regno);
>>> ++
>>> ++      return "";
>>> ++    }
>>> ++  else
>>> ++    return "%!jmp\t%A0";
>>> ++}
>>> ++
>>> ++/* Split simple return with popping POPC bytes from stack to indirect
>>> ++   branch with stack adjustment .  */
>>> ++
>>> ++void
>>> ++ix86_split_simple_return_pop_internal (rtx popc)
>>> ++{
>>> ++  struct machine_function *m =3D cfun->machine;
>>> ++  rtx ecx =3D gen_rtx_REG (SImode, CX_REG);
>>> ++  rtx_insn *insn;
>>> ++
>>> ++  /* There is no "pascal" calling convention in any 64bit ABI.  */
>>> ++  gcc_assert (!TARGET_64BIT);
>>> ++
>>> ++  insn =3D emit_insn (gen_pop (ecx));
>>> ++  m->fs.cfa_offset -=3D UNITS_PER_WORD;
>>> ++  m->fs.sp_offset -=3D UNITS_PER_WORD;
>>> ++
>>> ++  rtx x =3D plus_constant (Pmode, stack_pointer_rtx, UNITS_PER_WORD);
>>> ++  x =3D gen_rtx_SET (stack_pointer_rtx, x);
>>> ++  add_reg_note (insn, REG_CFA_ADJUST_CFA, x);
>>> ++  add_reg_note (insn, REG_CFA_REGISTER, gen_rtx_SET (ecx, pc_rtx));
>>> ++  RTX_FRAME_RELATED_P (insn) =3D 1;
>>> ++
>>> ++  x =3D gen_rtx_PLUS (Pmode, stack_pointer_rtx, popc);
>>> ++  x =3D gen_rtx_SET (stack_pointer_rtx, x);
>>> ++  insn =3D emit_insn (x);
>>> ++  add_reg_note (insn, REG_CFA_ADJUST_CFA, x);
>>> ++  RTX_FRAME_RELATED_P (insn) =3D 1;
>>> ++
>>> ++  /* Now return address is in ECX.  */
>>> ++  emit_jump_insn (gen_simple_return_indirect_internal (ecx));
>>> ++}
>>> ++
>>> + /* Output the assembly for a call instruction.  */
>>> +
>>> + const char *
>>> +diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
>>> +index 05a88ff..857466a 100644
>>> +--- a/gcc/config/i386/i386.md
>>> ++++ b/gcc/config/i386/i386.md
>>> +@@ -11813,7 +11813,7 @@
>>> + (define_insn "*indirect_jump"
>>> +   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))]
>>> +   ""
>>> +-  "* return ix86_output_indirect_jmp (operands[0], false);"
>>> ++  "* return ix86_output_indirect_jmp (operands[0]);"
>>> +   [(set (attr "type")
>>> +      (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> +                                !=3D indirect_branch_keep)")
>>> +@@ -11868,7 +11868,7 @@
>>> +   [(set (pc) (match_operand:W 0 "indirect_branch_operand" "rBw"))
>>> +    (use (label_ref (match_operand 1)))]
>>> +   ""
>>> +-  "* return ix86_output_indirect_jmp (operands[0], false);"
>>> ++  "* return ix86_output_indirect_jmp (operands[0]);"
>>> +   [(set (attr "type")
>>> +      (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> +                                !=3D indirect_branch_keep)")
>>> +@@ -12520,11 +12520,14 @@
>>> +    (set_attr "prefix_rep" "1")
>>> +    (set_attr "modrm" "0")])
>>> +
>>> +-(define_insn "simple_return_pop_internal"
>>> ++(define_insn_and_split "simple_return_pop_internal"
>>> +   [(simple_return)
>>> +    (use (match_operand:SI 0 "const_int_operand"))]
>>> +   "reload_completed"
>>> +   "%!ret\t%0"
>>> ++  "&& cfun->machine->function_return_type !=3D indirect_branch_keep"
>>> ++  [(const_int 0)]
>>> ++  "ix86_split_simple_return_pop_internal (operands[0]); DONE;"
>>> +   [(set_attr "length" "3")
>>> +    (set_attr "atom_unit" "jeu")
>>> +    (set_attr "length_immediate" "2")
>>> +@@ -12535,7 +12538,7 @@
>>> +   [(simple_return)
>>> +    (use (match_operand:SI 0 "register_operand" "r"))]
>>> +   "reload_completed"
>>> +-  "* return ix86_output_indirect_jmp (operands[0], true);"
>>> ++  "* return ix86_output_indirect_function_return (operands[0]);"
>>> +   [(set (attr "type")
>>> +      (if_then_else (match_test "(cfun->machine->indirect_branch_type
>>> +                                !=3D indirect_branch_keep)")
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-22.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-22.c
>>> +new file mode 100644
>>> +index 0000000..89e086d
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-22.c
>>> +@@ -0,0 +1,15 @@
>>> ++/* PR target/r84530 */
>>> ++/* { dg-do compile { target ia32 } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk" } */
>>> ++
>>> ++struct s { _Complex unsigned short x; };
>>> ++struct s gs =3D { 100 + 200i };
>>> ++struct s __attribute__((noinline)) foo (void) { return gs; }
>>> ++
>>> ++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
>>> ++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_ecx" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-23.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-23.c
>>> +new file mode 100644
>>> +index 0000000..43f0cca
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-23.c
>>> +@@ -0,0 +1,15 @@
>>> ++/* PR target/r84530 */
>>> ++/* { dg-do compile { target ia32 } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-extern" } */
>>> ++
>>> ++struct s { _Complex unsigned short x; };
>>> ++struct s gs =3D { 100 + 200i };
>>> ++struct s __attribute__((noinline)) foo (void) { return gs; }
>>> ++
>>> ++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
>>> ++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_ecx" } =
}
>>> */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not {\tpause} } } */
>>> ++/* { dg-final { scan-assembler-not {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-24.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-24.c
>>> +new file mode 100644
>>> +index 0000000..8729e35
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-24.c
>>> +@@ -0,0 +1,15 @@
>>> ++/* PR target/r84530 */
>>> ++/* { dg-do compile { target ia32 } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk-inline" } */
>>> ++
>>> ++struct s { _Complex unsigned short x; };
>>> ++struct s gs =3D { 100 + 200i };
>>> ++struct s __attribute__((noinline)) foo (void) { return gs; }
>>> ++
>>> ++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
>>> ++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk_ecx=
"
>>> } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-25.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-25.c
>>> +new file mode 100644
>>> +index 0000000..f73553c
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-25.c
>>> +@@ -0,0 +1,15 @@
>>> ++/* PR target/r84530 */
>>> ++/* { dg-do compile { target ia32 } } */
>>> ++/* { dg-options "-O2 -mfunction-return=3Dthunk -fcheck-pointer-bounds
>>> -mmpx -fno-pic" } */
>>> ++
>>> ++struct s { _Complex unsigned short x; };
>>> ++struct s gs =3D { 100 + 200i };
>>> ++struct s __attribute__((noinline)) foo (void) { return gs; }
>>> ++
>>> ++/* { dg-final { scan-assembler-times "popl\[\\t \]*%ecx" 1 } } */
>>> ++/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*4\\(%esp\\), %esp" =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk_bnd_ecx=
"
>>> } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler {\tpause} } } */
>>> ++/* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-26.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-26.c
>>> +new file mode 100644
>>> +index 0000000..9144e98
>>> +--- /dev/null
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-26.c
>>> +@@ -0,0 +1,40 @@
>>> ++/* PR target/r84530 */
>>> ++/* { dg-do run } */
>>> ++/* { dg-options "-Os -mfunction-return=3Dthunk" } */
>>> ++
>>> ++struct S { int i; };
>>> ++__attribute__((const, noinline, noclone))
>>> ++struct S foo (int x)
>>> ++{
>>> ++  struct S s;
>>> ++  s.i =3D x;
>>> ++  return s;
>>> ++}
>>> ++
>>> ++int a[2048], b[2048], c[2048], d[2048];
>>> ++struct S e[2048];
>>> ++
>>> ++__attribute__((noinline, noclone)) void
>>> ++bar (void)
>>> ++{
>>> ++  int i;
>>> ++  for (i =3D 0; i < 1024; i++)
>>> ++    {
>>> ++      e[i] =3D foo (i);
>>> ++      a[i+2] =3D a[i] + a[i+1];
>>> ++      b[10] =3D b[10] + i;
>>> ++      c[i] =3D c[2047 - i];
>>> ++      d[i] =3D d[i + 1];
>>> ++    }
>>> ++}
>>> ++
>>> ++int
>>> ++main ()
>>> ++{
>>> ++  int i;
>>> ++  bar ();
>>> ++  for (i =3D 0; i < 1024; i++)
>>> ++    if (e[i].i !=3D i)
>>> ++      __builtin_abort ();
>>> ++  return 0;
>>> ++}
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_C=
FLAGS_FOR_TARGET.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_C
>>> FLAGS_FOR_TARGET.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0012-gcc-4.3.3-SYSROOT_CF=
L
>>> AGS_FOR_TARGET.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFL
>>> AGS_FOR_TARGET.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0012-i386-Add-TARGET_IND=
IRECT_BRANCH_REGISTER.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0012-i386-Add-TARGET_IND
>>> IRECT_BRANCH_REGISTER.patch
>>> new file mode 100644
>>> index 0000000..f4b137c
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/0012-i386-Add-TARGET_IND
>>> IRECT_BRANCH_REGISTER.patch
>>> @@ -0,0 +1,1001 @@
>>> +From 7ba192d11a43d24ce427a3dfce0ad0592bd52830 Mon Sep 17 00:00:00 2001
>>> +From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
>>> +Date: Mon, 26 Feb 2018 17:00:46 +0000
>>> +Subject: [PATCH 12/12] i386: Add TARGET_INDIRECT_BRANCH_REGISTER
>>> +
>>> +For
>>> +
>>> +---
>>> +struct C {
>>> +  virtual ~C();
>>> +  virtual void f();
>>> +};
>>> +
>>> +void
>>> +f (C *p)
>>> +{
>>> +  p->f();
>>> +  p->f();
>>> +}
>>> +---
>>> +
>>> +-mindirect-branch=3Dthunk-extern -O2 on x86-64 GNU/Linux generates:
>>> +
>>> +_Z1fP1C:
>>> +.LFB0:
>>> +        .cfi_startproc
>>> +        pushq   %rbx
>>> +        .cfi_def_cfa_offset 16
>>> +        .cfi_offset 3, -16
>>> +        movq    (%rdi), %rax
>>> +        movq    %rdi, %rbx
>>> +        jmp     .LIND1
>>> +.LIND0:
>>> +        pushq   16(%rax)
>>> +        jmp     __x86_indirect_thunk
>>> +.LIND1:
>>> +        call    .LIND0
>>> +        movq    (%rbx), %rax
>>> +        movq    %rbx, %rdi
>>> +        popq    %rbx
>>> +        .cfi_def_cfa_offset 8
>>> +        movq    16(%rax), %rax
>>> +        jmp     __x86_indirect_thunk_rax
>>> +        .cfi_endproc
>>> +
>>> +x86-64 is supposed to have asynchronous unwind tables by default, but
>>> +there is nothing that reflects the change in the (relative) frame
>>> +address after .LIND0.  That region really has to be moved outside of
>>> +the .cfi_startproc/.cfi_endproc bracket.
>>> +
>>> +This patch adds TARGET_INDIRECT_BRANCH_REGISTER to force indirect
>>> +branch via register whenever -mindirect-branch=3D is used.  Now,
>>> +-mindirect-branch=3Dthunk-extern -O2 on x86-64 GNU/Linux generates:
>>> +
>>> +_Z1fP1C:
>>> +.LFB0:
>>> +       .cfi_startproc
>>> +       pushq   %rbx
>>> +       .cfi_def_cfa_offset 16
>>> +       .cfi_offset 3, -16
>>> +       movq    (%rdi), %rax
>>> +       movq    %rdi, %rbx
>>> +       movq    16(%rax), %rax
>>> +       call    __x86_indirect_thunk_rax
>>> +       movq    (%rbx), %rax
>>> +       movq    %rbx, %rdi
>>> +       popq    %rbx
>>> +       .cfi_def_cfa_offset 8
>>> +       movq    16(%rax), %rax
>>> +       jmp     __x86_indirect_thunk_rax
>>> +       .cfi_endproc
>>> +
>>> +so that "-mindirect-branch=3Dthunk-extern" is equivalent to
>>> +"-mindirect-branch=3Dthunk-extern -mindirect-branch-register", which i=
s
>>> +used by Linux kernel.
>>> +
>>> +gcc/
>>> +
>>> +       Backport from mainline
>>> +       PR target/84039
>>> +       * config/i386/constraints.md (Bs): Replace
>>> +       ix86_indirect_branch_register with
>>> +       TARGET_INDIRECT_BRANCH_REGISTER.
>>> +       (Bw): Likewise.
>>> +       * config/i386/i386.md (indirect_jump): Likewise.
>>> +       (tablejump): Likewise.
>>> +       (*sibcall_memory): Likewise.
>>> +       (*sibcall_value_memory): Likewise.
>>> +       Peepholes of indirect call and jump via memory: Likewise.
>>> +       (*sibcall_GOT_32): Disallowed for TARGET_INDIRECT_BRANCH_REGIST=
E
>>> R.
>>> +       (*sibcall_value_GOT_32): Likewise.
>>> +       * config/i386/predicates.md (indirect_branch_operand): Likewise=
.
>>> +       (GOT_memory_operand): Likewise.
>>> +       (call_insn_operand): Likewise.
>>> +       (sibcall_insn_operand): Likewise.
>>> +       (GOT32_symbol_operand): Likewise.
>>> +       * config/i386/i386.h (TARGET_INDIRECT_BRANCH_REGISTER): New.
>>> +
>>> +gcc/testsuite/
>>> +
>>> +       Backport from mainline
>>> +       PR target/84039
>>> +       * gcc.target/i386/indirect-thunk-1.c: Updated.
>>> +       * gcc.target/i386/indirect-thunk-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-attr-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-bnd-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-extern-7.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-1.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-2.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-3.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-4.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-5.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-6.c: Likewise.
>>> +       * gcc.target/i386/indirect-thunk-inline-7.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-9.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-10.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-11.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-12.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-13.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-14.c: Likewise.
>>> +       * gcc.target/i386/ret-thunk-15.c: Likewise.
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + gcc/config/i386/constraints.md                     |  4 ++--
>>> + gcc/config/i386/i386.h                             |  5 ++++
>>> + gcc/config/i386/i386.md                            | 28
>>> +++++++++++++---------
>>> + gcc/config/i386/predicates.md                      |  6 ++---
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-1.c   |  5 ++--
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-2.c   |  5 ++--
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-3.c   |  5 ++--
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-4.c   |  5 ++--
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-5.c   |  6 +++--
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-6.c   | 12 ++++++----
>>> + gcc/testsuite/gcc.target/i386/indirect-thunk-7.c   |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-attr-1.c        |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-attr-2.c        |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-attr-3.c        |  3 +--
>>> + .../gcc.target/i386/indirect-thunk-attr-4.c        |  3 +--
>>> + .../gcc.target/i386/indirect-thunk-attr-5.c        |  9 ++++---
>>> + .../gcc.target/i386/indirect-thunk-attr-6.c        |  9 ++++---
>>> + .../gcc.target/i386/indirect-thunk-attr-7.c        |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-bnd-1.c         |  6 ++---
>>> + .../gcc.target/i386/indirect-thunk-bnd-2.c         |  6 ++---
>>> + .../gcc.target/i386/indirect-thunk-bnd-3.c         |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-bnd-4.c         |  7 +++---
>>> + .../gcc.target/i386/indirect-thunk-extern-1.c      |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-extern-2.c      |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-extern-3.c      |  9 ++++---
>>> + .../gcc.target/i386/indirect-thunk-extern-4.c      |  6 ++---
>>> + .../gcc.target/i386/indirect-thunk-extern-5.c      |  6 +++--
>>> + .../gcc.target/i386/indirect-thunk-extern-6.c      |  8 +++----
>>> + .../gcc.target/i386/indirect-thunk-extern-7.c      |  5 ++--
>>> + .../gcc.target/i386/indirect-thunk-inline-1.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-2.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-3.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-4.c      |  2 +-
>>> + .../gcc.target/i386/indirect-thunk-inline-5.c      |  3 ++-
>>> + .../gcc.target/i386/indirect-thunk-inline-6.c      |  3 ++-
>>> + .../gcc.target/i386/indirect-thunk-inline-7.c      |  4 ++--
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-10.c       |  9 +++----
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-11.c       |  9 +++----
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-12.c       |  8 +++----
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-13.c       |  5 ++--
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-14.c       |  7 +++---
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-15.c       |  7 +++---
>>> + gcc/testsuite/gcc.target/i386/ret-thunk-9.c        | 13 ++++------
>>> + 43 files changed, 128 insertions(+), 141 deletions(-)
>>> +
>>> +diff --git a/gcc/config/i386/constraints.md b/gcc/config/i386/
>>> constraints.md
>>> +index 9204c8e..ef684a9 100644
>>> +--- a/gcc/config/i386/constraints.md
>>> ++++ b/gcc/config/i386/constraints.md
>>> +@@ -172,7 +172,7 @@
>>> +
>>> + (define_constraint "Bs"
>>> +   "@internal Sibcall memory operand."
>>> +-  (ior (and (not (match_test "ix86_indirect_branch_register"))
>>> ++  (ior (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
>>> +           (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "sibcall_memory_operand"))
>>> +        (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +@@ -180,7 +180,7 @@
>>> +
>>> + (define_constraint "Bw"
>>> +   "@internal Call memory operand."
>>> +-  (ior (and (not (match_test "ix86_indirect_branch_register"))
>>> ++  (ior (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
>>> +           (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "memory_operand"))
>>> +        (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h
>>> +index b34bc11..1816d71 100644
>>> +--- a/gcc/config/i386/i386.h
>>> ++++ b/gcc/config/i386/i386.h
>>> +@@ -2676,6 +2676,11 @@ extern void debug_dispatch_window (int);
>>> + #define TARGET_RECIP_VEC_DIV  ((recip_mask & RECIP_MASK_VEC_DIV) !=3D=
 0)
>>> + #define TARGET_RECIP_VEC_SQRT ((recip_mask & RECIP_MASK_VEC_SQRT) !=
=3D 0)
>>> +
>>> ++
>>> ++#define TARGET_INDIRECT_BRANCH_REGISTER \
>>> ++  (ix86_indirect_branch_register \
>>> ++   || cfun->machine->indirect_branch_type !=3D indirect_branch_keep)
>>> ++
>>> + #define IX86_HLE_ACQUIRE (1 << 16)
>>> + #define IX86_HLE_RELEASE (1 << 17)
>>> +
>>> +diff --git a/gcc/config/i386/i386.md b/gcc/config/i386/i386.md
>>> +index 857466a..6a6dc26 100644
>>> +--- a/gcc/config/i386/i386.md
>>> ++++ b/gcc/config/i386/i386.md
>>> +@@ -11805,7 +11805,7 @@
>>> +   [(set (pc) (match_operand 0 "indirect_branch_operand"))]
>>> +   ""
>>> + {
>>> +-  if (TARGET_X32 || ix86_indirect_branch_register)
>>> ++  if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTER)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> +   cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +@@ -11859,7 +11859,7 @@
>>> +                                        OPTAB_DIRECT);
>>> +     }
>>> +
>>> +-  if (TARGET_X32 || ix86_indirect_branch_register)
>>> ++  if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTER)
>>> +     operands[0] =3D convert_memory_address (word_mode, operands[0]);
>>> +   cfun->machine->has_local_indirect_jump =3D true;
>>> + })
>>> +@@ -12029,7 +12029,10 @@
>>> +                    (match_operand:SI 0 "register_no_elim_operand" "U"=
)
>>> +                    (match_operand:SI 1 "GOT32_symbol_operand"))))
>>> +        (match_operand 2))]
>>> +-  "!TARGET_MACHO && !TARGET_64BIT && SIBLING_CALL_P (insn)"
>>> ++  "!TARGET_MACHO
>>> ++  && !TARGET_64BIT
>>> ++  && !TARGET_INDIRECT_BRANCH_REGISTER
>>> ++  && SIBLING_CALL_P (insn)"
>>> + {
>>> +   rtx fnaddr =3D gen_rtx_PLUS (Pmode, operands[0], operands[1]);
>>> +   fnaddr =3D gen_const_mem (Pmode, fnaddr);
>>> +@@ -12048,7 +12051,7 @@
>>> +   [(call (mem:QI (match_operand:W 0 "memory_operand" "m"))
>>> +        (match_operand 1))
>>> +    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
>>> +-  "!TARGET_X32 && !ix86_indirect_branch_register"
>>> ++  "!TARGET_X32 && !TARGET_INDIRECT_BRANCH_REGISTER"
>>> +   "* return ix86_output_call_insn (insn, operands[0]);"
>>> +   [(set_attr "type" "call")])
>>> +
>>> +@@ -12058,7 +12061,7 @@
>>> +    (call (mem:QI (match_dup 0))
>>> +        (match_operand 3))]
>>> +   "!TARGET_X32
>>> +-   && !ix86_indirect_branch_register
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> +    && SIBLING_CALL_P (peep2_next_insn (1))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))=
"
>>> +@@ -12073,7 +12076,7 @@
>>> +    (call (mem:QI (match_dup 0))
>>> +        (match_operand 3))]
>>> +   "!TARGET_X32
>>> +-   && !ix86_indirect_branch_register
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> +    && SIBLING_CALL_P (peep2_next_insn (2))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))=
"
>>> +@@ -12171,7 +12174,7 @@
>>> +         (match_operand:W 1 "memory_operand"))
>>> +    (set (pc) (match_dup 0))]
>>> +   "!TARGET_X32
>>> +-   && !ix86_indirect_branch_register
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> +    && peep2_reg_dead_p (2, operands[0])"
>>> +   [(set (pc) (match_dup 1))])
>>> +
>>> +@@ -12229,7 +12232,10 @@
>>> +                         (match_operand:SI 1 "register_no_elim_operand=
"
>>> "U")
>>> +                         (match_operand:SI 2 "GOT32_symbol_operand")))=
)
>>> +        (match_operand 3)))]
>>> +-  "!TARGET_MACHO && !TARGET_64BIT && SIBLING_CALL_P (insn)"
>>> ++  "!TARGET_MACHO
>>> ++   && !TARGET_64BIT
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> ++   && SIBLING_CALL_P (insn)"
>>> + {
>>> +   rtx fnaddr =3D gen_rtx_PLUS (Pmode, operands[1], operands[2]);
>>> +   fnaddr =3D gen_const_mem (Pmode, fnaddr);
>>> +@@ -12250,7 +12256,7 @@
>>> +       (call (mem:QI (match_operand:W 1 "memory_operand" "m"))
>>> +             (match_operand 2)))
>>> +    (unspec [(const_int 0)] UNSPEC_PEEPSIB)]
>>> +-  "!TARGET_X32 && !ix86_indirect_branch_register"
>>> ++  "!TARGET_X32 && !TARGET_INDIRECT_BRANCH_REGISTER"
>>> +   "* return ix86_output_call_insn (insn, operands[1]);"
>>> +   [(set_attr "type" "callv")])
>>> +
>>> +@@ -12261,7 +12267,7 @@
>>> +    (call (mem:QI (match_dup 0))
>>> +                (match_operand 3)))]
>>> +   "!TARGET_X32
>>> +-   && !ix86_indirect_branch_register
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> +    && SIBLING_CALL_P (peep2_next_insn (1))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))=
"
>>> +@@ -12278,7 +12284,7 @@
>>> +       (call (mem:QI (match_dup 0))
>>> +             (match_operand 3)))]
>>> +   "!TARGET_X32
>>> +-   && !ix86_indirect_branch_register
>>> ++   && !TARGET_INDIRECT_BRANCH_REGISTER
>>> +    && SIBLING_CALL_P (peep2_next_insn (2))
>>> +    && !reg_mentioned_p (operands[0],
>>> +                       CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))=
"
>>> +diff --git a/gcc/config/i386/predicates.md b/gcc/config/i386/
>>> predicates.md
>>> +index d1f0a7d..5f8a98f 100644
>>> +--- a/gcc/config/i386/predicates.md
>>> ++++ b/gcc/config/i386/predicates.md
>>> +@@ -593,7 +593,7 @@
>>> + ;; Test for a valid operand for indirect branch.
>>> + (define_predicate "indirect_branch_operand"
>>> +   (ior (match_operand 0 "register_operand")
>>> +-       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
>>> +           (not (match_test "TARGET_X32"))
>>> +           (match_operand 0 "memory_operand"))))
>>> +
>>> +@@ -637,7 +637,7 @@
>>> +   (ior (match_test "constant_call_address_operand
>>> +                    (op, mode =3D=3D VOIDmode ? mode : Pmode)")
>>> +        (match_operand 0 "call_register_no_elim_operand")
>>> +-       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
>>> +           (ior (and (not (match_test "TARGET_X32"))
>>> +                     (match_operand 0 "memory_operand"))
>>> +                (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +@@ -648,7 +648,7 @@
>>> +   (ior (match_test "constant_call_address_operand
>>> +                    (op, mode =3D=3D VOIDmode ? mode : Pmode)")
>>> +        (match_operand 0 "register_no_elim_operand")
>>> +-       (and (not (match_test "ix86_indirect_branch_register"))
>>> ++       (and (not (match_test "TARGET_INDIRECT_BRANCH_REGISTER"))
>>> +           (ior (and (not (match_test "TARGET_X32"))
>>> +                     (match_operand 0 "sibcall_memory_operand"))
>>> +                (and (match_test "TARGET_X32 && Pmode =3D=3D DImode")
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +index 60d0988..6e94d2c 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-1.c
>>> +@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +index aac7516..3c46707 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-2.c
>>> +@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +index 9e24a38..2c7fb52 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-3.c
>>> +@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +index 127b5d9..0d3f895 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-4.c
>>> +@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +index fcaa18d..fb26c00 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-5.c
>>> +@@ -9,8 +9,10 @@ foo (void)
>>> +   bar ();
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +index e464928..aa03fbd 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-6.c
>>> +@@ -10,9 +10,13 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target x32 } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> + /* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +index 17c2d0f..3c72036 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-7.c
>>> +@@ -35,9 +35,8 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" {
>>> target *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +index 9194ccf..7106407 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-1.c
>>> +@@ -14,9 +14,8 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +index e51f261..27c7e5b 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-2.c
>>> +@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +index 4aeec18..89a2bac 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-3.c
>>> +@@ -14,10 +14,9 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> + /* { dg-final { scan-assembler {\tlfence} } } */
>>> + /* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +index ac0e599..3eb83c3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-4.c
>>> +@@ -13,10 +13,9 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> + /* { dg-final { scan-assembler {\tlfence} } } */
>>> + /* { dg-final { scan-assembler-not "__x86_indirect_thunk" } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +index 573cf1e..0098dd1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-5.c
>>> +@@ -14,9 +14,8 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +index b2b37fc..ece8de1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-6.c
>>> +@@ -13,9 +13,8 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +index 4a43e19..d53fc88 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-attr-7.c
>>> +@@ -36,9 +36,8 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" {
>>> target *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +index ac84ab6..73d16ba 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-1.c
>>> +@@ -10,9 +10,9 @@ foo (void)
>>> +   dispatch (buf);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> +-/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd_rax" { target lp64 } } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[
>>> \t\]*__x86_indirect_thunk_bnd_eax" { target ia32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "bnd ret" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +index ce655e8..856751a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-2.c
>>> +@@ -11,10 +11,8 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "pushq\[ \t\]%rax" { target x32 } } } =
*/
>>> +-/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> +-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[
>>> \t\]*__x86_indirect_thunk_bnd_(r|e)ax" } } */
>>> + /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "bnd ret" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +index d34485a..42312f6 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-3.c
>>> +@@ -10,8 +10,9 @@ foo (void)
>>> +   bar (buf);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd" } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "bnd jmp\[
>>> \t\]*__x86_indirect_thunk_bnd_rax" { target lp64 } } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[
>>> \t\]*__x86_indirect_thunk_bnd_eax" { target ia32 } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "bnd call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "bnd ret" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +index 0e19830..c8ca102 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-bnd-4.c
>>> +@@ -11,10 +11,9 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*__x86_indirect_thunk" =
}
>>> } */
>>> +-/* { dg-final { scan-assembler "bnd jmp\[ \t\]*\.LIND" } } */
>>> +-/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 2 } } *=
/
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "bnd call\[
>>> \t\]*__x86_indirect_thunk_bnd_(r|e)ax" } } */
>>> ++/* { dg-final { scan-assembler-times "bnd call\[ \t\]*\.LIND" 1 } } *=
/
>>> + /* { dg-final { scan-assembler "bnd ret" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> + /* { dg-final { scan-assembler {\tlfence} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +index 579441f..c09dd0a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-1.c
>>> +@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +index c92e6f2..826425a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-2.c
>>> +@@ -11,9 +11,8 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +index d9964c2..3856268 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-3.c
>>> +@@ -12,9 +12,8 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> ++/* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> ++/* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +index d4dca4d..1ae49b1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-4.c
>>> +@@ -12,9 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 { target {
>>> ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 { target =
{
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +index 5c07e02..5328239 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-5.c
>>> +@@ -9,8 +9,10 @@ foo (void)
>>> +   bar ();
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +index 3eb4406..8ae4348 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-6.c
>>> +@@ -10,8 +10,8 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> +-/* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 1 } } */
>>> +-/* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 1 } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" } } =
*/
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +index aece938..2b9a33e 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-extern-7.c
>>> +@@ -35,9 +35,8 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> { target x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" {
>>> target *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk_(r|e)=
ax"
>>> } } */
>>> + /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-not "call\[ \t\]*\.LIND" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +index 3aba5e8..869d904 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-1.c
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch(offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +index 0f0181d..c5c16ed 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-2.c
>>> +@@ -11,7 +11,7 @@ male_indirect_jump (long offset)
>>> +   dispatch[offset](offset);
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +index 2eef6f3..4a63ebe 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-3.c
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +index e825a10..a395ffc 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-4.c
>>> +@@ -12,7 +12,7 @@ male_indirect_jump (long offset)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?dispatch" {
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?dispatch" { targe=
t
>>> *-*-linux* } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +index c6d77e1..21cbfd3 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-5.c
>>> +@@ -9,7 +9,8 @@ foo (void)
>>> +   bar ();
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +index 6454827..d1300f1 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-6.c
>>> +@@ -10,7 +10,8 @@ foo (void)
>>> +   return 0;
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" } } */
>>> ++/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*bar@GOT" { target
>>> x32 } } } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*bar@GOT" { target {
>>> ! x32 } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +index c67066c..ea00924 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/indirect-thunk-inline-7.c
>>> +@@ -35,8 +35,8 @@ bar (int i)
>>> +     }
>>> + }
>>> +
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" =
{
>>> target { { ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%" {
>>> target *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%(r|e)ax" } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler {\tpause} } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +index e6fea84..af9023a 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-10.c
>>> +@@ -15,9 +15,6 @@ foo (void)
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> + /* { dg-final { scan-assembler-times {\tpause} 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tlfence} 2 } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +index e239ec4..ba467c5 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-11.c
>>> +@@ -15,9 +15,6 @@ foo (void)
>>> + /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +index fa31813..43e57ca 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-12.c
>>> +@@ -15,8 +15,6 @@ foo (void)
>>> + /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk:" { target { !
>>> x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" {
>>> target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler "__x86_indirect_thunk_(r|e)ax:" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +index fd5b41f..55f156c 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-13.c
>>> +@@ -14,9 +14,8 @@ foo (void)
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*__x86_return_thunk" } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 2 } } */
>>> + /* { dg-final { scan-assembler-times {\tlfence} 2 } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> + /* { dg-final { scan-assembler-times "jmp\[ \t\]*\.LIND" 3 } } */
>>> + /* { dg-final { scan-assembler-times "call\[ \t\]*\.LIND" 3 } } */
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_indirect_thunk" =
}
>>> } */
>>> +-/* { dg-final { scan-assembler-not "call\[
>>> \t\]*__x86_indirect_thunk_(r|e)ax" { target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler-not "call\[
>>> \t\]*__x86_indirect_thunk_(r|e)ax" } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +index d606373..1c79043 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-14.c
>>> +@@ -16,7 +16,6 @@ foo (void)
>>> + /* { dg-final { scan-assembler-not "jmp\[ \t\]*__x86_return_thunk" } =
}
>>> */
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } }  } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +index 75e45e2..58aba31 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-15.c
>>> +@@ -16,7 +16,6 @@ foo (void)
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler-times {\tpause} 1 } } */
>>> + /* { dg-final { scan-assembler-times {\tlfence} 1 } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target x32 } } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +diff --git a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +index d1db41c..d2df8b8 100644
>>> +--- a/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> ++++ b/gcc/testsuite/gcc.target/i386/ret-thunk-9.c
>>> +@@ -14,11 +14,8 @@ foo (void)
>>> + /* { dg-final { scan-assembler "jmp\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "call\[ \t\]*\.LIND" } } */
>>> + /* { dg-final { scan-assembler "__x86_indirect_thunk:" } } */
>>> +-/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } }
>>> } } */
>>> +-/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } =
}
>>> } } */
>>> +-/* { dg-final { scan-assembler "push(?:l|q)\[ \t\]*_?bar" { target { =
{
>>> ! x32 } && *-*-linux* } } } } */
>>> +-/* { dg-final { scan-assembler "jmp\[ \t\]*__x86_indirect_thunk" {
>>> target { ! x32 } } } } */
>>> +-/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } }
>>> } */
>>> +-/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } =
}
>>> } */
>>> +-/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> { target { x32 } } } } */
>>> +-/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" { target x32 } =
}
>>> } */
>>> ++/* { dg-final { scan-assembler "mov(?:l|q)\[ \t\]*_?bar" { target
>>> *-*-linux* } } } */
>>> ++/* { dg-final { scan-assembler-times {\tpause} 2 } } */
>>> ++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */
>>> ++/* { dg-final { scan-assembler "call\[ \t\]*__x86_indirect_thunk_(r|e=
)ax"
>>> } } */
>>> ++/* { dg-final { scan-assembler-not "pushq\[ \t\]%rax" } } */
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hac=
k.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0013-64-bit-multilib-hack=
.
>>> patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.
>>> patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.pa=
tch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0014-optional-libstdc.pat=
c
>>> h
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_RE=
LAX_PIC_CALLS-bit.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RE
>>> LAX_PIC_CALLS-bit.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0015-gcc-disable-MASK_REL=
A
>>> X_PIC_CALLS-bit.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELA
>>> X_PIC_CALLS-bit.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS=
.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0016-COLLECT_GCC_OPTIONS.=
p
>>> atch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.p
>>> atch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-
>>> in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0017-Use-the-defaults.h-i=
n
>>> -B-instead-of-S-and-t-oe-in-B.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in
>>> -B-instead-of-S-and-t-oe-in-B.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compi=
le-hack.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compi
>>> le-hack.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0018-fortran-cross-compil=
e
>>> -hack.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile
>>> -hack.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.p=
atch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0019-cpp-honor-sysroot.pa=
t
>>> ch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patc=
h
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N=
64-ABI.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patc=
h
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0020-MIPS64-Default-to-N6=
4
>>> -ABI.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64
>>> -ABI.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMI
>>> C_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0021-Define-GLIBC_DYNAMIC=
_
>>> LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_
>>> LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-li=
st-too-long-error.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-li
>>> st-too-long-error.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0022-gcc-Fix-argument-lis=
t
>>> -too-long-error.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list
>>> -too-long-error.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0023-Disable-sdt.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0024-libtool.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-
>>> v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0025-gcc-armv4-pass-fix-v=
4
>>> bx-to-linker-to-support-EABI.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4
>>> bx-to-linker-to-support-EABI.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-co
>>> nfig-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0026-Use-the-multilib-con=
f
>>> ig-files-from-B-instead-of-usin.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-conf
>>> ig-files-from-B-instead-of-usin.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-
>>> from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0027-Avoid-using-libdir-f=
r
>>> om-.la-which-usually-points-to-.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-fr
>>> om-.la-which-usually-points-to-.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0028-export-CPP.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-
>>> generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0029-Enable-SPE-AltiVec-g=
e
>>> neration-on-powepc-linux-target.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-ge
>>> neration-on-powepc-linux-target.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILI
>>> B_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0030-Disable-the-MULTILIB=
_
>>> OSDIRNAMES-and-other-multilib-o.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_
>>> OSDIRNAMES-and-other-multilib-o.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-h=
eaders-can-be-included.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-h
>>> eaders-can-be-included.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0031-Ensure-target-gcc-he=
a
>>> ders-can-be-included.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-hea
>>> ders-can-be-included.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build
>>> -with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0032-gcc-4.8-won-t-build-=
w
>>> ith-disable-dependency-tracking.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-w
>>> ith-disable-dependency-tracking.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-d
>>> irectory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0033-Don-t-search-host-di=
r
>>> ectory-during-relink-if-inst_pr.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-dir
>>> ectory-during-relink-if-inst_pr.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-
>>> replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0034-Use-SYSTEMLIBS_DIR-r=
e
>>> placement-instead-of-hardcoding.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-re
>>> placement-instead-of-hardcoding.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support=
-for-musl-ldso.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support
>>> -for-musl-ldso.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0035-aarch64-Add-support-=
f
>>> or-musl-ldso.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-f
>>> or-musl-ldso.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s=
-install-path-and-rpath.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s
>>> -install-path-and-rpath.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0036-libcc1-fix-libcc1-s-=
i
>>> nstall-path-and-rpath.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-i
>>> nstall-path-and-rpath.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-supp=
ort-for-nativesdk-gcc.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-supp
>>> ort-for-nativesdk-gcc.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0037-handle-sysroot-suppo=
r
>>> t-for-nativesdk-gcc.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-suppor
>>> t-for-nativesdk-gcc.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysro
>>> ot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0038-Search-target-sysroo=
t
>>> -gcc-version-specific-dirs-with.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot
>>> -gcc-version-specific-dirs-with.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BU
>>> ILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0039-Fix-various-_FOR_BUI=
L
>>> D-and-related-variables.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUIL
>>> D-and-related-variables.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_D=
YNAMIC_LINKER.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_D
>>> YNAMIC_LINKER.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0040-nios2-Define-MUSL_DY=
N
>>> AMIC_LINKER.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYN
>>> AMIC_LINKER.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-t
>>> o-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to=
-
>>> link-commandline-for-musl-targe.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0041-Add-ssp_nonshared-to-
>>> link-commandline-for-musl-targe.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-=
ffile-prefix-map-old-new.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-
>>> ffile-prefix-map-old-new.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0042-gcc-libcpp-support-f=
f
>>> ile-prefix-map-old-new.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ff
>>> ile-prefix-map-old-new.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix
>>> -map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0043-Reuse-fdebug-prefix-=
m
>>> ap-to-replace-ffile-prefix-map.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-m
>>> ap-to-replace-ffile-prefix-map.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-
>>> prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0044-gcc-final.c-fdebug-p=
r
>>> efix-map-support-to-remap-sourc.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-pr
>>> efix-map-support-to-remap-sourc.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-=
use-ldbl-128-on-ppc.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-
>>> use-ldbl-128-on-ppc.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0045-libgcc-Add-knob-to-u=
s
>>> e-ldbl-128-on-ppc.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-us
>>> e-ldbl-128-on-ppc.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-L
>>> DFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0046-Link-libgcc-using-LD=
F
>>> LAGS-not-just-SHLIB_LDFLAGS.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDF
>>> LAGS-not-just-SHLIB_LDFLAGS.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-
>>> for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gc
>>> c-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-f=
o
>>> r-__cpu_indicator_init-instead-.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-fo
>>> r-__cpu_indicator_init-instead-.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-w=
ith-musl.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-w
>>> ith-musl.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-wi=
t
>>> h-musl.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-wit
>>> h-musl.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags=
.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0054_all_nopie-all-flags.=
p
>>> atch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.p
>>> atch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.pa=
tch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.pat=
c
>>> h
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
>>> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
>>> b/meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-6131.patch
>>> similarity index 89%
>>> rename from meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
>>> rename to meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-6131.patch
>>> index e873cc6..68d0dee 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
>>> +++ b/meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-6131.patch
>>> @@ -41,27 +41,31 @@ diff --git a/libiberty/ChangeLog
>>> b/libiberty/ChangeLog
>>>  index 240138f..adf1d72 100644
>>>  --- a/libiberty/ChangeLog
>>>  +++ b/libiberty/ChangeLog
>>> -@@ -1,3 +1,20 @@
>>> +@@ -2,6 +2,23 @@
>>> +
>>> +        * GCC 6.4.0 released.
>>> +
>>>  +2016-08-04  Marcel B=C3=B6hme  <boehme.marcel@gmail.com>
>>>  +
>>> -+      PR c++/71696
>>> -+      * cplus-dem.c: Prevent infinite recursion when there is a cycle
>>> -+      in the referencing of remembered mangled types.
>>> -+      (work_stuff): New stack to keep track of the remembered mangled
>>> -+      types that are currently being processed.
>>> -+      (push_processed_type): New method to push currently processed
>>> -+      remembered type onto the stack.
>>> -+      (pop_processed_type): New method to pop currently processed
>>> -+      remembered type from the stack.
>>> -+      (work_stuff_copy_to_from): Copy values of new variables.
>>> -+      (delete_non_B_K_work_stuff): Free stack memory.
>>> -+      (demangle_args): Push/Pop currently processed remembered type.
>>> -+      (do_type): Do not demangle a cyclic reference and push/pop
>>> -+      referenced remembered type.
>>> ++       PR c++/71696
>>> ++       * cplus-dem.c: Prevent infinite recursion when there is a cycl=
e
>>> ++       in the referencing of remembered mangled types.
>>> ++       (work_stuff): New stack to keep track of the remembered mangle=
d
>>> ++       types that are currently being processed.
>>> ++       (push_processed_type): New method to push currently processed
>>> ++       remembered type onto the stack.
>>> ++       (pop_processed_type): New method to pop currently processed
>>> ++       remembered type from the stack.
>>> ++       (work_stuff_copy_to_from): Copy values of new variables.
>>> ++       (delete_non_B_K_work_stuff): Free stack memory.
>>> ++       (demangle_args): Push/Pop currently processed remembered type.
>>> ++       (do_type): Do not demangle a cyclic reference and push/pop
>>> ++       referenced remembered type.
>>>  +
>>>   2016-12-21  Release Manager
>>>
>>> -       * GCC 6.3.0 released.
>>> +        * GCC 6.3.0 released.
>>> +
>>>  diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
>>>  index 7514e57..f21e630 100644
>>>  --- a/libiberty/cplus-dem.c
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-cross_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-cross_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-cross_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-crosssdk_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-runtime_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-sanitizers_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc-source_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc-source_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc-source_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc-source_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/gcc_6.3.bb
>>> b/meta/recipes-devtools/gcc/gcc_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/gcc_6.3.bb
>>> rename to meta/recipes-devtools/gcc/gcc_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
>>> b/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/libgcc-initial_6.3.bb
>>> rename to meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/libgcc_6.3.bb
>>> b/meta/recipes-devtools/gcc/libgcc_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/libgcc_6.3.bb
>>> rename to meta/recipes-devtools/gcc/libgcc_6.4.bb
>>> diff --git a/meta/recipes-devtools/gcc/libgfortran_6.3.bb
>>> b/meta/recipes-devtools/gcc/libgfortran_6.4.bb
>>> similarity index 100%
>>> rename from meta/recipes-devtools/gcc/libgfortran_6.3.bb
>>> rename to meta/recipes-devtools/gcc/libgfortran_6.4.bb
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>

--001a114a4cfa0acb0f0566951230
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>And the same with</div><div>meta/recipes-devtools/gcc=
/gcc-6.4/CVE-2016-4490.patch<br></div><div>which isn&#39;t included in SRC_=
URI since:</div><div><br></div><div>commit 41ce4b438795108025c79cd3eec06736=
7d53623e</div><div>Author: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Tue Aug 16 11:50:=
35 2016 -0700</div><div><br></div><div>=C2=A0 =C2=A0 gcc: Upgrade to 6.2 RC=
1</div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Sun, Mar 4, 2018 at 1:00 PM, Martin Jansa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div>Also</div><div>meta/recipes-devtools/gcc/gcc-<wbr>6.4/0048-AR=
M-PR-target-71056-<wbr>Don-t-use-vectorized-builtins-<wbr>wh.patch</div><di=
v>added in this patch doesn&#39;t seem to be used anywhere.</div><div><br><=
/div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Sun, Mar 4, 2018 at 12:38 PM, Martin Jansa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">Is this backport of=C2=A0</span><a href=
=3D"https://patches.openembedded.org/patch/144961/" style=3D"color:rgb(17,8=
5,204);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255)" target=3D"_b=
lank">https://patches.openembedde<wbr>d.org/patch/144961/</a><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline"><span>=C2=A0</span>?</span><br><div><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
><br></span></div><div><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">If yes, why does it have =
different author?</span></div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Sun, Mar 4, 2018 at 12:23 PM, Richard Purdie <span di=
r=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">From: Juro Bystricky &lt;<a href=3D"mailto=
:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&g=
t;<br>
<br>
Changed BINV and PV to 6.4.0<br>
Modified BASEURI to load xz tarball instead of bz2<br>
<br>
Backported series of patches from <a href=3D"https://github.com/hjl-tools/g=
cc.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/hjl-tools/g=
<wbr>cc.git</a><br>
branch /hjl/indirect/gcc-6-branch/mas<wbr>ter which contains<br>
an IA patch series for security related issues<br>
<br>
ubsan-fix-check-empty-string.p<wbr>atch : removed, already applied<br>
CVE-2016-6131.patch: Modified ChangeLog hunk to apply<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org</a>&=
gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmo<wbr>de-default.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../gcc/gcc-6.3/ubsan-fix-che<wbr>ck-empty-string.patch |=C2=A0 =C2=
=A028 -<br>
=C2=A0.../gcc/{gcc-6.3.inc =3D&gt; gcc-6.4.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +-<br>
=C2=A0.../0001-gcc-4.3.1-ARCH_FLAGS<wbr>_FOR_TARGET.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...ove-struct-ix86_frame-to-m<wbr>achine_function.patch |=C2=A0 244 +=
++<br>
=C2=A0...ference-of-struct-ix86_fra<wbr>me-to-avoid-cop.patch |=C2=A0 =C2=
=A071 +<br>
=C2=A0.../{gcc-6.3 =3D&gt; gcc-6.4}/0002-uclibc-conf.patc<wbr>h=C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../0003-gcc-uclibc-locale-ct<wbr>ype_touplow_t.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 0<br>
=C2=A0...nst-reference-of-struct-ix<wbr>86_frame-to-avo.patch |=C2=A0 128 +=
+<br>
=C2=A0.../{gcc-6.3 =3D&gt; gcc-6.4}/<a href=3D"http://0004-uclibc-locale.pa=
" target=3D"_blank">0004-uclibc-locale.pa</a><wbr>tch=C2=A0 |=C2=A0 =C2=A0 =
0<br>
=C2=A0.../gcc-6.4/0004-x86-Add-mind<wbr>irect-branch.patch=C2=A0 =C2=A0 | 2=
151 ++++++++++++++++++++<br>
=C2=A0.../0005-uclibc-locale-no__x.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc-6.4/0005-x86-Add-mfun<wbr>ction-return.patch=C2=A0 =C2=A0 | 1=
567 ++++++++++++++<br>
=C2=A0.../0006-uclibc-locale-wchar_<wbr>fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../0006-x86-Add-mindirect-br<wbr>anch-register.patch=C2=A0 =C2=A0|=
=C2=A0 943 +++++++++<br>
=C2=A0.../0007-uclibc-locale-update<wbr>.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../0007-x86-Add-V-register-o<wbr>perand-modifier.patch |=C2=A0 136 +=
+<br>
=C2=A0.../0008-missing-execinfo_h.p<wbr>atch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0...w-mindirect-branch-mfuncti<wbr>on-return-with-.patch |=C2=A0 301 +=
++<br>
=C2=A0...VALID_REGNUM-in-indirect-t<wbr>hunk-processing.patch |=C2=A0 123 +=
+<br>
=C2=A0.../{gcc-6.3 =3D&gt; gcc-6.4}/0009-c99-snprintf.pat<wbr>ch=C2=A0 =C2=
=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../0010-gcc-poison-system-di<wbr>rectories.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...INVALID_REGNUM-as-invalid-<wbr>register-number.patch |=C2=A0 =C2=
=A043 +<br>
=C2=A0.../0011-gcc-poison-dir-exten<wbr>d.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...date-mfunction-return-for-<wbr>return-with-pop.patch |=C2=A0 450 +=
+++<br>
=C2=A0.../0012-gcc-4.3.3-SYSROOT_CF<wbr>LAGS_FOR_TARGET.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-i386-Add-TARGET_INDIRECT_<wbr>BRANCH_REGISTER.patch | 1001 ++++++=
+++<br>
=C2=A0.../0013-64-bit-multilib-hack<wbr>.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../0014-optional-libstdc.pat<wbr>ch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0...0015-gcc-disable-MASK_RELA<wbr>X_PIC_CALLS-bit.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../0016-COLLECT_GCC_OPTIONS.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...efaults.h-in-B-instead-of-<wbr>S-and-t-oe-in-B.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../0018-fortran-cross-compil<wbr>e-hack.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../<a href=3D"http://0019-cpp-honor-sysroot.pa" target=3D"_blank">00=
19-cpp-honor-sysroot.pa</a><wbr>tch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../0020-MIPS64-Default-to-N6<wbr>4-ABI.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...C_DYNAMIC_LINKER-and-UCLIB<wbr>C_DYNAMIC_LINKE.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...0022-gcc-Fix-argument-list<wbr>-too-long-error.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../{gcc-6.3 =3D&gt; gcc-6.4}/0023-Disable-sdt.patc<wbr>h=C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{gcc-6.3 =3D&gt; gcc-6.4}/0024-libtool.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 0<br>
=C2=A0...4-pass-fix-v4bx-to-linker-<wbr>to-support-EABI.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...tilib-config-files-from-B-<wbr>instead-of-usin.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-libdir-from-.la-which-usu<wbr>ally-points-to-.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../gcc/{gcc-6.3 =3D&gt; gcc-6.4}/0028-export-CPP.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...AltiVec-generation-on-powe<wbr>pc-linux-target.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-MULTILIB_OSDIRNAMES-and-o<wbr>ther-multilib-o.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...Ensure-target-gcc-headers-<wbr>can-be-included.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-t-build-with-disable-depe<wbr>ndency-tracking.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...h-host-directory-during-re<wbr>link-if-inst_pr.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...IBS_DIR-replacement-instea<wbr>d-of-hardcoding.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../0035-aarch64-Add-support-<wbr>for-musl-ldso.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 0<br>
=C2=A0...ibcc1-fix-libcc1-s-install<wbr>-path-and-rpath.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-handle-sysroot-support-fo<wbr>r-nativesdk-gcc.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...et-sysroot-gcc-version-spe<wbr>cific-dirs-with.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-various-_FOR_BUILD-and-re<wbr>lated-variables.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../0040-nios2-Define-MUSL_DY<wbr>NAMIC_LINKER.patch=C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 0<br>
=C2=A0...shared-to-link-commandline<wbr>-for-musl-targe.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...c-libcpp-support-ffile-pre<wbr>fix-map-old-new.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...ug-prefix-map-to-replace-f<wbr>file-prefix-map.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...-fdebug-prefix-map-support<wbr>-to-remap-sourc.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...45-libgcc-Add-knob-to-use-<wbr>ldbl-128-on-ppc.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...bgcc-using-LDFLAGS-not-jus<wbr>t-SHLIB_LDFLAGS.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0...e-alias-for-__cpu_indicato<wbr>r_init-instead-.patch |=C2=A0 =C2=
=A0 0<br>
=C2=A0.../0048-sync-gcc-stddef.h-wi<wbr>th-musl.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../0054_all_nopie-all-flags.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../0055-unwind_h-glibc26.pat<wbr>ch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{gcc-6.3 =3D&gt; gcc-6.4}/CVE-2016-6131.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A036 +-<br>
=C2=A0...<a href=3D"http://s-canadian_6.3.bb" rel=3D"noreferrer" target=3D"=
_blank">s-canadian_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_=
6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_6.4.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
=C2=A0...<a href=3D"http://oss-initial_6.3.bb" rel=3D"noreferrer" target=3D=
"_blank">oss-initial_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-cross-initial=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_6.4.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-cross_6.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-cross_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-cross_6.4.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-cross_6.4.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...-<a href=3D"http://initial_6.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">initial_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_6.4.bb</a>} =
|=C2=A0 =C2=A0 0<br>
=C2=A0.../{<a href=3D"http://gcc-crosssdk_6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-crosssdk_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_=
6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_6.4.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-runtime_6.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-runtime=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_6.4.bb</a>} |=C2=
=A0 =C2=A0 0<br>
=C2=A0...<a href=3D"http://gcc-sanitizers_6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-sanitizers_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-sanitiz=
ers_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_6.4.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://gcc-source_6.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-source_6.3.bb</a> =3D&gt; <a href=3D"http://gcc-source_6.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_6.4.bb</a>}=C2=A0 =C2=
=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_6.3.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc_6.3.bb</a> =3D&gt; <a href=3D"http://gcc_6.4.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc_6.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0...<a href=3D"http://libgcc-initial_6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc-initial_6.3.bb</a> =3D&gt; <a href=3D"http://libgcc-init=
ial_6.4.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_6.4.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_6.3.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_6.3.bb</a> =3D&gt; <a href=3D"http://libgcc_6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_6.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://libgfortran_6.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_6.3.bb</a> =3D&gt; <a href=3D"http://libgfortran=
_6.4.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_6.4.bb</a>} |=C2=
=A0 =C2=A0 0<br>
=C2=A078 files changed, 7198 insertions(+), 52 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.3/ubsan-fix-c=
heck-empty-stri<wbr>ng.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3.inc =3D&gt; gcc-6.4.in=
c} (81%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0001-=
gcc-4.3.1-ARCH_F<wbr>LAGS_FOR_TARGET.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0001-i386-M=
ove-struct-ix86<wbr>_frame-to-machine_function.pat<wbr>ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0002-i386-U=
se-reference-of<wbr>-struct-ix86_frame-to-avoid-co<wbr>p.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0002-=
uclibc-conf.patc<wbr>h (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0003-=
gcc-uclibc-local<wbr>e-ctype_touplow_t.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0003-i386-U=
se-const-refere<wbr>nce-of-struct-ix86_frame-to-av<wbr>o.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/<a hr=
ef=3D"http://0004-uclibc-locale.pa" target=3D"_blank">0004-uclibc-locale.pa=
</a><wbr>tch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0004-x86-Ad=
d-mindirect-bra<wbr>nch.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0005-=
uclibc-locale-no<wbr>__x.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0005-x86-Ad=
d-mfunction-ret<wbr>urn.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0006-=
uclibc-locale-wc<wbr>har_fix.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0006-x86-Ad=
d-mindirect-bra<wbr>nch-register.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0007-=
uclibc-locale-up<wbr>date.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0007-x86-Ad=
d-V-register-op<wbr>erand-modifier.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0008-=
missing-execinfo<wbr>_h.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0008-x86-Di=
sallow-mindirec<wbr>t-branch-mfunction-return-with<wbr>-.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0009-Use-IN=
VALID_REGNUM-in<wbr>-indirect-thunk-processing.pat<wbr>ch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0009-=
c99-snprintf.pat<wbr>ch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0010-=
gcc-poison-syste<wbr>m-directories.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0010-i386-P=
ass-INVALID_REG<wbr>NUM-as-invalid-register-number<wbr>.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0011-=
gcc-poison-dir-e<wbr>xtend.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0011-i386-U=
pdate-mfunction<wbr>-<a href=3D"http://return-for-return-with-pop.pa">retur=
n-for-return-with-pop.pa</a><wbr>tch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0012-=
gcc-4.3.3-SYSROO<wbr>T_CFLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>6.4/0012-i386-A=
dd-TARGET_INDIR<wbr>ECT_BRANCH_REGISTER.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0013-=
64-bit-multilib-<wbr>hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0014-=
optional-libstdc<wbr>.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0015-=
gcc-disable-MASK<wbr>_RELAX_PIC_CALLS-bit.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0016-=
COLLECT_GCC_OPTI<wbr>ONS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0017-=
Use-the-defaults<wbr>.h-in-B-instead-of-S-and-t-oe-<wbr>in-B.patch (100%)<b=
r>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0018-=
fortran-cross-co<wbr>mpile-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0019-=
cpp-honor-sysroo<wbr>t.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0020-=
MIPS64-Default-t<wbr>o-N64-ABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0021-=
Define-GLIBC_DYN<wbr>AMIC_LINKER-and-UCLIBC_DYNAMIC<wbr>_LINKE.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0022-=
gcc-Fix-argument<wbr>-list-too-long-error.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0023-=
Disable-sdt.patc<wbr>h (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0024-=
libtool.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0025-=
gcc-armv4-pass-f<wbr>ix-v4bx-to-linker-to-support-E<wbr>ABI.patch (100%)<br=
>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0026-=
Use-the-multilib<wbr>-config-files-from-B-instead-o<wbr>f-usin.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0027-=
Avoid-using-libd<wbr>ir-from-.la-which-usually-poin<wbr>ts-to-.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0028-=
export-CPP.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0029-=
Enable-SPE-AltiV<wbr>ec-generation-on-powepc-linux-<wbr>target.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0030-=
Disable-the-MULT<wbr>ILIB_OSDIRNAMES-and-other-mult<wbr>ilib-o.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0031-=
Ensure-target-gc<wbr>c-headers-can-be-included.patc<wbr>h (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0032-=
gcc-4.8-won-t-bu<wbr>ild-with-disable-dependency-tr<wbr>acking.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0033-=
Don-t-search-hos<wbr>t-directory-during-relink-if-i<wbr>nst_pr.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0034-=
Use-SYSTEMLIBS_D<wbr>IR-replacement-instead-of-hard<wbr>coding.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0035-=
aarch64-Add-supp<wbr>ort-for-musl-ldso.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0036-=
libcc1-fix-libcc<wbr>1-s-install-path-and-rpath.pat<wbr>ch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0037-=
handle-sysroot-s<wbr>upport-for-nativesdk-gcc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0038-=
Search-target-sy<wbr>sroot-gcc-version-specific-dir<wbr>s-with.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0039-=
Fix-various-_FOR<wbr>_BUILD-and-related-variables.p<wbr>atch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0040-=
nios2-Define-MUS<wbr>L_DYNAMIC_LINKER.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0041-=
Add-ssp_nonshare<wbr>d-to-link-commandline-for-musl<wbr>-targe.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0042-=
gcc-libcpp-suppo<wbr><a href=3D"http://rt-ffile-prefix-map-old-new.pa">rt-f=
file-prefix-map-old-new.pa</a><wbr>tch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0043-=
Reuse-fdebug-pre<wbr>fix-map-to-replace-ffile-prefi<wbr>x-map.patch (100%)<=
br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0044-=
gcc-final.c-fdeb<wbr>ug-prefix-map-support-to-remap<wbr>-sourc.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0045-=
libgcc-Add-knob-<wbr>to-use-ldbl-128-on-ppc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0046-=
Link-libgcc-usin<wbr>g-LDFLAGS-not-just-SHLIB_LDFLA<wbr>GS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0047-=
libgcc_s-Use-ali<wbr>as-for-__cpu_indicator_init-in<wbr>stead-.patch (100%)=
<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0048-=
sync-gcc-stddef.<wbr>h-with-musl.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0054_=
all_nopie-all-fl<wbr>ags.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/0055-=
unwind_h-glibc26<wbr>.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc<wbr>-6.3 =3D&gt; gcc-6.4}/CVE-2=
016-6131.patch (89%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-cross-canadian_6.3.=
bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_6.4.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc-cross-canadian_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-initial=
_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-cross-initial_6.3.bb=
</a> =3D&gt; <a href=3D"http://gcc-cross-initial_6.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">gcc-cross-initial_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-cross_6.3.bb</a> =3D&gt; <a =
href=3D"http://gcc-cross_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-c=
ross_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk-init=
ial_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-crosssdk-initial_=
6.3.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_6.4.bb" rel=3D"no=
referrer" target=3D"_blank">gcc-crosssdk-initial_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_6.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-crosssdk_6.3.bb</a> =3D&g=
t; <a href=3D"http://gcc-crosssdk_6.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gcc-crosssdk_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_6.3.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-runtime_6.3.bb</a> =3D&gt;=
 <a href=3D"http://gcc-runtime_6.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>gcc-runtime_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_6.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-sanitizers_6.3.bb</a> =
=3D&gt; <a href=3D"http://gcc-sanitizers_6.4.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-sanitizers_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_6.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc<wbr>-source_6.3.bb</a> =3D&gt; <=
a href=3D"http://gcc-source_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gc=
c-source_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_6.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc<wbr>_6.3.bb</a> =3D&gt; <a href=3D"ht=
tp://gcc_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc_6.4.bb</a>} (100%=
)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_6.=
3.bb" rel=3D"noreferrer" target=3D"_blank">lib<wbr>gcc-initial_6.3.bb</a> =
=3D&gt; <a href=3D"http://libgcc-initial_6.4.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc-initial_6.4.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_6.3.bb" re=
l=3D"noreferrer" target=3D"_blank">lib<wbr>gcc_6.3.bb</a> =3D&gt; <a href=
=3D"http://libgcc_6.4.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_6.4.b=
b</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_6.3.b=
b" rel=3D"noreferrer" target=3D"_blank">lib<wbr>gfortran_6.3.bb</a> =3D&gt;=
 <a href=3D"http://libgfortran_6.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>libgfortran_6.4.bb</a>} (100%)<br>
<br>
diff --git a/meta/conf/distro/include/tcm<wbr>ode-default.inc b/meta/conf/d=
istro/include/tcm<wbr>ode-default.inc<br>
index 3db16e8..69cb762 100644<br>
--- a/meta/conf/distro/include/tcm<wbr>ode-default.inc<br>
+++ b/meta/conf/distro/include/tcm<wbr>ode-default.inc<br>
@@ -22,7 +22,7 @@ PREFERRED_PROVIDER_virtual/${T<wbr>ARGET_PREFIX}libc-init=
ial =3D &quot;${TCLIBC}-initial&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/na<wbr>tivesdk-${SDK_PREFIX}libc-init<wbr>=
ial ?=3D &quot;nativesdk-glibc-initial&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/ge<wbr>ttext ??=3D &quot;gettext&quot;<br>
<br>
-GCCVERSION ?=3D &quot;6.3%&quot;<br>
+GCCVERSION ?=3D &quot;6.4%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0BINUVERSION ?=3D &quot;2.28%&quot;<br>
=C2=A0GDBVERSION ?=3D &quot;7.12%&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/ubsan-fix-check-empty-s=
t<wbr>ring.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.3/ubsan-fix-check-e=
mpty-st<wbr>ring.patch<br>
deleted file mode 100644<br>
index c012719..0000000<br>
--- a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/ubsan-fix-check-empty-st<wbr>r=
ing.patch<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From 8db2cf6353c13f2a84cbe49b689654<wbr>897906c499 Mon Sep 17 00:00:00 200=
1<br>
-From: kyukhin &lt;kyukhin@138bc75d-0d04-0410-96<wbr>1f-82ee72b054a4&gt;<br=
>
-Date: Sat, 3 Sep 2016 10:57:05 +0000<br>
-Subject: [PATCH] gcc/=C2=A0 * ubsan.c (ubsan_use_new_style_p): Fix check f=
or empty<br>
- string.<br>
-<br>
-git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/trunk@239971" =
rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/<wbr>trunk@239971<=
/a> 138bc75d-0d04-0410-961f-82ee72<wbr>b054a4<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel.com" =
target=3D"_blank">joshua.g.lock@intel.com</a>&gt;<br>
-<br>
----<br>
- gcc/ubsan.c=C2=A0 =C2=A0| 2 +-<br>
- 2 files changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-Index: gcc-6.3.0/gcc/ubsan.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gcc-6.3.0.orig/gcc/ubsan.c<br>
-+++ gcc-6.3.0/gcc/ubsan.c<br>
-@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)<br>
-<br>
-=C2=A0 =C2=A0expanded_location xloc =3D expand_location (loc);<br>
-=C2=A0 =C2=A0if (xloc.file =3D=3D NULL || strncmp (xloc.file, &quot;\1&quo=
t;, 2) =3D=3D 0<br>
--=C2=A0 =C2=A0 =C2=A0 || xloc.file =3D=3D &#39;\0&#39; || xloc.file[0] =3D=
=3D &#39;\xff&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 || xloc.file[0] =3D=3D &#39;\0&#39; || xloc.file[0] =
=3D=3D &#39;\xff&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0|| xloc.file[1] =3D=3D &#39;\xff&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0return false;<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3.inc b/meta/recipes-devt=
ools/gcc/gc<wbr>c-6.4.inc<br>
similarity index 81%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3.inc<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4.inc<br>
index 5c81a33..3514587 100644<br>
--- a/meta/recipes-devtools/gcc/gc<wbr>c-6.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4.inc<br>
@@ -2,13 +2,13 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;6.3.0&quot;<br>
+PV =3D &quot;6.4.0&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;6.3.0&quot;<br>
+BINV =3D &quot;6.4.0&quot;<br>
<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-6.3:${FIL<wbr>E_DIRNAME}/gc=
c-6.3/backport:&quot;<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-6.4:${FIL<wbr>E_DIRNAME}/gc=
c-6.4/backport:&quot;<br>
<br>
=C2=A0DEPENDS =3D+ &quot;mpfr gmp libmpc zlib&quot;<br>
=C2=A0NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
&quot;<br>
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0&quot;<br>
<br>
<br>
-BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/g<wbr>cc-${PV}.tar.bz2&quot=
;<br>
+BASEURI ?=3D &quot;${GNU_MIRROR}/gcc/gcc-${PV}/g<wbr>cc-${PV}.tar.xz&quot;=
<br>
=C2=A0#SRCREV =3D &quot;bd9a826d5448db11d29d2ec5884e7<wbr>e679066f140&quot;=
<br>
=C2=A0#BASEURI ?=3D &quot;git://<a href=3D"http://github.com/gcc-mirror/gcc=
;branch=3Dgcc-6-branch;protocol=3Dgit" rel=3D"noreferrer" target=3D"_blank"=
>github.com/gcc-mirror/g<wbr>cc;branch=3Dgcc-6-branch;protoco<wbr>l=3Dgit</=
a>&quot;<br>
=C2=A0#BASEURI ?=3D &quot;<a href=3D"ftp://sourceware.org/pub/gcc/snapshots=
/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2" rel=3D"noreferrer" target=
=3D"_blank">ftp://sourceware.org/pub/gcc/<wbr>snapshots/6.2.0-RC-20160815/g=
c<wbr>c-6.2.0-RC-20160815.tar.bz2</a>&quot;<br>
@@ -85,10 +85,22 @@ SRC_URI =3D &quot;\<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2016-6131.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ubsan-fix-check-empty-<wbr=
>string.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-i386-Move-struct-<wbr=
>ix86_frame-to-machine_function<wbr>.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-i386-Use-referenc<wbr=
>e-of-struct-ix86_frame-to-avoi<wbr>d-cop.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-i386-Use-const-re<wbr=
>ference-of-struct-ix86_frame-t<wbr>o-avo.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-x86-Add-mindirect<wbr=
>-branch.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-x86-Add-mfunction<wbr=
>-return.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-x86-Add-mindirect<wbr=
>-branch-register.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-x86-Add-V-registe<wbr=
>r-operand-modifier.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-x86-Disallow-mind<wbr=
>irect-branch-mfunction-return-<wbr>with-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Use-INVALID_REGNU<wbr=
>M-in-indirect-thunk-processing<wbr>.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-i386-Pass-INVALID<wbr=
>_REGNUM-as-invalid-register-<wbr>number.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-i386-Update-mfunc<wbr=
>tion-return-for-return-with-po<wbr>p.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-i386-Add-TARGET_I<wbr=
>NDIRECT_BRANCH_REGISTER.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;677a7623c7ef6ab99881bc4e048de<wbr>bb6&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f06ae7f3f790fbf0f018f6d40e844<wbr>451e6bc3b7b=
c96e128e63b09825c1f<wbr>8b29f&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;11ba51a0cfb8471927f387c8895fe<wbr>232&quot;<br>
+SRC_URI[sha256sum] =3D &quot;850bf21eafdfe5cd5f6827148184c<wbr>08c4a0852a3=
7ccf36ce69855334d2c<wbr>914d4&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${P<wbr>V}-${PR}/gcc-${PV}&quot=
;<br>
=C2=A0#S =3D &quot;${TMPDIR}/work-shared/gcc-${P<wbr>V}-${PR}/git&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0001-gcc-4.3.1-ARCH_FLA=
G<wbr>S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0001-gcc-=
4.3.1-ARCH_FLAG<wbr>S_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0001-gcc-4.3.1-ARCH_FLAG=
S_<wbr>FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0001-gcc-4.3.1-ARCH_FLAGS_=
<wbr>FOR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0001-i386-Move-struct-i=
x<wbr>86_frame-to-machine_function.p<wbr>atch b/meta/recipes-devtools/gcc/g=
c<wbr>c-6.4/0001-i386-Move-struct-ix<wbr>86_frame-to-machine_function.p<wbr=
>atch<br>
new file mode 100644<br>
index 0000000..3c2a8db<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0001-i386-Move-struct-ix<wbr>8=
6_frame-to-machine_function.p<wbr>atch<br>
@@ -0,0 +1,244 @@<br>
+From c2c7775c5587dc59b6756162d390d8<wbr>9d60971a16 Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Mon, 15 Jan 2018 11:27:24 +0000<br>
+Subject: [PATCH 01/12] i386: Move struct ix86_frame to machine_function<br=
>
+<br>
+Make ix86_frame available to i386 code generation.=C2=A0 This is needed to=
<br>
+backport the patch set of -mindirect-branch=3D to mitigate variant #2 of<b=
r>
+the speculative execution vulnerabilities on x86 processors identified<br>
+by CVE-2017-5715, aka Spectre.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02017-06-01=C2=A0 Bernd Edlinger=C2=A0 &lt;<a hr=
ef=3D"mailto:bernd.edlinger@hotmail.de" target=3D"_blank">bernd.edlinger@ho=
tmail.de</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_frame): Moved to ...=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.h (ix86_frame): Here.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(machine_function): Add frame.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_compute_frame_layout=
): Repace the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0frame argument with &amp;cfun-&gt;machine-&gt;f=
rame.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_can_use_return_insn_p): Don&#39;t pass &a=
mp;frame to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_compute_frame_layout.=C2=A0 Copy frame fro=
m cfun-&gt;machine-&gt;frame.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_can_eliminate): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_expand_prologue): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_expand_epilogue): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_expand_split_stack_prol<wbr>ogue): Likewi=
se.<br>
+<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c | 68 ++++++++++--------------------<wbr>----------=
----------<br>
+ gcc/config/i386/i386.h | 53 ++++++++++++++++++++++++++++++<wbr>++++++++-<=
br>
+ 2 files changed, 65 insertions(+), 56 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 8b5faac..a1ff32b 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -2434,53 +2434,6 @@ struct GTY(()) stack_local_entry {<br>
+=C2=A0 =C2=A0struct stack_local_entry *next;<br>
+ };<br>
+<br>
+-/* Structure describing stack frame layout.<br>
+-=C2=A0 =C2=A0Stack grows downward:<br>
+-<br>
+-=C2=A0 =C2=A0[arguments]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- ARG_POINT=
ER<br>
+-=C2=A0 =C2=A0saved pc<br>
+-<br>
+-=C2=A0 =C2=A0saved static chain=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ix86_static_chain_on_stack<br>
+-<br>
+-=C2=A0 =C2=A0saved frame pointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if frame_pointer_needed<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- HARD_FRAM=
E_POINTER<br>
+-=C2=A0 =C2=A0[saved regs]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- regs_save=
_offset<br>
+-=C2=A0 =C2=A0[padding0]<br>
+-<br>
+-=C2=A0 =C2=A0[saved SSE regs]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- sse_regs_=
save_offset<br>
+-=C2=A0 =C2=A0[padding1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- FRAME_POI=
NTER<br>
+-=C2=A0 =C2=A0[va_arg registers]=C2=A0 |<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
+-=C2=A0 =C2=A0[frame]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
+-=C2=A0 =C2=A0[padding2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =3D to_allocate<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- STACK_POI=
NTER<br>
+-=C2=A0 */<br>
+-struct ix86_frame<br>
+-{<br>
+-=C2=A0 int nsseregs;<br>
+-=C2=A0 int nregs;<br>
+-=C2=A0 int va_arg_size;<br>
+-=C2=A0 int red_zone_size;<br>
+-=C2=A0 int outgoing_arguments_size;<br>
+-<br>
+-=C2=A0 /* The offsets relative to ARG_POINTER.=C2=A0 */<br>
+-=C2=A0 HOST_WIDE_INT frame_pointer_offset;<br>
+-=C2=A0 HOST_WIDE_INT hard_frame_pointer_offset;<br>
+-=C2=A0 HOST_WIDE_INT stack_pointer_offset;<br>
+-=C2=A0 HOST_WIDE_INT hfp_save_offset;<br>
+-=C2=A0 HOST_WIDE_INT reg_save_offset;<br>
+-=C2=A0 HOST_WIDE_INT sse_reg_save_offset;<br>
+-<br>
+-=C2=A0 /* When save_regs_using_mov is set, emit prologue using<br>
+-=C2=A0 =C2=A0 =C2=A0move instead of push instructions.=C2=A0 */<br>
+-=C2=A0 bool save_regs_using_mov;<br>
+-};<br>
+-<br>
+ /* Which cpu are we scheduling for.=C2=A0 */<br>
+ enum attr_cpu ix86_schedule;<br>
+<br>
+@@ -2572,7 +2525,7 @@ static unsigned int ix86_function_arg_boundary (mach=
ine_mode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const_tree);<br>
+ static rtx ix86_static_chain (const_tree, bool);<br>
+ static int ix86_function_regparm (const_tree, const_tree);<br>
+-static void ix86_compute_frame_layout (struct ix86_frame *);<br>
++static void ix86_compute_frame_layout (void);<br>
+ static bool ix86_expand_vector_init_one_no<wbr>nzero (bool, machine_mode,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 rtx, rtx, int);<br>
+ static void ix86_add_new_builtins (HOST_WIDE_INT);<br>
+@@ -10944,7 +10897,8 @@ ix86_can_use_return_insn_p (void)<br>
+=C2=A0 =C2=A0if (crtl-&gt;args.pops_args &amp;&amp; crtl-&gt;args.size &gt=
;=3D 32768)<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+-=C2=A0 ix86_compute_frame_layout (&amp;frame);<br>
++=C2=A0 ix86_compute_frame_layout ();<br>
++=C2=A0 frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0return (frame.stack_pointer_offset =3D=3D UNITS_PER_WORD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (frame.nregs + frame.nsseregs=
) =3D=3D 0);<br>
+ }<br>
+@@ -11355,8 +11309,8 @@ ix86_can_eliminate (const int from, const int to)<=
br>
+ HOST_WIDE_INT<br>
+ ix86_initial_elimination_offse<wbr>t (int from, int to)<br>
+ {<br>
+-=C2=A0 struct ix86_frame frame;<br>
+-=C2=A0 ix86_compute_frame_layout (&amp;frame);<br>
++=C2=A0 ix86_compute_frame_layout ();<br>
++=C2=A0 struct ix86_frame frame =3D cfun-&gt;machine-&gt;frame;<br>
+<br>
+=C2=A0 =C2=A0if (from =3D=3D ARG_POINTER_REGNUM &amp;&amp; to =3D=3D HARD_=
FRAME_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0return frame.hard_frame_pointer_offse<wbr>t;<br>
+@@ -11395,8 +11349,9 @@ ix86_builtin_setjmp_frame_valu<wbr>e (void)<br>
+ /* Fill structure ix86_frame about frame of currently computed function.=
=C2=A0 */<br>
+<br>
+ static void<br>
+-ix86_compute_frame_layout (struct ix86_frame *frame)<br>
++ix86_compute_frame_layout (void)<br>
+ {<br>
++=C2=A0 struct ix86_frame *frame =3D &amp;cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0unsigned HOST_WIDE_INT stack_alignment_needed;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT offset;<br>
+=C2=A0 =C2=A0unsigned HOST_WIDE_INT preferred_alignment;<br>
+@@ -12702,7 +12657,8 @@ ix86_expand_prologue (void)<br>
+=C2=A0 =C2=A0m-&gt;fs.sp_offset =3D INCOMING_FRAME_SP_OFFSET;<br>
+=C2=A0 =C2=A0m-&gt;fs.sp_valid =3D true;<br>
+<br>
+-=C2=A0 ix86_compute_frame_layout (&amp;frame);<br>
++=C2=A0 ix86_compute_frame_layout ();<br>
++=C2=A0 frame =3D m-&gt;frame;<br>
+<br>
+=C2=A0 =C2=A0if (!TARGET_64BIT &amp;&amp; ix86_function_ms_hook_prologue (=
current_function_decl))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -13379,7 +13335,8 @@ ix86_expand_epilogue (int style)<br>
+=C2=A0 =C2=A0bool using_drap;<br>
+<br>
+=C2=A0 =C2=A0ix86_finalize_stack_realign_f<wbr>lags ();<br>
+-=C2=A0 ix86_compute_frame_layout (&amp;frame);<br>
++=C2=A0 ix86_compute_frame_layout ();<br>
++=C2=A0 frame =3D m-&gt;frame;<br>
+<br>
+=C2=A0 =C2=A0m-&gt;fs.sp_valid =3D (!frame_pointer_needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c=
rtl-&gt;sp_is_unchanging<br>
+@@ -13876,7 +13833,8 @@ ix86_expand_split_stack_prolog<wbr>ue (void)<br>
+=C2=A0 =C2=A0gcc_assert (flag_split_stack &amp;&amp; reload_completed);<br=
>
+<br>
+=C2=A0 =C2=A0ix86_finalize_stack_realign_f<wbr>lags ();<br>
+-=C2=A0 ix86_compute_frame_layout (&amp;frame);<br>
++=C2=A0 ix86_compute_frame_layout ();<br>
++=C2=A0 frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0allocate =3D frame.stack_pointer_offset - INCOMING_FRAME_SP_O=
FFSET;<br>
+<br>
+=C2=A0 =C2=A0/* This is the label we will branch to if we have enough stac=
k<br>
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h<br>
+index 8113f83..5414416 100644<br>
+--- a/gcc/config/i386/i386.h<br>
++++ b/gcc/config/i386/i386.h<br>
+@@ -2427,9 +2427,56 @@ enum avx_u128_state<br>
+<br>
+ #define FASTCALL_PREFIX &#39;@&#39;<br>
+<br>
++#ifndef USED_FOR_TARGET<br>
++/* Structure describing stack frame layout.<br>
++=C2=A0 =C2=A0Stack grows downward:<br>
++<br>
++=C2=A0 =C2=A0[arguments]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- ARG_POINT=
ER<br>
++=C2=A0 =C2=A0saved pc<br>
++<br>
++=C2=A0 =C2=A0saved static chain=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ix86_static_chain_on_stack<br>
++<br>
++=C2=A0 =C2=A0saved frame pointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if frame_pointer_needed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- HARD_FRAM=
E_POINTER<br>
++=C2=A0 =C2=A0[saved regs]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- regs_save=
_offset<br>
++=C2=A0 =C2=A0[padding0]<br>
++<br>
++=C2=A0 =C2=A0[saved SSE regs]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- sse_regs_=
save_offset<br>
++=C2=A0 =C2=A0[padding1]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- FRAME_POI=
NTER<br>
++=C2=A0 =C2=A0[va_arg registers]=C2=A0 |<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
++=C2=A0 =C2=A0[frame]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
++=C2=A0 =C2=A0[padding2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =3D to_allocate<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;- STACK_POI=
NTER<br>
++=C2=A0 */<br>
++struct GTY(()) ix86_frame<br>
++{<br>
++=C2=A0 int nsseregs;<br>
++=C2=A0 int nregs;<br>
++=C2=A0 int va_arg_size;<br>
++=C2=A0 int red_zone_size;<br>
++=C2=A0 int outgoing_arguments_size;<br>
++<br>
++=C2=A0 /* The offsets relative to ARG_POINTER.=C2=A0 */<br>
++=C2=A0 HOST_WIDE_INT frame_pointer_offset;<br>
++=C2=A0 HOST_WIDE_INT hard_frame_pointer_offset;<br>
++=C2=A0 HOST_WIDE_INT stack_pointer_offset;<br>
++=C2=A0 HOST_WIDE_INT hfp_save_offset;<br>
++=C2=A0 HOST_WIDE_INT reg_save_offset;<br>
++=C2=A0 HOST_WIDE_INT sse_reg_save_offset;<br>
++<br>
++=C2=A0 /* When save_regs_using_mov is set, emit prologue using<br>
++=C2=A0 =C2=A0 =C2=A0move instead of push instructions.=C2=A0 */<br>
++=C2=A0 bool save_regs_using_mov;<br>
++};<br>
++<br>
+ /* Machine specific frame tracking during prologue/epilogue generation.=
=C2=A0 */<br>
+<br>
+-#ifndef USED_FOR_TARGET<br>
+ struct GTY(()) machine_frame_state<br>
+ {<br>
+=C2=A0 =C2=A0/* This pair tracks the currently active CFA as reg+offset.=
=C2=A0 When reg<br>
+@@ -2475,6 +2522,9 @@ struct GTY(()) machine_function {<br>
+=C2=A0 =C2=A0int varargs_fpr_size;<br>
+=C2=A0 =C2=A0int optimize_mode_switching[MAX_38<wbr>6_ENTITIES];<br>
+<br>
++=C2=A0 /* Cached initial frame layout for the current function.=C2=A0 */<=
br>
++=C2=A0 struct ix86_frame frame;<br>
++<br>
+=C2=A0 =C2=A0/* Number of saved registers USE_FAST_PROLOGUE_EPILOGUE<br>
+=C2=A0 =C2=A0 =C2=A0 has been computed for.=C2=A0 */<br>
+=C2=A0 =C2=A0int use_fast_prologue_epilogue_nre<wbr>gs;<br>
+@@ -2554,6 +2604,7 @@ struct GTY(()) machine_function {<br>
+ #define ix86_current_function_calls_tl<wbr>s_descriptor \<br>
+=C2=A0 =C2=A0(ix86_tls_descriptor_calls_ex<wbr>panded_in_cfun &amp;&amp; d=
f_regs_ever_live_p (SP_REG))<br>
+ #define ix86_static_chain_on_stack (cfun-&gt;machine-&gt;static_chain_o<w=
br>n_stack)<br>
++#define ix86_red_zone_size (cfun-&gt;machine-&gt;frame.red_zone<wbr>_size=
)<br>
+<br>
+ /* Control behavior of x86_file_start.=C2=A0 */<br>
+ #define X86_FILE_START_VERSION_DIRECTI<wbr>VE false<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0002-i386-Use-reference=
-<wbr>of-struct-ix86_frame-to-avoid-<wbr>cop.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0002-i386-Use-reference-<wbr>of-struct-ix86_frame-to-avoid=
-<wbr>cop.patch<br>
new file mode 100644<br>
index 0000000..156a0a3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0002-i386-Use-reference-<wbr>o=
f-struct-ix86_frame-to-avoid-<wbr>cop.patch<br>
@@ -0,0 +1,71 @@<br>
+From fe2b3be3f4b6ec6b3a6f89c26016a3<wbr>983b7cb351 Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Mon, 15 Jan 2018 11:28:44 +0000<br>
+Subject: [PATCH 02/12] i386: Use reference of struct ix86_frame to avoid c=
opy<br>
+<br>
+When there is no need to make a copy of ix86_frame, we can use reference<b=
r>
+of struct ix86_frame to avoid copy.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02017-11-06=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_can_use_return_insn_=
p): Use reference<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of struct ix86_frame.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_initial_elimination_off<wbr>set): Likewis=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_expand_split_stack_prol<wbr>ogue): Likewi=
se.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c | 8 +++-----<br>
+ 1 file changed, 3 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index a1ff32b..13ebf10 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -10887,7 +10887,6 @@ symbolic_reference_mentioned_p (rtx op)<br>
+ bool<br>
+ ix86_can_use_return_insn_p (void)<br>
+ {<br>
+-=C2=A0 struct ix86_frame frame;<br>
+<br>
+=C2=A0 =C2=A0if (! reload_completed || frame_pointer_needed)<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+@@ -10898,7 +10897,7 @@ ix86_can_use_return_insn_p (void)<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0ix86_compute_frame_layout ();<br>
+-=C2=A0 frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 struct ix86_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0return (frame.stack_pointer_offset =3D=3D UNITS_PER_WORD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (frame.nregs + frame.nsseregs=
) =3D=3D 0);<br>
+ }<br>
+@@ -11310,7 +11309,7 @@ HOST_WIDE_INT<br>
+ ix86_initial_elimination_offse<wbr>t (int from, int to)<br>
+ {<br>
+=C2=A0 =C2=A0ix86_compute_frame_layout ();<br>
+-=C2=A0 struct ix86_frame frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 struct ix86_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+<br>
+=C2=A0 =C2=A0if (from =3D=3D ARG_POINTER_REGNUM &amp;&amp; to =3D=3D HARD_=
FRAME_POINTER_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0return frame.hard_frame_pointer_offse<wbr>t;<br>
+@@ -13821,7 +13820,6 @@ static GTY(()) rtx split_stack_fn_large;<br>
+ void<br>
+ ix86_expand_split_stack_prolog<wbr>ue (void)<br>
+ {<br>
+-=C2=A0 struct ix86_frame frame;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT allocate;<br>
+=C2=A0 =C2=A0unsigned HOST_WIDE_INT args_size;<br>
+=C2=A0 =C2=A0rtx_code_label *label;<br>
+@@ -13834,7 +13832,7 @@ ix86_expand_split_stack_prolog<wbr>ue (void)<br>
+<br>
+=C2=A0 =C2=A0ix86_finalize_stack_realign_f<wbr>lags ();<br>
+=C2=A0 =C2=A0ix86_compute_frame_layout ();<br>
+-=C2=A0 frame =3D cfun-&gt;machine-&gt;frame;<br>
++=C2=A0 struct ix86_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;<br>
+=C2=A0 =C2=A0allocate =3D frame.stack_pointer_offset - INCOMING_FRAME_SP_O=
FFSET;<br>
+<br>
+=C2=A0 =C2=A0/* This is the label we will branch to if we have enough stac=
k<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0002-uclibc-conf.patch =
b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0002-uclibc-conf.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0002-uclibc-conf.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0002-uclibc-conf.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0003-gcc-uclibc-locale-=
c<wbr>type_touplow_t.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0003-gc=
c-uclibc-locale-c<wbr>type_touplow_t.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0003-gcc-uclibc-locale-c=
ty<wbr>pe_touplow_t.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0003-gcc-uclibc-locale-cty=
<wbr>pe_touplow_t.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0003-i386-Use-const-ref=
e<wbr>rence-of-struct-ix86_frame-to-<wbr>avo.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0003-i386-Use-const-refe<wbr>rence-of-struct-ix86_frame-to=
-<wbr>avo.patch<br>
new file mode 100644<br>
index 0000000..9cb0a41<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0003-i386-Use-const-refe<wbr>r=
ence-of-struct-ix86_frame-to-<wbr>avo.patch<br>
@@ -0,0 +1,128 @@<br>
+From 82243732dc63e9b90396a5ae4ad99c<wbr>a36af81355 Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Sat, 27 Jan 2018 13:10:24 +0000<br>
+Subject: [PATCH 03/12] i386: Use const reference of struct ix86_frame to a=
void<br>
+ copy<br>
+<br>
+We can use const reference of struct ix86_frame to avoid making a local<br=
>
+copy of ix86_frame.=C2=A0 ix86_expand_epilogue makes a local copy of struc=
t<br>
+ix86_frame and uses the reg_save_offset field as a local variable.=C2=A0 T=
his<br>
+patch uses a separate local variable for reg_save_offset.<br>
+<br>
+Tested on x86-64 with ada.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/83905<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_expand_prologue): Us=
e cost reference<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of struct ix86_frame.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_expand_epilogue): Likewise.=C2=A0 Add a l=
ocal variable for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the reg_save_offset field in struct ix86_frame.=
<br>
+<br>
+git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-7=
-branch@257123" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/<w=
br>branches/gcc-7-branch@257123</a> 138bc75d-0d04-0410-961f-82ee72<wbr>b054=
a4<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c | 24 ++++++++++++------------<br>
+ 1 file changed, 12 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 13ebf10..6c98f75 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -12633,7 +12633,6 @@ ix86_expand_prologue (void)<br>
+ {<br>
+=C2=A0 =C2=A0struct machine_function *m =3D cfun-&gt;machine;<br>
+=C2=A0 =C2=A0rtx insn, t;<br>
+-=C2=A0 struct ix86_frame frame;<br>
+=C2=A0 =C2=A0HOST_WIDE_INT allocate;<br>
+=C2=A0 =C2=A0bool int_registers_saved;<br>
+=C2=A0 =C2=A0bool sse_registers_saved;<br>
+@@ -12657,7 +12656,7 @@ ix86_expand_prologue (void)<br>
+=C2=A0 =C2=A0m-&gt;fs.sp_valid =3D true;<br>
+<br>
+=C2=A0 =C2=A0ix86_compute_frame_layout ();<br>
+-=C2=A0 frame =3D m-&gt;frame;<br>
++=C2=A0 const struct ix86_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;=
<br>
+<br>
+=C2=A0 =C2=A0if (!TARGET_64BIT &amp;&amp; ix86_function_ms_hook_prologue (=
current_function_decl))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -13329,13 +13328,12 @@ ix86_expand_epilogue (int style)<br>
+ {<br>
+=C2=A0 =C2=A0struct machine_function *m =3D cfun-&gt;machine;<br>
+=C2=A0 =C2=A0struct machine_frame_state frame_state_save =3D m-&gt;fs;<br>
+-=C2=A0 struct ix86_frame frame;<br>
+=C2=A0 =C2=A0bool restore_regs_via_mov;<br>
+=C2=A0 =C2=A0bool using_drap;<br>
+<br>
+=C2=A0 =C2=A0ix86_finalize_stack_realign_f<wbr>lags ();<br>
+=C2=A0 =C2=A0ix86_compute_frame_layout ();<br>
+-=C2=A0 frame =3D m-&gt;frame;<br>
++=C2=A0 const struct ix86_frame &amp;frame =3D cfun-&gt;machine-&gt;frame;=
<br>
+<br>
+=C2=A0 =C2=A0m-&gt;fs.sp_valid =3D (!frame_pointer_needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (c=
rtl-&gt;sp_is_unchanging<br>
+@@ -13377,11 +13375,13 @@ ix86_expand_epilogue (int style)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ UNITS_PER_WORD);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 HOST_WIDE_INT reg_save_offset =3D frame.reg_save_offset;<br>
++<br>
+=C2=A0 =C2=A0/* Special care must be taken for the normal return case of a=
 function<br>
+=C2=A0 =C2=A0 =C2=A0 using eh_return: the eax and edx registers are marked=
 as saved, but<br>
+=C2=A0 =C2=A0 =C2=A0 not restored along this path.=C2=A0 Adjust the save l=
ocation to match.=C2=A0 */<br>
+=C2=A0 =C2=A0if (crtl-&gt;calls_eh_return &amp;&amp; style !=3D 2)<br>
+-=C2=A0 =C2=A0 frame.reg_save_offset -=3D 2 * UNITS_PER_WORD;<br>
++=C2=A0 =C2=A0 reg_save_offset -=3D 2 * UNITS_PER_WORD;<br>
+<br>
+=C2=A0 =C2=A0/* EH_RETURN requires the use of moves to function properly.=
=C2=A0 */<br>
+=C2=A0 =C2=A0if (crtl-&gt;calls_eh_return)<br>
+@@ -13397,11 +13397,11 @@ ix86_expand_epilogue (int style)<br>
+=C2=A0 =C2=A0else if (TARGET_EPILOGUE_USING_MOVE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; cfun-&gt;machine-&gt;use_fas=
t_prolog<wbr>ue_epilogue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (frame.nregs &gt; 1<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| m-&gt;fs.sp_offset !=
=3D frame.reg_save_offset))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| m-&gt;fs.sp_offset !=
=3D reg_save_offset))<br>
+=C2=A0 =C2=A0 =C2=A0restore_regs_via_mov =3D true;<br>
+=C2=A0 =C2=A0else if (frame_pointer_needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !frame.nregs<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; m-&gt;fs.sp_offset !=3D fram=
e.reg_save_offset)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; m-&gt;fs.sp_offset !=3D reg_=
save_offset)<br>
+=C2=A0 =C2=A0 =C2=A0restore_regs_via_mov =3D true;<br>
+=C2=A0 =C2=A0else if (frame_pointer_needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; TARGET_USE_LEAVE<br>
+@@ -13439,7 +13439,7 @@ ix86_expand_epilogue (int style)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx t;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (frame.nregs)<br>
+-=C2=A0 =C2=A0 =C2=A0 ix86_emit_restore_regs_using_m<wbr>ov (frame.reg_sav=
e_offset, style =3D=3D 2);<br>
++=C2=A0 =C2=A0 =C2=A0 ix86_emit_restore_regs_using_m<wbr>ov (reg_save_offs=
et, style =3D=3D 2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* eh_return epilogues need %ecx added to the s=
tack pointer.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (style =3D=3D 2)<br>
+@@ -13529,19 +13529,19 @@ ix86_expand_epilogue (int style)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 epilogues.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!m-&gt;fs.sp_valid<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (TARGET_SEH<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (m-&gt;fs.sp_offset =
- frame.reg_save_offset<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (m-&gt;fs.sp_offset =
- reg_save_offset<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D SEH_=
MAX_FRAME_SIZE)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pro_epilogue_adjust_stack (stack_pointer=
_rtx, hard_frame_pointer_rtx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GEN_INT (m-&gt;fs.fp_o=
ffset<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - frame.reg_save_offset),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - reg_save_offset),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 style, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (m-&gt;fs.sp_offset !=3D frame.reg_save_offs=
et)<br>
++=C2=A0 =C2=A0 =C2=A0 else if (m-&gt;fs.sp_offset !=3D reg_save_offset)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pro_epilogue_adjust_stack (stack_pointer=
_rtx, stack_pointer_rtx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GEN_INT (m-&gt;fs.sp_o=
ffset<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - frame.reg_save_offset),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - reg_save_offset),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 style,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;fs.cfa_reg =3D=
=3D stack_pointer_rtx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0004-uclibc-locale.patc=
h b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0004-uclibc-locale.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0004-uclibc-locale.patch=
<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0004-uclibc-locale.patch<b=
r>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0004-x86-Add-mindirect-=
b<wbr>ranch.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0004-x86-Add-min=
direct-b<wbr>ranch.patch<br>
new file mode 100644<br>
index 0000000..9a9b4e9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0004-x86-Add-mindirect-b<wbr>r=
anch.patch<br>
@@ -0,0 +1,2151 @@<br>
+From 6140c2c0bb2b61e69d0da84315e043<wbr>3ff3520aaa Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sat, 6 Jan 2018 22:29:55 -0800<br>
+Subject: [PATCH 04/12] x86: Add -mindirect-branch=3D<br>
+<br>
+Add -mindirect-branch=3D option to convert indirect call and jump to call<=
br>
+and return thunks.=C2=A0 The default is &#39;keep&#39;, which keeps indire=
ct call and<br>
+jump unmodified.=C2=A0 &#39;thunk&#39; converts indirect call and jump to =
call and<br>
+return thunk.=C2=A0 &#39;thunk-inline&#39; converts indirect call and jump=
 to inlined<br>
+call and return thunk.=C2=A0 &#39;thunk-extern&#39; converts indirect call=
 and jump to<br>
+external call and return thunk provided in a separate object file.=C2=A0 Y=
ou<br>
+can control this behavior for a specific function by using the function<br=
>
+attribute indirect_branch.<br>
+<br>
+2 kinds of thunks are geneated.=C2=A0 Memory thunk where the function addr=
ess<br>
+is at the top of the stack:<br>
+<br>
+__x86_indirect_thunk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call L2<br>
+L1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pause<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lfence<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp L1<br>
+L2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lea 8(%rsp), %rsp|lea 4(%esp), %esp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
+<br>
+Indirect jmp via memory, &quot;jmp mem&quot;, is converted to<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0push memory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp __x86_indirect_thunk<br>
+<br>
+Indirect call via memory, &quot;call mem&quot;, is converted to<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp L2<br>
+L1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0push [mem]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp __x86_indirect_thunk<br>
+L2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call L1<br>
+<br>
+Register thunk where the function address is in a register, reg:<br>
+<br>
+__x86_indirect_thunk_reg:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call=C2=A0 =C2=A0 L2<br>
+L1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pause<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lfence<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 =C2=A0L1<br>
+L2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 %reg, (%rsp)|movl=C2=A0 =C2=
=A0 %reg, (%esp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
+<br>
+where reg is one of (r|e)ax, (r|e)dx, (r|e)cx, (r|e)bx, (r|e)si, (r|e)di,<=
br>
+(r|e)bp, r8, r9, r10, r11, r12, r13, r14 and r15.<br>
+<br>
+Indirect jmp via register, &quot;jmp reg&quot;, is converted to<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp __x86_indirect_thunk_reg<br>
+<br>
+Indirect call via register, &quot;call reg&quot;, is converted to<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call __x86_indirect_thunk_reg<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386-opts.h (indirect_branch): Ne=
w.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386-protos.h (ix86_output_indire=
ct_jmp): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_using_red_zone): Dis=
allow red-zone<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0with local indirect jump when converting indire=
ct call and jump.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_set_indirect_branch_typ<wbr>e): New.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_set_current_function): Call ix86_set_indi=
rect_branch_type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirectlabelno): New.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunk_needed): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunk_bnd_needed): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunks_used): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunks_bnd_used): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(INDIRECT_LABEL): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunk_name): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk_functi<wbr>on): Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_branch_<wbr>via_reg): Lik=
ewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_branch_<wbr>via_push): Li=
kewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_branch)<wbr>: Likewise.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_jmp): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_code_end): Call output_indirect_thunk_fun=
ction if needed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_call_insn): Call ix86_output_indir=
ect_branch if<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0needed.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_handle_fndecl_attribute<wbr>): Handle ind=
irect_branch.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_attribute_table): Add indirect_branch.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.h (machine_function): Add in=
direct_branch_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0and has_local_indirect_jump.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (indirect_jump): Set has_local_i=
ndirect_jump<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0to true.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(tablejump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*indirect_jump): Use ix86_output_indirect_jmp.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*tablejump_1): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(simple_return_indirect_inter<wbr>nal): Likewis=
e.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.opt (mindirect-branch=3D): N=
ew option.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_branch): New.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(keep): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(thunk): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(thunk-inline): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(thunk-extern): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/extend.texi: Document indirect_branch fun=
ction attribute.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/invoke.texi: Document -mindirect-branch=
=3D option.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-1.c: New =
test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-2.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-3.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-4.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-5.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-6.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-7.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-1.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-2.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-3.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-4.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-5.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-6.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-7.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-8.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-1.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-2.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-3.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-4.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-7.=
c: Likewise.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386-opts.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +<br>
+ gcc/config/i386/i386-protos.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
+ gcc/config/i386/i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 639 ++++++++++++++=
++++++-<br>
+ gcc/config/i386/i386.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br=
>
+ gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=3D"_=
blank">i386.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 26 +-<br>
+ gcc/config/i386/i386.opt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +<br>
+ gcc/doc/extend.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br=
>
+ gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<b=
r>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-1.c=C2=A0 =C2=A0|=C2=A0=
 20 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-2.c=C2=A0 =C2=A0|=C2=A0=
 20 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-3.c=C2=A0 =C2=A0|=C2=A0=
 21 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-4.c=C2=A0 =C2=A0|=C2=A0=
 21 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-5.c=C2=A0 =C2=A0|=C2=A0=
 17 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-6.c=C2=A0 =C2=A0|=C2=A0=
 18 +<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-7.c=C2=A0 =C2=A0|=C2=A0=
 44 ++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 23 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 21 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 23 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-5.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-6.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 21 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-7.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 44 ++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-8.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 42 ++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 21 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 19 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 19 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 19 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 16 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 17 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 43 ++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 21 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 21 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 17 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 18 +<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 44 ++<br>
+ 41 files changed, 1486 insertions(+), 17 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-1.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-2.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-3.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-4.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-5.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-6.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-7.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-3.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-4.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-5.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-6.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-7.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-8.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-bnd-=
1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-bnd-=
2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-bnd-=
3.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-bnd-=
4.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-3.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-4.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-5.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-6.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-exte=
rn-7.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-3.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-4.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-5.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-6.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-inli=
ne-7.c<br>
+<br>
+diff --git a/gcc/config/i386/i386-opts.h b/gcc/config/i386/i386-opts.h<br>
+index b7f92e3..cc21152 100644<br>
+--- a/gcc/config/i386/i386-opts.h<br>
++++ b/gcc/config/i386/i386-opts.h<br>
+@@ -99,4 +99,17 @@ enum stack_protector_guard {<br>
+=C2=A0 =C2=A0SSP_GLOBAL=C2=A0 =C2=A0 /* global canary */<br>
+ };<br>
+<br>
++/* This is used to mitigate variant #2 of the speculative execution<br>
++=C2=A0 =C2=A0vulnerabilities on x86 processors identified by CVE-2017-571=
5, aka<br>
++=C2=A0 =C2=A0Spectre.=C2=A0 They convert indirect branches and function r=
eturns to<br>
++=C2=A0 =C2=A0call and return thunks to avoid speculative execution via in=
direct<br>
++=C2=A0 =C2=A0call, jmp and ret.=C2=A0 */<br>
++enum indirect_branch {<br>
++=C2=A0 indirect_branch_unset =3D 0,<br>
++=C2=A0 indirect_branch_keep,<br>
++=C2=A0 indirect_branch_thunk,<br>
++=C2=A0 indirect_branch_thunk_inline,<br>
++=C2=A0 indirect_branch_thunk_extern<br>
++};<br>
++<br>
+ #endif<br>
+diff --git a/gcc/config/i386/i386-protos.<wbr>h b/gcc/config/i386/i386-pro=
tos.<wbr>h<br>
+index ff47bc1..eca4cbf 100644<br>
+--- a/gcc/config/i386/i386-protos.<wbr>h<br>
++++ b/gcc/config/i386/i386-protos.<wbr>h<br>
+@@ -311,6 +311,7 @@ extern enum attr_cpu ix86_schedule;<br>
+ #endif<br>
+<br>
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);<=
br>
++extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);<b=
r>
+ extern bool ix86_operands_ok_for_move_mult<wbr>iple (rtx *operands, bool =
load,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enum machine_mode mode);<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 6c98f75..0b9fc4d 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -3662,12 +3662,23 @@ make_pass_stv (gcc::context *ctxt)<br>
+=C2=A0 =C2=A0return new pass_stv (ctxt);<br>
+ }<br>
+<br>
+-/* Return true if a red-zone is in use.=C2=A0 */<br>
++/* Return true if a red-zone is in use.=C2=A0 We can&#39;t use red-zone w=
hen<br>
++=C2=A0 =C2=A0there are local indirect jumps, like &quot;indirect_jump&quo=
t; or &quot;tablejump&quot;,<br>
++=C2=A0 =C2=A0which jumps to another place in the function, since &quot;ca=
ll&quot; in the<br>
++=C2=A0 =C2=A0indirect thunk pushes the return address onto stack, destroy=
ing<br>
++=C2=A0 =C2=A0red-zone.<br>
++<br>
++=C2=A0 =C2=A0TODO: If we can reserve the first 2 WORDs, for PUSH and, ano=
ther<br>
++=C2=A0 =C2=A0for CALL, in red-zone, we can allow local indirect jumps wit=
h<br>
++=C2=A0 =C2=A0indirect thunk.=C2=A0 */<br>
+<br>
+ bool<br>
+ ix86_using_red_zone (void)<br>
+ {<br>
+-=C2=A0 return TARGET_RED_ZONE &amp;&amp; !TARGET_64BIT_MS_ABI;<br>
++=C2=A0 return (TARGET_RED_ZONE<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !TARGET_64BIT_MS_ABI<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (!cfun-&gt;machine-&gt;has_local_i=
nd<wbr>irect_jump<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || cfun-&gt;machine-&gt;indirec=
t_branch<wbr>_type =3D=3D indirect_branch_keep));<br>
+ }<br>
+<br>
+ /* Return a string that documents the current -m options.=C2=A0 The calle=
r is<br>
+@@ -6350,6 +6361,37 @@ ix86_reset_previous_fndecl (void)<br>
+=C2=A0 =C2=A0ix86_previous_fndecl =3D NULL_TREE;<br>
+ }<br>
+<br>
++/* Set the indirect_branch_type field from the function FNDECL.=C2=A0 */<=
br>
++<br>
++static void<br>
++ix86_set_indirect_branch_typ<wbr>e (tree fndecl)<br>
++{<br>
++=C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type =3D=3D indirect=
_branch_unset)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 tree attr =3D lookup_attribute (&quot;indirect_branc=
h&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DECL_ATTRIBUTES (fndecl));<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (attr !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree args =3D TREE_VALUE (attr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_unreachable ();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree cst =3D TREE_VALUE (args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp (TREE_STRING_POINTER (cst), &quot;=
keep&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;indirect_branch<w=
br>_type =3D indirect_branch_keep;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;indirect_branch<w=
br>_type =3D indirect_branch_thunk;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk-inline&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;indirect_branch<w=
br>_type =3D indirect_branch_thunk_inline;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk-extern&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;indirect_branch<w=
br>_type =3D indirect_branch_thunk_extern;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_unreachable ();<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;indirect_branch<wbr>_type =3D i=
x86_indirect_branch;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ /* Establish appropriate back-end context for processing the function<br>
+=C2=A0 =C2=A0 FNDECL.=C2=A0 The argument might be NULL to indicate process=
ing at top<br>
+=C2=A0 =C2=A0 level, outside of any function scope.=C2=A0 */<br>
+@@ -6360,7 +6402,13 @@ ix86_set_current_function (tree fndecl)<br>
+=C2=A0 =C2=A0 =C2=A0 several times in the course of compiling a function, =
and we don&#39;t want to<br>
+=C2=A0 =C2=A0 =C2=A0 slow things down too much or call target_reinit when =
it isn&#39;t safe.=C2=A0 */<br>
+=C2=A0 =C2=A0if (fndecl =3D=3D ix86_previous_fndecl)<br>
+-=C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* There may be 2 function bodies for the same funct=
ion FNDECL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0one is extern inline and one isn&#39;t.=C2=A0 =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 if (fndecl !=3D NULL_TREE)<br>
++=C2=A0 =C2=A0 =C2=A0 ix86_set_indirect_branch_type (fndecl);<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0tree old_tree;<br>
+=C2=A0 =C2=A0if (ix86_previous_fndecl =3D=3D NULL_TREE)<br>
+@@ -6377,6 +6425,8 @@ ix86_set_current_function (tree fndecl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 ix86_set_indirect_branch_type (fndecl);<br>
++<br>
+=C2=A0 =C2=A0tree new_tree =3D DECL_FUNCTION_SPECIFIC_TARGET (fndecl);<br>
+=C2=A0 =C2=A0if (new_tree =3D=3D NULL_TREE)<br>
+=C2=A0 =C2=A0 =C2=A0new_tree =3D target_option_default_node;<br>
+@@ -10962,6 +11012,220 @@ ix86_setup_frame_addresses (void)<br>
+ # endif<br>
+ #endif<br>
+<br>
++/* Label count for call and return thunks.=C2=A0 It is used to make uniqu=
e<br>
++=C2=A0 =C2=A0labels in call and return thunks.=C2=A0 */<br>
++static int indirectlabelno;<br>
++<br>
++/* True if call and return thunk functions are needed.=C2=A0 */<br>
++static bool indirect_thunk_needed =3D false;<br>
++/* True if call and return thunk functions with the BND prefix are<br>
++=C2=A0 =C2=A0needed.=C2=A0 */<br>
++static bool indirect_thunk_bnd_needed =3D false;<br>
++<br>
++/* Bit masks of integer registers, which contain branch target, used<br>
++=C2=A0 =C2=A0by call and return thunks functions.=C2=A0 */<br>
++static int indirect_thunks_used;<br>
++/* Bit masks of integer registers, which contain branch target, used<br>
++=C2=A0 =C2=A0by call and return thunks functions with the BND prefix.=C2=
=A0 */<br>
++static int indirect_thunks_bnd_used;<br>
++<br>
++#ifndef INDIRECT_LABEL<br>
++# define INDIRECT_LABEL &quot;LIND&quot;<br>
++#endif<br>
++<br>
++/* Fills in the label name that should be used for the indirect thunk.=C2=
=A0 */<br>
++<br>
++static void<br>
++indirect_thunk_name (char name[32], int regno, bool need_bnd_p)<br>
++{<br>
++=C2=A0 if (USE_HIDDEN_LINKONCE)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 const char *bnd =3D need_bnd_p ? &quot;_bnd&quot; : =
&quot;&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *reg_prefix;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (LEGACY_INT_REGNO_P (regno))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_prefix =3D TARGET_64BIT ? &quot;r&=
quot; : &quot;e&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_prefix =3D &quot;&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_indirect_thunk%s_%=
s%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bnd, reg_pr=
efix, reg_names[regno]);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_indirect_thunk%s&quot;, b=
nd);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LITBR&quot;, regno);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LITR&quot;, regno);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LITB&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LIT&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* Output a call and return thunk for indirect branch.=C2=A0 If BND_P is<=
br>
++=C2=A0 =C2=A0true, the BND prefix is needed.=C2=A0 =C2=A0If REGNO !=3D -1=
,=C2=A0 the function<br>
++=C2=A0 =C2=A0address is in REGNO and the call and return thunk looks like=
:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 call=C2=A0 =C2=A0 L2<br>
++=C2=A0 =C2=A0L1:<br>
++=C2=A0 =C2=A0 =C2=A0 pause<br>
++=C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0L1<br>
++=C2=A0 =C2=A0L2:<br>
++=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0%REG, (%sp)<br>
++=C2=A0 =C2=A0 =C2=A0 ret<br>
++<br>
++=C2=A0 =C2=A0Otherwise, the function address is on the top of stack and t=
he<br>
++=C2=A0 =C2=A0call and return thunk looks like:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 call L2<br>
++=C2=A0 L1:<br>
++=C2=A0 =C2=A0 =C2=A0 pause<br>
++=C2=A0 =C2=A0 =C2=A0 jmp L1<br>
++=C2=A0 L2:<br>
++=C2=A0 =C2=A0 =C2=A0 lea WORD_SIZE(%sp), %sp<br>
++=C2=A0 =C2=A0 =C2=A0 ret<br>
++ */<br>
++<br>
++static void<br>
++output_indirect_thunk (bool need_bnd_p, int regno)<br>
++{<br>
++=C2=A0 char indirectlabel1[32];<br>
++=C2=A0 char indirectlabel2[32];<br>
++<br>
++=C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel1, INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++=C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel2, INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++<br>
++=C2=A0 /* Call */<br>
++=C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 fputs (&quot;\tbnd call\t&quot;, asm_out_file);<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 fputs (&quot;\tcall\t&quot;, asm_out_file);<br>
++=C2=A0 assemble_name_raw (asm_out_file, indirectlabel2);<br>
++=C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++<br>
++=C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel1);<br>
++<br>
++=C2=A0 /* Pause + lfence.=C2=A0 */<br>
++=C2=A0 fprintf (asm_out_file, &quot;\tpause\n\tlfence\n&quot;);<br>
++<br>
++=C2=A0 /* Jump.=C2=A0 */<br>
++=C2=A0 fputs (&quot;\tjmp\t&quot;, asm_out_file);<br>
++=C2=A0 assemble_name_raw (asm_out_file, indirectlabel1);<br>
++=C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++<br>
++=C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);<br>
++<br>
++=C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* MOV.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 rtx xops[2];<br>
++=C2=A0 =C2=A0 =C2=A0 xops[0] =3D gen_rtx_MEM (word_mode, stack_pointer_rt=
x);<br>
++=C2=A0 =C2=A0 =C2=A0 xops[1] =3D gen_rtx_REG (word_mode, regno);<br>
++=C2=A0 =C2=A0 =C2=A0 output_asm_insn (&quot;mov\t{%1, %0|%0, %1}&quot;, x=
ops);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* LEA.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 rtx xops[2];<br>
++=C2=A0 =C2=A0 =C2=A0 xops[0] =3D stack_pointer_rtx;<br>
++=C2=A0 =C2=A0 =C2=A0 xops[1] =3D plus_constant (Pmode, stack_pointer_rtx,=
 UNITS_PER_WORD);<br>
++=C2=A0 =C2=A0 =C2=A0 output_asm_insn (&quot;lea\t{%E1, %0|%0, %E1}&quot;,=
 xops);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 fputs (&quot;\tbnd ret\n&quot;, asm_out_file);<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 fputs (&quot;\tret\n&quot;, asm_out_file);<br>
++}<br>
++<br>
++/* Output a funtion with a call and return thunk for indirect branch.<br>
++=C2=A0 =C2=A0If BND_P is true, the BND prefix is needed.=C2=A0 =C2=A0If R=
EGNO !=3D -1,=C2=A0 the<br>
++=C2=A0 =C2=A0function address is in REGNO.=C2=A0 Otherwise, the function =
address is<br>
++=C2=A0 =C2=A0on the top of stack.=C2=A0 */<br>
++<br>
++static void<br>
++output_indirect_thunk_functi<wbr>on (bool need_bnd_p, int regno)<br>
++{<br>
++=C2=A0 char name[32];<br>
++=C2=A0 tree decl;<br>
++<br>
++=C2=A0 /* Create __x86_indirect_thunk/__x86_ind<wbr>irect_thunk_bnd.=C2=
=A0 */<br>
++=C2=A0 indirect_thunk_name (name, regno, need_bnd_p);<br>
++=C2=A0 decl =3D build_decl (BUILTINS_LOCATION, FUNCTION_DECL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_=
identifier (name),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buil=
d_function_type_list (void_type_node, NULL_TREE));<br>
++=C2=A0 DECL_RESULT (decl) =3D build_decl (BUILTINS_LOCATION, RESULT_DECL,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL_TREE, void_type_node);<br=
>
++=C2=A0 TREE_PUBLIC (decl) =3D 1;<br>
++=C2=A0 TREE_STATIC (decl) =3D 1;<br>
++=C2=A0 DECL_IGNORED_P (decl) =3D 1;<br>
++<br>
++#if TARGET_MACHO<br>
++=C2=A0 if (TARGET_MACHO)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 switch_to_section (darwin_sections[picbase_thunk<wbr=
>_section]);<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\t.weak_definition\t&quot;, asm_out_fil=
e);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, name);<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\n\t.private_extern\t&quot;, asm_out_fi=
le);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, name);<br>
++=C2=A0 =C2=A0 =C2=A0 putc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_LABEL (asm_out_file, name);<br>
++=C2=A0 =C2=A0 =C2=A0 DECL_WEAK (decl) =3D 1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++#endif<br>
++=C2=A0 =C2=A0 if (USE_HIDDEN_LINKONCE)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 cgraph_node::create (decl)-&gt;set_comdat_group (DEC=
L_ASSEMBLER_NAME (decl));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 targetm.asm_out.unique_section (decl, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 switch_to_section (get_named_section (decl, NULL, 0)=
);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 targetm.asm_out.globalize_labe<wbr>l (asm_out_file, =
name);<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\t.hidden\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, name);<br>
++=C2=A0 =C2=A0 =C2=A0 putc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_DECLARE_FUNCTION_NAME (asm_out_file, name, decl)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 switch_to_section (text_section);<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_LABEL (asm_out_file, name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 DECL_INITIAL (decl) =3D make_node (BLOCK);<br>
++=C2=A0 current_function_decl =3D decl;<br>
++=C2=A0 allocate_struct_function (decl, false);<br>
++=C2=A0 init_function_start (decl);<br>
++=C2=A0 /* We&#39;re about to hide the function body from callees of final=
_* by<br>
++=C2=A0 =C2=A0 =C2=A0emitting it directly; tell them we&#39;re a thunk, if=
 they care.=C2=A0 */<br>
++=C2=A0 cfun-&gt;is_thunk =3D true;<br>
++=C2=A0 first_function_block_is_cold =3D false;<br>
++=C2=A0 /* Make sure unwind info is emitted for the thunk if needed.=C2=A0=
 */<br>
++=C2=A0 final_start_function (emit_barrier (), asm_out_file, 1);<br>
++<br>
++=C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++<br>
++=C2=A0 final_end_function ();<br>
++=C2=A0 init_insn_lengths ();<br>
++=C2=A0 free_after_compilation (cfun);<br>
++=C2=A0 set_cfun (NULL);<br>
++=C2=A0 current_function_decl =3D NULL;<br>
++}<br>
++<br>
+ static int pic_labels_used;<br>
+<br>
+ /* Fills in the label name that should be used for a pc thunk for<br>
+@@ -10988,11 +11252,32 @@ ix86_code_end (void)<br>
+=C2=A0 =C2=A0rtx xops[2];<br>
+=C2=A0 =C2=A0int regno;<br>
+<br>
++=C2=A0 if (indirect_thunk_needed)<br>
++=C2=A0 =C2=A0 output_indirect_thunk_function (false, -1);<br>
++=C2=A0 if (indirect_thunk_bnd_needed)<br>
++=C2=A0 =C2=A0 output_indirect_thunk_function (true, -1);<br>
++<br>
++=C2=A0 for (regno =3D FIRST_REX_INT_REG; regno &lt;=3D LAST_REX_INT_REG; =
regno++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 int i =3D regno - FIRST_REX_INT_REG + LAST_INT_REG +=
 1;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((indirect_thunks_used &amp; (1 &lt;&lt; i)))<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk_function (false, regno);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((indirect_thunks_bnd_used &amp; (1 &lt;&lt; i)))=
<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk_function (true, regno);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0for (regno =3D AX_REG; regno &lt;=3D SP_REG; regno++)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char name[32];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tree decl;<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 if ((indirect_thunks_used &amp; (1 &lt;&lt; regno)))=
<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk_function (false, regno);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if ((indirect_thunks_bnd_used &amp; (1 &lt;&lt; regn=
o)))<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk_function (true, regno);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(pic_labels_used &amp; (1 &lt;&lt; regno))=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
+@@ -27369,12 +27654,292 @@ ix86_nopic_noplt_attribute_p (rtx call_op)<br>
+=C2=A0 =C2=A0return false;<br>
+ }<br>
+<br>
++/* Output indirect branch via a call and return thunk.=C2=A0 CALL_OP is a=
<br>
++=C2=A0 =C2=A0register which contains the branch target.=C2=A0 XASM is the=
 assembly<br>
++=C2=A0 =C2=A0template for CALL_OP.=C2=A0 Branch is a tail call if SIBCALL=
_P is true.<br>
++=C2=A0 =C2=A0A normal call is converted to:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 call __x86_indirect_thunk_reg<br>
++<br>
++=C2=A0 =C2=A0and a tail call is converted to:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 jmp __x86_indirect_thunk_reg<br>
++ */<br>
++<br>
++static void<br>
++ix86_output_indirect_branch_<wbr>via_reg (rtx call_op, bool sibcall_p)<br=
>
++{<br>
++=C2=A0 char thunk_name_buf[32];<br>
++=C2=A0 char *thunk_name;<br>
++=C2=A0 bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_insn)=
;<br>
++=C2=A0 int regno =3D REGNO (call_op);<br>
++<br>
++=C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type<br>
++=C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_thunk_inline)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type =
=3D=3D indirect_branch_thunk)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i =3D regno;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D FIRST_REX_INT_REG)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i -=3D (FIRST_REX_INT_REG - LAST_INT_R=
EG - 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunks_bnd_used |=3D 1 &lt;&l=
t; i;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunks_used |=3D 1 &lt;&lt; i=
;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p);<br>
++=C2=A0 =C2=A0 =C2=A0 thunk_name =3D thunk_name_buf;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 thunk_name =3D NULL;<br>
++<br>
++=C2=A0 if (sibcall_p)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (thunk_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tbnd jmp=
\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tjmp\t%s=
\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (thunk_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tbnd cal=
l\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tcall\t%=
s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 char indirectlabel1[32];<br>
++=C2=A0 =C2=A0 =C2=A0 char indirectlabel2[32];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Jump.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tbnd jmp\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tjmp\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name_raw (asm_out_file, indirectlabel2);<br=
>
++=C2=A0 =C2=A0 =C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlab=
el1);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (thunk_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tbnd jmp=
\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tjmp\t%s=
\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlab=
el2);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Call.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tbnd call\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tcall\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name_raw (asm_out_file, indirectlabel1);<br=
>
++=C2=A0 =C2=A0 =C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* Output indirect branch via a call and return thunk.=C2=A0 CALL_OP is<b=
r>
++=C2=A0 =C2=A0the branch target.=C2=A0 XASM is the assembly template for C=
ALL_OP.<br>
++=C2=A0 =C2=A0Branch is a tail call if SIBCALL_P is true.=C2=A0 A normal c=
all is<br>
++=C2=A0 =C2=A0converted to:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 jmp L2<br>
++=C2=A0 =C2=A0L1:<br>
++=C2=A0 =C2=A0 =C2=A0 push CALL_OP<br>
++=C2=A0 =C2=A0 =C2=A0 jmp __x86_indirect_thunk<br>
++=C2=A0 =C2=A0L2:<br>
++=C2=A0 =C2=A0 =C2=A0 call L1<br>
++<br>
++=C2=A0 =C2=A0and a tail call is converted to:<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 push CALL_OP<br>
++=C2=A0 =C2=A0 =C2=A0 jmp __x86_indirect_thunk<br>
++ */<br>
++<br>
++static void<br>
++ix86_output_indirect_branch_<wbr>via_push (rtx call_op, const char *xasm,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool sibcall_p)<br>
++{<br>
++=C2=A0 char thunk_name_buf[32];<br>
++=C2=A0 char *thunk_name;<br>
++=C2=A0 char push_buf[64];<br>
++=C2=A0 bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (current_output_insn)=
;<br>
++=C2=A0 int regno =3D -1;<br>
++<br>
++=C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type<br>
++=C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_thunk_inline)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type =
=3D=3D indirect_branch_thunk)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_bnd_needed =3D true;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_needed =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p);<br>
++=C2=A0 =C2=A0 =C2=A0 thunk_name =3D thunk_name_buf;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 thunk_name =3D NULL;<br>
++<br>
++=C2=A0 snprintf (push_buf, sizeof (push_buf), &quot;push{%c}\t%s&quot;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_64BIT ? &#39;q&#39; : &#39;l&#3=
9;, xasm);<br>
++<br>
++=C2=A0 if (sibcall_p)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 output_asm_insn (push_buf, &amp;call_op);<br>
++=C2=A0 =C2=A0 =C2=A0 if (thunk_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tbnd jmp=
\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tjmp\t%s=
\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 char indirectlabel1[32];<br>
++=C2=A0 =C2=A0 =C2=A0 char indirectlabel2[32];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel1,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (indirectlabel2,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INDIRECT_LABEL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectlabelno++);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Jump.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tbnd jmp\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tjmp\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name_raw (asm_out_file, indirectlabel2);<br=
>
++=C2=A0 =C2=A0 =C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlab=
el1);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* An external function may be called via GOT, inste=
ad of PLT.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (MEM_P (call_op))<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ix86_address parts;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx addr =3D XEXP (call_op, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ix86_decompose_address (addr, &amp;parts)=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; parts.base =3D=3D st=
ack_pointer_rtx)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Since call will adjust stack=
 by -UNITS_PER_WORD,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0we must convert &q=
uot;disp(stack, index, scale)&quot; to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;disp+UNITS_P=
ER_WORD(stack, index, scale)&quot;.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parts.index)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D gen_rtx_=
MULT (Pmode, parts.index,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GEN_INT (parts.s=
cale));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D gen_rtx_=
PLUS (Pmode, stack_pointer_rtx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D stack_pointer_r=
tx;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx disp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (parts.disp !=3D NULL_RTX)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disp =3D plus_constant (=
Pmode, parts.disp,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UNITS_PER_WORD);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disp =3D GEN_INT (UNITS_=
PER_WORD);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D gen_rtx_PLUS (Pmode, a=
ddr, disp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call_op =3D gen_rtx_MEM (GET_MO=
DE (call_op), addr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 output_asm_insn (push_buf, &amp;call_op);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (thunk_name !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tbnd jmp=
\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\tjmp\t%s=
\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlab=
el2);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Call.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tbnd call\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 fputs (&quot;\tcall\t&quot;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 assemble_name_raw (asm_out_file, indirectlabel1);<br=
>
++=C2=A0 =C2=A0 =C2=A0 fputc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* Output indirect branch via a call and return thunk.=C2=A0 CALL_OP is<b=
r>
++=C2=A0 =C2=A0the branch target.=C2=A0 XASM is the assembly template for C=
ALL_OP.<br>
++=C2=A0 =C2=A0Branch is a tail call if SIBCALL_P is true.=C2=A0 =C2=A0*/<b=
r>
++<br>
++static void<br>
++ix86_output_indirect_branch (rtx call_op, const char *xasm,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bool sibcall_p)<br>
++{<br>
++=C2=A0 if (REG_P (call_op))<br>
++=C2=A0 =C2=A0 ix86_output_indirect_branch_vi<wbr>a_reg (call_op, sibcall_=
p);<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 ix86_output_indirect_branch_vi<wbr>a_push (call_op, xasm, s=
ibcall_p);<br>
++}<br>
++/* Output indirect jump.=C2=A0 CALL_OP is the jump target.=C2=A0 Jump is =
a<br>
++=C2=A0 =C2=A0function return if RET_P is true.=C2=A0 */<br>
++<br>
++const char *<br>
++ix86_output_indirect_jmp (rtx call_op, bool ret_p)<br>
++{<br>
++=C2=A0 if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type !=3D indirect_b=
ranch_keep)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* We can&#39;t have red-zone if this isn&#39;t a fu=
nction return since<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;call&quot; in the indirect thunk pushes =
the return address onto<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0stack, destroying red-zone.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (!ret_p &amp;&amp; ix86_red_zone_size !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 gcc_unreachable ();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 ix86_output_indirect_branch (call_op, &quot;%0&quot;=
, true);<br>
++=C2=A0 =C2=A0 =C2=A0 return &quot;&quot;;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 return &quot;%!jmp\t%A0&quot;;<br>
++}<br>
++<br>
+ /* Output the assembly for a call instruction.=C2=A0 */<br>
+<br>
+ const char *<br>
+ ix86_output_call_insn (rtx_insn *insn, rtx call_op)<br>
+ {<br>
+=C2=A0 =C2=A0bool direct_p =3D constant_call_address_operand (call_op, VOI=
Dmode);<br>
++=C2=A0 bool output_indirect_p<br>
++=C2=A0 =C2=A0 =3D (!TARGET_SEH<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; cfun-&gt;machine-&gt;indirect_branc=
h<wbr>_type !=3D indirect_branch_keep);<br>
+=C2=A0 =C2=A0bool seh_nop_p =3D false;<br>
+=C2=A0 =C2=A0const char *xasm;<br>
+<br>
+@@ -27383,7 +27948,13 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_o=
p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (direct_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ix86_nopic_noplt_attribute_p (call_o=
p))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!jmp\t{*%p0@GOTPCREL(%=
%rip)|<wbr>[QWORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 direct_p =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (output_indirect_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;{%p0@GOTP=
CREL(%%rip)|[QWORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!jmp\t{*=
%p0@GOTPCREL(%%rip)|<wbr>[QWORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xasm =3D &quot;%!jmp\t%P0&quot;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -27392,9 +27963,17 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_o=
p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (TARGET_SEH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xasm =3D &quot;%!rex.W jmp\t%A0&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!jmp\t%A0&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (output_indirect_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%0&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!jmp\t%A0&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 output_asm_insn (xasm, &amp;call_op);<br>
++=C2=A0 =C2=A0 =C2=A0 if (output_indirect_p &amp;&amp; !direct_p)<br>
++=C2=A0 =C2=A0 =C2=A0 ix86_output_indirect_branch (call_op, xasm, true);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_asm_insn (xasm, &amp;call_op);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -27431,14 +28010,28 @@ ix86_output_call_insn (rtx_insn *insn, rtx call_=
op)<br>
+=C2=A0 =C2=A0if (direct_p)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ix86_nopic_noplt_attribute_p (call_op))<br>
+-=C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!call\t{*%p0@GOTPCREL(%%rip)<wbr>|[Q=
WORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 direct_p =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (output_indirect_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;{%p0@GOTPCREL(%%rip)|[Q=
WORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!call\t{*%p0@GOTPCREL(=
%%rip)<wbr>|[QWORD PTR %p0@GOTPCREL[rip]]}&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xasm =3D &quot;%!call\t%P0&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 xasm =3D &quot;%!call\t%A0&quot;;<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (output_indirect_p)<br>
++=C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%0&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 xasm =3D &quot;%!call\t%A0&quot;;<br>
++=C2=A0 =C2=A0 }<br>
+<br>
+-=C2=A0 output_asm_insn (xasm, &amp;call_op);<br>
++=C2=A0 if (output_indirect_p &amp;&amp; !direct_p)<br>
++=C2=A0 =C2=A0 ix86_output_indirect_branch (call_op, xasm, false);<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 output_asm_insn (xasm, &amp;call_op);<br>
+<br>
+=C2=A0 =C2=A0if (seh_nop_p)<br>
+=C2=A0 =C2=A0 =C2=A0return &quot;nop&quot;;<br>
+@@ -44836,7 +45429,7 @@ ix86_handle_struct_attribute (tree *node, tree nam=
e, tree, int,<br>
+ }<br>
+<br>
+ static tree<br>
+-ix86_handle_fndecl_attribute (tree *node, tree name, tree, int,<br>
++ix86_handle_fndecl_attribute (tree *node, tree name, tree args, int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool *no_add_attrs)<br>
+ {<br>
+=C2=A0 =C2=A0if (TREE_CODE (*node) !=3D FUNCTION_DECL)<br>
+@@ -44845,6 +45438,29 @@ ix86_handle_fndecl_attribute (tree *node, tree na=
me, tree, int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*no_add_attrs =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 if (is_attribute_p (&quot;indirect_branch&quot;, name))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 tree cst =3D TREE_VALUE (args);<br>
++=C2=A0 =C2=A0 =C2=A0 if (TREE_CODE (cst) !=3D STRING_CST)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning (OPT_Wattributes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%qE a=
ttribute requires a string constant argument&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *no_add_attrs =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &quot;ke=
ep&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk-inline&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk-extern&quot;) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning (OPT_Wattributes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;argum=
ent to %qE attribute is not &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(keep=
|thunk|thunk-inline|thu<wbr>nk-extern)&quot;, name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *no_add_attrs =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0return NULL_TREE;<br>
+ }<br>
+<br>
+@@ -49072,6 +49688,9 @@ static const struct attribute_spec ix86_attribute_=
table[] =3D<br>
+=C2=A0 =C2=A0 =C2=A0false },<br>
+=C2=A0 =C2=A0{ &quot;callee_pop_aggregate_return&quot;, 1, 1, false, true,=
 true,<br>
+=C2=A0 =C2=A0 =C2=A0ix86_handle_callee_pop_aggreg<wbr>ate_return, true },<=
br>
++=C2=A0 { &quot;indirect_branch&quot;, 1, 1, true, false, false,<br>
++=C2=A0 =C2=A0 ix86_handle_fndecl_attribute, false },<br>
++<br>
+=C2=A0 =C2=A0/* End element.=C2=A0 */<br>
+=C2=A0 =C2=A0{ NULL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0, false, false, false,=
 NULL, false }<br>
+ };<br>
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h<br>
+index 5414416..9dccdb0 100644<br>
+--- a/gcc/config/i386/i386.h<br>
++++ b/gcc/config/i386/i386.h<br>
+@@ -2572,6 +2572,13 @@ struct GTY(()) machine_function {<br>
+=C2=A0 =C2=A0/* If true, it is safe to not save/restore DRAP register.=C2=
=A0 */<br>
+=C2=A0 =C2=A0BOOL_BITFIELD no_drap_save_restore : 1;<br>
+<br>
++=C2=A0 /* How to generate indirec branch.=C2=A0 */<br>
++=C2=A0 ENUM_BITFIELD(indirect_branch) indirect_branch_type : 3;<br>
++<br>
++=C2=A0 /* If true, the current function has local indirect jumps, like<br=
>
++=C2=A0 =C2=A0 =C2=A0&quot;indirect_jump&quot; or &quot;tablejump&quot;.=
=C2=A0 */<br>
++=C2=A0 BOOL_BITFIELD has_local_indirect_jump : 1;<br>
++<br>
+=C2=A0 =C2=A0/* If true, there is register available for argument passing.=
=C2=A0 This<br>
+=C2=A0 =C2=A0 =C2=A0 is used only in ix86_function_ok_for_sibcall by 32-bi=
t to determine<br>
+=C2=A0 =C2=A0 =C2=A0 if there is scratch register available for indirect s=
ibcall.=C2=A0 In<br>
+diff --git a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer"=
 target=3D"_blank">i386.md</a> b/gcc/config/i386/<a href=3D"http://i386.md"=
 rel=3D"noreferrer" target=3D"_blank">i386.md</a><br>
+index d2bfe31..153e162 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
+@@ -11807,13 +11807,18 @@<br>
+ {<br>
+=C2=A0 =C2=A0if (TARGET_X32)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
++=C2=A0 cfun-&gt;machine-&gt;has_local_indir<wbr>ect_jump =3D true;<br>
+ })<br>
+<br>
+ (define_insn &quot;*indirect_jump&quot;<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand:W 0 &quot;indirect_branch_operand&q=
uot; &quot;rBw&quot;))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+-=C2=A0 &quot;%!jmp\t%A0&quot;<br>
+-=C2=A0 [(set_attr &quot;type&quot; &quot;ibr&quot;)<br>
++=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], false);&quot=
;<br>
++=C2=A0 [(set (attr &quot;type&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0(if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D indirect_branch_keep)&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;multi&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;ibr&quot;)))<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;0&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;maybe_prefix_bnd&quot; &quot;1&quot;)])<br>
+<br>
+@@ -11856,14 +11861,19 @@<br>
+<br>
+=C2=A0 =C2=A0if (TARGET_X32)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
++=C2=A0 cfun-&gt;machine-&gt;has_local_indir<wbr>ect_jump =3D true;<br>
+ })<br>
+<br>
+ (define_insn &quot;*tablejump_1&quot;<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand:W 0 &quot;indirect_branch_operand&q=
uot; &quot;rBw&quot;))<br>
+=C2=A0 =C2=A0 (use (label_ref (match_operand 1)))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+-=C2=A0 &quot;%!jmp\t%A0&quot;<br>
+-=C2=A0 [(set_attr &quot;type&quot; &quot;ibr&quot;)<br>
++=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], false);&quot=
;<br>
++=C2=A0 [(set (attr &quot;type&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0(if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D indirect_branch_keep)&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;multi&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;ibr&quot;)))<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;0&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;maybe_prefix_bnd&quot; &quot;1&quot;)])<br>
+<br>
+@@ -12520,8 +12530,12 @@<br>
+=C2=A0 =C2=A0[(simple_return)<br>
+=C2=A0 =C2=A0 (use (match_operand:SI 0 &quot;register_operand&quot; &quot;=
r&quot;))]<br>
+=C2=A0 =C2=A0&quot;reload_completed&quot;<br>
+-=C2=A0 &quot;%!jmp\t%A0&quot;<br>
+-=C2=A0 [(set_attr &quot;type&quot; &quot;ibr&quot;)<br>
++=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], true);&quot;=
<br>
++=C2=A0 [(set (attr &quot;type&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0(if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=3D indirect_branch_keep)&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;multi&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 (const_string &quot;ibr&quot;)))<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;0&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;maybe_prefix_bnd&quot; &quot;1&quot;)])<br>
+<br>
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt<br>
+index f304b62..5ffa334 100644<br>
+--- a/gcc/config/i386/i386.opt<br>
++++ b/gcc/config/i386/i386.opt<br>
+@@ -897,3 +897,23 @@ Enum(stack_protector_guard) String(global) Value(SSP_=
GLOBAL)<br>
+ mmitigate-rop<br>
+ Target Var(flag_mitigate_rop) Init(0)<br>
+ Attempt to avoid generating instruction sequences containing ret bytes.<b=
r>
++<br>
++mindirect-branch=3D<br>
++Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_indire=
ct_branch) Init(indirect_branch_keep)<br>
++Convert indirect call and jump to call and return thunks.<br>
++<br>
++Enum<br>
++Name(indirect_branch) Type(enum indirect_branch)<br>
++Known indirect branch choices (for use with the -mindirect-branch=3D opti=
on):<br>
++<br>
++EnumValue<br>
++Enum(indirect_branch) String(keep) Value(indirect_branch_keep)<br>
++<br>
++EnumValue<br>
++Enum(indirect_branch) String(thunk) Value(indirect_branch_thunk)<br>
++<br>
++EnumValue<br>
++Enum(indirect_branch) String(thunk-inline) Value(indirect_branch_thunk_in=
<wbr>line)<br>
++<br>
++EnumValue<br>
++Enum(indirect_branch) String(thunk-extern) Value(indirect_branch_thunk_ex=
<wbr>tern)<br>
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi<br>
+index 8cc4f7e..8668dae 100644<br>
+--- a/gcc/doc/extend.texi<br>
++++ b/gcc/doc/extend.texi<br>
+@@ -5419,6 +5419,16 @@ Specify which floating-point unit to use.=C2=A0 You=
 must specify the<br>
+ @code{target(&quot;fpmath=3Dsse,387&quot;)<wbr>} option as<br>
+ @code{target(&quot;fpmath=3Dsse+387&quot;)<wbr>} because the comma would =
separate<br>
+ different options.<br>
++<br>
++@item indirect_branch(&quot;@var{choice}&quot;<wbr>)<br>
++@cindex @code{indirect_branch} function attribute, x86<br>
++On x86 targets, the @code{indirect_branch} attribute causes the compiler<=
br>
++to convert indirect call and jump with @var{choice}.=C2=A0 @samp{keep}<br=
>
++keeps indirect call and jump unmodified.=C2=A0 @samp{thunk} converts indi=
rect<br>
++call and jump to call and return thunk.=C2=A0 @samp{thunk-inline} convert=
s<br>
++indirect call and jump to inlined call and return thunk.<br>
++@samp{thunk-extern} converts indirect call and jump to external call<br>
++and return thunk provided in a separate object file.<br>
+ @end table<br>
+<br>
+ On the x86, the inliner does not inline a<br>
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
+index b066f7b..ff9a194 100644<br>
+--- a/gcc/doc/invoke.texi<br>
++++ b/gcc/doc/invoke.texi<br>
+@@ -1169,7 +1169,7 @@ See RS/6000 and PowerPC Options.<br>
+ -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol<br>
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol<br>
+ -malign-data=3D@var{type} -mstack-protector-guard=3D@var{g<wbr>uard} @gol=
<br>
+--mmitigate-rop}<br>
++-mmitigate-rop -mindirect-branch=3D@var{choice}<wbr>}<br>
+<br>
+ @emph{x86 Windows Options}<br>
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol<br>
+@@ -24218,6 +24218,17 @@ opcodes, to mitigate against certain forms of att=
ack. At the moment,<br>
+ this option is limited in what it can do and should not be relied<br>
+ on to provide serious protection.<br>
+<br>
++@item -mindirect-branch=3D@var{choice}<br>
++@opindex -mindirect-branch<br>
++Convert indirect call and jump with @var{choice}.=C2=A0 The default is<br=
>
++@samp{keep}, which keeps indirect call and jump unmodified.<br>
++@samp{thunk} converts indirect call and jump to call and return thunk.<br=
>
++@samp{thunk-inline} converts indirect call and jump to inlined call<br>
++and return thunk.=C2=A0 @samp{thunk-extern} converts indirect call and ju=
mp<br>
++to external call and return thunk provided in a separate object file.<br>
++You can control this behavior for a specific function by using the<br>
++function attribute @code{indirect_branch}.=C2=A0 @xref{Function Attribute=
s}.<br>
++<br>
+ @end table<br>
+<br>
+ These @samp{-m} switches are supported in addition to the above<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+new file mode 100644<br>
+index 0000000..d983e1c<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+new file mode 100644<br>
+index 0000000..58f09b4<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+new file mode 100644<br>
+index 0000000..f20d35c<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+new file mode 100644<br>
+index 0000000..0eff8fb<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+new file mode 100644<br>
+index 0000000..a25b20d<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+@@ -0,0 +1,17 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk&quot; =
} */<br>
++<br>
++extern void bar (void);<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+new file mode 100644<br>
+index 0000000..cff114a<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+@@ -0,0 +1,18 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk&quot; =
} */<br>
++<br>
++extern void bar (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+new file mode 100644<br>
+index 0000000..afdb600<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+@@ -0,0 +1,44 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++void func0 (void);<br>
++void func1 (void);<br>
++void func2 (void);<br>
++void func3 (void);<br>
++void func4 (void);<br>
++void func4 (void);<br>
++void func5 (void);<br>
++<br>
++void<br>
++bar (int i)<br>
++{<br>
++=C2=A0 switch (i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 func0 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 func1 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 func2 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 func3 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 func4 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 func5 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+new file mode 100644<br>
+index 0000000..d64d978<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+@@ -0,0 +1,23 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++extern void male_indirect_jump (long)<br>
++=C2=A0 __attribute__ ((indirect_branch(&quot;thunk&quot;)));<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+new file mode 100644<br>
+index 0000000..9306745<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk&quot;)))<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+new file mode 100644<br>
+index 0000000..97744d6<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+@@ -0,0 +1,23 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++extern int male_indirect_jump (long)<br>
++=C2=A0 __attribute__ ((indirect_branch(&quot;thunk-inlin<wbr>e&quot;)));<=
br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+new file mode 100644<br>
+index 0000000..bfce3ea<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk-inlin<wbr>e&quot;)))<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+new file mode 100644<br>
+index 0000000..0833606<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++extern int male_indirect_jump (long)<br>
++=C2=A0 __attribute__ ((indirect_branch(&quot;thunk-exter<wbr>n&quot;)));<=
br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+new file mode 100644<br>
+index 0000000..2eba0fb<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk-exter<wbr>n&quot;)))<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+new file mode 100644<br>
+index 0000000..f58427e<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+@@ -0,0 +1,44 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++<br>
++void func0 (void);<br>
++void func1 (void);<br>
++void func2 (void);<br>
++void func3 (void);<br>
++void func4 (void);<br>
++void func4 (void);<br>
++void func5 (void);<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk-exter<wbr>n&quot;)))<br>
++void<br>
++bar (int i)<br>
++{<br>
++=C2=A0 switch (i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 func0 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 func1 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 func2 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 func3 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 func4 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 func5 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c<br>
+new file mode 100644<br>
+index 0000000..564ed39<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c<br>
+@@ -0,0 +1,42 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++<br>
++void func0 (void);<br>
++void func1 (void);<br>
++void func2 (void);<br>
++void func3 (void);<br>
++void func4 (void);<br>
++void func4 (void);<br>
++void func5 (void);<br>
++<br>
++__attribute__ ((indirect_branch(&quot;keep&quot;)))<br>
++void<br>
++bar (int i)<br>
++{<br>
++=C2=A0 switch (i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 func0 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 func1 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 func2 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 func3 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 func4 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 func5 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+new file mode 100644<br>
+index 0000000..50fbee2<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile { target { ! x32 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fno-pic&quot; } */<br>
++<br>
++void (*dispatch) (char *);<br>
++char buf[10];<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 dispatch (buf);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
++/* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+new file mode 100644<br>
+index 0000000..2976e67<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile { target { ! x32 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fno-pic&quot; } */<br>
++<br>
++void (*dispatch) (char *);<br>
++char buf[10];<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 dispatch (buf);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
++/* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+new file mode 100644<br>
+index 0000000..da4bc98<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+@@ -0,0 +1,19 @@<br>
++/* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fpic -fno-plt&quot; } */<br>
++<br>
++void bar (char *);<br>
++char buf[10];<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar (buf);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
++/* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+new file mode 100644<br>
+index 0000000..c64d12e<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fpic -fno-plt&quot; } */<br>
++<br>
++void bar (char *);<br>
++char buf[10];<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar (buf);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk&=
quot; } } */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-times &quot;bnd call\[ \t\]*\.LIND&quot; 2=
 } } */<br>
++/* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+new file mode 100644<br>
+index 0000000..49f27b4<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+@@ -0,0 +1,19 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+new file mode 100644<br>
+index 0000000..a1e3eb6<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+@@ -0,0 +1,19 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+new file mode 100644<br>
+index 0000000..395634e<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+new file mode 100644<br>
+index 0000000..fd3f633<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+new file mode 100644<br>
+index 0000000..ba2f92b<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+@@ -0,0 +1,16 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern=
<wbr>&quot; } */<br>
++<br>
++extern void bar (void);<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+new file mode 100644<br>
+index 0000000..0c5a2d4<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+@@ -0,0 +1,17 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern=
<wbr>&quot; } */<br>
++<br>
++extern void bar (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 } }=
 */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+new file mode 100644<br>
+index 0000000..6652523<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+@@ -0,0 +1,43 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++<br>
++void func0 (void);<br>
++void func1 (void);<br>
++void func2 (void);<br>
++void func3 (void);<br>
++void func4 (void);<br>
++void func4 (void);<br>
++void func5 (void);<br>
++<br>
++void<br>
++bar (int i)<br>
++{<br>
++=C2=A0 switch (i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 func0 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 func1 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 func2 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 func3 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 func4 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 func5 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+new file mode 100644<br>
+index 0000000..68c0ff7<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+new file mode 100644<br>
+index 0000000..e2da1fc<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+new file mode 100644<br>
+index 0000000..244fec7<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+new file mode 100644<br>
+index 0000000..107ebe3<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+@@ -0,0 +1,21 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch[256];<br>
++<br>
++int<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch[offset](offset);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+new file mode 100644<br>
+index 0000000..17b04ef<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+@@ -0,0 +1,17 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline=
<wbr>&quot; } */<br>
++<br>
++extern void bar (void);<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+new file mode 100644<br>
+index 0000000..d9eb112<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+@@ -0,0 +1,18 @@<br>
++/* { dg-do compile { target *-*-linux* } } */<br>
++/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline=
<wbr>&quot; } */<br>
++<br>
++extern void bar (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+new file mode 100644<br>
+index 0000000..d02b1dc<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+@@ -0,0 +1,44 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++<br>
++void func0 (void);<br>
++void func1 (void);<br>
++void func2 (void);<br>
++void func3 (void);<br>
++void func4 (void);<br>
++void func4 (void);<br>
++void func5 (void);<br>
++<br>
++void<br>
++bar (int i)<br>
++{<br>
++=C2=A0 switch (i)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 func0 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 1:<br>
++=C2=A0 =C2=A0 =C2=A0 func1 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 2:<br>
++=C2=A0 =C2=A0 =C2=A0 func2 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 3:<br>
++=C2=A0 =C2=A0 =C2=A0 func3 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 4:<br>
++=C2=A0 =C2=A0 =C2=A0 func4 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case 5:<br>
++=C2=A0 =C2=A0 =C2=A0 func5 ();<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0005-uclibc-locale-no__=
x<wbr>.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0005-uclibc-locale-no=
__x<wbr>.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0005-uclibc-locale-no__x=
.p<wbr>atch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0005-uclibc-locale-no__x.p=
<wbr>atch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0005-x86-Add-mfunction-=
r<wbr>eturn.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0005-x86-Add-mfu=
nction-r<wbr>eturn.patch<br>
new file mode 100644<br>
index 0000000..2529bf2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0005-x86-Add-mfunction-r<wbr>e=
turn.patch<br>
@@ -0,0 +1,1567 @@<br>
+From e3270814b9e0caad63fbcdfd7ae9da<wbr>2d52c97497 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sat, 6 Jan 2018 22:29:56 -0800<br>
+Subject: [PATCH 05/12] x86: Add -mfunction-return=3D<br>
+<br>
+Add -mfunction-return=3D option to convert function return to call and<br>
+return thunks.=C2=A0 The default is &#39;keep&#39;, which keeps function r=
eturn<br>
+unmodified.=C2=A0 &#39;thunk&#39; converts function return to call and ret=
urn thunk.<br>
+&#39;thunk-inline&#39; converts function return to inlined call and return=
 thunk.<br>
+&#39;thunk-extern&#39; converts function return to external call and retur=
n<br>
+thunk provided in a separate object file.=C2=A0 You can control this behav=
ior<br>
+for a specific function by using the function attribute function_return.<b=
r>
+<br>
+Function return thunk is the same as memory thunk for -mindirect-branch=3D=
<br>
+where the return address is at the top of the stack:<br>
+<br>
+__x86_return_thunk:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call L2<br>
+L1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pause<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lfence<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp L1<br>
+L2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lea 8(%rsp), %rsp|lea 4(%esp), %esp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
+<br>
+and function return becomes<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp __x86_return_thunk<br>
+<br>
+-mindirect-branch=3D tests are updated with -mfunction-return=3Dkeep to<br=
>
+avoid false test failures when -mfunction-return=3Dthunk is added to<br>
+RUNTESTFLAGS for &quot;make check&quot;.<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386-protos.h (ix86_output_functi=
on_return): New.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_set_indirect_branch_=
type<wbr>): Also<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set function_return_type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunk_name): Add ret_p to indicate th=
unk for function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk_functi<wbr>on): Pass fal=
se to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunk_name.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_branch_<wbr>via_reg): Lik=
ewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_branch_<wbr>via_push): Li=
kewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk_functi<wbr>on): Create a=
lias for function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return thunk if regno &lt; 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_function_return)<wbr>: New functio=
n.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_handle_fndecl_attribute<wbr>): Handle fun=
ction_return.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_attribute_table): Add function_return.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.h (machine_function): Add<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0function_return_type.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (simple_return_internal): Use<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_output_function_return.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(simple_return_internal_long)<wbr>: Likewise.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.opt (mfunction-return=3D): N=
ew option.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_branch): Mention -mfunction-return=3D=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/extend.texi: Document function_return fun=
ction attribute.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/invoke.texi: Document -mfunction-return=
=3D option.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-1.c (dg-o=
ptions): Add<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mfunction-return=3Dkeep.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-2.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-3.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-4.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-5.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-6.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-7.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-1.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-2.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-3.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-4.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-5.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-6.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-7.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-8.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-1.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-2.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-3.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-4.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-1.c: New test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-10.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-11.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-12.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-13.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-14.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-15.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-16.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-2.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-3.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-4.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-5.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-6.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-7.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-8.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-9.c: Likewise.<br>
+<br>
+i386: Don&#39;t use ASM_OUTPUT_DEF for TARGET_MACHO<br>
+<br>
+ASM_OUTPUT_DEF isn&#39;t defined for TARGET_MACHO.=C2=A0 Use ASM_OUTPUT_LA=
BEL to<br>
+generate the __x86_return_thunk label, instead of the set directive.<br>
+Update testcase to remove the __x86_return_thunk label check.=C2=A0 Since<=
br>
+-fno-pic is ignored on Darwin, update testcases to sscan or &quot;push&quo=
t;<br>
+only on Linux.<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/83839<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (output_indirect_thunk_fun=
ctio<wbr>n): Use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASM_OUTPUT_LABEL, instead of ASM_OUTPUT_DEF, fo=
r TARGET_MACHO<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for=C2=A0 __x86.return_thunk.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/83839<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-1.c: Scan=
 for &quot;push&quot; only on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Linux.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-2.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-3.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-4.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-7.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-1.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-2.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-5.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-6.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-7.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
1.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
3.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
4.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-10.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-11.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-12.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-13.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-14.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-15.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-9.c: Don&#39;t chec=
k the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__x86_return_thunk label.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Scan for &quot;push&quot; only for Linux.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386-protos.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
+ gcc/config/i386/i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 152 ++++++++++++++=
+++++--<br>
+ gcc/config/i386/i386.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br=
>
+ gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=3D"_=
blank">i386.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
+ gcc/config/i386/i386.opt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
+ gcc/doc/extend.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09=
 ++<br>
+ gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<b=
r>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-1.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-2.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-3.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-4.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-5.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-6.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-7.c=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-5.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-6.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-7.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-8.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-10.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 23 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-11.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 23 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-12.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 22 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-13.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 22 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-14.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 22 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-15.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 22 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-16.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 18 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-5.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 15 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-6.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-7.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-8.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 ++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-9.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 24 ++++<br>
+ 56 files changed, 516 insertions(+), 74 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-10.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-11.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-12.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-13.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-14.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-15.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-16.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-3.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-4.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-5.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-6.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-7.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-8.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-9.c<br>
+<br>
+diff --git a/gcc/config/i386/i386-protos.<wbr>h b/gcc/config/i386/i386-pro=
tos.<wbr>h<br>
+index eca4cbf..620d70e 100644<br>
+--- a/gcc/config/i386/i386-protos.<wbr>h<br>
++++ b/gcc/config/i386/i386-protos.<wbr>h<br>
+@@ -312,6 +312,7 @@ extern enum attr_cpu ix86_schedule;<br>
+<br>
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);<=
br>
+ extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);<b=
r>
++extern const char * ix86_output_function_return (bool long_p);<br>
+ extern bool ix86_operands_ok_for_move_mult<wbr>iple (rtx *operands, bool =
load,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enum machine_mode mode);<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 0b9fc4d..34e26a3 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -6390,6 +6390,31 @@ ix86_set_indirect_branch_type (tree fndecl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfun-&gt;machine-&gt;indirect_branc<wbr>h_type =
=3D ix86_indirect_branch;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++<br>
++=C2=A0 if (cfun-&gt;machine-&gt;function_retur<wbr>n_type =3D=3D indirect=
_branch_unset)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 tree attr =3D lookup_attribute (&quot;function_retur=
n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DECL_ATTRIBUTES (fndecl));<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (attr !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree args =3D TREE_VALUE (attr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (args =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_unreachable ();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tree cst =3D TREE_VALUE (args);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp (TREE_STRING_POINTER (cst), &quot;=
keep&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;function_return<w=
br>_type =3D indirect_branch_keep;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;function_return<w=
br>_type =3D indirect_branch_thunk;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk-inline&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;function_return<w=
br>_type =3D indirect_branch_thunk_inline;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &=
quot;thunk-extern&quot;) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;function_return<w=
br>_type =3D indirect_branch_thunk_extern;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_unreachable ();<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 cfun-&gt;machine-&gt;function_return<wbr>_type =3D i=
x86_function_return;<br>
++=C2=A0 =C2=A0 }<br>
+ }<br>
+<br>
+ /* Establish appropriate back-end context for processing the function<br>
+@@ -11036,8 +11061,12 @@ static int indirect_thunks_bnd_used;<br>
+ /* Fills in the label name that should be used for the indirect thunk.=C2=
=A0 */<br>
+<br>
+ static void<br>
+-indirect_thunk_name (char name[32], int regno, bool need_bnd_p)<br>
++indirect_thunk_name (char name[32], int regno, bool need_bnd_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool=
 ret_p)<br>
+ {<br>
++=C2=A0 if (regno &gt;=3D 0 &amp;&amp; ret_p)<br>
++=C2=A0 =C2=A0 gcc_unreachable ();<br>
++<br>
+=C2=A0 =C2=A0if (USE_HIDDEN_LINKONCE)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bnd =3D need_bnd_p ? &quot;_bnd&quo=
t; : &quot;&quot;;<br>
+@@ -11052,7 +11081,10 @@ indirect_thunk_name (char name[32], int regno, bo=
ol need_bnd_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bnd, reg_pr=
efix, reg_names[regno]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_indirect_thunk%s&quot;, b=
nd);<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *ret =3D ret_p ? &quot;return&quot=
; : &quot;indirect&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_%s_thunk%s&quot;, =
ret, bnd);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -11065,10 +11097,20 @@ indirect_thunk_name (char name[32], int regno, b=
ool need_bnd_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LITB&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LA=
BEL (name, &quot;LRTB&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LA=
BEL (name, &quot;LRT&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LABEL (name, &qu=
ot;LIT&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LA=
BEL (name, &quot;LITB&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_GENERATE_INTERNAL_LA=
BEL (name, &quot;LIT&quot;, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+@@ -11163,7 +11205,7 @@ output_indirect_thunk_function (bool need_bnd_p, i=
nt regno)<br>
+=C2=A0 =C2=A0tree decl;<br>
+<br>
+=C2=A0 =C2=A0/* Create __x86_indirect_thunk/__x86_ind<wbr>irect_thunk_bnd.=
=C2=A0 */<br>
+-=C2=A0 indirect_thunk_name (name, regno, need_bnd_p);<br>
++=C2=A0 indirect_thunk_name (name, regno, need_bnd_p, false);<br>
+=C2=A0 =C2=A0decl =3D build_decl (BUILTINS_LOCATION, FUNCTION_DECL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_=
identifier (name),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buil=
d_function_type_list (void_type_node, NULL_TREE));<br>
+@@ -11206,6 +11248,36 @@ output_indirect_thunk_function (bool need_bnd_p, =
int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASM_OUTPUT_LABEL (asm_out_file, name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 if (regno &lt; 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* Create alias for __x86.return_thunk/__x86.retur<w=
br>n_thunk_bnd.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 char alias[32];<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (alias, regno, need_bnd_p, true)=
;<br>
++#if TARGET_MACHO<br>
++=C2=A0 =C2=A0 =C2=A0 if (TARGET_MACHO)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs (&quot;\t.weak_definition\t&quot;, asm_=
out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, alias);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs (&quot;\n\t.private_extern\t&quot;, asm=
_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, alias);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 putc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_LABEL (asm_out_file, alias);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 ASM_OUTPUT_DEF (asm_out_file, alias, name);<br>
++=C2=A0 =C2=A0 =C2=A0 if (USE_HIDDEN_LINKONCE)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs (&quot;\t.globl\t&quot;, asm_out_file);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, alias);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 putc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fputs (&quot;\t.hidden\t&quot;, asm_out_file)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assemble_name (asm_out_file, alias);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 putc (&#39;\n&#39;, asm_out_file);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++#endif<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0DECL_INITIAL (decl) =3D make_node (BLOCK);<br>
+=C2=A0 =C2=A0current_function_decl =3D decl;<br>
+=C2=A0 =C2=A0allocate_struct_function (decl, false);<br>
+@@ -27687,7 +27759,7 @@ ix86_output_indirect_branch_vi<wbr>a_reg (rtx call=
_op, bool sibcall_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunks_used |=3D 1 &lt;&=
lt; i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p);<br>
++=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0thunk_name =3D thunk_name_buf;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+@@ -27796,7 +27868,7 @@ ix86_output_indirect_branch_vi<wbr>a_push (rtx cal=
l_op, const char *xasm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunk_needed =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p);<br>
++=C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name_buf, regno, need_bnd=
_p, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0thunk_name =3D thunk_name_buf;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+@@ -27931,6 +28003,46 @@ ix86_output_indirect_jmp (rtx call_op, bool ret_p=
)<br>
+=C2=A0 =C2=A0 =C2=A0return &quot;%!jmp\t%A0&quot;;<br>
+ }<br>
+<br>
++/* Output function return.=C2=A0 CALL_OP is the jump target.=C2=A0 Add a =
REP<br>
++=C2=A0 =C2=A0prefix to RET if LONG_P is true and function return is kept.=
=C2=A0 */<br>
++<br>
++const char *<br>
++ix86_output_function_return (bool long_p)<br>
++{<br>
++=C2=A0 if (cfun-&gt;machine-&gt;function_retur<wbr>n_type !=3D indirect_b=
ranch_keep)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 char thunk_name[32];<br>
++=C2=A0 =C2=A0 =C2=A0 bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (curren=
t_output_insn);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (cfun-&gt;machine-&gt;function_retur<wbr>n_type<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_thunk_inline)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool need_thunk =3D (cfun-&gt;machine-&gt;fun=
ction_retur<wbr>n_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_branch_thunk);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name, -1, need_bnd=
_p, true);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_bnd_needed |=3D =
need_thunk;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\t=
bnd jmp\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_needed |=3D need=
_thunk;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\t=
jmp\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, -1);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return &quot;&quot;;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (!long_p || ix86_bnd_prefixed_insn_p (current_output_insn))<br>
++=C2=A0 =C2=A0 return &quot;%!ret&quot;;<br>
++<br>
++=C2=A0 return &quot;rep%; ret&quot;;<br>
++}<br>
++<br>
+ /* Output the assembly for a call instruction.=C2=A0 */<br>
+<br>
+ const char *<br>
+@@ -45461,6 +45573,28 @@ ix86_handle_fndecl_attribute (tree *node, tree na=
me, tree args, int,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 if (is_attribute_p (&quot;function_return&quot;, name))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 tree cst =3D TREE_VALUE (args);<br>
++=C2=A0 =C2=A0 =C2=A0 if (TREE_CODE (cst) !=3D STRING_CST)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning (OPT_Wattributes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%qE a=
ttribute requires a string constant argument&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *no_add_attrs =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (strcmp (TREE_STRING_POINTER (cst), &quot;ke=
ep&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk-inline&quot;) !=3D 0<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; strcmp (TREE_S=
TRING_POINTER (cst), &quot;thunk-extern&quot;) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 warning (OPT_Wattributes,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;argum=
ent to %qE attribute is not &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(keep=
|thunk|thunk-inline|thu<wbr>nk-extern)&quot;, name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *no_add_attrs =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0return NULL_TREE;<br>
+ }<br>
+<br>
+@@ -49690,6 +49824,8 @@ static const struct attribute_spec ix86_attribute_=
table[] =3D<br>
+=C2=A0 =C2=A0 =C2=A0ix86_handle_callee_pop_aggreg<wbr>ate_return, true },<=
br>
+=C2=A0 =C2=A0{ &quot;indirect_branch&quot;, 1, 1, true, false, false,<br>
+=C2=A0 =C2=A0 =C2=A0ix86_handle_fndecl_attribute, false },<br>
++=C2=A0 { &quot;function_return&quot;, 1, 1, true, false, false,<br>
++=C2=A0 =C2=A0 ix86_handle_fndecl_attribute, false },<br>
+<br>
+=C2=A0 =C2=A0/* End element.=C2=A0 */<br>
+=C2=A0 =C2=A0{ NULL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0, false, false, false,=
 NULL, false }<br>
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h<br>
+index 9dccdb0..b34bc11 100644<br>
+--- a/gcc/config/i386/i386.h<br>
++++ b/gcc/config/i386/i386.h<br>
+@@ -2579,6 +2579,9 @@ struct GTY(()) machine_function {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;indirect_jump&quot; or &quot;tablejump&quot;.=
=C2=A0 */<br>
+=C2=A0 =C2=A0BOOL_BITFIELD has_local_indirect_jump : 1;<br>
+<br>
++=C2=A0 /* How to generate function return.=C2=A0 */<br>
++=C2=A0 ENUM_BITFIELD(indirect_branch) function_return_type : 3;<br>
++<br>
+=C2=A0 =C2=A0/* If true, there is register available for argument passing.=
=C2=A0 This<br>
+=C2=A0 =C2=A0 =C2=A0 is used only in ix86_function_ok_for_sibcall by 32-bi=
t to determine<br>
+=C2=A0 =C2=A0 =C2=A0 if there is scratch register available for indirect s=
ibcall.=C2=A0 In<br>
+diff --git a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer"=
 target=3D"_blank">i386.md</a> b/gcc/config/i386/<a href=3D"http://i386.md"=
 rel=3D"noreferrer" target=3D"_blank">i386.md</a><br>
+index 153e162..2da671e 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
+@@ -12489,7 +12489,7 @@<br>
+ (define_insn &quot;simple_return_internal&quot;<br>
+=C2=A0 =C2=A0[(simple_return)]<br>
+=C2=A0 =C2=A0&quot;reload_completed&quot;<br>
+-=C2=A0 &quot;%!ret&quot;<br>
++=C2=A0 &quot;* return ix86_output_function_return (false);&quot;<br>
+=C2=A0 =C2=A0[(set_attr &quot;length&quot; &quot;1&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;atom_unit&quot; &quot;jeu&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;0&quot;)<br>
+@@ -12503,12 +12503,7 @@<br>
+=C2=A0 =C2=A0[(simple_return)<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_REP)]<br>
+=C2=A0 =C2=A0&quot;reload_completed&quot;<br>
+-{<br>
+-=C2=A0 if (ix86_bnd_prefixed_insn_p (insn))<br>
+-=C2=A0 =C2=A0 return &quot;%!ret&quot;;<br>
+-<br>
+-=C2=A0 return &quot;rep%; ret&quot;;<br>
+-}<br>
++=C2=A0 &quot;* return ix86_output_function_return (true);&quot;<br>
+=C2=A0 =C2=A0[(set_attr &quot;length&quot; &quot;2&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;atom_unit&quot; &quot;jeu&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;0&quot;)<br>
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt<br>
+index 5ffa334..ad5916f 100644<br>
+--- a/gcc/config/i386/i386.opt<br>
++++ b/gcc/config/i386/i386.opt<br>
+@@ -902,9 +902,13 @@ mindirect-branch=3D<br>
+ Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_indire=
ct_branch) Init(indirect_branch_keep)<br>
+ Convert indirect call and jump to call and return thunks.<br>
+<br>
++mfunction-return=3D<br>
++Target Report RejectNegative Joined Enum(indirect_branch) Var(ix86_functi=
on_return) Init(indirect_branch_keep)<br>
++Convert function return to call and return thunk.<br>
++<br>
+ Enum<br>
+ Name(indirect_branch) Type(enum indirect_branch)<br>
+-Known indirect branch choices (for use with the -mindirect-branch=3D opti=
on):<br>
++Known indirect branch choices (for use with the -mindirect-branch=3D/-mfu=
nction-<wbr>return=3D options):<br>
+<br>
+ EnumValue<br>
+ Enum(indirect_branch) String(keep) Value(indirect_branch_keep)<br>
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi<br>
+index 8668dae..2cb6bd1 100644<br>
+--- a/gcc/doc/extend.texi<br>
++++ b/gcc/doc/extend.texi<br>
+@@ -5429,6 +5429,15 @@ call and jump to call and return thunk.=C2=A0 @samp=
{thunk-inline} converts<br>
+ indirect call and jump to inlined call and return thunk.<br>
+ @samp{thunk-extern} converts indirect call and jump to external call<br>
+ and return thunk provided in a separate object file.<br>
++<br>
++@item function_return(&quot;@var{choice}&quot;<wbr>)<br>
++@cindex @code{function_return} function attribute, x86<br>
++On x86 targets, the @code{function_return} attribute causes the compiler<=
br>
++to convert function return with @var{choice}.=C2=A0 @samp{keep} keeps fun=
ction<br>
++return unmodified.=C2=A0 @samp{thunk} converts function return to call an=
d<br>
++return thunk.=C2=A0 @samp{thunk-inline} converts function return to inlin=
ed<br>
++call and return thunk.=C2=A0 @samp{thunk-extern} converts function return=
 to<br>
++external call and return thunk provided in a separate object file.<br>
+ @end table<br>
+<br>
+ On the x86, the inliner does not inline a<br>
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
+index ff9a194..fa63dc5 100644<br>
+--- a/gcc/doc/invoke.texi<br>
++++ b/gcc/doc/invoke.texi<br>
+@@ -1169,7 +1169,8 @@ See RS/6000 and PowerPC Options.<br>
+ -msse2avx -mfentry -mrecord-mcount -mnop-mcount -m8bit-idiv @gol<br>
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol<br>
+ -malign-data=3D@var{type} -mstack-protector-guard=3D@var{g<wbr>uard} @gol=
<br>
+--mmitigate-rop -mindirect-branch=3D@var{choice}<wbr>}<br>
++-mmitigate-rop -mindirect-branch=3D@var{choice} @gol<br>
++-mfunction-return=3D@var{choic<wbr>e}}<br>
+<br>
+ @emph{x86 Windows Options}<br>
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol<br>
+@@ -24229,6 +24230,17 @@ to external call and return thunk provided in a s=
eparate object file.<br>
+ You can control this behavior for a specific function by using the<br>
+ function attribute @code{indirect_branch}.=C2=A0 @xref{Function Attribute=
s}.<br>
+<br>
++@item -mfunction-return=3D@var{choice}<br>
++@opindex -mfunction-return<br>
++Convert function return with @var{choice}.=C2=A0 The default is @samp{kee=
p},<br>
++which keeps function return unmodified.=C2=A0 @samp{thunk} converts funct=
ion<br>
++return to call and return thunk.=C2=A0 @samp{thunk-inline} converts funct=
ion<br>
++return to inlined call and return thunk.=C2=A0 @samp{thunk-extern} conver=
ts<br>
++function return to external call and return thunk provided in a separate<=
br>
++object file.=C2=A0 You can control this behavior for a specific function =
by<br>
++using the function attribute @code{function_return}.<br>
++@xref{Function Attributes}.<br>
++<br>
+ @end table<br>
+<br>
+ These @samp{-m} switches are supported in addition to the above<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+index d983e1c..e365ef5 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+index 58f09b4..05a51ad 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+index f20d35c..3c0d4c3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+index 0eff8fb..14d4ef6 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+index a25b20d..b4836c3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk&quot; =
} */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+index cff114a..1f06bd1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk&quot; =
} */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+index afdb600..bc6b47a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+@@ -35,7 +35,7 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+index d64d978..2257be3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+index 9306745..e9cfdc5 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+index 97744d6..f938db0 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+index bfce3ea..4e58599 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -13,7 +13,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+index 0833606..b8d5024 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -14,7 +14,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+index 2eba0fb..455adab 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -13,7 +13,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+index f58427e..4595b84 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+@@ -36,7 +36,7 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c<br>
+index 564ed39..d730d31 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-8.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fno-pic&quot; } */<b=
r>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+index 50fbee2..5e3e118 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { ! x32 } } } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fno-pic&quot; } */<br>
+<br>
+ void (*dispatch) (char *);<br>
+ char buf[10];<br>
+@@ -10,7 +10,7 @@ foo (void)<br>
+=C2=A0 =C2=A0dispatch (buf);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+index 2976e67..2801aa4 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { ! x32 } } } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fno-pic&quot; } */<br>
+<br>
+ void (*dispatch) (char *);<br>
+ char buf[10];<br>
+@@ -11,7 +11,7 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+index da4bc98..70b4fb3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fpic -fno-plt&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fpic -fno-plt&quot; } */<br>
+<br>
+ void bar (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+index c64d12e..3baf03e 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -fcheck-pointer-bound=
s -mmpx -fpic -fno-plt&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fpic -fno-plt&quot; } */<br>
+<br>
+ void bar (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+index 49f27b4..edeb264 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+index a1e3eb6..1d00413 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+index 395634e..06ebf1c 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+index fd3f633..1c8f944 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+index ba2f92b..21740ac 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern=
<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-extern<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+index 0c5a2d4..a77c1f4 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-extern=
<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-extern<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+index 6652523..86e9fd1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+@@ -35,7 +35,7 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+index 68c0ff7..3ecde87 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+index e2da1fc..df32a19 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+index 244fec7..9540996 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+index 107ebe3..f3db6e2 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+index 17b04ef..0f687c3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline=
<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-inline<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+index d9eb112..b27c6fc 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -fpic -fno-plt -mindirect-branch=3Dthunk-inline=
<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-inline<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+index d02b1dc..764a375 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -fno-pic&quot;=
 } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+@@ -35,7 +35,7 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-1.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-1.c<br>
+new file mode 100644<br>
+index 0000000..7223f67<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-1.c<br>
+@@ -0,0 +1,13 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk&quot; } */<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+new file mode 100644<br>
+index 0000000..3a6727b<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+@@ -0,0 +1,23 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline -mindirect-bra=
nch=3Dthunk -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+new file mode 100644<br>
+index 0000000..b8f6818<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+@@ -0,0 +1,23 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-extern -mindirect-bra=
nch=3Dthunk -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+new file mode 100644<br>
+index 0000000..01b0a02<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+new file mode 100644<br>
+index 0000000..4b497b5<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++extern int foo (void) __attribute__ ((function_return(&quot;thunk&quot;))=
);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 3 } } =
*/<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 3 } }=
 */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_indirect_thunk&=
quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*__x86_indirect_thunk=
_(r|e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+new file mode 100644<br>
+index 0000000..4ae4c44<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-inlin<wbr>e&quot;)))<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+new file mode 100644<br>
+index 0000000..5b5bc76<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dke=
ep -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-exter<wbr>n&quot;), indirect_=
branch(&quot;thunk&quot;)))<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-16.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-16.c<br>
+new file mode 100644<br>
+index 0000000..a16cad1<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-16.c<br>
+@@ -0,0 +1,18 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline -mindirect-bra=
nch=3Dthunk-extern -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++__attribute__ ((function_return(&quot;keep&quot;), indirect_branch(&quot;=
keep&quot;)))<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
++/* { dg-final { scan-assembler-not &quot;__x86_return_thunk&quot; } } */<=
br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-2.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-2.c<br>
+new file mode 100644<br>
+index 0000000..c6659e3<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-2.c<br>
+@@ -0,0 +1,13 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline<wbr>&quot; } *=
/<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-3.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-3.c<br>
+new file mode 100644<br>
+index 0000000..0f7f388<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-3.c<br>
+@@ -0,0 +1,12 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-extern<wbr>&quot; } *=
/<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-4.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-4.c<br>
+new file mode 100644<br>
+index 0000000..9ae37e8<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-4.c<br>
+@@ -0,0 +1,12 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep&quot; } */<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-5.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-5.c<br>
+new file mode 100644<br>
+index 0000000..4bd0d2a<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-5.c<br>
+@@ -0,0 +1,15 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep&quot; } */<br>
++<br>
++extern void foo (void) __attribute__ ((function_return(&quot;thunk&quot;)=
));<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-6.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-6.c<br>
+new file mode 100644<br>
+index 0000000..053841f<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-6.c<br>
+@@ -0,0 +1,14 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep&quot; } */<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-inlin<wbr>e&quot;)))<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-7.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-7.c<br>
+new file mode 100644<br>
+index 0000000..262e678<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-7.c<br>
+@@ -0,0 +1,13 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep&quot; } */<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-exter<wbr>n&quot;)))<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-8.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-8.c<br>
+new file mode 100644<br>
+index 0000000..c1658e9<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-8.c<br>
+@@ -0,0 +1,14 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline<wbr>&quot; } *=
/<br>
++<br>
++extern void foo (void) __attribute__ ((function_return(&quot;keep&quot;))=
);<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+new file mode 100644<br>
+index 0000000..fa24a1f<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+@@ -0,0 +1,24 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dt=
hunk -fno-pic&quot; } */<br>
++<br>
++extern void (*bar) (void);<br>
++<br>
++int<br>
++foo (void)<br>
++{<br>
++=C2=A0 bar ();<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } } } }=
 */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } } } =
} */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } } } *=
/<br>
++/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } } } =
*/<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } } } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0006-uclibc-locale-wcha=
r<wbr>_fix.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0006-uclibc-local=
e-wchar<wbr>_fix.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0006-uclibc-locale-wchar=
_f<wbr>ix.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0006-uclibc-locale-wchar_f=
<wbr>ix.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0006-x86-Add-mindirect-=
b<wbr>ranch-register.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0006-x8=
6-Add-mindirect-b<wbr>ranch-register.patch<br>
new file mode 100644<br>
index 0000000..50921aa<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0006-x86-Add-mindirect-b<wbr>r=
anch-register.patch<br>
@@ -0,0 +1,943 @@<br>
+From 3f1c39fb543884d36e759a6dc196a8<wbr>e914eb4f73 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sat, 6 Jan 2018 22:29:56 -0800<br>
+Subject: [PATCH 06/12] x86: Add -mindirect-branch-register<br>
+<br>
+Add -mindirect-branch-register to force indirect branch via register.<br>
+This is implemented by disabling patterns of indirect branch via memory,<b=
r>
+similar to TARGET_X32.<br>
+<br>
+-mindirect-branch=3D and -mfunction-return=3D tests are updated with<br>
+-mno-indirect-branch-register to avoid false test failures when<br>
+-mindirect-branch-register is added to RUNTESTFLAGS for &quot;make check&q=
uot;.<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://constraints.md"=
 rel=3D"noreferrer" target=3D"_blank">constraints.md</a> (Bs): Disallow mem=
ory operand for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mindirect-branch-register.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Bw): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (indirect_branch_ope=
rand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT_memory_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sibcall_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT32_symbol_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (indirect_jump): Call convert_me=
mory_address<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for -mindirect-branch-register.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(tablejump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_value_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Disallow peepholes of indirect call and jump vi=
a memory for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mindirect-branch-register.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*call_pop): Replace m with Bw.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*call_value_pop): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_pop_memory): Replace m with Bs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.opt (mindirect-branch-regist=
er): New option.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/invoke.texi: Document -mindirect-branch-r=
egister option.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-1.c (dg-o=
ptions): Add<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mno-indirect-branch-register<wbr>.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-2.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-3.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-4.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-5.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-6.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-7.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-1.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-2.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-3.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-4.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-5.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-6.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-7.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-1.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-2.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-3.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-4.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-10.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-11.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-12.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-13.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-14.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-15.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-9.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
1.c: New test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
2.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
3.c: Likewise.<br>
+<br>
+i386: Rename to ix86_indirect_branch_register<br>
+<br>
+Rename the variable for -mindirect-branch-register to<br>
+ix86_indirect_branch_register to match the command-line option name.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://constraints.md"=
 rel=3D"noreferrer" target=3D"_blank">constraints.md</a> (Bs): Replace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_thunk_re<wbr>gister with<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register<wbr>.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Bw): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (indirect_jump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(tablejump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_value_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Peepholes of indirect call and jump via memory:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.opt: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (indirect_branch_ope=
rand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT_memory_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sibcall_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT32_symbol_operand): Likewise.<br>
+<br>
+x86: Rewrite ix86_indirect_branch_register logic<br>
+<br>
+Rewrite ix86_indirect_branch_register logic with<br>
+<br>
+(and (not (match_test &quot;ix86_indirect_branch_register<wbr>&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0(original condition before r256662))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (constant_call_addre=
ss_operand<wbr>):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Rewrite ix86_indirect_branch_register logic.<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sibcall_insn_operand): Likewise.<br>
+<br>
+Don&#39;t check ix86_indirect_branch_register for GOT operand<br>
+<br>
+Since GOT_memory_operand and GOT32_symbol_operand are simple pattern<br>
+matches, don&#39;t check ix86_indirect_branch_register here.=C2=A0 If need=
ed,<br>
+-mindirect-branch=3D will convert indirect branch via GOT slot to a call<b=
r>
+and return thunk.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://constraints.md"=
 rel=3D"noreferrer" target=3D"_blank">constraints.md</a> (Bs): Update<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register check.=C2=A0 Don&=
#39;t check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register with GOT_memory_o=
perand.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Bw): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (GOT_memory_operand)=
: Don&#39;t check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register here.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT32_symbol_operand): Likewise.<br>
+<br>
+i386: Rewrite indirect_branch_operand logic<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-15=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (indirect_branch_ope=
rand): Rewrite<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register logic.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer" targ=
et=3D"_blank">constraints.md</a><wbr>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
+ gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=3D"_=
blank">i386.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++++++++--------<br>
+ gcc/config/i386/i386.opt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++<br>
+ gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" targe=
t=3D"_blank">predicates.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 +++++++------<br>
+ gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++-<=
br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-1.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-2.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-3.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-4.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-5.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-6.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-7.c=C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-5.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-6.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-7.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-register-1.c=C2=A0 =C2=A0 | 22 ++=
++++++++++++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-register-2.c=C2=A0 =C2=A0 | 20 ++=
+++++++++++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-register-3.c=C2=A0 =C2=A0 | 19 ++=
++++++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-10.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-11.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-12.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-13.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-14.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-15.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-9.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
+ 47 files changed, 147 insertions(+), 63 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-regi=
ster-1.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-regi=
ster-2.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-regi=
ster-3.c<br>
+<br>
+diff --git a/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"nore=
ferrer" target=3D"_blank">constraints.<wbr>md</a> b/gcc/config/i386/<a href=
=3D"http://constraints.md" rel=3D"noreferrer" target=3D"_blank">constraints=
.<wbr>md</a><br>
+index 1a4c701..9204c8e 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer"=
 target=3D"_blank">constraints.<wbr>md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer"=
 target=3D"_blank">constraints.<wbr>md</a><br>
+@@ -172,14 +172,16 @@<br>
+<br>
+ (define_constraint &quot;Bs&quot;<br>
+=C2=A0 =C2=A0&quot;@internal Sibcall memory operand.&quot;<br>
+-=C2=A0 (ior (and (not (match_test &quot;TARGET_X32&quot;))<br>
++=C2=A0 (ior (and (not (match_test &quot;ix86_indirect_branch_register<wbr=
>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (not (match_test &quot;TARGET_X32&quot=
;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;sibcall_me=
mory_operand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp;&amp; P=
mode =3D=3D DImode&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;GOT_memory=
_operand&quot;))))<br>
+<br>
+ (define_constraint &quot;Bw&quot;<br>
+=C2=A0 =C2=A0&quot;@internal Call memory operand.&quot;<br>
+-=C2=A0 (ior (and (not (match_test &quot;TARGET_X32&quot;))<br>
++=C2=A0 (ior (and (not (match_test &quot;ix86_indirect_branch_register<wbr=
>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (not (match_test &quot;TARGET_X32&quot=
;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;memory_ope=
rand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp;&amp; P=
mode =3D=3D DImode&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;GOT_memory=
_operand&quot;))))<br>
+diff --git a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer"=
 target=3D"_blank">i386.md</a> b/gcc/config/i386/<a href=3D"http://i386.md"=
 rel=3D"noreferrer" target=3D"_blank">i386.md</a><br>
+index 2da671e..05a88ff 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
+@@ -11805,7 +11805,7 @@<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand 0 &quot;indirect_branch_operand&quo=
t;))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+ {<br>
+-=C2=A0 if (TARGET_X32)<br>
++=C2=A0 if (TARGET_X32 || ix86_indirect_branch_register)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
+=C2=A0 =C2=A0cfun-&gt;machine-&gt;has_local_indi<wbr>rect_jump =3D true;<b=
r>
+ })<br>
+@@ -11859,7 +11859,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPTAB_DI=
RECT);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 if (TARGET_X32)<br>
++=C2=A0 if (TARGET_X32 || ix86_indirect_branch_register)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
+=C2=A0 =C2=A0cfun-&gt;machine-&gt;has_local_indi<wbr>rect_jump =3D true;<b=
r>
+ })<br>
+@@ -12048,7 +12048,7 @@<br>
+=C2=A0 =C2=A0[(call (mem:QI (match_operand:W 0 &quot;memory_operand&quot; =
&quot;m&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 1))<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_PEEPSIB)]<br>
+-=C2=A0 &quot;!TARGET_X32&quot;<br>
++=C2=A0 &quot;!TARGET_X32 &amp;&amp; !ix86_indirect_branch_register<wbr>&q=
uot;<br>
+=C2=A0 =C2=A0&quot;* return ix86_output_call_insn (insn, operands[0]);&quo=
t;<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;call&quot;)])<br>
+<br>
+@@ -12057,7 +12057,9 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand:W 1 &quot;memory_operand&quot;))=
<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<=
br>
++=C2=A0 &quot;!TARGET_X32<br>
++=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))&quot;<br>
+=C2=A0 =C2=A0[(parallel [(call (mem:QI (match_dup 1))<br>
+@@ -12070,7 +12072,9 @@<br>
+=C2=A0 =C2=A0 (unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<=
br>
++=C2=A0 &quot;!TARGET_X32<br>
++=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))&quot;<br>
+=C2=A0 =C2=A0[(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)<br>
+@@ -12092,7 +12096,7 @@<br>
+ })<br>
+<br>
+ (define_insn &quot;*call_pop&quot;<br>
+-=C2=A0 [(call (mem:QI (match_operand:SI 0 &quot;call_insn_operand&quot; &=
quot;lmBz&quot;))<br>
++=C2=A0 [(call (mem:QI (match_operand:SI 0 &quot;call_insn_operand&quot; &=
quot;lBwBz&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 1))<br>
+=C2=A0 =C2=A0 (set (reg:SI SP_REG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(plus:SI (reg:SI SP_REG)<br>
+@@ -12112,7 +12116,7 @@<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;call&quot;)])<br>
+<br>
+ (define_insn &quot;*sibcall_pop_memory&quot;<br>
+-=C2=A0 [(call (mem:QI (match_operand:SI 0 &quot;memory_operand&quot; &quo=
t;m&quot;))<br>
++=C2=A0 [(call (mem:QI (match_operand:SI 0 &quot;memory_operand&quot; &quo=
t;Bs&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 1))<br>
+=C2=A0 =C2=A0 (set (reg:SI SP_REG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(plus:SI (reg:SI SP_REG)<br>
+@@ -12166,7 +12170,9 @@<br>
+=C2=A0 =C2=A0[(set (match_operand:W 0 &quot;register_operand&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand:W 1 &quot;memory_operand&=
quot;))<br>
+=C2=A0 =C2=A0 (set (pc) (match_dup 0))]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; peep2_reg_dead_p (2, operands[0])&quo=
t;<br>
++=C2=A0 &quot;!TARGET_X32<br>
++=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; peep2_reg_dead_p (2, operands[0])&quot;<br>
+=C2=A0 =C2=A0[(set (pc) (match_dup 1))])<br>
+<br>
+ ;; Call subroutine, returning value in operand 0<br>
+@@ -12244,7 +12250,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call (mem:QI (match_operand:W 1 &quot;memory_o=
perand&quot; &quot;m&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 2)))<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_PEEPSIB)]<br>
+-=C2=A0 &quot;!TARGET_X32&quot;<br>
++=C2=A0 &quot;!TARGET_X32 &amp;&amp; !ix86_indirect_branch_register<wbr>&q=
uot;<br>
+=C2=A0 =C2=A0&quot;* return ix86_output_call_insn (insn, operands[1]);&quo=
t;<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;callv&quot;)])<br>
+<br>
+@@ -12254,7 +12260,9 @@<br>
+=C2=A0 =C2=A0 (set (match_operand 2)<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))=
)]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<=
br>
++=C2=A0 &quot;!TARGET_X32<br>
++=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))&quot;<br>
+=C2=A0 =C2=A0[(parallel [(set (match_dup 2)<br>
+@@ -12269,7 +12277,9 @@<br>
+=C2=A0 =C2=A0 (set (match_operand 2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 3)))]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<=
br>
++=C2=A0 &quot;!TARGET_X32<br>
++=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))&quot;<br>
+=C2=A0 =C2=A0[(unspec_volatile [(const_int 0)] UNSPECV_BLOCKAGE)<br>
+@@ -12294,7 +12304,7 @@<br>
+<br>
+ (define_insn &quot;*call_value_pop&quot;<br>
+=C2=A0 =C2=A0[(set (match_operand 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 (call (mem:QI (match_operand:SI 1 &quot;call_insn_op=
erand&quot; &quot;lmBz&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 (call (mem:QI (match_operand:SI 1 &quot;call_insn_op=
erand&quot; &quot;lBwBz&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 2)))<br>
+=C2=A0 =C2=A0 (set (reg:SI SP_REG)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(plus:SI (reg:SI SP_REG)<br>
+diff --git a/gcc/config/i386/i386.opt b/gcc/config/i386/i386.opt<br>
+index ad5916f..a97f84f 100644<br>
+--- a/gcc/config/i386/i386.opt<br>
++++ b/gcc/config/i386/i386.opt<br>
+@@ -921,3 +921,7 @@ Enum(indirect_branch) String(thunk-inline) Value(indir=
ect_branch_thunk_in<wbr>line)<br>
+<br>
+ EnumValue<br>
+ Enum(indirect_branch) String(thunk-extern) Value(indirect_branch_thunk_ex=
<wbr>tern)<br>
++<br>
++mindirect-branch-register<br>
++Target Report Var(ix86_indirect_branch_regis<wbr>ter) Init(0)<br>
++Force indirect call and jump via register.<br>
+diff --git a/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noref=
errer" target=3D"_blank">predicates.m<wbr>d</a> b/gcc/config/i386/<a href=
=3D"http://predicates.md" rel=3D"noreferrer" target=3D"_blank">predicates.m=
<wbr>d</a><br>
+index 93dda7b..d1f0a7d 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" =
target=3D"_blank">predicates.m<wbr>d</a><br>
++++ b/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" =
target=3D"_blank">predicates.m<wbr>d</a><br>
+@@ -593,7 +593,8 @@<br>
+ ;; Test for a valid operand for indirect branch.<br>
+ (define_predicate &quot;indirect_branch_operand&quot;<br>
+=C2=A0 =C2=A0(ior (match_operand 0 &quot;register_operand&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;TARGET_X32&quot;))=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (not (match_test &quot;TARGET_X32&quot=
;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;memory_ope=
rand&quot;))))<br>
+<br>
+ ;; Return true if OP is a memory operands that can be used in sibcalls.<b=
r>
+@@ -636,20 +637,22 @@<br>
+=C2=A0 =C2=A0(ior (match_test &quot;constant_call_address_operand<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op,=
 mode =3D=3D VOIDmode ? mode : Pmode)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 0 &quot;call_register_no_elim_o=
perand<wbr>&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(ior (and (not (match_test &quot;TARGET_X32&qu=
ot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &=
quot;memory_operand&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp=
;&amp; Pmode =3D=3D DImode&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &=
quot;GOT_memory_operand&quot;)))))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ior (and (not (match_test &quot;TARGE=
T_X32&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ma=
tch_operand 0 &quot;memory_operand&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and (match_test &=
quot;TARGET_X32 &amp;&amp; Pmode =3D=3D DImode&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ma=
tch_operand 0 &quot;GOT_memory_operand&quot;))))))<br>
+<br>
+ ;; Similarly, but for tail calls, in which we cannot allow memory referen=
ces.<br>
+ (define_special_predicate &quot;sibcall_insn_operand&quot;<br>
+=C2=A0 =C2=A0(ior (match_test &quot;constant_call_address_operand<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op,=
 mode =3D=3D VOIDmode ? mode : Pmode)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 0 &quot;register_no_elim_operan=
d&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(ior (and (not (match_test &quot;TARGET_X32&qu=
ot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &=
quot;sibcall_memory_operand&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp=
;&amp; Pmode =3D=3D DImode&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &=
quot;GOT_memory_operand&quot;)))))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ior (and (not (match_test &quot;TARGE=
T_X32&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ma=
tch_operand 0 &quot;sibcall_memory_operand&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and (match_test &=
quot;TARGET_X32 &amp;&amp; Pmode =3D=3D DImode&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ma=
tch_operand 0 &quot;GOT_memory_operand&quot;))))))<br>
+<br>
+ ;; Return true if OP is a 32-bit GOT symbol operand.<br>
+ (define_predicate &quot;GOT32_symbol_operand&quot;<br>
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
+index fa63dc5..ad9f295 100644<br>
+--- a/gcc/doc/invoke.texi<br>
++++ b/gcc/doc/invoke.texi<br>
+@@ -1170,7 +1170,7 @@ See RS/6000 and PowerPC Options.<br>
+ -mavx256-split-unaligned-load -mavx256-split-unaligned-store @gol<br>
+ -malign-data=3D@var{type} -mstack-protector-guard=3D@var{g<wbr>uard} @gol=
<br>
+ -mmitigate-rop -mindirect-branch=3D@var{choice} @gol<br>
+--mfunction-return=3D@var{choic<wbr>e}}<br>
++-mfunction-return=3D@var{choic<wbr>e} -mindirect-branch-register}<br>
+<br>
+ @emph{x86 Windows Options}<br>
+ @gccoptlist{-mconsole -mcygwin -mno-cygwin -mdll @gol<br>
+@@ -24241,6 +24241,10 @@ object file.=C2=A0 You can control this behavior =
for a specific function by<br>
+ using the function attribute @code{function_return}.<br>
+ @xref{Function Attributes}.<br>
+<br>
++@item -mindirect-branch-register<br>
++@opindex -mindirect-branch-register<br>
++Force indirect call and jump via register.<br>
++<br>
+ @end table<br>
+<br>
+ These @samp{-m} switches are supported in addition to the above<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+index e365ef5..60d0988 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+index 05a51ad..aac7516 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+index 3c0d4c3..9e24a38 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mfunction-return=3Dkeep -mindir=
ect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+index 14d4ef6..127b5d9 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mfunction-return=3Dkeep -mindir=
ect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+index b4836c3..fcaa18d 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+index 1f06bd1..e464928 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mfunction-return=3Dkeep -fpic -=
fno-plt -mindirect-branch=3Dthunk&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+index bc6b47a..17c2d0f 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+index 2257be3..9194ccf 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+index e9cfdc5..e51f261 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+index f938db0..4aeec18 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+index 4e58599..ac0e599 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+index b8d5024..573cf1e 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+index 455adab..b2b37fc 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+index 4595b84..4a43e19 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fno-pic&quot; } */<br=
>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+index 5e3e118..ac84ab6 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { ! x32 } } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-bounds -mmpx -fno-pic&quo=
t; } */<br>
+<br>
+ void (*dispatch) (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+index 2801aa4..ce655e8 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { ! x32 } } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-bounds -mmpx -fno-pic&quo=
t; } */<br>
+<br>
+ void (*dispatch) (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+index 70b4fb3..d34485a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fpic -fno-plt&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk -fcheck-pointer-bounds -mmpx -fpic -fno-p=
lt&quot; } */<br>
+<br>
+ void bar (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+index 3baf03e..0e19830 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target { *-*-linux* &amp;&amp; { ! x32 } } } } */<br=
>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fcheck-pointer-bounds -mmpx -fpic -fno-plt&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mfunction-return=3Dkeep -mindirect-branch=3Dthunk -fcheck-poi=
nter-bounds -mmpx -fpic -fno-plt&quot; } */<br>
+<br>
+ void bar (char *);<br>
+ char buf[10];<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+index edeb264..579441f 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+index 1d00413..c92e6f2 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+index 06ebf1c..d9964c2 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+index 1c8f944..d4dca4d 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+index 21740ac..5c07e02 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-extern<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-extern<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+index a77c1f4..3eb4406 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-extern<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-extern<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+index 86e9fd1..aece938 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+index 3ecde87..3aba5e8 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+index df32a19..0f0181d 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+index 9540996..2eef6f3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+index f3db6e2..e825a10 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ typedef void (*dispatch_t)(long offset);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+index 0f687c3..c6d77e1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-inline<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-inline<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+index b27c6fc..6454827 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile { target *-*-linux* } } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -fpic -fno-plt -mindir=
ect-branch=3Dthunk-inline<wbr>&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -fpic -fno-plt -mindirect-branch=3Dthunk-inline<wbr>&quot; } */<br>
+<br>
+ extern void bar (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+index 764a375..c67066c 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ void func0 (void);<br>
+ void func1 (void);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-1.=
c b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-1.c<br>
+new file mode 100644<br>
+index 0000000..7d396a3<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-1.c<br>
+@@ -0,0 +1,22 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -mindirect-branch-reg=
ister -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;mov\[ \t\](%eax|%rax), \\((%esp|%rsp=
)\\)&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler-not &quot;push(?:l|q)\[ \t\]*_?dispatch&qu=
ot;=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk\n&quot; } }=
 */<br>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk_bnd\n&quot;=
 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-2.=
c b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-2.c<br>
+new file mode 100644<br>
+index 0000000..e7e616b<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-2.c<br>
+@@ -0,0 +1,20 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -mindirect-bra=
nch-register -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;mov\[ \t\](%eax|%rax), \\((%esp|%rsp=
)\\)&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler-not &quot;push(?:l|q)\[ \t\]*_?dispatch&qu=
ot;=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
++/* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-3.=
c b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-3.c<br>
+new file mode 100644<br>
+index 0000000..5320e92<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-3.c<br>
+@@ -0,0 +1,19 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -mindirect-bra=
nch-register -fno-pic&quot; } */<br>
++<br>
++typedef void (*dispatch_t)(long offset);<br>
++<br>
++dispatch_t dispatch;<br>
++<br>
++void<br>
++male_indirect_jump (long offset)<br>
++{<br>
++=C2=A0 dispatch(offset);<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;push(?:l|q)\[ \t\]*_?dispatch&qu=
ot;=C2=A0 } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
++/* { dg-final { scan-assembler-not {\t(pause|pause|nop)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+index 3a6727b..e6fea84 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline -mindirect-bra=
nch=3Dthunk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mfunction-return=3Dthunk-inline -mindirect-branch=3Dthunk -fn=
o-pic&quot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+index b8f6818..e239ec4 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-extern -mindirect-bra=
nch=3Dthunk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mno-indirect-branch-register -m=
function-return=3Dthunk-extern -mindirect-branch=3Dthunk -fno-pic&quot; } *=
/<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+index 01b0a02..fa31813 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mno-indirect-branch-register -m=
function-return=3Dkeep -mindirect-branch=3Dthunk -fno-pic&quot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+index 4b497b5..fd5b41f 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-inline -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-inline -fno-pic&quot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+ extern int foo (void) __attribute__ ((function_return(&quot;thunk&quot;))=
);<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+index 4ae4c44..d606373 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dth=
unk-extern -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mfunction-return=
=3Dkeep -mindirect-branch=3Dthunk-extern -fno-pic&quot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+index 5b5bc76..75e45e2 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dke=
ep -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mno-indirect-branch-register -mno-indirect-branch-register -m=
function-return=3Dkeep -mindirect-branch=3Dkeep -fno-pic&quot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+index fa24a1f..d1db41c 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+@@ -1,5 +1,5 @@<br>
+ /* { dg-do compile } */<br>
+-/* { dg-options &quot;-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dt=
hunk -fno-pic&quot; } */<br>
++/* { dg-options &quot;-O2 -mno-indirect-branch-register -mno-indirect-bra=
nch-register -mfunction-return=3Dthunk -mindirect-branch=3Dthunk -fno-pic&q=
uot; } */<br>
+<br>
+ extern void (*bar) (void);<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0007-uclibc-locale-upda=
t<wbr>e.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0007-uclibc-locale-u=
pdat<wbr>e.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0007-uclibc-locale-updat=
e.<wbr>patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0007-uclibc-locale-update.=
<wbr>patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0007-x86-Add-V-register=
-<wbr>operand-modifier.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0007-=
x86-Add-V-register-<wbr>operand-modifier.patch<br>
new file mode 100644<br>
index 0000000..714b0e1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0007-x86-Add-V-register-<wbr>o=
perand-modifier.patch<br>
@@ -0,0 +1,136 @@<br>
+From 8f0efd692eb8db06d6c00b759c872b<wbr>d2170b7f7b Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sat, 6 Jan 2018 22:29:56 -0800<br>
+Subject: [PATCH 07/12] x86: Add &#39;V&#39; register operand modifier<br>
+<br>
+Add &#39;V&#39;, a special modifier which prints the name of the full inte=
ger<br>
+register without &#39;%&#39;.=C2=A0 For<br>
+<br>
+extern void (*func_p) (void);<br>
+<br>
+void<br>
+foo (void)<br>
+{<br>
+=C2=A0 asm (&quot;call __x86_indirect_thunk_%V0&quot; : : &quot;a&quot; (f=
unc_p));<br>
+}<br>
+<br>
+it generates:<br>
+<br>
+foo:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 func_p(%rip), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call=C2=A0 =C2=A0 __x86_indirect_thunk_rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (print_reg): Print the nam=
e of the full<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0integer register without &#39;%&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_print_operand): Handle &#39;V&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * doc/extend.texi: Document &#39;V&#39; modifi=
er.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-register-=
4.c: New test.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 ++++++++++++-<br>
+ gcc/doc/extend.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-register-4.c | 13 +++++=
++++++++<br>
+ 3 files changed, 28 insertions(+), 1 deletion(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-regi=
ster-4.c<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 34e26a3..eeca7e5 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -16869,6 +16869,7 @@ put_condition_code (enum rtx_code code, machine_mo=
de mode, bool reverse,<br>
+=C2=A0 =C2=A0 If CODE is &#39;h&#39;, pretend the reg is the &#39;high&#39=
; byte register.<br>
+=C2=A0 =C2=A0 If CODE is &#39;y&#39;, print &quot;st(0)&quot; instead of &=
quot;st&quot;, if the reg is stack op.<br>
+=C2=A0 =C2=A0 If CODE is &#39;d&#39;, duplicate the operand for AVX instru=
ction.<br>
++=C2=A0 =C2=A0If CODE is &#39;V&#39;, print naked full integer register na=
me without %.<br>
+=C2=A0 */<br>
+<br>
+ void<br>
+@@ -16879,7 +16880,7 @@ print_reg (rtx x, int code, FILE *file)<br>
+=C2=A0 =C2=A0unsigned int regno;<br>
+=C2=A0 =C2=A0bool duplicated;<br>
+<br>
+-=C2=A0 if (ASSEMBLER_DIALECT =3D=3D ASM_ATT)<br>
++=C2=A0 if (ASSEMBLER_DIALECT =3D=3D ASM_ATT &amp;&amp; code !=3D &#39;V&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0putc (&#39;%&#39;, file);<br>
+<br>
+=C2=A0 =C2=A0if (x =3D=3D pc_rtx)<br>
+@@ -16922,6 +16923,14 @@ print_reg (rtx x, int code, FILE *file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; regno !=3D FPSR=
_REG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; regno !=3D FPCR=
_REG);<br>
+<br>
++=C2=A0 if (code =3D=3D &#39;V&#39;)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (GENERAL_REGNO_P (regno))<br>
++=C2=A0 =C2=A0 =C2=A0 msize =3D GET_MODE_SIZE (word_mode);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 error (&quot;&#39;V&#39; modifier on non-integer reg=
ister&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0duplicated =3D code =3D=3D &#39;d&#39; &amp;&amp; TARGET_AVX;=
<br>
+<br>
+=C2=A0 =C2=A0switch (msize)<br>
+@@ -17035,6 +17044,7 @@ print_reg (rtx x, int code, FILE *file)<br>
+=C2=A0 =C2=A0 &amp; -- print some in-use local-dynamic symbol name.<br>
+=C2=A0 =C2=A0 H -- print a memory address offset by 8; used for sse high-p=
arts<br>
+=C2=A0 =C2=A0 Y -- print condition for XOP pcom* instruction.<br>
++=C2=A0 =C2=A0V -- print naked full integer register name without %.<br>
+=C2=A0 =C2=A0 + -- print a branch hint as &#39;cs&#39; or &#39;ds&#39; pre=
fix<br>
+=C2=A0 =C2=A0 ; -- print a semicolon (after prefixes due to bug in older g=
as).<br>
+=C2=A0 =C2=A0 ~ -- print &quot;i&quot; if TARGET_AVX2, &quot;f&quot; other=
wise.<br>
+@@ -17259,6 +17269,7 @@ ix86_print_operand (FILE *file, rtx x, int code)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;X&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;P&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;p&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 case &#39;V&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
+diff --git a/gcc/doc/extend.texi b/gcc/doc/extend.texi<br>
+index 2cb6bd1..76ba1d4 100644<br>
+--- a/gcc/doc/extend.texi<br>
++++ b/gcc/doc/extend.texi<br>
+@@ -8511,6 +8511,9 @@ The table below shows the list of supported modifier=
s and their effects.<br>
+ @tab @code{2}<br>
+ @end multitable<br>
+<br>
++@code{V} is a special modifier which prints the name of the full integer<=
br>
++register without @code{%}.<br>
++<br>
+ @anchor{x86floatingpointasmope<wbr>rands}<br>
+ @subsubsection x86 Floating-Point @code{asm} Operands<br>
+<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-4.=
c b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-4.c<br>
+new file mode 100644<br>
+index 0000000..f0cd9b7<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-register-4.c<br>
+@@ -0,0 +1,13 @@<br>
++/* { dg-do compile } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dkeep -fno-pic&quot; } */<br=
>
++<br>
++extern void (*func_p) (void);<br>
++<br>
++void<br>
++foo (void)<br>
++{<br>
++=C2=A0 asm(&quot;call __x86_indirect_thunk_%V0&quot; : : &quot;a&quot; (f=
unc_p));<br>
++}<br>
++<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_eax=
&quot; { target ia32 } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_rax=
&quot; { target { ! ia32 } } } } */<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0008-missing-execinfo_h=
.<wbr>patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0008-missing-execinfo_=
h.<wbr>patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/<a href=3D"http://0008-m=
issing-execinfo_h.pa" target=3D"_blank">0008-missing-execinfo_h.pa</a><wbr>=
tch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/<a href=3D"http://0008-mis=
sing-execinfo_h.pa" target=3D"_blank">0008-missing-execinfo_h.pa</a><wbr>tc=
h<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0008-x86-Disallow-mindi=
r<wbr>ect-branch-mfunction-return-wi<wbr>th-.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0008-x86-Disallow-mindir<wbr>ect-branch-mfunction-return-w=
i<wbr>th-.patch<br>
new file mode 100644<br>
index 0000000..8b95ec7<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0008-x86-Disallow-mindir<wbr>e=
ct-branch-mfunction-return-wi<wbr>th-.patch<br>
@@ -0,0 +1,301 @@<br>
+From 8e0d9bf93e2e2ec03c544572aef4b0<wbr>3a8e7090f3 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;H.J. Lu&quot; &lt;<a href=3D"mailto:hjl.tools@gmail.com" targe=
t=3D"_blank">hjl.tools@gmail.com</a>&gt;<br>
+Date: Sat, 13 Jan 2018 18:01:54 -0800<br>
+Subject: [PATCH 08/12] x86: Disallow -mindirect-branch=3D/-mfunction-<wbr>=
return=3D<br>
+ with -mcmodel=3Dlarge<br>
+<br>
+Since the thunk function may not be reachable in large code model,<br>
+-mcmodel=3Dlarge is incompatible with -mindirect-branch=3Dthunk,<br>
+-mindirect-branch=3Dthunk-exter<wbr>n, -mfunction-return=3Dthunk and<br>
+-mfunction-return=3Dthunk-exter<wbr>n.=C2=A0 Issue an error when they are =
used with<br>
+-mcmodel=3Dlarge.<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_set_indirect_branch_=
type<wbr>): Disallow<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mcmodel=3Dlarge with -mindirect-branch=3Dthunk=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mindirect-branch=3Dthunk-exter<wbr>n, -mfuncti=
on-return=3Dthunk and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mfunction-return=3Dthunk-exter<wbr>n.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/invoke.texi: Document -mcmodel=3Dlarge is=
 incompatible with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mindirect-branch=3Dthunk, -mindirect-branch=3D=
thunk-extern<wbr>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mfunction-return=3Dthunk and -mfunction-return=
=3Dthunk-extern<wbr>.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-14=C2=A0 H.J. Lu=C2=A0 &lt;<a href=3D"m=
ailto:hongjiu.lu@intel.com" target=3D"_blank">hongjiu.lu@intel.com</a>&gt;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-10.c: New=
 test.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-8.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-9.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-10.c=
: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-11.c=
: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-9.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-17.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-18.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-19.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-20.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-21.c<wbr>: Likewise=
.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 +++++++++++++++=
+++++++<br>
+ gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +++++++++<=
br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-10.c=C2=A0 |=C2=A0 7 ++=
++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-8.c=C2=A0 =C2=A0|=C2=A0=
 7 ++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-9.c=C2=A0 =C2=A0|=C2=A0=
 7 ++++++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-10.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 ++++++++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-11.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 ++++++++<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-9.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 ++++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-17.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 ++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-18.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-19.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-20.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 ++++++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-21.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 ++++++++<br>
+ 13 files changed, 126 insertions(+)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-10.c=
<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-8.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-9.c<=
br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-10.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-11.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-attr=
-9.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-17.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-18.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-19.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-20.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-21.c<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index eeca7e5..9c038be 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -6389,6 +6389,19 @@ ix86_set_indirect_branch_type (tree fndecl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfun-&gt;machine-&gt;indirect_branc<wbr>h_type =
=3D ix86_indirect_branch;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* -mcmodel=3Dlarge is not compatible with -mindirec=
t-branch=3Dthunk<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0nor -mindirect-branch=3Dthunk-extern<wbr>.=C2=
=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if ((ix86_cmodel =3D=3D CM_LARGE || ix86_cmodel =3D=
=3D CM_LARGE_PIC)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((cfun-&gt;machine-&gt;indirect_br=
an<wbr>ch_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_branch_th=
unk_extern)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (cfun-&gt;machine-&gt;indire=
ct_branc<wbr>h_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D indirect_b=
ranch_thunk)))<br>
++=C2=A0 =C2=A0 =C2=A0 error (&quot;%&lt;-mindirect-branch=3D%s%&gt; and %&=
lt;-mcmodel=3Dlarge%&gt; are not &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;compatible&quot;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((cfun-&gt;machine-&gt;in=
direct_bra<wbr>nch_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_br=
anch_thunk_extern)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? &quot;thunk-extern&quo=
t; : &quot;thunk&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0if (cfun-&gt;machine-&gt;function_retur<wbr>n_type =3D=3D ind=
irect_branch_unset)<br>
+@@ -6414,6 +6427,19 @@ ix86_set_indirect_branch_type (tree fndecl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cfun-&gt;machine-&gt;function_retur<wbr>n_type =
=3D ix86_function_return;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* -mcmodel=3Dlarge is not compatible with -mfunctio=
n-return=3Dthunk<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0nor -mfunction-return=3Dthunk-extern<wbr>.=C2=
=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if ((ix86_cmodel =3D=3D CM_LARGE || ix86_cmodel =3D=
=3D CM_LARGE_PIC)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; ((cfun-&gt;machine-&gt;function_re=
tu<wbr>rn_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_branch_th=
unk_extern)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (cfun-&gt;machine-&gt;functi=
on_retur<wbr>n_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D indirect_b=
ranch_thunk)))<br>
++=C2=A0 =C2=A0 =C2=A0 error (&quot;%&lt;-mfunction-return=3D%s%&gt; and %&=
lt;-mcmodel=3Dlarge%&gt; are not &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;compatible&quot;,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((cfun-&gt;machine-&gt;fu=
nction_ret<wbr>urn_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_br=
anch_thunk_extern)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? &quot;thunk-extern&quo=
t; : &quot;thunk&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
+index ad9f295..48e827f 100644<br>
+--- a/gcc/doc/invoke.texi<br>
++++ b/gcc/doc/invoke.texi<br>
+@@ -24230,6 +24230,11 @@ to external call and return thunk provided in a s=
eparate object file.<br>
+ You can control this behavior for a specific function by using the<br>
+ function attribute @code{indirect_branch}.=C2=A0 @xref{Function Attribute=
s}.<br>
+<br>
++Note that @option{-mcmodel=3Dlarge} is incompatible with<br>
++@option{-mindirect-branch=3Dth<wbr>unk} nor<br>
++@option{-mindirect-branch=3Dth<wbr>unk-extern} since the thunk function m=
ay<br>
++not be reachable in large code model.<br>
++<br>
+ @item -mfunction-return=3D@var{choice}<br>
+ @opindex -mfunction-return<br>
+ Convert function return with @var{choice}.=C2=A0 The default is @samp{kee=
p},<br>
+@@ -24241,6 +24246,12 @@ object file.=C2=A0 You can control this behavior =
for a specific function by<br>
+ using the function attribute @code{function_return}.<br>
+ @xref{Function Attributes}.<br>
+<br>
++Note that @option{-mcmodel=3Dlarge} is incompatible with<br>
++@option{-mfunction-return=3Dth<wbr>unk} nor<br>
++@option{-mfunction-return=3Dth<wbr>unk-extern} since the thunk function m=
ay<br>
++not be reachable in large code model.<br>
++<br>
++<br>
+ @item -mindirect-branch-register<br>
+ @opindex -mindirect-branch-register<br>
+ Force indirect call and jump via register.<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-10.c b/gcc/=
testsuite/gcc.target/i38<wbr>6/indirect-thunk-10.c<br>
+new file mode 100644<br>
+index 0000000..a0674bd<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-10.c<br>
+@@ -0,0 +1,7 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-inline -mfunction-ret=
urn=3Dkeep -mcmodel=3Dlarge&quot; } */<br>
++<br>
++void<br>
++bar (void)<br>
++{<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-8.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-8.c<br>
+new file mode 100644<br>
+index 0000000..7a80a89<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-8.c<br>
+@@ -0,0 +1,7 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk -mfunction-return=3Dk=
eep -mcmodel=3Dlarge&quot; } */<br>
++<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mindirect-branch=3Dthunk&#39; and &#39;-mcmod=
el=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-9.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-9.c<br>
+new file mode 100644<br>
+index 0000000..d4d45c5<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-9.c<br>
+@@ -0,0 +1,7 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dthunk-extern -mfunction-ret=
urn=3Dkeep -mcmodel=3Dlarge&quot; } */<br>
++<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mindirect-branch=3Dthunk-exte<wbr>rn&#39; and=
 &#39;-mcmodel=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-10.c b=
/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-10.c<br>
+new file mode 100644<br>
+index 0000000..3a2aead<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-10.c<br>
+@@ -0,0 +1,9 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk-exter<wbr>n&quot;)))<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mindirect-branch=3Dthunk-exte<wbr>rn&#39; and=
 &#39;-mcmodel=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-11.c b=
/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-11.c<br>
+new file mode 100644<br>
+index 0000000..8e52f03<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-11.c<br>
+@@ -0,0 +1,9 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk-inlin<wbr>e&quot;)))<br>
++void<br>
++bar (void)<br>
++{<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-9.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-9.c<br>
+new file mode 100644<br>
+index 0000000..bdaa4f6<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-9.c<br>
+@@ -0,0 +1,9 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mindirect-branch=3Dkeep -mfunction-return=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++__attribute__ ((indirect_branch(&quot;thunk&quot;)))<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mindirect-branch=3Dthunk&#39; and &#39;-mcmod=
el=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-17.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-17.c<br>
+new file mode 100644<br>
+index 0000000..0605e2c<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-17.c<br>
+@@ -0,0 +1,7 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk -mindirect-branch=3Dk=
eep -mcmodel=3Dlarge&quot; } */<br>
++<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mfunction-return=3Dthunk&#39; and &#39;-mcmod=
el=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-18.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-18.c<br>
+new file mode 100644<br>
+index 0000000..307019d<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-18.c<br>
+@@ -0,0 +1,8 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-extern -mindirect-bra=
nch=3Dkeep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mfunction-return=3Dthunk-exte<wbr>rn&#39; and=
 &#39;-mcmodel=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-19.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-19.c<br>
+new file mode 100644<br>
+index 0000000..772617f<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-19.c<br>
+@@ -0,0 +1,8 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++<br>
++__attribute__ ((function_return(&quot;thunk&quot;)))<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mfunction-return=3Dthunk&#39; and &#39;-mcmod=
el=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-20.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-20.c<br>
+new file mode 100644<br>
+index 0000000..1e9f9bd<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-20.c<br>
+@@ -0,0 +1,9 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-exter<wbr>n&quot;)))<br>
++void<br>
++bar (void)<br>
++{ /* { dg-error &quot;&#39;-mfunction-return=3Dthunk-exte<wbr>rn&#39; and=
 &#39;-mcmodel=3Dlarge&#39; are not compatible&quot; } */<br>
++}<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-21.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-21.c<br>
+new file mode 100644<br>
+index 0000000..eea07f7<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-21.c<br>
+@@ -0,0 +1,9 @@<br>
++/* { dg-do compile { target { lp64 } } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dkeep -mindirect-branch=3Dke=
ep -mcmodel=3Dlarge&quot; } */<br>
++/* { dg-additional-options &quot;-fPIC&quot; { target fpic } } */<br>
++<br>
++__attribute__ ((function_return(&quot;thunk-inlin<wbr>e&quot;)))<br>
++void<br>
++bar (void)<br>
++{<br>
++}<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0009-Use-INVALID_REGNUM=
-<wbr>in-indirect-thunk-processing.p<wbr>atch b/meta/recipes-devtools/gcc/g=
c<wbr>c-6.4/0009-Use-INVALID_REGNUM-<wbr>in-indirect-thunk-processing.p<wbr=
>atch<br>
new file mode 100644<br>
index 0000000..735bf0e<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0009-Use-INVALID_REGNUM-<wbr>i=
n-indirect-thunk-processing.p<wbr>atch<br>
@@ -0,0 +1,123 @@<br>
+From 3eff2adada2b1667b0e76496fa559e<wbr>0c248ecd84 Mon Sep 17 00:00:00 200=
1<br>
+From: uros &lt;uros@138bc75d-0d04-0410-961f-<wbr>82ee72b054a4&gt;<br>
+Date: Thu, 25 Jan 2018 19:39:01 +0000<br>
+Subject: [PATCH 09/12] Use INVALID_REGNUM in indirect thunk processing<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02018-01-17=C2=A0 Uros Bizjak=C2=A0 &lt;<a href=
=3D"mailto:ubizjak@gmail.com" target=3D"_blank">ubizjak@gmail.com</a>&gt;<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (indirect_thunk_name): Dec=
lare regno<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0as unsigned int.=C2=A0 Compare regno with INVAL=
ID_REGNUM.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk): Ditto.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk_functi<wbr>on): Ditto.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_code_end): Declare regno as unsigned int.=
=C2=A0 Use INVALID_REGNUM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0in the call to output_indirect_thunk_function<w=
br>.<br>
+<br>
+git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-7=
-branch@257067" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/<w=
br>branches/gcc-7-branch@257067</a> 138bc75d-0d04-0410-961f-82ee72<wbr>b054=
a4<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c | 30 +++++++++++++++---------------<br>
+ 1 file changed, 15 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 9c038be..4012657 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -11087,16 +11087,16 @@ static int indirect_thunks_bnd_used;<br>
+ /* Fills in the label name that should be used for the indirect thunk.=C2=
=A0 */<br>
+<br>
+ static void<br>
+-indirect_thunk_name (char name[32], int regno, bool need_bnd_p,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool=
 ret_p)<br>
++indirect_thunk_name (char name[32], unsigned int regno,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool=
 need_bnd_p, bool ret_p)<br>
+ {<br>
+-=C2=A0 if (regno &gt;=3D 0 &amp;&amp; ret_p)<br>
++=C2=A0 if (regno !=3D INVALID_REGNUM &amp;&amp; ret_p)<br>
+=C2=A0 =C2=A0 =C2=A0gcc_unreachable ();<br>
+<br>
+=C2=A0 =C2=A0if (USE_HIDDEN_LINKONCE)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bnd =3D need_bnd_p ? &quot;_bnd&quo=
t; : &quot;&quot;;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if (regno !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *reg_prefix;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (LEGACY_INT_REGNO_P (regno))<br>
+@@ -11114,7 +11114,7 @@ indirect_thunk_name (char name[32], int regno, boo=
l need_bnd_p,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if (regno !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (need_bnd_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASM_GENERATE_INTERNAL_LABEL (name=
, &quot;LITBR&quot;, regno);<br>
+@@ -11166,7 +11166,7 @@ indirect_thunk_name (char name[32], int regno, boo=
l need_bnd_p,<br>
+=C2=A0 */<br>
+<br>
+ static void<br>
+-output_indirect_thunk (bool need_bnd_p, int regno)<br>
++output_indirect_thunk (bool need_bnd_p, unsigned int regno)<br>
+ {<br>
+=C2=A0 =C2=A0char indirectlabel1[32];<br>
+=C2=A0 =C2=A0char indirectlabel2[32];<br>
+@@ -11196,7 +11196,7 @@ output_indirect_thunk (bool need_bnd_p, int regno)=
<br>
+<br>
+=C2=A0 =C2=A0ASM_OUTPUT_INTERNAL_LABEL (asm_out_file, indirectlabel2);<br>
+<br>
+-=C2=A0 if (regno &gt;=3D 0)<br>
++=C2=A0 if (regno !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* MOV.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rtx xops[2];<br>
+@@ -11220,12 +11220,12 @@ output_indirect_thunk (bool need_bnd_p, int regn=
o)<br>
+ }<br>
+<br>
+ /* Output a funtion with a call and return thunk for indirect branch.<br>
+-=C2=A0 =C2=A0If BND_P is true, the BND prefix is needed.=C2=A0 =C2=A0If R=
EGNO !=3D -1,=C2=A0 the<br>
+-=C2=A0 =C2=A0function address is in REGNO.=C2=A0 Otherwise, the function =
address is<br>
++=C2=A0 =C2=A0If BND_P is true, the BND prefix is needed.=C2=A0 If REGNO !=
=3D INVALID_REGNUM,<br>
++=C2=A0 =C2=A0the function address is in REGNO.=C2=A0 Otherwise, the funct=
ion address is<br>
+=C2=A0 =C2=A0 on the top of stack.=C2=A0 */<br>
+<br>
+ static void<br>
+-output_indirect_thunk_functi<wbr>on (bool need_bnd_p, int regno)<br>
++output_indirect_thunk_functi<wbr>on (bool need_bnd_p, unsigned int regno)=
<br>
+ {<br>
+=C2=A0 =C2=A0char name[32];<br>
+=C2=A0 =C2=A0tree decl;<br>
+@@ -11274,7 +11274,7 @@ output_indirect_thunk_function (bool need_bnd_p, i=
nt regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASM_OUTPUT_LABEL (asm_out_file, name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 if (regno &lt; 0)<br>
++=C2=A0 if (regno =3D=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Create alias for __x86.return_thunk/__x86.re=
tur<wbr>n_thunk_bnd.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char alias[32];<br>
+@@ -11348,16 +11348,16 @@ static void<br>
+ ix86_code_end (void)<br>
+ {<br>
+=C2=A0 =C2=A0rtx xops[2];<br>
+-=C2=A0 int regno;<br>
++=C2=A0 unsigned int regno;<br>
+<br>
+=C2=A0 =C2=A0if (indirect_thunk_needed)<br>
+-=C2=A0 =C2=A0 output_indirect_thunk_function (false, -1);<br>
++=C2=A0 =C2=A0 output_indirect_thunk_function (false, INVALID_REGNUM);<br>
+=C2=A0 =C2=A0if (indirect_thunk_bnd_needed)<br>
+-=C2=A0 =C2=A0 output_indirect_thunk_function (true, -1);<br>
++=C2=A0 =C2=A0 output_indirect_thunk_function (true, INVALID_REGNUM);<br>
+<br>
+=C2=A0 =C2=A0for (regno =3D FIRST_REX_INT_REG; regno &lt;=3D LAST_REX_INT_=
REG; regno++)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 int i =3D regno - FIRST_REX_INT_REG + LAST_INT_REG +=
 1;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int i =3D regno - FIRST_REX_INT_REG + LAST_=
INT_REG + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((indirect_thunks_used &amp; (1 &lt;&lt; i))=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0output_indirect_thunk_functio<wbr>n (false, reg=
no);<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0009-c99-snprintf.patch=
 b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0009-c99-snprintf.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0009-c99-snprintf.patch<=
br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0009-c99-snprintf.patch<br=
>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0010-gcc-poison-system-=
d<wbr>irectories.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0010-gcc-po=
ison-system-d<wbr>irectories.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0010-gcc-poison-system-d=
ir<wbr>ectories.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0010-gcc-poison-system-dir=
<wbr>ectories.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0010-i386-Pass-INVALID_=
R<wbr>EGNUM-as-invalid-register-numb<wbr>er.patch b/meta/recipes-devtools/g=
cc/gc<wbr>c-6.4/0010-i386-Pass-INVALID_R<wbr>EGNUM-as-invalid-register-numb=
<wbr>er.patch<br>
new file mode 100644<br>
index 0000000..1833a14<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0010-i386-Pass-INVALID_R<wbr>E=
GNUM-as-invalid-register-numb<wbr>er.patch<br>
@@ -0,0 +1,43 @@<br>
+From c4300d9ad683e693c90d02d4f1b131<wbr>83bf2d4acc Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Fri, 2 Feb 2018 16:47:02 +0000<br>
+Subject: [PATCH 10/12] i386: Pass INVALID_REGNUM as invalid register numbe=
r<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_output_function_retu=
rn): Pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INVALID_REGNUM, instead of -1, as invalid regis=
ter number to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunk_name and output_indirect_thunk.<=
br>
+<br>
+git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-7=
-branch@257341" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/<w=
br>branches/gcc-7-branch@257341</a> 138bc75d-0d04-0410-961f-82ee72<wbr>b054=
a4<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386.c | 5 +++--<br>
+ 1 file changed, 3 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 4012657..66502ee 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -28056,7 +28056,8 @@ ix86_output_function_return (bool long_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool need_thunk =3D (cfun-&gt;machine-&g=
t;function_retur<wbr>n_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D indirect_branch_thunk);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name, -1, need_bnd=
_p, true);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name, INVALID_REGN=
UM, need_bnd_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (need_bnd_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunk_bnd_needed =
|=3D need_thunk;<br>
+@@ -28069,7 +28070,7 @@ ix86_output_function_return (bool long_p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, -1);<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, INVALID_REGNUM);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0011-gcc-poison-dir-ext=
e<wbr>nd.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0011-gcc-poison-dir=
-exte<wbr>nd.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0011-gcc-poison-dir-exte=
nd<wbr>.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0011-gcc-poison-dir-extend=
<wbr>.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0011-i386-Update-mfunct=
i<wbr>on-return-for-return-with-pop.<wbr>patch b/meta/recipes-devtools/gcc/=
gc<wbr>c-6.4/0011-i386-Update-mfuncti<wbr>on-return-for-return-with-pop.<wb=
r>patch<br>
new file mode 100644<br>
index 0000000..7dd325d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0011-i386-Update-mfuncti<wbr>o=
n-return-for-return-with-pop.<wbr>patch<br>
@@ -0,0 +1,450 @@<br>
+From b3a2269c7884378a9afd394ac7e669<wbr>aab0443b57 Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Mon, 26 Feb 2018 15:29:30 +0000<br>
+Subject: [PATCH 11/12] i386: Update -mfunction-return=3D for return with p=
op<br>
+<br>
+When -mfunction-return=3D is used, simple_return_pop_internal should pop<b=
r>
+return address into ECX register, adjust stack by bytes to pop from stack<=
br>
+and jump to the return thunk via ECX register.<br>
+<br>
+Revision 257992 removed the bool argument from ix86_output_indirect_jmp.<b=
r>
+Update comments to reflect it.<br>
+<br>
+Tested on i686 and x86-64.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (ix86_output_indirect_jmp)=
: Update comments.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/84530<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386-protos.h (ix86_output_indire=
ct_jmp): Remove<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the bool argument.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_functio<wbr>n_return): Ne=
w prototype.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_split_simple_return_pop<wbr>_internal): L=
ikewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.c (indirect_return_via_cx): =
New.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_return_via_cx_bnd): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(indirect_thunk_name): Handle return va CX_REG.=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(output_indirect_thunk_functi<wbr>on): Create a=
lias for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__x86_return_thunk_[re]cx and __x86_return_thun=
k_[re]cx_bnd.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_jmp): Remove the bool arg=
ument.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_output_indirect_functio<wbr>n_return): Ne=
w function.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ix86_split_simple_return_pop<wbr>_internal): L=
ikewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (*indirect_jump): Don&#39;t pass=
 false<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0to ix86_output_indirect_jmp.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*tablejump_1): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(simple_return_pop_internal): Change it to defi=
ne_insn_and_split.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Call ix86_split_simple_return_pop_i<wbr>nternal=
 to split it for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-mfunction-return=3D.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(simple_return_indirect_inter<wbr>nal): Call<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_output_indirect_function<wbr>_return inste=
ad of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_output_indirect_jmp.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/84530<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-22.c<wbr>: New test=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-23.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-24.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-25.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-26.c<wbr>: Likewise=
.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/i386-protos.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
+ gcc/config/i386/i386.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 127 +++++++++++++++++++++++----<br>
+ gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=3D"_=
blank">i386.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 ++-<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-22.c |=C2=A0 15 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-23.c |=C2=A0 15 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-24.c |=C2=A0 15 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-25.c |=C2=A0 15 ++++<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-26.c |=C2=A0 40 +++++++++<br=
>
+ 8 files changed, 222 insertions(+), 20 deletions(-)<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-22.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-23.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-24.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-25.c<br>
+ create mode 100644 gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-26.c<br>
+<br>
+diff --git a/gcc/config/i386/i386-protos.<wbr>h b/gcc/config/i386/i386-pro=
tos.<wbr>h<br>
+index 620d70e..c7a0ccb5 100644<br>
+--- a/gcc/config/i386/i386-protos.<wbr>h<br>
++++ b/gcc/config/i386/i386-protos.<wbr>h<br>
+@@ -311,8 +311,10 @@ extern enum attr_cpu ix86_schedule;<br>
+ #endif<br>
+<br>
+ extern const char * ix86_output_call_insn (rtx_insn *insn, rtx call_op);<=
br>
+-extern const char * ix86_output_indirect_jmp (rtx call_op, bool ret_p);<b=
r>
++extern const char * ix86_output_indirect_jmp (rtx call_op);<br>
+ extern const char * ix86_output_function_return (bool long_p);<br>
++extern const char * ix86_output_indirect_function_<wbr>return (rtx ret_op=
);<br>
++extern void ix86_split_simple_return_pop_i<wbr>nternal (rtx);<br>
+ extern bool ix86_operands_ok_for_move_mult<wbr>iple (rtx *operands, bool =
load,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0enum machine_mode mode);<br>
+<br>
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c<br>
+index 66502ee..21c3c18 100644<br>
+--- a/gcc/config/i386/i386.c<br>
++++ b/gcc/config/i386/i386.c<br>
+@@ -11080,6 +11080,12 @@ static int indirect_thunks_used;<br>
+=C2=A0 =C2=A0 by call and return thunks functions with the BND prefix.=C2=
=A0 */<br>
+ static int indirect_thunks_bnd_used;<br>
+<br>
++/* True if return thunk function via CX is needed.=C2=A0 */<br>
++static bool indirect_return_via_cx;<br>
++/* True if return thunk function via CX with the BND prefix is<br>
++=C2=A0 =C2=A0needed.=C2=A0 */<br>
++static bool indirect_return_via_cx_bnd;<br>
++<br>
+ #ifndef INDIRECT_LABEL<br>
+ # define INDIRECT_LABEL &quot;LIND&quot;<br>
+ #endif<br>
+@@ -11090,12 +11096,13 @@ static void<br>
+ indirect_thunk_name (char name[32], unsigned int regno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=
 need_bnd_p, bool ret_p)<br>
+ {<br>
+-=C2=A0 if (regno !=3D INVALID_REGNUM &amp;&amp; ret_p)<br>
++=C2=A0 if (regno !=3D INVALID_REGNUM &amp;&amp; regno !=3D CX_REG &amp;&a=
mp; ret_p)<br>
+=C2=A0 =C2=A0 =C2=A0gcc_unreachable ();<br>
+<br>
+=C2=A0 =C2=A0if (USE_HIDDEN_LINKONCE)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bnd =3D need_bnd_p ? &quot;_bnd&quo=
t; : &quot;&quot;;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *ret =3D ret_p ? &quot;return&quot; : &qu=
ot;indirect&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (regno !=3D INVALID_REGNUM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *reg_prefix;<br>
+@@ -11103,14 +11110,11 @@ indirect_thunk_name (char name[32], unsigned int=
 regno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_prefix =3D TARGET_64BIT ? &qu=
ot;r&quot; : &quot;e&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_prefix =3D &quot;&quot;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_indirect_thunk%s_%=
s%s&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bnd, reg_pr=
efix, reg_names[regno]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_%s_thunk%s_%s%s&qu=
ot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret, bnd, r=
eg_prefix, reg_names[regno]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *ret =3D ret_p ? &quot;return&quot=
; : &quot;indirect&quot;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_%s_thunk%s&quot;, =
ret, bnd);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 sprintf (name, &quot;__x86_%s_thunk%s&quot;, ret, bn=
d);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -11274,9 +11278,23 @@ output_indirect_thunk_function (bool need_bnd_p, =
unsigned int regno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASM_OUTPUT_LABEL (asm_out_file, name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 /* Create alias for __x86_return_thunk/__x86_retur<wbr>n_thunk_bnd=
 or<br>
++=C2=A0 =C2=A0 =C2=A0__x86_return_thunk_ecx/__x86_<wbr>return_thunk_ecx_bn=
d.=C2=A0 */<br>
++=C2=A0 bool need_alias;<br>
+=C2=A0 =C2=A0if (regno =3D=3D INVALID_REGNUM)<br>
++=C2=A0 =C2=A0 need_alias =3D true;<br>
++=C2=A0 else if (regno =3D=3D CX_REG)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 need_alias =3D indirect_return_via_cx_bnd;<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 need_alias =3D indirect_return_via_cx;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 need_alias =3D false;<br>
++<br>
++=C2=A0 if (need_alias)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Create alias for __x86.return_thunk/__x86.retur<w=
br>n_thunk_bnd.=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char alias[32];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0indirect_thunk_name (alias, regno, need_bnd_p, =
true);<br>
+@@ -28019,18 +28037,17 @@ ix86_output_indirect_branch (rtx call_op, const =
char *xasm,<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0ix86_output_indirect_branch_v<wbr>ia_push (call_op, xa=
sm, sibcall_p);<br>
+ }<br>
+-/* Output indirect jump.=C2=A0 CALL_OP is the jump target.=C2=A0 Jump is =
a<br>
+-=C2=A0 =C2=A0function return if RET_P is true.=C2=A0 */<br>
++<br>
++/* Output indirect jump.=C2=A0 CALL_OP is the jump target.=C2=A0 */<br>
+<br>
+ const char *<br>
+-ix86_output_indirect_jmp (rtx call_op, bool ret_p)<br>
++ix86_output_indirect_jmp (rtx call_op)<br>
+ {<br>
+=C2=A0 =C2=A0if (cfun-&gt;machine-&gt;indirect_branc<wbr>h_type !=3D indir=
ect_branch_keep)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 /* We can&#39;t have red-zone if this isn&#39;t a fu=
nction return since<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;call&quot; in the indirect thunk pushes =
the return address onto<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0stack, destroying red-zone.=C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (!ret_p &amp;&amp; ix86_red_zone_size !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 /* We can&#39;t have red-zone since &quot;call&quot;=
 in the indirect thunk<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pushes the return address onto stack, d=
estroying red-zone.=C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 if (ix86_red_zone_size !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_unreachable ();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_output_indirect_branch (call_op, &quot;%0&=
quot;, true);<br>
+@@ -28081,6 +28098,86 @@ ix86_output_function_return (bool long_p)<br>
+=C2=A0 =C2=A0return &quot;rep%; ret&quot;;<br>
+ }<br>
+<br>
++/* Output indirect function return.=C2=A0 RET_OP is the function return<b=
r>
++=C2=A0 =C2=A0target.=C2=A0 */<br>
++<br>
++const char *<br>
++ix86_output_indirect_functio<wbr>n_return (rtx ret_op)<br>
++{<br>
++=C2=A0 if (cfun-&gt;machine-&gt;function_retur<wbr>n_type !=3D indirect_b=
ranch_keep)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 char thunk_name[32];<br>
++=C2=A0 =C2=A0 =C2=A0 bool need_bnd_p =3D ix86_bnd_prefixed_insn_p (curren=
t_output_insn);<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned int regno =3D REGNO (ret_op);<br>
++=C2=A0 =C2=A0 =C2=A0 gcc_assert (regno =3D=3D CX_REG);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (cfun-&gt;machine-&gt;function_retur<wbr>n_type<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_thunk_inline)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool need_thunk =3D (cfun-&gt;machine-&gt;fun=
ction_retur<wbr>n_type<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D indirect_branch_thunk);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunk_name (thunk_name, regno, need_=
bnd_p, true);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_bnd_p)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_thunk)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_return_v=
ia_cx_bnd =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunks_b=
nd_used |=3D 1 &lt;&lt; CX_REG;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\t=
bnd jmp\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need_thunk)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_return_v=
ia_cx =3D true;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indirect_thunks_u=
sed |=3D 1 &lt;&lt; CX_REG;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (asm_out_file, &quot;\t=
jmp\t%s\n&quot;, thunk_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 output_indirect_thunk (need_bnd_p, regno);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 return &quot;&quot;;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 return &quot;%!jmp\t%A0&quot;;<br>
++}<br>
++<br>
++/* Split simple return with popping POPC bytes from stack to indirect<br>
++=C2=A0 =C2=A0branch with stack adjustment .=C2=A0 */<br>
++<br>
++void<br>
++ix86_split_simple_return_pop<wbr>_internal (rtx popc)<br>
++{<br>
++=C2=A0 struct machine_function *m =3D cfun-&gt;machine;<br>
++=C2=A0 rtx ecx =3D gen_rtx_REG (SImode, CX_REG);<br>
++=C2=A0 rtx_insn *insn;<br>
++<br>
++=C2=A0 /* There is no &quot;pascal&quot; calling convention in any 64bit =
ABI.=C2=A0 */<br>
++=C2=A0 gcc_assert (!TARGET_64BIT);<br>
++<br>
++=C2=A0 insn =3D emit_insn (gen_pop (ecx));<br>
++=C2=A0 m-&gt;fs.cfa_offset -=3D UNITS_PER_WORD;<br>
++=C2=A0 m-&gt;fs.sp_offset -=3D UNITS_PER_WORD;<br>
++<br>
++=C2=A0 rtx x =3D plus_constant (Pmode, stack_pointer_rtx, UNITS_PER_WORD)=
;<br>
++=C2=A0 x =3D gen_rtx_SET (stack_pointer_rtx, x);<br>
++=C2=A0 add_reg_note (insn, REG_CFA_ADJUST_CFA, x);<br>
++=C2=A0 add_reg_note (insn, REG_CFA_REGISTER, gen_rtx_SET (ecx, pc_rtx));<=
br>
++=C2=A0 RTX_FRAME_RELATED_P (insn) =3D 1;<br>
++<br>
++=C2=A0 x =3D gen_rtx_PLUS (Pmode, stack_pointer_rtx, popc);<br>
++=C2=A0 x =3D gen_rtx_SET (stack_pointer_rtx, x);<br>
++=C2=A0 insn =3D emit_insn (x);<br>
++=C2=A0 add_reg_note (insn, REG_CFA_ADJUST_CFA, x);<br>
++=C2=A0 RTX_FRAME_RELATED_P (insn) =3D 1;<br>
++<br>
++=C2=A0 /* Now return address is in ECX.=C2=A0 */<br>
++=C2=A0 emit_jump_insn (gen_simple_return_indirect_in<wbr>ternal (ecx));<b=
r>
++}<br>
++<br>
+ /* Output the assembly for a call instruction.=C2=A0 */<br>
+<br>
+ const char *<br>
+diff --git a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer"=
 target=3D"_blank">i386.md</a> b/gcc/config/i386/<a href=3D"http://i386.md"=
 rel=3D"noreferrer" target=3D"_blank">i386.md</a><br>
+index 05a88ff..857466a 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
+@@ -11813,7 +11813,7 @@<br>
+ (define_insn &quot;*indirect_jump&quot;<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand:W 0 &quot;indirect_branch_operand&q=
uot; &quot;rBw&quot;))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+-=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], false);&quot=
;<br>
++=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0]);&quot;<br>
+=C2=A0 =C2=A0[(set (attr &quot;type&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 (if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_keep)&quot;)<br=
>
+@@ -11868,7 +11868,7 @@<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand:W 0 &quot;indirect_branch_operand&q=
uot; &quot;rBw&quot;))<br>
+=C2=A0 =C2=A0 (use (label_ref (match_operand 1)))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+-=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], false);&quot=
;<br>
++=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0]);&quot;<br>
+=C2=A0 =C2=A0[(set (attr &quot;type&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 (if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_keep)&quot;)<br=
>
+@@ -12520,11 +12520,14 @@<br>
+=C2=A0 =C2=A0 (set_attr &quot;prefix_rep&quot; &quot;1&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;modrm&quot; &quot;0&quot;)])<br>
+<br>
+-(define_insn &quot;simple_return_pop_internal&quot;<br>
++(define_insn_and_split &quot;simple_return_pop_internal&quot;<br>
+=C2=A0 =C2=A0[(simple_return)<br>
+=C2=A0 =C2=A0 (use (match_operand:SI 0 &quot;const_int_operand&quot;))]<br=
>
+=C2=A0 =C2=A0&quot;reload_completed&quot;<br>
+=C2=A0 =C2=A0&quot;%!ret\t%0&quot;<br>
++=C2=A0 &quot;&amp;&amp; cfun-&gt;machine-&gt;function_return<wbr>_type !=
=3D indirect_branch_keep&quot;<br>
++=C2=A0 [(const_int 0)]<br>
++=C2=A0 &quot;ix86_split_simple_return_pop_<wbr>internal (operands[0]); DO=
NE;&quot;<br>
+=C2=A0 =C2=A0[(set_attr &quot;length&quot; &quot;3&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;atom_unit&quot; &quot;jeu&quot;)<br>
+=C2=A0 =C2=A0 (set_attr &quot;length_immediate&quot; &quot;2&quot;)<br>
+@@ -12535,7 +12538,7 @@<br>
+=C2=A0 =C2=A0[(simple_return)<br>
+=C2=A0 =C2=A0 (use (match_operand:SI 0 &quot;register_operand&quot; &quot;=
r&quot;))]<br>
+=C2=A0 =C2=A0&quot;reload_completed&quot;<br>
+-=C2=A0 &quot;* return ix86_output_indirect_jmp (operands[0], true);&quot;=
<br>
++=C2=A0 &quot;* return ix86_output_indirect_function_<wbr>return (operands=
[0]);&quot;<br>
+=C2=A0 =C2=A0[(set (attr &quot;type&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 (if_then_else (match_test &quot;(cfun-&gt;machine-&gt=
;indirect_bran<wbr>ch_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D indirect_branch_keep)&quot;)<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-22.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-22.c<br>
+new file mode 100644<br>
+index 0000000..89e086d<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-22.c<br>
+@@ -0,0 +1,15 @@<br>
++/* PR target/r84530 */<br>
++/* { dg-do compile { target ia32 } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk&quot; } */<br>
++<br>
++struct s { _Complex unsigned short x; };<br>
++struct s gs =3D { 100 + 200i };<br>
++struct s __attribute__((noinline)) foo (void) { return gs; }<br>
++<br>
++/* { dg-final { scan-assembler-times &quot;popl\[\\t \]*%ecx&quot; 1 } } =
*/<br>
++/* { dg-final { scan-assembler &quot;lea\[l\]?\[\\t \]*4\\(%esp\\), %esp&=
quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk_ecx&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-23.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-23.c<br>
+new file mode 100644<br>
+index 0000000..43f0cca<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-23.c<br>
+@@ -0,0 +1,15 @@<br>
++/* PR target/r84530 */<br>
++/* { dg-do compile { target ia32 } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-extern<wbr>&quot; } *=
/<br>
++<br>
++struct s { _Complex unsigned short x; };<br>
++struct s gs =3D { 100 + 200i };<br>
++struct s __attribute__((noinline)) foo (void) { return gs; }<br>
++<br>
++/* { dg-final { scan-assembler-times &quot;popl\[\\t \]*%ecx&quot; 1 } } =
*/<br>
++/* { dg-final { scan-assembler &quot;lea\[l\]?\[\\t \]*4\\(%esp\\), %esp&=
quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk_ecx&qu=
ot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
++/* { dg-final { scan-assembler-not {\tpause} } } */<br>
++/* { dg-final { scan-assembler-not {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-24.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-24.c<br>
+new file mode 100644<br>
+index 0000000..8729e35<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-24.c<br>
+@@ -0,0 +1,15 @@<br>
++/* PR target/r84530 */<br>
++/* { dg-do compile { target ia32 } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk-inline<wbr>&quot; } *=
/<br>
++<br>
++struct s { _Complex unsigned short x; };<br>
++struct s gs =3D { 100 + 200i };<br>
++struct s __attribute__((noinline)) foo (void) { return gs; }<br>
++<br>
++/* { dg-final { scan-assembler-times &quot;popl\[\\t \]*%ecx&quot; 1 } } =
*/<br>
++/* { dg-final { scan-assembler &quot;lea\[l\]?\[\\t \]*4\\(%esp\\), %esp&=
quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk_ec=
x&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-25.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-25.c<br>
+new file mode 100644<br>
+index 0000000..f73553c<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-25.c<br>
+@@ -0,0 +1,15 @@<br>
++/* PR target/r84530 */<br>
++/* { dg-do compile { target ia32 } } */<br>
++/* { dg-options &quot;-O2 -mfunction-return=3Dthunk -fcheck-pointer-bound=
s -mmpx -fno-pic&quot; } */<br>
++<br>
++struct s { _Complex unsigned short x; };<br>
++struct s gs =3D { 100 + 200i };<br>
++struct s __attribute__((noinline)) foo (void) { return gs; }<br>
++<br>
++/* { dg-final { scan-assembler-times &quot;popl\[\\t \]*%ecx&quot; 1 } } =
*/<br>
++/* { dg-final { scan-assembler &quot;lea\[l\]?\[\\t \]*4\\(%esp\\), %esp&=
quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk_bnd_ec=
<wbr>x&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
++/* { dg-final { scan-assembler {\tpause} } } */<br>
++/* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-26.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-26.c<br>
+new file mode 100644<br>
+index 0000000..9144e98<br>
+--- /dev/null<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-26.c<br>
+@@ -0,0 +1,40 @@<br>
++/* PR target/r84530 */<br>
++/* { dg-do run } */<br>
++/* { dg-options &quot;-Os -mfunction-return=3Dthunk&quot; } */<br>
++<br>
++struct S { int i; };<br>
++__attribute__((const, noinline, noclone))<br>
++struct S foo (int x)<br>
++{<br>
++=C2=A0 struct S s;<br>
++=C2=A0 s.i =3D x;<br>
++=C2=A0 return s;<br>
++}<br>
++<br>
++int a[2048], b[2048], c[2048], d[2048];<br>
++struct S e[2048];<br>
++<br>
++__attribute__((noinline, noclone)) void<br>
++bar (void)<br>
++{<br>
++=C2=A0 int i;<br>
++=C2=A0 for (i =3D 0; i &lt; 1024; i++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 e[i] =3D foo (i);<br>
++=C2=A0 =C2=A0 =C2=A0 a[i+2] =3D a[i] + a[i+1];<br>
++=C2=A0 =C2=A0 =C2=A0 b[10] =3D b[10] + i;<br>
++=C2=A0 =C2=A0 =C2=A0 c[i] =3D c[2047 - i];<br>
++=C2=A0 =C2=A0 =C2=A0 d[i] =3D d[i + 1];<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++int<br>
++main ()<br>
++{<br>
++=C2=A0 int i;<br>
++=C2=A0 bar ();<br>
++=C2=A0 for (i =3D 0; i &lt; 1024; i++)<br>
++=C2=A0 =C2=A0 if (e[i].i !=3D i)<br>
++=C2=A0 =C2=A0 =C2=A0 __builtin_abort ();<br>
++=C2=A0 return 0;<br>
++}<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0012-gcc-4.3.3-SYSROOT_=
C<wbr>FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0012-=
gcc-4.3.3-SYSROOT_C<wbr>FLAGS_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0012-gcc-4.3.3-SYSROOT_C=
FL<wbr>AGS_FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0012-gcc-4.3.3-SYSROOT_CFL=
<wbr>AGS_FOR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0012-i386-Add-TARGET_IN=
D<wbr>IRECT_BRANCH_REGISTER.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/=
0012-i386-Add-TARGET_IND<wbr>IRECT_BRANCH_REGISTER.patch<br>
new file mode 100644<br>
index 0000000..f4b137c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0012-i386-Add-TARGET_IND<wbr>I=
RECT_BRANCH_REGISTER.patch<br>
@@ -0,0 +1,1001 @@<br>
+From 7ba192d11a43d24ce427a3dfce0ad0<wbr>592bd52830 Mon Sep 17 00:00:00 200=
1<br>
+From: hjl &lt;hjl@138bc75d-0d04-0410-961f-8<wbr>2ee72b054a4&gt;<br>
+Date: Mon, 26 Feb 2018 17:00:46 +0000<br>
+Subject: [PATCH 12/12] i386: Add TARGET_INDIRECT_BRANCH_REGISTE<wbr>R<br>
+<br>
+For<br>
+<br>
+---<br>
+struct C {<br>
+=C2=A0 virtual ~C();<br>
+=C2=A0 virtual void f();<br>
+};<br>
+<br>
+void<br>
+f (C *p)<br>
+{<br>
+=C2=A0 p-&gt;f();<br>
+=C2=A0 p-&gt;f();<br>
+}<br>
+---<br>
+<br>
+-mindirect-branch=3Dthunk-exter<wbr>n -O2 on x86-64 GNU/Linux generates:<b=
r>
+<br>
+_Z1fP1C:<br>
+.LFB0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_startproc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pushq=C2=A0 =C2=A0%rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_def_cfa_offset 16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_offset 3, -16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 movq=C2=A0 =C2=A0 (%rdi), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 movq=C2=A0 =C2=A0 %rdi, %rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0.LIND1<br>
+.LIND0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pushq=C2=A0 =C2=A016(%rax)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0__x86_indirect_thunk<br=
>
+.LIND1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call=C2=A0 =C2=A0 .LIND0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 movq=C2=A0 =C2=A0 (%rbx), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 movq=C2=A0 =C2=A0 %rbx, %rdi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 popq=C2=A0 =C2=A0 %rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_def_cfa_offset 8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 movq=C2=A0 =C2=A0 16(%rax), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0__x86_indirect_thunk_ra=
x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
+<br>
+x86-64 is supposed to have asynchronous unwind tables by default, but<br>
+there is nothing that reflects the change in the (relative) frame<br>
+address after .LIND0.=C2=A0 That region really has to be moved outside of<=
br>
+the .cfi_startproc/.cfi_endproc bracket.<br>
+<br>
+This patch adds TARGET_INDIRECT_BRANCH_REGISTE<wbr>R to force indirect<br>
+branch via register whenever -mindirect-branch=3D is used.=C2=A0 Now,<br>
+-mindirect-branch=3Dthunk-exter<wbr>n -O2 on x86-64 GNU/Linux generates:<b=
r>
+<br>
+_Z1fP1C:<br>
+.LFB0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pushq=C2=A0 =C2=A0%rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_def_cfa_offset 16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_offset 3, -16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 (%rdi), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 %rdi, %rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 16(%rax), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0call=C2=A0 =C2=A0 __x86_indirect_thunk_rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 (%rbx), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 %rbx, %rdi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0popq=C2=A0 =C2=A0 %rbx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_def_cfa_offset 8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0movq=C2=A0 =C2=A0 16(%rax), %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 =C2=A0__x86_indirect_thunk_rax=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
+<br>
+so that &quot;-mindirect-branch=3Dthunk-exter<wbr>n&quot; is equivalent to=
<br>
+&quot;-mindirect-branch=3Dthunk-exte<wbr>rn -mindirect-branch-register&quo=
t;, which is<br>
+used by Linux kernel.<br>
+<br>
+gcc/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/84039<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://constraints.md"=
 rel=3D"noreferrer" target=3D"_blank">constraints.md</a> (Bs): Replace<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ix86_indirect_branch_register with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_INDIRECT_BRANCH_REGIST<wbr>ER.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(Bw): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://i386.md" rel=3D=
"noreferrer" target=3D"_blank">i386.md</a> (indirect_jump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(tablejump): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_value_memory): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Peepholes of indirect call and jump via memory:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_GOT_32): Disallowed for TARGET_INDIRE=
CT_BRANCH_REGISTE<wbr>R.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(*sibcall_value_GOT_32): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/<a href=3D"http://predicates.md" =
rel=3D"noreferrer" target=3D"_blank">predicates.md</a> (indirect_branch_ope=
rand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT_memory_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(sibcall_insn_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(GOT32_symbol_operand): Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/i386/i386.h (TARGET_INDIRECT_BRANCH_RE=
GIST<wbr>ER): New.<br>
+<br>
+gcc/testsuite/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Backport from mainline<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/84039<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-1.c: Upda=
ted.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-2.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-3.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-4.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-5.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-6.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-7.c: Like=
wise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-1.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-2.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-3.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-4.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-5.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-6.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-attr-7.c:=
 Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-1.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-2.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-3.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-bnd-4.c: =
Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-extern-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-1.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-2.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-3.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-4.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-5.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-6.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/indirect-thunk<wbr>-inline-7.=
c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-9.c: Likewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-10.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-11.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-12.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-13.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-14.c<wbr>: Likewise=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/i386/ret-thunk-15.c<wbr>: Likewise=
.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer" targ=
et=3D"_blank">constraints.md</a><wbr>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
+ gcc/config/i386/i386.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++++<br>
+ gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=3D"_=
blank">i386.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++---------<br>
+ gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" targe=
t=3D"_blank">predicates.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-1.c=C2=A0 =C2=A0|=C2=A0=
 5 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-2.c=C2=A0 =C2=A0|=C2=A0=
 5 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-3.c=C2=A0 =C2=A0|=C2=A0=
 5 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-4.c=C2=A0 =C2=A0|=C2=A0=
 5 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-5.c=C2=A0 =C2=A0|=C2=A0=
 6 +++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-6.c=C2=A0 =C2=A0| 12 ++=
++++----<br>
+ gcc/testsuite/gcc.target/i386/<wbr>indirect-thunk-7.c=C2=A0 =C2=A0|=C2=A0=
 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 +--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 +--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-5.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 ++++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-6.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 ++++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-attr-7.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-1.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 6 ++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 6 ++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-3.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-bnd-4.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 7 +++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 9 ++++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 ++---<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 +++----<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-extern-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 5 ++--<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-1.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-2.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-3.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-4.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-5.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 ++-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-6.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 ++-<br>
+ .../gcc.target/i386/indirect-t<wbr>hunk-inline-7.c=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-10.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 +++----<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-11.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 +++----<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-12.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++----<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-13.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 ++--<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-14.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 +++---<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-15.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 +++---<br>
+ gcc/testsuite/gcc.target/i386/<wbr>ret-thunk-9.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 ++++------<br>
+ 43 files changed, 128 insertions(+), 141 deletions(-)<br>
+<br>
+diff --git a/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"nore=
ferrer" target=3D"_blank">constraints.<wbr>md</a> b/gcc/config/i386/<a href=
=3D"http://constraints.md" rel=3D"noreferrer" target=3D"_blank">constraints=
.<wbr>md</a><br>
+index 9204c8e..ef684a9 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer"=
 target=3D"_blank">constraints.<wbr>md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://constraints.md" rel=3D"noreferrer"=
 target=3D"_blank">constraints.<wbr>md</a><br>
+@@ -172,7 +172,7 @@<br>
+<br>
+ (define_constraint &quot;Bs&quot;<br>
+=C2=A0 =C2=A0&quot;@internal Sibcall memory operand.&quot;<br>
+-=C2=A0 (ior (and (not (match_test &quot;ix86_indirect_branch_register<wbr=
>&quot;))<br>
++=C2=A0 (ior (and (not (match_test &quot;TARGET_INDIRECT_BRANCH_REGIST<wbr=
>ER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(not (match_test &quot;TARGET_X32=
&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;sibcall_me=
mory_operand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp;&amp; P=
mode =3D=3D DImode&quot;)<br>
+@@ -180,7 +180,7 @@<br>
+<br>
+ (define_constraint &quot;Bw&quot;<br>
+=C2=A0 =C2=A0&quot;@internal Call memory operand.&quot;<br>
+-=C2=A0 (ior (and (not (match_test &quot;ix86_indirect_branch_register<wbr=
>&quot;))<br>
++=C2=A0 (ior (and (not (match_test &quot;TARGET_INDIRECT_BRANCH_REGIST<wbr=
>ER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(not (match_test &quot;TARGET_X32=
&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;memory_ope=
rand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &quot;TARGET_X32 &amp;&amp; P=
mode =3D=3D DImode&quot;)<br>
+diff --git a/gcc/config/i386/i386.h b/gcc/config/i386/i386.h<br>
+index b34bc11..1816d71 100644<br>
+--- a/gcc/config/i386/i386.h<br>
++++ b/gcc/config/i386/i386.h<br>
+@@ -2676,6 +2676,11 @@ extern void debug_dispatch_window (int);<br>
+ #define TARGET_RECIP_VEC_DIV=C2=A0 ((recip_mask &amp; RECIP_MASK_VEC_DIV)=
 !=3D 0)<br>
+ #define TARGET_RECIP_VEC_SQRT ((recip_mask &amp; RECIP_MASK_VEC_SQRT) !=
=3D 0)<br>
+<br>
++<br>
++#define TARGET_INDIRECT_BRANCH_REGISTE<wbr>R \<br>
++=C2=A0 (ix86_indirect_branch_register \<br>
++=C2=A0 =C2=A0|| cfun-&gt;machine-&gt;indirect_branch<wbr>_type !=3D indir=
ect_branch_keep)<br>
++<br>
+ #define IX86_HLE_ACQUIRE (1 &lt;&lt; 16)<br>
+ #define IX86_HLE_RELEASE (1 &lt;&lt; 17)<br>
+<br>
+diff --git a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer"=
 target=3D"_blank">i386.md</a> b/gcc/config/i386/<a href=3D"http://i386.md"=
 rel=3D"noreferrer" target=3D"_blank">i386.md</a><br>
+index 857466a..6a6dc26 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
++++ b/gcc/config/i386/<a href=3D"http://i386.md" rel=3D"noreferrer" target=
=3D"_blank">i386.md</a><br>
+@@ -11805,7 +11805,7 @@<br>
+=C2=A0 =C2=A0[(set (pc) (match_operand 0 &quot;indirect_branch_operand&quo=
t;))]<br>
+=C2=A0 =C2=A0&quot;&quot;<br>
+ {<br>
+-=C2=A0 if (TARGET_X32 || ix86_indirect_branch_register)<br>
++=C2=A0 if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTE<wbr>R)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
+=C2=A0 =C2=A0cfun-&gt;machine-&gt;has_local_indi<wbr>rect_jump =3D true;<b=
r>
+ })<br>
+@@ -11859,7 +11859,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPTAB_DI=
RECT);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 if (TARGET_X32 || ix86_indirect_branch_register)<br>
++=C2=A0 if (TARGET_X32 || TARGET_INDIRECT_BRANCH_REGISTE<wbr>R)<br>
+=C2=A0 =C2=A0 =C2=A0operands[0] =3D convert_memory_address (word_mode, ope=
rands[0]);<br>
+=C2=A0 =C2=A0cfun-&gt;machine-&gt;has_local_indi<wbr>rect_jump =3D true;<b=
r>
+ })<br>
+@@ -12029,7 +12029,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mat=
ch_operand:SI 0 &quot;register_no_elim_operand&quot; &quot;U&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mat=
ch_operand:SI 1 &quot;GOT32_symbol_operand&quot;))))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 2))]<br>
+-=C2=A0 &quot;!TARGET_MACHO &amp;&amp; !TARGET_64BIT &amp;&amp; SIBLING_CA=
LL_P (insn)&quot;<br>
++=C2=A0 &quot;!TARGET_MACHO<br>
++=C2=A0 &amp;&amp; !TARGET_64BIT<br>
++=C2=A0 &amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
++=C2=A0 &amp;&amp; SIBLING_CALL_P (insn)&quot;<br>
+ {<br>
+=C2=A0 =C2=A0rtx fnaddr =3D gen_rtx_PLUS (Pmode, operands[0], operands[1])=
;<br>
+=C2=A0 =C2=A0fnaddr =3D gen_const_mem (Pmode, fnaddr);<br>
+@@ -12048,7 +12051,7 @@<br>
+=C2=A0 =C2=A0[(call (mem:QI (match_operand:W 0 &quot;memory_operand&quot; =
&quot;m&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 1))<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_PEEPSIB)]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; !ix86_indirect_branch_register<wbr>&q=
uot;<br>
++=C2=A0 &quot;!TARGET_X32 &amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER=
&quot;<br>
+=C2=A0 =C2=A0&quot;* return ix86_output_call_insn (insn, operands[0]);&quo=
t;<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;call&quot;)])<br>
+<br>
+@@ -12058,7 +12061,7 @@<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))]<br>
+=C2=A0 =C2=A0&quot;!TARGET_X32<br>
+-=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
+=C2=A0 =C2=A0 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))&quot;<br>
+@@ -12073,7 +12076,7 @@<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))]<br>
+=C2=A0 =C2=A0&quot;!TARGET_X32<br>
+-=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
+=C2=A0 =C2=A0 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))&quot;<br>
+@@ -12171,7 +12174,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand:W 1 &quot;memory_operand&=
quot;))<br>
+=C2=A0 =C2=A0 (set (pc) (match_dup 0))]<br>
+=C2=A0 =C2=A0&quot;!TARGET_X32<br>
+-=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
+=C2=A0 =C2=A0 &amp;&amp; peep2_reg_dead_p (2, operands[0])&quot;<br>
+=C2=A0 =C2=A0[(set (pc) (match_dup 1))])<br>
+<br>
+@@ -12229,7 +12232,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(match_operand:SI 1 &quot;register_no_elim_operand&quot; &=
quot;U&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(match_operand:SI 2 &quot;GOT32_symbol_operand&quot;))))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3)))]<br>
+-=C2=A0 &quot;!TARGET_MACHO &amp;&amp; !TARGET_64BIT &amp;&amp; SIBLING_CA=
LL_P (insn)&quot;<br>
++=C2=A0 &quot;!TARGET_MACHO<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_64BIT<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
++=C2=A0 =C2=A0&amp;&amp; SIBLING_CALL_P (insn)&quot;<br>
+ {<br>
+=C2=A0 =C2=A0rtx fnaddr =3D gen_rtx_PLUS (Pmode, operands[1], operands[2])=
;<br>
+=C2=A0 =C2=A0fnaddr =3D gen_const_mem (Pmode, fnaddr);<br>
+@@ -12250,7 +12256,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call (mem:QI (match_operand:W 1 &quot;memory_o=
perand&quot; &quot;m&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 2)))<br>
+=C2=A0 =C2=A0 (unspec [(const_int 0)] UNSPEC_PEEPSIB)]<br>
+-=C2=A0 &quot;!TARGET_X32 &amp;&amp; !ix86_indirect_branch_register<wbr>&q=
uot;<br>
++=C2=A0 &quot;!TARGET_X32 &amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER=
&quot;<br>
+=C2=A0 =C2=A0&quot;* return ix86_output_call_insn (insn, operands[1]);&quo=
t;<br>
+=C2=A0 =C2=A0[(set_attr &quot;type&quot; &quot;callv&quot;)])<br>
+<br>
+@@ -12261,7 +12267,7 @@<br>
+=C2=A0 =C2=A0 (call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 3))=
)]<br>
+=C2=A0 =C2=A0&quot;!TARGET_X32<br>
+-=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
+=C2=A0 =C2=A0 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (1))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))&quot;<br>
+@@ -12278,7 +12284,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(call (mem:QI (match_dup 0))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 3)))]<br>
+=C2=A0 =C2=A0&quot;!TARGET_X32<br>
+-=C2=A0 =C2=A0&amp;&amp; !ix86_indirect_branch_register<br>
++=C2=A0 =C2=A0&amp;&amp; !TARGET_INDIRECT_BRANCH_REGIST<wbr>ER<br>
+=C2=A0 =C2=A0 &amp;&amp; SIBLING_CALL_P (peep2_next_insn (2))<br>
+=C2=A0 =C2=A0 &amp;&amp; !reg_mentioned_p (operands[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))&quot;<br>
+diff --git a/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noref=
errer" target=3D"_blank">predicates.m<wbr>d</a> b/gcc/config/i386/<a href=
=3D"http://predicates.md" rel=3D"noreferrer" target=3D"_blank">predicates.m=
<wbr>d</a><br>
+index d1f0a7d..5f8a98f 100644<br>
+--- a/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" =
target=3D"_blank">predicates.m<wbr>d</a><br>
++++ b/gcc/config/i386/<a href=3D"http://predicates.md" rel=3D"noreferrer" =
target=3D"_blank">predicates.m<wbr>d</a><br>
+@@ -593,7 +593,7 @@<br>
+ ;; Test for a valid operand for indirect branch.<br>
+ (define_predicate &quot;indirect_branch_operand&quot;<br>
+=C2=A0 =C2=A0(ior (match_operand 0 &quot;register_operand&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;TARGET_INDIRECT_BR=
ANCH_REGIST<wbr>ER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(not (match_test &quot;TARGET_X32=
&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 &quot;memory_ope=
rand&quot;))))<br>
+<br>
+@@ -637,7 +637,7 @@<br>
+=C2=A0 =C2=A0(ior (match_test &quot;constant_call_address_operand<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op,=
 mode =3D=3D VOIDmode ? mode : Pmode)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 0 &quot;call_register_no_elim_o=
perand<wbr>&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;TARGET_INDIRECT_BR=
ANCH_REGIST<wbr>ER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ior (and (not (match_test &quot;=
TARGET_X32&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(match_operand 0 &quot;memory_operand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &=
quot;TARGET_X32 &amp;&amp; Pmode =3D=3D DImode&quot;)<br>
+@@ -648,7 +648,7 @@<br>
+=C2=A0 =C2=A0(ior (match_test &quot;constant_call_address_operand<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (op,=
 mode =3D=3D VOIDmode ? mode : Pmode)&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operand 0 &quot;register_no_elim_operan=
d&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;ix86_indirect_bran=
ch_register<wbr>&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (not (match_test &quot;TARGET_INDIRECT_BR=
ANCH_REGIST<wbr>ER&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ior (and (not (match_test &quot;=
TARGET_X32&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(match_operand 0 &quot;sibcall_memory_operand&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test &=
quot;TARGET_X32 &amp;&amp; Pmode =3D=3D DImode&quot;)<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+index 60d0988..6e94d2c 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-1.c<br>
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+index aac7516..3c46707 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-2.c<br>
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+index 9e24a38..2c7fb52 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-3.c<br>
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+index 127b5d9..0d3f895 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-4.c<br>
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+index fcaa18d..fb26c00 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-5.c<br>
+@@ -9,8 +9,10 @@ foo (void)<br>
+=C2=A0 =C2=A0bar ();<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+index e464928..aa03fbd 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-6.c<br>
+@@ -10,9 +10,13 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target x32 } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 { ta=
rget x32 } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+ /* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c b/gcc/t=
estsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+index 17c2d0f..3c72036 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-7.c<br>
+@@ -35,9 +35,8 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&q=
uot; { target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+index 9194ccf..7106407 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-1.c<br>
+@@ -14,9 +14,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+index e51f261..27c7e5b 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-2.c<br>
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+index 4aeec18..89a2bac 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-3.c<br>
+@@ -14,10 +14,9 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+ /* { dg-final { scan-assembler {\tlfence} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+index ac0e599..3eb83c3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-4.c<br>
+@@ -13,10 +13,9 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+ /* { dg-final { scan-assembler {\tlfence} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;__x86_indirect_thunk&quot; } } *=
/<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+index 573cf1e..0098dd1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-5.c<br>
+@@ -14,9 +14,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+index b2b37fc..ece8de1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-6.c<br>
+@@ -13,9 +13,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c b/=
gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+index 4a43e19..d53fc88 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-attr-7.c<br>
+@@ -36,9 +36,8 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&q=
uot; { target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+ /* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+index ac84ab6..73d16ba 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-1.c<br>
+@@ -10,9 +10,9 @@ foo (void)<br>
+=C2=A0 =C2=A0dispatch (buf);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd_<wbr>rax&quot; { target lp64 } } } */<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*__x86_indirect_thunk=
_bnd_<wbr>eax&quot; { target ia32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
+ /* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+index ce655e8..856751a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-2.c<br>
+@@ -11,10 +11,8 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;pushq\[ \t\]%rax&quot; { target x32 =
} } } */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*__x86_indirect_thunk=
_bnd_<wbr>(r|e)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
+ /* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+index d34485a..42312f6 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-3.c<br>
+@@ -10,8 +10,9 @@ foo (void)<br>
+=C2=A0 =C2=A0bar (buf);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; } } =
*/<br>
++/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk_=
bnd_<wbr>rax&quot; { target lp64 } } } */<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*__x86_indirect_thunk=
_bnd_<wbr>eax&quot; { target ia32 } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd call\[ \t\]*\.LIND&quot; } } */<=
br>
+ /* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c b/g=
cc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+index 0e19830..c8ca102 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-bnd-4.c<br>
+@@ -11,10 +11,9 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*__x86_indirect_thunk&=
quot; } } */<br>
+-/* { dg-final { scan-assembler &quot;bnd jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+-/* { dg-final { scan-assembler-times &quot;bnd call\[ \t\]*\.LIND&quot; 2=
 } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; } } =
*/<br>
++/* { dg-final { scan-assembler &quot;bnd call\[ \t\]*__x86_indirect_thunk=
_bnd_<wbr>(r|e)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-times &quot;bnd call\[ \t\]*\.LIND&quot; 1=
 } } */<br>
+ /* { dg-final { scan-assembler &quot;bnd ret&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+ /* { dg-final { scan-assembler {\tlfence} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+index 579441f..c09dd0a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-1.c<br>
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+ /* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+index c92e6f2..826425a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-2.c<br>
+@@ -11,9 +11,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+ /* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+index d9964c2..3856268 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-3.c<br>
+@@ -12,9 +12,8 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
++/* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+index d4dca4d..1ae49b1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-4.c<br>
+@@ -12,9 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 { ta=
rget { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 { t=
arget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+index 5c07e02..5328239 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-5.c<br>
+@@ -9,8 +9,10 @@ foo (void)<br>
+=C2=A0 =C2=A0bar ();<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+ /* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+index 3eb4406..8ae4348 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-6.c<br>
+@@ -10,8 +10,8 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
+-/* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 1 } } =
*/<br>
+-/* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 1 } }=
 */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; } } */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+index aece938..2b9a33e 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-extern-7.c<br>
+@@ -35,9 +35,8 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; { target x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&q=
uot; { target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk_(r|e=
<wbr>)ax&quot; } } */<br>
+ /* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*\.LIND&quot; } } */<b=
r>
+ /* { dg-final { scan-assembler-not &quot;call\[ \t\]*\.LIND&quot; } } */<=
br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+index 3aba5e8..869d904 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-1.c<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch(offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+index 0f0181d..c5c16ed 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-2.c<br>
+@@ -11,7 +11,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0dispatch[offset](offset);<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+index 2eef6f3..4a63ebe 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-3.c<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+index e825a10..a395ffc 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-4.c<br>
+@@ -12,7 +12,7 @@ male_indirect_jump (long offset)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?dispatch&quot; =
{ target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?dispatch&quot; {=
 target *-*-linux* } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+index c6d77e1..21cbfd3 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-5.c<br>
+@@ -9,7 +9,8 @@ foo (void)<br>
+=C2=A0 =C2=A0bar ();<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+index 6454827..d1300f1 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-6.c<br>
+@@ -10,7 +10,8 @@ foo (void)<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; } }=
 */<br>
++/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*bar@GOT&quot; { t=
arget x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*bar@GOT&quot; { ta=
rget { ! x32 } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 2 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 2 } }=
 */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c =
b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+index c67066c..ea00924 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/indirect-thunk-inline-7.c<br>
+@@ -35,8 +35,8 @@ bar (int i)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&=
quot; { target { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*\.L\[0-9\]+\\(,%&q=
uot; { target *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%(r|e)ax&quot; } } *=
/<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler {\tpause} } } */<br>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+index e6fea84..af9023a 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-10.c<br>
+@@ -15,9 +15,6 @@ foo (void)<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 2 } } */<br>
+ /* { dg-final { scan-assembler-times {\tlfence} 2 } } */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+index e239ec4..ba467c5 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-11.c<br>
+@@ -15,9 +15,6 @@ foo (void)<br>
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+index fa31813..43e57ca 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-12.c<br>
+@@ -15,8 +15,6 @@ foo (void)<br>
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; { target=
 { ! x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler &quot;__x86_indirect_thunk_(r|e)ax:<wbr>&q=
uot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+index fd5b41f..55f156c 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-13.c<br>
+@@ -14,9 +14,8 @@ foo (void)<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_return_thunk&quot; =
} } */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 2 } } */<br>
+ /* { dg-final { scan-assembler-times {\tlfence} 2 } } */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+ /* { dg-final { scan-assembler-times &quot;jmp\[ \t\]*\.LIND&quot; 3 } } =
*/<br>
+ /* { dg-final { scan-assembler-times &quot;call\[ \t\]*\.LIND&quot; 3 } }=
 */<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_indirect_thunk&=
quot; } } */<br>
+-/* { dg-final { scan-assembler-not &quot;call\[ \t\]*__x86_indirect_thunk=
_(r|e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler-not &quot;call\[ \t\]*__x86_indirect_thunk=
_(r|e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+index d606373..1c79043 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-14.c<br>
+@@ -16,7 +16,6 @@ foo (void)<br>
+ /* { dg-final { scan-assembler-not &quot;jmp\[ \t\]*__x86_return_thunk&qu=
ot; } } */<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } }=C2=A0 } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?bar&quot; { targ=
et *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c b/gcc/tests=
uite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+index 75e45e2..58aba31 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-15.c<br>
+@@ -16,7 +16,6 @@ foo (void)<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler-times {\tpause} 1 } } */<br>
+ /* { dg-final { scan-assembler-times {\tlfence} 1 } } */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target x32 } } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?bar&quot; { targ=
et *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+diff --git a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c b/gcc/testsu=
ite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+index d1db41c..d2df8b8 100644<br>
+--- a/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
++++ b/gcc/testsuite/gcc.target/i38<wbr>6/ret-thunk-9.c<br>
+@@ -14,11 +14,8 @@ foo (void)<br>
+ /* { dg-final { scan-assembler &quot;jmp\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;call\[ \t\]*\.LIND&quot; } } */<br>
+ /* { dg-final { scan-assembler &quot;__x86_indirect_thunk:&quot; } } */<b=
r>
+-/* { dg-final { scan-assembler-times {\tpause} 1 { target { ! x32 } } } }=
 */<br>
+-/* { dg-final { scan-assembler-times {\tlfence} 1 { target { ! x32 } } } =
} */<br>
+-/* { dg-final { scan-assembler &quot;push(?:l|q)\[ \t\]*_?bar&quot; { tar=
get { { ! x32 } &amp;&amp; *-*-linux* } } } } */<br>
+-/* { dg-final { scan-assembler &quot;jmp\[ \t\]*__x86_indirect_thunk&quot=
; { target { ! x32 } } } } */<br>
+-/* { dg-final { scan-assembler-times {\tpause} 2 { target { x32 } } } } *=
/<br>
+-/* { dg-final { scan-assembler-times {\tlfence} 2 { target { x32 } } } } =
*/<br>
+-/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; { target { x32 } } } } */<br>
+-/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; { target =
x32 } } } */<br>
++/* { dg-final { scan-assembler &quot;mov(?:l|q)\[ \t\]*_?bar&quot; { targ=
et *-*-linux* } } } */<br>
++/* { dg-final { scan-assembler-times {\tpause} 2 } } */<br>
++/* { dg-final { scan-assembler-times {\tlfence} 2 } } */<br>
++/* { dg-final { scan-assembler &quot;call\[ \t\]*__x86_indirect_thunk_(r|=
e<wbr>)ax&quot; } } */<br>
++/* { dg-final { scan-assembler-not &quot;pushq\[ \t\]%rax&quot; } } */<br=
>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0013-64-bit-multilib-ha=
c<wbr>k.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0013-64-bit-multilib=
-hac<wbr>k.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0013-64-bit-multilib-hac=
k.<wbr>patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0013-64-bit-multilib-hack.=
<wbr>patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/<a href=3D"http://0014-=
optional-libstdc.pa" target=3D"_blank">0014-optional-libstdc.pa</a><wbr>tch=
 b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/<a href=3D"http://0014-optional-l=
ibstdc.pa" target=3D"_blank">0014-optional-libstdc.pa</a><wbr>tch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0014-optional-libstdc.pa=
tc<wbr>h<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0014-optional-libstdc.patc=
<wbr>h<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0015-gcc-disable-MASK_R=
E<wbr>LAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0015=
-gcc-disable-MASK_RE<wbr>LAX_PIC_CALLS-bit.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0015-gcc-disable-MASK_RE=
LA<wbr>X_PIC_CALLS-bit.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0015-gcc-disable-MASK_RELA=
<wbr>X_PIC_CALLS-bit.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0016-COLLECT_GCC_OPTION=
S<wbr>.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0016-COLLECT_GCC_OPTI=
ONS<wbr>.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0016-COLLECT_GCC_OPTIONS=
.p<wbr>atch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0016-COLLECT_GCC_OPTIONS.p=
<wbr>atch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0017-Use-the-defaults.h=
-<wbr>in-B-instead-of-S-and-t-oe-in-<wbr>B.patch b/meta/recipes-devtools/gc=
c/gc<wbr>c-6.4/0017-Use-the-defaults.h-<wbr>in-B-instead-of-S-and-t-oe-in-<=
wbr>B.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0017-Use-the-defaults.h-=
in<wbr>-B-instead-of-S-and-t-oe-in-B.<wbr>patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0017-Use-the-defaults.h-in=
<wbr>-B-instead-of-S-and-t-oe-in-B.<wbr>patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0018-fortran-cross-comp=
i<wbr>le-hack.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0018-fortran-c=
ross-compi<wbr>le-hack.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0018-fortran-cross-compi=
le<wbr>-hack.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0018-fortran-cross-compile=
<wbr>-hack.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0019-cpp-honor-sysroot.=
p<wbr>atch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0019-cpp-honor-sysroot.=
p<wbr>atch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0019-cpp-honor-sysroot.p=
at<wbr>ch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0019-cpp-honor-sysroot.pat=
<wbr>ch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0020-MIPS64-Default-to-=
N<wbr>64-ABI.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0020-MIPS64-Def=
ault-to-N<wbr>64-ABI.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0020-MIPS64-Default-to-N=
64<wbr>-ABI.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0020-MIPS64-Default-to-N64=
<wbr>-ABI.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0021-Define-GLIBC_DYNAM=
I<wbr>C_LINKER-and-UCLIBC_DYNAMIC_LI<wbr>NKE.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0021-Define-GLIBC_DYNAMI<wbr>C_LINKER-and-UCLIBC_DYNAMIC_L=
I<wbr>NKE.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0021-Define-GLIBC_DYNAMI=
C_<wbr>LINKER-and-UCLIBC_DYNAMIC_LINK<wbr>E.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0021-Define-GLIBC_DYNAMIC_=
<wbr>LINKER-and-UCLIBC_DYNAMIC_LINK<wbr>E.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0022-gcc-Fix-argument-l=
i<wbr>st-too-long-error.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0022=
-gcc-Fix-argument-li<wbr>st-too-long-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0022-gcc-Fix-argument-li=
st<wbr>-too-long-error.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0022-gcc-Fix-argument-list=
<wbr>-too-long-error.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0023-Disable-sdt.patch =
b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0023-Disable-sdt.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0023-Disable-sdt.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0023-Disable-sdt.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0024-libtool.patch b/me=
ta/recipes-devtools/gcc/gc<wbr>c-6.4/0024-libtool.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0024-libtool.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0024-libtool.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0025-gcc-armv4-pass-fix=
-<wbr>v4bx-to-linker-to-support-EABI<wbr>.patch b/meta/recipes-devtools/gcc=
/gc<wbr>c-6.4/0025-gcc-armv4-pass-fix-<wbr>v4bx-to-linker-to-support-EABI<w=
br>.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0025-gcc-armv4-pass-fix-=
v4<wbr>bx-to-linker-to-support-EABI.p<wbr>atch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0025-gcc-armv4-pass-fix-v4=
<wbr>bx-to-linker-to-support-EABI.p<wbr>atch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0026-Use-the-multilib-c=
o<wbr>nfig-files-from-B-instead-of-u<wbr>sin.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0026-Use-the-multilib-co<wbr>nfig-files-from-B-instead-of-=
u<wbr>sin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0026-Use-the-multilib-co=
nf<wbr>ig-files-from-B-instead-of-usi<wbr>n.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0026-Use-the-multilib-conf=
<wbr>ig-files-from-B-instead-of-usi<wbr>n.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0027-Avoid-using-libdir=
-<wbr>from-.la-which-usually-points-<wbr>to-.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0027-Avoid-using-libdir-<wbr>from-.la-which-usually-points=
-<wbr>to-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0027-Avoid-using-libdir-=
fr<wbr>om-.la-which-usually-points-to<wbr>-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0027-Avoid-using-libdir-fr=
<wbr>om-.la-which-usually-points-to<wbr>-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0028-export-CPP.patch b=
/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0028-export-CPP.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0028-export-CPP.patch<br=
>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0028-export-CPP.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0029-Enable-SPE-AltiVec=
-<wbr>generation-on-powepc-linux-tar<wbr>get.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0029-Enable-SPE-AltiVec-<wbr>generation-on-powepc-linux-ta=
r<wbr>get.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0029-Enable-SPE-AltiVec-=
ge<wbr>neration-on-powepc-linux-targe<wbr>t.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0029-Enable-SPE-AltiVec-ge=
<wbr>neration-on-powepc-linux-targe<wbr>t.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0030-Disable-the-MULTIL=
I<wbr>B_OSDIRNAMES-and-other-multili<wbr>b-o.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0030-Disable-the-MULTILI<wbr>B_OSDIRNAMES-and-other-multil=
i<wbr>b-o.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0030-Disable-the-MULTILI=
B_<wbr>OSDIRNAMES-and-other-multilib-<wbr>o.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0030-Disable-the-MULTILIB_=
<wbr>OSDIRNAMES-and-other-multilib-<wbr>o.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0031-Ensure-target-gcc-=
h<wbr>eaders-can-be-included.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4=
/0031-Ensure-target-gcc-h<wbr>eaders-can-be-included.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0031-Ensure-target-gcc-h=
ea<wbr>ders-can-be-included.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0031-Ensure-target-gcc-hea=
<wbr>ders-can-be-included.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0032-gcc-4.8-won-t-buil=
d<wbr>-with-disable-dependency-track<wbr>ing.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0032-gcc-4.8-won-t-build<wbr>-with-disable-dependency-trac=
k<wbr>ing.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0032-gcc-4.8-won-t-build=
-w<wbr>ith-disable-dependency-trackin<wbr>g.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0032-gcc-4.8-won-t-build-w=
<wbr>ith-disable-dependency-trackin<wbr>g.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0033-Don-t-search-host-=
d<wbr>irectory-during-relink-if-inst<wbr>_pr.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0033-Don-t-search-host-d<wbr>irectory-during-relink-if-ins=
t<wbr>_pr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0033-Don-t-search-host-d=
ir<wbr>ectory-during-relink-if-inst_p<wbr>r.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0033-Don-t-search-host-dir=
<wbr>ectory-during-relink-if-inst_p<wbr>r.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0034-Use-SYSTEMLIBS_DIR=
-<wbr>replacement-instead-of-hardcod<wbr>ing.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0034-Use-SYSTEMLIBS_DIR-<wbr>replacement-instead-of-hardco=
d<wbr>ing.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0034-Use-SYSTEMLIBS_DIR-=
re<wbr>placement-instead-of-hardcodin<wbr>g.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0034-Use-SYSTEMLIBS_DIR-re=
<wbr>placement-instead-of-hardcodin<wbr>g.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0035-aarch64-Add-suppor=
t<wbr>-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0035-aa=
rch64-Add-support<wbr>-for-musl-ldso.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0035-aarch64-Add-support=
-f<wbr>or-musl-ldso.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0035-aarch64-Add-support-f=
<wbr>or-musl-ldso.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0036-libcc1-fix-libcc1-=
s<wbr>-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.=
4/0036-libcc1-fix-libcc1-s<wbr>-install-path-and-rpath.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0036-libcc1-fix-libcc1-s=
-i<wbr>nstall-path-and-rpath.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0036-libcc1-fix-libcc1-s-i=
<wbr>nstall-path-and-rpath.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0037-handle-sysroot-sup=
p<wbr>ort-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/=
0037-handle-sysroot-supp<wbr>ort-for-nativesdk-gcc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0037-handle-sysroot-supp=
or<wbr>t-for-nativesdk-gcc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0037-handle-sysroot-suppor=
<wbr>t-for-nativesdk-gcc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0038-Search-target-sysr=
o<wbr>ot-gcc-version-specific-dirs-w<wbr>ith.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0038-Search-target-sysro<wbr>ot-gcc-version-specific-dirs-=
w<wbr>ith.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0038-Search-target-sysro=
ot<wbr>-gcc-version-specific-dirs-wit<wbr>h.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0038-Search-target-sysroot=
<wbr>-gcc-version-specific-dirs-wit<wbr>h.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0039-Fix-various-_FOR_B=
U<wbr>ILD-and-related-variables.patc<wbr>h b/meta/recipes-devtools/gcc/gc<w=
br>c-6.4/0039-Fix-various-_FOR_BU<wbr>ILD-and-related-variables.patc<wbr>h<=
br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0039-Fix-various-_FOR_BU=
IL<wbr>D-and-related-variables.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0039-Fix-various-_FOR_BUIL=
<wbr>D-and-related-variables.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0040-nios2-Define-MUSL_=
D<wbr>YNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0040-nio=
s2-Define-MUSL_D<wbr>YNAMIC_LINKER.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0040-nios2-Define-MUSL_D=
YN<wbr>AMIC_LINKER.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0040-nios2-Define-MUSL_DYN=
<wbr>AMIC_LINKER.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0041-Add-ssp_nonshared-=
t<wbr>o-link-commandline-for-musl-ta<wbr>rge.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0041-Add-ssp_nonshared-t<wbr>o-link-commandline-for-musl-t=
a<wbr>rge.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0041-Add-ssp_nonshared-t=
o-<wbr>link-commandline-for-musl-targ<wbr>e.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0041-Add-ssp_nonshared-to-=
<wbr>link-commandline-for-musl-targ<wbr>e.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0042-gcc-libcpp-support=
-<wbr>ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6=
.4/0042-gcc-libcpp-support-<wbr>ffile-prefix-map-old-new.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0042-gcc-libcpp-support-=
ff<wbr>ile-prefix-map-old-new.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0042-gcc-libcpp-support-ff=
<wbr>ile-prefix-map-old-new.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0043-Reuse-fdebug-prefi=
x<wbr>-map-to-replace-ffile-prefix-m<wbr>ap.patch b/meta/recipes-devtools/g=
cc/gc<wbr>c-6.4/0043-Reuse-fdebug-prefix<wbr>-map-to-replace-ffile-prefix-m=
<wbr>ap.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0043-Reuse-fdebug-prefix=
-m<wbr>ap-to-replace-ffile-prefix-map<wbr>.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0043-Reuse-fdebug-prefix-m=
<wbr>ap-to-replace-ffile-prefix-map<wbr>.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0044-gcc-final.c-fdebug=
-<wbr>prefix-map-support-to-remap-so<wbr>urc.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0044-gcc-final.c-fdebug-<wbr>prefix-map-support-to-remap-s=
o<wbr>urc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0044-gcc-final.c-fdebug-=
pr<wbr>efix-map-support-to-remap-sour<wbr>c.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0044-gcc-final.c-fdebug-pr=
<wbr>efix-map-support-to-remap-sour<wbr>c.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0045-libgcc-Add-knob-to=
-<wbr>use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/00=
45-libgcc-Add-knob-to-<wbr>use-ldbl-128-on-ppc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0045-libgcc-Add-knob-to-=
us<wbr>e-ldbl-128-on-ppc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0045-libgcc-Add-knob-to-us=
<wbr>e-ldbl-128-on-ppc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0046-Link-libgcc-using-=
L<wbr>DFLAGS-not-just-SHLIB_LDFLAGS.<wbr>patch b/meta/recipes-devtools/gcc/=
gc<wbr>c-6.4/0046-Link-libgcc-using-L<wbr>DFLAGS-not-just-SHLIB_LDFLAGS.<wb=
r>patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0046-Link-libgcc-using-L=
DF<wbr>LAGS-not-just-SHLIB_LDFLAGS.pa<wbr>tch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0046-Link-libgcc-using-LDF=
<wbr>LAGS-not-just-SHLIB_LDFLAGS.pa<wbr>tch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0047-libgcc_s-Use-alias=
-<wbr>for-__cpu_indicator_init-inste<wbr>ad-.patch b/meta/recipes-devtools/=
gcc/gc<wbr>c-6.4/0047-libgcc_s-Use-alias-<wbr>for-__cpu_indicator_init-inst=
e<wbr>ad-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0047-libgcc_s-Use-alias-=
fo<wbr>r-__cpu_indicator_init-instead<wbr>-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0047-libgcc_s-Use-alias-fo=
<wbr>r-__cpu_indicator_init-instead<wbr>-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0048-sync-gcc-stddef.h-=
w<wbr>ith-musl.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0048-sync-gcc=
-stddef.h-w<wbr>ith-musl.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0048-sync-gcc-stddef.h-w=
it<wbr>h-musl.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0048-sync-gcc-stddef.h-wit=
<wbr>h-musl.patch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/0054_all_nopie-all-flag=
s<wbr>.patch b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/0054_all_nopie-all-fl=
ags<wbr>.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0054_all_nopie-all-flags=
.p<wbr>atch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0054_all_nopie-all-flags.p=
<wbr>atch<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/<a href=3D"http://0055-=
unwind_h-glibc26.pa" target=3D"_blank">0055-unwind_h-glibc26.pa</a><wbr>tch=
 b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/<a href=3D"http://0055-unwind_h-g=
libc26.pa" target=3D"_blank">0055-unwind_h-glibc26.pa</a><wbr>tch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/0055-unwind_h-glibc26.pa=
tc<wbr>h<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/0055-unwind_h-glibc26.patc=
<wbr>h<br>
diff --git a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/CVE-2016-6131.patch b/m=
eta/recipes-devtools/gcc/gc<wbr>c-6.4/CVE-2016-6131.patch<br>
similarity index 89%<br>
rename from meta/recipes-devtools/gcc/gcc-<wbr>6.3/CVE-2016-6131.patch<br>
rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/CVE-2016-6131.patch<br>
index e873cc6..68d0dee 100644<br>
--- a/meta/recipes-devtools/gcc/gc<wbr>c-6.3/CVE-2016-6131.patch<br>
+++ b/meta/recipes-devtools/gcc/gc<wbr>c-6.4/CVE-2016-6131.patch<br>
@@ -41,27 +41,31 @@ diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog<=
br>
=C2=A0index 240138f..adf1d72 100644<br>
=C2=A0--- a/libiberty/ChangeLog<br>
=C2=A0+++ b/libiberty/ChangeLog<br>
-@@ -1,3 +1,20 @@<br>
+@@ -2,6 +2,23 @@<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * GCC 6.4.0 released.<br>
+<br>
=C2=A0+2016-08-04=C2=A0 Marcel B=C3=B6hme=C2=A0 &lt;<a href=3D"mailto:boehm=
e.marcel@gmail.com" target=3D"_blank">boehme.marcel@gmail.com</a>&gt;<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 =C2=A0 PR c++/71696<br>
-+=C2=A0 =C2=A0 =C2=A0 * cplus-dem.c: Prevent infinite recursion when there=
 is a cycle<br>
-+=C2=A0 =C2=A0 =C2=A0 in the referencing of remembered mangled types.<br>
-+=C2=A0 =C2=A0 =C2=A0 (work_stuff): New stack to keep track of the remembe=
red mangled<br>
-+=C2=A0 =C2=A0 =C2=A0 types that are currently being processed.<br>
-+=C2=A0 =C2=A0 =C2=A0 (push_processed_type): New method to push currently =
processed<br>
-+=C2=A0 =C2=A0 =C2=A0 remembered type onto the stack.<br>
-+=C2=A0 =C2=A0 =C2=A0 (pop_processed_type): New method to pop currently pr=
ocessed<br>
-+=C2=A0 =C2=A0 =C2=A0 remembered type from the stack.<br>
-+=C2=A0 =C2=A0 =C2=A0 (work_stuff_copy_to_from): Copy values of new variab=
les.<br>
-+=C2=A0 =C2=A0 =C2=A0 (delete_non_B_K_work_stuff): Free stack memory.<br>
-+=C2=A0 =C2=A0 =C2=A0 (demangle_args): Push/Pop currently processed rememb=
ered type.<br>
-+=C2=A0 =C2=A0 =C2=A0 (do_type): Do not demangle a cyclic reference and pu=
sh/pop<br>
-+=C2=A0 =C2=A0 =C2=A0 referenced remembered type.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0PR c++/71696<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* cplus-dem.c: Prevent infinite recursion when=
 there is a cycle<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0in the referencing of remembered mangled types=
.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(work_stuff): New stack to keep track of the r=
emembered mangled<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0types that are currently being processed.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(push_processed_type): New method to push curr=
ently processed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0remembered type onto the stack.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(pop_processed_type): New method to pop curren=
tly processed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0remembered type from the stack.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(work_stuff_copy_to_from): Copy values of new =
variables.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(delete_non_B_K_work_stuff): Free stack memory=
.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(demangle_args): Push/Pop currently processed =
remembered type.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0(do_type): Do not demangle a cyclic reference =
and push/pop<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0referenced remembered type.<br>
=C2=A0+<br>
=C2=A0 2016-12-21=C2=A0 Release Manager<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* GCC 6.3.0 released.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * GCC 6.3.0 released.<br>
+<br>
=C2=A0diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c<br>
=C2=A0index 7514e57..f21e630 100644<br>
=C2=A0--- a/libiberty/cplus-dem.c<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian=
_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-cross-canadian_6.3.b=
b</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_6.4.=
bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-cross-canadian_6.4.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-canadian_6.3.bb=
</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_6.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-canadian_6.4.bb</=
a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-cross-initial_6.3.bb<=
/a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_6.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-cross-initial_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_6=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-initial_6.3.bb</=
a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-initial_6.4.bb</a>=
<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_6.3.bb" =
rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-cross_6.3.bb</a> b/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-cross_6.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gc<wbr>c-cross_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_6.3.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_6.4.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initi=
al_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-crosssdk-initial_6=
.3.bb</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initia=
l_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-crosssdk-initial_6.=
4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initia=
l_6.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk-initial_6.=
3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_=
6.4.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk-initial_6.4.=
bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_6.3.b=
b" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-crosssdk_6.3.bb</a> b/meta=
/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_6.4.bb" rel=3D"norefer=
rer" target=3D"_blank">gc<wbr>c-crosssdk_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_6.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_6.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-runtime_6.3.bb</a> b/meta/r=
ecipes-devtools/gcc/<a href=3D"http://gcc-runtime_6.4.bb" rel=3D"noreferrer=
" target=3D"_blank">gc<wbr>c-runtime_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>runtime_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_6.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-<wbr>runtime_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_6.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-sanitizers_6.3.bb</a> b/=
meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_6.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">gc<wbr>c-sanitizers_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_6.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>sanitizers_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_6.4.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>sanitizers_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">gc<wbr>c-source_6.3.bb</a> b/meta/rec=
ipes-devtools/gcc/<a href=3D"http://gcc-source_6.4.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gc<wbr>c-source_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_6.3.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>source_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_6.4.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-<wbr>source_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_6.3.bb" rel=3D=
"noreferrer" target=3D"_blank">gc<wbr>c_6.3.bb</a> b/meta/recipes-devtools/=
gcc/<a href=3D"http://gcc_6.4.bb" rel=3D"noreferrer" target=3D"_blank">gc<w=
br>c_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_6.3.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc_<wbr>6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_6.4.bb" rel=3D"no=
referrer" target=3D"_blank">gcc_<wbr>6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_6.3=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>bgcc-initial_6.3.bb</a> b/=
meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_6.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bgcc-initial_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_6.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libg<wbr>cc-initial_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_6.4.bb=
" rel=3D"noreferrer" target=3D"_blank">libg<wbr>cc-initial_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_6.3.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>bgcc_6.3.bb</a> b/meta/recipes-dev=
tools/gcc/<a href=3D"http://libgcc_6.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">li<wbr>bgcc_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_6.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libg<wbr>cc_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_6.4.bb" rel=3D=
"noreferrer" target=3D"_blank">libg<wbr>cc_6.4.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_6.3.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>bgfortran_6.3.bb</a> b/meta/r=
ecipes-devtools/gcc/<a href=3D"http://libgfortran_6.4.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>bgfortran_6.4.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libg<wbr>fortran_6.3.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_6.4.bb" r=
el=3D"noreferrer" target=3D"_blank">libg<wbr>fortran_6.4.bb</a><span class=
=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m_1921000856163412207HOE=
nZb"><font color=3D"#888888"><br>
<span class=3D"m_1921000856163412207m_508526145215732877HOEnZb"><font color=
=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></font></span></blockquote></div><span class=3D=
"HOEnZb"><font color=3D"#888888"><br></font></span></div>
</blockquote></div><br></div>
</blockquote></div><br></div>

--001a114a4cfa0acb0f0566951230--
