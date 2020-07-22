Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.9280.1595379180464999921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 17:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0CMoVv4i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id w2so274357pgg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 17:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=8vluKSG0GYOslYSjzLW+tTn6k7Nc0GdyXBjYBnWNC1o=;
        b=0CMoVv4i7jS+09yjP3hveZXQCi4mni2B1oY8fysbDaJgFa6JOfEysRHC863CbBen5S
         jMVNGcI8I8XZrmFTS1t9JmcVfhCKNp4axEjmqjJRklSk15frcq0DLwvka68+QCI0T0bT
         Ax3PtxxuotwyDfg5REP/47dLqz1plVvHoRXxFdUTBm+qOm6Lgkr/gtuLjQo5plzNm/aK
         yLKSqHFNxwZH5GePhFmVGI0j8Ap0wsiE4VTkVMjAIs7P+WpdauJ1k7R0PTaUL0oObelF
         y8SUTb6gRDmngdIOPyDVKV12TP/zVpSkHQ4PpZeSh22jm0YC4GMoSCmfndafpg11ShOb
         L8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=8vluKSG0GYOslYSjzLW+tTn6k7Nc0GdyXBjYBnWNC1o=;
        b=ToVFwPbSzhVVx8IVge///l2Bh4EXgjJE5cyht75FJbEiwW95pT8+ECGZha/aS7xwOo
         On0hK7nUmc2NdB07BmVZ8UNUzKKTrIit6FMjX9bz5uXVMil78ZKGKHKExc7SKWlwklGG
         ighoabU799CNJnSlS+j5bp4ZMTNOKsK7XdL8n4VDLiXDVu0H5f2v/ByDEhT2Z34WobL3
         ahDlimq0nzAe6Q2UWO/VFwLmA3+xzB7AVKjS+oCsN2j7mKqqiCiu5gwH4844SyKTAXtl
         R1jWHzoxldxRnwpVb8blk1+L9KH14wN3R+rMacYzkxt/Ns2GGGtvAwKNwpcH50EeKA9t
         uuBQ==
X-Gm-Message-State: AOAM530FeJkZd5rNnrrKACmJEckQ+OGhjpTCUZAc4hGEd2sI5ywp+J6d
	NR8Li/9/vmefZKJ9VFDFqpXSEHOHXxE=
X-Google-Smtp-Source: ABdhPJxcbg2RJbSLkRfO8u1ghpya7xsq4MFMP51G15X5MwxodtbtF7M4/Hf/5/4QpIBTZg0mNM9OSg==
X-Received: by 2002:a62:190a:: with SMTP id 10mr26652833pfz.29.1595379179324;
        Tue, 21 Jul 2020 17:52:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q13sm23070757pfk.8.2020.07.21.17.52.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 17:52:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/23] Pull request (cover letter only)
Date: Tue, 21 Jul 2020 14:52:44 -1000
Message-Id: <cover.1595379012.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Final set of changes for dunfell 3.1.2 release.

The following changes since commit c2ad3af9da9bb3a98c1d5d1b3d21eb8db643c189:

  coreutils: don't split stdbuf to own package with single-binary (2020-07-13 17:14:28 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

Lee Chee Yang (2):
  bison: fix Argument list too long error
  systemd : fix CVE-2020-13776

Rahul Chauhan (1):
  busybox: Security Fix For CVE-2018-1000500

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

akuster (1):
  glibc: whitelist CVE-2010-10029

 meta/classes/insane.bbclass                   |     13 +-
 meta/classes/nativesdk.bbclass                |      3 +-
 meta/classes/ptest.bbclass                    |      2 +-
 meta/lib/oe/recipeutils.py                    |      2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |      5 +-
 meta/lib/oeqa/utils/qemurunner.py             |     15 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |      2 +-
 meta/recipes-connectivity/avahi/avahi_0.7.bb  |      2 +-
 .../busybox/busybox-CVE-2018-1000500.patch    |     98 +
 meta/recipes-core/busybox/busybox_1.31.1.bb   |      1 +
 meta/recipes-core/glibc/glibc_2.31.bb         |      2 +
 .../systemd/systemd/CVE-2020-13776.patch      |     96 +
 meta/recipes-core/systemd/systemd_244.3.bb    |      1 +
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
 24 files changed, 145819 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
 create mode 100644 meta/recipes-devtools/go/go-dep/0001-Update-sys-module-to-latest.patch

-- 
2.17.1

