Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBC4771DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:19 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id j186so473117pge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OHDbIsiRGzADbOb86cQR8rgikugP9FtUN/XMbkzOB4Y=;
	b=lN/KezRNLNlIZyZtb9dOtOMjORO+48Y/rQBACFXHudnLIRz+wTJXrSjWBKdzrvjzqj
	kFQxsTg8hsi04WjmzvIh3cy45f1VmjWVnd6zhZIX78OK6+0XdslSirlvNaw3o4U8CkWV
	hWTGkSAWO6XGjtEqDk7DKOzstpJ756nJowSXzC7Z6vpS/DE563D5hRZUgbBqxLIlBij+
	ukKOOPOX8b5f3241wiwl2u28DVN4jiGCPXaGRm7hOj3lLZtFL/qkstRoddjK/2WrAc4j
	K8cZt9IVG3YngEI5jo3/CdFbcq3zgYHwfWhiDAF1rrnJ5U5YRhGlkh22+lCbQ0u6EhG4
	CIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OHDbIsiRGzADbOb86cQR8rgikugP9FtUN/XMbkzOB4Y=;
	b=WvMZV67JvGTBblAkOJ5rNpoFIBsmuSWMK1aleiUZC+qwjM4JtoDCT+TqNH+thMSIwL
	k9QCrq5rZY6x8d/jAxx+fhjwj0zwRno7alngFYlJKLj0UgfdPp70O9T8sAoEHazc9M9g
	FCw4lf5LK/ixWOCvLnEp4RCie1przc39MeKZCj/obvu1xtr4yIb2PYNyBxV3yMeNgSX/
	JV8GOpaHYIniLonnu445fJDla0SBvEmY/J7Ox5E5Kl2WJ34m1QSzT668LxCvGD2iKFl9
	eJvXEzqpa+MgoMl2zCa7nN991lWMaBQUQnt3L2bm6X0BJ5+T+Lrbb7qJswKbC0WDTrSW
	Qcfw==
X-Gm-Message-State: AIVw112ch4II5UDMEIk/LPGlkYgTX1RmLvsH+7FA4GVPDOFU+um8Hhno
	M3l/V+CQH/1+NqB0
X-Received: by 10.99.65.196 with SMTP id o187mr26409447pga.193.1499351600179; 
	Thu, 06 Jul 2017 07:33:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	f19sm1042906pfj.14.2017.07.06.07.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:10 -0700
Message-Id: <cover.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Subject: [PATCH 00/22] Glibc 2.26 update and musl updates
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patchset 1-10 are already proposed via kraj/hardening so ignore them here
but they are needed for rest of patches thats why its included here, literally
patch 11-22 is whats being proposed here.


The following changes since commit 2d7a58ef7a9597fde868a0582153d1f9a3007f1e:

  image.bbclass: create root symlinks in nativesdk target sysroot (2017-07-06 14:38:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Jose Perez Carranza (1):
  oeqa/sdk: Replace buildiptables for buildlzip tests

Khem Raj (21):
  gcc: Introduce a knob to configure gcc to default to PIE
  security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS
  distutils,setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
  gcc7: Enable static PIE
  gcc: Link libssp_nonshared.a only on musl targets
  sysklogd: Improve build and fix runtime crash
  libunwind: We set -fPIE in security flags now if gcc is not configured
    for default PIE
  gstreamer1.0-plugins-bad: Fix missing library with bcm egl
  security_flags.inc: Do not build gcc for powerpc with PIE defaults
  ovmf: Fix build with toolchain defaulting to PIE
  glibc: Upgrade to 2.25.90
  glibc: Drop obsoleted bits/string.h from multilibbing
  glibc: Enable obsoleted nsl
  gcc-sanitizer: Fix build with glibc 2.26
  gcc: Use ucontext_t instead of ucontext
  gcc: Fix libssh_nonshared linker specs for ppc/musl
  musl: Update to latest on master
  world-broken.inc: Remove packages which are now buildable on musl
  valgrind: tests build fixes for musl
  mpeg2dec: Fix textrels QA errors on arm
  testimage: Use the renamed buildlzip

 meta/classes/distutils-common-base.bbclass         |   2 -
 meta/classes/setuptools.bbclass                    |   2 -
 meta/classes/testimage.bbclass                     |   6 +-
 meta/conf/distro/include/security_flags.inc        |  86 ++++-------
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/conf/distro/include/world-broken.inc          |  25 ----
 .../sdk/cases/{buildiptables.py => buildlzip.py}   |   8 +-
 ...e_2.25.bb => cross-localedef-native_2.25.90.bb} |  26 ++--
 ...bc-initial_2.25.bb => glibc-initial_2.25.90.bb} |   0
 ...libc-locale_2.25.bb => glibc-locale_2.25.90.bb} |   0
 ...libc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} |   0
 meta/recipes-core/glibc/glibc-package.inc          |   2 +-
 ...bc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} |   0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |   8 +-
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |   8 +-
 ...libc-Raise-the-size-of-arrays-containing-.patch |  36 ++---
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |  13 +-
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |  44 +++---
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   8 +-
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |  30 ++--
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  30 ++--
 ...bug-1443-which-explains-what-the-patch-do.patch |  10 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   8 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  10 +-
 ...ersion-output-matching-grok-gold-s-output.patch |  44 ------
 ...configure.ac-handle-correctly-libc_cv_ro.patch} |  10 +-
 ...ibute.patch => 0013-Add-unused-attribute.patch} |   8 +-
 ...hin-the-path-sets-wrong-config-variables.patch} |  30 ++--
 ...timezone-re-written-tzselect-as-posix-sh.patch} |  12 +-
 ...ove-bash-dependency-for-nscd-init-script.patch} |  11 +-
 ...-Cross-building-and-testing-instructions.patch} |  10 +-
 ...18-eglibc-Help-bootstrap-cross-toolchain.patch} |  10 +-
 ... 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} |  10 +-
 ...020-eglibc-Resolve-__fpscr_values-on-SH4.patch} |  10 +-
 .../glibc/0020-eglibc-cherry-picked-from.patch     |  64 ---------
 ...atch => 0021-eglibc-Install-PIC-archives.patch} |  20 +--
 ...ard-port-cross-locale-generation-support.patch} |  36 ++---
 ...023-Define-DUMMY_LOCALE_T-if-not-defined.patch} |   8 +-
 ...c-Make-_dl_build_local_scope-breadth-fir.patch} |   8 +-
 ...locale-fix-hard-coded-reference-to-gcc-E.patch} |  10 +-
 .../glibc/{glibc_2.25.bb => glibc_2.25.90.bb}      |  36 ++---
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch         |  27 ++--
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   5 +-
 ...shared-to-link-commandline-for-musl-targe.patch |  87 +++++++++++
 .../gcc/gcc-7.1/0040-ssp_nonshared.patch           |  28 ----
 .../gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch   |  37 +++++
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++++++++++
 ...0-replace-struct-ucontext-with-ucontext_t.patch | 149 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +
 ...m64-Define-__THROW-if-not-already-defined.patch |  32 +++++
 ...emcheck-x86-Define-__THROW-if-not-defined.patch |  32 +++++
 ...verride-Replace-__modify_ldt-with-syscall.patch |  68 +++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +
 ...s-that-causes-a-segmentation-fault-under-.patch |  28 ++++
 ...way-for-respecting-flags-from-environment.patch |  35 +++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |   6 +-
 .../link-with-libvchostif.patch                    |  35 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 ...001-check-for-available-arm-optimizations.patch |  55 +++++++
 ...ity-of-global-symbols-used-in-ARM-specifi.patch |  63 ++++++++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb |   5 +-
 meta/recipes-support/libunwind/libunwind_1.2.bb    |   4 -
 63 files changed, 1083 insertions(+), 483 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.25.bb => cross-localedef-native_2.25.90.bb} (62%)
 rename meta/recipes-core/glibc/{glibc-initial_2.25.bb => glibc-initial_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.25.bb => glibc-locale_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
 rename meta/recipes-core/glibc/glibc/{0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0014-Add-unused-attribute.patch => 0013-Add-unused-attribute.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0015-yes-within-the-path-sets-wrong-config-variables.patch => 0014-yes-within-the-path-sets-wrong-config-variables.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0016-timezone-re-written-tzselect-as-posix-sh.patch => 0015-timezone-re-written-tzselect-as-posix-sh.patch} (81%)
 rename meta/recipes-core/glibc/glibc/{0017-Remove-bash-dependency-for-nscd-init-script.patch => 0016-Remove-bash-dependency-for-nscd-init-script.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0018-eglibc-Cross-building-and-testing-instructions.patch => 0017-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Help-bootstrap-cross-toolchain.patch => 0018-eglibc-Help-bootstrap-cross-toolchain.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0020-eglibc-Resolve-__fpscr_values-on-SH4.patch} (88%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Install-PIC-archives.patch => 0021-eglibc-Install-PIC-archives.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0024-eglibc-Forward-port-cross-locale-generation-support.patch => 0022-eglibc-Forward-port-cross-locale-generation-support.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0025-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0023-Define-DUMMY_LOCALE_T-if-not-defined.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0027-locale-fix-hard-coded-reference-to-gcc-E.patch => 0025-locale-fix-hard-coded-reference-to-gcc-E.patch} (82%)
 rename meta/recipes-core/glibc/{glibc_2.25.bb => glibc_2.25.90.bb} (80%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0048-gcc-Enable-static-PIE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch

-- 
2.13.2


