Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.635.1591315596029241160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 17:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RecdlbHp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id bh7so2861374plb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 17:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=mRU9vzsLiz/V2UbTkbxGoC1xCoiluT8qUl2NCThWvy8=;
        b=RecdlbHpBHckz/ax1jBn2Z74F9g1IWreN/vNe0p8V2ae6fF4tD8ft0PFNgii0Nicxd
         2ikFQ8Se9cPGSL4tsQBA6U/V1LFrowXG4EDTliWNkkVMZX17pMsJEwzEuGrsfd9k0Sfs
         hcewZ8vTDDzzPOmt2BpdyDQFseI/xzPRm+XR/5QrUS7AYoow94aadj83iGoBT6ugOMCq
         cLcyFVSMjUDVOoPobxxPWtonPYHm4uECL+4oEyzLDj/qtApFMD2tkxIuRgnL2HmrAt4B
         0RtBCBIUjhngAewS3pj9pLtaNQhzrjatk0LktJZ9KoxC7reCN4PwZBytZFvPCMSKE1DL
         IcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=mRU9vzsLiz/V2UbTkbxGoC1xCoiluT8qUl2NCThWvy8=;
        b=S0pbxskCM4OxIkUdjCfoAxyN6kxmoO9uBaHGX01n9lzEe5EgV+QYicT5B05JTeIKs4
         rXVQcfOL/bM/dhes2kZB6vqWvyws3IYSRfsgu8uUEr2LuRz1oUR+q9GEeURy5jI04O5U
         6PI/Hk3Ec+gAnMlFks9nix7ijL8HObyNHjagHQsfOD2nqVjHwFikysAUoWqI3IsABndT
         /cDayBCP52v90vzlf37GU9swRt2ANLJduWe6rp7kIjeLt/SkmdYXOiob4/ONMospxv6y
         BFeUxGTrpvuWmKu06zODXUZtuYvq742wAQskjPXZWLLa84CxzxJJYqgAMJ3/QJiqgU2U
         kw3Q==
X-Gm-Message-State: AOAM533MfD0e5VP5KDa7ITmNw+G3jYeyxWeCfrOcRp7Lo3sXhu2qzeeH
	R4jtutYhwjkOfD/1hzSx+RZ26jN6onQ=
X-Google-Smtp-Source: ABdhPJwb83JtfSYHAQuXsowzxUwrYhpr1Yh7O29cPNReUXxhIPXRh79WweOqZpXbXyyaxAJ6jat3Kg==
X-Received: by 2002:a17:902:b608:: with SMTP id b8mr7034718pls.163.1591315594811;
        Thu, 04 Jun 2020 17:06:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y10sm5005253pgi.54.2020.06.04.17.06.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 17:06:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Pull request (cover letter only)
Date: Thu,  4 Jun 2020 14:06:20 -1000
Message-Id: <cover.1591315404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1


The following changes since commit c88cf750f26f6786d6ba5b4f1f7e5d4f0c800e6e:

  avahi: Don't advertise example services by default (2020-05-26 04:12:28 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Adrian Bunk (1):
  libubootenv: Remove the DEPENDS on mtd-utils

Bruce Ashfield (8):
  linux-yocto/5.4: update to v5.4.38
  linux-yocto/5.4: update to v5.4.40
  kernel/reproducibility: kernel modules need SOURCE_DATE_EPOCH export
  linux-yocto/5.4: update to v5.4.42
  linux-yocto-rt/5.4: update to rt24
  linux-yocto/5.4: temporarily revert IKHEADERS in standard kernels
  linux-yocto: gather reproducibility configs into a fragment
  linux-yocto/5.4: update to v5.4.43

Gregor Zatko (1):
  sanity.bbclass: Detect and fail if 'inherit' is used in conf file

Joe Slater (1):
  terminal.py: do not stop searching for auto

Joshua Watt (6):
  checklayer: Skip layers without a collection
  pycryptodome: Import from meta-python
  pyelftools: Import from meta-python
  python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
  python3-pyelftools: Upgrade 0.25 -> 0.26
  layer.conf: Bump OE-Core layer version

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

Robert Yang (1):
  archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original

Steve Sakoman (1):
  oeqa/concurrencytest: don't delete build directory for failed tests

Trevor Gamblin (1):
  qemuarm: check serial consoles vs /proc/consoles

 meta/classes/archiver.bbclass                 |   8 +-
 meta/classes/cve-check.bbclass                |   2 +-
 meta/classes/kernel.bbclass                   |  15 ++
 meta/classes/sanity.bbclass                   |   6 +
 meta/classes/sstate.bbclass                   |   6 +-
 meta/conf/distro/include/maintainers.inc      |   5 +-
 meta/conf/layer.conf                          |   2 +-
 meta/conf/machine/qemuarm.conf                |   1 +
 meta/conf/machine/qemuarm64.conf              |   1 +
 meta/lib/oe/terminal.py                       |   5 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  10 +-
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb    |   2 +-
 .../bind/bind/CVE-2020-8616.patch             | 206 ++++++++++++++++++
 .../bind/bind/CVE-2020-8617.patch             |  29 +++
 .../recipes-connectivity/bind/bind_9.11.13.bb |   2 +
 .../python/python-pycryptodome.inc            |  26 +++
 .../python/python3-pycryptodome_3.9.7.bb      |   5 +
 .../python/python3-pycryptodomex_3.9.7.bb     |   9 +
 .../python/python3-pyelftools_0.26.bb         |  14 ++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   7 +-
 .../libexif/libexif/CVE-2020-13114.patch      |  73 +++++++
 .../recipes-support/libexif/libexif_0.6.21.bb |   4 +-
 scripts/lib/checklayer/__init__.py            |   3 +
 scripts/lib/resulttool/log.py                 |  21 +-
 scripts/lib/resulttool/report.py              |   1 -
 scripts/lib/resulttool/resultutils.py         |  22 +-
 30 files changed, 475 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2020-13114.patch

-- 
2.17.1

