Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.10182.1619186393621915343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 06:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zqmnOje2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id e9so8290754plj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eiQZ4Z0+kRBm/E13YnQvLeqoq/2Cug1quJ6cWSKDDZo=;
        b=zqmnOje2O6RWaV+wixO7ZMg2AfDwfWHsB29qENum6gjgGWmAaUT4IyWJcCsAOg8Gtg
         FUzOu53pI9jTzLm9epJbZGhUlUjzQykpQlGo494iZNBdoCbPvD+X0E6YFKH+iQaful5C
         VUY3Rg7XvZjJhT6biOLPCK0bPSCCekNMPlCwMN58kempzvCzWao3DkIAoFKj8Otb/uUb
         EPQiJqfqQmJMzm001TKEq17B33dOnRB7o6kESNFH1+e2Zmfw/Bcrr8aZe6kCKvl68KZ9
         IIxXvhu3rc9PmI/I1vw9rSeZkMk7/NA0OctFcvMrQuFf18fnNigENLwoeuBE/8M4v36V
         U2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eiQZ4Z0+kRBm/E13YnQvLeqoq/2Cug1quJ6cWSKDDZo=;
        b=LQgo9ldYMmO4iy5FgGqRuweRBzPAUjaYudo2svmT1bbXqMuz9sGZnEiZ1jz/IEeK+h
         CnIEcTg3ETmFWyZwKSQg8SfO/A+i/nkFasqkmhZCEKKJuTzgkCs2yHqDB8D8V/KPeS4M
         zpnUOs8dd2UiIzGgV4dMgX69QAQzqYd+yguYuEdFgeR1nK5VyDQSz5Ed+KeOv36u1Kpt
         iKLBdh12FIK8L3gbCNliCHbtI0QkzrIkZtyBH3vpUuKnE1BULIX745AMz6OYM3uHr41e
         EIfYrkAV1/p84DrjK9z7Qv1FLjrMKvRhF84J5xSnO7q7Dcq5JJUAo3dQPqAgOcOPkPJM
         nzOQ==
X-Gm-Message-State: AOAM530AQwBKsmarTivHTcuxQYfXWZEhJqNlV86IJP0ze2Sc/KZf0ufQ
	GHsHAbglV0yUmEKv4nBilWeOnWqpPIcqs4X6tAI=
X-Google-Smtp-Source: ABdhPJz8Ztfc68dEZqNlgVbreNRDqJJ4aN1Ol055VgpNdS4qx9X0E1vgXAj001DForl+4FnhzhDRcg==
X-Received: by 2002:a17:902:8544:b029:ec:8b6b:d98f with SMTP id d4-20020a1709028544b02900ec8b6bd98fmr3844135plo.68.1619186392433;
        Fri, 23 Apr 2021 06:59:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.06.59.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 06:59:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Patch review
Date: Fri, 23 Apr 2021 03:58:42 -1000
Message-Id: <cover.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2063

The following changes since commit a1b0631c4723d2a98eb9e80ec85a00bc46276783:

  go_1.14: don't set -buildmode=pie when building for windows targets (2021-04-19 04:27:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.109
  linux-yocto/5.4: update to v5.4.111
  linux-yocto/5.4: update to v5.4.112
  linux-yocto/5.4: fix arm defconfig warnings

Douglas Royds (2):
  Revert "externalsrc: Detect code changes in submodules"
  externalsrc: Detect code changes in submodules

Gavin Li (1):
  kmod: do not symlink config.guess/config.sub during autoreconf

Khem Raj (1):
  ca-certificates: Fix openssl runtime cert dependencies

Mingli Yu (2):
  libtool: make sure autoheader run before automake
  groff: not ship /usr/bin/grap2graph

Peter Budny (1):
  lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)

Richard Purdie (5):
  oeqa/selftest: Hardcode test assumptions about heartbeat event timings
  oeqa/selftest: Ensure packages classes are set correctly for
    maintainers test
  sanity: Add error check for '%' in build path
  sanity: Further improve directory sanity tests
  pseudo: Upgrade to add trailing slashes ignore path fix

Ross Burton (1):
  insane: clean up some more warning messages

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-30004

Yanfei Xu (1):
  parselogs: ignore floppy error on qemu-system-x86 at boot stage

 meta/classes/externalsrc.bbclass              |   7 +-
 meta/classes/insane.bbclass                   |  12 +-
 meta/classes/sanity.bbclass                   |  19 ++-
 meta/lib/oe/terminal.py                       |  16 ++-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   2 +
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   6 +-
 meta/lib/oeqa/selftest/cases/distrodata.py    |   2 +-
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 .../libtool/libtool-2.4.6.inc                 |   1 +
 ...-sure-autoheader-run-before-automake.patch |  35 +++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 meta/recipes-extended/groff/groff_1.22.4.bb   |   4 +
 meta/recipes-kernel/kmod/kmod.inc             |   1 -
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 .../ca-certificates_20210119.bb               |   6 +-
 18 files changed, 226 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch

-- 
2.25.1

