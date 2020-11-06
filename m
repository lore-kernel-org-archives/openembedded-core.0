Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.12536.1604673379134504135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=waEbXeU8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id z3so1483659pfb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=61L81cdiYMM8GJ/p7SuZaL0mXbJjWe6ddQ0BjNhTMVg=;
        b=waEbXeU89Z3cgP+e3mPgquw7s5eOR34e9vmlYbvd/clIvyXUWm8uLBqPoXBk60D0yW
         dP62i0QvEmDhiWgkizvUNKlVBm4n66ViqOBFsbSv32CG31B5W9GAcjvcnwQ85F6CV1T6
         gdFMKVxqgjjm8ejvh5cBiGwa17mD5SdWKGpmxuczFmLcRLK/iGDxGySsm49J0fuWA0jX
         NUaZ05AOLGBNEC2Hl85rGsCcR9JKKxPhPDz+hoBU2OvIYiNBAuihWMPIueZprz96Ucir
         0FtZwzbIEn1a4/9Mel/0p1ctluKEADuwe04TFAb05jt0ItCFVYV7bPAy8cRPmJOdQxCj
         Dlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=61L81cdiYMM8GJ/p7SuZaL0mXbJjWe6ddQ0BjNhTMVg=;
        b=rHm4sKg8+Ri7GOxNAZfwB4KgDcDaU0gzdg34GNo6r1J9rOVT8xZuV6X8dS0g219tAd
         W0RTibpPrjsVfWNEbql8h5NWdN8g2O3Y+JIL46kfWFBvwBwWgEW+to2+9xevZYgwdHXr
         O6v79QlaNnDERvitS3KT0ytVJRoalrbcl9911Km1IUUrtSLwD077zMi1ALbUN6xMFIxj
         NXCjVfJDyJdyREvgU8nLAFY9t3RlkpUrnOzCsHqdCGlGs85qvQuBgSrAnLdCuakyQcE5
         SAM+MKU10ERkGTBFdTPNF9FmQGkhG0rd4C/tD1SPJOpsAO2RRNZg0AOsduZ2PN5fRLOM
         3ryQ==
X-Gm-Message-State: AOAM530v1nlA8fMkQOmXNXzaVcaIh67hz0ttcGwiQu2MdYnErwCYZS3l
	/z5SNwINCum0pGXL4uQE2RQEGAb1S3RvuNHC
X-Google-Smtp-Source: ABdhPJzF5LhpIlb6ur3ysGJAtq4L85k7m6xTaUXpdtQC2u4g1B/wjTMJp98YcJe+yBgK5zo2/64ppg==
X-Received: by 2002:a62:19c6:0:b029:18b:5c6a:2ae6 with SMTP id 189-20020a6219c60000b029018b5c6a2ae6mr2316277pfz.14.1604673377925;
        Fri, 06 Nov 2020 06:36:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/20] Patch review
Date: Fri,  6 Nov 2020 04:35:15 -1000
Message-Id: <cover.1604672838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder with exception of known intermittent failure on
oe-selftest-centos (Unable to start bitbake server)

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1547

Passed on susequent oe-selftest-centos build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1532

The following changes since commit 5f644082fc3c2bbd89b898d5ca7cd4414cda4a64:

  nasm: update 2.14.02 -> 2.15.03 for CVE fixes (2020-11-02 04:05:13 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrey Zhizhikin (1):
  insane: add GitLab /archive/ tests

Changqing Li (1):
  timezone: upgrade to 2020d

Chee Yang Lee (1):
  bluez5: update to 5.55 to fix CVE-2020-27153

Joshua Watt (1):
  jquery: Upgrade 3.4.1 -> 3.5.0 to fix CVE-2020-11022 and
    CVE-2020-11023

Mark Jonas (4):
  Add license text for PSF-2.0
  Map license names PSF and PSFv2 to PSF-2.0
  libsdl2: Fix directfb syntax error
  libsdl2: Fix directfb SDL_RenderFillRect

Martin Jansa (3):
  lib/oe/patch: prevent applying patches without any subject
  lib/oe/patch: GitApplyTree: save 1 echo in commit-msg hook
  Revert "lib/oe/patch: fix handling of patches with no header"

Richard Leitner (1):
  xcb-proto: backport fix for python gcd function

Richard Purdie (1):
  sstatesig: Log timestamps for hashequiv in reprodubile builds for
    do_package

Steve Sakoman (5):
  sqlite3: fix CVE-2020-13434
  sqlite3: fix CVE-2020-13435
  sqlite3: fix CVE-2020-13630
  sqlite3: fix CVE-2020-13631
  sqlite3: fix CVE-2020-13632

Yann E. MORIN (2):
  common-licenses: add bzip2-1.0.4
  recipes-core/busybox: fixup licensing information

 meta/classes/insane.bbclass                   |   4 +-
 meta/conf/licenses.conf                       |   6 +-
 meta/files/common-licenses/PSF-2.0            |  49 ++++
 meta/files/common-licenses/bzip2-1.0.4        |  43 ++++
 meta/lib/oe/patch.py                          |  13 +-
 meta/lib/oe/sstatesig.py                      |   6 +
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} |   4 +-
 meta/recipes-core/busybox/busybox.inc         |   7 +-
 .../{jquery_3.4.1.bb => jquery_3.5.0.bb}      |   8 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../libsdl2/directfb-renderfillrect-fix.patch |  33 +++
 ...ectfb-spurious-curly-brace-missing-e.patch |  49 ++++
 .../libsdl2/libsdl2_2.0.12.bb                 |   2 +
 ...1-xcbgen-use-math-gcd-for-python-3-5.patch |  40 ++++
 .../xorg-proto/xcb-proto_1.13.bb              |   3 +-
 .../sqlite/files/CVE-2020-13434.patch         |  48 ++++
 .../sqlite/files/CVE-2020-13435.patch         | 219 ++++++++++++++++++
 .../sqlite/files/CVE-2020-13630.patch         |  32 +++
 .../sqlite/files/CVE-2020-13631.patch         |  99 ++++++++
 .../sqlite/files/CVE-2020-13632.patch         |  34 +++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   5 +
 21 files changed, 684 insertions(+), 26 deletions(-)
 create mode 100644 meta/files/common-licenses/PSF-2.0
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)
 rename meta/recipes-devtools/jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb} (73%)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13434.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13435.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13630.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13631.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13632.patch

-- 
2.17.1

