Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.21372.1609424421039039078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Dec 2020 06:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yMSi6RDl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id c22so13116955pgg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Dec 2020 06:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=kn7hUXdjqiN2KsIcXW/1miTmhgT925n7iN805Og/E3E=;
        b=yMSi6RDlBqYyJH2o0jZIUeV2SJIGYgnuN2IXrR2StiBwB/A7cjHFuteSQ2PwJi1NX2
         nNA/pDwIgkGgx/BuDUYPDo3C8L1O4zqcvfDlvmFY07DHuksSBs/PMSTRyYLHQwoHaPvD
         vW1UhpjCIGKuFm0Fs1gQISVCiVxJl9p7gYEkVwo2uyZwTXrRwUWa8FmQRIkizd8diQ9a
         WnmFQUw5rA+aZZ18j5tcWh7Cur13vwZnscNOovKcRG65gSNV0UgWSeAr62dfivengG8K
         Nx0zu+z9lftbLCvcVSLPaqfmJJ6vtEPPYupBUIbc7Klv8uRfUaxc9PY/pCoOMMG6yslN
         Wp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=kn7hUXdjqiN2KsIcXW/1miTmhgT925n7iN805Og/E3E=;
        b=Eup1aHfVeTI/e/cmNmj0PeHQewoeaJPonU4Bi9U4OAiYYvQfNT8zFtx4N+qHoikyty
         ZD3VtUyiPClD6Ics6VNa6/MkHzIZ7fF03xobI0bxvsBOAFTnPML1T0xsspLhnOu5f2kt
         pVbzuLvWuNtl5sbf9n3EeLHQ2NiSraWv3pQQzA+2Ox6PZtrUAIDMFp6KDA0uO8feA0s2
         tztnWAP8W0wMhSkHi21qmJjOx95DjYZxm1d8g7iwoyv9OznSaklzkd55LD1GXpl7uhvn
         AkcWe0A+geqoZ95c3N0V80XXJOIyknLAU8r0upApVHJjVTq+9XAjRxYX9VsXabbncewc
         zgHg==
X-Gm-Message-State: AOAM532pJMUWNGBRTrpHwKq1sLY+sC4wJgWxrKsoTTRmcpHQbW4WDQ5C
	pIw3KRGvcZaLVlGWPr02NhzTEgAxo5Mqb9Nv88Y=
X-Google-Smtp-Source: ABdhPJxIVeCG4fYPGyLDuHMjPWek1FJLRlkud/Bw+ih3qaFc9G1+s+XeBEqFhZSuMk5JBF2W4VXygg==
X-Received: by 2002:a63:d303:: with SMTP id b3mr35181317pgg.113.1609424419919;
        Thu, 31 Dec 2020 06:20:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm45051214pfh.207.2020.12.31.06.20.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 06:20:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Pull request (cover letter only)
Date: Thu, 31 Dec 2020 04:20:08 -1000
Message-Id: <cover.1609424319.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 02870c7fbaaa1c3869ecb439f5c58fcf40a533be:

  binutils: fix CVE-2020-16592/16598 (2020-12-14 05:58:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  selftest/reproducible: enable world reproducibility test
  selftest/reproducible: add an exclusion list for items that are not
    yet reproducible

Bruce Ashfield (8):
  linux-yocto-rt/5.4: update to -rt44
  linux-yocto/5.4: update to v5.4.80
  linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
  linux-yocto/5.4: update to v5.4.82
  linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
  linux-yocto/5.4: update to v5.4.83
  linux-yocto/5.4/cfg: fix -tiny warnings
  linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20201118 -> 20201218
  linux-firmware: package firmware for Lontium lt9611uxc bridge

Richard Purdie (7):
  grub: Fix build reproducibility issue
  grub: Add second fix for determinism issue
  u-boot-tools: Fix reproducibility issue
  groff: Fix reproducibility issue
  man-db: Avoid reproducibility failures after fixing groff-native
  cups: Mark CVE-2009-0032 as a non-issue
  cups: Mark CVE-2008-1033 as a non-issue

Robert Joslyn (1):
  openssl: Update to 1.1.1i

Ross Burton (1):
  kernel: set COMPATIBLE_HOST to *-linux

Steve Sakoman (3):
  selftest/reproducible: add packages to exclusion list for dunfell
  oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
  cups: whitelist CVE-2018-6553

zangrc (1):
  bash: Rename patch name

 meta/classes/kernel.bbclass                   |  2 +
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  | 96 ++++++++++++++++++-
 meta/recipes-bsp/grub/files/determinism.patch | 40 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 meta/recipes-bsp/u-boot/u-boot-tools.inc      | 15 +++
 .../{openssl_1.1.1g.bb => openssl_1.1.1i.bb}  |  2 +-
 ...-2019-18276.patch => CVE-2019-18276.patch} |  0
 meta/recipes-extended/bash/bash_5.0.bb        |  2 +-
 meta/recipes-extended/cups/cups.inc           |  7 ++
 meta/recipes-extended/groff/groff_1.22.4.bb   |  2 +-
 meta/recipes-extended/man-db/man-db_2.9.0.bb  |  5 +
 ...20201118.bb => linux-firmware_20201218.bb} | 14 ++-
 meta/recipes-kernel/linux/linux-dummy.bb      |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++---
 17 files changed, 197 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)
 rename meta/recipes-extended/bash/bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch} (100%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201118.bb => linux-firmware_20201218.bb} (98%)

-- 
2.17.1

