Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C988783DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:06:57 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f14-v6so4082002pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rQ6dqDEb1WLlCRF3BijFDPA5G8f3j6b6pnTAWvOpj/8=;
	b=ZlybblqzN1GDyfl6OCeic5FyjjyaAeX2HIURdpqACkkBmf8gCbwrVAjqhZwE4fT8bC
	hvfuxrdFIs4X7bsYdmFRx3qMqfOAkFnxtWrKUkrBFl+cDNa3pac5fLx9Cr/V1x6OTrcl
	6/xfBQdmPPr9cAw382KTtUSK9u9QTQHThGYPIxVkhhknXEvvEJTLS6fk+GIvmESqdc1s
	O6BKdR+5jlywKH8GhnFISVfMupS0XeCM3Cn9ZWA9YEeXR7hqWPl/hye+M51SqyPSjrow
	/HPIqeAoQUF88cvFOunWpuZbKYSLV1d1OvO3VS8jDT57OE6SUd82JIcznei90k5fsOED
	29Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rQ6dqDEb1WLlCRF3BijFDPA5G8f3j6b6pnTAWvOpj/8=;
	b=Xvhz3aNwzdZxtf+vCsQIlOBUABv5jOb5IdZupd6E7N+XVZv0sY/n7yE6FQb7SNuYSG
	BxaxXsHrqTO/FskjlT5JHw86+GygjMVYnQGkFtp1KDGprUty2qTj6jQ3+CkpNNfM6YwU
	AQhrXJsM6Fq3Yc/vGY3wapxrggiRrmZfpkoVfbnVGXbBgawI+iYsR/F87nezi6mpIHmR
	gt4+CBSXSxcOWAdKir6dG0ZdJT0scQ2L73X498ZcSK2yQ2mfKrI/8lzjh2linWjciOnu
	x8BBs1phtP0H8L0FAiZmPCv1lnSy/2DcYrZaTuJyFvj2jW6n6wX/qi6+648O4kL6+HxM
	7dIA==
X-Gm-Message-State: AOUpUlFej7ph+RR8cagXtogXcCfcDLwM4dIlJHgGtf8wsTD+8QdpTDur
	aigk473ZE3cFYtekf0jDVRr0eHcy
X-Google-Smtp-Source: AAOMgpdrLII9zf8ihH8781KDZEdLX2zN2wRdAW4ADBMic7xfkcipQXuhhtuUoQ2kT7tqbvrSpdEzZQ==
X-Received: by 2002:a62:455b:: with SMTP id
	s88-v6mr11126251pfa.203.1533434817790; 
	Sat, 04 Aug 2018 19:06:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	86-v6sm13027147pfh.0.2018.08.04.19.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:06:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:06:48 -0700
Message-Id: <cover.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 00/10] Update to glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 02:06:57 -0000

There are few changes which results in fixing gnulib pieces and some header includes
for statx

The following changes since commit 1c4d9f46d5d94ea15d0c0d68c412ec05b9f51820:

  machine: remove kernel-modules from RRECOMMENDS (2018-08-02 09:30:06 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.28
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.28

Khem Raj (10):
  glibc: Upgrade to 2.28
  systemd: Detect if statx struct is defined in sys/stat.h
  m4: Workaround gnulib's fseeko.c implementation
  findutils: Fix build with glibc 2.28
  bootchart2: Update to master-tip
  gzip: Fix build with glibc 2.28
  bison: Fix build break with glibc 2.28
  strace: Fix build with glibc 2.28
  blktool: Fix build with glibc 2.28
  ppp: Use openssl for the DES instead of the libcrypt / glibc

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       |  84 ++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   5 +-
 ...2.27.bb => cross-localedef-native_2.28.bb} |  18 +-
 ...-initial_2.27.bb => glibc-initial_2.28.bb} |   0
 ...bc-locale_2.27.bb => glibc-locale_2.28.bb} |   0
 ...bc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} |   0
 ...-scripts_2.27.bb => glibc-scripts_2.28.bb} |   0
 ...Look-for-host-system-ld.so.cache-as-.patch |  12 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...Raise-the-size-of-arrays-containing-.patch |  18 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   6 +-
 ...ake-relocatable-install-for-locales.patch} |  45 +-
 ...500-e6500-603e-fsqrt-implementation.patch} |  44 +-
 ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   6 +-
 ...ndefined-reference-to-__sqrt_finite.patch} |   6 +-
 ...are-now-inline-functions-and-call-o.patch} |   6 +-
 ...43-which-explains-what-the-patch-do.patch} |   8 +-
 ...-err-tab.pl-with-specific-dirs-in-S.patch} |   6 +-
 ...are-now-inline-functions-and-call-o.patch} |   6 +-
 ...gure.ac-handle-correctly-libc_cv_ro.patch} |   6 +-
 ....patch => 0014-Add-unused-attribute.patch} |   6 +-
 ...he-path-sets-wrong-config-variables.patch} |   6 +-
 ...one-re-written-tzselect-as-posix-sh.patch} |   6 +-
 ...ash-dependency-for-nscd-init-script.patch} |   6 +-
 ...s-building-and-testing-instructions.patch} |  10 +-
 ...libc-Help-bootstrap-cross-toolchain.patch} |  12 +-
 ...-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   6 +-
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   6 +-
 ...port-cross-locale-generation-support.patch |  28 +-
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
 ...ke-_dl_build_local_scope-breadth-fir.patch |  10 +-
 ...le-fix-hard-coded-reference-to-gcc-E.patch |   6 +-
 ...set-dl_load_write_lock-after-forking.patch |  14 +-
 ...ck-before-switching-to-malloc_atfork.patch |  30 +-
 ...sts.h-enum-definition-for-TRAP_HWBKP.patch |  14 +-
 ...with-memccpy-to-fix-Wstringop-trunca.patch |  40 --
 ...archive-uses-a-hard-coded-locale-pa.patch} |  23 +-
 ...t-no-lines-in-bison-generated-files.patch} |  17 +-
 .../0031-nativesdk-deprecate-libcrypt.patch   | 419 ------------------
 .../glibc/glibc/CVE-2017-18269.patch          | 178 --------
 .../glibc/glibc/CVE-2018-11236.patch          | 164 -------
 .../glibc/glibc/CVE-2018-11237.patch          |  82 ----
 .../glibc/{glibc_2.27.bb => glibc_2.28.bb}    |  46 +-
 ...-whether-struct-statx-is-defined-in-.patch | 109 +++++
 meta/recipes-core/systemd/systemd_239.bb      |   1 +
 .../recipes-devtools/bison/bison/gnulib.patch |  21 +
 meta/recipes-devtools/bison/bison_3.0.4.bb    |   1 +
 ...ssing-default-value-for-BOOTLOG_DEST.patch |  30 --
 .../bootchart2/bootchart2_0.14.8.bb           |   4 +-
 meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
 .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++
 .../0001-tests-Include-linux-stat.h.patch     |  76 ++++
 meta/recipes-devtools/strace/strace_4.23.bb   |   1 +
 .../blktool/blktool-gnulib-makedev.patch      |  23 +
 meta/recipes-extended/blktool/blktool_4-7.bb  |   1 +
 .../findutils-4.6.0-gnulib-fflush.patch       | 140 ++++++
 .../findutils-4.6.0-gnulib-makedev.patch      |  78 ++++
 .../findutils/findutils_4.6.0.bb              |   2 +
 .../gzip/gzip-1.9/gnulib.patch                | 189 ++++++++
 meta/recipes-extended/gzip/gzip_1.9.bb        |   4 +-
 61 files changed, 1108 insertions(+), 1125 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
 rename meta/recipes-core/glibc/{cross-localedef-native_2.27.bb => cross-localedef-native_2.28.bb} (70%)
 rename meta/recipes-core/glibc/{glibc-initial_2.27.bb => glibc-initial_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.27.bb => glibc-locale_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.27.bb => glibc-scripts_2.28.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{relocate-locales.patch => 0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch => 0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (85%)
 rename meta/recipes-core/glibc/glibc/{0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0013-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (86%)
 rename meta/recipes-core/glibc/glibc/{0014-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0015-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0016-Remove-bash-dependency-for-nscd-init-script.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0017-eglibc-Cross-building-and-testing-instructions.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0018-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (91%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0020-eglibc-Clear-cache-lines-on-ppc8xx.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0021-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch
 rename meta/recipes-core/glibc/glibc/{archive-path.patch => 0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (69%)
 rename meta/recipes-core/glibc/glibc/{0030-plural_c_no_preprocessor_lines.patch => 0030-intl-Emit-no-lines-in-bison-generated-files.patch} (59%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-18269.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11236.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
 rename meta/recipes-core/glibc/{glibc_2.27.bb => glibc_2.28.bb} (72%)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
 create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch

-- 
2.18.0


