Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.3985.1588822370019308513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 20:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KumD1CHD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id f15so1506205plr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQLMck6bhh2Vbtz63+ZcZ6VRd7ASJiKb2UecOuQrj6o=;
        b=KumD1CHDMUSN9ChvToic3FOPIGsxtOJCzdummHehT8kNnP6aeMAcPuYHXZlLp/65rD
         zOKfLPt30eDj+L8Cgslb3Ir9xWunl/cwCiUJmzwpioG8HaudRgDYjUjEOkdHgIGeEA7V
         YgAUHd4T/bEBD46emzwoYjk3yXQQg393hGP1CJsUvdBfim1zKpz4Lcjh2Sqz82B0Z/0H
         4Rv2pbB5oXtorrLIZP9+HYEvOPKiscFTCwYcyWd8BUvhgbohLUrAIeAzxACHIP/14w5n
         rEh6BZC8wy+t7FxSLUnO9+VCtSX7oFbZ9nBdgxsty66IENM1TfrXl9S5fSMGeQhC24US
         jIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nQLMck6bhh2Vbtz63+ZcZ6VRd7ASJiKb2UecOuQrj6o=;
        b=UiHIgPNGx6nGRcW5JGQDxMhGnTmyib654FlLjVIS0S3LKvsixkim0aNYheCgznpTSo
         Vgv3pVLMdC61DgGC+4fMVv0ld6dd6Xpj/wNzWzXNXP5Iy1mIOeqy4/uYdlujqKewNW8u
         i4IQtFP4aI6VAkVZelZiJOHbxBj9KG4gK2+Jr0z8eCCmuu0HsKpEl5zjiFOgRdxB4OTO
         2cKC0Gfuy7WmvNlKPU1mv1rysrDlZUE1Yq90AlgpL0gS8YEC7rQDs/fpfRWq8Wb9f0Jo
         DvlxP+gI8TNfVWFxIn6c/by2uU2pPBy1raUpOrnABBrRbgqZol6XyVruNsy66YIVWXVF
         4UtA==
X-Gm-Message-State: AGi0PuaSQnSOkhP/SspUa6fOokdj4aeHlyhobU77iss4KTg4Mn2bjd7L
	xYcsA51L4tUEWM0we9rc27dYLMvoGcV9jQ==
X-Google-Smtp-Source: APiQypIkcm+2KGKfNNygyE8vBnSpOYQ2lwZ96Z04+bb16rdINNVRj7Nb5UicnoqbOypt3sDi3ci7Ag==
X-Received: by 2002:a17:90a:3327:: with SMTP id m36mr13393662pjb.116.1588822368701;
        Wed, 06 May 2020 20:32:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mn1sm5864641pjb.24.2020.05.06.20.32.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 20:32:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Pull request (cover letter only)
Date: Wed,  6 May 2020 17:31:46 -1000
Message-Id: <cover.1588813043.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 2cc3fac9cd1a0d77931c9e49dbe2941fa8619c51:

  parselogs.py: ignore pulseaudio startup warning messages (2020-04-30 11:59:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alex Kiernan (1):
  run-postinsts: Set RemainAfterExit on systemd unit

Alexander Kanavin (2):
  testimage.bbclass: correctly process SIGTERM
  buildtools-extended-tarball: add libgomp-dev

Andrew Geissler (2):
  boost: revert 1.72.0 regression
  libffi: fix v3.3 compile on ppc64le

Domarys Correa (1):
  insane.bbclass: Add test for shebang line length

Drew Moseley (1):
  perl: Add missing dependency for tie-hash on carp.

Jan Luebbe (1):
  openssl: upgrade 1.1.1f -> 1.1.1g

Joe Slater (1):
  vim: do not adjust script paths building for target

Kai Kang (1):
  pseudo: add macro guard for seccomp

Khem Raj (6):
  packagegroup-go-sdk-target: Enable on rv64
  go: Rely on go-runtime to provide needed modules
  packagegroup-go-sdk-target: Add go to packagegroup
  gcc: Configure all gccs with --disable-install-libiberty
  binutils: Detect proper static-libstdc++ support when using clang
  binutils: Install PIC version of libiberty.a

Mingli Yu (2):
  pbzip2: Fix license warning
  iputils: Initialize libgcrypt

Peter Kjellerstedt (1):
  busybox: Correct the name of the bzip2 license

Richard Purdie (6):
  bzip2/pbzip2: Correct license information
  oeqa/selftest: Add test for conflicting sysroot provider
  staging: Fix overlapping file failures
  targetcontrol: Fix leaking log handler
  oeqa/qemurunner: Clean up failure handling
  gcc-target: Ensure buildtools-extended-tarball doesn't use arch=native

Tim Orling (1):
  scripts/install-buildtools: bump to 3.1 release by default

Trevor Gamblin (1):
  python3: fix CVE-2020-8492

Wang Mingyu (1):
  icu: CVE-2020-10531

 .../sysroot-test/sysroot-test-arch1_1.0.bb    |  14 +
 .../sysroot-test/sysroot-test-arch2_1.0.bb    |  14 +
 .../sysroot-test/sysroot-test_1.0.bb          |   6 +
 meta/classes/insane.bbclass                   |  25 +-
 meta/classes/staging.bbclass                  |  12 +-
 meta/classes/testimage.bbclass                |   8 +-
 .../common-licenses/{bzip2 => bzip2-1.0.6}    |   0
 meta/lib/oeqa/selftest/cases/sysroot.py       |  37 +++
 meta/lib/oeqa/targetcontrol.py                |   7 +-
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 .../{openssl_1.1.1f.bb => openssl_1.1.1g.bb}  |   2 +-
 meta/recipes-core/busybox/busybox.inc         |   2 +-
 .../meta/buildtools-extended-tarball.bb       |   1 +
 .../packagegroup-go-sdk-target.bb             |   3 +-
 .../binutils/binutils-2.34.inc                |   1 +
 meta/recipes-devtools/binutils/binutils.inc   |   5 +
 ...or-clang-before-checking-gcc-version.patch |  48 ++++
 .../gcc/gcc-configure-common.inc              |   1 +
 .../gcc/gcc-cross-canadian.inc                |   6 -
 meta/recipes-devtools/gcc/gcc-cross.inc       |   4 -
 meta/recipes-devtools/gcc/gcc-target.inc      |  14 +-
 meta/recipes-devtools/go/go-target.inc        |   4 +-
 .../perl/files/perl-rdepends.txt              |   1 +
 .../pseudo/files/seccomp.patch                |  15 +-
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 .../run-postinsts/run-postinsts.service       |   2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   2 +-
 .../0001-iputils-Initialize-libgcrypt.patch   |  55 ++++
 .../iputils/iputils_s20190709.bb              |   1 +
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |   2 +-
 meta/recipes-support/boost/boost_1.72.0.bb    |   1 +
 ...001-revert-cease-dependence-on-range.patch |  53 ++++
 .../icu/icu/CVE-2020-10531.patch              | 128 +++++++++
 meta/recipes-support/icu/icu_66.1.bb          |   1 +
 ...pc.h-fix-build-failure-with-powerpc7.patch |  62 +++++
 meta/recipes-support/libffi/libffi_3.3.bb     |   1 +
 .../vim/files/no-path-adjust.patch            |  27 ++
 meta/recipes-support/vim/vim.inc              |  12 +-
 scripts/install-buildtools                    |   6 +-
 40 files changed, 793 insertions(+), 50 deletions(-)
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
 create mode 100644 meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
 rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)
 create mode 100644 meta/lib/oeqa/selftest/cases/sysroot.py
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
 create mode 100644 meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
 create mode 100644 meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
 create mode 100644 meta/recipes-support/icu/icu/CVE-2020-10531.patch
 create mode 100644 meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
 create mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch

-- 
2.17.1

