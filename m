Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3C0788F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 23:56:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 15:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,448,1515484800"; d="scan'208";a="40703758"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga002.jf.intel.com with ESMTP; 09 Mar 2018 15:56:59 -0800
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 9 Mar 2018 15:56:58 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.175]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.98]) with mapi id
	14.03.0319.002; Fri, 9 Mar 2018 15:56:58 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [morty][PATCH v2] gcc6.4 upgrade
Thread-Index: AQHTuAFVGDs1nNZG2ECrkqALBGmGIqPIk5/J
Date: Fri, 9 Mar 2018 23:56:58 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
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
X-List-Received-Date: Fri, 09 Mar 2018 23:56:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I forgot to mention that if there are no objections against this patchset, =
I intend to do the same/equivalent upgrades for other releases with gcc 6x =
(rocko, pyro, ...)  and also upgrade gcc5.x and 4.9x where present.=0A=
=0A=
________________________________________=0A=
From: Bystricky, Juro=0A=
Sent: Friday, March 09, 2018 3:49 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: richard.purdie@linuxfoundation.org; jurobystricky@hotmail.com; martin.j=
ansa@gmail.com; armccurdy@gmail.com; raj.khem@gmail.com; Bystricky, Juro=0A=
Subject: [morty][PATCH v2] gcc6.4 upgrade=0A=
=0A=
Second attempt. Added some more patches, mostly ARM specific.=0A=
AFAIK this patchset passed all x86-64 tests.=0A=
=0A=
I also did some limited testing with meta-raspberrypi and musl library.=0A=
=0A=
(raspberrypi did not build with v1 of the patchset)=0A=
=0A=
=0A=
Juro Bystricky (1):=0A=
  gcc6: Upgrade to 6.4.0 (latest stable series release)=0A=
=0A=
 meta/conf/distro/include/tcmode-default.inc        |    2 +-=0A=
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   92 -=0A=
 .../gcc/gcc-6.2/CVE-2016-4490.patch                |  290 ---=0A=
 .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch |   28 -=0A=
 .../gcc/{gcc-6.2.inc =3D> gcc-6.4.inc}               |   31 +-=0A=
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0=0A=
 .../{gcc-6.2 =3D> gcc-6.4}/0002-uclibc-conf.patch    |    0=0A=
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0=0A=
 .../{gcc-6.2 =3D> gcc-6.4}/0004-uclibc-locale.patch  |    0=0A=
 .../0005-uclibc-locale-no__x.patch                 |    0=0A=
 .../0006-uclibc-locale-wchar_fix.patch             |    0=0A=
 .../0007-uclibc-locale-update.patch                |    0=0A=
 .../0008-missing-execinfo_h.patch                  |    0=0A=
 .../{gcc-6.2 =3D> gcc-6.4}/0009-c99-snprintf.patch   |    0=0A=
 .../0010-gcc-poison-system-directories.patch       |    0=0A=
 .../0011-gcc-poison-dir-extend.patch               |    0=0A=
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0=0A=
 .../0013-64-bit-multilib-hack.patch                |    0=0A=
 .../0014-optional-libstdc.patch                    |    0=0A=
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0=0A=
 .../0016-COLLECT_GCC_OPTIONS.patch                 |    0=0A=
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0=0A=
 .../0018-fortran-cross-compile-hack.patch          |    0=0A=
 .../0019-cpp-honor-sysroot.patch                   |    0=0A=
 .../0020-MIPS64-Default-to-N64-ABI.patch           |    0=0A=
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0=0A=
 ...0022-gcc-Fix-argument-list-too-long-error.patch |    0=0A=
 .../{gcc-6.2 =3D> gcc-6.4}/0023-Disable-sdt.patch    |    0=0A=
 .../gcc/{gcc-6.2 =3D> gcc-6.4}/0024-libtool.patch    |    0=0A=
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0=0A=
 ...tilib-config-files-from-B-instead-of-usin.patch |    0=0A=
 ...-libdir-from-.la-which-usually-points-to-.patch |    0=0A=
 .../gcc/{gcc-6.2 =3D> gcc-6.4}/0028-export-CPP.patch |    0=0A=
 ...AltiVec-generation-on-powepc-linux-target.patch |    0=0A=
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0=0A=
 ...Ensure-target-gcc-headers-can-be-included.patch |    0=0A=
 ...-t-build-with-disable-dependency-tracking.patch |    0=0A=
 ...h-host-directory-during-relink-if-inst_pr.patch |    0=0A=
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0=0A=
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0=0A=
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0=0A=
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0=0A=
 ...et-sysroot-gcc-version-specific-dirs-with.patch |    0=0A=
 ...-various-_FOR_BUILD-and-related-variables.patch |    0=0A=
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0=0A=
 .../{gcc-6.2 =3D> gcc-6.4}/0041-ssp_nonshared.patch  |    0=0A=
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0=0A=
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0=0A=
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0=0A=
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0=0A=
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0=0A=
 ...e-alias-for-__cpu_indicator_init-instead-.patch |    0=0A=
 .../gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch |   91 +=0A=
 .../gcc/gcc-6.4/0054_all_nopie-all-flags.patch     |   22 +=0A=
 .../gcc/gcc-6.4/0055-unwind_h-glibc26.patch        |  139 ++=0A=
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++=0A=
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |   67 +=0A=
 ...ove-struct-ix86_frame-to-machine_function.patch |  247 +++=0A=
 ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   74 +=0A=
 ...nst-reference-of-struct-ix86_frame-to-avo.patch |  131 ++=0A=
 .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++++=
++++=0A=
 .../backport/0005-x86-Add-mfunction-return.patch   | 1570 ++++++++++++++=
=0A=
 .../0006-x86-Add-mindirect-branch-register.patch   |  946 +++++++++=0A=
 .../0007-x86-Add-V-register-operand-modifier.patch |  139 ++=0A=
 ...w-mindirect-branch-mfunction-return-with-.patch |  304 +++=0A=
 ...VALID_REGNUM-in-indirect-thunk-processing.patch |  126 ++=0A=
 ...INVALID_REGNUM-as-invalid-register-number.patch |   46 +=0A=
 ...date-mfunction-return-for-return-with-pop.patch |  453 ++++=0A=
 ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1004 +++++++++=0A=
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++=0A=
 .../gcc/gcc-6.4/backport/CVE-2016-6131.patch       |  223 ++=0A=
 ...s-canadian_6.2.bb =3D> gcc-cross-canadian_6.4.bb} |    0=0A=
 ...oss-initial_6.2.bb =3D> gcc-cross-initial_6.4.bb} |    0=0A=
 .../gcc/{gcc-cross_6.2.bb =3D> gcc-cross_6.4.bb}     |    0=0A=
 ...-initial_6.2.bb =3D> gcc-crosssdk-initial_6.4.bb} |    0=0A=
 .../{gcc-crosssdk_6.2.bb =3D> gcc-crosssdk_6.4.bb}   |    0=0A=
 .../gcc/{gcc-runtime_6.2.bb =3D> gcc-runtime_6.4.bb} |    0=0A=
 ...gcc-sanitizers_6.2.bb =3D> gcc-sanitizers_6.4.bb} |    0=0A=
 .../gcc/{gcc-source_6.2.bb =3D> gcc-source_6.4.bb}   |    0=0A=
 .../gcc/{gcc_6.2.bb =3D> gcc_6.4.bb}                 |    0=0A=
 ...libgcc-initial_6.2.bb =3D> libgcc-initial_6.4.bb} |    0=0A=
 .../gcc/{libgcc_6.2.bb =3D> libgcc_6.4.bb}           |    0=0A=
 .../gcc/{libgfortran_6.2.bb =3D> libgfortran_6.4.bb} |    0=0A=
 83 files changed, 8149 insertions(+), 418 deletions(-)=0A=
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71=
056-Don-t-use-vectorized-builtins-wh.patch=0A=
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch=
=0A=
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty=
-string.patch=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc =3D> gcc-6.4.inc} (77%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0001-gcc-4.3.1-ARC=
H_FLAGS_FOR_TARGET.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0002-uclibc-conf.p=
atch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0003-gcc-uclibc-lo=
cale-ctype_touplow_t.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0004-uclibc-locale=
.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0005-uclibc-locale=
-no__x.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0006-uclibc-locale=
-wchar_fix.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0007-uclibc-locale=
-update.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0008-missing-execi=
nfo_h.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0009-c99-snprintf.=
patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0010-gcc-poison-sy=
stem-directories.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0011-gcc-poison-di=
r-extend.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0012-gcc-4.3.3-SYS=
ROOT_CFLAGS_FOR_TARGET.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0013-64-bit-multil=
ib-hack.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0014-optional-libs=
tdc.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0015-gcc-disable-M=
ASK_RELAX_PIC_CALLS-bit.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0016-COLLECT_GCC_O=
PTIONS.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0017-Use-the-defau=
lts.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0018-fortran-cross=
-compile-hack.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0019-cpp-honor-sys=
root.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0020-MIPS64-Defaul=
t-to-N64-ABI.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0021-Define-GLIBC_=
DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0022-gcc-Fix-argum=
ent-list-too-long-error.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0023-Disable-sdt.p=
atch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0024-libtool.patch=
 (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0025-gcc-armv4-pas=
s-fix-v4bx-to-linker-to-support-EABI.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0026-Use-the-multi=
lib-config-files-from-B-instead-of-usin.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0027-Avoid-using-l=
ibdir-from-.la-which-usually-points-to-.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0028-export-CPP.pa=
tch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0029-Enable-SPE-Al=
tiVec-generation-on-powepc-linux-target.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0030-Disable-the-M=
ULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0031-Ensure-target=
-gcc-headers-can-be-included.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0032-gcc-4.8-won-t=
-build-with-disable-dependency-tracking.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0033-Don-t-search-=
host-directory-during-relink-if-inst_pr.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0034-Use-SYSTEMLIB=
S_DIR-replacement-instead-of-hardcoding.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0035-aarch64-Add-s=
upport-for-musl-ldso.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0036-libcc1-fix-li=
bcc1-s-install-path-and-rpath.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0037-handle-sysroo=
t-support-for-nativesdk-gcc.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0038-Search-target=
-sysroot-gcc-version-specific-dirs-with.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0039-Fix-various-_=
FOR_BUILD-and-related-variables.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0040-nios2-Define-=
MUSL_DYNAMIC_LINKER.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0041-ssp_nonshared=
.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0042-gcc-libcpp-su=
pport-ffile-prefix-map-old-new.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0043-Reuse-fdebug-=
prefix-map-to-replace-ffile-prefix-map.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0044-gcc-final.c-f=
debug-prefix-map-support-to-remap-sourc.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0045-libgcc-Add-kn=
ob-to-use-ldbl-128-on-ppc.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0046-Link-libgcc-u=
sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0047-libgcc_s-Use-=
alias-for-__cpu_indicator_init-instead-.patch (100%)=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.=
h-with-musl.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-fl=
ags.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26=
.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-sup=
press-32-bit-aligned-ldrd-strd-peeph.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-=
FL_LPAE-flag-for-armv7ve-cores.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Mo=
ve-struct-ix86_frame-to-machine_function.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Us=
e-reference-of-struct-ix86_frame-to-avoid-cop.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Us=
e-const-reference-of-struct-ix86_frame-to-avo.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add=
-mindirect-branch.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add=
-mfunction-return.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add=
-mindirect-branch-register.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add=
-V-register-operand-modifier.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Dis=
allow-mindirect-branch-mfunction-return-with-.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INV=
ALID_REGNUM-in-indirect-thunk-processing.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pa=
ss-INVALID_REGNUM-as-invalid-register-number.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Up=
date-mfunction-return-for-return-with-pop.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Ad=
d-TARGET_INDIRECT_BRANCH_REGISTER.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-=
82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch=0A=
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-613=
1.patch=0A=
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb =3D> gcc-cross=
-canadian_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb =3D> gcc-cross-=
initial_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb =3D> gcc-cross_6.4.bb} =
(100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb =3D> gcc-cro=
sssdk-initial_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb =3D> gcc-crosssdk_6.=
4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb =3D> gcc-runtime_6.4.=
bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb =3D> gcc-sanitizer=
s_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb =3D> gcc-source_6.4.bb=
} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb =3D> gcc_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb =3D> libgcc-initia=
l_6.4.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb =3D> libgcc_6.4.bb} (100%)=
=0A=
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb =3D> libgfortran_6.4.=
bb} (100%)=0A=
=0A=
--=0A=
2.7.4=0A=
=0A=

