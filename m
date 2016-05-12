Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC4096FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:20:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so7772490pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=OONS1CWRA6eOuVtHVlK634L8YNTLOLtbXAGXUNaPCZk=;
	b=mBzLt9RaSIC5nfU37HQML37/DzwFZRiEPEh6yJ0oFOUAEdfXxa3lkJMTxtWeK8Atr0
	37uZ/SaDNimByZhLLqMDBnzG7j99yj3tLp+4wcqVxrzMJDRteKC7MUbKpP5zw5+28q0i
	CJiMDNliFnjANGUDU7nKwR0nd5JQMYH7tp7DyBvyDsEZAa3IGw9s0SGp9mPelka54NS/
	aqILmJlc+SB802iP8sXfz6N8UaQaepYB6zcjFiGUBrQEmeLwdQln1kdLLVi5Q7LpE7r2
	d/RTUQSe8qoevv6SvdbAT9cQo3Qwuu5L+JI5AMa7Cc612yrf9sZOCMkHDeb/lBhwTTxR
	bjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OONS1CWRA6eOuVtHVlK634L8YNTLOLtbXAGXUNaPCZk=;
	b=NZwk3JebTH4CllEBBXXIGZMQHWlmbVLg+zkQ/HrCzOFrOFU8l6B5/dhecW2uVaBRfb
	laXA1xjFhcXtPr9Yl+57ajDa+dQYQMHhF0E0KzoYCfI9u6ZAdmxRWcMfRrTGaSrhSj4H
	F3Y2wyFE+uF5jAKyuYpqawwJ4J3Q3YVrRZ43LB6Qrt79PbU1KKTKWEYSjFRR1d/IeIFI
	3IJgWZgoDP/+vCdCp56cT6ZkhwGu3hRR77sD0+ckSXiJFdSOMG9oH3rLhg9er9rMjzdq
	l3999iIXAOCovUplSKCfEAKn2sOFnV7K5X4S9qHwUx+1af01itjy/Y0vkLddzDs0sgtc
	3rTg==
X-Gm-Message-State: AOPr4FVi3uY9LgcYy7piV3iQk2HN3RVvdzyP8uEMrNhgiYlZqL800MEJRLQh44f9GszjMQ==
X-Received: by 10.98.97.71 with SMTP id v68mr14065319pfb.127.1463062801779;
	Thu, 12 May 2016 07:20:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:d479:c1c3:6c29:187a?
	([2601:202:4000:1239:d479:c1c3:6c29:187a])
	by smtp.googlemail.com with ESMTPSA id
	n66sm20360089pfb.17.2016.05.12.07.19.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 07:20:00 -0700 (PDT)
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<20160512120543.1e064b3f@adi-pc-linux.emea.corp.natinst.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57349106.7090408@gmail.com>
Date: Thu, 12 May 2016 07:19:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160512120543.1e064b3f@adi-pc-linux.emea.corp.natinst.com>
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
X-List-Received-Date: Thu, 12 May 2016 14:20:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/12/2016 02:05 AM, Ioan-Adrian Ratiu wrote:
> Hello
> 
> Can the gcc 6 fixes be pulled into the krogoth branch as well?

GCC 6 is new so we wont be pull that over to Krogoth. Any fixes you are
interested in, patches are welcome.

- armin

> 
> On Wed, 11 May 2016 10:35:25 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
> 
>> This patchset covers gcc 6 upgrade along with gdb 7.11
>> and glibc 2.24 ( upcoming ) release.
>>
>> Rest of upgrades are necessaciated by gcc-6 due to backports
>> that were already in newer versions of packages
>>
>> It has been boot tested with core-image-minimal on all qemu
>> machines
>>
>> The following changes since commit a5970809a2f01dbd152684266e2a3d946d896620:
>>
>>   oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes (2016-05-11 10:33:16 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-6
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-6
>>
>> Dan McGregor (2):
>>   pkgconfig: Fix build with gcc-6 and upgrade to 0.29.1
>>   binutils: disable werror on native build
>>
>> Khem Raj (39):
>>   gcc: Add gcc6 recipes
>>   glibc: Add recipes for 2.24 release
>>   glib-2.0: Ignore useless warning found with gcc-6
>>   elfutils: Upgrade to 0.166
>>   rpm: Fix build with gcc6
>>   alsa-tools: Fix build with gcc6
>>   lzop: Fix build with gcc-6
>>   webkitgtk: Upgrade to 2.12.1
>>   oprofile: Fix with gcc6
>>   mdadm: Fix gcc 6 warnings
>>   nss: Upgrade to 3.23
>>   grub: Fix build with gcc-6
>>   valgrind: Fix build with gcc6
>>   busybox/mdev: Ensure /sys is mounted before using it
>>   libc-common.bbclass: Use sed instead of grep
>>   conf: bump minimum kernel to 3.2.0
>>   systemd: Create missing sysusers offline
>>   grub_git: Upgrade to latest tip
>>   libunwind: Upgrade to 1.2rc1+
>>   linux-yocto: Fix build on ppc with gcc-6
>>   linux-yocto: Fix build with gcc6 on mips
>>   python-native: Point to expat in native sysroot
>>   bitbake.conf: Empty out BUILDSDK_CPPFLAGS
>>   strace: Remove pipe.expected
>>   musl: Upgrade to tip of tree
>>   libgcc: Ensure that gcc configure options are passed to libgcc too
>>   libunwind: Upgrade to 1.2rc1+
>>   libgcc: Ensure that gcc configure options are passed to libgcc too
>>   gdb,strace: Fix builds on ppc/musl
>>   libunwind: Add a confgure option for tests
>>   gdb: Upgrade to 7.11
>>   gdb: Disable binutils components
>>   tcmode-default: Bump gcc,glibc,gdb
>>   musl: Create symlinks for stub libraries
>>   mdadm: Fix build with clang
>>   distcc: Upgrade to 3.2
>>   ruby: Upgrade to 2.2.5
>>   mpfr: Upgrade to 3.1.4
>>   gcc-runtime,libgcc: Symlink c++ header and startup files in
>>     target_triplet for SDK use
>>
>> Marek Vasut (1):
>>   bitbake: Oldest kernel for nios2 is 3.19
>>
>>  meta/classes/cross-canadian.bbclass                |    1 +
>>  meta/classes/libc-common.bbclass                   |    6 +-
>>  meta/classes/populate_sdk_base.bbclass             |    2 +-
>>  meta/conf/bitbake.conf                             |    7 +-
>>  meta/conf/distro/include/tcmode-default.inc        |    6 +-
>>  ...ettext-gettext.c-main_context-secondary_c.patch |   39 +
>>  meta/recipes-bsp/grub/grub2.inc                    |    1 +
>>  meta/recipes-bsp/grub/grub_git.bb                  |    2 +-
>>  meta/recipes-core/busybox/files/mdev               |    4 +-
>>  .../0001-Do-not-ignore-return-value-of-write.patch |   42 +
>>  .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  |   42 +
>>  .../ignore-format-nonliteral-warning.patch         |   39 +
>>  meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |    7 +-
>>  .../fix_for_centos_5.8.patch                       |   18 -
>>  ...tive_2.23.bb => cross-localedef-native_2.24.bb} |   26 +-
>>  ...glibc-initial_2.23.bb => glibc-initial_2.24.bb} |    0
>>  .../{glibc-locale_2.23.bb => glibc-locale_2.24.bb} |    0
>>  .../{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} |    0
>>  ...glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} |    0
>>  ...libc-Look-for-host-system-ld.so.cache-as-.patch |    8 +-
>>  ...libc-Fix-buffer-overrun-with-a-relocated-.patch |    8 +-
>>  ...libc-Raise-the-size-of-arrays-containing-.patch |   34 +-
>>  ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |   10 +-
>>  ...500-e5500-e6500-603e-fsqrt-implementation.patch |    6 +-
>>  ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |    8 +-
>>  ...-Fix-undefined-reference-to-__sqrt_finite.patch |    6 +-
>>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
>>  ...bug-1443-which-explains-what-the-patch-do.patch |    8 +-
>>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   10 +-
>>  ...qrt-f-are-now-inline-functions-and-call-o.patch |    6 +-
>>  ...ersion-output-matching-grok-gold-s-output.patch |   14 +-
>>  ...-configure.ac-handle-correctly-libc_cv_ro.patch |    6 +-
>>  .../glibc/glibc/0014-Add-unused-attribute.patch    |    8 +-
>>  ...thin-the-path-sets-wrong-config-variables.patch |   10 +-
>>  ...-timezone-re-written-tzselect-as-posix-sh.patch |   16 +-
>>  ...move-bash-dependency-for-nscd-init-script.patch |    8 +-
>>  ...c-Cross-building-and-testing-instructions.patch |    6 +-
>>  ...019-eglibc-Help-bootstrap-cross-toolchain.patch |    8 +-
>>  .../glibc/0020-eglibc-cherry-picked-from.patch     |   18 +-
>>  .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  |   10 +-
>>  ...0022-eglibc-Resolve-__fpscr_values-on-SH4.patch |    8 +-
>>  .../glibc/0023-eglibc-Install-PIC-archives.patch   |    8 +-
>>  ...ard-port-cross-locale-generation-support.patch} |   30 +-
>>  ...0025-Define-DUMMY_LOCALE_T-if-not-defined.patch |   32 +
>>  ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch |   48 -
>>  .../glibc/{glibc_2.23.bb => glibc_2.24.bb}         |   12 +-
>>  meta/recipes-core/musl/musl.inc                    |    2 +-
>>  meta/recipes-core/musl/musl_git.bb                 |    6 +-
>>  meta/recipes-core/systemd/systemd_229.bb           |    8 +-
>>  meta/recipes-devtools/binutils/binutils_2.26.bb    |    3 +-
>>  .../distcc/{distcc_3.1.bb => distcc_3.2.bb}        |    8 +-
>>  .../distcc/files/separatebuilddir.patch            |   14 +-
>>  ...ferences-between-mips-machine-identifiers.patch |    0
>>  ...de-alternatives-for-glibc-assumptions-hel.patch |  488 ++--
>>  ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
>>  .../0001-fix-a-stack-usage-warning.patch           |    0
>>  .../0001-remove-the-unneed-checking.patch          |    0
>>  ...-support-for-mips64-abis-in-mips_retval.c.patch |    0
>>  .../0003-Add-mips-n64-relocation-format-hack.patch |    0
>>  .../aarch64_uio.patch                              |    0
>>  .../arm_backend.diff                               |    0
>>  .../elfcmp-fix-self-comparision.patch              |   41 +
>>  .../fixheadercheck.patch                           |    0
>>  .../hppa_backend.diff                              |    0
>>  .../kfreebsd_path.patch                            |    0
>>  .../m68k_backend.diff                              |    0
>>  .../mips_backend.diff                              |    0
>>  .../mips_readelf_w.patch                           |    0
>>  .../shadow.patch                                   |    0
>>  .../testsuite-ignore-elflint.diff                  |    0
>>  .../uclibc-support.patch                           |   37 +-
>>  .../{elfutils_0.164.bb => elfutils_0.166.bb}       |    6 +-
>>  ...-Symlink-c-header-in-target_triplet-for-S.patch |   49 +
>>  meta/recipes-devtools/gcc/gcc-6.1.inc              |  131 +
>>  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
>>  .../gcc/gcc-6.1/0002-uclibc-conf.patch             |   53 +
>>  .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
>>  .../gcc/gcc-6.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
>>  .../gcc/gcc-6.1/0005-uclibc-locale-no__x.patch     |  257 ++
>>  .../gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch |   68 +
>>  .../gcc/gcc-6.1/0007-uclibc-locale-update.patch    |  542 ++++
>>  .../gcc/gcc-6.1/0008-missing-execinfo_h.patch      |   28 +
>>  .../gcc/gcc-6.1/0009-c99-snprintf.patch            |   28 +
>>  .../0010-gcc-poison-system-directories.patch       |  192 ++
>>  .../gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch   |   39 +
>>  .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
>>  .../gcc/gcc-6.1/0013-64-bit-multilib-hack.patch    |   85 +
>>  .../gcc/gcc-6.1/0014-optional-libstdc.patch        |  125 +
>>  ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
>>  .../gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch     |   38 +
>>  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
>>  .../gcc-6.1/0018-fortran-cross-compile-hack.patch  |   46 +
>>  .../gcc/gcc-6.1/0019-cpp-honor-sysroot.patch       |   54 +
>>  .../gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch   |   57 +
>>  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  234 ++
>>  ...0022-gcc-Fix-argument-list-too-long-error.patch |   40 +
>>  .../gcc/gcc-6.1/0023-Disable-sdt.patch             |  113 +
>>  .../gcc/gcc-6.1/0024-libtool.patch                 |   42 +
>>  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
>>  ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
>>  ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
>>  .../gcc/gcc-6.1/0028-export-CPP.patch              |   53 +
>>  ...AltiVec-generation-on-powepc-linux-target.patch |   56 +
>>  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   42 +
>>  ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
>>  ...-t-build-with-disable-dependency-tracking.patch |   54 +
>>  ...h-host-directory-during-relink-if-inst_pr.patch |   38 +
>>  ...IBS_DIR-replacement-instead-of-hardcoding.patch |   29 +
>>  .../0035-aarch64-Add-support-for-musl-ldso.patch   |   28 +
>>  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   54 +
>>  ...-handle-sysroot-support-for-nativesdk-gcc.patch |  213 ++
>>  ...et-sysroot-gcc-version-specific-dirs-with.patch |  102 +
>>  ...-various-_FOR_BUILD-and-related-variables.patch |  137 +
>>  .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   28 +
>>  .../gcc/gcc-6.1/0041-ssp_nonshared.patch           |   28 +
>>  ...c-libcpp-support-ffile-prefix-map-old-new.patch |  292 ++
>>  ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 +
>>  ...-fdebug-prefix-map-support-to-remap-sourc.patch |   54 +
>>  ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  125 +
>>  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   29 +
>>  meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
>>  .../recipes-devtools/gcc/gcc-cross-canadian_6.1.bb |    5 +
>>  meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb |    2 +
>>  meta/recipes-devtools/gcc/gcc-cross_6.1.bb         |    3 +
>>  .../gcc/gcc-crosssdk-initial_6.1.bb                |    3 +
>>  meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb      |    2 +
>>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   12 +
>>  meta/recipes-devtools/gcc/gcc-runtime_6.1.bb       |    7 +
>>  meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb    |    2 +
>>  meta/recipes-devtools/gcc/gcc-source_6.1.bb        |    4 +
>>  meta/recipes-devtools/gcc/gcc_6.1.bb               |   15 +
>>  meta/recipes-devtools/gcc/libgcc-common.inc        |    9 +-
>>  meta/recipes-devtools/gcc/libgcc-initial_6.1.bb    |    2 +
>>  meta/recipes-devtools/gcc/libgcc.inc               |   12 +
>>  meta/recipes-devtools/gcc/libgcc_6.1.bb            |    2 +
>>  meta/recipes-devtools/gcc/libgfortran_6.1.bb       |    3 +
>>  .../gdb/{gdb-7.10.1.inc => gdb-7.11.inc}           |    0
>>  meta/recipes-devtools/gdb/gdb-common.inc           |   25 +-
>>  ...nadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} |    0
>>  meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb      |    4 -
>>  meta/recipes-devtools/gdb/gdb-cross_7.11.bb        |    2 +
>>  meta/recipes-devtools/gdb/gdb.inc                  |    8 -
>>  .../gdb/0001-include-sys-types.h-for-mode_t.patch  |   10 +-
>>  ...002-make-man-install-relative-to-DESTDIR.patch} |    8 +-
>>  ...-linux-nat-Define-_ABIO32-if-not-defined.patch} |    8 +-
>>  ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   53 +
>>  ...-support-for-Renesas-SH-sh4-architecture.patch} |   32 +-
>>  ...-libreadline.a-when-using-disable-static.patch} |   21 +-
>>  ...gidefs.h.patch => 0007-use-asm-sgidefs.h.patch} |   15 +-
>>  ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} |   44 +-
>>  ...AGS.patch => 0009-Change-order-of-CFLAGS.patch} |   18 +-
>>  .../0010-resolve-restrict-keyword-conflict.patch   |   48 +
>>  .../gdb/{gdb_7.10.1.bb => gdb_7.11.bb}             |    0
>>  ...e-Move-warning-pragma-outside-of-function.patch |   39 +
>>  meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    1 +
>>  .../python/python-native_2.7.11.bb                 |    2 +-
>>  meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |   54 +
>>  meta/recipes-devtools/rpm/rpm_5.4.16.bb            |    3 +-
>>  .../ruby/{ruby_2.2.2.bb => ruby_2.2.5.bb}          |    8 +-
>>  ...hen-using-non-glibc-libc-implementation-o.patch |   36 +
>>  meta/recipes-devtools/strace/strace_4.11.bb        |    4 +-
>>  .../valgrind/valgrind/gcc5-port.patch              |   64 +
>>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |    1 +
>>  ...dadm.h-Undefine-dprintf-before-redefining.patch |   43 +
>>  .../0001-raid6check-Fix-if-else-indentation.patch  |   37 +
>>  meta/recipes-extended/mdadm/mdadm_3.4.bb           |    4 +-
>>  ...ace-Fix-out-of-bounds-array-access-warnin.patch |   50 +
>>  ...oration-of-MSA-context-in-non-MSA-kernels.patch |   76 +
>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       |    5 +-
>>  meta/recipes-kernel/oprofile/oprofile.inc          |    4 +-
>>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |   51 +
>>  ...idi-Explicitly-cast-constant-to-char-type.patch |   75 +
>>  meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb   |    6 +-
>>  ...cmake-drop-the-hardcoded-introspection-gt.patch |   19 +-
>>  ...bKitMacros-Append-to-I-and-not-to-isystem.patch |  223 ++
>>  ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |   19 +-
>>  meta/recipes-sato/webkit/files/musl-fixes.patch    |   48 +
>>  ...nable-backtrace-on-linux-when-using-glibc.patch |   39 -
>>  ...x-build-with-non-glibc-libraries-on-linux.patch |   61 -
>>  meta/recipes-sato/webkit/webkitgtk/clang.patch     |   25 -
>>  .../{webkitgtk_2.10.7.bb => webkitgtk_2.12.1.bb}   |   12 +-
>>  ...rf-opcodes-can-cause-references-beyond-th.patch |   29 -
>>  ...roduce-build-support-for-aarch64_be-targe.patch |   33 -
>>  .../libunwind-1.1/0001-disable-tests.patch         |   31 -
>>  ...-wrong-big_endian-flag-in-aarch64_be-case.patch |   34 -
>>  .../libunwind/libunwind-1.1/AArch64-port.patch     | 2529 -----------------
>>  ...k-failure-on-PowerPC-systems-with-Altivec.patch |   28 -
>>  ...-libunwind-to-libgcc_s-rather-than-libgcc.patch |   42 -
>>  .../Support-building-with-older-compilers.patch    |   72 -
>>  .../0001-Fix-build-on-mips-musl.patch              |   33 +-
>>  .../0001-add-knobs-to-disable-enable-tests.patch   |   69 +
>>  ...-backtrace-Use-only-with-glibc-and-uclibc.patch |    0
>>  .../0001-x86-Stub-out-x86_local_resume.patch       |    0
>>  ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |    0
>>  meta/recipes-support/libunwind/libunwind_1.1.bb    |   24 -
>>  meta/recipes-support/libunwind/libunwind_git.bb    |   26 +
>>  .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch |   37 +
>>  meta/recipes-support/lzop/lzop_1.03.bb             |    6 +-
>>  .../{mpfr-3.1.3 => mpfr}/long-long-thumb.patch     |    0
>>  .../mpfr/{mpfr_3.1.3.bb => mpfr_3.1.4.bb}          |    5 +-
>>  .../nss/{nss_3.21.bb => nss_3.23.bb}               |    8 +-
>>  201 files changed, 9095 insertions(+), 3627 deletions(-)
>>  create mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
>>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
>>  delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
>>  rename meta/recipes-core/glibc/{cross-localedef-native_2.23.bb => cross-localedef-native_2.24.bb} (79%)
>>  rename meta/recipes-core/glibc/{glibc-initial_2.23.bb => glibc-initial_2.24.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-locale_2.23.bb => glibc-locale_2.24.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} (100%)
>>  rename meta/recipes-core/glibc/{glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} (100%)
>>  rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-locale-generation-support.patch => 0024-eglibc-Forward-port-cross-locale-generation-support.patch} (97%)
>>  create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
>>  delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
>>  rename meta/recipes-core/glibc/{glibc_2.23.bb => glibc_2.24.bb} (93%)
>>  rename meta/recipes-devtools/distcc/{distcc_3.1.bb => distcc_3.2.bb} (91%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (71%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-fix-a-stack-usage-warning.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0001-remove-the-unneed-checking.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/0003-Add-mips-n64-relocation-format-hack.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/aarch64_uio.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/arm_backend.diff (100%)
>>  create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/fixheadercheck.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/hppa_backend.diff (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/kfreebsd_path.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/m68k_backend.diff (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/mips_backend.diff (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/mips_readelf_w.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/shadow.patch (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/testsuite-ignore-elflint.diff (100%)
>>  rename meta/recipes-devtools/elfutils/{elfutils-0.164 => elfutils-0.166}/uclibc-support.patch (82%)
>>  rename meta/recipes-devtools/elfutils/{elfutils_0.164.bb => elfutils_0.166.bb} (94%)
>>  create mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1.inc
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-no__x.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-update.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execinfo_h.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-system-directories.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multilib-hack.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libstdc.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-compile-hack.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysroot.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argument-list-too-long-error.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-gcc-headers-can-be-included.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-support-for-musl-ldso.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot-support-for-nativesdk-gcc.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0041-ssp_nonshared.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-cross_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc-source_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/gcc_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/libgcc_6.1.bb
>>  create mode 100644 meta/recipes-devtools/gcc/libgfortran_6.1.bb
>>  rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc => gdb-7.11.inc} (100%)
>>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} (100%)
>>  delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
>>  create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.11.bb
>>  rename meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-to-DESTDIR.patch => 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
>>  rename meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (84%)
>>  create mode 100644 meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>>  rename meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH-sh4-architecture.patch => 0005-Add-support-for-Renesas-SH-sh4-architecture.patch} (97%)
>>  rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch => 0006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
>>  rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch => 0007-use-asm-sgidefs.h.patch} (69%)
>>  rename meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-of-SIGRTMIN.patch => 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
>>  rename meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.patch => 0009-Change-order-of-CFLAGS.patch} (69%)
>>  create mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
>>  rename meta/recipes-devtools/gdb/{gdb_7.10.1.bb => gdb_7.11.bb} (100%)
>>  create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
>>  rename meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.2.5.bb} (86%)
>>  create mode 100644 meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
>>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/gcc5-port.patch
>>  create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
>>  create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check-Fix-if-else-indentation.patch
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-powerpc-ptrace-Fix-out-of-bounds-array-access-warnin.patch
>>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
>>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
>>  create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
>>  create mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>>  create mode 100644 meta/recipes-sato/webkit/files/musl-fixes.patch
>>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
>>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
>>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch
>>  rename meta/recipes-sato/webkit/{webkitgtk_2.10.7.bb => webkitgtk_2.12.1.bb} (92%)
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-disable-tests.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/AArch64-port.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Support-building-with-older-compilers.patch
>>  rename meta/recipes-support/libunwind/{libunwind-1.1 => libunwind}/0001-Fix-build-on-mips-musl.patch (68%)
>>  create mode 100644 meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
>>  rename meta/recipes-support/libunwind/{libunwind-1.1 => libunwind}/0001-backtrace-Use-only-with-glibc-and-uclibc.patch (100%)
>>  rename meta/recipes-support/libunwind/{libunwind-1.1 => libunwind}/0001-x86-Stub-out-x86_local_resume.patch (100%)
>>  rename meta/recipes-support/libunwind/{libunwind-1.1 => libunwind}/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch (100%)
>>  delete mode 100644 meta/recipes-support/libunwind/libunwind_1.1.bb
>>  create mode 100644 meta/recipes-support/libunwind/libunwind_git.bb
>>  create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
>>  rename meta/recipes-support/mpfr/{mpfr-3.1.3 => mpfr}/long-long-thumb.patch (100%)
>>  rename meta/recipes-support/mpfr/{mpfr_3.1.3.bb => mpfr_3.1.4.bb} (75%)
>>  rename meta/recipes-support/nss/{nss_3.21.bb => nss_3.23.bb} (97%)
>>
> 

