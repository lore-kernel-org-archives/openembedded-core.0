Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.1337.1613000263472989733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 15:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YQiswGSA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id lw17so3702941pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 15:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgoV0jpMSugCNZGkbFbRzLCtZoW0EHHLJV9hRCTK5Y8=;
        b=YQiswGSAmX82tUwtK+Ser8SoZ2TmpAs6p+HTLPPC4In4XtSF0IrsFQ/IyEqjLnmNIY
         vi79f8sGnQjVJu2YtyCQrzn5z8TXTHVMbWa4hOsHKRytueuK54T7bE4OR+F+GWmXXJBv
         HQ7gCgnRbKBWAU+nWn2gjNm5tI1OWoBmzLUkaaRB7McKOJ+GDe41KdM3wEZbo+j8CMEi
         AxaUdsPszyB8P5CuF+mWN5nto7d/LYYz7K3kE0z7toJ1I4d6VHnuNi7HpZ+K0yBuUE/o
         vQvy9TWJRZh66PWLl6cUEM1Tp4N0JriJVsZJu5k25Bq0lmkEvPHNpGKFANaVxYQZI9Nb
         AHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgoV0jpMSugCNZGkbFbRzLCtZoW0EHHLJV9hRCTK5Y8=;
        b=SRASFozdR0ch9tU1H0CJUu0cXDMfbEx84zlUrEwqO0yfCESYSSjWP8NAC6ucc66cDZ
         Tb9VHrbwzuNwjR5NqN4pY8OD7DOX89X9pgIZ4X6jM3+Zc8t34YnoPSN+b7BYQUvjNQya
         SaC0XhtnBKDKGbKQh6nMwF4DevhdP8e15eFRQvwNf77T1wcvtpmacljzpzbE1CLN7SGv
         lIyKMwDOFQayIepU63W86hfPcXIkJeAhslXQXI/Jxd8/TEBXkMRFvbGHaruZAUXhwfFu
         FCDvcWnEDiFJK9GfT5AFISTcnsuanT3+wjbgUExxAUjWdzE+M7sTQ/UkRJJ+VakqiZGg
         Obpw==
X-Gm-Message-State: AOAM532BRgLQJCjsApsPrvXY8/N5v1AnSr7g9atfKHSVe/v0RI7i+391
	8GY9aufvrncWe3LKwIBDk/uJM4mfMkYjh2Tl
X-Google-Smtp-Source: ABdhPJxVpInjJrFQoUFc1MaByAL2smVXZVrmK6MIGDVPxGMSWFsh3AFjP3bXAB51IpJXA/yKHEN53A==
X-Received: by 2002:a17:90a:ba02:: with SMTP id s2mr1273447pjr.53.1613000261936;
        Wed, 10 Feb 2021 15:37:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id w7sm3106477pjv.24.2021.02.10.15.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 15:36:11 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/26] Pull request (cover letter only)
Date: Wed, 10 Feb 2021 13:34:25 -1000
Message-Id: <cover.1612999867.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e0cd2e1f9ae956d72b8033ce1c4403d8bd99d3d5:

  staging: Clean up files installed into the sysroot (2021-01-29 04:48:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  ca-certificates: correct upstream version check

Anatol Belski (1):
  glib-2.0: Rename patch file for CVE-2020-35457

Awais Belal (1):
  kernel.bbclass: fix deployment for initramfs images

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.90
  linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
  linux-yocto/5.4: update to v5.4.94

Dorinda (1):
  sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo
    control overlap

Julien Massot (1):
  rng-tools: fix rngd_jitter initialization

Lee Chee Yang (4):
  cve-check: replace Looseversion with custom version class
  cve_check: add CVE_VERSION_SUFFIX to indicate suffix in versioning
  openssl: set CVE_VERSION_SUFFIX
  wic/selftest: test_permissions also test bitbake image

Mark Hatle (1):
  package.bbclass: hash equivalency and pr service

Peter Bergin (1):
  buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES
    variable

Ricardo Ribalda (1):
  classes/image_types_wic: Reorder do_flush_pseudodb

Ricardo Ribalda Delgado (1):
  oeqa: wic: Add tests for permissions and change-directory

Richard Purdie (3):
  pseudo: Update to include passwd and file renaming fixes
  package: Ensure do_packagedata is cleaned correctly
  qemu.inc: Should depend on qemu-system-native, not qemu-native

Sourabh Banerjee (1):
  layer.conf: fix sanity error for PATH variable in extensible SDK
    workflow

Tomasz Dziendzielski (3):
  python3: Use addtask statement instead of task dependencies
  lib/oe/patch.py: Ignore scissors line on applying patch
  sstatesig: Add descriptive error message to getpwuid/getgrgid "uid/gid
    not found" KeyError

Vyacheslav Yurkov (1):
  npm.bbclass: use python3 for npm config

Wang Mingyu (1):
  ca-certificates: upgrade 20190110 -> 20200601

zhengruoqin (1):
  ca-certificates: upgrade 20200601 -> 20210119

 meta/classes/buildhistory.bbclass             |   2 +-
 meta/classes/cve-check.bbclass                |  14 ++-
 meta/classes/image_types_wic.bbclass          |   2 +-
 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/npm.bbclass                      |   6 +-
 meta/classes/package.bbclass                  |  59 ++++++++--
 meta/classes/sanity.bbclass                   |  10 ++
 meta/conf/bitbake.conf                        |   1 +
 meta/conf/layer.conf                          |   4 +-
 meta/conf/machine/include/qemu.inc            |   2 +-
 meta/lib/oe/cve_check.py                      |  60 ++++++++++
 meta/lib/oe/patch.py                          |   2 +-
 meta/lib/oe/sstatesig.py                      |   6 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  36 ++++++
 meta/lib/oeqa/selftest/cases/prservice.py     |   8 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 106 ++++++++++++++++++
 .../openssl/openssl_1.1.1i.bb                 |   2 +
 ...onEntry-lis.patch => CVE-2020-35457.patch} |   0
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |   2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 meta/recipes-devtools/python/python3_3.8.2.bb |   5 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 .../0001-certdata2pem.py-use-python3.patch    |  37 ------
 ...0190110.bb => ca-certificates_20210119.bb} |   6 +-
 ...-O_NONBLOCK-setting-for-entropy-pipe.patch |  26 +++++
 ...ialize-AES-key-before-setting-the-en.patch |  38 +++++++
 ...ys-read-from-entropy-pipe-before-set.patch |  38 +++++++
 .../rng-tools/rng-tools_6.9.bb                |   3 +
 30 files changed, 423 insertions(+), 92 deletions(-)
 create mode 100644 meta/lib/oe/cve_check.py
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_check.py
 rename meta/recipes-core/glib-2.0/glib-2.0/{0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} (100%)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20190110.bb => ca-certificates_20210119.bb} (93%)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch

-- 
2.25.1

