Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.8734.1630506246850208908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 07:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U8RW00QN;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id s20so3954572oiw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7yRYNUmHtP2s9hHy30tWPzPDvJtlfIYoXq8gvZueTEc=;
        b=U8RW00QN4huILWOMaGCAdqhngD9rcbiEUefkpzGpBdLohgHow9/U0idQ1fA9QmtQBe
         AhXZIolmJCLL1fsitiVPpR4D0n3M4QDMOFVTyI5lly2y6sZca/mjhqG0W8JapSBVC5ET
         U2pmPAknh3AO1Y+sLCBXpNnf0fFz2upjy1R0fxm7EwsOOPdUOnTaJNAxY7etEXEO3Sjb
         LOVszJ5Scbi+0u+LSgksXBBXlfHau+toTXFhedZLktwsWYJ1hISVv2FO+J7vWd0/sXBa
         J14uMkYWWtusMlskBzm4k6L1fx6AiEm726ehrSWRuW7iGkLmZtHW5Fdgq6pAiCrebfoN
         ppuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7yRYNUmHtP2s9hHy30tWPzPDvJtlfIYoXq8gvZueTEc=;
        b=XNA1i4ny8azx2gl92McsngZ1MsFoAgYKHoOwKjC6WrTKwk0M6gQygKPwUWX7ku/1C/
         HYeVBJM/TVpkDRUhY7B9V0B4+G4Koq+Q+R+c3tDrQR3Bnm0gMaIZXElQ5ttK/4nWxiUf
         5H/dl9cSUc/4S5xdO2KGdnmdHoobBdTRBNa5L8jddiLGxi2sVkfXZFVHUCwqzGyUAhrF
         AFE4TfuRmDHWtcA6T0GqXHeQOOa1F8DSE1CLaKFmJdOXIXYBMbmrkCUGC9rYce7lgwcd
         W6p/LnHl5DizVBasKI4+r5VCscHrdwfcy8/oUmE/jF0ZKgxCUWn9moI3CmsY+jWr79fI
         CjRg==
X-Gm-Message-State: AOAM531XGn1XxsL9ray+TzSoH2dDNinx4uh8buLA/M4Njy1ERJLwpuUV
	946sg/tjU7qWR3TlPH30Mi7bB6zFgMGXenwB
X-Google-Smtp-Source: ABdhPJypJR9gqen9wTBCmcRqSHTWE5AolPBmEybI8Oy4a+LVNXjpbJtMMJfFY7G4JuEvHj4qv0LFLg==
X-Received: by 2002:aca:2310:: with SMTP id e16mr7829554oie.64.1630506245317;
        Wed, 01 Sep 2021 07:24:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 67sm4525277ota.70.2021.09.01.07.24.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 07:24:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/36] Pull request (cover letter only)
Date: Wed,  1 Sep 2021 04:23:45 -1000
Message-Id: <cover.1630506107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit eea71d274fe4d5f23ba0ab35d14be4fff2e64e2b:

  sdk: Enable do_populate_sdk with multilibs (2021-08-19 05:30:01 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (6):
  gnupg: update 2.2.21 -> 2.2.22
  gnupg: update 2.2.23 -> 2.2.26
  tcf-agent: fetching over git:// no longer works
  qemurunner.py: print output from runqemu/qemu-system in stop()
  qemurunner.py: handle getOutput() having nothing to read
  selftest: disable virgl headless test

Andrej Valek (1):
  mklibs-native: drop deprecated cpp17 exceptions

Armin Kuster (11):
  glibc: Security fix CVE-2021-33574
  glibc: Security fix for CVE-2021-38604
  qemu: Security fix CVE-2020-25085
  qemu: Security fix CVE-2020-25624
  Qemu: Security fix for CVE-2020-25625/2021-3409/2020-17380
  qemu: Security fix for CVE-2020-29443
  qemu: Security fix CVE-2021-20221
  qemu: Security fix CVE-2021-3544
  qemu: Security fixes CVE-2021-3545/6
  binutils: Security fix for CVE-2021-3549
  binutils: Security fix for CVE-2020-16593

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.142
  parselogs.py: ignore intermittent CD/DVDROM identification failure

Lee Chee Yang (1):
  qemu: fix CVE-2021-3527

Marek Vasut (1):
  image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior

Marta Rybczynska (1):
  lzo: add CVE_PRODUCT

Mikko Rapeli (1):
  openssl: update from 1.1.1k to 1.1.1l

Oleksandr Popovych (1):
  utils: Reduce the number of calls to the "dirname" command

Ranjitsinh Rathod (1):
  rpm: Add fix for CVE-2021-20266

Richard Purdie (1):
  gnupg: upgrade 2.2.20 -> 2.2.21

Sakib Sajal (6):
  qemu: fix CVE-2021-20181
  qemu: fix CVE-2021-3416
  qemu: fix CVE-2021-20257
  qemu: fix CVE-2021-3582
  qemu: fix CVE-2021-3607
  qemu: fix CVE-2021-3608

Saul Wold (1):
  gnupg: uprev 2.2.22 -> 2.2.23

Wang Mingyu (1):
  gnupg: upgrade 2.2.26 -> 2.2.27

jbouchard (1):
  Use the label provided when formating a dos partition

 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/utils.bbclass                    |   2 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   1 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
 meta/lib/oeqa/utils/qemurunner.py             |   7 +-
 .../{openssl_1.1.1k.bb => openssl_1.1.1l.bb}  |   2 +-
 .../glibc/glibc/CVE-2021-33574_1.patch        |  72 +++
 .../glibc/glibc/CVE-2021-33574_2.patch        |  73 +++
 .../glibc/glibc/CVE-2021-38604.patch          |  41 ++
 meta/recipes-core/glibc/glibc_2.31.bb         |   3 +
 .../binutils/binutils-2.34.inc                |   2 +
 .../binutils/binutils/CVE-2020-16593.patch    | 204 +++++++++
 .../binutils/binutils/CVE-2021-3549.patch     | 187 ++++++++
 ...ecated-exception-specification-cpp17.patch | 431 ++++++++++++++++++
 .../mklibs/mklibs-native_0.1.44.bb            |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |  69 ++-
 .../qemu/qemu/CVE-2020-25085.patch            |  46 ++
 .../qemu/qemu/CVE-2020-25624_1.patch          |  87 ++++
 .../qemu/qemu/CVE-2020-25624_2.patch          | 101 ++++
 .../qemu/qemu/CVE-2020-25625.patch            |  42 ++
 .../qemu/qemu/CVE-2020-29443.patch            |  45 ++
 .../qemu/qemu/CVE-2021-20181.patch            |  81 ++++
 .../qemu/qemu/CVE-2021-20221.patch            |  67 +++
 .../qemu/qemu/CVE-2021-20257.patch            |  55 +++
 .../qemu/qemu/CVE-2021-3416_1.patch           | 177 +++++++
 .../qemu/qemu/CVE-2021-3416_10.patch          |  41 ++
 .../qemu/qemu/CVE-2021-3416_2.patch           |  42 ++
 .../qemu/qemu/CVE-2021-3416_3.patch           |  43 ++
 .../qemu/qemu/CVE-2021-3416_5.patch           |  42 ++
 .../qemu/qemu/CVE-2021-3416_6.patch           |  40 ++
 .../qemu/qemu/CVE-2021-3416_7.patch           |  42 ++
 .../qemu/qemu/CVE-2021-3416_8.patch           |  44 ++
 .../qemu/qemu/CVE-2021-3416_9.patch           |  41 ++
 .../qemu/qemu/CVE-2021-3527-1.patch           |  42 ++
 .../qemu/qemu/CVE-2021-3527-2.patch           |  59 +++
 .../qemu/qemu/CVE-2021-3544.patch             |  29 ++
 .../qemu/qemu/CVE-2021-3544_2.patch           |  39 ++
 .../qemu/qemu/CVE-2021-3544_3.patch           |  39 ++
 .../qemu/qemu/CVE-2021-3544_4.patch           |  46 ++
 .../qemu/qemu/CVE-2021-3544_5.patch           |  47 ++
 .../qemu/qemu/CVE-2021-3545.patch             |  41 ++
 .../qemu/qemu/CVE-2021-3546.patch             |  47 ++
 .../qemu/qemu/CVE-2021-3582.patch             |  47 ++
 .../qemu/qemu/CVE-2021-3607.patch             |  43 ++
 .../qemu/qemu/CVE-2021-3608.patch             |  40 ++
 .../rpm/files/CVE-2021-20266.patch            | 109 +++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 .../tcf-agent/tcf-agent_git.bb                |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...-a-custom-value-for-the-location-of-.patch |   6 +-
 .../0003-dirmngr-uses-libgpg-error.patch      |  24 +-
 .../gnupg/gnupg/relocate.patch                |  20 +-
 .../{gnupg_2.2.20.bb => gnupg_2.2.27.bb}      |   3 +-
 meta/recipes-support/lzo/lzo_2.10.bb          |   2 +
 .../lib/wic/plugins/source/bootimg-pcbios.py  |   6 +-
 57 files changed, 2788 insertions(+), 74 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-38604.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-3549.patch
 create mode 100644 meta/recipes-devtools/mklibs/files/remove-deprecated-exception-specification-cpp17.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25625.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3544_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3545.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3546.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3582.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3607.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
 rename meta/recipes-support/gnupg/{gnupg_2.2.20.bb => gnupg_2.2.27.bb} (95%)

-- 
2.25.1

