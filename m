Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB7267727D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 08:06:53 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id y89so79097707qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7rmnPKb84rZfMFqwjh1nQB14d9Y8zt0piHUHzpz0hiM=;
	b=Ck0a0asmQzqJjsnBWEtU4JQXjbYI5ZWrfq0dvSwla3DIgpRiZCleP6lQWi02UCOdV2
	wao4uDhjUcbWze4N1cHVDIdvCNn6PlbRUl67gV0qr+ej5IgYW5C3jRhsEaZPy8pKENFi
	eH0cdkwEEK4unwWhYcrn+Zu1mzKRazd9ca8BJyKNPYa47g5mqLnCqqFjoj4RHSi+ybUJ
	o/F3u2AXDUkU1Mmv42M3frA+BmMWuC/k40n1lGxaEBZEN2IcQbHDDCUtfpQeIfm8P4q0
	gzFOJHWwbv4n9/3m6i5HciZsxDql/SPK2iWG9nDDHP/3gTmj4G9BMjwxsJMwWkAKUOX5
	TJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7rmnPKb84rZfMFqwjh1nQB14d9Y8zt0piHUHzpz0hiM=;
	b=TPYm6OgX4pjoVki6puTLA9sfcjJp+E6twVcSdN1VDOlgZ6kREjjKyjqaWOzPN4D4g+
	LYMwyZgxmrputm2Q5mhbg9S3b+uBvKdq9JGnTDOFcBWC4N2RKFVA3GjVe51icOV6thXM
	O5/T3qUuw38UbiJIjOMgv/EwuvlhCJtjKHJllofdzM8qvt4E1BqHY7+VoOwi3whzDWtO
	D5jZBOSr6TgaEYoWMrf+Noqc92o6lhdWiwgGInGslAdWbS+TWB4GG4n9CMOPcuLcG/AY
	5xzLSVoC4/2hhrV2W35iJpAFgtelFG0cRWyp7d/F6JfCjWaDk4EHGk6r3b0Izv5QJh4A
	xv8w==
X-Gm-Message-State: AG10YOTKqkVYyUgom20yyW4eXC+MqC/BCQ+ELCLWqbc1b3PzYM3J0BezFlxWUdUcMWAOxQ==
X-Received: by 10.140.129.79 with SMTP id 76mr22925717qhb.28.1455955613850;
	Sat, 20 Feb 2016 00:06:53 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	v84sm1367763qkl.15.2016.02.20.00.06.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 00:06:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org 
Date: Sat, 20 Feb 2016 08:06:45 +0000
Message-Id: <cover.1455955403.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Upgrade glibc 2.23
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
X-List-Received-Date: Sat, 20 Feb 2016 08:06:54 -0000

Glibc 2.23 has been cut out.
Additional fixes for packages failing due
to PIE flags, cleans up the world build

The following changes since commit 84065e9b33e6d401e4e50436665838be2d0267ad:

  cml1/sstate: Fix missing getVar parameter (2016-02-19 15:32:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (3):
  glibc: Upgrade to 2.23
  pseudo: Fix build when security flags are enabled
  libnewt: Fix build with PIE flags

 meta/conf/distro/include/tcmode-default.inc        |     4 +-
 ...tive_2.22.bb => cross-localedef-native_2.23.bb} |    23 +-
 meta/recipes-core/glibc/glibc-initial.inc          |     1 -
 ...glibc-initial_2.22.bb => glibc-initial_2.23.bb} |     2 -
 .../{glibc-locale_2.22.bb => glibc-locale_2.23.bb} |     0
 .../{glibc-mtrace_2.22.bb => glibc-mtrace_2.23.bb} |     0
 meta/recipes-core/glibc/glibc-options.inc          |   162 -
 ...glibc-scripts_2.22.bb => glibc-scripts_2.23.bb} |     0
 meta/recipes-core/glibc/glibc.inc                  |    17 +-
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |    23 +-
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |    10 +-
 ...libc-Raise-the-size-of-arrays-containing-.patch |    16 +-
 ...tps-sourceware.org-ml-libc-ports-2007-12-.patch |    34 -
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |    32 +
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |     6 +-
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |     6 +-
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |     6 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |     6 +-
 ...bug-1443-which-explains-what-the-patch-do.patch |     6 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |     8 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |     6 +-
 ...ersion-output-matching-grok-gold-s-output.patch |    14 +-
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |     8 +-
 .../glibc/glibc/0014-Add-unused-attribute.patch    |     6 +-
 ...ing-SSE-also-make-sure-that-fpmath-is-not.patch |    32 -
 ...hin-the-path-sets-wrong-config-variables.patch} |    20 +-
 ...timezone-re-written-tzselect-as-posix-sh.patch} |    10 +-
 ...ove-bash-dependency-for-nscd-init-script.patch} |    16 +-
 ...c-Cross-building-and-testing-instructions.patch |     6 +-
 ...g-Eglibc-option-group-infrastructure-to-g.patch |  1436 --
 ...19-eglibc-Help-bootstrap-cross-toolchain.patch} |     8 +-
 ....patch => 0020-eglibc-cherry-picked-from.patch} |    36 +-
 ... 0021-eglibc-Clear-cache-lines-on-ppc8xx.patch} |    28 +-
 ...022-eglibc-Resolve-__fpscr_values-on-SH4.patch} |     6 +-
 ...atch => 0023-eglibc-Install-PIC-archives.patch} |    20 +-
 ...orward-port-eglibc-options-groups-support.patch | 16842 -------------------
 ...ward-port-cross-locale-generation-support.patch |   566 +
 ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch |    48 +
 ...ebug_mask-is-controlled-by-__OPTION_EGLIB.patch |   556 -
 ...option-groups-Conditionally-exclude-c-tes.patch |   145 -
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |    84 -
 .../glibc/0029-fix-getmntent-empty-lines.patch     |    40 -
 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch  |   642 -
 ...ove-incorrect-STRDIFF-based-optimization-.patch |   323 -
 .../glibc/glibc/use_64bit_atomics.patch            |    24 -
 .../glibc/{glibc_2.22.bb => glibc_2.23.bb}         |    40 +-
 meta/recipes-devtools/gcc/gcc-5.3.inc              |     2 +-
 .../files/0001-configure-Prune-PIE-flags.patch     |    44 +
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       |     1 +
 meta/recipes-extended/newt/files/pie-flags.patch   |    36 +
 meta/recipes-extended/newt/libnewt_0.52.18.bb      |     2 +
 51 files changed, 899 insertions(+), 20510 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.22.bb => cross-localedef-native_2.23.bb} (60%)
 rename meta/recipes-core/glibc/{glibc-initial_2.22.bb => glibc-initial_2.23.bb} (85%)
 rename meta/recipes-core/glibc/{glibc-locale_2.22.bb => glibc-locale_2.23.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.22.bb => glibc-mtrace_2.23.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc-options.inc
 rename meta/recipes-core/glibc/{glibc-scripts_2.22.bb => glibc-scripts_2.23.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
 rename meta/recipes-core/glibc/glibc/{0016-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0017-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (84%)
 rename meta/recipes-core/glibc/glibc/{nscd-no-bash.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (72%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (95%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch => 0020-eglibc-cherry-picked-from.patch} (70%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0021-eglibc-Clear-cache-lines-on-ppc8xx.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0022-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0025-eglibc-Install-PIC-archives.patch => 0023-eglibc-Install-PIC-archives.patch} (90%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-eglibc-options-groups-support.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0025-eglibc-Forward-port-cross-locale-generation-support.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-7547.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
 rename meta/recipes-core/glibc/{glibc_2.22.bb => glibc_2.23.bb} (72%)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
 create mode 100644 meta/recipes-extended/newt/files/pie-flags.patch

-- 
1.8.3.1


