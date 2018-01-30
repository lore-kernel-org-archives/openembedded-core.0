Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1A79719A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:31:49 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c6so7605165pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ryKL2T9REBXCUuzViZ7zT6njW0IOVbN1Lmh1i/isCzA=;
	b=LAy/PP6PLm3zb0hAVkyyYya9Ez07zaMX16JcifgEM8TFv1TXEgPmWd3RuzBGqgV5te
	3aF0AtXdrJCbGypOgr1CudhaUAaRLhf7K3FYrLF3oVN107GnHpcShtB1wpYjFJJSgCgt
	Qgz2G2PLSUPtElhzwbmdjMsB/vnO0mpdjCH8+uEvvIDherrX0scCH2sXo1nM6alutrpX
	U2OkoIhQ1/vE8NbuQiT5HqqL/OkWxFTYQQQTN4Htfcw191PIclGvh1GFo0T+U1zQwQgf
	KPJOpfZ1EtIMP7jGc3M6xiZmVR9YdFmHzX9NNj7kpweVE3cf1rLjQPGB4OT28cnt0Vm9
	xH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ryKL2T9REBXCUuzViZ7zT6njW0IOVbN1Lmh1i/isCzA=;
	b=Lhapmsr4YESBmZSvbpk7AfeH4OAQRr2PqnQr01PUZ8nakFa7hHM2GM6Goz2GjdMJCV
	e8vmamcoYS9K5CNn7TJznQZYSxFTEE+X71Duz3rOb49VQmxUDMoBqzE7WsS+1/xDI9qn
	3iH4zs9FbTDpx7Lm9/nazAa5jj4oI18fJ1DQXN+J3c+slwWYb/8gLdnLLlNTrwyBBLuy
	20dNCbmjRAzlIQAEkr9x9pKv8ln70JSKKLQCImtYt/FG4sLEwvxEw+UXzJDtt6rN8rdd
	8k1p9iN+QuMlBStLIXnEvJu/04gcKl0XnzsoOKtOVutx+/0yaWW5Us24mRp8qW6fqfXz
	E8KA==
X-Gm-Message-State: AKwxytdPvCVtd26lQfy5XSGg1lUVBModV08qFFtvQal6iUkEK4Fd5OyY
	QV4bniFjPOp0LXxDqAOEwl+b9A==
X-Google-Smtp-Source: AH8x2252au++46nCVwT/Q6FRWatk5aprUO9eTpof+EicJ/AegEOoBYlWcBHu+KoH/umXTss31nFqPQ==
X-Received: by 2002:a17:902:b909:: with SMTP id
	bf9-v6mr24787744plb.218.1517286710469; 
	Mon, 29 Jan 2018 20:31:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	j6sm32305158pfg.90.2018.01.29.20.31.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:31:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:39 -0800
Message-Id: <cover.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Subject: [PATCH V2 0/8] Update to binutils 2.30, glibc 2.27 initiated fixes, musl update
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
X-List-Received-Date: Tue, 30 Jan 2018 04:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This pull contain

- binutils upgrade to 2.30
- musl update
- Recipe fixes which will be needed for glibc 2.27
- Drop redundant gcc patch

Changes since v1:

- Add proper sign-offs and Upstream-Status as reported by patchtest
- Backport another fix for pulseaudio memfd issue done upstream

The following changes since commit 1c896b34d2d9fdf941941bd29257a4714795da5a:

  testimage: enable gi test suite (2018-01-29 08:49:52 +0000)

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
 ...1-glob-Do-not-assume-glibc-glob-internals.patch | 70 ++++++++++++++++++
 ...2-glob-Do-not-assume-glibc-glob-internals.patch | 38 ++++++++++
 meta/recipes-devtools/perl/perl/config.sh          |  2 +-
 ...ers-only-define-memfd_create-if-not-alrea.patch | 66 +++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  |  3 +-
 38 files changed, 446 insertions(+), 240 deletions(-)
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
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch

-- 
2.16.1


