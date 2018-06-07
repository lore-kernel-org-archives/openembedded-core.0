Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4D67557E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 00:45:18 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id i15-v6so1582328lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SV0caWJTPuoF6/OMksQyPPdw+1oPmWk8tJuyfPbY8i0=;
	b=Zv2kKO8777pi4afHDLHh6atmL9Gda2Li1sHLwjaDYNf9SkTtcc2ach+N4wZj9G/4i/
	fKzv7vAzX8C7b7iNK3qEGtCeGrk+DBbGslacCvASECL+fkn5sASsvCWl7DaqRq6p0hv6
	hEfuyN0hTTTvI5VNE3uDa6M/bGQzqiY34XKHt7lp8jLbRL87lXXswAQo70l+9Rl5tjVd
	B2o/Uc15rp47eUvG0k1TdsQyaquMRIOFcUHn0MWY5qoVcBLV/WJp9086Ofbn/vK6TAsG
	HdAkrHdsuGPTotxNZCVvqBJ4wx9pSm6IQKmdOCEuKU1k3D2hJJsCRM5yelNFDpCVD5Ta
	SB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SV0caWJTPuoF6/OMksQyPPdw+1oPmWk8tJuyfPbY8i0=;
	b=SqncqerbRK+vMuMLXMOJD0et6pf4Cx1xRmAbm9XTt9DCQKA4IQmfgAs3N4LjzN51d8
	BPgbGX+j7iu1NDVikBrqzPGeWdUGaTzO4SccIZo3GFePdo+EH9fcE3ZqlTl7LNoloPQx
	osWQPRogUhIlOCxgmb10hnpqOlilYVHVyuRNZtV1/XjabEYmHMJv+mCq2WdOBFK5Vb51
	pvd9dC/nPhLTMVGAh+m3nS2yRy6N+aplFH7kexOOrN4uwMmU2jaRC4QWKhAMiW86rJYP
	0BoVhH01U6Yc1sOQ45S93jUcxep+cAvCzMsOWuXeMGrkV0W1BOxGtolW1VEhxrMNu772
	rlCQ==
X-Gm-Message-State: APt69E0HjZSh7Oy/M2D2OaDKA35DA8FCxj8L/l6Onq/Qm2LJxbemSSBE
	bwsESARDw3ZbTjhlnDmrAfeewjWJfPGl2atu1d8=
X-Google-Smtp-Source: ADUXVKJ654NhRkAVadePIz0xn3kb6CKQVzi33L7hx8MCRiyxdtdjWAM8G6C8okTF/2HmxfTlnHJXfFL5TEHMviPH098=
X-Received: by 2002:a2e:2bcb:: with SMTP id
	r72-v6mr3707632ljr.133.1528332318782; 
	Wed, 06 Jun 2018 17:45:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 17:45:18 -0700 (PDT)
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Jun 2018 20:45:18 -0400
Message-ID: <CADkTA4OwmjAJwxauPDWpxsoxENxSHpiNWkSm-Y8Gi9_CNdrMqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/12] Add GCC 8 recipes
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
X-List-Received-Date: Thu, 07 Jun 2018 00:45:19 -0000
Content-Type: multipart/alternative; boundary="000000000000f5b7f3056e029876"

--000000000000f5b7f3056e029876
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 5:37 PM, Khem Raj <raj.khem@gmail.com> wrote:

> This changeset is including the review feedback from last patchset
>
> - Fixes ppc such that we dont have to change machine options so it remains
> backward compatible and folks can still use gcc7
> - Tweaks arm tunes to set -mtune instead of -mcpu, this avoids conflicts
> between -march/-mcpu
> - Removes workarounds to avoid these conflicts in valgrind
> - Add mips 74kc tune files
> - Linux yocto changes are also part of Bruce's kernel updates but this
> makes it complete until those changes are pulled in
>

Correct. I have all of the gcc8 patches in linux-yocto 4.12/4.14/4.15 and
linux-yocto-dev.

They should have been covered by my last set of SRCREV updates, and I
noticed that
some are in, and some not.

I'll resubmit my SRCREV queue tomorrow, and that will cover the gcc8 angle.

Bruce


>
> The following changes since commit cd195bdf5dd2c8ff03c58a63dcabe8
> 8b142d2a9c:
>
>   oe-pkgdata-util: package-info: Re-add support for the --extra option
> (2018-06-04 15:14:43 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-8
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>
> Khem Raj (12):
>   tune/arm: Set -mtune instead of -mcpu
>   valgrind: Remove code to remove -mcpu option on arm
>   tune-mips-74k.inc: add tune file for 74kc mips
>   gcc-8: Add recipes for 8.1 release
>   gcc-8: Disable libssp for non mingw targets
>   gcc-8: Disable float128 for ppc/musl
>   gcc-8: Enabled mspe options for rs6000 ppc backend
>   tcmode-default: Switch to gcc 8.0
>   linux-yocto: Fix build with gcc8 for ppc
>   linux-yocto: Fix mips build with gcc8
>   linux-yocto: Fix mips64 build with gcc8
>   linux-yocto: Fix GCC 8 -Wrestrict error
>
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../machine/include/mips/tune-mips-74k.inc    |  37 +++
>  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
>  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
>  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
>  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
>  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
>  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
>  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
>  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
>  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
>  .../machine/include/tune-strongarm1100.inc    |   2 +-
>  meta/conf/machine/include/tune-thunderx.inc   |   2 +-
>  meta/conf/machine/include/tune-xscale.inc     |   2 +-
>  meta/recipes-devtools/gcc/gcc-8.1.inc         | 127 +++++++++
>  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  42 +++
>  .../gcc/gcc-8.1/0002-c99-snprintf.patch       |  28 ++
>  .../0003-gcc-poison-system-directories.patch  | 192 +++++++++++++
>  .../gcc-8.1/0004-gcc-poison-dir-extend.patch  |  39 +++
>  ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++++
>  .../gcc-8.1/0006-64-bit-multilib-hack.patch   |  85 ++++++
>  .../gcc/gcc-8.1/0007-optional-libstdc.patch   | 125 +++++++++
>  ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++++
>  .../gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch    |  38 +++
>  ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
>  .../0011-fortran-cross-compile-hack.patch     |  46 ++++
>  .../gcc/gcc-8.1/0012-cpp-honor-sysroot.patch  |  54 ++++
>  .../0013-MIPS64-Default-to-N64-ABI.patch      |  57 ++++
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 ++++++++++++++++
>  ...gcc-Fix-argument-list-too-long-error.patch |  40 +++
>  .../gcc/gcc-8.1/0016-Disable-sdt.patch        | 113 ++++++++
>  .../gcc/gcc-8.1/0017-libtool.patch            |  42 +++
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |  43 +++
>  ...-config-files-from-B-instead-of-usin.patch | 102 +++++++
>  ...ir-from-.la-which-usually-points-to-.patch |  31 +++
>  .../gcc/gcc-8.1/0021-export-CPP.patch         |  53 ++++
>  ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 +++
>  ...e-target-gcc-headers-can-be-included.patch |  98 +++++++
>  ...ild-with-disable-dependency-tracking.patch |  54 ++++
>  ...t-directory-during-relink-if-inst_pr.patch |  38 +++
>  ...IR-replacement-instead-of-hardcoding.patch |  29 ++
>  ...27-aarch64-Add-support-for-musl-ldso.patch |  28 ++
>  ...-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
>  ...le-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++++++++++
>  ...sroot-gcc-version-specific-dirs-with.patch | 102 +++++++
>  ...ous-_FOR_BUILD-and-related-variables.patch | 137 ++++++++++
>  ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  28 ++
>  ...d-to-link-commandline-for-musl-targe.patch |  87 ++++++
>  ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 +++++++++
>  ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ++
>  ...as-for-__cpu_indicator_init-instead-.patch |  86 ++++++
>  .../0037-sync-gcc-stddef.h-with-musl.patch    |  91 ++++++
>  ...-fault-in-precompiled-header-generat.patch |  60 ++++
>  .../0039-Fix-for-testsuite-failure.patch      | 258 ++++++++++++++++++
>  ...Re-introduce-spe-commandline-options.patch |  41 +++
>  meta/recipes-devtools/gcc/gcc-common.inc      |   2 +-
>  .../gcc/gcc-cross-canadian_8.1.bb             |   5 +
>  .../gcc/gcc-cross-initial_8.1.bb              |   2 +
>  meta/recipes-devtools/gcc/gcc-cross_8.1.bb    |   3 +
>  .../gcc/gcc-crosssdk-initial_8.1.bb           |   3 +
>  meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb |   2 +
>  meta/recipes-devtools/gcc/gcc-runtime_8.1.bb  |   7 +
>  .../gcc/gcc-sanitizers_8.1.bb                 |   2 +
>  meta/recipes-devtools/gcc/gcc-source_8.1.bb   |   4 +
>  meta/recipes-devtools/gcc/gcc_8.1.bb          |  10 +
>  .../gcc/libgcc-initial_8.1.bb                 |   2 +
>  meta/recipes-devtools/gcc/libgcc_8.1.bb       |   2 +
>  meta/recipes-devtools/gcc/libgfortran_8.1.bb  |   3 +
>  .../valgrind/valgrind_3.13.0.bb               |  11 -
>  ...ips-Disable-attribute-alias-warnings.patch |  43 +++
>  ...ps64-Disable-attribute-alias-warning.patch |  26 ++
>  ...jtool-perf-Fix-GCC-8-Wrestrict-error.patch |  51 ++++
>  ...e-attribute-alias-warnings-from-gcc8.patch |  31 +++
>  ...d-pager.c-do-not-alias-select-params.patch |  43 +++
>  ...isable-array-bounds-warning-with-gcc.patch |  28 ++
>  meta/recipes-kernel/linux/linux-yocto_4.15.bb |   8 +
>  79 files changed, 3648 insertions(+), 28 deletions(-)
>  create mode 100644 meta/conf/machine/include/mips/tune-mips-74k.inc
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1.inc
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0002-c99-snprintf.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0003-gcc-poison-system-directories.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-
> extend.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0006-64-bit-multilib-hack.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0007-optional-libstdc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0009-COLLECT_GCC_OPTIONS.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-
> compile-hack.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0012-cpp-honor-sysroot.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0013-MIPS64-Default-to-N64-ABI.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0015-gcc-Fix-argument-list-too-long-error.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0016-Disable-sdt.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0021-export-CPP.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0027-aarch64-Add-support-for-musl-ldso.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-
> support-for-nativesdk-gcc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-
> sysroot-gcc-version-specific-dirs-with.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0037-sync-gcc-stddef.h-with-musl.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0039-Fix-for-testsuite-failure.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-
> 8.1/0040-Re-introduce-spe-commandline-options.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-source_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgcc_8.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgfortran_8.1.bb
>  create mode 100644 meta/recipes-kernel/linux/files/0001-mips-Disable-
> attribute-alias-warnings.patch
>  create mode 100644 meta/recipes-kernel/linux/files/0001-mips64-Disable-
> attribute-alias-warning.patch
>  create mode 100644 meta/recipes-kernel/linux/files/0001-objtool-perf-Fix-
> GCC-8-Wrestrict-error.patch
>  create mode 100644 meta/recipes-kernel/linux/files/0001-powerpc-Disable-
> attribute-alias-warnings-from-gcc8.patch
>  create mode 100644 meta/recipes-kernel/linux/files/0001-tools-lib-subcmd-
> pager.c-do-not-alias-select-params.patch
>  create mode 100644 meta/recipes-kernel/linux/files/0002-powerpc-ptrace-
> Disable-array-bounds-warning-with-gcc.patch
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000f5b7f3056e029876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jun 6, 2018 at 5:37 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">This changeset is includin=
g the review feedback from last patchset<br>
<br>
- Fixes ppc such that we dont have to change machine options so it remains =
backward compatible and folks can still use gcc7<br>
- Tweaks arm tunes to set -mtune instead of -mcpu, this avoids conflicts be=
tween -march/-mcpu<br>
- Removes workarounds to avoid these conflicts in valgrind<br>
- Add mips 74kc tune files<br>
- Linux yocto changes are also part of Bruce&#39;s kernel updates but this =
makes it complete until those changes are pulled in<br></blockquote><div><b=
r></div><div>Correct. I have all of the gcc8 patches in linux-yocto 4.12/4.=
14/4.15 and linux-yocto-dev.</div><div><br></div><div>They should have been=
 covered by my last set of SRCREV updates, and I noticed that</div><div>som=
e are in, and some not.</div><div><br></div><div>I&#39;ll resubmit my SRCRE=
V queue tomorrow, and that will cover the gcc8 angle.</div><div><br></div><=
div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The following changes since commit cd195bdf5dd2c8ff03c58a63dcabe8<wbr>8b142=
d2a9c:<br>
<br>
=C2=A0 oe-pkgdata-util: package-info: Re-add support for the --extra option=
 (2018-06-04 15:14:43 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/<wbr>openembe=
dded-core-contrib</a> kraj/gcc-8<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dkraj/gcc-8" rel=3D"noreferrer" target=3D"_blank">http://cgit.openemb=
edded.org/<wbr>openembedded-core-contrib/log/<wbr>?h=3Dkraj/gcc-8</a><br>
<br>
Khem Raj (12):<br>
=C2=A0 tune/arm: Set -mtune instead of -mcpu<br>
=C2=A0 valgrind: Remove code to remove -mcpu option on arm<br>
=C2=A0 tune-mips-74k.inc: add tune file for 74kc mips<br>
=C2=A0 gcc-8: Add recipes for 8.1 release<br>
=C2=A0 gcc-8: Disable libssp for non mingw targets<br>
=C2=A0 gcc-8: Disable float128 for ppc/musl<br>
=C2=A0 gcc-8: Enabled mspe options for rs6000 ppc backend<br>
=C2=A0 tcmode-default: Switch to gcc 8.0<br>
=C2=A0 linux-yocto: Fix build with gcc8 for ppc<br>
=C2=A0 linux-yocto: Fix mips build with gcc8<br>
=C2=A0 linux-yocto: Fix mips64 build with gcc8<br>
=C2=A0 linux-yocto: Fix GCC 8 -Wrestrict error<br>
<br>
=C2=A0meta/conf/distro/include/<wbr>tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../machine/include/mips/tune-<wbr>mips-74k.inc=C2=A0 =C2=A0 |=C2=A0 =
37 +++<br>
=C2=A0.../conf/machine/include/tune-<wbr>arm1136jf-s.inc |=C2=A0 =C2=A02 +-=
<br>
=C2=A0meta/conf/machine/include/<wbr>tune-arm920t.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-arm926ejs.inc=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-arm9tdmi.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa15.inc=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa17.inc=C2=A0 |=C2=A0 =C2=
=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa5.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa7.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa8.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-cortexa9.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-ep9312.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-iwmmxt.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../machine/include/tune-<wbr>strongarm1100.inc=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-thunderx.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/conf/machine/include/<wbr>tune-xscale.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>8.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 127 +++++++++<br>
=C2=A0...0001-gcc-4.3.1-ARCH_FLAGS_<wbr>FOR_TARGET.patch |=C2=A0 42 +++<br>
=C2=A0.../gcc/gcc-8.1/0002-c99-<wbr>snprintf.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 28 ++<br>
=C2=A0.../0003-gcc-poison-system-<wbr>directories.patch=C2=A0 | 192 +++++++=
++++++<br>
=C2=A0.../gcc-8.1/0004-gcc-poison-<wbr>dir-extend.patch=C2=A0 |=C2=A0 39 ++=
+<br>
=C2=A0...-gcc-4.3.3-SYSROOT_CFLAGS_<wbr>FOR_TARGET.patch |=C2=A0 73 +++++<b=
r>
=C2=A0.../gcc-8.1/0006-64-bit-<wbr>multilib-hack.patch=C2=A0 =C2=A0|=C2=A0 =
85 ++++++<br>
=C2=A0.../gcc/gcc-8.1/0007-optional-<wbr>libstdc.patch=C2=A0 =C2=A0| 125 ++=
+++++++<br>
=C2=A0...gcc-disable-MASK_RELAX_PIC_<wbr>CALLS-bit.patch |=C2=A0 59 ++++<br=
>
=C2=A0.../gcc-8.1/0009-COLLECT_GCC_<wbr>OPTIONS.patch=C2=A0 =C2=A0 |=C2=A0 =
38 +++<br>
=C2=A0...ts.h-in-B-instead-of-S-and-<wbr>t-oe-in-B.patch |=C2=A0 96 +++++++=
<br>
=C2=A0.../0011-fortran-cross-<wbr>compile-hack.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 46 ++++<br>
=C2=A0.../gcc/gcc-8.1/0012-cpp-<wbr>honor-sysroot.patch=C2=A0 |=C2=A0 54 ++=
++<br>
=C2=A0.../0013-MIPS64-Default-to-<wbr>N64-ABI.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 57 ++++<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_<wbr>DYNAMIC_LINKE.patch | 234 ++++++++++++=
++++<br>
=C2=A0...gcc-Fix-argument-list-too-<wbr>long-error.patch |=C2=A0 40 +++<br>
=C2=A0.../gcc/gcc-8.1/0016-Disable-<wbr>sdt.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 113 ++++++++<br>
=C2=A0.../gcc/gcc-8.1/0017-libtool.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 42 +++<br>
=C2=A0...s-fix-v4bx-to-linker-to-<wbr>support-EABI.patch |=C2=A0 43 +++<br>
=C2=A0...-config-files-from-B-<wbr>instead-of-usin.patch | 102 +++++++<br>
=C2=A0...ir-from-.la-which-usually-<wbr>points-to-.patch |=C2=A0 31 +++<br>
=C2=A0.../gcc/gcc-8.1/0021-export-<wbr>CPP.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 53 ++++<br>
=C2=A0...ILIB_OSDIRNAMES-and-other-<wbr>multilib-o.patch |=C2=A0 42 +++<br>
=C2=A0...e-target-gcc-headers-can-<wbr>be-included.patch |=C2=A0 98 +++++++=
<br>
=C2=A0...ild-with-disable-<wbr>dependency-tracking.patch |=C2=A0 54 ++++<br=
>
=C2=A0...t-directory-during-relink-<wbr>if-inst_pr.patch |=C2=A0 38 +++<br>
=C2=A0...IR-replacement-instead-of-<wbr>hardcoding.patch |=C2=A0 29 ++<br>
=C2=A0...27-aarch64-Add-support-for-<wbr>musl-ldso.patch |=C2=A0 28 ++<br>
=C2=A0...-fix-libcc1-s-install-path-<wbr>and-rpath.patch |=C2=A0 54 ++++<br=
>
=C2=A0...le-sysroot-support-for-<wbr>nativesdk-gcc.patch | 213 ++++++++++++=
+++<br>
=C2=A0...sroot-gcc-version-specific-<wbr>dirs-with.patch | 102 +++++++<br>
=C2=A0...ous-_FOR_BUILD-and-related-<wbr>variables.patch | 137 ++++++++++<b=
r>
=C2=A0...032-nios2-Define-MUSL_<wbr>DYNAMIC_LINKER.patch |=C2=A0 28 ++<br>
=C2=A0...d-to-link-commandline-for-<wbr>musl-targe.patch |=C2=A0 87 ++++++<=
br>
=C2=A0...bgcc-Add-knob-to-use-ldbl-<wbr>128-on-ppc.patch | 125 +++++++++<br=
>
=C2=A0...using-LDFLAGS-not-just-<wbr>SHLIB_LDFLAGS.patch |=C2=A0 29 ++<br>
=C2=A0...as-for-__cpu_indicator_<wbr>init-instead-.patch |=C2=A0 86 ++++++<=
br>
=C2=A0.../0037-sync-gcc-stddef.h-<wbr>with-musl.patch=C2=A0 =C2=A0 |=C2=A0 =
91 ++++++<br>
=C2=A0...-fault-in-precompiled-<wbr>header-generat.patch |=C2=A0 60 ++++<br=
>
=C2=A0.../0039-Fix-for-testsuite-<wbr>failure.patch=C2=A0 =C2=A0 =C2=A0 | 2=
58 ++++++++++++++++++<br>
=C2=A0...Re-introduce-spe-<wbr>commandline-options.patch |=C2=A0 41 +++<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>common.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../gcc/<a href=3D"http://gcc-cross-canadian_8.1.bb" rel=3D"noreferre=
r" target=3D"_blank">gcc-cross-canadian_8.<wbr>1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0.../gcc/<a href=3D"http://gcc-cross-initial_8.1.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-cross-initial_8.1.<wbr>bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_8.1.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc-<wbr>cross_8.1.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +<br>
=C2=A0.../gcc/<a href=3D"http://gcc-crosssdk-initial_8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-crosssdk-initial_<wbr>8.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk_8.1.bb</a> |=C2=A0 =C2=
=A02 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-<wbr>runtime_8.1.bb</a>=C2=A0 |=C2=A0=
 =C2=A07 +<br>
=C2=A0.../gcc/<a href=3D"http://gcc-sanitizers_8.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-sanitizers_8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_8.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gcc-<wbr>source_8.1.bb</a>=C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcc_<wbr>8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 10 +<br>
=C2=A0.../gcc/<a href=3D"http://libgcc-initial_8.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libgcc-initial_8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://libgcc_8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">libg<wbr>cc_8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libg<wbr>fortran_8.1.bb</a>=C2=A0 |=C2=A0=
 =C2=A03 +<br>
=C2=A0.../valgrind/<a href=3D"http://valgrind_3.13.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">valgrind_3.13.0.<wbr>bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 -<br>
=C2=A0...ips-Disable-attribute-<wbr>alias-warnings.patch |=C2=A0 43 +++<br>
=C2=A0...ps64-Disable-attribute-<wbr>alias-warning.patch |=C2=A0 26 ++<br>
=C2=A0...jtool-perf-Fix-GCC-8-<wbr>Wrestrict-error.patch |=C2=A0 51 ++++<br=
>
=C2=A0...e-attribute-alias-warnings-<wbr>from-gcc8.patch |=C2=A0 31 +++<br>
=C2=A0...d-pager.c-do-not-alias-<wbr>select-params.patch |=C2=A0 43 +++<br>
=C2=A0...isable-array-bounds-<wbr>warning-with-gcc.patch |=C2=A0 28 ++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.15.bb</a> |=C2=A0 =C2=
=A08 +<br>
=C2=A079 files changed, 3648 insertions(+), 28 deletions(-)<br>
=C2=A0create mode 100644 meta/conf/machine/include/<wbr>mips/tune-mips-74k.=
inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0001-gcc-4.=
3.1-ARCH_FLAGS_<wbr>FOR_TARGET.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0002-c99-sn=
printf.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0003-gcc-po=
ison-system-<wbr>directories.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0004-gcc-po=
ison-dir-<wbr>extend.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0005-gcc-4.=
3.3-SYSROOT_<wbr>CFLAGS_FOR_TARGET.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0006-64-bit=
-multilib-hack.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0007-option=
al-libstdc.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0008-gcc-di=
sable-MASK_<wbr>RELAX_PIC_CALLS-bit.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0009-COLLEC=
T_GCC_OPTIONS.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0010-Use-th=
e-defaults.h-<wbr>in-B-instead-of-S-and-t-oe-in-<wbr>B.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0011-fortra=
n-cross-<wbr>compile-hack.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0012-cpp-ho=
nor-sysroot.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0013-MIPS64=
-Default-to-<wbr>N64-ABI.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0014-Define=
-GLIBC_DYNAMIC_<wbr>LINKER-and-UCLIBC_DYNAMIC_<wbr>LINKE.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0015-gcc-Fi=
x-argument-<wbr>list-too-long-error.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0016-Disabl=
e-sdt.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0017-libtoo=
l.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0018-gcc-ar=
mv4-pass-fix-<wbr>v4bx-to-linker-to-support-<wbr>EABI.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0019-Use-th=
e-multilib-<wbr>config-files-from-B-instead-<wbr>of-usin.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0020-Avoid-=
using-libdir-<wbr>from-.la-which-usually-points-<wbr>to-.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0021-export=
-CPP.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0022-Disabl=
e-the-MULTILIB_<wbr>OSDIRNAMES-and-other-multilib-<wbr>o.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0023-Ensure=
-target-gcc-<wbr>headers-can-be-included.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0024-gcc-4.=
8-won-t-build-<wbr>with-disable-dependency-<wbr>tracking.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0025-Don-t-=
search-host-<wbr>directory-during-relink-if-<wbr>inst_pr.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0026-Use-SY=
STEMLIBS_DIR-<wbr>replacement-instead-of-<wbr>hardcoding.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0027-aarch6=
4-Add-support-<wbr>for-musl-ldso.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0028-libcc1=
-fix-libcc1-s-<wbr>install-path-and-rpath.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0029-handle=
-sysroot-<wbr>support-for-nativesdk-gcc.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0030-Search=
-target-<wbr>sysroot-gcc-version-specific-<wbr>dirs-with.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0031-Fix-va=
rious-_FOR_<wbr>BUILD-and-related-variables.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0032-nios2-=
Define-MUSL_<wbr>DYNAMIC_LINKER.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0033-Add-ss=
p_nonshared-to-<wbr>link-commandline-for-musl-<wbr>targe.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0034-libgcc=
-Add-knob-to-<wbr>use-ldbl-128-on-ppc.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0035-Link-l=
ibgcc-using-<wbr>LDFLAGS-not-just-SHLIB_<wbr>LDFLAGS.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0036-libgcc=
_s-Use-alias-<wbr>for-__cpu_indicator_init-<wbr>instead-.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0037-sync-g=
cc-stddef.h-<wbr>with-musl.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0038-fix-se=
gmentation-<wbr>fault-in-precompiled-header-<wbr>generat.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0039-Fix-fo=
r-testsuite-<wbr>failure.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-<wbr>8.1/0040-Re-int=
roduce-spe-<wbr>commandline-options.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cr=
oss-canadian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-ca=
nadian_8.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cr=
oss-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross-ini=
tial_8.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cr=
oss_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>cross_8.1.bb</a><=
br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cr=
osssdk-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosss=
dk-initial_8.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-cr=
osssdk_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>crosssdk_8.1.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-ru=
ntime_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>runtime_8.1.bb<=
/a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-sa=
nitizers_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>sanitizers_8=
.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc-so=
urce_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-<wbr>source_8.1.bb</a=
><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gcc_<wbr>8.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://libgcc=
-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">libg<wbr>cc-initial_8=
.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://libgcc=
_8.1.bb" rel=3D"noreferrer" target=3D"_blank">libg<wbr>cc_8.1.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/<a href=3D"http://libgfo=
rtran_8.1.bb" rel=3D"noreferrer" target=3D"_blank">libg<wbr>fortran_8.1.bb<=
/a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0001-mips-Dis=
able-<wbr>attribute-alias-warnings.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0001-mips64-D=
isable-<wbr>attribute-alias-warning.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0001-objtool-=
perf-Fix-<wbr>GCC-8-Wrestrict-error.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0001-powerpc-=
Disable-<wbr>attribute-alias-warnings-from-<wbr>gcc8.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0001-tools-li=
b-subcmd-<wbr>pager.c-do-not-alias-select-<wbr>params.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>files/0002-powerpc-=
ptrace-<wbr>Disable-array-bounds-warning-<wbr>with-gcc.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
2.17.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--000000000000f5b7f3056e029876--
