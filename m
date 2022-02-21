Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F283C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:32 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.11004.1645452871993957931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G3RpZM/X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id z4so14389826pgh.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpH++fcK5bQandVw1cGWI0xkIAAu78+BXmiwNX/pEwA=;
        b=G3RpZM/XwB1zv++FxkmJtuY0q6ShkqEVX0ua+UURHtJx7VydZdh04dO63yEUg3cOql
         nJn8TPp2KSZ2ykfGbTmhnLqOBE+Gmn3ntgfh7DXgikJfFv3U6G33RicG8O49W162JR/G
         IMQcyO778c2lPtImDn1R0Id4C9fUTzz0cYQQql3xUxrgoRWE3d5KlW9uhhY2InVqlrmN
         xoduBtLjJTfVAaDbId9QUdjChbaJNTVQqOXDVrGp4pFJR+5kpNJKKM1DHjUn5CtDVJII
         QiG8wqvHAKfiAZYXj+/x19/VK+7ZTkEzl9aZcIC3+MP0Muj0/mJbke15ohYi1aOSfYch
         lweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpH++fcK5bQandVw1cGWI0xkIAAu78+BXmiwNX/pEwA=;
        b=HLjxxiAeNmGeJ3FXmxQ0FKNcE+BjZrmeam0v8Hgch1IpfhggTA1og0zR+8qpybIIXf
         LTTy5SwH9th47ovV9bb89H8lml3ioi/7JQBL5FfL9svfHyWysRnq/ubRkk1a5I7ed19I
         d76goB7mrMpS3lVpdfnKPari2Elros58LlBSt59Va92oJjHEYBhgrZIF+X6J6xbP3tIt
         DzfKgC+yq3XR7730VO70ywjIs3rjmY6i40leClgdyteKq0wArQsprbybZFDRFXEn0Gqn
         C+I88w/CWT9/u5NbL56jAjNLM2L9mrEVrYiQI+8a9zL91bmGxELaFIT+Rdrh6UwNe+pP
         11eA==
X-Gm-Message-State: AOAM532tuGcFagL1QLjWkrg+u2TR8Xb0IcnFxAFAcAVJiRUm/cJEcOF0
	XGR1SAQv9pxYdcBxAhNd1Cc/OB5jQ/lXx80R
X-Google-Smtp-Source: 
 ABdhPJxvyNxJEjsCfyhAbZRHms+4fmF/DSG/WvARkWYeUdXtT1kR4HO+9if1axvhLsTI7aWI/yD1qw==
X-Received: by 2002:a63:5d09:0:b0:372:9a55:bf89 with SMTP id
 r9-20020a635d09000000b003729a55bf89mr16205623pgb.321.1645452870960;
        Mon, 21 Feb 2022 06:14:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/20] Patch review
Date: Mon, 21 Feb 2022 04:13:58 -1000
Message-Id: <cover.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162028

Please review this set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3253

The following changes since commit 88c0290520c9e4982d25c20e783bd91eec016b52:

  libusb1: correct SRC_URI (2022-02-07 04:40:13 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  ruby: correctly set native/target dependencies

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.173
  linux-yocto/5.4: update to v5.4.176
  linux-yocto/5.4: update to v5.4.178

Christian Eggers (1):
  sdk: fix search for dynamic loader

Florian Amstutz (1):
  devtool: deploy-target: Remove stripped binaries in pseudo context

Martin Beeger (1):
  cmake: remove bogus CMAKE_LDFLAGS_FLAGS definition from toolchain file

Purushottam Choudhary (1):
  freetype: add missing CVE tag CVE-2020-15999

Richard Purdie (1):
  default-distrovars.inc: Switch connectivity check to a
    yoctoproject.org page

Ross Burton (1):
  lighttpd: backport a fix for CVE-2022-22707

Saul Wold (1):
  recipetool: Fix circular reference in SRC_URI

Stefan Herbrechtsmeier (1):
  cve-check: create directory of CVE_CHECK_MANIFEST before copy

Steve Sakoman (5):
  expat: fix CVE-2022-23990
  connman: fix CVE-2022-23096-7
  connman: fix CVE-2022-23098
  connman: fix CVE-2021-33833
  wpa-supplicant: fix CVE-2022-23303-4

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
 scripts/lib/devtool/deploy.py                 |   2 +-
 scripts/lib/recipetool/create.py              |   2 +-
 27 files changed, 1331 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2021-33833.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23098.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-23303-4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-45078.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmio-Fix-lzopen_internal-mode-parsing-when-Tn-is-us.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)

-- 
2.25.1


