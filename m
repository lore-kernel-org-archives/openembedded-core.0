Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1B78605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y26so3722911pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M6OKeYVDu3cK8IvIJmGqvm//Nb1SBfIEaqXRW4cCqyk=;
	b=EKI4okrXhPM5eiH3fTahXnC8+Oe2ujg24x74LurTKNSeGgPyTpm4lE7ZFwTUHyNgwY
	RNK28xwCUknjLVOIRr2oUnY755f68OP4Zgc8vM0Z1XFLtA6DjW1v0hZCVKdV7JqR92Ec
	WMHcjFll8TZiAAGxMzkbg6PPNzdv/Zote1+0c68kRK+60zNyZEtvnUjiH87uyH+nYumQ
	fKzoXH46ZuCkgcpr+f01Vv9X0H4A7i3XKdWHFOM/MpY/WMTokoymJcvv/EmkY/PYeEQK
	q7OorWJ4FYtiuRLCt9MxX3lTR5YMUWezPvzd7yWXKyEmF+QH5gHkoq113gzr5Kb4GnU4
	B39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M6OKeYVDu3cK8IvIJmGqvm//Nb1SBfIEaqXRW4cCqyk=;
	b=N/QZgzN92j6DxlYKy6hSP9IGUskp64OO2jpg7PUmb5mmIiYJ4a/Tu3jNLVWSvYaQaj
	be40VMbb0u9w9XiIFmuEVIhcteLl68FOlJ8UPSuEHIJjAKWtobElXSdHrIrJwpstJVx7
	QHm7SY7+JGKDtQNjmKw6ctpQQunQ0xrYc0vDz//LYa9mQ1T7mwJuvTL1VcNNhLsm24WK
	qdFe9YXM7T6aZodnRcwGA6koTzBzHvV8l35yucVcDnNFrPGcmWxcBc3+OCLA+TgYqcbk
	7RXyq4v7nKVOazDGtDQP4o3mff4SXTSc5SZ76d65IcZyuRqyltyPLxurVbKZMxjCLosW
	5Jpw==
X-Gm-Message-State: AKwxyteTVBFf/YXqnlwNB9NvhPZCNzlCPPgRHJvQze/uIJTjmZ6u6bvD
	t8bZ6y5LbV1coji2wr4ng9tqBw==
X-Google-Smtp-Source: AH8x224BFeg9bnxdFGaZcyXaBZkg0qjTD4sB6iYzYir2bjWP8qY+q31KhMofZuO/XdfKhuIKUv1i9w==
X-Received: by 10.101.93.142 with SMTP id f14mr14124166pgt.82.1517196436760;
	Sun, 28 Jan 2018 19:27:16 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u135sm16176340pgc.84.2018.01.28.19.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:07 -0800
Message-Id: <cover.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Subject: [PATCH 0/8] Update to binutils 2.30, glibc 2.27 initiated fixes, musl update
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This pull contain

- binutils upgrade to 2.30
- musl update
- Recipe fixes which will be needed for glibc 2.27
- Drop redundant gcc patch

The following changes since commit a4c1ede6876ad6b84ab2b3bece14bf0afdc9d6b7:

  gcc: Upgrade 7.2 -> 7.3 (2018-01-26 23:24:45 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Daniel Díaz (1):
  perl: Undefine d_libm_lib_version.

Huang Qiyu (1):
  e2fsprogs: 1.43.7 -> 1.43.8

Khem Raj (6):
  gcc-7.3: Drop upstreamed musl cpuinfo patch
  make: Backport fixes to not assume glibc internal glob implementation
  systemd: Fix build with glibc 2.27
  pulseaudio: Fix build with glibc 2.27
  musl: Update to latest master
  binutils: Upgrade to 2.30 release

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 meta/recipes-core/musl/musl_git.bb                 |  2 +-
 ....c-Change-the-default-device-timeout-to-2.patch |  7 +-
 ...update-header-file-to-detect-memfd_create.patch | 28 +++++++
 ...c-Check-if-memfd_create-is-already-define.patch | 27 +++++++
 .../systemd/0003-fileio-include-sys-mman.h.patch   | 26 +++++++
 meta/recipes-core/systemd/systemd_234.bb           |  3 +
 .../{binutils-2.29.1.inc => binutils-2.30.inc}     |  2 +-
 ...n_2.29.1.bb => binutils-cross-canadian_2.30.bb} |  0
 ...tils-cross_2.29.1.bb => binutils-cross_2.30.bb} |  0
 ...rosssdk_2.29.1.bb => binutils-crosssdk_2.30.bb} |  0
 ...nutils-crosssdk-Generate-relocatable-SDKs.patch | 14 ++--
 ...oss-Do-not-generate-linker-script-directo.patch |  6 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch | 14 ++--
 .../0004-Point-scripts-location-to-libdir.patch    |  8 +-
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch | 10 +--
 .../binutils/binutils/0006-Use-libtool-2.4.patch   | 66 +++++++----------
 ...7-Add-the-armv5e-architecture-to-binutils.patch |  8 +-
 ...he-distro-compiler-point-to-the-wrong-ins.patch |  6 +-
 ...es-of-system-directories-when-cross-linki.patch | 24 +++---
 ...-rpath-in-libtool-when-sysroot-is-enabled.patch |  4 +-
 ...Change-default-emulation-for-mips64-linux.patch | 14 ++--
 .../0012-Add-support-for-Netlogic-XLP.patch        | 70 +++++++++---------
 ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 10 +--
 .../binutils/0014-Detect-64-bit-MIPS-targets.patch |  6 +-
 .../0015-sync-with-OE-libtool-changes.patch        |  4 +-
 .../{binutils_2.29.1.bb => binutils_2.30.bb}       |  0
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch | 40 ++++++++++
 ...s-fix-missing-check-for-permission-denied.patch | 10 ++-
 .../{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb}   |  5 +-
 meta/recipes-devtools/gcc/gcc-7.3.inc              |  1 -
 ...e-alias-for-__cpu_indicator_init-instead-.patch | 85 ----------------------
 meta/recipes-devtools/make/make.inc                |  5 +-
 ...1-glob-Do-not-assume-glibc-glob-internals.patch | 69 ++++++++++++++++++
 ...2-glob-Do-not-assume-glibc-glob-internals.patch | 38 ++++++++++
 meta/recipes-devtools/perl/perl/config.sh          |  2 +-
 ...-Check-if-memfd_create-is-already-defined.patch | 62 ++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  |  3 +-
 38 files changed, 441 insertions(+), 240 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
 rename meta/recipes-devtools/binutils/{binutils-2.29.1.inc => binutils-2.30.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.1.bb => binutils-cross-canadian_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.1.bb => binutils-cross_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.1.bb => binutils-crosssdk_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.1.bb => binutils_2.30.bb} (100%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb} (96%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 create mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
 create mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Check-if-memfd_create-is-already-defined.patch

-- 
2.16.1


