Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BCDC001DF
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.811.1689373989945705593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=X9F9XkAF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b8a8154f9cso15598645ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689373989; x=1691965989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzossHIYtR66ADqS4kq/pCGBzqbPEjpDJX7qSCrTVa8=;
        b=X9F9XkAFcisBFbKwgnEELxVViZilEVX7LHzLv1XNNit/M/Eug5tBLswKHBGktKz9As
         w7B1iCV5PjDnVZLqdeuYapYO5zJ+XHyEtZF5f6WuKEjXs+ku8x63xlNrI6CJS5B/XRzF
         vXb9eElr61aGwIXNKjH7ZU3DaQ7or4PpVK4FpX55+iwg5Xqix3ii8mrW2z9X6pknCGa0
         rv7HcyvCgLYYWUlWacOgRliS5p3C9C0FTqvGasnjtPJ1VDIu3dn504KyGl7Lr4J1JKMh
         4PHwICHfTYqtmgYaAnHvFSm2JtfnKeoNwE1gCSJYkdpkiJRywZWhVWCBDfryKuX1rOfl
         JD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689373989; x=1691965989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzossHIYtR66ADqS4kq/pCGBzqbPEjpDJX7qSCrTVa8=;
        b=SfTE6a1FgWPZaqmw1+epIsFqd+5kXhhw0z9yAhn+SOFB9X1dqZH26P0LmpZ5PRVx36
         VNk9PXkzi6N8X85v4F4piv8Twn8/LUX4MAFB2wtP4OzRy3KuORSyUxgrX63DmEKubvD6
         V0u2q9ARAJMz+YNn3GHXbJQFMXGn49z0Ixj2ve4I7z2dAhp9rcQjJbE9dVt2c8L3Gx4R
         mQSo667ISVUX9Iyn4abfBuB4oNhNzqqqSvYdfySYFTmo59FrG0CPt9KqSp+zpA+wIKLi
         AvITGJ/Y0gn2j5JSY+VMPDsBodv2NLWHnJLm/8JThsUdAICI/t77MNkYRsJT0VTVxVb9
         1KlQ==
X-Gm-Message-State: ABy/qLau5OHrZmSIC/W7JTXLiy9724saCqNuap8sjsD+eICfiLct/ch7
	p8IJV1utSRzTXldImwGeFrb9+Zh2VuUD9xsMnlk=
X-Google-Smtp-Source: APBJJlGCylznIIuet3gMD/Tr1rEFdaseUh2LK2PKItSf8o/ajNjE1no5F1xD7I4/Q8+J3B4A5slLfA==
X-Received: by 2002:a17:903:41d1:b0:1b8:9846:a3b2 with SMTP id u17-20020a17090341d100b001b89846a3b2mr5245383ple.14.1689373988466;
        Fri, 14 Jul 2023 15:33:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/26] Patch review
Date: Fri, 14 Jul 2023 12:32:34 -1000
Message-Id: <cover.1689373875.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184282

Please review this set of changes for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5600

The following changes since commit 64784e90c5ff559f4da6faadb970cc7aff549592:

  cve-update-nvd2-native: actually use API keys (2023-07-13 06:35:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alejandro Hernandez Samaniego (1):
  baremetal-helloworld: Fix race condition

Alexander Kanavin (4):
  diffutils: update 3.9 -> 3.10
  libproxy: fetch from git
  cargo.bbclass: set up cargo environment in common do_compile
  rust-common.bbclass: move musl-specific linking fix from
    rust-source.inc

Changqing Li (1):
  erofs-utils: fix CVE-2023-33551/CVE-2023-33552

Chee Yang Lee (1):
  python3-requests: fix CVE-2023-32681

Etienne Cordonnier (1):
  libxcrypt: fix hard-coded ".so" extension

Joe Slater (1):
  ghostscript: fix CVE-2023-36664

Jose Quaresma (4):
  kernel: config modules directories are handled by kernel-module-split
  kernel-module-split: install config modules directories only when they
    are needed
  kernel-module-split: use context manager to open files
  kernel-module-split: make autoload and probeconf distribution specific

Martin Jansa (2):
  selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
  image-artifact-names: include ${IMAGE_NAME_SUFFIX} directly in both
    ${IMAGE_NAME} and ${IMAGE_LINK_NAME}

Thomas Roos (1):
  testimage/oeqa: Drop testimage_dump_host functionality

Tom Hochstein (1):
  weston: Cleanup and fix x11 and xwayland dependencies

Wang Mingyu (6):
  freetype: upgrade 2.13.0 -> 2.13.1
  gstreamer1.0: upgrade 1.22.3 -> 1.22.4
  libassuan: upgrade 2.5.5 -> 2.5.6
  libksba: upgrade 1.6.3 -> 1.6.4
  libx11: upgrade 1.8.5 -> 1.8.6
  lttng-ust: upgrade 2.13.5 -> 2.13.6

Yi Zhao (1):
  ifupdown: install missing directories

Yoann Congal (1):
  recipetool: Fix inherit in created -native* recipes

Yogita Urade (1):
  dmidecode: fix CVE-2023-30630

 .../multiconfig-image-packager_0.1.bb         |  18 +-
 meta/classes-recipe/cargo.bbclass             |   1 -
 meta/classes-recipe/cargo_common.bbclass      |   4 +
 .../image-artifact-names.bbclass              |   3 +-
 meta/classes-recipe/image-live.bbclass        |   1 -
 meta/classes-recipe/image.bbclass             |   7 +-
 meta/classes-recipe/image_types.bbclass       | 108 ++++----
 meta/classes-recipe/image_types_wic.bbclass   |   2 +-
 .../kernel-module-split.bbclass               |  65 +++--
 meta/classes-recipe/kernel.bbclass            |   2 -
 .../rootfs-postcommands.bbclass               |   2 +-
 meta/classes-recipe/rust-common.bbclass       |   4 +
 meta/classes-recipe/testexport.bbclass        |   6 +-
 meta/classes-recipe/testimage.bbclass         |  20 +-
 meta/classes/cve-check.bbclass                |   4 +-
 meta/lib/oeqa/core/target/qemu.py             |   5 +-
 meta/lib/oeqa/runtime/context.py              |  11 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |   2 +
 meta/lib/oeqa/targetcontrol.py                |   2 -
 meta/lib/oeqa/utils/dump.py                   |  20 +-
 meta/lib/oeqa/utils/qemurunner.py             |  18 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.41.bb |   5 +
 .../images/build-appliance-image_15.0.0.bb    |   6 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   6 -
 .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
 .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
 .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++
 .../dmidecode/dmidecode_3.4.bb                |   4 +
 .../erofs-utils/CVE-2023-33551.patch          |  80 ++++++
 .../erofs-utils/CVE-2023-33552-1.patch        | 221 ++++++++++++++++
 .../erofs-utils/CVE-2023-33552-2.patch        |  97 +++++++
 .../erofs-utils/CVE-2023-33552-3.patch        | 127 ++++++++++
 .../erofs-utils/erofs-utils_1.5.bb            |   4 +
 .../python3-requests/CVE-2023-32681.patch     |  61 +++++
 .../python/python3-requests_2.28.2.bb         |   2 +
 meta/recipes-devtools/rust/rust-source.inc    |   5 -
 .../baremetal-helloworld_git.bb               |   2 +-
 ...001-Skip-strip-trailing-cr-test-case.patch |  19 +-
 .../{diffutils_3.9.bb => diffutils_3.10.bb}   |   2 +-
 .../ghostscript/cve-2023-36664.patch          | 165 ++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |   1 +
 ...{freetype_2.13.0.bb => freetype_2.13.1.bb} |   2 +-
 .../recipes-graphics/wayland/weston_11.0.1.bb |   4 +-
 .../{libx11_1.8.5.bb => libx11_1.8.6.bb}      |   2 +-
 ...ttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} |   2 +-
 ...tools_1.22.3.bb => gst-devtools_1.22.4.bb} |   2 +-
 ...1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} |   2 +-
 ...x_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.4.bb} |   2 +-
 ....22.3.bb => gstreamer1.0-python_1.22.4.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.4.bb} |   2 +-
 ...1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} |   2 +-
 ...er1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb} |   2 +-
 ...{libassuan_2.5.5.bb => libassuan_2.5.6.bb} |   2 +-
 .../{libksba_1.6.3.bb => libksba_1.6.4.bb}    |   2 +-
 .../libproxy/libproxy_0.4.18.bb               |   7 +-
 scripts/lib/recipetool/create.py              |   4 +
 61 files changed, 1455 insertions(+), 228 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33551.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-1.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-2.patch
 create mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/CVE-2023-33552-3.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.9.bb => diffutils_3.10.bb} (93%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-36664.patch
 rename meta/recipes-graphics/freetype/{freetype_2.13.0.bb => freetype_2.13.1.bb} (95%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.5.bb => libx11_1.8.6.bb} (92%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.3.bb => gst-devtools_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.3.bb => gstreamer1.0-plugins-bad_1.22.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.3.bb => gstreamer1.0-plugins-base_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.3.bb => gstreamer1.0-plugins-good_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.3.bb => gstreamer1.0-plugins-ugly_1.22.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.3.bb => gstreamer1.0-python_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.3.bb => gstreamer1.0-rtsp-server_1.22.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb} (97%)
 rename meta/recipes-support/libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb} (93%)
 rename meta/recipes-support/libksba/{libksba_1.6.3.bb => libksba_1.6.4.bb} (94%)

-- 
2.34.1


