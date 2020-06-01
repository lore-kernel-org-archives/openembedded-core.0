Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.38119.1591020701176166012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TwrRFG0x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id f3so3509446pfd.11
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Nq6N9zcBiZYvczjvbMYTzYa2QdTDnkHRDlA11o74Au8=;
        b=TwrRFG0x9Xml2+ynzh81B6p5KJhoBTZa5tpjoro1s2K5a8woDLvVBM/80nNmcYn3IQ
         PiVEQ47OdwaBFItApotWs+c2ZnT5h9E+BGqjJ8K/EouzoHapxEmmF+aksiJSUMHhx/pI
         gtA2LsZEk3i4IOdyVHu40RfDBoMpe4w5RBdbMPxHvOU2Ns3mCf85Trcqyhh2JBFSNX5+
         LCtmUi7lqTPMewtWLqA4KGZhYv9KUWBc2aJvhtvrCiBOm9qc2Ctgdp0w6UNsse4iQdA4
         qsRcIfz93GtMSn07KOROwl/6FVKywJisWJk7OOHhQlV5hB4o+sq3b7GIwe1/6RS2Ruw4
         Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Nq6N9zcBiZYvczjvbMYTzYa2QdTDnkHRDlA11o74Au8=;
        b=ZV2oJIigNJSPsERigK8uOoxUzJ80SKatpPPCdKcJVLWInbeNE9q+iuTVKjZTOViJsD
         vmeUtwaAz86ft7hw9T6em5BjnrEDWHO+PqHN9X901mgC3JpwTBYQEMouS2I0kTQOkyPk
         fXDkrc+Dd5cK35m2IuGhP2/nFyJpt8GvChIQfjDSJC0FA6jEwfav4uqDC9hK63HXsg2f
         3a6bLKT1n9KULZHpw34MYXfxmXyvF52eP9mN5/PnbjPEAPNpW/uLzQEEBV9VHBRqUJo9
         SXuwqjQYrO4aa77rYzcvCtlggcX6GpNwgWljq0BbfEiDsbl0k3AE67xMtwzyUfsax0Vm
         ZhhA==
X-Gm-Message-State: AOAM530CqREPVxtR2PUFjGJZq68R/Qki0aYzny3xmaLcz1gaG1GCO7Go
	M4186i3Bfngl4EsxSEWv59BtL8F8dmI=
X-Google-Smtp-Source: ABdhPJzpYURlMT27ciuQ4PQJXvSQ1lTDEUmb2471FuvSmoZ2plKLcZRsgqtr168kttYK+Dv6hgyhOQ==
X-Received: by 2002:a63:5961:: with SMTP id j33mr19540382pgm.372.1591020699774;
        Mon, 01 Jun 2020 07:11:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:11:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Mon,  1 Jun 2020 04:11:08 -1000
Message-Id: <cover.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit c88cf750f26f6786d6ba5b4f1f7e5d4f0c800e6e:

  avahi: Don't advertise example services by default (2020-05-26 04:12:28 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (1):
  libubootenv: Remove the DEPENDS on mtd-utils

Gregor Zatko (1):
  sanity.bbclass: Detect and fail if 'inherit' is used in conf file

Joe Slater (1):
  terminal.py: do not stop searching for auto

Joshua Watt (1):
  checklayer: Skip layers without a collection

Khem Raj (2):
  cve-check: Run it after do_fetch
  make-mod-scripts: Fix a rare build race condition

Konrad Weihmann (1):
  qemurunner: fix ip fallback detection

Lee Chee Yang (2):
  bind: fix CVE-2020-8616/7
  libexif: fix CVE-2020-13114

Mark Hatle (1):
  sstate.bbclass: When siginfo or sig files are missing, stop fetcher
    errors

Richard Purdie (2):
  resulttool/report: Remove leftover debugging
  resulttool/log: Add ability to dump ltp logs as well as ptest

Robert P. J. Day (1):
  bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable

Robert Yang (1):
  archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original

Steve Sakoman (1):
  oeqa/concurrencytest: don't delete build directory for failed tests

Trevor Gamblin (1):
  qemuarm: check serial consoles vs /proc/consoles

 meta/classes/archiver.bbclass                 |   8 +-
 meta/classes/cve-check.bbclass                |   2 +-
 meta/classes/sanity.bbclass                   |   6 +
 meta/classes/sstate.bbclass                   |   6 +-
 meta/conf/bitbake.conf                        |   1 -
 meta/conf/machine/qemuarm.conf                |   1 +
 meta/conf/machine/qemuarm64.conf              |   1 +
 meta/lib/oe/terminal.py                       |   5 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  10 +-
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb    |   2 +-
 .../bind/bind/CVE-2020-8616.patch             | 206 ++++++++++++++++++
 .../bind/bind/CVE-2020-8617.patch             |  29 +++
 .../recipes-connectivity/bind/bind_9.11.13.bb |   2 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   7 +-
 .../libexif/libexif/CVE-2020-13114.patch      |  73 +++++++
 .../recipes-support/libexif/libexif_0.6.21.bb |   4 +-
 scripts/lib/checklayer/__init__.py            |   3 +
 scripts/lib/resulttool/log.py                 |  21 +-
 scripts/lib/resulttool/report.py              |   1 -
 scripts/lib/resulttool/resultutils.py         |  22 +-
 21 files changed, 383 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2020-13114.patch

-- 
2.17.1

