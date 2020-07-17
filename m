Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.12903.1594996677598746181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mapG9woK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d1so5522272plr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Q8tAGbkcqnONQuPwpgPdCBwAYxdjG2PFyk4MVsp6Qo8=;
        b=mapG9woKwPSksxviHnOJozOABU8WSHvGmkWk+AMHx+qSWjiOU4zGXXH8Mu4LyfSAsF
         K6xo9F35rb9wUoLzvmquE2KwAtFQFtRwwGU09fpHNdVW8qji5Zh6hbNWuxihjS7wU2ZR
         zxkfl95wLOR1pUXJiWiXaU/PacVHW9KdKRXIcRxMY8z2EM4fyr87mTuqjTR/F9VSvWR9
         kmT7bSIlKvoamJZc22DAKPzsw7gqNEgxTFuQj1nMbwmx12OZ3uMIIshYr1vnI0mEteYc
         4W8L/ld+mwok27LRd8DKFHmvCFrTzX3xwbgRjtcbnh3JubVdIRTW1/fCPzY0ERBOvvnp
         y/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Q8tAGbkcqnONQuPwpgPdCBwAYxdjG2PFyk4MVsp6Qo8=;
        b=hPctgH8K5hbnmFVoLdnKpyHVH9KBjMzme09RD5om4CQRECkkkXk8hzSjnMHypU/7m7
         J6k7rUErHYKh8dqCpDEDaal/+ZNuNsgR69Pib/7oHaMHZBVAYBT1iNC0Y7CDDPm7vByn
         rKHpoLDzfxPcM7FdSps3ep7JdgEynecUBKsqAcBXxH4Iy541nqxQqrC7N7WqadKn5v6H
         VJfGUjRvfXTzBfnHy5Bm3aYo1nTqEmdrygLDzfqZwOTRPGzLrNdxPMxC0G2jPhPgOO29
         gCHkC6UmyOzeG3Q42VeLy2ZFVIYokABDwOcrszzN5ui36rA4rvn4gqHCiQo0Cn69YdNo
         gCNw==
X-Gm-Message-State: AOAM531QG68KS4N+u6P7uL0faQhczOkkxHE7iv5G7J7cPvO4lih+Q/wm
	+mTrDpt9gAEExsXaTf7MKTRjdS1Ac1s=
X-Google-Smtp-Source: ABdhPJwqqU356OquKxH5kgvGfXwuPDyqSGjXeU07vL2B+kaOSlSaRGb/qarOQbcE41ouk4UFsuvOPQ==
X-Received: by 2002:a17:90a:266f:: with SMTP id l102mr10070457pje.144.1594996676286;
        Fri, 17 Jul 2020 07:37:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.37.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:37:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/20] Patch review
Date: Fri, 17 Jul 2020 04:37:05 -1000
Message-Id: <cover.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments
back by end of day Tuesday.

Passed a-full build on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1179

The following changes since commit c2ad3af9da9bb3a98c1d5d1b3d21eb8db643c189:

  coreutils: don't split stdbuf to own package with single-binary (2020-07-13 17:14:28 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  babeltrace: correct the git SRC_URI

Charlie Davies (1):
  u-boot: fix condition to allow use of *.cfg

Christian Eggers (1):
  avahi: Fix typo in recipe

Douglas (2):
  nativesdk: clear MACHINE_FEATURES
  nativesdk: Set the CXXFLAGS to the BUILDSDK_CXXFLAGS

Jens Rehsack (2):
  subversion: extend for nativesdk
  serf: extend for nativesdk

Khem Raj (2):
  go: Disbale CGO for riscv64
  go-dep: Fix build on riscv64

Konrad Weihmann (1):
  ptest: append to FILES

Lee Chee Yang (1):
  bison: fix Argument list too long error

Richard Purdie (4):
  oeqa/selftest/sstatetests: Avoid polluting DL_DIR
  qemurunner: Ensure pid location is deterministic
  qemurunner: Add extra debug info when qemu fails to start
  oeqa/utils/qemurunner: Fix missing pid file tracebacks

Ross Burton (1):
  insane: consolidate skipping of temporary do_package files

Tim Orling (2):
  lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
  scripts/lib/recipetool/create.py: fix regex strings

Yongxin Liu (2):
  linux-firmware: fix the wrong file path for ibt-misc
  linux-firmware: move ibt-misc to the end of ibt packages

 meta/classes/insane.bbclass                   |     13 +-
 meta/classes/nativesdk.bbclass                |      3 +-
 meta/classes/ptest.bbclass                    |      2 +-
 meta/lib/oe/recipeutils.py                    |      2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |      5 +-
 meta/lib/oeqa/utils/qemurunner.py             |     15 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |      2 +-
 meta/recipes-connectivity/avahi/avahi_0.7.bb  |      2 +-
 meta/recipes-devtools/bison/bison_3.5.3.bb    |      2 +-
 .../0001-Update-sys-module-to-latest.patch    | 145574 +++++++++++++++
 meta/recipes-devtools/go/go-dep_0.5.4.bb      |      1 +
 meta/recipes-devtools/go/go-runtime_1.14.bb   |      1 +
 meta/recipes-devtools/go/go_1.14.bb           |      2 +-
 .../subversion/subversion_1.13.0.bb           |      2 +-
 .../linux-firmware/linux-firmware_20200619.bb |      5 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.2.bb |      2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb |      2 +-
 meta/recipes-support/serf/serf_1.3.9.bb       |      2 +-
 scripts/lib/recipetool/create.py              |     10 +-
 19 files changed, 145621 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-Update-sys-module-to-latest.patch

-- 
2.17.1

