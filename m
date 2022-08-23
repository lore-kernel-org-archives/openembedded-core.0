Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFDEC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:13:21 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.32558.1661263999396177916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z8fE7JeJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id s206so12396004pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=NEjf6fDIX/8g11qmQGk3psg5xAJFny6az4rWE9fQQLQ=;
        b=Z8fE7JeJxdattQJMUolyYBpC7aZ9EuSotVPz7pbAjM48U/GNzjFvO0ORgXGgMd22ps
         y8AkZcxfYs5SD58dnGxrq9UFq+yJ6xt6HrOSH5zOBAVNbSi+OGFpcw9WUdIKp8SSqofP
         KllGlpNirDAdMxW2th75oIF648VTKIYSbEYKg6MWxJcssrAGPfFpF24BIxlqE7z73G1k
         /t4b5v57fvFKMVZl03txuRGRWGnkhRWqQpwMeS1jRyJWdWTYPNB8i15ZaQ1irS4YaSsX
         Ufpney/Tr+jrMTep8tVbUAV0V22QlRnVheaNxSxqNoMPmyJB9SQ8/FcNcxNxePHGVbFP
         qgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=NEjf6fDIX/8g11qmQGk3psg5xAJFny6az4rWE9fQQLQ=;
        b=FfQ+QPoSz9wlXAWu6gbfg4z2PgRz1khrX7ZLPZbSzDPzlg7ESgRzApetLrjXHAseLZ
         oN3E8hEIEIj6mYaTYPHxLsG+MK8RfUrE38nUvCefI3XgOkQPs/rgyaRzP73d4wz57/6/
         w4BGvNxppYpWFKGYGJXXdqI3iuOeqY+E/DX9Lr1vUGm8r7M2qJQtmG7zPm3ocoyW2pnG
         yzfh7jUgisv3umoCRWxxu26Fi12VA3M1Ej36IsSmQXeDFvALGaAqaDi0P4DGLNiIHdu1
         PqwSkAiuFSSJYn8GCRvCpzqwTyYFOOaPWyxXVHA7m/OclifQQtUBS6i9T7DgbKRBXtLe
         NiZQ==
X-Gm-Message-State: ACgBeo1Kc/X1XwybSTDaXBC/N3kyeLKEFR7o+s0BkhA/n+YLTU/DD6RN
	5dU4DTduJ69mdJy2GRj1ctAZkJ9sCqZkbkMe
X-Google-Smtp-Source: 
 AA6agR4sehItO2JPQDOCkSk82BPMte2TY1PeckYSLvBnOY8Uzx8iTX70ev8wUAVn2wGbjaDD6/mpyQ==
X-Received: by 2002:a63:fe12:0:b0:42a:e57:7464 with SMTP id
 p18-20020a63fe12000000b0042a0e577464mr19901151pgh.552.1661263998019;
        Tue, 23 Aug 2022 07:13:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q9-20020a170902eb8900b001715a939ac5sm3733944plg.295.2022.08.23.07.13.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:13:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/26] Pull request (cover letter only)
Date: Tue, 23 Aug 2022 04:13:05 -1000
Message-Id: <cover.1661263918.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:13:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169706

The following changes since commit 2cafa6ed5f0aa9df5a120b6353755d56c7c7800d:

  build-appliance-image: Update to kirkstone head revision (2022-08-10 14:59:51 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (3):
  devtool/upgrade: correctly clean up when recipe filename isn't yet
    known
  devtool/upgrade: catch bb.fetch2.decodeurl errors
  scripts/oe-setup-builddir: make it known where configurations come
    from

Bruce Ashfield (3):
  lttng-modules: fix 5.19+ build
  lttng-modules: fix build against mips and v5.19 kernel
  lttng-modules: replace mips compaction fix with upstream change

Hitendra Prajapati (3):
  gdk-pixbuf: CVE-2021-46829 a heap-based buffer overflow
  gnutls: CVE-2022-2509 Double free during gnutls_pkcs7_verify
  zlib: CVE-2022-37434 a heap-based buffer over-read

Jose Quaresma (2):
  archiver.bbclass: remove unsed do_deploy_archives[dirs]
  create-spdx: ignore packing control files from ipk and deb

Mark Hatle (1):
  runqemu: Add missing space on default display option

Martin Beeger (1):
  cmake: remove CMAKE_ASM_FLAGS variable in toolchain file

Mihai Lindner (1):
  create-spdx: Fix supplier field

Mikko Rapeli (1):
  boost: fix install of fiber shared libraries

Paul Eggleton (1):
  relocate_sdk.py: ensure interpreter size error causes relocation to
    fail

Randy MacLeod (1):
  vim: update from 9.0.0063 to 9.0.0115

Richard Purdie (2):
  nativesdk: Clear TUNE_FEATURES
  selftest/wic: Tweak test case to not depend on kernel size

Roland Hieber (1):
  devtool: error out when workspace is using old override syntax

Sakib Sajal (6):
  qemu: fix CVE-2021-3507
  qemu: fix CVE-2021-3929
  qemu: fix CVE-2021-4158
  qemu: fix CVE-2022-0358
  qemu: fix CVE-2022-0216
  u-boot: fix CVE-2022-33103

 meta/classes/archiver.bbclass                 |   1 -
 meta/classes/create-spdx.bbclass              |   7 +-
 meta/classes/nativesdk.bbclass                |   1 +
 meta/lib/oe/spdx.py                           |   2 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   2 +-
 ..._read-Prevent-arbitrary-code-executi.patch |  80 +++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 .../zlib/zlib/CVE-2022-37434.patch            |  44 +++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 .../cmake/cmake/OEToolchainConfig.cmake       |   1 -
 meta/recipes-devtools/qemu/qemu.inc           |   7 +
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ++++++
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 +++++++
 .../qemu/qemu/CVE-2021-3929.patch             |  70 +++++
 .../qemu/qemu/CVE-2021-4158.patch             |  46 +++
 .../qemu/qemu/CVE-2022-0216_1.patch           |  42 +++
 .../qemu/qemu/CVE-2022-0216_2.patch           |  52 ++++
 .../qemu/qemu/CVE-2022-0358.patch             | 106 +++++++
 .../gdk-pixbuf/CVE-2021-46829.patch           |  61 ++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.6.bb           |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 +++++
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 +++++++
 ...ags-parameter-from-aops-write_begin-.patch |  76 +++++
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   4 +
 ...ll-targets-if-there-s-build-no-in-ur.patch |  82 +++++
 meta/recipes-support/boost/boost_1.78.0.bb    |   1 +
 .../gnutls/gnutls/CVE-2022-2509.patch         | 282 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   1 +
 .../vim/files/crosscompile.patch              |  51 ----
 meta/recipes-support/vim/files/racefix.patch  |  37 ---
 meta/recipes-support/vim/vim.inc              |   6 +-
 scripts/devtool                               |  10 +-
 scripts/lib/devtool/upgrade.py                |  33 +-
 scripts/oe-setup-builddir                     |  12 +-
 scripts/relocate_sdk.py                       |  10 +-
 scripts/runqemu                               |   2 +-
 37 files changed, 1511 insertions(+), 126 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4158.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0358.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Don-t-skip-install-targets-if-there-s-build-no-in-ur.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
 delete mode 100644 meta/recipes-support/vim/files/crosscompile.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1


