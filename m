Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF6F578763
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 22:40:56 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id q17so2441520pll.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 14:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=A/lk4BEk92Y5xyDVt+xPZrh5TA4X+44X/If9HL7IX9E=;
	b=Ne3jvmwkes6ingPtzVG6JGmxhVl7m1i6EoNj8LFWulZHwmgICEIFSsXAydADMkRhxz
	9dcanHzwuIT4i7QCR7ZD8FkoKvQy0oRDaVoIfM6XlLfy2UBuztNP+YUCYwoOdED4b3Hj
	vWwct+9y5UxjF02/gyz9R149gjcFm8kc6Bm8eKODPE9h4bcFLlUeS6j8k1ygCTgwyz0u
	LWfjwUwtZsGY10CdLQPLVZDOHspPwpfrw5KRBLehqkpX5LvjvuI/YKlD6YXoPTkHYfno
	T5ZdYllOoa1BaCVbQss81gzLCZkX69mQOBRm8QOPcq+ur0+xd5RqkdTB43m/AFgN4CIj
	XP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A/lk4BEk92Y5xyDVt+xPZrh5TA4X+44X/If9HL7IX9E=;
	b=GLXuusFgw5ki9LFELzSAkvbWhTMfcyYfLqJmeIdTKlfFqPgEgReSqEptM2SHPgpbjD
	cCBB6n9PXTjPEai/lGaUl8XsIXyBl9k2YkkBr8+tyAtZ5sitPceLJb70eTA0EIbQ9Nt4
	PFlNeNkaJEGWYxJN/zV30VBN+CfmfqbsUzht+/lPJQTTbIIxV8dbQGGF0efkQTg4SPCd
	KK1YDHdH7omXvtalYDF2YXjvNdkcVyA8wgQnHbHhMxP7UCmlPlYsRv5ZhKNIWRqy0eGf
	EgsnbxAZ0MiIcvW40z7NGqXVKcrOr3GBuYGnOrGxm4CKydO43SkpNwZbBo3jpcV8UHfb
	jWng==
X-Gm-Message-State: AKwxytcr2WP4TpcwpOtUvTgpWp1Ta6UxEfyvDvQXtkX+BVmVD8Z79DNU
	ewKAAuVe41AHqy7o0Afh8oYWVQ==
X-Google-Smtp-Source: AH8x227Jl7fd2odsg+ldFkRWYl86RchmgmaFZPn8R/4h9BhpFc6EJu5mICoHmvEvtgiCry3ODkVWgQ==
X-Received: by 2002:a17:902:46:: with SMTP id
	64-v6mr33499258pla.341.1517524857781; 
	Thu, 01 Feb 2018 14:40:57 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::6dba])
	by smtp.gmail.com with ESMTPSA id
	s14sm665991pfa.120.2018.02.01.14.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 14:40:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:40:48 -0800
Message-Id: <cover.1517524576.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 0/2] Upgrade glibc 2.27
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
X-List-Received-Date: Thu, 01 Feb 2018 22:40:56 -0000

qemu patch is needed for it to compile with glibc 2.27

The following changes since commit a0988c3374e964170d1d24fc230306b887432d31:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:12 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/glibc-2.27
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.27

Khem Raj (1):
  glibc: Upgrade to 2.27 release

Ross Burton (1):
  qemu: fix memfd_create with glibc 2.27

 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 ...tive_2.26.bb => cross-localedef-native_2.27.bb} |   4 +-
 ...glibc-initial_2.26.bb => glibc-initial_2.27.bb} |   0
 .../{glibc-locale_2.26.bb => glibc-locale_2.27.bb} |   0
 .../{glibc-mtrace_2.26.bb => glibc-mtrace_2.27.bb} |   0
 ...glibc-scripts_2.26.bb => glibc-scripts_2.27.bb} |   0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |  12 +-
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...libc-Raise-the-size-of-arrays-containing-.patch |  28 ++--
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |   8 +-
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |   6 +-
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   8 +-
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |   6 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |   6 +-
 ...bug-1443-which-explains-what-the-patch-do.patch |  10 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |  10 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |   6 +-
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |   8 +-
 .../glibc/glibc/0013-Add-unused-attribute.patch    |   8 +-
 ...thin-the-path-sets-wrong-config-variables.patch |  10 +-
 ...-timezone-re-written-tzselect-as-posix-sh.patch |   8 +-
 ...move-bash-dependency-for-nscd-init-script.patch |   6 +-
 ...c-Cross-building-and-testing-instructions.patch |   6 +-
 ...018-eglibc-Help-bootstrap-cross-toolchain.patch |   8 +-
 .../0019-eglibc-Clear-cache-lines-on-ppc8xx.patch  |  10 +-
 ...0020-eglibc-Resolve-__fpscr_values-on-SH4.patch |   8 +-
 .../glibc/0021-eglibc-Install-PIC-archives.patch   |  20 +--
 ...ward-port-cross-locale-generation-support.patch |  90 +++++------
 ...0023-Define-DUMMY_LOCALE_T-if-not-defined.patch |   8 +-
 ....c-Make-_dl_build_local_scope-breadth-fir.patch |  10 +-
 ...-locale-fix-hard-coded-reference-to-gcc-E.patch |   6 +-
 ...6-reset-dl_load_write_lock-after-forking.patch} |  29 ++--
 ...o-lock-before-switching-to-malloc_atfork.patch} |  27 +++-
 ...loc-add-missing-arena-lock-in-malloc-info.patch | 172 ---------------------
 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch |  65 --------
 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch | 151 ------------------
 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch |  53 -------
 .../glibc/{glibc_2.26.bb => glibc_2.27.bb}         |  14 +-
 meta/recipes-devtools/qemu/qemu/memfd.patch        |  57 +++++++
 meta/recipes-devtools/qemu/qemu_2.11.0.bb          |   2 +-
 40 files changed, 258 insertions(+), 634 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.26.bb => cross-localedef-native_2.27.bb} (93%)
 rename meta/recipes-core/glibc/{glibc-initial_2.26.bb => glibc-initial_2.27.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.26.bb => glibc-locale_2.27.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.26.bb => glibc-mtrace_2.27.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.26.bb => glibc-scripts_2.27.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0027-glibc-reset-dl-load-write-lock-after-forking.patch => 0026-reset-dl_load_write_lock-after-forking.patch} (63%)
 rename meta/recipes-core/glibc/glibc/{0028-Bug-4578-add-ld.so-lock-while-fork.patch => 0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch} (76%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-15671.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-17426.patch
 rename meta/recipes-core/glibc/{glibc_2.26.bb => glibc_2.27.bb} (89%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch

-- 
2.16.1


