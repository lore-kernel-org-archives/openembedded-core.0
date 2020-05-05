Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.1487.1588648786151303753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mcnSNHzd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id s20so251644plp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Z3yG5KnxI0DEIjHDjDeAot5Ri1icU+RBUfdZ5YDBJk=;
        b=mcnSNHzdrzBDw/7D+EAo/1fEbX9sVtzVlYAg9eeM+Dl+2neZUejq6ZNMlLp0R795HB
         wAL30+dTthVWxzqMCvFQUWwhIxwQaPfQo1TTuQQu0Xa0KFEq5i8kCKuGvR5FdRDZAY/m
         +T0KfQR/5CWpPC+138j7K3pkxJllFYfXBhYiE8FqJTsOrTokksue6HcFFG/VWTLL/spY
         Jt4FDzajl4Mz4FNed1tFZUa5DVOlFKv8YRKwhpFp9HDXYubVPYfafSL2o80z2o8GWNMR
         PMyFRHMyB/0paIXDwpaqPjQ01iw1dhMAJKabJ600iBGC1StB8+EuV8julElzF76XoGqS
         yCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Z3yG5KnxI0DEIjHDjDeAot5Ri1icU+RBUfdZ5YDBJk=;
        b=l7MDb8EMKJjEZvpKVnnPNCUT80aw8l3wRoXkdjPjxn5nNqj9y/OzQVxgk1xqbuXjNV
         xuKoGD+RJz5ZwJUPTQbontR/31uldsNkepOyG8/wX9SBA2JrjanvMICRqdY2F1Zln+Ih
         nA+GjOlhx9UmuO/iFYanQz5VRH1WkI3XYxvfYPz4+JlElXSZzk4dEifi3/JP2dhe8X3F
         nFqNkqFz6/SkPGxPJPLcIJ/7jVW8mhFDPKySNc7BJ2b1frhsj9Oun1CNOMdutki2zZ0Y
         Eu6q1UoIVwS3fD0mVhMbZD1hZpWwD+oLdYboXo8wC+TYVIwy8X4QSZutI/dn6vpL1XKG
         FK/A==
X-Gm-Message-State: AGi0PuZ3UlTMQpN4O8H6BbNkAvk2cK3hc+vjX4hfbwrSdckpNwoi/JG6
	n6/sTZDOu7l2QeIDEbe4roSuezyvQveCdA==
X-Google-Smtp-Source: APiQypI+xcnWCTiXPvM76qr+Ab9Ue2/8Vk0Sds4xv27jvc7gtwozuaWpsMoQPVVZLS8estguAF5Yog==
X-Received: by 2002:a17:902:82c1:: with SMTP id u1mr1167905plz.10.1588648784761;
        Mon, 04 May 2020 20:19:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.19.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:19:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Patch review
Date: Mon,  4 May 2020 17:18:55 -1000
Message-Id: <cover.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 2cc3fac9cd1a0d77931c9e49dbe2941fa8619c51:

  parselogs.py: ignore pulseaudio startup warning messages (2020-04-30 11:59:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

