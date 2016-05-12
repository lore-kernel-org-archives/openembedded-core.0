Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E838860249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:39:03 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u4CEctVR005032; Thu, 12 May 2016 09:38:56 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016051209334826-983815 ;
	Thu, 12 May 2016 09:33:48 -0500 
Date: Thu, 12 May 2016 17:33:58 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160512173358.32b89285@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <57349106.7090408@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<20160512120543.1e064b3f@adi-pc-linux.emea.corp.natinst.com>
	<57349106.7090408@gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/12/2016 09:33:48 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/12/2016 09:38:07 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-12_07:, , signatures=0
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org,
	Dan McGregor <dan.mcgregor@usask.ca>
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
X-List-Received-Date: Thu, 12 May 2016 14:39:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2016 07:19:50 -0700
akuster808 <akuster808@gmail.com> wrote:

> On 05/12/2016 02:05 AM, Ioan-Adrian Ratiu wrote:
> > Hello
> >=20
> > Can the gcc 6 fixes be pulled into the krogoth branch as well? =20
>=20
> GCC 6 is new so we wont be pull that over to Krogoth. Any fixes you are
> interested in, patches are welcome.

I'm not talking about putting gcc 6 inside the krogoth branches, I'm
talking about using gcc 6 on the native system which builds the krogoth
branches, specifically about the patches which fix the -native packages
which are compiled using the native gcc 6.

Khem's patches for master apply cleanly and fix the -native build errors,
I'll pick and resend them for Krogoth if you want, but they are identical.

Ionel

>=20
> - armin
>=20
> >=20
> > On Wed, 11 May 2016 10:35:25 -0700
> > Khem Raj <raj.khem@gmail.com> wrote:
> >  =20
> >> This patchset covers gcc 6 upgrade along with gdb 7.11
> >> and glibc 2.24 ( upcoming ) release.
> >>
> >> Rest of upgrades are necessaciated by gcc-6 due to backports
> >> that were already in newer versions of packages
> >>
> >> It has been boot tested with core-image-minimal on all qemu
> >> machines
> >>
> >> The following changes since commit a5970809a2f01dbd152684266e2a3d946d8=
96620:
> >>
> >>   oeqa/lic-checksum: Update after recent LIC=5FFILES=5FCHKSUM changes =
(2016-05-11 10:33:16 +0100)
> >>
> >> are available in the git repository at:
> >>
> >>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-6
> >>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Dkraj/gcc-6
> >>
> >> Dan McGregor (2):
> >>   pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
> >>   binutils: disable werror on native build
> >>
> >> Khem Raj (39):
> >>   gcc: Add gcc6 recipes
> >>   glibc: Add recipes for 2.24 release
> >>   glib-2.0: Ignore useless warning found with gcc-6
> >>   elfutils: Upgrade to 0.166
> >>   rpm: Fix build with gcc6
> >>   alsa-tools: Fix build with gcc6
> >>   lzop: Fix build with gcc-6
> >>   webkitgtk: Upgrade to 2.12.1
> >>   oprofile: Fix with gcc6
> >>   mdadm: Fix gcc 6 warnings
> >>   nss: Upgrade to 3.23
> >>   grub: Fix build with gcc-6
> >>   valgrind: Fix build with gcc6
> >>   busybox/mdev: Ensure /sys is mounted before using it
> >>   libc-common.bbclass: Use sed instead of grep
> >>   conf: bump minimum kernel to 3.2.0
> >>   systemd: Create missing sysusers offline
> >>   grub=5Fgit: Upgrade to latest tip
> >>   libunwind: Upgrade to 1.2rc1+
> >>   linux-yocto: Fix build on ppc with gcc-6
> >>   linux-yocto: Fix build with gcc6 on mips
> >>   python-native: Point to expat in native sysroot
> >>   bitbake.conf: Empty out BUILDSDK=5FCPPFLAGS
> >>   strace: Remove pipe.expected
> >>   musl: Upgrade to tip of tree
> >>   libgcc: Ensure that gcc configure options are passed to libgcc too
> >>   libunwind: Upgrade to 1.2rc1+
> >>   libgcc: Ensure that gcc configure options are passed to libgcc too
> >>   gdb,strace: Fix builds on ppc/musl
> >>   libunwind: Add a confgure option for tests
> >>   gdb: Upgrade to 7.11
> >>   gdb: Disable binutils components
> >>   tcmode-default: Bump gcc,glibc,gdb
> >>   musl: Create symlinks for stub libraries
> >>   mdadm: Fix build with clang
> >>   distcc: Upgrade to 3.2
> >>   ruby: Upgrade to 2.2.5
> >>   mpfr: Upgrade to 3.1.4
> >>   gcc-runtime,libgcc: Symlink c++ header and startup files in
> >>     target=5Ftriplet for SDK use
> >>
> >> Marek Vasut (1):
> >>   bitbake: Oldest kernel for nios2 is 3.19
> >>
> >>  meta/classes/cross-canadian.bbclass                |    1 +
> >>  meta/classes/libc-common.bbclass                   |    6 +-
> >>  meta/classes/populate=5Fsdk=5Fbase.bbclass             |    2 +-
> >>  meta/conf/bitbake.conf                             |    7 +-
> >>  meta/conf/distro/include/tcmode-default.inc        |    6 +-
> >>  ...ettext-gettext.c-main=5Fcontext-secondary=5Fc.patch |   39 +
> >>  meta/recipes-bsp/grub/grub2.inc                    |    1 +
> >>  meta/recipes-bsp/grub/grub=5Fgit.bb                  |    2 +-
> >>  meta/recipes-core/busybox/files/mdev               |    4 +-
> >>  .../0001-Do-not-ignore-return-value-of-write.patch |   42 +
> >>  .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |   42 +
> >>  .../ignore-format-nonliteral-warning.patch         |   39 +
> >>  meta/recipes-core/glib-2.0/glib-2.0=5F2.46.2.bb      |    7 +-
> >>  .../fix=5Ffor=5Fcentos=5F5.8.patch                       |   18 -
> >>  ...tive=5F2.23.bb =3D> cross-localedef-native=5F2.24.bb} |   26 +-
> >>  ...glibc-initial=5F2.23.bb =3D> glibc-initial=5F2.24.bb} |    0
> >>  .../{glibc-locale=5F2.23.bb =3D> glibc-locale=5F2.24.bb} |    0
> >>  .../{glibc-mtrace=5F2.23.bb =3D> glibc-mtrace=5F2.24.bb} |    0
> >>  ...glibc-scripts=5F2.23.bb =3D> glibc-scripts=5F2.24.bb} |    0
> >>  ...libc-Look-for-host-system-ld.so.cache-as-.patch |    8 +-
> >>  ...libc-Fix-buffer-overrun-with-a-relocated-.patch |    8 +-
> >>  ...libc-Raise-the-size-of-arrays-containing-.patch |   34 +-
> >>  ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |   10 +-
> >>  ...500-e5500-e6500-603e-fsqrt-implementation.patch |    6 +-
> >>  ...-OECORE=5FKNOWN=5FINTERPRETER=5FNAMES-to-known-.patch |    8 +-
> >>  ...-Fix-undefined-reference-to-=5F=5Fsqrt=5Ffinite.patch |    6 +-
> >>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
> >>  ...bug-1443-which-explains-what-the-patch-do.patch |    8 +-
> >>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   10 +-
> >>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
> >>  ...ersion-output-matching-grok-gold-s-output.patch |   14 +-
> >>  ...-configure.ac-handle-correctly-libc=5Fcv=5Fro.patch |    6 +-
> >>  .../glibc/glibc/0014-Add-unused-attribute.patch    |    8 +-
> >>  ...thin-the-path-sets-wrong-config-variables.patch |   10 +-
> >>  ...-timezone-re-written-tzselect-as-posix-sh.patch |   16 +-
> >>  ...move-bash-dependency-for-nscd-init-script.patch |    8 +-
> >>  ...c-Cross-building-and-testing-instructions.patch |    6 +-
> >>  ...019-eglibc-Help-bootstrap-cross-toolchain.patch |    8 +-
> >>  .../glibc/0020-eglibc-cherry-picked-from.patch     |   18 +-
> >>  .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  |   10 +-
> >>  ...0022-eglibc-Resolve-=5F=5Ffpscr=5Fvalues-on-SH4.patch |    8 +-
> >>  .../glibc/0023-eglibc-Install-PIC-archives.patch   |    8 +-
> >>  ...ard-port-cross-locale-generation-support.patch} |   30 +-
> >>  ...0025-Define-DUMMY=5FLOCALE=5FT-if-not-defined.patch |   32 +
> >>  ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch |   48 -
> >>  .../glibc/{glibc=5F2.23.bb =3D> glibc=5F2.24.bb}         |   12 +-
> >>  meta/recipes-core/musl/musl.inc                    |    2 +-
> >>  meta/recipes-core/musl/musl=5Fgit.bb                 |    6 +-
> >>  meta/recipes-core/systemd/systemd=5F229.bb           |    8 +-
> >>  meta/recipes-devtools/binutils/binutils=5F2.26.bb    |    3 +-
> >>  .../distcc/{distcc=5F3.1.bb =3D> distcc=5F3.2.bb}        |    8 +-
> >>  .../distcc/files/separatebuilddir.patch            |   14 +-
> >>  ...ferences-between-mips-machine-identifiers.patch |    0
> >>  ...de-alternatives-for-glibc-assumptions-hel.patch |  488 ++--
> >>  ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
> >>  .../0001-fix-a-stack-usage-warning.patch           |    0
> >>  .../0001-remove-the-unneed-checking.patch          |    0
> >>  ...-support-for-mips64-abis-in-mips=5Fretval.c.patch |    0
> >>  .../0003-Add-mips-n64-relocation-format-hack.patch |    0
> >>  .../aarch64=5Fuio.patch                              |    0
> >>  .../arm=5Fbackend.diff                               |    0
> >>  .../elfcmp-fix-self-comparision.patch              |   41 +
> >>  .../fixheadercheck.patch                           |    0
> >>  .../hppa=5Fbackend.diff                              |    0
> >>  .../kfreebsd=5Fpath.patch                            |    0
> >>  .../m68k=5Fbackend.diff                              |    0
> >>  .../mips=5Fbackend.diff                              |    0
> >>  .../mips=5Freadelf=5Fw.patch                           |    0
> >>  .../shadow.patch                                   |    0
> >>  .../testsuite-ignore-elflint.diff                  |    0
> >>  .../uclibc-support.patch                           |   37 +-
> >>  .../{elfutils=5F0.164.bb =3D> elfutils=5F0.166.bb}       |    6 +-
> >>  ...-Symlink-c-header-in-target=5Ftriplet-for-S.patch |   49 +
> >>  meta/recipes-devtools/gcc/gcc-6.1.inc              |  131 +
> >>  .../0001-gcc-4.3.1-ARCH=5FFLAGS=5FFOR=5FTARGET.patch     |   42 +
> >>  .../gcc/gcc-6.1/0002-uclibc-conf.patch             |   53 +
> >>  .../0003-gcc-uclibc-locale-ctype=5Ftouplow=5Ft.patch   |   87 +
> >>  .../gcc/gcc-6.1/0004-uclibc-locale.patch           | 2862 +++++++++++=
+++++++++
> >>  .../gcc/gcc-6.1/0005-uclibc-locale-no=5F=5Fx.patch     |  257 ++
> >>  .../gcc/gcc-6.1/0006-uclibc-locale-wchar=5Ffix.patch |   68 +
> >>  .../gcc/gcc-6.1/0007-uclibc-locale-update.patch    |  542 ++++
> >>  .../gcc/gcc-6.1/0008-missing-execinfo=5Fh.patch      |   28 +
> >>  .../gcc/gcc-6.1/0009-c99-snprintf.patch            |   28 +
> >>  .../0010-gcc-poison-system-directories.patch       |  192 ++
> >>  .../gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch   |   39 +
> >>  .../0012-gcc-4.3.3-SYSROOT=5FCFLAGS=5FFOR=5FTARGET.patch |   73 +
> >>  .../gcc/gcc-6.1/0013-64-bit-multilib-hack.patch    |   85 +
> >>  .../gcc/gcc-6.1/0014-optional-libstdc.patch        |  125 +
> >>  ...0015-gcc-disable-MASK=5FRELAX=5FPIC=5FCALLS-bit.patch |   59 +
> >>  .../gcc/gcc-6.1/0016-COLLECT=5FGCC=5FOPTIONS.patch     |   38 +
> >>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
> >>  .../gcc-6.1/0018-fortran-cross-compile-hack.patch  |   46 +
> >>  .../gcc/gcc-6.1/0019-cpp-honor-sysroot.patch       |   54 +
> >>  .../gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch   |   57 +
> >>  ...C=5FDYNAMIC=5FLINKER-and-UCLIBC=5FDYNAMIC=5FLINKE.patch |  234 ++
> >>  ...0022-gcc-Fix-argument-list-too-long-error.patch |   40 +
> >>  .../gcc/gcc-6.1/0023-Disable-sdt.patch             |  113 +
> >>  .../gcc/gcc-6.1/0024-libtool.patch                 |   42 +
> >>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
> >>  ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
> >>  ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
> >>  .../gcc/gcc-6.1/0028-export-CPP.patch              |   53 +
> >>  ...AltiVec-generation-on-powepc-linux-target.patch |   56 +
> >>  ...-MULTILIB=5FOSDIRNAMES-and-other-multilib-o.patch |   42 +
> >>  ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
> >>  ...-t-build-with-disable-dependency-tracking.patch |   54 +
> >>  ...h-host-directory-during-relink-if-inst=5Fpr.patch |   38 +
> >>  ...IBS=5FDIR-replacement-instead-of-hardcoding.patch |   29 +
> >>  .../0035-aarch64-Add-support-for-musl-ldso.patch   |   28 +
> >>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   54 +
> >>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |  213 ++
> >>  ...et-sysroot-gcc-version-specific-dirs-with.patch |  102 +
> >>  ...-various-=5FFOR=5FBUILD-and-related-variables.patch |  137 +
> >>  .../0040-nios2-Define-MUSL=5FDYNAMIC=5FLINKER.patch    |   28 +
> >>  .../gcc/gcc-6.1/0041-ssp=5Fnonshared.patch           |   28 +
> >>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |  292 ++
> >>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 +
> >>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |   54 +
> >>  ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  125 +
> >>  ...bgcc-using-LDFLAGS-not-just-SHLIB=5FLDFLAGS.patch |   29 +
> >>  meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
> >>  .../recipes-devtools/gcc/gcc-cross-canadian=5F6.1.bb |    5 +
> >>  meta/recipes-devtools/gcc/gcc-cross-initial=5F6.1.bb |    2 +
> >>  meta/recipes-devtools/gcc/gcc-cross=5F6.1.bb         |    3 +
> >>  .../gcc/gcc-crosssdk-initial=5F6.1.bb                |    3 +
> >>  meta/recipes-devtools/gcc/gcc-crosssdk=5F6.1.bb      |    2 +
> >>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   12 +
> >>  meta/recipes-devtools/gcc/gcc-runtime=5F6.1.bb       |    7 +
> >>  meta/recipes-devtools/gcc/gcc-sanitizers=5F6.1.bb    |    2 +
> >>  meta/recipes-devtools/gcc/gcc-source=5F6.1.bb        |    4 +
> >>  meta/recipes-devtools/gcc/gcc=5F6.1.bb               |   15 +
> >>  meta/recipes-devtools/gcc/libgcc-common.inc        |    9 +-
> >>  meta/recipes-devtools/gcc/libgcc-initial=5F6.1.bb    |    2 +
> >>  meta/recipes-devtools/gcc/libgcc.inc               |   12 +
> >>  meta/recipes-devtools/gcc/libgcc=5F6.1.bb            |    2 +
> >>  meta/recipes-devtools/gcc/libgfortran=5F6.1.bb       |    3 +
> >>  .../gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc}           |    0
> >>  meta/recipes-devtools/gdb/gdb-common.inc           |   25 +-
> >>  ...nadian=5F7.10.1.bb =3D> gdb-cross-canadian=5F7.11.bb} |    0
> >>  meta/recipes-devtools/gdb/gdb-cross=5F7.10.1.bb      |    4 -
> >>  meta/recipes-devtools/gdb/gdb-cross=5F7.11.bb        |    2 +
> >>  meta/recipes-devtools/gdb/gdb.inc                  |    8 -
> >>  .../gdb/0001-include-sys-types.h-for-mode=5Ft.patch  |   10 +-
> >>  ...002-make-man-install-relative-to-DESTDIR.patch} |    8 +-
> >>  ...-linux-nat-Define-=5FABIO32-if-not-defined.patch} |    8 +-
> >>  ...Define-pt=5Fregs-uapi=5Fpt=5Fregs-on-GLIBC-syst.patch |   53 +
> >>  ...-support-for-Renesas-SH-sh4-architecture.patch} |   32 +-
> >>  ...-libreadline.a-when-using-disable-static.patch} |   21 +-
> >>  ...gidefs.h.patch =3D> 0007-use-asm-sgidefs.h.patch} |   15 +-
> >>  ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} |   44 +-
> >>  ...AGS.patch =3D> 0009-Change-order-of-CFLAGS.patch} |   18 +-
> >>  .../0010-resolve-restrict-keyword-conflict.patch   |   48 +
> >>  .../gdb/{gdb=5F7.10.1.bb =3D> gdb=5F7.11.bb}             |    0
> >>  ...e-Move-warning-pragma-outside-of-function.patch |   39 +
> >>  meta/recipes-devtools/pkgconfig/pkgconfig=5Fgit.bb   |    1 +
> >>  .../python/python-native=5F2.7.11.bb                 |    2 +-
> >>  meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |   54 +
> >>  meta/recipes-devtools/rpm/rpm=5F5.4.16.bb            |    3 +-
> >>  .../ruby/{ruby=5F2.2.2.bb =3D> ruby=5F2.2.5.bb}          |    8 +-
> >>  ...hen-using-non-glibc-libc-implementation-o.patch |   36 +
> >>  meta/recipes-devtools/strace/strace=5F4.11.bb        |    4 +-
> >>  .../valgrind/valgrind/gcc5-port.patch              |   64 +
> >>  meta/recipes-devtools/valgrind/valgrind=5F3.11.0.bb  |    1 +
> >>  ...dadm.h-Undefine-dprintf-before-redefining.patch |   43 +
> >>  .../0001-raid6check-Fix-if-else-indentation.patch  |   37 +
> >>  meta/recipes-extended/mdadm/mdadm=5F3.4.bb           |    4 +-
> >>  ...ace-Fix-out-of-bounds-array-access-warnin.patch |   50 +
> >>  ...oration-of-MSA-context-in-non-MSA-kernels.patch |   76 +
> >>  meta/recipes-kernel/linux/linux-yocto=5F4.4.bb       |    5 +-
> >>  meta/recipes-kernel/oprofile/oprofile.inc          |    4 +-
> >>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |   51 +
> >>  ...idi-Explicitly-cast-constant-to-char-type.patch |   75 +
> >>  meta/recipes-multimedia/alsa/alsa-tools=5F1.1.0.bb   |    6 +-
> >>  ...cmake-drop-the-hardcoded-introspection-gt.patch |   19 +-
> >>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch |  223 ++
> >>  ...ng-introspection-files-add-CMAKE=5FC=5FFLAGS-.patch |   19 +-
> >>  meta/recipes-sato/webkit/files/musl-fixes.patch    |   48 +
> >>  ...nable-backtrace-on-linux-when-using-glibc.patch |   39 -
> >>  ...x-build-with-non-glibc-libraries-on-linux.patch |   61 -
> >>  meta/recipes-sato/webkit/webkitgtk/clang.patch     |   25 -
> >>  .../{webkitgtk=5F2.10.7.bb =3D> webkitgtk=5F2.12.1.bb}   |   12 +-
> >>  ...rf-opcodes-can-cause-references-beyond-th.patch |   29 -
> >>  ...roduce-build-support-for-aarch64=5Fbe-targe.patch |   33 -
> >>  .../libunwind-1.1/0001-disable-tests.patch         |   31 -
> >>  ...-wrong-big=5Fendian-flag-in-aarch64=5Fbe-case.patch |   34 -
> >>  .../libunwind/libunwind-1.1/AArch64-port.patch     | 2529 -----------=
------
> >>  ...k-failure-on-PowerPC-systems-with-Altivec.patch |   28 -
> >>  ...-libunwind-to-libgcc=5Fs-rather-than-libgcc.patch |   42 -
> >>  .../Support-building-with-older-compilers.patch    |   72 -
> >>  .../0001-Fix-build-on-mips-musl.patch              |   33 +-
> >>  .../0001-add-knobs-to-disable-enable-tests.patch   |   69 +
> >>  ...-backtrace-Use-only-with-glibc-and-uclibc.patch |    0
> >>  .../0001-x86-Stub-out-x86=5Flocal=5Fresume.patch       |    0
> >>  ...Add-AO=5FREQUIRE=5FCAS-to-fix-build-on-ARM-v6.patch |    0
> >>  meta/recipes-support/libunwind/libunwind=5F1.1.bb    |   24 -
> >>  meta/recipes-support/libunwind/libunwind=5Fgit.bb    |   26 +
> >>  .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch |   37 +
> >>  meta/recipes-support/lzop/lzop=5F1.03.bb             |    6 +-
> >>  .../{mpfr-3.1.3 =3D> mpfr}/long-long-thumb.patch     |    0
> >>  .../mpfr/{mpfr=5F3.1.3.bb =3D> mpfr=5F3.1.4.bb}          |    5 +-
> >>  .../nss/{nss=5F3.21.bb =3D> nss=5F3.23.bb}               |    8 +-
> >>  201 files changed, 9095 insertions(+), 3627 deletions(-)
> >>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext=
-gettext.c-main=5Fcontext-secondary=5Fc.patch
> >>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ig=
nore-return-value-of-write.patch
> >>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ign=
ore-y2k-warnings.patch
> >>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-=
nonliteral-warning.patch
> >>  delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix=
=5Ffor=5Fcentos=5F5.8.patch
> >>  rename meta/recipes-core/glibc/{cross-localedef-native=5F2.23.bb =3D>=
 cross-localedef-native=5F2.24.bb} (79%)
> >>  rename meta/recipes-core/glibc/{glibc-initial=5F2.23.bb =3D> glibc-in=
itial=5F2.24.bb} (100%)
> >>  rename meta/recipes-core/glibc/{glibc-locale=5F2.23.bb =3D> glibc-loc=
ale=5F2.24.bb} (100%)
> >>  rename meta/recipes-core/glibc/{glibc-mtrace=5F2.23.bb =3D> glibc-mtr=
ace=5F2.24.bb} (100%)
> >>  rename meta/recipes-core/glibc/{glibc-scripts=5F2.23.bb =3D> glibc-sc=
ripts=5F2.24.bb} (100%)
> >>  rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-=
locale-generation-support.patch =3D> 0024-eglibc-Forward-port-cross-locale-=
generation-support.patch} (97%)
> >>  create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY=5F=
LOCALE=5FT-if-not-defined.patch
> >>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-=
SSE-make-sure-fpmath-is-not-set-to-us.patch
> >>  rename meta/recipes-core/glibc/{glibc=5F2.23.bb =3D> glibc=5F2.24.bb}=
 (93%)
> >>  rename meta/recipes-devtools/distcc/{distcc=5F3.1.bb =3D> distcc=5F3.=
2.bb} (91%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (71%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0001-elf=5Fgetarsym-Silence-Werror-maybe-uninitialized-fals.patch (10=
0%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0001-fix-a-stack-usage-warning.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0001-remove-the-unneed-checking.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0002-Add-support-for-mips64-abis-in-mips=5Fretval.c.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/0003-Add-mips-n64-relocation-format-hack.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/aarch64=5Fuio.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/arm=5Fbackend.diff (100%)
> >>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfc=
mp-fix-self-comparision.patch
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/fixheadercheck.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/hppa=5Fbackend.diff (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/kfreebsd=5Fpath.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/m68k=5Fbackend.diff (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/mips=5Fbackend.diff (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/mips=5Freadelf=5Fw.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/shadow.patch (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/testsuite-ignore-elflint.diff (100%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 =3D> elfutils-0=
.166}/uclibc-support.patch (82%)
> >>  rename meta/recipes-devtools/elfutils/{elfutils=5F0.164.bb =3D> elfut=
ils=5F0.166.bb} (94%)
> >>  create mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink=
-c-header-in-target=5Ftriplet-for-S.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1.inc
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-A=
RCH=5FFLAGS=5FFOR=5FTARGET.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf=
.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-=
locale-ctype=5Ftouplow=5Ft.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-loca=
le.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-loca=
le-no=5F=5Fx.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-loca=
le-wchar=5Ffix.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-loca=
le-update.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0008-missing-exe=
cinfo=5Fh.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprint=
f.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-=
system-directories.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-=
dir-extend.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-S=
YSROOT=5FCFLAGS=5FFOR=5FTARGET.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-mult=
ilib-hack.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0014-optional-li=
bstdc.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable=
-MASK=5FRELAX=5FPIC=5FCALLS-bit.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT=5FG=
CC=5FOPTIONS.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-def=
aults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cro=
ss-compile-hack.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-s=
ysroot.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Defa=
ult-to-N64-ABI.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIB=
C=5FDYNAMIC=5FLINKER-and-UCLIBC=5FDYNAMIC=5FLINKE.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-arg=
ument-list-too-long-error.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt=
.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.pat=
ch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-p=
ass-fix-v4bx-to-linker-to-support-EABI.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-mul=
tilib-config-files-from-B-instead-of-usin.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using=
-libdir-from-.la-which-usually-points-to-.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.=
patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-=
AltiVec-generation-on-powepc-linux-target.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the=
-MULTILIB=5FOSDIRNAMES-and-other-multilib-o.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-targ=
et-gcc-headers-can-be-included.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won=
-t-build-with-disable-dependency-tracking.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-searc=
h-host-directory-during-relink-if-inst=5Fpr.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEML=
IBS=5FDIR-replacement-instead-of-hardcoding.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add=
-support-for-musl-ldso.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-=
libcc1-s-install-path-and-rpath.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysr=
oot-support-for-nativesdk-gcc.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0038-Search-targ=
et-sysroot-gcc-version-specific-dirs-with.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various=
-=5FFOR=5FBUILD-and-related-variables.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Defin=
e-MUSL=5FDYNAMIC=5FLINKER.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0041-ssp=5Fnonsh=
ared.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-=
support-ffile-prefix-map-old-new.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebu=
g-prefix-map-to-replace-ffile-prefix-map.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c=
-fdebug-prefix-map-support-to-remap-sourc.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-=
knob-to-use-ldbl-128-on-ppc.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc=
-using-LDFLAGS-not-just-SHLIB=5FLDFLAGS.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian=5F6.1=
.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial=5F6.1.=
bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial=5F6=
.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-source=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/libgcc=5F6.1.bb
> >>  create mode 100644 meta/recipes-devtools/gcc/libgfortran=5F6.1.bb
> >>  rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc =3D> gdb-7.11.inc} (=
100%)
> >>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian=5F7.10.1.bb =3D>=
 gdb-cross-canadian=5F7.11.bb} (100%)
> >>  delete mode 100644 meta/recipes-devtools/gdb/gdb-cross=5F7.10.1.bb
> >>  create mode 100644 meta/recipes-devtools/gdb/gdb-cross=5F7.11.bb
> >>  rename meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-=
to-DESTDIR.patch =3D> 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
> >>  rename meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-=5FA=
BIO32-if-not-defined.patch =3D> 0003-mips-linux-nat-Define-=5FABIO32-if-not=
-defined.patch} (84%)
> >>  create mode 100644 meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Defi=
ne-pt=5Fregs-uapi=5Fpt=5Fregs-on-GLIBC-syst.patch
> >>  rename meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH=
-sh4-architecture.patch =3D> 0005-Add-support-for-Renesas-SH-sh4-architectu=
re.patch} (97%)
> >>  rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch =3D=
> 0006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
> >>  rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch =
=3D> 0007-use-asm-sgidefs.h.patch} (69%)
> >>  rename meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-o=
f-SIGRTMIN.patch =3D> 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
> >>  rename meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.pat=
ch =3D> 0009-Change-order-of-CFLAGS.patch} (69%)
> >>  create mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restric=
t-keyword-conflict.patch
> >>  rename meta/recipes-devtools/gdb/{gdb=5F7.10.1.bb =3D> gdb=5F7.11.bb}=
 (100%)
> >>  create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gda=
te-Move-warning-pragma-outside-of-function.patch
> >>  create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
> >>  rename meta/recipes-devtools/ruby/{ruby=5F2.2.2.bb =3D> ruby=5F2.2.5.=
bb} (86%)
> >>  create mode 100644 meta/recipes-devtools/strace/strace/0001-Fix-build=
-when-using-non-glibc-libc-implementation-o.patch
> >>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.=
patch
> >>  create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-Und=
efine-dprintf-before-redefining.patch
> >>  create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-=
Fix-if-else-indentation.patch
> >>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-powerpc=
-ptrace-Fix-out-of-bounds-array-access-warnin.patch
> >>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prev=
ent-restoration-of-MSA-context-in-non-MSA-kernels.patch
> >>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTB=
FS-problem-with-GCC-6.patch
> >>  create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-Cus42=
8Midi-Explicitly-cast-constant-to-char-type.patch
> >>  create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-A=
ppend-to-I-and-not-to-isystem.patch
> >>  create mode 100644 meta/recipes-sato/webkit/files/musl-fixes.patch
> >>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-bac=
ktrace-on-linux-when-using-glibc.patch
> >>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-=
with-non-glibc-libraries-on-linux.patch
> >>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
> >>  rename meta/recipes-sato/webkit/{webkitgtk=5F2.10.7.bb =3D> webkitgtk=
=5F2.12.1.bb} (92%)
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-=
Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-=
aarch64-introduce-build-support-for-aarch64=5Fbe-targe.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-=
disable-tests.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-=
aarch64-fix-wrong-big=5Fendian-flag-in-aarch64=5Fbe-case.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/AArch=
64-port.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-t=
est-case-link-failure-on-PowerPC-systems-with-Altivec.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-=
libunwind-to-libgcc=5Fs-rather-than-libgcc.patch
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Suppo=
rt-building-with-older-compilers.patch
> >>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/=
0001-Fix-build-on-mips-musl.patch (68%)
> >>  create mode 100644 meta/recipes-support/libunwind/libunwind/0001-add-=
knobs-to-disable-enable-tests.patch
> >>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/=
0001-backtrace-Use-only-with-glibc-and-uclibc.patch (100%)
> >>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/=
0001-x86-Stub-out-x86=5Flocal=5Fresume.patch (100%)
> >>  rename meta/recipes-support/libunwind/{libunwind-1.1 =3D> libunwind}/=
Add-AO=5FREQUIRE=5FCAS-to-fix-build-on-ARM-v6.patch (100%)
> >>  delete mode 100644 meta/recipes-support/libunwind/libunwind=5F1.1.bb
> >>  create mode 100644 meta/recipes-support/libunwind/libunwind=5Fgit.bb
> >>  create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
> >>  rename meta/recipes-support/mpfr/{mpfr-3.1.3 =3D> mpfr}/long-long-thu=
mb.patch (100%)
> >>  rename meta/recipes-support/mpfr/{mpfr=5F3.1.3.bb =3D> mpfr=5F3.1.4.b=
b} (75%)
> >>  rename meta/recipes-support/nss/{nss=5F3.21.bb =3D> nss=5F3.23.bb} (9=
7%)
> >> =20
> >  =20


