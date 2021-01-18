Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.3433.1611009411259442596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LTvEeiZo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id r4so9381860pls.11
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=JgWIgK+EN8QoY7y+4h2kKQjUAdJR3euJmkPitpVpouA=;
        b=LTvEeiZoVfKUvx5KyHq/WDWYN93uGUns0uI9Go72FW4uUiaQxrPBQsjf9AgxHAdoC5
         1eUdxTeF77WSxZR2cbXMMOYkjPHFV7JXq66Myblb714kfJVWEApxuk1XmUALf9hiVya+
         XfmadeJVl4hwOcs8nYu4zwj3QP0f3FjnC/6wPt9U2FO7xmmwPh8SfAK7Qkc6WrPvSYzh
         XwCkkNXYZAf+j6HPwtdgNIBs/JG5TqFLBD9ZJxZYW7WM+ttlGLtwkYtgCGnnXCMee3TU
         f4ddv13bDaeqj8Xwi3uhELOeGxUHDjmlFG4ZVzznyoWFPEGicdXaTWlJHWeHM++jdnyF
         mSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=JgWIgK+EN8QoY7y+4h2kKQjUAdJR3euJmkPitpVpouA=;
        b=pr5dpBb6arsDqgMqDuXgltDgKjcFtmIpIyFb3uJyf7qUY0hr9yCy6Du6o+e4Y704OW
         SZfseFVXHkRtvRerVNPU6/bXqqrCuSE0t+RYlA2D5eZ6eFwsLg8VG0R/aytQ+bfDAZU4
         v4wr+LhQv875OvLOxEnz/V6BllxvoCyRkFL5HUcsg4/9u4vtCDMeggOyFs028L4XpRkJ
         YHtYviJY169J9il8kPg8YltgkIVNb1tD0lwYGaifex6xFWzA+sOQqr259B+d5v47ftQC
         tDJlwtAklJd/PE5MqVk955FjOmZvoKaUs4eMTMGM5tlRYEVTUAt6bn5amGV3iPil6PKN
         rzuQ==
X-Gm-Message-State: AOAM532GRlmUsE+mWaGveIGFslJZw2FfSxiVCFirnUg5lgNkOEe6fUXb
	7F863s1wZ+tZ10k6YOg8gn/CC3FSU3w/mFjgFKI=
X-Google-Smtp-Source: ABdhPJwLJb/qukBVAzhImhZrKP19H9uq1w9iT1ea6Tve//c/ZhU1bpH86yrf3UQYJPvLv036NrkMiQ==
X-Received: by 2002:a17:902:ee14:b029:de:19f0:91b4 with SMTP id z20-20020a170902ee14b02900de19f091b4mr1592912plb.78.1611009409674;
        Mon, 18 Jan 2021 14:36:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.36.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:36:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Patch review
Date: Mon, 18 Jan 2021 12:36:08 -1000
Message-Id: <cover.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1763

The following changes since commit 72431ee8de5e3a53d259cebf420a7713ac9e1f14:

  mobile-broadband-provider-info: upgrade 20190618 ->20201225 (2021-01-08 03:57:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Adrian Herrera (1):
  scripts: oe-run-native, fix *-native directories

Andrey Mozzhuhin (1):
  toolchain-shar-extract.sh: Handle special characters in script path

Armin Kuster (2):
  xorg: Security fix for CVE-2020-14345
  glibc: Security fix for CVE-2020-29573

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.87

Chris Laplante (1):
  systemd.bbclass: improve error message when a service unit specified
    in SYSTEMD_SERVICE is not found

Joshua Watt (1):
  classes/waf: Add build and install arguments

Lee Chee Yang (1):
  curl: fix CVE-2020-8231/8284/8285/8286

Mans Rullgard (1):
  boost: drop arm-intrinsics.patch

Marek Vasut (2):
  meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
  meta: toolchain-shar-relocate.sh: Filter out post-relocate-setup
    script

Michael Ho (1):
  license_image.bbclass: fix missing recipeinfo on self

Mikko Rapeli (1):
  zip: whitelist CVE-2018-13410 and CVE-2018-13684

Robert Joslyn (1):
  ppp: Whitelist CVE-2020-15704

Ross Burton (1):
  waf: don't assume the waf intepretter is good

Sakib Sajal (1):
  buildstats.bbclass: add functionality to collect build system stats

Scott Murray (1):
  glibc: CVE-2019-25013

Thomas Perrot (1):
  go.bbclass: don't stage test data with sources of dependencies

Tomasz Dziendzielski (1):
  lib/oe/utils: Return empty string in parallel_make

 meta/classes/buildstats.bbclass               |   40 +-
 meta/classes/go.bbclass                       |    3 +-
 meta/classes/license_image.bbclass            |    3 +-
 meta/classes/systemd.bbclass                  |    3 +-
 meta/classes/waf.bbclass                      |   18 +-
 meta/files/toolchain-shar-extract.sh          |   12 +-
 meta/files/toolchain-shar-relocate.sh         |    5 +-
 meta/lib/oe/utils.py                          |    2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |    4 +
 .../glibc/glibc/CVE-2019-25013.patch          |  135 ++
 .../glibc/glibc/CVE-2020-29573.patch          |  128 ++
 meta/recipes-core/glibc/glibc_2.31.bb         |    2 +
 meta/recipes-extended/zip/zip_3.0.bb          |    6 +
 .../xserver-xorg/CVE-2020-14345.patch         |  182 +++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |    1 +
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../boost/boost/arm-intrinsics.patch          |   55 -
 meta/recipes-support/boost/boost_1.72.0.bb    |    2 +-
 .../curl/curl/CVE-2020-8231.patch             | 1092 +++++++++++++++++
 .../curl/curl/CVE-2020-8284.patch             |  209 ++++
 .../curl/curl/CVE-2020-8285.patch             |  260 ++++
 .../curl/curl/CVE-2020-8286.patch             |  133 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |    4 +
 scripts/oe-run-native                         |    2 +-
 26 files changed, 2244 insertions(+), 93 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8231.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8284.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8285.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8286.patch

-- 
2.17.1

