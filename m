Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CB102788B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 07:46:59 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 188so7603007wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 23:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qW3IZw0M54CDYKP0/v9uB0qSI6gnRu3K4HDrNzS5RpA=;
	b=AIGcdKEudQtxYmX4jMaIBCYMRs/E9JSgmiy51O6OowZuQhiyXyQG9ljJXNwN9mH7Iq
	LBzF+kUtakNQ9DOvp38Vwk80s8oxA7fzf9RdnEHMcvXmKX380N45T5qn8NViaMnUvdvO
	UNnnpWvs9x95eBfNc9IGNBy5PEcwiREVgZgrL45pBIg07Z6oOn1RhBbbUfY1EK2k3HjZ
	O05pBookgnWFZeTHqpUvpsl+7TjYWxAeRnLVlSZlrgHs9Jpyprmh4OI9SUqqLYggrHAy
	WwvNcwBrTN8MefOTkp/TsWh/RAwwTAiaoth8kpfFSOSSou7QrrmbUgDurdLsp8gphhPt
	CJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qW3IZw0M54CDYKP0/v9uB0qSI6gnRu3K4HDrNzS5RpA=;
	b=lHSEEZUYdNAaHjKuwTnGgo7c58mtBAJynxvEK3+9MAAwWWQJUBAU51pS7jOs/YX8/e
	sZbDjpnWfb4YnaJmpqCCZQg40ZsEFdKRAKa6s4I+tUdAxqjxQw311m0xekmiO+4uU9cT
	NhXpsCS1S174lcd+qENMVXJxrIc30FfhJTswbPqVSV9uThcL0S7DRe9krBs8hxz7mErE
	Lr2+eVbI4YIR5+9wQ+1maKba2Vo06YyvPmwRNIW22LIciGeDlDm7yNi3iCX7mFEr//of
	CSe8dEAv+jQGsAh0lDC1IbC3sWZzSSNjywLb/YhBRJCZxFJou9Bg5FEHjWZthN8s4ylU
	K+CA==
X-Gm-Message-State: AElRT7Fh90n8xOS0NeCAwUVosSid55TaeiXq1ObyztylUiIJF5/YGGXQ
	DEybUFrySVQ/eb5Nd7pnYMY=
X-Google-Smtp-Source: AG47ELumJaTyNrUG/3eJzUbTdK0TgvJ3VDknYz/YqsyZ/yVYf8vNiztiro+k1KvkvlPDthRKHaBmQw==
X-Received: by 10.28.19.206 with SMTP id 197mr558147wmt.89.1520668020922;
	Fri, 09 Mar 2018 23:47:00 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 41sm2833441wrc.33.2018.03.09.23.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Mar 2018 23:46:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 10 Mar 2018 08:46:59 +0100
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Message-ID: <20180310074659.GA7868@jama>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Sat, 10 Mar 2018 07:47:01 -0000
X-Groupsio-MsgNum: 109166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, 2018 at 11:56:58PM +0000, Bystricky, Juro wrote:
> I forgot to mention that if there are no objections against this patchset=
, I intend to do the same/equivalent upgrades for other releases with gcc 6=
x (rocko, pyro, ...)  and also upgrade gcc5.x and 4.9x where present.

Thanks for this work.

It might be a bit easier to do and review this by starting with rocko
(with just small change on top with newly backported changes) and just
cherry-picking the necessary changes down to pyro and then few more down
to morty (similar to Andre's backports in his branch).

With single big patch it's difficult to make sure that all the branches
got all the changes and to review what's "new" compared to 6.4.0 which
used to be in master.

Regards,

> ________________________________________
> From: Bystricky, Juro
> Sent: Friday, March 09, 2018 3:49 PM
> To: openembedded-core@lists.openembedded.org
> Cc: richard.purdie@linuxfoundation.org; jurobystricky@hotmail.com; martin=
=2Ejansa@gmail.com; armccurdy@gmail.com; raj.khem@gmail.com; Bystricky, Juro
> Subject: [morty][PATCH v2] gcc6.4 upgrade
>=20
> Second attempt. Added some more patches, mostly ARM specific.
> AFAIK this patchset passed all x86-64 tests.
>=20
> I also did some limited testing with meta-raspberrypi and musl library.
>=20
> (raspberrypi did not build with v1 of the patchset)
>=20
>=20
> Juro Bystricky (1):
>   gcc6: Upgrade to 6.4.0 (latest stable series release)
>=20
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   92 -
>  .../gcc/gcc-6.2/CVE-2016-4490.patch                |  290 ---
>  .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch |   28 -
>  .../gcc/{gcc-6.2.inc =3D> gcc-6.4.inc}               |   31 +-
>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
>  .../{gcc-6.2 =3D> gcc-6.4}/0002-uclibc-conf.patch    |    0
>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0
>  .../{gcc-6.2 =3D> gcc-6.4}/0004-uclibc-locale.patch  |    0
>  .../0005-uclibc-locale-no__x.patch                 |    0
>  .../0006-uclibc-locale-wchar_fix.patch             |    0
>  .../0007-uclibc-locale-update.patch                |    0
>  .../0008-missing-execinfo_h.patch                  |    0
>  .../{gcc-6.2 =3D> gcc-6.4}/0009-c99-snprintf.patch   |    0
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
>  .../{gcc-6.2 =3D> gcc-6.4}/0023-Disable-sdt.patch    |    0
>  .../gcc/{gcc-6.2 =3D> gcc-6.4}/0024-libtool.patch    |    0
>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
>  ...tilib-config-files-from-B-instead-of-usin.patch |    0
>  ...-libdir-from-.la-which-usually-points-to-.patch |    0
>  .../gcc/{gcc-6.2 =3D> gcc-6.4}/0028-export-CPP.patch |    0
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
>  .../{gcc-6.2 =3D> gcc-6.4}/0041-ssp_nonshared.patch  |    0
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
>  .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++=
++++++
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
>  ...s-canadian_6.2.bb =3D> gcc-cross-canadian_6.4.bb} |    0
>  ...oss-initial_6.2.bb =3D> gcc-cross-initial_6.4.bb} |    0
>  .../gcc/{gcc-cross_6.2.bb =3D> gcc-cross_6.4.bb}     |    0
>  ...-initial_6.2.bb =3D> gcc-crosssdk-initial_6.4.bb} |    0
>  .../{gcc-crosssdk_6.2.bb =3D> gcc-crosssdk_6.4.bb}   |    0
>  .../gcc/{gcc-runtime_6.2.bb =3D> gcc-runtime_6.4.bb} |    0
>  ...gcc-sanitizers_6.2.bb =3D> gcc-sanitizers_6.4.bb} |    0
>  .../gcc/{gcc-source_6.2.bb =3D> gcc-source_6.4.bb}   |    0
>  .../gcc/{gcc_6.2.bb =3D> gcc_6.4.bb}                 |    0
>  ...libgcc-initial_6.2.bb =3D> libgcc-initial_6.4.bb} |    0
>  .../gcc/{libgcc_6.2.bb =3D> libgcc_6.4.bb}           |    0
>  .../gcc/{libgfortran_6.2.bb =3D> libgfortran_6.4.bb} |    0
>  83 files changed, 8149 insertions(+), 418 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-=
71056-Don-t-use-vectorized-builtins-wh.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-emp=
ty-string.patch
>  rename meta/recipes-devtools/gcc/{gcc-6.2.inc =3D> gcc-6.4.inc} (77%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0001-gcc-4.3.1-A=
RCH_FLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0002-uclibc-conf=
=2Epatch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0003-gcc-uclibc-=
locale-ctype_touplow_t.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0004-uclibc-loca=
le.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0005-uclibc-loca=
le-no__x.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0006-uclibc-loca=
le-wchar_fix.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0007-uclibc-loca=
le-update.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0008-missing-exe=
cinfo_h.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0009-c99-snprint=
f.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0010-gcc-poison-=
system-directories.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0011-gcc-poison-=
dir-extend.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0012-gcc-4.3.3-S=
YSROOT_CFLAGS_FOR_TARGET.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0013-64-bit-mult=
ilib-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0014-optional-li=
bstdc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0015-gcc-disable=
-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0016-COLLECT_GCC=
_OPTIONS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0017-Use-the-def=
aults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0018-fortran-cro=
ss-compile-hack.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0019-cpp-honor-s=
ysroot.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0020-MIPS64-Defa=
ult-to-N64-ABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0021-Define-GLIB=
C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0022-gcc-Fix-arg=
ument-list-too-long-error.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0023-Disable-sdt=
=2Epatch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0024-libtool.pat=
ch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0025-gcc-armv4-p=
ass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0026-Use-the-mul=
tilib-config-files-from-B-instead-of-usin.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0027-Avoid-using=
-libdir-from-.la-which-usually-points-to-.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0028-export-CPP.=
patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0029-Enable-SPE-=
AltiVec-generation-on-powepc-linux-target.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0030-Disable-the=
-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0031-Ensure-targ=
et-gcc-headers-can-be-included.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0032-gcc-4.8-won=
-t-build-with-disable-dependency-tracking.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0033-Don-t-searc=
h-host-directory-during-relink-if-inst_pr.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0034-Use-SYSTEML=
IBS_DIR-replacement-instead-of-hardcoding.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0035-aarch64-Add=
-support-for-musl-ldso.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0036-libcc1-fix-=
libcc1-s-install-path-and-rpath.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0037-handle-sysr=
oot-support-for-nativesdk-gcc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0038-Search-targ=
et-sysroot-gcc-version-specific-dirs-with.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0039-Fix-various=
-_FOR_BUILD-and-related-variables.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0040-nios2-Defin=
e-MUSL_DYNAMIC_LINKER.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0041-ssp_nonshar=
ed.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0042-gcc-libcpp-=
support-ffile-prefix-map-old-new.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0043-Reuse-fdebu=
g-prefix-map-to-replace-ffile-prefix-map.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0044-gcc-final.c=
-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0045-libgcc-Add-=
knob-to-use-ldbl-128-on-ppc.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0046-Link-libgcc=
-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>  rename meta/recipes-devtools/gcc/{gcc-6.2 =3D> gcc-6.4}/0047-libgcc_s-Us=
e-alias-for-__cpu_indicator_init-instead-.patch (100%)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stdde=
f.h-with-musl.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-=
flags.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc=
26.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-s=
uppress-32-bit-aligned-ldrd-strd-peeph.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enabl=
e-FL_LPAE-flag-for-armv7ve-cores.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-=
Move-struct-ix86_frame-to-machine_function.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-=
Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-=
Use-const-reference-of-struct-ix86_frame-to-avo.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-A=
dd-mindirect-branch.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-A=
dd-mfunction-return.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-A=
dd-mindirect-branch-register.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-A=
dd-V-register-operand-modifier.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-D=
isallow-mindirect-branch-mfunction-return-with-.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-I=
NVALID_REGNUM-in-indirect-thunk-processing.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-=
Pass-INVALID_REGNUM-as-invalid-register-number.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-=
Update-mfunction-return-for-return-with-pop.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-=
Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-P=
R-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6=
131.patch
>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb =3D> gcc-cro=
ss-canadian_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb =3D> gcc-cros=
s-initial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb =3D> gcc-cross_6.4.bb=
} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb =3D> gcc-c=
rosssdk-initial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb =3D> gcc-crosssdk_=
6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb =3D> gcc-runtime_6.=
4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb =3D> gcc-sanitiz=
ers_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb =3D> gcc-source_6.4.=
bb} (100%)
>  rename meta/recipes-devtools/gcc/{gcc_6.2.bb =3D> gcc_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb =3D> libgcc-init=
ial_6.4.bb} (100%)
>  rename meta/recipes-devtools/gcc/{libgcc_6.2.bb =3D> libgcc_6.4.bb} (100=
%)
>  rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb =3D> libgfortran_6.=
4.bb} (100%)
>=20
> --
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWqONcgAKCRA3VSO3ZXaA
HEvqAJ9oFk5LDbmy9/IQzHEwiY5pV5b4qACfbup+giinRpoAZdjYwGxP0HzjkuU=
=wJIN
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
