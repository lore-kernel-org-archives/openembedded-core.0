Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C824780B8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e199so8250676pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DVTQj6XTSXzmfx1prnSG28seUg5Bx7LOR2DZrIj1/BU=;
	b=gReM7YqHt8bZ73/MDCPh5G9cjOUp+ddaepTlk5ByHwkk+D0OgG/uUJ0Mj4iMvToEj+
	SD59ph8vjtiCXeCcNWTMGLpyMXN8kV5Y8sVwPb5ngmUqca7Ac+2UmSc5XGXSIWRRAS5T
	8bdwOOpwOdWfKp7AAvvQwwqYl/Q3WZfDF64ZdktRD2x/OTM/3sYUJt6bigAHHjMCrWRw
	hLnaUVuXU5to/2s6uETLIxe9xHu7UHuT891/SNPeTEgN6Aj7lzOB2+IUvkJUD92IkbDL
	uNxKQNHiy7K8C5Cl0Owxx6OqopPDdyZN6l0m476UIM3b7qCCASAYKdEzKSSMADdsH8sf
	7qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DVTQj6XTSXzmfx1prnSG28seUg5Bx7LOR2DZrIj1/BU=;
	b=pVdBHp7GFoRvsmeo2fiYc3aEbgf8zndBld5cNMiV2kA6itlb7aYFsY3u383mVpHOqM
	DC7UQTlPx/w0amWJzdSbvjobDoZq/7gOQx133/lauXwDep2kEX0vNynYYItd7A7w/u8m
	WIt4bqTrdxHpHzbutuKMz3Jso1FlxKRjIJko9zK16KDDH2swEl9uUlQxBpjjaSdpV3UM
	CO6h0n+QhyloNwSJvtoIlyK38QUBcFlWwvS1jKvajPu/QsCJgKEZrG0O1YzoVyO0iViQ
	j0IcpU7T5BCN+vMw+zLst/8NV+nR5xJEynPpZMgkYz3e99Ez/Y2bY6yTYXL4G7ycn0i6
	vbxA==
X-Gm-Message-State: AIVw112r+tKGLm5nd+2mzC6sh4AdOF0biSORTKt/GRAQmul4qjUaE/xq
	rYqOUosqSXIXeGRG
X-Received: by 10.84.217.206 with SMTP id d14mr8502646plj.121.1499520866978;
	Sat, 08 Jul 2017 06:34:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	t67sm13701181pfj.98.2017.07.08.06.34.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:18 -0700
Message-Id: <cover.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 00/10] Glibc 2.26 update and musl updates (rebased)
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:26 -0000

This patchet updates glibc to 2.25.90, a precursor to 2.26
Brings in latest from musl and removes now building packages on musl from word builds
fixes valgrind build with ptests on musl and textrel QA warnings on mpeg2dec

The following changes since commit 7dd5dfc4d56f1201110d947ce1ca3c6d64fbc7da:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (10):
  glibc: Upgrade to 2.25.90
  glibc: Drop obsoleted bits/string.h from multilibbing
  glibc: Enable obsoleted nsl
  gcc-sanitizer: Fix build with glibc 2.26
  gcc: Use ucontext_t instead of ucontext
  musl: Update to latest on master
  gcc: Fix libssh_nonshared linker specs for ppc/musl
  world-broken.inc: Remove packages which are now buildable on musl
  valgrind: tests build fixes for musl
  mpeg2dec: Fix textrels QA errors on arm

 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/conf/distro/include/world-broken.inc          |  25 ----
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
 meta/recipes-devtools/gcc/gcc-7.1.inc              |   2 +
 ...shared-to-link-commandline-for-musl-targe.patch |  55 ++++++-
 ...r-Use-stack_t-instead-of-struct-sigaltsta.patch | 160 +++++++++++++++++++++
 ...0-replace-struct-ucontext-with-ucontext_t.patch | 149 +++++++++++++++++++
 ...m64-Define-__THROW-if-not-already-defined.patch |  32 +++++
 ...emcheck-x86-Define-__THROW-if-not-defined.patch |  32 +++++
 ...verride-Replace-__modify_ldt-with-syscall.patch |  68 +++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +
 ...001-check-for-available-arm-optimizations.patch |  55 +++++++
 ...ity-of-global-symbols-used-in-ARM-specifi.patch |  63 ++++++++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb |   5 +-
 48 files changed, 852 insertions(+), 371 deletions(-)
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
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0050-replace-struct-ucontext-with-ucontext_t.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-memcheck-x86-Define-__THROW-if-not-defined.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-check-for-available-arm-optimizations.patch
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch

-- 
2.13.2


