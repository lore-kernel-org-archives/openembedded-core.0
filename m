Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4EDC43334
	for <webhook@archiver.kernel.org>; Sat, 11 Jun 2022 02:36:58 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.1963.1654915015513338206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 19:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BFVNPgx0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id r71so825459pgr.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 19:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpMee97dwzbLD1IgAAvzeseMFWxtzP0s8qu7IfdBIhI=;
        b=BFVNPgx0hc5Hl2Hb8sCTyauUalZAd3S6jvoLn/9RcGIPgupUxJSRylQ276nUNGreAH
         jA9DhIPzGfinQItEb6UKMsPwy+Mkv5Ht7eKLUnOnAZAe9z6g2cAe7WddyPgqqPmLLxIO
         q2mRe0oP9wHzP6ApkY23HhFK56EovnZASKFSTVguhvABeXaulUw9CdVZMoinJI+1jiy2
         upDaNWIWRp4TCMx6SaQbc9QsEpR7lZfCXQcIM7O2w/Oz++SRP44ThxPbXXUL6XX6p5F6
         NPy0Vxjjx5CYm2jP5c/QLS7ffOVWt0USND68MQMEjivlPmHEKQkcbuYXPGVvlYgHSP9v
         xMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rpMee97dwzbLD1IgAAvzeseMFWxtzP0s8qu7IfdBIhI=;
        b=kGOVNHGcAMDwa5WvezqKdwqBOy6UmnPyBu/P83nks7Ov9D/UH4DUa40yItxh96M31Y
         pjWpAo8lmQ5C1+bkcF+IJ8rJwdC0Ym7C8z07i4rnfWqRN8vbeVzC1gLLjPOgjTfp6M/u
         okRGVhOP4mwVpLN6VISoEva4YKkx7PuUXI+VvYrDrMkKBos5NICwHWiNEih4YrVwutp6
         OwNbs2n2ComEYVjXtEqKkB5vNexClNRxgLQZPvY+zNt0LXl7qzxdIEgzRy1G2ZUi038I
         fLl7U02kLP3konXHulT7IoQZZLCfqwug5nBGBxlDu2z5PDwpJxEghFhAX96RTXVm3Nqp
         tDzg==
X-Gm-Message-State: AOAM532GR6Fp/w5FWNIrwaZUMUJBS9bPKRwDNS/nB5mguUu9Hnc6ASZY
	bZYivNVY98NSg1Mw16Cm/yxZOUmKpYjE9oXf
X-Google-Smtp-Source: 
 ABdhPJypPCOvkkoPktj5Z32p4frN2oSXwvh8DjmaNYV052UisTuPuaJyiaZZ2juNTYB0OYF4f6pvhg==
X-Received: by 2002:a05:6a00:198c:b0:51c:7547:58e0 with SMTP id
 d12-20020a056a00198c00b0051c754758e0mr14929803pfl.82.1654915013973;
        Fri, 10 Jun 2022 19:36:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z11-20020a056a001d8b00b005206a41ff1esm269417pfw.143.2022.06.10.19.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 19:36:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/35] Pull request (cover letter only)
Date: Fri, 10 Jun 2022 16:36:42 -1000
Message-Id: <cover.1654914836.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jun 2022 02:36:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166820

This pull request is for the last two review patchsets.

The following changes since commit e63013cc38b82659658365da53b14952711d6701:

  gcc: Upgrade to 11.3 release (2022-06-02 06:48:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (3):
  bash: submit patch upstream
  valgrind: submit arm patches upstream
  zip/unzip: mark all submittable patches as Inactive-Upstream

Dmitry Baryshkov (2):
  linux-firmware: package new Qualcomm firmware
  linux-firmware: split ath3k firmware

Jeremy Puhlman (1):
  gcc: depend on zstd-native

Jiaqing Zhao (4):
  systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
  systemd: Remove __compare_fn_t type in musl-specific patch
  systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
  systemd: Correct path returned in sd_path_lookup()

Khem Raj (4):
  systemd: Drop redundant musl patches
  systemd: Document future actions needed for set of musl patches
  systemd: Drop
    0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
  systemd: Update patch status

Marcel Ziswiler (1):
  alsa-plugins: fix libavtp vs. avtp packageconfig

Marta Rybczynska (4):
  cve-check: move update_symlinks to a library
  cve-check: write empty fragment files in the text mode
  cve-check: fix return type in check_cves
  cve-update-db-native: make it possible to disable database updates

Martin Jansa (2):
  makedevs: Don't use COPYING.patch just to add license file into ${S}
  patch.py: make sure that patches/series file exists before quilt pop

Mingli Yu (1):
  perl: Fix build with gcc-12

Peter Kjellerstedt (2):
  libseccomp: Correct LIC_FILES_CHKSUM
  license.bbclass: Bound beginline and endline in copy_license_files()

Richard Purdie (7):
  lzo: Add further info to a patch and mark as Inactive-Upstream
  glib-2.0: upgrade 2.72.1 -> 2.72.2
  libxkbcommon: upgrade 1.4.0 -> 1.4.1
  gtk+3: upgrade 3.24.33 -> 3.24.34
  webkitgtk: upgrade 2.36.1 -> 2.36.3
  openssl: Backport fix for ptest cert expiry
  gcc-cross-canadian: Add nativesdk-zstd dependency

Sean Anderson (1):
  rootfs.py: find .ko.zst kernel modules

Stefan Wiehler (1):
  kernel-yocto.bbclass: Reset to exiting on non-zero return code at end
    of task

wangmy (2):
  cups: upgrade 2.4.1 -> 2.4.2
  logrotate: upgrade 3.19.0 -> 3.20.1

 meta/classes/cve-check.bbclass                |  40 +-
 meta/classes/kernel-yocto.bbclass             |   8 +
 meta/classes/license.bbclass                  |   8 +-
 meta/lib/oe/cve_check.py                      |  10 +
 meta/lib/oe/patch.py                          |   2 +
 meta/lib/oe/rootfs.py                         |   2 +-
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch |  55 +++
 .../openssl/openssl_3.0.3.bb                  |   1 +
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   2 +-
 ...{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |   6 +-
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 ---
 ...test-parse-argument-Include-signal.h.patch |  27 --
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   2 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ---------
 ...-missing_type.h-add-comparison_fn_t.patch} |  41 +--
 ...missing.h-check-for-missing-strndupa.patch |  14 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   3 +
 ..._register_atfork-for-non-glibc-build.patch |   3 +
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  33 --
 ...ype.h-add-__compar_d_fn_t-definition.patch |  28 --
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  24 --
 ...ible-pointer-type-struct-sockaddr_un.patch |  38 --
 .../0021-test-json.c-define-M_PIl.patch       |   4 +
 meta/recipes-core/systemd/systemd_250.5.bb    |  10 +-
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   2 +-
 .../gcc/gcc-cross-canadian.inc                |   2 +-
 .../makedevs/makedevs/COPYING.patch           | 346 ------------------
 .../makedevs/makedevs/makedevs.c              |   4 +
 .../makedevs/makedevs_1.0.1.bb                |   5 +-
 .../files/0001-Fix-build-with-gcc-12.patch    | 143 ++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |   2 +-
 ...n-for-targets-which-don-t-support-it.patch |   2 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |   2 +-
 .../bash/bash/makerace2.patch                 |   2 +-
 .../cups/{cups_2.4.1.bb => cups_2.4.2.bb}     |   2 +-
 ...ogrotate_3.19.0.bb => logrotate_3.20.1.bb} |   2 +-
 ...ass-LDFLAGS-to-tests-doing-link-step.patch |   2 +-
 .../unzip/unzip/CVE-2021-4217.patch           |   2 +-
 .../unzip/unzip/avoid-strip.patch             |   2 +-
 .../unzip/unzip/define-ldflags.patch          |   2 +-
 .../unzip/unzip/fix-security-format.patch     |   2 +-
 .../unzip/unzip/symlink.patch                 |   2 +-
 ...LAGS-and-LDFLAGS-when-doing-link-tes.patch |   2 +-
 .../zip/zip-3.0/10-remove-build-date.patch    |   2 +-
 .../zip/zip-3.0/fix-security-format.patch     |   2 +-
 .../zipnote-crashes-with-segfault.patch       |   2 +-
 .../{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb}    |   2 +-
 ...bcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} |   2 +-
 .../linux-firmware/linux-firmware_20220509.bb |  19 +-
 .../alsa/alsa-plugins_1.2.6.bb                |   2 +-
 ...ebkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} |   2 +-
 .../libseccomp/libseccomp_2.5.3.bb            |   2 +-
 ...Use-memcpy-instead-of-reinventing-it.patch |  10 +-
 56 files changed, 409 insertions(+), 806 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} (96%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (63%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
 delete mode 100644 meta/recipes-devtools/makedevs/makedevs/COPYING.patch
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
 rename meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} (51%)
 rename meta/recipes-extended/logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb} (97%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} (94%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} (98%)

-- 
2.25.1


