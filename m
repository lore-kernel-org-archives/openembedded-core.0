Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 312A878D24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:35:37 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c15-v6so13192665qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mQEMBqv8k9kBusaQ3CQcz6eDkXEy2k+/eV0Slt8nE4k=;
	b=X9zLChHu7PnQKjUK2g8znOkWOKRgNrRKv2wffq9ogRvWfvlGQS3icIOIGja38165uT
	r7DbWhjbSFTLwtd4m21RoVB2/Oa9r9u9J49sx9RL9SQcm4z1JX/Xs9DGrPLHyEi5MHR/
	8esqbLFO/bOTxRGPVl437tLEyjl3ExQwLtyqMY2piNGtMdwTRCp/5VJBA1kP2Z6F+VDe
	jspoH/Cb8rNK7S7Q05xDicCJlNkHQHfOIRKvZNzjrQlgvzxygvDaTMcdLDQu0vrI4idK
	L0avNTjGP9nwHANj0Fny/miSCoLuvNDAX6rPd+l1f8GAN5SoRfOxvV4VTLnSKvXnJUyT
	RVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mQEMBqv8k9kBusaQ3CQcz6eDkXEy2k+/eV0Slt8nE4k=;
	b=msUPIKRqglbcwUmJJ9UdgTEbkLPNsZrzgRPUrKpwOswf1cXoo1rncMxOF0g7n89GaP
	Cg3btT7s6oxCY2JAoG8UEprEvXrSR1TWml60Mm7LNOS7yevKmQg7cRcbLlMIXhovPpq4
	gGlqzSYXQr0HbtArpgupNm/eV/71w5kA8r9h2XjZiPv2kNcW2mGshtZjddojiZeFCoVi
	1oVWNn5iqT2saTB6GR8Y6hnD0QX7rA7NZ8+WYITHVJLw5WFblIfAbMtQRtZUgv3J9jh6
	0FKkspvuw6W3eSZ9ZTki4t3ax8tLztWRPC07P1SjGzRrm1gKezOjALsFx+hKc78G982+
	VWRg==
X-Gm-Message-State: AOUpUlEBo5qcyY+E05718KNtEv4IOx+ImkULaLmoE5Kt03LMsun5Hiqg
	CIUU2c2EdB0Yb6jcRSvshXEt0f5VErEVNnyqISsIpA==
X-Google-Smtp-Source: AAOMgpcSZzQoZvk45qCxFqVPqsA0Y/iCQoXcDgTraXbcuGC9+J4lqXxn1oar5JFCkHt1jZ3xbnvemjzQS1XJnzcl9mY=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr17714950qth.188.1532975737650; 
	Mon, 30 Jul 2018 11:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180727083113.17370-1-raj.khem@gmail.com>
	<CA+chaQfyM=Ui_QX6M=Rnpdk_B9DOgcEfXCaDZPypyotTQ61b+A@mail.gmail.com>
In-Reply-To: <CA+chaQfyM=Ui_QX6M=Rnpdk_B9DOgcEfXCaDZPypyotTQ61b+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 11:35:26 -0700
Message-ID: <CAMKF1srgn4yoy8cA1vv9ENerHk9gE9yrp2zbqJk=5cJuJMR82Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-8: Upgrade to 8.2 release
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
X-List-Received-Date: Mon, 30 Jul 2018 18:35:37 -0000
Content-Type: multipart/alternative; boundary="0000000000004ac44705723bbaeb"

--0000000000004ac44705723bbaeb
Content-Type: text/plain; charset="UTF-8"

Sure my builds with gold did not end up in the fails for qemuarm and thumb1
the setup is very similar but I might have been lucky let me know how it
goes

On Mon, Jul 30, 2018 at 7:53 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> I'm not sure if it was caused by this change, but I've included it from
> patchwork on Friday and since then I've seen 3 builds getting stuck in gcc
> for 50 hours.
>
> In all 3 cases it was qemuarm (with thumb and gold enabled), twice while
> building bash and once building libjpeg-turbo. I will let you know after
> more builds to see how often it happens (I didn't do many builds over
> weekend, because well - they were stuck on early ones, because of this).
>
> On Fri, Jul 27, 2018 at 10:31 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...003-build-failures-with-with-cpu-xsc.patch | 61 -------------------
>>  .../gcc/{gcc-8.1.inc => gcc-8.2.inc}          | 11 ++--
>>  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  0
>>  .../0003-gcc-poison-system-directories.patch  |  0
>>  .../0004-gcc-poison-dir-extend.patch          |  0
>>  ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  0
>>  .../0006-64-bit-multilib-hack.patch           |  0
>>  .../0007-optional-libstdc.patch               |  0
>>  ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  0
>>  .../0009-COLLECT_GCC_OPTIONS.patch            |  0
>>  ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
>>  .../0011-fortran-cross-compile-hack.patch     |  0
>>  .../0012-cpp-honor-sysroot.patch              |  0
>>  .../0013-MIPS64-Default-to-N64-ABI.patch      |  0
>>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
>>  ...gcc-Fix-argument-list-too-long-error.patch |  0
>>  .../0016-Disable-sdt.patch                    |  0
>>  .../{gcc-8.1 => gcc-8.2}/0017-libtool.patch   |  0
>>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |  0
>>  ...-config-files-from-B-instead-of-usin.patch |  0
>>  ...ir-from-.la-which-usually-points-to-.patch |  0
>>  .../0021-export-CPP.patch                     |  0
>>  ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
>>  ...e-target-gcc-headers-can-be-included.patch |  0
>>  ...ild-with-disable-dependency-tracking.patch |  0
>>  ...t-directory-during-relink-if-inst_pr.patch |  0
>>  ...IR-replacement-instead-of-hardcoding.patch |  0
>>  ...27-aarch64-Add-support-for-musl-ldso.patch |  0
>>  ...-fix-libcc1-s-install-path-and-rpath.patch |  0
>>  ...le-sysroot-support-for-nativesdk-gcc.patch |  0
>>  ...sroot-gcc-version-specific-dirs-with.patch |  0
>>  ...ous-_FOR_BUILD-and-related-variables.patch |  0
>>  ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  0
>>  ...d-to-link-commandline-for-musl-targe.patch |  0
>>  ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  0
>>  ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
>>  ...as-for-__cpu_indicator_init-instead-.patch |  0
>>  .../0037-sync-gcc-stddef.h-with-musl.patch    |  0
>>  ...-fault-in-precompiled-header-generat.patch |  0
>>  .../0039-Fix-for-testsuite-failure.patch      |  0
>>  ...Re-introduce-spe-commandline-options.patch |  0
>>  ...adian_8.1.bb => gcc-cross-canadian_8.2.bb} |  0
>>  ...nitial_8.1.bb => gcc-cross-initial_8.2.bb} |  0
>>  .../{gcc-cross_8.1.bb => gcc-cross_8.2.bb}    |  0
>>  ...ial_8.1.bb => gcc-crosssdk-initial_8.2.bb} |  0
>>  ...cc-crosssdk_8.1.bb => gcc-crosssdk_8.2.bb} |  0
>>  ...{gcc-runtime_8.1.bb => gcc-runtime_8.2.bb} |  0
>>  ...anitizers_8.1.bb => gcc-sanitizers_8.2.bb} |  0
>>  .../{gcc-source_8.1.bb => gcc-source_8.2.bb}  |  0
>>  .../gcc/{gcc_8.1.bb => gcc_8.2.bb}            |  0
>>  ...c-initial_8.1.bb => libgcc-initial_8.2.bb} |  0
>>  .../gcc/{libgcc_8.1.bb => libgcc_8.2.bb}      |  0
>>  ...{libgfortran_8.1.bb => libgfortran_8.2.bb} |  0
>>  53 files changed, 5 insertions(+), 67 deletions(-)
>>  delete mode 100644
>> meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
>>  rename meta/recipes-devtools/gcc/{gcc-8.1.inc => gcc-8.2.inc} (93%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0003-gcc-poison-system-directories.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0004-gcc-poison-dir-extend.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0006-64-bit-multilib-hack.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0007-optional-libstdc.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0009-COLLECT_GCC_OPTIONS.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0011-fortran-cross-compile-hack.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0012-cpp-honor-sysroot.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0013-MIPS64-Default-to-N64-ABI.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0015-gcc-Fix-argument-list-too-long-error.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0016-Disable-sdt.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 => gcc-8.2}/0017-libtool.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0021-export-CPP.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0023-Ensure-target-gcc-headers-can-be-included.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0027-aarch64-Add-support-for-musl-ldso.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0029-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0031-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0037-sync-gcc-stddef.h-with-musl.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0039-Fix-for-testsuite-failure.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-8.1 =>
>> gcc-8.2}/0040-Re-introduce-spe-commandline-options.patch (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_8.1.bb =>
>> gcc-cross-canadian_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-cross-initial_8.1.bb =>
>> gcc-cross-initial_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-cross_8.1.bb => gcc-cross_8.2.bb}
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_8.1.bb =>
>> gcc-crosssdk-initial_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-crosssdk_8.1.bb =>
>> gcc-crosssdk_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-runtime_8.1.bb =>
>> gcc-runtime_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-sanitizers_8.1.bb =>
>> gcc-sanitizers_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{gcc-source_8.1.bb => gcc-source_8.2.bb}
>> (100%)
>>  rename meta/recipes-devtools/gcc/{gcc_8.1.bb => gcc_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{libgcc-initial_8.1.bb =>
>> libgcc-initial_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{libgcc_8.1.bb => libgcc_8.2.bb} (100%)
>>  rename meta/recipes-devtools/gcc/{libgfortran_8.1.bb =>
>> libgfortran_8.2.bb} (100%)
>>
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
>> b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
>> deleted file mode 100644
>> index 68b8962d47..0000000000
>> ---
>> a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17 00:00:00 2001
>> -From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
>> -Date: Mon, 4 Jun 2018 08:46:04 +0000
>> -Subject: [PATCH] [arm] PR target/86003 build failures with
>> --with-cpu=xscale
>> -
>> -The XScale cpu configuration in GCC has always been somewhat
>> -non-conforming.  Although XScale isn't an architecture (it's simply an
>> -implementation of ARMv5te), we do by tradition emit a specific
>> -pre-define for it.  We achieve this effect by adding an additional
>> -feature bit to the xscale CPU definition that isn't part of the base
>> -architecture.
>> -
>> -When I restructured the options last year I overlooked this oddity and
>> -the result, of course, is that this configuration now fails to build
>> -as intended.
>> -
>> -What happens is that the driver (correctly) constructs an architecture
>> -for the xscale cpu name (as armv5te) and passes it in addition to the
>> -CPU name.  The backend code, on finding both a cpu and an architecture
>> -specifies attempts to correlate the two and finds a difference due to
>> -the additional feature bit and reports an inconsistency (fatally if
>> --werror is specified).
>> -
>> -I think the best fix to this is to treat the xscale feature bit using
>> -the same mechanism that we use for other 'quirks' in CPU
>> -implementations and simply filter it out before comparing the
>> -capabilities.  It has the additional benefit that it's also the
>> -simplest fix.
>> -
>> -       PR target/86003
>> -       * config/arm/arm-cpus.in (ALL_QUIRKS): Add xscale feature to the
>> list
>> -       of bits to ignore when comparing architectures.
>> -
>> -
>> -git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141
>> 138bc75d-0d04-0410-961f-82ee72b054a4
>> ----
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Upstream-Status: Backport
>> -
>> - gcc/ChangeLog              | 6 ++++++
>> - gcc/config/arm/arm-cpus.in | 4 +++-
>> - 2 files changed, 9 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
>> -index 96972a057e7..545321b0bbe 100644
>> ---- a/gcc/config/arm/arm-cpus.in
>> -+++ b/gcc/config/arm/arm-cpus.in
>> -@@ -268,7 +268,9 @@ define fgroup DOTPROD      NEON dotprod
>> -
>> - # List of all quirk bits to strip out when comparing CPU features with
>> - # architectures.
>> --define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz
>> quirk_cm3_ldrd
>> -+# xscale isn't really a 'quirk', but it isn't an architecture either
>> and we
>> -+# need to ignore it for matching purposes.
>> -+define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz
>> quirk_cm3_ldrd xscale
>> -
>> - # Architecture entries
>> - # format:
>> ---
>> -2.17.1
>> -
>> diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc
>> b/meta/recipes-devtools/gcc/gcc-8.2.inc
>> similarity index 93%
>> rename from meta/recipes-devtools/gcc/gcc-8.1.inc
>> rename to meta/recipes-devtools/gcc/gcc-8.2.inc
>> index ebe3c24978..8503a66b07 100644
>> --- a/meta/recipes-devtools/gcc/gcc-8.1.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
>> @@ -2,13 +2,13 @@ require gcc-common.inc
>>
>>  # Third digit in PV should be incremented after a minor release
>>
>> -PV = "8.1.0"
>> +PV = "8.2.0"
>>
>>  # BINV should be incremented to a revision after a minor gcc release
>>
>> -BINV = "8.1.0"
>> +BINV = "8.2.0"
>>
>> -FILESEXTRAPATHS =.
>> "${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:"
>> +FILESEXTRAPATHS =.
>> "${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:"
>>
>>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native
>> flex-native"
>> @@ -73,10 +73,9 @@ SRC_URI = "\
>>             ${BACKPORTS} \
>>  "
>>  BACKPORTS = "\
>> -
>>  file://0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch \
>>  "
>> -SRC_URI[md5sum] = "65f7c65818dc540b3437605026d329fc"
>> -SRC_URI[sha256sum] =
>> "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"
>> +SRC_URI[md5sum] = "4ab282f414676496483b3e1793d07862"
>> +SRC_URI[sha256sum] =
>> "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080"
>>
>>  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>  #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
>> diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
>> diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
>> diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
>> rename to meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
>> diff --git
>> a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
>> b/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
>> rename to
>> meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-cross_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-cross_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-source_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc-source_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-source_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc-source_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb
>> b/meta/recipes-devtools/gcc/gcc_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc_8.1.bb
>> rename to meta/recipes-devtools/gcc/gcc_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
>> b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
>> rename to meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/libgcc_8.1.bb
>> b/meta/recipes-devtools/gcc/libgcc_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgcc_8.1.bb
>> rename to meta/recipes-devtools/gcc/libgcc_8.2.bb
>> diff --git a/meta/recipes-devtools/gcc/libgfortran_8.1.bb
>> b/meta/recipes-devtools/gcc/libgfortran_8.2.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgfortran_8.1.bb
>> rename to meta/recipes-devtools/gcc/libgfortran_8.2.bb
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000004ac44705723bbaeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Sure my builds with gold did not end up in the fails=
 for qemuarm and thumb1 the setup is very similar but I might have been luc=
ky let me know how it goes=C2=A0</div></div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Mon, Jul 30, 2018 at 7:53 AM Martin Jansa &lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;m not sure =
if it was caused by this change, but I&#39;ve included it from patchwork on=
 Friday and since then I&#39;ve seen 3 builds getting stuck in gcc for 50 h=
ours.<div><br></div><div>In all 3 cases it was qemuarm (with thumb and gold=
 enabled), twice while building bash and once building libjpeg-turbo. I wil=
l let you know after more builds to see how often it happens (I didn&#39;t =
do many builds over weekend, because well - they were stuck on early ones, =
because of this).</div></div><br><div class=3D"gmail_quote"></div><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jul 27, 2018 at 10:31 AM Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...003-build-failures-with-with-cpu-xsc.patch | 61 ------------------=
-<br>
=C2=A0.../gcc/{gcc-8.1.inc =3D&gt; gcc-8.2.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 ++--<br>
=C2=A0...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |=C2=A0 0<br>
=C2=A0.../0003-gcc-poison-system-directories.patch=C2=A0 |=C2=A0 0<br>
=C2=A0.../0004-gcc-poison-dir-extend.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
=C2=A0...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |=C2=A0 0<br>
=C2=A0.../0006-64-bit-multilib-hack.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 0<br>
=C2=A0.../0007-optional-libstdc.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |=C2=A0 0<br>
=C2=A0.../0009-COLLECT_GCC_OPTIONS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 0<br>
=C2=A0...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |=C2=A0 0<br>
=C2=A0.../0011-fortran-cross-compile-hack.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0.../0012-cpp-honor-sysroot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../0013-MIPS64-Default-to-N64-ABI.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
0<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0 0<br>
=C2=A0...gcc-Fix-argument-list-too-long-error.patch |=C2=A0 0<br>
=C2=A0.../0016-Disable-sdt.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0.../{gcc-8.1 =3D&gt; gcc-8.2}/0017-libtool.patch=C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0...s-fix-v4bx-to-linker-to-support-EABI.patch |=C2=A0 0<br>
=C2=A0...-config-files-from-B-instead-of-usin.patch |=C2=A0 0<br>
=C2=A0...ir-from-.la-which-usually-points-to-.patch |=C2=A0 0<br>
=C2=A0.../0021-export-CPP.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0...ILIB_OSDIRNAMES-and-other-multilib-o.patch |=C2=A0 0<br>
=C2=A0...e-target-gcc-headers-can-be-included.patch |=C2=A0 0<br>
=C2=A0...ild-with-disable-dependency-tracking.patch |=C2=A0 0<br>
=C2=A0...t-directory-during-relink-if-inst_pr.patch |=C2=A0 0<br>
=C2=A0...IR-replacement-instead-of-hardcoding.patch |=C2=A0 0<br>
=C2=A0...27-aarch64-Add-support-for-musl-ldso.patch |=C2=A0 0<br>
=C2=A0...-fix-libcc1-s-install-path-and-rpath.patch |=C2=A0 0<br>
=C2=A0...le-sysroot-support-for-nativesdk-gcc.patch |=C2=A0 0<br>
=C2=A0...sroot-gcc-version-specific-dirs-with.patch |=C2=A0 0<br>
=C2=A0...ous-_FOR_BUILD-and-related-variables.patch |=C2=A0 0<br>
=C2=A0...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |=C2=A0 0<br>
=C2=A0...d-to-link-commandline-for-musl-targe.patch |=C2=A0 0<br>
=C2=A0...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |=C2=A0 0<br>
=C2=A0...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |=C2=A0 0<br>
=C2=A0...as-for-__cpu_indicator_init-instead-.patch |=C2=A0 0<br>
=C2=A0.../0037-sync-gcc-stddef.h-with-musl.patch=C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0...-fault-in-precompiled-header-generat.patch |=C2=A0 0<br>
=C2=A0.../0039-Fix-for-testsuite-failure.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
0<br>
=C2=A0...Re-introduce-spe-commandline-options.patch |=C2=A0 0<br>
=C2=A0...<a href=3D"http://adian_8.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">adian_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_8.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.2.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://nitial_8.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nitial_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross-initial_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.2.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../{<a href=3D"http://gcc-cross_8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-cross_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-cross_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross_8.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 0<br>
=C2=A0...<a href=3D"http://ial_8.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>ial_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.2.bb</a>} |=C2=A0 =
0<br>
=C2=A0...<a href=3D"http://cc-crosssdk_8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">cc-crosssdk_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_8.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.2.bb</a>} |=C2=A0 0=
<br>
=C2=A0...{<a href=3D"http://gcc-runtime_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-runtime_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-runtime_8.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.2.bb</a>} |=C2=A0 =
0<br>
=C2=A0...<a href=3D"http://anitizers_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">anitizers_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-sanitizers_8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.2.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../{<a href=3D"http://gcc-source_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_8.1.bb</a> =3D&gt; <a href=3D"http://gcc-source_8.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_8.2.bb</a>}=C2=A0 |=C2=
=A0 0<br>
=C2=A0.../gcc/{<a href=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc_8.1.bb</a> =3D&gt; <a href=3D"http://gcc_8.2.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc_8.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
=C2=A0...<a href=3D"http://c-initial_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">c-initial_8.1.bb</a> =3D&gt; <a href=3D"http://libgcc-initial_8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.2.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../gcc/{<a href=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_8.1.bb</a> =3D&gt; <a href=3D"http://libgcc_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_8.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 0<br>
=C2=A0...{<a href=3D"http://libgfortran_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgfortran_8.1.bb</a> =3D&gt; <a href=3D"http://libgfortran_8.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_8.2.bb</a>} |=C2=A0 =
0<br>
=C2=A053 files changed, 5 insertions(+), 67 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-targ=
et-86003-build-failures-with-with-cpu-xsc.patch<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1.inc =3D&gt; gcc-8.2.inc} (9=
3%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0003-gcc-p=
oison-system-directories.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0004-gcc-p=
oison-dir-extend.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0005-gcc-4=
.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0006-64-bi=
t-multilib-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0007-optio=
nal-libstdc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0008-gcc-d=
isable-MASK_RELAX_PIC_CALLS-bit.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0009-COLLE=
CT_GCC_OPTIONS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0010-Use-t=
he-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0011-fortr=
an-cross-compile-hack.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0012-cpp-h=
onor-sysroot.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0013-MIPS6=
4-Default-to-N64-ABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0014-Defin=
e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0015-gcc-F=
ix-argument-list-too-long-error.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0016-Disab=
le-sdt.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0017-libto=
ol.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0018-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0019-Use-t=
he-multilib-config-files-from-B-instead-of-usin.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0020-Avoid=
-using-libdir-from-.la-which-usually-points-to-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0021-expor=
t-CPP.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0022-Disab=
le-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0023-Ensur=
e-target-gcc-headers-can-be-included.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0024-gcc-4=
.8-won-t-build-with-disable-dependency-tracking.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0025-Don-t=
-search-host-directory-during-relink-if-inst_pr.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0026-Use-S=
YSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0027-aarch=
64-Add-support-for-musl-ldso.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0028-libcc=
1-fix-libcc1-s-install-path-and-rpath.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0029-handl=
e-sysroot-support-for-nativesdk-gcc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0030-Searc=
h-target-sysroot-gcc-version-specific-dirs-with.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0031-Fix-v=
arious-_FOR_BUILD-and-related-variables.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0032-nios2=
-Define-MUSL_DYNAMIC_LINKER.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0033-Add-s=
sp_nonshared-to-link-commandline-for-musl-targe.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0034-libgc=
c-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0035-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0036-libgc=
c_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0037-sync-=
gcc-stddef.h-with-musl.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0038-fix-s=
egmentation-fault-in-precompiled-header-generat.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0039-Fix-f=
or-testsuite-failure.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{gcc-8.1 =3D&gt; gcc-8.2}/0040-Re-in=
troduce-spe-commandline-options.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-canadia=
n_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.1.bb</a=
> =3D&gt; <a href=3D"http://gcc-cross-canadian_8.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-cross-canadian_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-initial=
_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.1.bb</a> =
=3D&gt; <a href=3D"http://gcc-cross-initial_8.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-cross-initial_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-cross_8.1.bb</a> =3D&gt; <a href=
=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross=
_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk-init=
ial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.1.b=
b</a> =3D&gt; <a href=3D"http://gcc-crosssdk-initial_8.2.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-crosssdk-initial_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk_8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.1.bb</a> =3D&gt; <a=
 href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_blank">g=
cc-crosssdk_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.1.bb</a> =3D&gt; <a h=
ref=3D"http://gcc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-=
runtime_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitizers_8.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.1.bb</a> =3D&gt=
; <a href=3D"http://gcc-sanitizers_8.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-sanitizers_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_8.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-source_8.1.bb</a> =3D&gt; <a hre=
f=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sou=
rce_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc_8.1.bb</a> =3D&gt; <a href=3D"http://=
gcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initial_8.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.1.bb</a> =3D&gt=
; <a href=3D"http://libgcc-initial_8.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libgcc-initial_8.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_8.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libgcc_8.1.bb</a> =3D&gt; <a href=3D"htt=
p://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_8.2.bb</a>} =
(100%)<br>
=C2=A0rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libgfortran_8.1.bb</a> =3D&gt; <a h=
ref=3D"http://libgfortran_8.2.bb" rel=3D"noreferrer" target=3D"_blank">libg=
fortran_8.2.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-bui=
ld-failures-with-with-cpu-xsc.patch b/meta/recipes-devtools/gcc/gcc-8.1/004=
1-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch<br>
deleted file mode 100644<br>
index 68b8962d47..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-fail=
ures-with-with-cpu-xsc.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17 00:00:00 2001<br>
-From: rearnsha &lt;rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
-Date: Mon, 4 Jun 2018 08:46:04 +0000<br>
-Subject: [PATCH] [arm] PR target/86003 build failures with --with-cpu=3Dxs=
cale<br>
-<br>
-The XScale cpu configuration in GCC has always been somewhat<br>
-non-conforming.=C2=A0 Although XScale isn&#39;t an architecture (it&#39;s =
simply an<br>
-implementation of ARMv5te), we do by tradition emit a specific<br>
-pre-define for it.=C2=A0 We achieve this effect by adding an additional<br=
>
-feature bit to the xscale CPU definition that isn&#39;t part of the base<b=
r>
-architecture.<br>
-<br>
-When I restructured the options last year I overlooked this oddity and<br>
-the result, of course, is that this configuration now fails to build<br>
-as intended.<br>
-<br>
-What happens is that the driver (correctly) constructs an architecture<br>
-for the xscale cpu name (as armv5te) and passes it in addition to the<br>
-CPU name.=C2=A0 The backend code, on finding both a cpu and an architectur=
e<br>
-specifies attempts to correlate the two and finds a difference due to<br>
-the additional feature bit and reports an inconsistency (fatally if<br>
--werror is specified).<br>
-<br>
-I think the best fix to this is to treat the xscale feature bit using<br>
-the same mechanism that we use for other &#39;quirks&#39; in CPU<br>
-implementations and simply filter it out before comparing the<br>
-capabilities.=C2=A0 It has the additional benefit that it&#39;s also the<b=
r>
-simplest fix.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/86003<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/<a href=3D"http://arm-cpus.in" rel=
=3D"noreferrer" target=3D"_blank">arm-cpus.in</a> (ALL_QUIRKS): Add xscale =
feature to the list<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0of bits to ignore when comparing architectures.=
<br>
-<br>
-<br>
-git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/branches/gcc-8=
-branch@261141" rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/br=
anches/gcc-8-branch@261141</a> 138bc75d-0d04-0410-961f-82ee72b054a4<br>
----<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Upstream-Status: Backport<br>
-<br>
- gcc/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<=
br>
- gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=
=3D"_blank">arm-cpus.in</a> | 4 +++-<br>
- 2 files changed, 9 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferr=
er" target=3D"_blank">arm-cpus.in</a> b/gcc/config/arm/<a href=3D"http://ar=
m-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus.in</a><br>
-index 96972a057e7..545321b0bbe 100644<br>
---- a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" tar=
get=3D"_blank">arm-cpus.in</a><br>
-+++ b/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" tar=
get=3D"_blank">arm-cpus.in</a><br>
-@@ -268,7 +268,9 @@ define fgroup DOTPROD=C2=A0 =C2=A0 =C2=A0 NEON dotprod=
<br>
- <br>
- # List of all quirk bits to strip out when comparing CPU features with<br=
>
- # architectures.<br>
--define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce quirk_armv6kz q=
uirk_cm3_ldrd<br>
-+# xscale isn&#39;t really a &#39;quirk&#39;, but it isn&#39;t an architec=
ture either and we<br>
-+# need to ignore it for matching purposes.<br>
-+define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce quirk_armv6kz q=
uirk_cm3_ldrd xscale<br>
- <br>
- # Architecture entries<br>
- # format:<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/=
gcc/gcc-8.2.inc<br>
similarity index 93%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1.inc<br>
rename to meta/recipes-devtools/gcc/gcc-8.2.inc<br>
index ebe3c24978..8503a66b07 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc<br>
@@ -2,13 +2,13 @@ require gcc-common.inc<br>
<br>
=C2=A0# Third digit in PV should be incremented after a minor release<br>
<br>
-PV =3D &quot;8.1.0&quot;<br>
+PV =3D &quot;8.2.0&quot;<br>
<br>
=C2=A0# BINV should be incremented to a revision after a minor gcc release<=
br>
<br>
-BINV =3D &quot;8.1.0&quot;<br>
+BINV =3D &quot;8.2.0&quot;<br>
<br>
-FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1=
/backport:&quot;<br>
+FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2=
/backport:&quot;<br>
<br>
=C2=A0DEPENDS =3D+ &quot;mpfr gmp libmpc zlib flex-native&quot;<br>
=C2=A0NATIVEDEPS =3D &quot;mpfr-native gmp-native libmpc-native zlib-native=
 flex-native&quot;<br>
@@ -73,10 +73,9 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-arm-PR-target-86003-b=
uild-failures-with-with-cpu-xsc.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;65f7c65818dc540b3437605026d329fc&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1d1866f992626e61349a1ccd0b8d5253816222cdc1339=
0dcfaa74b093aa2b153&quot;<br>
+SRC_URI[md5sum] =3D &quot;4ab282f414676496483b3e1793d07862&quot;<br>
+SRC_URI[sha256sum] =3D &quot;196c3c04ba2613f893283977e6011b2345d1cd1af9abe=
ac58e916b1aab3e0080&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
=C2=A0#S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/git&quot;<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FO=
R_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAG=
S_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR=
_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-direc=
tories.patch b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-dir=
ectories.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-direct=
ories.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-director=
ies.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.p=
atch b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch<b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.pa=
tch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patc=
h<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAG=
S_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSRO=
OT_CFLAGS_FOR_TARGET.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS=
_FOR_TARGET.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_F=
OR_TARGET.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.pa=
tch b/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.pat=
ch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch=
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch =
b/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch<b=
r>
rename to meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_=
PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MA=
SK_RELAX_PIC_CALLS-bit.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_P=
IC_CALLS-bit.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC=
_CALLS-bit.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.pat=
ch b/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patc=
h<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-8.2/0010-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-=
instead-of-S-and-t-oe-in-B.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-h=
ack.patch b/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-ha=
ck.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-ha=
ck.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack=
.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch=
 b/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch<=
br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch<br=
>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-A=
BI.patch b/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-AB=
I.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.2/001=
4-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKE=
R-and-UCLIBC_DYNAMIC_LINKE.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-t=
oo-long-error.patch b/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argume=
nt-list-too-long-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-to=
o-long-error.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-=
long-error.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch b/met=
a/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch b/meta/re=
cipes-devtools/gcc/gcc-8.2/0017-libtool.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-8.2/0018-g=
cc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-=
to-linker-to-support-EABI.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to=
-linker-to-support-EABI.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-8.2/001=
9-Use-the-multilib-config-files-from-B-instead-of-usin.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-fi=
les-from-B-instead-of-usin.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-8.2/002=
0-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.l=
a-which-usually-points-to-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch b/meta=
/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OS=
DIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-8.2/002=
2-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSD=
IRNAMES-and-other-multilib-o.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIR=
NAMES-and-other-multilib-o.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-heade=
rs-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-ta=
rget-gcc-headers-can-be-included.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-header=
s-can-be-included.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-=
can-be-included.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-wit=
h-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-8.2/002=
4-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with=
-disable-dependency-tracking.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-d=
isable-dependency-tracking.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-8.2/002=
5-Don-t-search-host-directory-during-relink-if-inst_pr.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-director=
y-during-relink-if-inst_pr.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-repl=
acement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-8.2/002=
6-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-repla=
cement-instead-of-hardcoding.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replace=
ment-instead-of-hardcoding.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for=
-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-suppo=
rt-for-musl-ldso.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-=
musl-ldso.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-mu=
sl-ldso.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-f=
ix-libcc1-s-install-path-and-rpath.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-inst=
all-path-and-rpath.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-instal=
l-path-and-rpath.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-=
for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sys=
root-support-for-nativesdk-gcc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-f=
or-nativesdk-gcc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for=
-nativesdk-gcc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-8.2/003=
0-Search-target-sysroot-gcc-version-specific-dirs-with.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-=
version-specific-dirs-with.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-=
and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-va=
rious-_FOR_BUILD-and-related-variables.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-a=
nd-related-variables.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and=
-related-variables.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAM=
IC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMI=
C_LINKER.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-8.2/003=
3-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-=
commandline-for-musl-targe.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-=
ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-k=
nob-to-use-ldbl-128-on-ppc.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-l=
dbl-128-on-ppc.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldb=
l-128-on-ppc.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-8.2/0035-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAG=
S-not-just-SHLIB_LDFLAGS.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-8.2/003=
6-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__c=
pu_indicator_init-instead-.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-=
musl.patch b/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-=
musl.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-m=
usl.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-mus=
l.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-=
in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-8.2/003=
8-fix-segmentation-fault-in-precompiled-header-generat.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-i=
n-precompiled-header-generat.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-=
precompiled-header-generat.patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failu=
re.patch b/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure=
.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failur=
e.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.=
patch<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-comman=
dline-options.patch b/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-s=
pe-commandline-options.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-command=
line-options.patch<br>
rename to meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandli=
ne-options.patch<br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian=
_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.1.bb</a>=
 b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.1.bb</a><=
br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_8.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_8.2.bb</a><br=
>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.1.bb</a> b=
/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_8=
.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.1.bb</a><br=
>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-initial_8.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-cross_8.1.bb</a> b/meta/recipes-de=
vtools/gcc/<a href=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-cross_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-cross_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-cross_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initi=
al_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.1.bb=
</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_8.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.2.bb</a><b=
r>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initia=
l_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.1.bb<=
/a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk-initial_=
8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-initial_8.2.bb</a=
><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.1.bb</a> b/meta/reci=
pes-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"noreferrer" =
target=3D"_blank">gcc-crosssdk_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.2.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.1.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.1.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_8.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc-runtime_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.1.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcc-sanitizers_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc-source_8.1.bb</a> b/meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc-source_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_8.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gcc-source_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.1.bb" rel=3D=
"noreferrer" target=3D"_blank">gcc_8.1.bb</a> b/meta/recipes-devtools/gcc/<=
a href=3D"http://gcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc_8.2.b=
b</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.1.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.2.bb" rel=3D"no=
referrer" target=3D"_blank">gcc_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_8.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.1.bb</a> b/meta/=
recipes-devtools/gcc/<a href=3D"http://libgcc-initial_8.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">libgcc-initial_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_8.1.bb</a> b/meta/recipes-devtools=
/gcc/<a href=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">=
libgcc_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_8.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libgcc_8.2.bb</a><br>
diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_8.1.bb=
" rel=3D"noreferrer" target=3D"_blank">libgfortran_8.1.bb</a> b/meta/recipe=
s-devtools/gcc/<a href=3D"http://libgfortran_8.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libgfortran_8.2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_8.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgfortran_8.1.bb</a><br>
rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libgfortran_8.2.bb</a><br>
-- <br>
2.18.0<br>
<br></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></blockquote></div></div>

--0000000000004ac44705723bbaeb--
