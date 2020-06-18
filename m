Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1998.1592449626514565166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 20:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H9PbFoUj;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id a21so3764116oic.8
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 20:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=OLKtZ9F5qCLcAgac7wm8OjZTE1P1LjoxKgWx9uat0aQ=;
        b=H9PbFoUje1v5jD/pSQDIX0MnUVmzv8WE2CUPSgtBSK+bTINzqsb+n2IDgARhndprGp
         vFDa7U0dOqu5Pxapk1q6oPHLRzvRYK/w6yik0Zj0Iu+fh2XVhGOVMxsmEPtbDzyrfOOA
         1cBj+R6Z42gSu97FYlznGSTlkwyyXTFpDM0O59DLVnDWvGHy98MBVeF6FSkNLU2nbOtr
         rhjpybUGgTSlLksYUxjEAQJNnWlUoVUElT/pihja6eINCi/Lv54wb8kX+aTLMLotnn7B
         DYjVIaRNTmm/3JuNJUpogzAHvVdixg/ggDP2P70MeTKsI7qNB0mAHbRfjw0BxjNgeZwc
         cBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=OLKtZ9F5qCLcAgac7wm8OjZTE1P1LjoxKgWx9uat0aQ=;
        b=MFSRDYgwyjYMeWGJ33WVSbw4waRECnlKDH7tDLVzedSdlp4fAAIyfb46OeCmFWNcpd
         3aSO8rpAN3Yakf+TkjyRQw82Ysvj6uUZA1ne5wkLgO3fViRWYirdky6KQXhsZl+13yCd
         S0oyn6NZc5BQQIy3qzJlb1qyN7OMU5eCrCX7arxzIZHVoF/68iCnPR/sg58qZbTqoX1x
         I6LPYQTlQDJ0V0xZnREwx0dspcT+Wa3sbUACC5wdbQQCbRT8wuy5kWkKWXw+Q3RlZBS8
         4FVjxenOKYVky3YeKvyc8qIXUa6g38MOuslEGty830E6TTaKUFloAIs+ggiRLxgoYz04
         5WAg==
X-Gm-Message-State: AOAM533ZUJRSVwxX/IRNt9qA0xTZaQ6K2zBJ+WRYiZuu4VJ0qwHUbQ5C
	pRJWDPiwGzxFOYJ0M8/++ny9NXSp9vI=
X-Google-Smtp-Source: ABdhPJwlMm6vog4fyIqfX6PRMcySoXRw180dQMZkfvEvEiDUpC+zgJSRizDYF2ygqeClqt0e6tK6SQ==
X-Received: by 2002:aca:6708:: with SMTP id z8mr1392713oix.96.1592449625175;
        Wed, 17 Jun 2020 20:07:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id f1sm423435ool.16.2020.06.17.20.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 20:07:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/20] Pull request (cover letter only)
Date: Wed, 17 Jun 2020 17:06:40 -1000
Message-Id: <cover.1592449482.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 6fa967f194edd314c9026c80f8d93360ac6d9efa:

  build-appliance-image: Update to dunfell head revision (2020-06-08 21:45:09 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (3):
  lz4: disable static library
  linux-firmware: upgrade 20200421 -> 20200519
  build-sysroots: add sysroot paths with native binaries to PATH

Chen Qi (1):
  db: do not install db_verify if 'verify' is not enabled

Joe Slater (2):
  qemu: force build type to production
  vim: _FORTIFY_SOURCE=2 be gone

Konrad Weihmann (2):
  sysfsutils: rem leftover settings for libsysfs-dev
  cogl: point to correct HOMEPAGE

Marco Felsch (1):
  util-linux: alternatify rtcwake

Paul Barker (3):
  archiver: Fix test case for srpm archiver mode
  oe-selftest: Allow overriding the build directory used for tests
  oe-selftest: Recursively patch test case paths

Peter Kjellerstedt (1):
  cairo: Do not try to remove nonexistent directories

Ralph Siemsen (1):
  cve-check: include epoch in product version output

Richard Purdie (5):
  ltp: Exclude the memcg_stress tests due to timeout problems
  maintainers: Update Ross' email address
  logrotate: Drop obsolete setting/comment
  oeqa/targetcontrol: Rework exception handling to avoid warnings
  patchelf: Add patch to address corrupt shared library issue

hongxu (1):
  core-image-minimal-initramfs: keep restriction with
    initramfs-module-install

 meta/classes/cve-check.bbclass                |   2 +-
 meta/conf/distro/include/maintainers.inc      | 126 +++++++++---------
 meta/lib/oeqa/selftest/cases/archiver.py      |   1 +
 meta/lib/oeqa/selftest/context.py             |  24 +++-
 meta/lib/oeqa/targetcontrol.py                |   5 +-
 meta/lib/oeqa/utils/commands.py               |   5 +-
 .../images/core-image-minimal-initramfs.bb    |   4 +-
 meta/recipes-core/meta/build-sysroots.bb      |   4 +
 .../sysfsutils/sysfsutils_2.1.0.bb            |   2 -
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../patchelf/patchelf/fix-phdrs.patch         |  37 +++++
 .../patchelf/patchelf_0.10.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu_4.2.0.bb      |   5 +
 .../logrotate/logrotate_3.15.1.bb             |   7 -
 meta/recipes-extended/ltp/ltp_20200120.bb     |   4 +
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   6 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc       |   2 +-
 ...20200421.bb => linux-firmware_20200519.bb} |   5 +-
 meta/recipes-support/db/db_5.3.28.bb          |   3 +
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
 meta/recipes-support/vim/vim_8.2.bb           |   5 +
 21 files changed, 160 insertions(+), 91 deletions(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200421.bb => linux-firmware_20200519.bb} (99%)

-- 
2.17.1

