Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC855C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 15:35:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.12389.1651160118004409179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3IV3ty9i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso8055613pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNlWIPStEq6OpvP2NOcJxNIanzI6fKHDO2ZLBiR5x6Q=;
        b=3IV3ty9iGd/Tg8Yr/yoXxh0yi7xPZRRKy0613MyWqPLMe2BJq/NHOVs+XveyK7nJyI
         NJwDiUglznBQ8/u+I+hrQ7N2eXXYIXzKNhXSufsh/b6kkMY7nU970kt0lX+XOZxn2zM0
         J3b6WqyT0kIdOa9KhdaoOLRq3Cg8top9btK+bknfSTnZ96UbXw7KTa7UK8cTn20tDSI+
         3nXNqPutwyOCJUpoOuxc46KcO/nzkBXoRI333V+NJXuCN+2hmNV83DL7lGnSZtpZDW1h
         BhJjzgsX8JrYMcYpp7P97Wzj6u77v+Dj+Vhf86xJcOKuU5OgCLOnAm06gRiGOk8CanLS
         ifxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNlWIPStEq6OpvP2NOcJxNIanzI6fKHDO2ZLBiR5x6Q=;
        b=BsQe6dMs4rP5LysN98K2A4BEJ1GPLzgakc4uSV60Nu27GZlfpRhYdfYEoZa75fd2tD
         Rbmf6/lcgxD16gQl7m1u4jA9eagNmBz9pt/6e6HoClOZtk9YSrKcVnLGxervE4Cz4eOF
         p/AWmr1rqx5+0dnF355Sm1s2fLw1hzGNaRUeL+7zqC2op4aW1jULpNKT5GtFdFrFdT/G
         aWaPvs2siQPZXjY+qqS3ZBU+yx/UjtbbryrCGCoxPvkXZI8xOCTizEOYjhcSxy2Te1Wi
         0nOTiWwFHt9fI1z+XXwnqAIIt9GgYKftGeFxqdinWCrJFyuDTN9WzA7MT4Fy63eY1qSX
         FcOQ==
X-Gm-Message-State: AOAM5322rlntg/psgZXAuKgHyblBcP+5mfDdS15VecXZ+apn9BnYoSs8
	/irwBZn3wp7V11p0TTmxoHPt1wsMVoIWYnTqyt8=
X-Google-Smtp-Source: 
 ABdhPJyBnqIj9igv6v3+0gX4qoAMRfQlSsAT31EwMi7yZqvXugFjn7pKhZ+21NpaZGCZt6UA3TDiWw==
X-Received: by 2002:a17:90b:1e0c:b0:1d9:75da:261e with SMTP id
 pg12-20020a17090b1e0c00b001d975da261emr24415510pjb.130.1651160116471;
        Thu, 28 Apr 2022 08:35:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 li12-20020a17090b48cc00b001d983f83959sm11059284pjb.57.2022.04.28.08.35.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 08:35:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/26] Pull request (cover letter only)
Date: Thu, 28 Apr 2022 05:35:07 -1000
Message-Id: <cover.1651159932.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 15:35:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164969

The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:

  lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  webkitgtk: adjust patch status

Davide Gardenal (1):
  create-spdx: fix error when symlink cannot be created

Ferry Toth (2):
  apt: add apt selftest to test signed package feeds
  package_manager: fix missing dependency on gnupg when signing deb
    package feeds

Jon Mason (1):
  qemuarm64: use virtio pci interfaces

Kai Kang (1):
  update_udev_hwdb: fix multilib issue with systemd

Khem Raj (5):
  babeltrace: Disable warnings as errors
  xserver-xorg: Fix build with gcc12
  systemtap: Fix build with gcc-12
  gnupg: Disable FORTIFY_SOURCES on mips
  mdadm: Drop clang specific cflags

Konrad Weihmann (2):
  git: correct license
  ncurses: use COPYING file

Martin Jansa (1):
  systemd-boot: remove outdated EFI_LD comment

Paulo Neves (1):
  selftest/lic_checksum: Add test for filename containing space

Peter Kjellerstedt (2):
  u-boot: Correct the SRC_URI
  u-boot: Inherit pkgconfig

Richard Purdie (1):
  buildtools-tarball: Only add cert envvars if certs are included

wangmy (5):
  linux-firmware: upgrade 20220310 -> 20220411
  libsoup: upgrade 3.0.5 -> 3.0.6
  apt: upgrade 2.4.3 -> 2.4.4
  libusb1: upgrade 1.0.25 -> 1.0.26
  libgit2: upgrade 1.4.2 -> 1.4.3

zhengruoqin (3):
  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
  git: upgrade 2.35.2 -> 2.35.3
  ruby: upgrade 3.1.1 -> 3.1.2

 meta/classes/create-spdx.bbclass              | 10 +--
 meta/classes/sign_package_feed.bbclass        |  1 +
 meta/conf/machine/qemuarm64.conf              |  8 +-
 meta/lib/oeqa/runtime/cases/apt.py            | 38 ++++++--
 meta/lib/oeqa/selftest/cases/lic_checksum.py  | 18 ++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 38 ++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  6 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |  6 +-
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 .../systemd/systemd-boot_250.4.bb             |  1 -
 meta/recipes-core/systemd/systemd_250.4.bb    |  5 --
 meta/recipes-core/udev/eudev_3.2.10.bb        |  4 -
 .../apt/{apt_2.4.3.bb => apt_2.4.4.bb}        |  2 +-
 .../git/{git_2.35.2.bb => git_2.35.3.bb}      | 15 +++-
 .../ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb}     |  2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 -
 .../0001-render-Fix-build-with-gcc-12.patch   | 90 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.3.bb       |  1 +
 ...20220310.bb => linux-firmware_20220411.bb} |  4 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |  2 +-
 ...ility-re-tweak-for-rhel6-use-functio.patch | 49 ++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  3 +-
 ....02.18.bb => wireless-regdb_2022.04.08.bb} |  2 +-
 ...spection.cmake-prefix-variables-obta.patch |  5 +-
 meta/recipes-support/gnupg/gnupg_2.3.4.bb     |  3 +
 .../{libgit2_1.4.2.bb => libgit2_1.4.3.bb}    |  2 +-
 .../{libsoup_3.0.5.bb => libsoup_3.0.6.bb}    |  2 +-
 .../{libusb1_1.0.25.bb => libusb1_1.0.26.bb}  |  2 +-
 scripts/postinst-intercepts/update_udev_hwdb  |  5 +-
 29 files changed, 279 insertions(+), 49 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)
 rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (86%)
 rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)
 rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)
 rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)
 rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)

-- 
2.25.1


