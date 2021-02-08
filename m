Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.35214.1612792367209120737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mL9xoZEz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id l19so3148259oih.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7FYcz9tqiF4Ji4rNtUnVBMINW9+UlvGBBlljit+Eox0=;
        b=mL9xoZEzE40aEMr6dcQwCb1wIpcOjfJJ4FWuiYdSrQAG9138Z0d8PDbC0Z1XgEVCQx
         67XPlHQq49QerEsbBEm3zC6Ni8Y8088znlIfWPdH7UOz4jqtfuaINQ6bYKxLiHRbxBAf
         rYwWeUaYmFOZSppNsFv+d0bAg53dMvCiDyjBsaJQBBW7wSiWXhqZZcRMz24Bwz9eDfXN
         Eoedvn1RysVVL/EqejeBysrKbbKP2HG5rCxxUVDyB5L/xvDiguAd/g4+f9v1UIRk2SnS
         MVdQtxRQOoJD572+OQF7dRY8Tu3gksx5I/+9UJTrKWYkPfS2qc2Iwg9z4Y25fd662GT6
         3iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7FYcz9tqiF4Ji4rNtUnVBMINW9+UlvGBBlljit+Eox0=;
        b=D/TbvmDQBO8h0XBWAJh8TTYmf35JSj4MdTIqheZ5yAjbhRh9aJ4L07HBxYeNAYVWeH
         ydJ8VR9WT65F6fx89CaodL3BV30QjnlrG/YiMaP2zbfLHetHtugM76bht0OHjpOj9nMY
         cwjV3ODUySZ4oBsM1INZ5VHRozbQ9w0MyT+j/+vv2CeQsSpjPNh/Ah7CrWuFQrytNwym
         ZUKsbDIpGI/k1EDlDx4W/ArI4XP26L4i1mjsLfQ2Iw5jzQje8cLb/sJ4xsW9MxFiWGfm
         4wC5pxBGLZDkHSxcYOUnvVzSHsJCYep9jPx0I6S6yJ99cbrNjU33YhoTosk3Is7QaxWE
         UY6A==
X-Gm-Message-State: AOAM5332nKW5xx53XmfdoT6ymbhi7cCOnx1zi9Ih8CSTx3nYSONXq8dG
	70diZd5/JTLA+L+OJXRjpDFgeWDN1DN7LsJcov8=
X-Google-Smtp-Source: ABdhPJwkd9bGe5+kWewlph/02+K/F5HA4LbV0kyQkVH8ZpphGYotoyJ0h6vuoFiw03oFQnFSCZ38Jg==
X-Received: by 2002:aca:d644:: with SMTP id n65mr11064865oig.111.1612792365866;
        Mon, 08 Feb 2021 05:52:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.52.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:52:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/28] Patch review
Date: Mon,  8 Feb 2021 03:51:52 -1000
Message-Id: <cover.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1837

The following changes since commit e0cd2e1f9ae956d72b8033ce1c4403d8bd99d3d5:

  staging: Clean up files installed into the sysroot (2021-01-29 04:48:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

Richard Purdie (5):
  pseudo: Update to include passwd and file renaming fixes
  package: Ensure do_packagedata is cleaned correctly
  image_types: Ensure tar archives are reproducible
  qemu.inc: Should depend on qemu-system-native, not qemu-native
  opkg: Fix build reproducibility issue

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
 meta/classes/image_types.bbclass              |   2 +-
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
 .../opkg/opkg/sourcedateepoch.patch           |  25 +++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
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
 33 files changed, 450 insertions(+), 93 deletions(-)
 create mode 100644 meta/lib/oe/cve_check.py
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_check.py
 rename meta/recipes-core/glib-2.0/glib-2.0/{0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} (100%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20190110.bb => ca-certificates_20210119.bb} (93%)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch

-- 
2.25.1

