Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1464778875
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:20 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id u11-v6so1300230plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dpI+O/sotf2R7PnLlg5s64UWMOG/19jiuxwGiNSzAMg=;
	b=gTKpwBFpEg5dGzmH2OIr4zT+jxcYRFVYxub/DzWtdnCG13shw9fmwcFfgl83kfk3Xc
	qoINh7xo8+gTcCJh+G/LIPXHvHvWSf9vxJTtgLftkkLB1S1NN/EAus/SG0F+XezHCLti
	bCqHS0cbGulFH3PFk1HIpIGocs9fC5uozkP83A5fz7WjNSvcgjd5FGeiIhi+zGzLMCf8
	UzKKx94uPqwiV0vcKerMUAzOQ/x6Rp0n4IGT/tb+7QDYU7IZXACDa56kHZvJm8A+6M+m
	4foU5n5JScMiVnyfZQKrokEA270zU+fuCh6IHeYnSYDv/loIHYLO96QcSpag9QC5ehfh
	CROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dpI+O/sotf2R7PnLlg5s64UWMOG/19jiuxwGiNSzAMg=;
	b=j492wFGcOuUT2e9F/cdDVcp/+vLvUz11Sa9fF2RDO3NixR8ZKjUmpl6MT9t4/qAW31
	QEYawo1lqAkzUXTFYKV4INAjUzCy4jPeQeyqaHywtPcH45rN4h0srj1wX+xFvtLaEzqd
	ek+cMtREYO52BPGAa1i8+Rp8q3CFDgCX7xAtfQ97MNW8etIaqDXFSjszCHKdUG/mZm37
	z/h00dy8UgqbjmiqDhlFHZ1HONAx8jpWDusx0SW2GHGCvG5YI0KwuNK+HIPgsDFTpP6B
	KZeYG9HH4428eMagqsyUETHeljQk5EhnyS9GRh4kY6LewGE1II+ADM8b3Ae+gB98Wrb3
	eF/g==
X-Gm-Message-State: AOUpUlFt3rI1rXRPhNnEH7873trc94usSizdghg2cIplaL//ESBqmC9N
	Rtz+5cCAGZrA+aNzAvlX0ktdGpdE
X-Google-Smtp-Source: AA+uWPxitOAsOLSBxJvcyCYpizu6aV4sp/sd+0If+ivbHPJSzZiEJ0Qxki+OZ6zTtBri1k7PwdsxEA==
X-Received: by 2002:a17:902:d706:: with SMTP id
	w6-v6mr3348213ply.158.1533747861519; 
	Wed, 08 Aug 2018 10:04:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	e126-v6sm10348945pfg.31.2018.08.08.10.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:06 -0700
Message-Id: <cover.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V3 0/8] Update to glibc 2.28
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:21 -0000

v3:

Rebase on top of latest master
squash patches disabling crypt support in glibc

v2:

Fix sysvinit
Make libxcrypt available for target and provide virtual/crypt for glibc
Fix cross localedef on glibc 2.28
Add missing dependencies on virtual/crypt which were otherwise being met by libc so far
Update file to latest release to get it building with glibc 2.28

The following changes since commit 596f76029ccb6f87c3b049552bd08f5034c41d9c:

  sstate: Add sstate usage summary to the build (2018-08-08 10:51:28 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.28
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.28

Khem Raj (8):
  glibc: Upgrade to 2.28
  cross-localedef-native: Update to build with glibc 2.28
  libxcrypt: Provide virtual/crypt for target and native as well
  libxcrypt: Upgrade to 4.1.1
  glibc: Disable crypt support in glibc
  ppp: Use openssl for the DES instead of the libcrypt / glibc
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
 ...acros.h-for-major-minor-defines-in-g.patch |  71 +++
 .../recipes-core/sysvinit/sysvinit_2.88dsf.bb |   3 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb     |   2 +-
 51 files changed, 413 insertions(+), 1107 deletions(-)
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
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch

-- 
2.18.0


