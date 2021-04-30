Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.13415.1619796860531096913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KYlI0bCp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so1939931pjh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74OlB0WdNo2DvfTTETUudKcgZjZbfJPRvlMLw6GW1hc=;
        b=KYlI0bCpGrd07wJBUsOGkopWvxF6Z4C+CHpdOPpZ+KCFA53RzZHQLx0L6SgTdAd78R
         nRFpc72fia3ACHihBDb+XhYPN/eBHSOiJGt2rcluHPcUu7WF0gC5P96pKxidhwFlB0N2
         sDW+J3K8yNyj1HFEDt8YvcRi4WsVU5GGqBdIG0LeeE/eYTuaY3bz+bPfvKU7L7vTmm2a
         dVoXJEBzccGnVSK4OyjsBz6sY7ydmKwJkSCvTKkziO9xfLWzAKjsmBDJ/UidNwhzHSJo
         msPfm784xw/knH6J3ushwGn8X+b03oP+8g38mDFBD/Mx/sJWpWvpsDnpXsDtKJpfzxeC
         iJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74OlB0WdNo2DvfTTETUudKcgZjZbfJPRvlMLw6GW1hc=;
        b=PuvnC7CbtcP72W+k6LqqOgbqCNdj4duCXBkrgO58lxL/rd12WqpGlfB8wfdCg9upwn
         pYewUogd5brMHHebg9l6K23KJEAgUsZEJtVcpDVx2UOtZPn6ZY3YlV6biuVQcMZBqsWa
         ct4xnSsMZnYBQORXjFLv+9KaG5iRlkNZSlmPUN/Ifwvz9MGqac29lYO8C7dbwYft6lAR
         HO/Tw1pvsTifYWT9//J7LJ7tCqJ6LtWnQIM8yKlXKZ0HnYW8a/x/54zenbcg6ss1/DtG
         N2hp8paGSshFmGK4Xy8KEeI+bwm2/27jB9iGoJINZtcQrhGecoWaebdo5zrN5wjV4kfT
         rEAA==
X-Gm-Message-State: AOAM532kgQipin467q3pl5VPWgWm4w17IAY4cLs4RU+U2LaYwurCKiul
	eCg7t7Ua2dXZIpsgdLy6y2YdGQhFNxOHDDuM
X-Google-Smtp-Source: ABdhPJxC9aQI65hGXEecZWsmZ6ywusLlnSCQF9HWv1mRm+vca027iksL7vkzj8oxLm7NzgMxRG/Ryg==
X-Received: by 2002:a17:90b:110b:: with SMTP id gi11mr15195728pjb.173.1619796859472;
        Fri, 30 Apr 2021 08:34:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Fri, 30 Apr 2021 05:33:39 -1000
Message-Id: <cover.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2087

The following changes since commit 2cc9e06807026b86038db88c2175c626feadc0be:

  linux-yocto/5.4: fix arm defconfig warnings (2021-04-22 06:23:22 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  oeqa: tear down oeqa decorators if one of them raises an exception in
    setup
  meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the
    previous fix

Diego Sueiro (1):
  oeqa/selftest/bblayers: Add test case for bitbake-layers
    layerindex-show-depends

Khem Raj (1):
  go: Use dl.google.com for SRC_URI

Konrad Weihmann (1):
  cve-update-db-native: skip on empty cpe23Uri

Marek Vasut (1):
  linux-firmware: Package RSI 911x WiFi firmware

Reto Schneider (2):
  license_image.bbclass: Detect broken symlinks
  license_image.bbclass: Fix symlink to generic license files

Richard Purdie (1):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies

Vinay Kumar (1):
  Binutils: Fix CVE-2021-20197

Zhang Qiang (1):
  kernel.bbclass: Configuration for environment with HOSTCXX

wangmy (1):
  go: update SRC_URI to use https protocol

 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/license_image.bbclass            |  20 +-
 meta/lib/oeqa/core/case.py                    |   9 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |   5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |  13 +
 meta/lib/oeqa/core/tests/test_decorators.py   |   6 +
 meta/lib/oeqa/selftest/cases/bblayers.py      |   5 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2021-20197.patch    | 572 ++++++++++++++++++
 meta/recipes-devtools/go/go-common.inc        |   2 +-
 .../linux-firmware/linux-firmware_20210208.bb |  11 +
 scripts/yocto-check-layer                     |   3 +
 13 files changed, 646 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch

-- 
2.25.1

