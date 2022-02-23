Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7B5C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 22:16:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.2534.1645654574001987713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J2LcjSOM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id e13so55547plh.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 14:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=968iI8lsT2KIy56lBGptTW0sWnt0ef/FFdSl7lanKo4=;
        b=J2LcjSOMeYGWfS/ZVLtQqLJfsRUN0FnbPMCGLen0uatnCt63ngKXTow/C/6rpj8sNr
         6SD4B7spdQQlcGqbjVlB5KVb14+1irMN4HfxFTVayf/MVgolfHjRuojHNSR+lnZYWnte
         fFpEaeiOp7Fg6zjxMAmd2Qy6m2p4mH97TRYDaF5zGPiySYrhh59umeIhYbmGBnu0vrmc
         RSZkpnw+c3RqC8Qrhho1QWg1f+xvvPa4WNtRGFw7TPmdqAPGtB4KAWH2V2iC84/6vjnP
         bIg9SsaSG3A1uHmk2AzrDHK0RvEJ6jf+QJGLKzhZmSbjZR2EyIfTcwFZ137SwYkrSY5T
         gS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=968iI8lsT2KIy56lBGptTW0sWnt0ef/FFdSl7lanKo4=;
        b=6Mv/+mrNLGxCg56Miy114v4AaCNNfNYWaK8vayOysjBXyuR8ZfZl8BLe/aSzrbgMfB
         +gfpU6Y0cP1pDImQ6u9S0dnoEEVig/yHc4OPC/KFgirOZvIKG6WrW3bIRS31RWK/Ll2m
         ui+3Mfe0STswPIBNBYo/Oqjeelc4Bg+1K5Tiru2fDoNq1nF30Ow2OPpXMuwITImTb7Ya
         Rwo1bKpftgNDrdaIantsXnsfrU/xBduN1BdXmDhAOx5CY2CtVXayGbnS+eKCXjbZgnWx
         RkKudtvqKsRm6PTrrbj/1BKWPp8F8MOK9aepw/shfmWKZWRXuUB+YnE73PSuUTHCOX0m
         KzLQ==
X-Gm-Message-State: AOAM531+l3kP4b/yWJXOpXpJK4/8nrLN5cjaZY9GjRqE7qT7l1Dwy/zi
	f2eaZSqjsuVtEG8hx+RNltFAkdzmmWLbG4CI
X-Google-Smtp-Source: 
 ABdhPJxVrqOWYBbtGB4h+e+EodW1GtFyUUYx9/DDAPdvwIoeS3xLBZT6JDbdJB9UR9W+XbQaGWG3dQ==
X-Received: by 2002:a17:902:ed83:b0:14f:c969:7669 with SMTP id
 e3-20020a170902ed8300b0014fc9697669mr1850156plj.96.1645654572767;
        Wed, 23 Feb 2022 14:16:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm3925551pju.44.2022.02.23.14.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:16:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/29] Pull request (cover letter only)
Date: Wed, 23 Feb 2022 12:16:01 -1000
Message-Id: <cover.1645654380.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 22:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162281

The following changes since commit 88c0290520c9e4982d25c20e783bd91eec016b52:

  libusb1: correct SRC_URI (2022-02-07 04:40:13 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  ruby: correctly set native/target dependencies
  vim: do not report upstream version check as broken

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.173
  linux-yocto/5.4: update to v5.4.176
  linux-yocto/5.4: update to v5.4.178

Christian Eggers (1):
  sdk: fix search for dynamic loader

Florian Amstutz (1):
  devtool: deploy-target: Remove stripped binaries in pseudo context

Konrad Weihmann (1):
  ruby: fix DEPENDS append

Martin Beeger (1):
  cmake: remove bogus CMAKE_LDFLAGS_FLAGS definition from toolchain file

Purushottam Choudhary (1):
  freetype: add missing CVE tag CVE-2020-15999

Richard Purdie (3):
  default-distrovars.inc: Switch connectivity check to a
    yoctoproject.org page
  vim: Upgrade 4269 -> 4134
  vim: Upgrade 8.2.4314 -> 8.2.4424

Ross Burton (5):
  lighttpd: backport a fix for CVE-2022-22707
  vim: set PACKAGECONFIG idiomatically
  vim: upgrade to 8.2 patch 3752
  vim: update to include latest CVE fixes
  vim: upgrade to patch 4269

Saul Wold (1):
  recipetool: Fix circular reference in SRC_URI

Stefan Herbrechtsmeier (1):
  cve-check: create directory of CVE_CHECK_MANIFEST before copy

Steve Sakoman (6):
  expat: fix CVE-2022-23990
  connman: fix CVE-2022-23096-7
  connman: fix CVE-2022-23098
  connman: fix CVE-2021-33833
  wpa-supplicant: fix CVE-2022-23303-4
  Revert "vim: fix CVE-2021-4069"

Sundeep KOKKONDA (1):
  binutils: Fix CVE-2021-45078

bkylerussell@gmail.com (1):
  rpm: fix intermittent compression failure in do_package_write_rpm

wangmy (1):
  linux-firmware: upgrade 20211216 -> 20220209

 meta/classes/cve-check.bbclass                |   1 +
 meta/classes/sanity.bbclass                   |   2 +-
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 .../connman/connman/CVE-2021-33833.patch      |  72 +++
 .../connman/connman/CVE-2022-23096-7.patch    | 121 ++++
 .../connman/connman/CVE-2022-23098.patch      |  50 ++
 .../connman/connman_1.37.bb                   |   3 +
 .../wpa-supplicant/CVE-2022-23303-4.patch     | 609 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 .../expat/expat/CVE-2022-23990.patch          |  49 ++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/0001-CVE-2021-45078.patch        | 257 ++++++++
 .../cmake/cmake/OEToolchainConfig.cmake       |   1 -
 ..._internal-mode-parsing-when-Tn-is-us.patch |  34 +
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 meta/recipes-devtools/ruby/ruby.inc           |   4 +-
 ...ix-out-of-bounds-OOB-write-fixes-313.patch | 100 +++
 .../lighttpd/lighttpd_1.4.55.bb               |   1 +
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch |   3 +
 ...20211216.bb => linux-firmware_20220209.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...1-reading-character-past-end-of-line.patch |  62 --
 ...src-Makefile-improve-reproducibility.patch |  13 +-
 ...28-using-freed-memory-when-replacing.patch |  83 ---
 ...eading-uninitialized-memory-when-giv.patch |  63 --
 ...rash-when-using-CTRL-W-f-without-fin.patch |  92 ---
 ...llegal-memory-access-if-buffer-name-.patch |  86 ---
 ...ml_get-error-after-search-with-range.patch |  72 ---
 ...nvalid-memory-access-when-scrolling-.patch |  97 ---
 .../vim/files/CVE-2021-3778.patch             |  61 --
 .../vim/files/CVE-2021-4069.patch             |  43 --
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------
 .../vim/files/disable_acl_header_check.patch  |  15 +-
 .../vim/files/no-path-adjust.patch            |   8 +-
 meta/recipes-support/vim/files/racefix.patch  |   6 +-
 ...m-add-knob-whether-elf.h-are-checked.patch |  13 +-
 meta/recipes-support/vim/vim.inc              |  27 +-
 scripts/lib/devtool/deploy.py                 |   2 +-
 scripts/lib/recipetool/create.py              |   2 +-
 43 files changed, 1364 insertions(+), 943 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-23303-4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)
 delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
 delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
 delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
 delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
 delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch
 delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.25.1


