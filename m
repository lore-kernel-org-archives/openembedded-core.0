Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22FC6608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 09:19:49 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u4C9JiVm007951; Thu, 12 May 2016 04:19:45 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016051204055564-978338 ;
	Thu, 12 May 2016 04:05:55 -0500 
Date: Thu, 12 May 2016 12:05:43 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160512120543.1e064b3f@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/12/2016 04:05:56 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/12/2016 04:18:56 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-12_05:, , signatures=0
Cc: Marek Vasut <marex@denx.de>, Dan McGregor <dan.mcgregor@usask.ca>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/42] GCC/GDB/Binutils Upgrades
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
X-List-Received-Date: Thu, 12 May 2016 09:19:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

Can the gcc 6 fixes be pulled into the krogoth branch as well?

On Wed, 11 May 2016 10:35:25 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> This patchset covers gcc 6 upgrade along with gdb 7.11
> and glibc 2.24 ( upcoming ) release.
>=20
> Rest of upgrades are necessaciated by gcc-6 due to backports
> that were already in newer versions of packages
>=20
> It has been boot tested with core-image-minimal on all qemu
> machines
>=20
> The following changes since commit a5970809a2f01dbd152684266e2a3d946d8966=
20:
>=20
>   oeqa/lic-checksum: Update after recent LIC=5FFILES=5FCHKSUM changes (20=
16-05-11 10:33:16 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-6
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/gcc-6
>=20
> Dan McGregor (2):
>   pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
>   binutils: disable werror on native build
>=20
> Khem Raj (39):
>   gcc: Add gcc6 recipes
>   glibc: Add recipes for 2.24 release
>   glib-2.0: Ignore useless warning found with gcc-6
>   elfutils: Upgrade to 0.166
>   rpm: Fix build with gcc6
>   alsa-tools: Fix build with gcc6
>   lzop: Fix build with gcc-6
>   webkitgtk: Upgrade to 2.12.1
>   oprofile: Fix with gcc6
>   mdadm: Fix gcc 6 warnings
>   nss: Upgrade to 3.23
>   grub: Fix build with gcc-6
>   valgrind: Fix build with gcc6
>   busybox/mdev: Ensure /sys is mounted before using it
>   libc-common.bbclass: Use sed instead of grep
>   conf: bump minimum kernel to 3.2.0
>   systemd: Create missing sysusers offline
>   grub=5Fgit: Upgrade to latest tip
>   libunwind: Upgrade to 1.2rc1+
>   linux-yocto: Fix build on ppc with gcc-6
>   linux-yocto: Fix build with gcc6 on mips
>   python-native: Point to expat in native sysroot
>   bitbake.conf: Empty out BUILDSDK=5FCPPFLAGS
>   strace: Remove pipe.expected
>   musl: Upgrade to tip of tree
>   libgcc: Ensure that gcc configure options are passed to libgcc too
>   libunwind: Upgrade to 1.2rc1+
>   libgcc: Ensure that gcc configure options are passed to libgcc too
>   gdb,strace: Fix builds on ppc/musl
>   libunwind: Add a confgure option for tests
>   gdb: Upgrade to 7.11
>   gdb: Disable binutils components
>   tcmode-default: Bump gcc,glibc,gdb
>   musl: Create symlinks for stub libraries
>   mdadm: Fix build with clang
>   distcc: Upgrade to 3.2
>   ruby: Upgrade to 2.2.5
>   mpfr: Upgrade to 3.1.4
>   gcc-runtime,libgcc: Symlink c++ header and startup files in
>     target=5Ftriplet for SDK use
>=20
> Marek Vasut (1):
>   bitbake: Oldest kernel for nios2 is 3.19
>=20
>  meta/classes/cross-canadian.bbclass                |    1 +
>  meta/classes/libc-common.bbclass                   |    6 +-
>  meta/classes/populate=5Fsdk=5Fbase.bbclass             |    2 +-
>  meta/conf/bitbake.conf                             |    7 +-
>  meta/conf/distro/include/tcmode-default.inc        |    6 +-
>  ...ettext-gettext.c-main=5Fcontext-secondary=5Fc.patch |   39 +
>  meta/recipes-bsp/grub/grub2.inc                    |    1 +
>  meta/recipes-bsp/grub/grub=5Fgit.bb                  |    2 +-
>  meta/recipes-core/busybox/files/mdev               |    4 +-
>  .../0001-Do-not-ignore-return-value-of-write.patch |   42 +
>  .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |   42 +
>  .../ignore-format-nonliteral-warning.patch         |   39 +
>  meta/recipes-core/glib-2.0/glib-2.0=5F2.46.2.bb      |    7 +-
>  .../fix=5Ffor=5Fcentos=5F5.8.patch                       |   18 -
>  ...tive=5F2.23.bb =3D> cross-localedef-native=5F2.24.bb} |   26 +-
>  ...glibc-initial=5F2.23.bb =3D> glibc-initial=5F2.24.bb} |    0
>  .../{glibc-locale=5F2.23.bb =3D> glibc-locale=5F2.24.bb} |    0
>  .../{glibc-mtrace=5F2.23.bb =3D> glibc-mtrace=5F2.24.bb} |    0
>  ...glibc-scripts=5F2.23.bb =3D> glibc-scripts=5F2.24.bb} |    0
>  ...libc-Look-for-host-system-ld.so.cache-as-.patch |    8 +-
>  ...libc-Fix-buffer-overrun-with-a-relocated-.patch |    8 +-
>  ...libc-Raise-the-size-of-arrays-containing-.patch |   34 +-
>  ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |   10 +-
>  ...500-e5500-e6500-603e-fsqrt-implementation.patch |    6 +-
>  ...-OECORE=5FKNOWN=5FINTERPRETER=5FNAMES-to-known-.patch |    8 +-
>  ...-Fix-undefined-reference-to-=5F=5Fsqrt=5Ffinite.patch |    6 +-
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
>  ...bug-1443-which-explains-what-the-patch-do.patch |    8 +-
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   10 +-
>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
>  ...ersion-output-matching-grok-gold-s-output.patch |   14 +-
>  ...-configure.ac-handle-correctly-libc=5Fcv=5Fro.patch |    6 +-
>  .../glibc/glibc/0014-Add-unused-attribute.patch    |    8 +-
>  ...thin-the-path-sets-wrong-config-variables.patch |   10 +-
>  ...-timezone-re-written-tzselect-as-posix-sh.patch |   16 +-
>  ...move-bash-dependency-for-nscd-init-script.patch |    8 +-
>  ...c-Cross-building-and-testing-instructions.patch |    6 +-
>  ...019-eglibc-Help-bootstrap-cross-toolchain.patch |    8 +-
>  .../glibc/0020-eglibc-cherry-picked-from.patch     |   18 +-
>  .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  |   10 +-
>  ...0022-eglibc-Resolve-=5F=5Ffpscr=5Fvalues-on-SH4.patch |    8 +-
>  .../glibc/0023-eglibc-Install-PIC-archives.patch   |    8 +-
>  ...ard-port-cross-locale-generation-support.patch} |   30 +-
>  ...0025-Define-DUMMY=5FLOCALE=5FT-if-not-defined.patch |   32 +
>  ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch |   48 -
>  .../glibc/{glibc=5F2.23.bb =3D> glibc=5F2.24.bb}         |   12 +-
>  meta/recipes-core/musl/musl.inc                    |    2 +-
>  meta/recipes-core/musl/musl=5Fgit.bb                 |    6 +-
>  meta/recipes-core/systemd/systemd=5F229.bb           |    8 +-
>  meta/recipes-devtools/binutils/binutils=5F2.26.bb    |    3 +-
>  .../distcc/{distcc=5F3.1.bb =3D> distcc=5F3.2.bb}        |    8 +-
>  .../distcc/files/separatebuilddir.patch            |   14 +-
>  ...ferences-between-mips-machine-identifiers.patch |    0
>  ...de-alternatives-for-glibc-assumptions-hel.patch |  488 ++--
>  ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>  .../0001-fix-a-stack-usage-warning.patch           |    0
>  .../0001-remove-the-unneed-checking.patch          |    0
>  ...-support-for-mips64-abis-in-mips=5Fretval.c.patch |    0
>  .../0003-Add-mips-n64-relocation-format-hack.patch |    0
>  .../aarch64=5Fuio.patch                              |    0
>  .../arm=5Fbackend.diff                               |    0
>  .../elfcmp-fix-self-comparision.patch              |   41 +
>  .../fixheadercheck.patch                           |    0
>  .../hppa=5Fbackend.diff                              |    0
>  .../kfreebsd=5Fpath.patch                            |    0
>  .../m68k=5Fbackend.diff                              |    0
>  .../mips=5Fbackend.diff                              |    0
>  .../mips=5Freadelf=5Fw.patch                           |    0
>  .../shadow.patch                                   |    0
>  .../testsuite-ignore-elflint.diff                  |    0
>  .../uclibc-support.patch                           |   37 +-
>  .../{elfutils=5F0.164.bb =3D> elfutils=5F0.166.bb}       |    6 +-
>  ...-Symlink-c-header-in-target=5Ftriplet-for-S.patch |   49 +
>  meta/recipes-devtools/gcc/gcc-6.1.inc              |  131 +
>  .../0001-gcc-4.3.1-ARCH=5FFLAGS=5FFOR=5FTARGET.patch     |   42 +
>  .../gcc/gcc-6.1/0002-uclibc-conf.patch             |   53 +
>  .../0003-gcc-uclibc-locale-ctype=5Ftouplow=5Ft.patch   |   87 +
>  .../gcc/gcc-6.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++=
++++++
>  .../gcc/gcc-6.1/0005-uclibc-locale-no=5F=5Fx.patch     |  257 ++
>  .../gcc/gcc-6.1/0006-uclibc-locale-wchar=5Ffix.patch |   68 +
>  .../gcc/gcc-6.1/0007-uclibc-locale-update.patch    |  542 ++++
>  .../gcc/gcc-6.1/0008-missing-execinfo=5Fh.patch      |   28 +
>  .../gcc/gcc-6.1/0009-c99-snprintf.patch            |   28 +
>  .../0010-gcc-poison-system-directories.patch       |  192 ++
>  .../gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch   |   39 +
>  .../0012-gcc-4.3.3-SYSROOT=5FCFLAGS=5FFOR=5FTARGET.patch |   73 +
>  .../gcc/gcc-6.1/0013-64-bit-multilib-hack.patch    |   85 +
>  .../gcc/gcc-6.1/0014-optional-libstdc.patch        |  125 +
>  ...0015-gcc-disable-MASK=5FRELAX=5FPIC=5FCALLS-bit.patch |   59 +
>  .../gcc/gcc-6.1/0016-COLLECT=5FGCC=5FOPTIONS.patch     |   38 +
>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
>  .../gcc-6.1/0018-fortran-cross-compile-hack.patch  |   46 +
>  .../gcc/gcc-6.1/0019-cpp-honor-sysroot.patch       |   54 +
>  .../gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch   |   57 +
>  ...C=5FDYNAMIC=5FLINKER-and-UCLIBC=5FDYNAMIC=5FLINKE.patch |  234 ++
>  ...0022-gcc-Fix-argument-list-too-long-error.patch |   40 +
>  .../gcc/gcc-6.1/0023-Disable-sdt.patch             |  113 +
>  .../gcc/gcc-6.1/0024-libtool.patch                 |   42 +
>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
>  ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
>  ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
>  .../gcc/gcc-6.1/0028-export-CPP.patch              |   53 +
>  ...AltiVec-generation-on-powepc-linux-target.patch |   56 +
>  ...-MULTILIB=5FOSDIRNAMES-and-other-multilib-o.patch |   42 +
>  ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
>  ...-t-build-with-disable-dependency-tracking.patch |   54 +
>  ...h-host-directory-during-relink-if-inst=5Fpr.patch |   38 +
>  ...IBS=5FDIR-replacement-instead-of-hardcoding.patch |   29 +
>  .../0035-aarch64-Add-support-for-musl-ldso.patch   |   28 +
>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   54 +
>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |  213 ++
>  ...et-sysroot-gcc-version-specific-dirs-with.patch |  102 +
>  ...-various-=5FFOR=5FBUILD-and-related-variables.patch |  137 +
>  .../0040-nios2-Define-MUSL=5FDYNAMIC=5FLINKER.patch    |   28 +
>  .../gcc/gcc-6.1/0041-ssp=5Fnonshared.patch           |   28 +
>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |  292 ++
>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 +
>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |   54 +
>  ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  125 +
>  ...bgcc-using-LDFLAGS-not-just-SHLIB=5FLDFLAGS.patch |   29 +
>  meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
>  .../recipes-devtools/gcc/gcc-cross-canadian=5F6.1.bb |    5 +
>  meta/recipes-devtools/gcc/gcc-cross-initial=5F6.1.bb |    2 +
>  meta/recipes-devtools/gcc/gcc-cross=5F6.1.bb         |    3 +
>  .../gcc/gcc-crosssdk-initial=5F6.1.bb                |    3 +
>  meta/recipes-devtools/gcc/gcc-crosssdk=5F6.1.bb      |    2 +
>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   12 +
>  meta/recipes-devtools/gcc/gcc-runtime=5F6.1.bb       |    7 +
>  meta/recipes-devtools/gcc/gcc-sanitizers=5F6.1.bb    |    2 +
>  meta/recipes-devtools/gcc/gcc-source=5F6.1.bb        |    4 +
>  meta/recipes-devtools/gcc/gcc=5F6.1.bb               |   15 +
>  meta/recipes-devtools/gcc/libgcc-common.inc        |    9 +-
>  meta/recipes-devtools/gcc/libgcc-initial=5F6.1.bb    |    2 +
>  meta/recipes-devtools/gcc/libgcc.inc               |   12 +
>  meta/recipes-devtools/gcc/libgcc=5F6.1.bb            |    2 +
>  meta/recipes-devtools/gcc/libgfortran=5F6.1.bb       |    3 +
>  .../gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc}           |    0
>  meta/recipes-devtools/gdb/gdb-common.inc           |   25 +-
>  ...nadian=5F7.10.1.bb =3D> gdb-cross-canadian=5F7.11.bb} |    0
>  meta/recipes-devtools/gdb/gdb-cross=5F7.10.1.bb      |    4 -
>  meta/recipes-devtools/gdb/gdb-cross=5F7.11.bb        |    2 +
>  meta/recipes-devtools/gdb/gdb.inc                  |    8 -
>  .../gdb/0001-include-sys-types.h-for-mode=5Ft.patch  |   10 +-
>  ...002-make-man-install-relative-to-DESTDIR.patch} |    8 +-
>  ...-linux-nat-Define-=5FABIO32-if-not-defined.patch} |    8 +-
>  ...Define-pt=5Fregs-uapi=5Fpt=5Fregs-on-GLIBC-syst.patch |   53 +
>  ...-support-for-Renesas-SH-sh4-architecture.patch} |   32 +-
>  ...-libreadline.a-when-using-disable-static.patch} |   21 +-
>  ...gidefs.h.patch =3D> 0007-use-asm-sgidefs.h.patch} |   15 +-
>  ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} |   44 +-
>  ...AGS.patch =3D> 0009-Change-order-of-CFLAGS.patch} |   18 +-
>  .../0010-resolve-restrict-keyword-conflict.patch   |   48 +
>  .../gdb/{gdb=5F7.10.1.bb =3D> gdb=5F7.11.bb}             |    0
>  ...e-Move-warning-pragma-outside-of-function.patch |   39 +
>  meta/recipes-devtools/pkgconfig/pkgconfig=5Fgit.bb   |    1 +
>  .../python/python-native=5F2.7.11.bb                 |    2 +-
>  meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |   54 +
>  meta/recipes-devtools/rpm/rpm=5F5.4.16.bb            |    3 +-
>  .../ruby/{ruby=5F2.2.2.bb =3D> ruby=5F2.2.5.bb}          |    8 +-
>  ...hen-using-non-glibc-libc-implementation-o.patch |   36 +
>  meta/recipes-devtools/strace/strace=5F4.11.bb        |    4 +-
>  .../valgrind/valgrind/gcc5-port.patch              |   64 +
>  meta/recipes-devtools/valgrind/valgrind=5F3.11.0.bb  |    1 +
>  ...dadm.h-Undefine-dprintf-before-redefining.patch |   43 +
>  .../0001-raid6check-Fix-if-else-indentation.patch  |   37 +
>  meta/recipes-extended/mdadm/mdadm=5F3.4.bb           |    4 +-
>  ...ace-Fix-out-of-bounds-array-access-warnin.patch |   50 +
>  ...oration-of-MSA-context-in-non-MSA-kernels.patch |   76 +
>  meta/recipes-kernel/linux/linux-yocto=5F4.4.bb       |    5 +-
>  meta/recipes-kernel/oprofile/oprofile.inc          |    4 +-
>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |   51 +
>  ...idi-Explicitly-cast-constant-to-char-type.patch |   75 +
>  meta/recipes-multimedia/alsa/alsa-tools=5F1.1.0.bb   |    6 +-
>  ...cmake-drop-the-hardcoded-introspection-gt.patch |   19 +-
>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch |  223 ++
>  ...ng-introspection-files-add-CMAKE=5FC=5FFLAGS-.patch |   19 +-
>  meta/recipes-sato/webkit/files/musl-fixes.patch    |   48 +
>  ...nable-backtrace-on-linux-when-using-glibc.patch |   39 -
>  ...x-build-with-non-glibc-libraries-on-linux.patch |   61 -
>  meta/recipes-sato/webkit/webkitgtk/clang.patch     |   25 -
>  .../{webkitgtk=5F2.10.7.bb =3D> webkitgtk=5F2.12.1.bb}   |   12 +-
>  ...rf-opcodes-can-cause-references-beyond-th.patch |   29 -
>  ...roduce-build-support-for-aarch64=5Fbe-targe.patch |   33 -
>  .../libunwind-1.1/0001-disable-tests.patch         |   31 -
>  ...-wrong-big=5Fendian-flag-in-aarch64=5Fbe-case.patch |   34 -
>  .../libunwind/libunwind-1.1/AArch64-port.patch     | 2529 --------------=
---
>  ...k-failure-on-PowerPC-systems-with-Altivec.patch |   28 -
>  ...-libunwind-to-libgcc=5Fs-rather-than-libgcc.patch |   42 -
>  .../Support-building-with-older-compilers.patch    |   72 -
>  .../0001-Fix-build-on-mips-musl.patch              |   33 +-
>  .../0001-add-knobs-to-disable-enable-tests.patch   |   69 +
>  ...-backtrace-Use-only-with-glibc-and-uclibc.patch |    0
>  .../0001-x86-Stub-out-x86=5Flocal=5Fresume.patch       |    0
>  ...Add-AO=5FREQUIRE=5FCAS-to-fix-build-on-ARM-v6.patch |    0
>  meta/recipes-support/libunwind/libunwind=5F1.1.bb    |   24 -
>  meta/recipes-support/libunwind/libunwind=5Fgit.bb    |   26 +
>  .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch |   37 +
>  meta/recipes-support/lzop/lzop=5F1.03.bb             |    6 +-
>  .../{mpfr-3.1.3 =3D> mpfr}/long-long-thumb.patch     |    0
>  .../mpfr/{mpfr=5F3.1.3.bb =3D> mpfr=5F3.1.4.bb}          |    5 +-
>  .../nss/{nss=5F3.21.bb =3D> nss=5F3.23.bb}               |    8 +-
>  201 files changed, 9095 insertions(+), 3627 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-ge=
ttext.c-main=5Fcontext-secondary=5Fc.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignor=
e-return-value-of-write.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore=
-y2k-warnings.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-non=
literal-warning.patch
>  delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix=5F=
for=5Fcentos=5F5.8.patch
>  rename meta/recipes-core/glibc/{cross-localedef-native=5F2.23.bb =3D> cr=
oss-localedef-native=5F2.24.bb} (79%)
>  rename meta/recipes-core/glibc/{glibc-initial=5F2.23.bb =3D> glibc-initi=
al=5F2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-locale=5F2.23.bb =3D> glibc-locale=
=5F2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-mtrace=5F2.23.bb =3D> glibc-mtrace=
=5F2.24.bb} (100%)
>  rename meta/recipes-core/glibc/{glibc-scripts=5F2.23.bb =3D> glibc-scrip=
ts=5F2.24.bb} (100%)
>  rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-loc=
ale-generation-support.patch =3D> 0024-eglibc-Forward-port-cross-locale-gen=
eration-support.patch} (97%)
>  create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY=5FLOC=
ALE=5FT-if-not-defined.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE=
-make-sure-fpmath-is-not-set-to-us.patch
>  rename meta/recipes-core/glibc/{glibc=5F2.23.bb =3D> glibc=5F2.24.bb} (9=
3%)
>  rename meta/recipes-devtools/distcc/{distcc=5F3.1.bb =3D> distcc=5F3.2.b=
b} (91%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (71%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0001-elf=5Fgetarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0001-fix-a-stack-usage-warning.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0001-remove-the-unneed-checking.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0002-Add-support-for-mips64-abis-in-mips=5Fretval.c.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/0003-Add-mips-n64-relocation-format-hack.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/aarch64=5Fuio.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/arm=5Fbackend.diff (100%)
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-=
fix-self-comparision.patch
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/fixheadercheck.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/hppa=5Fbackend.diff (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/kfreebsd=5Fpath.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/m68k=5Fbackend.diff (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/mips=5Fbackend.diff (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/mips=5Freadelf=5Fw.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/shadow.patch (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/testsuite-ignore-elflint.diff (100%)
>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0.16=
6}/uclibc-support.patch (82%)
>  rename meta/recipes-devtools/elfutils/{elfutils=5F0.164.bb =3D> elfutils=
=5F0.166.bb} (94%)
>  create mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-=
header-in-target=5Ftriplet-for-S.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1.inc
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH=
=5FFLAGS=5FFOR=5FTARGET.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.pa=
tch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-loc=
ale-ctype=5Ftouplow=5Ft.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.=
patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-=
no=5F=5Fx.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-=
wchar=5Ffix.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-=
update.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execin=
fo=5Fh.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.p=
atch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-sys=
tem-directories.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir=
-extend.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSR=
OOT=5FCFLAGS=5FFOR=5FTARGET.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multili=
b-hack.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libst=
dc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MA=
SK=5FRELAX=5FPIC=5FCALLS-bit.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT=5FGCC=
=5FOPTIONS.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaul=
ts.h-in-B-instead-of-S-and-t-oe-in-B.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-=
compile-hack.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysr=
oot.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default=
-to-N64-ABI.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC=
=5FDYNAMIC=5FLINKER-and-UCLIBC=5FDYNAMIC=5FLINKE.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argume=
nt-list-too-long-error.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.pa=
tch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass=
-fix-v4bx-to-linker-to-support-EABI.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multil=
ib-config-files-from-B-instead-of-usin.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-li=
bdir-from-.la-which-usually-points-to-.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.pat=
ch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-Alt=
iVec-generation-on-powepc-linux-target.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MU=
LTILIB=5FOSDIRNAMES-and-other-multilib-o.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-=
gcc-headers-can-be-included.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-=
build-with-disable-dependency-tracking.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-h=
ost-directory-during-relink-if-inst=5Fpr.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS=
=5FDIR-replacement-instead-of-hardcoding.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-su=
pport-for-musl-ldso.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-lib=
cc1-s-install-path-and-rpath.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot=
-support-for-nativesdk-gcc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-=
sysroot-gcc-version-specific-dirs-with.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-=
=5FFOR=5FBUILD-and-related-variables.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-M=
USL=5FDYNAMIC=5FLINKER.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0041-ssp=5Fnonshare=
d.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-sup=
port-ffile-prefix-map-old-new.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-p=
refix-map-to-replace-ffile-prefix-map.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fd=
ebug-prefix-map-support-to-remap-sourc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-kno=
b-to-use-ldbl-128-on-ppc.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-us=
ing-LDFLAGS-not-just-SHLIB=5FLDFLAGS.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial=5F6.1.=
bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc-source=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/gcc=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgcc=5F6.1.bb
>  create mode 100644 meta/recipes-devtools/gcc/libgfortran=5F6.1.bb
>  rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc} (100=
%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian=5F7.10.1.bb =3D> gd=
b-cross-canadian=5F7.11.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb-cross=5F7.10.1.bb
>  create mode 100644 meta/recipes-devtools/gdb/gdb-cross=5F7.11.bb
>  rename meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-to-=
DESTDIR.patch =3D> 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
>  rename meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-=5FABIO=
32-if-not-defined.patch =3D> 0003-mips-linux-nat-Define-=5FABIO32-if-not-de=
fined.patch} (84%)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-=
pt=5Fregs-uapi=5Fpt=5Fregs-on-GLIBC-syst.patch
>  rename meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH-sh=
4-architecture.patch =3D> 0005-Add-support-for-Renesas-SH-sh4-architecture.=
patch} (97%)
>  rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch =3D> 0=
006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
>  rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch =3D> =
0007-use-asm-sgidefs.h.patch} (69%)
>  rename meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-of-S=
IGRTMIN.patch =3D> 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
>  rename meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.patch =
=3D> 0009-Change-order-of-CFLAGS.patch} (69%)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-k=
eyword-conflict.patch
>  rename meta/recipes-devtools/gdb/{gdb=5F7.10.1.bb =3D> gdb=5F7.11.bb} (1=
00%)
>  create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-=
Move-warning-pragma-outside-of-function.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
>  rename meta/recipes-devtools/ruby/{ruby=5F2.2.2.bb =3D> ruby=5F2.2.5.bb}=
 (86%)
>  create mode 100644 meta/recipes-devtools/strace/strace/0001-Fix-build-wh=
en-using-non-glibc-libc-implementation-o.patch
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.pat=
ch
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefi=
ne-dprintf-before-redefining.patch
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix=
-if-else-indentation.patch
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-powerpc-pt=
race-Fix-out-of-bounds-array-access-warnin.patch
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent=
-restoration-of-MSA-context-in-non-MSA-kernels.patch
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-=
problem-with-GCC-6.patch
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Mi=
di-Explicitly-cast-constant-to-char-type.patch
>  create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Appe=
nd-to-I-and-not-to-isystem.patch
>  create mode 100644 meta/recipes-sato/webkit/files/musl-fixes.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtr=
ace-on-linux-when-using-glibc.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-wit=
h-non-glibc-libraries-on-linux.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
>  rename meta/recipes-sato/webkit/{webkitgtk=5F2.10.7.bb =3D> webkitgtk=5F=
2.12.1.bb} (92%)
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-Inv=
alid-dwarf-opcodes-can-cause-references-beyond-th.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-aar=
ch64-introduce-build-support-for-aarch64=5Fbe-targe.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-dis=
able-tests.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-aar=
ch64-fix-wrong-big=5Fendian-flag-in-aarch64=5Fbe-case.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/AArch64-=
port.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test=
-case-link-failure-on-PowerPC-systems-with-Altivec.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-lib=
unwind-to-libgcc=5Fs-rather-than-libgcc.patch
>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Support-=
building-with-older-compilers.patch
>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/000=
1-Fix-build-on-mips-musl.patch (68%)
>  create mode 100644 meta/recipes-support/libunwind/libunwind/0001-add-kno=
bs-to-disable-enable-tests.patch
>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/000=
1-backtrace-Use-only-with-glibc-and-uclibc.patch (100%)
>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/000=
1-x86-Stub-out-x86=5Flocal=5Fresume.patch (100%)
>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/Add=
-AO=5FREQUIRE=5FCAS-to-fix-build-on-ARM-v6.patch (100%)
>  delete mode 100644 meta/recipes-support/libunwind/libunwind=5F1.1.bb
>  create mode 100644 meta/recipes-support/libunwind/libunwind=5Fgit.bb
>  create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
>  rename meta/recipes-support/mpfr/{mpfr-3.1.3 =3D> mpfr}/long-long-thumb.=
patch (100%)
>  rename meta/recipes-support/mpfr/{mpfr=5F3.1.3.bb =3D> mpfr=5F3.1.4.bb} =
(75%)
>  rename meta/recipes-support/nss/{nss=5F3.21.bb =3D> nss=5F3.23.bb} (97%)
>=20


