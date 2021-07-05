Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.537.1625524518199564767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FIl8NWLo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so19740949oti.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=My3ixA4tC16zFyCPxMhasRwtk7KZ7X/tSYbLvV8sYyU=;
        b=FIl8NWLo+w6ooJzJ8sb/V/Fh6EdJ3UnGtSjh0qzSdQdi3/+QxV4U7K/iXvnOpveGWm
         n2BdT8DF4W/C2VWcCn5+mkptUjzTF167z862Rpg6WD4oFBXkWcvcRQvWv5LuO8buBnM6
         I+o0dza+8VEYwHbJUss04WplfFGUdP4935WYlZncMktQ3dlA3uct/64XgthLASJTMZ3a
         TcchvibJgnVGAdQJmGojU+WW7o1LIa94v2x1g84R6pvhsS4srntY9qx0XrT7NIdieeJq
         pZ8bvU0rfjieMZLRhfi+N2jjr6MtM5nNW1hUb7xeH3oQRkrTUL8HOxkRZl31FxAJFSCG
         8kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=My3ixA4tC16zFyCPxMhasRwtk7KZ7X/tSYbLvV8sYyU=;
        b=RXSzd4xfKs9Q3f4+G8RqaqX/Wt6G1MMdOEeqjqc7ZCS/Pv0U1w93k84EdCJvFC5JKo
         yRAYLd6R/dEk2RSpcsUsgAc3PIsLGrChod6PHD23oE9AHISO6gy5Gmq/fjx08F/t/h+U
         zO5dr2Ar9YY/lMKuBTR47j3m8Ly0A9EQDhk82Gcezy9I/1GexXPakn2YI9vTV7KE0V1U
         5SnlQZutFi6FCQb3D4tL1ezPzhAGhEy+KwlxUTr1Gnllq/a683/GSYNqlHUCmBhl6vCv
         UD/JCtr5DnFo2vl0UqLCTTjnnoXaXltZwXAW1SJmPnbKI6ZHIsfkAonPQa8OtFpDI3Is
         sXZA==
X-Gm-Message-State: AOAM531zS8bSS1gSdHN9s6hwSR6s7JmIcjLRLRBOLoco2e6zr/xKzDn5
	PQ+++pkjN/jTooUllT62f4/cF6It25HlThj5
X-Google-Smtp-Source: ABdhPJw0Y3x0i4pLTDOHFBwgpM9eHiO+3AMqn0qS4jkdnwTbzNMH+nFgzk6jJ8BioZcLR35jmZBXQQ==
X-Received: by 2002:a05:6830:3185:: with SMTP id p5mr6213797ots.135.1625524517032;
        Mon, 05 Jul 2021 15:35:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Patch review
Date: Mon,  5 Jul 2021 12:34:37 -1000
Message-Id: <cover.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pleas review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2318

The following changes since commit 9423ad8f0f42d249c2fcb1b86ec9abb75854f011:

  python3-ptest: add newly discovered missing rdeps (2021-06-28 05:01:39 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  python3: apply test skipping patch unconditionally
  selftest: do not hardcode /tmp/sdk
  pypi: set SRC_URI with _prepend, not with +=

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.124
  linux-yocto/5.4: update to v5.4.125
  linux-yocto/5.4: update to v5.4.128
  linux-yocto/5.4: update to v5.4.129

Florian Amstutz (1):
  devtool: deploy-target: Fix preserving attributes when using --strip

Michael Ho (1):
  sstate.bbclass: fix errors about read-only sstate mirrors

Minjae Kim (2):
  rpm: fix CVE-2021-3421
  gstreamer-plugins-base: fix CVE-2021-3522

Richard Purdie (7):
  kernel: Fix interaction when packaging disabled
  kernel-devicetree: Fix interaction when packaging disabled
  perf: Use python3targetconfig to ensure we use target libraries
  package_pkgdata: Avoid task hash mismatches for generic task changes
  oeqa/selftest/runcmd: Tweal test timeouts
  sstate/staging: Handle directory creation race issue
  oeqa/selftest/archiver: Allow tests to ignore empty directories

Tim Orling (1):
  python3: skip tests requiring tools-sdk

 meta/classes/kernel-devicetree.bbclass        |  11 +-
 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/package_pkgdata.bbclass          |   2 +-
 meta/classes/pypi.bbclass                     |   2 +-
 meta/classes/sstate.bbclass                   |  16 +-
 meta/classes/staging.bbclass                  |   6 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |  16 +-
 meta/lib/oeqa/selftest/cases/runcmd.py        |   4 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  28 ++-
 ...pes.test_find-skip-without-tools-sdk.patch |  33 +++
 .../recipes-devtools/python/python3_3.8.10.bb |   1 +
 .../rpm/files/CVE-2021-3421.patch             | 197 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../CVE-2021-3522.patch                       |  36 ++++
 .../gstreamer1.0-plugins-base_1.16.3.bb       |   1 +
 scripts/lib/devtool/deploy.py                 |   2 +-
 20 files changed, 338 insertions(+), 58 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch

-- 
2.25.1

