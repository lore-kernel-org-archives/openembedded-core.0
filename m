Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2CBC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.11911.1651248070246909444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zX/g2VqX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id g3so6860762pgg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfJVQj8eMi2Whpx3cysEqwRmuVWoyJFgLmyphWwrhiI=;
        b=zX/g2VqXrjJShUDQJmis/sEpBh3NJ+S6SuJA0+9CssDsq6eDf339xEBIouy7AtojXU
         JXloygbO7BHWZm+Rv4cXc08SX05Hw4OHbj3Gu5w1aQ9utr8i3CtNV/teCWlBscc8UZs4
         OmaEeidmKG7teAywy/Rjzg0a/4C9nOxSy2LfjBVPu6KThGUkxCrhjvWGO6gkRxP46UES
         BS0K0sO+QNC/S1BuMEaGJv1lAEC2VLrfhZVO2edEnaY/j7M52sXMnFcIszUQ8S6Xe4c8
         +pTEHd0POxGN4GNwUBtQe2vHaXA03U9frGoZ6ogpgKud9Q7jBOq70ZkTHqNxidQdf/Ky
         9KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfJVQj8eMi2Whpx3cysEqwRmuVWoyJFgLmyphWwrhiI=;
        b=Zq98AHI4ViYb9tJNPe9BjtdSa/0AXDD6FRhSyUZRxyDj97dRf/XnuxrIxpOFFWJOTD
         RaeoxuWgddJNGLnUMeSHu5RbYsDapcxXkz2NLDdscgAdsSVIg+BPmrlXpM8zwtONO263
         y/CbWIcF1QmDrns2Lymb473/xXpUmuebUOe241Ptu7fttocAw8RUtwSudxex3Z57aYB8
         Xm2mhH8knVFMNUy4EIp70HJ8jJFf9vDO4kMqOtMsSTaCysFqBI9Ca7biAjz1znSxPxvH
         SfdnaNIgjgHd+YkKLvAYvke6DwZXjFm9dwcciDXFmsXDSidg9j5i9WseDhcgQhNJWbJ7
         tmqw==
X-Gm-Message-State: AOAM530V2rnL52sEMAL0M3tXuI8nvqiVqbxRX3TaQ4ePXROZJhzDmSit
	QVQRlndhpmF8FeeJ3lhD03d1qHLVJvpUb+WYce4=
X-Google-Smtp-Source: 
 ABdhPJy2uVQcEI40Z0mpO1/D0FJpOE8EDFQ2a9EVRnizhTg/ZiRuT6mGM8+PWzWuXE8Kf9luVq979g==
X-Received: by 2002:a63:f14f:0:b0:39d:9761:c0c7 with SMTP id
 o15-20020a63f14f000000b0039d9761c0c7mr38015pgk.529.1651248068876;
        Fri, 29 Apr 2022 09:01:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/34] Patch review
Date: Fri, 29 Apr 2022 06:00:19 -1000
Message-Id: <cover.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165019

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3589

with the exception of qemuarm-oe-core, which was due to operator error (this
test uses oe-core + bitbake repos and I neglected to push the corresponding
oe-core)

Passed after pushing and retesting:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/5132

The following changes since commit ca1c990df62f1b3d53b2114a387f192efe7e38e8:

  ruby: upgrade 3.1.1 -> 3.1.2 (2022-04-28 17:07:01 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  glib: upgrade 2.72.0 -> 2.72.1
  libxml2: update patch status

Carlos Rafael Giani (2):
  gstreamer1.0-plugins-good: Fix libsoup dependency
  gstreamer1.0: Minor documentation addition

Chen Qi (2):
  cases/buildepoxy.py: fix typo
  go.bbclass: disable the use of the default configuration file

Davide Gardenal (1):
  create-spdx: delete virtual/kernel dependency to fix FreeRTOS build

Dmitry Baryshkov (2):
  linux-firmware: correct license for ar3k firmware
  arch-armv8-2a.inc: fix a typo in TUNEVALID variable

Henning Schild (1):
  wic: do not use PARTLABEL for msdos partition tables

Khem Raj (7):
  seatd: Disable overflow warning as error on ppc64/musl
  musl: Fix build when usrmerge distro feature is enabled
  gcompat: Fix build when usrmerge distro feature is enabled
  libc-glibc: Use libxcrypt to provide virtual/crypt
  qemu.bbclass: Extend ppc/ppc64 extra options
  busybox: Use base_bindir instead of hardcoding /bin path
  util-linux: Create u-a symlink for findfs utility

Naveen Saini (1):
  gstreamer1.0-plugins-bad: drop patch

Nicolas Dechesne (1):
  sanity: skip make 4.2.1 warning for debian

Paul Gortmaker (1):
  install/devshell: Introduce git intercept script due to fakeroot
    issues

Peter Kjellerstedt (2):
  terminal.py: Restore error output from Terminal
  devshell.bbclass: Allow devshell & pydevshell to use the network

Pgowda (1):
  glibc: ptest: Fix glibc-tests package issue

Rahul Kumar (1):
  neard: Switch SRC_URI to git repo

Richard Purdie (2):
  base: Drop git intercept
  staging: Ensure we filter out ourselves

Ross Burton (5):
  e2fsprogs: fix CVE-2022-1304
  python3: ignore CVE-2015-20107
  cve_check: skip remote patches that haven't been fetched when
    searching for CVE tags
  subversion: upgrade to 1.14.2
  bitbake.conf: mark all directories as safe for git to read

Russ Dill (2):
  package.bbclass: Prevent perform_packagecopy from removing
    /sysroot-only
  kernel-yocto.bbclass: Fixup do_kernel_configcheck usage of KMETA

wangmy (1):
  apt: upgrade 2.4.4 -> 2.4.5

 meta/classes/create-spdx.bbclass              |  2 -
 meta/classes/devshell.bbclass                 |  4 ++
 meta/classes/go.bbclass                       |  1 +
 meta/classes/kernel-yocto.bbclass             | 14 ++--
 meta/classes/package.bbclass                  |  8 +--
 meta/classes/qemu.bbclass                     |  6 +-
 meta/classes/sanity.bbclass                   |  2 +-
 meta/classes/staging.bbclass                  |  2 +-
 meta/conf/bitbake.conf                        |  8 +++
 meta/conf/distro/include/tclibc-glibc.inc     |  1 +
 .../machine/include/arm/arch-armv8-2a.inc     |  2 +-
 meta/lib/oe/cve_check.py                      |  5 +-
 meta/lib/oe/terminal.py                       |  3 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 ++--
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 ...s-for-typechecking-with-atomic-compa.patch | 64 -----------------
 ...variant-of-g_atomic_int_compare_and_.patch | 70 ------------------
 ...ble-more-tests-while-cross-compiling.patch | 32 ++++-----
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
 ...{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} |  4 +-
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +-
 .../recipes-core/libxml/libxml2/runtest.patch |  4 +-
 meta/recipes-core/musl/gcompat_git.bb         |  8 +--
 meta/recipes-core/musl/musl_git.bb            |  6 +-
 meta/recipes-core/seatd/seatd_0.6.4.bb        |  3 +
 .../util-linux/util-linux_2.37.4.bb           |  1 +
 .../apt/{apt_2.4.4.bb => apt_2.4.5.bb}        |  2 +-
 .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
 .../recipes-devtools/python/python3_3.10.4.bb |  3 +
 .../subversion/subversion/disable_macos.patch | 71 -------------------
 ...version_1.14.1.bb => subversion_1.14.2.bb} |  3 +-
 .../linux-firmware/linux-firmware_20220411.bb |  4 +-
 .../0005-msdk-fix-includedir-path.patch       | 40 -----------
 .../gstreamer1.0-plugins-bad_1.20.1.bb        |  3 +-
 .../gstreamer1.0-plugins-base_1.20.1.bb       |  2 +
 .../gstreamer1.0-plugins-good_1.20.1.bb       |  7 +-
 scripts/git-intercept/git                     | 19 +++++
 scripts/lib/wic/plugins/imager/direct.py      |  2 +-
 40 files changed, 174 insertions(+), 317 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} (90%)
 rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} (97%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/disable_macos.patch
 rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb => subversion_1.14.2.bb} (96%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
 create mode 100755 scripts/git-intercept/git

-- 
2.25.1


