Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1B49745BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a14-v6so44682pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZCk473xsFr/3JSk2BA4JfLewfZmVCZqOQc0zzthfu14=;
	b=ZzM8eDr9B0z4/WQzC4zObZJDH6vRqFo2KRkszpjF8ybB+kSUVD5cQ46GWd5ZC7BeZt
	wNOZ0KygZ3BQe1oqYxgeYbNjD76NnR4uwanxoDdFoR93Msf93aT3OL0x9m91SNZTtXm6
	bPMqOlsM0HY85FRBbg9m2c1vhRl7/SYo94lrO/16qSeT1/EuxTv3bVyKU1kBvVJUiO/Y
	/B1gOca7QmHEs+Sp3OTkaRWfpvHvWhuQ7TeBQiYTxmepqmvmEyNsG1/hooKdO9AwS5yT
	BfoLXdcF9OPp5RwPeSvEhMmWMo3IyEs2l/58sQwLVc9EvKpHiMpvUCfUunxri7bMV6Fa
	MDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZCk473xsFr/3JSk2BA4JfLewfZmVCZqOQc0zzthfu14=;
	b=UfWX9DLFl22uohXrdN9Vbs7DSmYxZWEOK1DMy7R1XCe0fQmN258US3vkdytpOnCrBI
	ta1L1IvFX068XPN1bGmrgG6BAGXNCFbh0LD/x2t+PcfMGWeJ0CPEmASMCs7HiQs0c4/L
	YMOpxny6RlJyeiMvE/c0+V0zmIgWeGCt3YJJDkCjyLyAawo93khd7LnNPcCsR98LW5YU
	vV1aMqX+gONXx7UOhteseRnQLPlC/P/eBdlShZDdpIjI3TOpblrTV6EoxcPGdIbZzhBr
	4h93aGYf7Fn/Gkd7GU1yT0lme6Xm5mCzp9IPZzvUFUBje1SiW82NUorXlodSBcanGMEW
	BblQ==
X-Gm-Message-State: AOUpUlFKg5WMwHV6KcJGPORdrIUCbqCCZuonYmHJLSne9dXGqQV0PcSV
	/edHEl5TRcFm5l2H7aHPEQx55dSS
X-Google-Smtp-Source: AAOMgpeqYx7aFPY8yHfKNXXu9f0PtZaYHVQ7mYZ4KLmpUbYrJW+0Oe/Ct9XFN7KC1pgAd1hOz8HtSg==
X-Received: by 2002:a62:cd82:: with SMTP id
	o124-v6mr4466996pfg.206.1533596231196; 
	Mon, 06 Aug 2018 15:57:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	75-v6sm24850704pfr.115.2018.08.06.15.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:02 -0700
Message-Id: <cover.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2 00/18] Update to glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:10 -0000

There are few changes which results in fixing gnulib pieces and some header includes
for statx

v2:

Fix sysvinit
Make libxcrypt available for target and provide virtual/crypt for glibc
Fix cross localedef on glibc 2.28
Add missing dependencies on virtual/crypt which were otherwise being met by libc so far
Update file to latest release to get it building with glibc 2.28

The following changes since commit 1c4d9f46d5d94ea15d0c0d68c412ec05b9f51820:

  machine: remove kernel-modules from RRECOMMENDS (2018-08-02 09:30:06 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.28
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.28

Khem Raj (18):
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
  glibc: Drop packaging libcrypt from 2.28+ onwards
  file: Update to 5.34
  Disable crypt support in glibc
  libxcrypt: Provide virtual/crypt for target and native as well
  libxcrypt: Upgrade to 4.1.1
  cross-localedef-native: Update to build with glibc 2.28
  ppp,libpam: Add missing dep on virtual/crypt
  sysvinit: Fix build with glibc 2.28 + libxcrypt

 meta/conf/distro/include/tclibc-musl.inc      |   1 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       |  84 ++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   5 +-
 ...2.27.bb => cross-localedef-native_2.28.bb} |  20 +-
 ...-initial_2.27.bb => glibc-initial_2.28.bb} |   0
 ...bc-locale_2.27.bb => glibc-locale_2.28.bb} |   0
 ...bc-mtrace_2.27.bb => glibc-mtrace_2.28.bb} |   0
 meta/recipes-core/glibc/glibc-package.inc     |   2 +-
 ...-scripts_2.27.bb => glibc-scripts_2.28.bb} |   0
 meta/recipes-core/glibc/glibc.inc             |   4 +-
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
 .../glibc/{glibc_2.27.bb => glibc_2.28.bb}    |  47 +-
 ...{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb} |  11 +-
 ...-whether-struct-statx-is-defined-in-.patch | 109 +++++
 meta/recipes-core/systemd/systemd_239.bb      |   1 +
 ...acros.h-for-major-minor-defines-in-g.patch |  71 +++
 .../recipes-core/sysvinit/sysvinit_2.88dsf.bb |   3 +-
 .../recipes-devtools/bison/bison/gnulib.patch |  21 +
 meta/recipes-devtools/bison/bison_3.0.4.bb    |   1 +
 ...ssing-default-value-for-BOOTLOG_DEST.patch |  30 --
 .../bootchart2/bootchart2_0.14.8.bb           |   4 +-
 .../file/file/CVE-2018-10360.patch            |  32 --
 .../file/file/fix-bogus-magic.patch           |  32 --
 .../file/{file_5.33.bb => file_5.34.bb}       |   4 +-
 meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
 .../m4-1.4.18-glibc-change-work-around.patch  | 129 ++++++
 ...001-tests-fix-build-with-fresh-glibc.patch |  42 ++
 meta/recipes-devtools/strace/strace_4.23.bb   |   1 +
 .../blktool/blktool-gnulib-makedev.patch      |  23 +
 meta/recipes-extended/blktool/blktool_4-7.bb  |   1 +
 .../findutils-4.6.0-gnulib-fflush.patch       | 140 ++++++
 .../findutils-4.6.0-gnulib-makedev.patch      |  78 ++++
 .../findutils/findutils_4.6.0.bb              |   2 +
 .../gzip/gzip-1.9/gnulib.patch                | 189 ++++++++
 meta/recipes-extended/gzip/gzip_1.9.bb        |   4 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb     |   2 +-
 71 files changed, 1157 insertions(+), 1207 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
 rename meta/recipes-core/glibc/{cross-localedef-native_2.27.bb => cross-localedef-native_2.28.bb} (67%)
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
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb} (70%)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Fixed-Missing-default-value-for-BOOTLOG_DEST.patch
 delete mode 100644 meta/recipes-devtools/file/file/CVE-2018-10360.patch
 delete mode 100644 meta/recipes-devtools/file/file/fix-bogus-magic.patch
 rename meta/recipes-devtools/file/{file_5.33.bb => file_5.34.bb} (91%)
 create mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-fflush.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/findutils-4.6.0-gnulib-makedev.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch

-- 
2.18.0


