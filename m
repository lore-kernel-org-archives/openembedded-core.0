Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.858.1619629631501034017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 10:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c3CAaled;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id t2-20020a17090a0242b0290155433387beso3459330pje.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5gw7aO9/5lAe6zlM5MXYWxdN+5uUMIhtT0iCG7aQxY=;
        b=c3CAaledYCtQtu75+r3jH5M0hKiUyHE5VlAlI2IhN1oW09iM2I33tu1dB9bgSP2KuJ
         TBcNVedU3z/tpLVh0/i80jfuD6Dj8fvamUoV/vBc1ST8FvkOBMZ2rdkHAtEviVH018+2
         KTJA6GzvWNm5y1j33QwbdqDBEJMw0ybcusn1Hftg9nEdo/LKEd0fn/gi76+3ENpB5R3t
         eDF8u/lduOxdF9dIhQNp6JmI/vLQYb3VUgz/x+kBxzk/sjNaUIyhv0HCSoMTEmAyKZyz
         2rcaE5t+bY3muVdiZMnpHp/8Y+VfRIV+R8qGG6wTYqUSrIF2yFvaqZNG07B7wMOhDW9j
         EiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y5gw7aO9/5lAe6zlM5MXYWxdN+5uUMIhtT0iCG7aQxY=;
        b=RXsBV56dLLqs3b4GN44xSKleYx/GLAWUZSgGZQEk1wE9r7Id231fOKp9/MOeJzu1pS
         2GdEDw0zQpz3K6OoYVcdm6WsizKaMg1vXqIo6mfuvWe++FhiQHhV2vHXzLBDVzIVJRlE
         wIA8jHfPMXwghODwzlBm7BV7zJy8e/CpllSeqXiMH5pw7lS1J4KImRUMM9xQiR6sUc/T
         RHLoT5HDOt5oGu19EhFKIIGnUOZE4GiwiI6a5NvreOuKza61Wix0Rjbrk/HIZvO2bxcs
         BMf0kn43FieLr7DsLfPVMvZNFy8Rmf8X6Gtjf1wRTevHqaWA7xlBigRtkrQoq8ep2TBq
         oDcg==
X-Gm-Message-State: AOAM532oR1HBqGKcWY17r2YxhkpAiUBHDa7VjYVSsnJZrhurgXKST4wy
	0uSt3cqWaqiCE1iWMpQGsfazg08l4j2obdxY
X-Google-Smtp-Source: ABdhPJyiUH0jCepZ71mntk9JwCoyNWrodD3CckxbiT/XYDAbK3WdsZXPZ4zDE92a7WIcz1AUIgF5AA==
X-Received: by 2002:a17:90b:347:: with SMTP id fh7mr4923641pjb.183.1619629630496;
        Wed, 28 Apr 2021 10:07:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id oj6sm5320620pjb.5.2021.04.28.10.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 10:07:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Pull request (cover letter only)
Date: Wed, 28 Apr 2021 07:07:00 -1000
Message-Id: <cover.1619629507.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a1b0631c4723d2a98eb9e80ec85a00bc46276783:

  go_1.14: don't set -buildmode=pie when building for windows targets (2021-04-19 04:27:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

