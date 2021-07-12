Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.12890.1626103938992990046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nwIv9dre;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so10674447pju.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4p1EC151P5WIZZhVvsvAVtHdcFNW/JsOoTMrZyXyM94=;
        b=nwIv9dreyFzaoxGcR3kLy9YYUkkXNeJ1ZRg73ABYwEdeFZtdJEU13TN26sYyJSpPP3
         5NlUxrmtaj1bPLGgbee7YPjjRafC1W36ZdTSapO0zrUVAYxdy85Wrst6bPGjIC5Mlqa8
         vHvjeu7wlzedMRJTUbb+4sQj/eOEigd0WpaQA56CZegDvW1eyD8yD/qUsV0nSoEwusi2
         wnQnxEe85SyE+hVhD1OgneuWzNbNxyWkVao/UT1TwGOBpGiOG0hu2ohISCnoebucBWMA
         jDJHPFlYDpw1YBJb1IPgSILFmXfRsE+6o7feHxvyIaopGLR/Gua8haL5CMymgRETIPJC
         NO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4p1EC151P5WIZZhVvsvAVtHdcFNW/JsOoTMrZyXyM94=;
        b=MqrdHmWG0WFkfu3E0mumoNF6krPblxzD/HV0QzL8UMFA2qIHSpxcFAjSBAjoq/LBW1
         GzXfh6BBM1GZriiI/j1forI1DQQIcTVKEIMweM50+d94Yc1Onhkcz4lH/R4i1JkV9Htq
         PeDa+zY+ISliXBRAiMh00AMijfL/j+6u7CTXJpadHuevOanoCxyIJETQJAOJv1mYoom8
         oTQ/10twHFn5MXHjA51Yt2ZQ+vVdG+Zu2b2V3R1HnAmTOCZeC9T2vkpLor+R/S5jBMfd
         9jD41Vpqo7COtuffSU9EjIVOsjM4Ewd7JPbnSdg4W8iMDNb65OtAAwxz34CEw7k1Ln7A
         oLnA==
X-Gm-Message-State: AOAM533LityCmD7Fly+V0G+aYoN/LviRhbxg9K1FX9GM+hEc6BmaOPLS
	dXfSXOj7G9ysgmA54rAFjP8E3lnp1MuuMydV
X-Google-Smtp-Source: ABdhPJyRcXb41Dzd4aA+hPuNjkXuGV5Q2uWe+SJTeljegqo+IBKLUeEQ0pOfJeK1bvYD8r9AntZ3nQ==
X-Received: by 2002:a17:90a:f00b:: with SMTP id bt11mr14857216pjb.10.1626103937883;
        Mon, 12 Jul 2021 08:32:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Mon, 12 Jul 2021 05:31:53 -1000
Message-Id: <cover.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2338

The following changes since commit c96bcf97272f243df14598c84a41097746884b65:

  oeqa/selftest/archiver: Allow tests to ignore empty directories (2021-07-06 04:37:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  bootchart2: update 0.14.8 -> 0.14.9

Chen Qi (1):
  busybox: fix CVE-2021-28831

Khem Raj (1):
  webkitgtk: Upgrade to 2.28.4

Marek Vasut (1):
  update-rc.d: update SRCREV to pull in fix for non-bash shell support

Minjae Kim (1):
  dhcp: fix CVE-2021-25217

Richard Purdie (4):
  webkitgtk: upgrade 2.28.2 -> 2.28.3
  dwarfsrcfiles: Avoid races over debug-link files
  oeqa/selftest/multiprocesslauch: Fix test race
  report-error: Drop pointless inherit

Steve Sakoman (1):
  glibc: update to lastest 2.31 release HEAD

Tim Orling (1):
  python3: upgrade 3.8.10 -> 3.8.11

Zoltán Böszörményi (1):
  tzdata: Allow controlling zoneinfo binary format

 meta/classes/report-error.bbclass             |   2 -
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |   3 +-
 .../dhcp/dhcp/CVE-2021-25217.patch            |  66 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   1 +
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  51 +++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |   2 +-
 ...tchart2_0.14.8.bb => bootchart2_0.14.9.bb} |   3 +-
 .../dwarfsrcfiles/files/dwarfsrcfiles.c       |  13 +-
 .../recipes-devtools/python/python3_3.8.11.bb | 362 ++++++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  10 +-
 ...build-errors-due-to-WWc-11-narrowing.patch |  66 ++++
 .../webkit/webkitgtk/CVE-2020-13753.patch     |  15 -
 ...ebkitgtk_2.28.2.bb => webkitgtk_2.28.4.bb} |   5 +-
 15 files changed, 571 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2021-25217.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.8.bb => bootchart2_0.14.9.bb} (99%)
 create mode 100644 meta/recipes-devtools/python/python3_3.8.11.bb
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.2.bb => webkitgtk_2.28.4.bb} (97%)

-- 
2.25.1

