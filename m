Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.4072.1609193766719404046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PSCvXUAP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id l23so391653pjg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=xVTu9NdozfAPHcCFd07wfwZKzitfL48s7P6nOyABhYs=;
        b=PSCvXUAPPLz1wbV2tzFh3V5wFJSMraRfsqzwMTWiYqz1i36L2uUSyvKSm0IACzXTwa
         Necb1D0tVBqa69VIihtCMC0yI8xQ5GQE5ZfxlH4+B52BGaPa6kV6tfEh6NgnuRKPBGgT
         rtS0weVP4UANSo6HMJmP8rZ1hy0x08pXCX4Wd0G9N17O+MAZVK4lBAmHPKjmscfEmeJv
         LtMnJwZl+l7H0gs88MV+ngJUx8LLSftzx+TTVb7v7rwZ9hk7MlOrDOkhEUw+2CCUGewI
         wcXRUzhqOFsPItwoVAThwbbHRKT/DzXqlS8JbAXEpCvg5Ep9XT4ixJZafp+RccgN1A8n
         yE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=xVTu9NdozfAPHcCFd07wfwZKzitfL48s7P6nOyABhYs=;
        b=LBRrX4/YQmCOljRtM+30f1SlHK/47qD9B+NSEzsgFiIdTcbyYuTbkJX0NSPCOKeYmy
         SFjVGuy0ioNWd3+Dwmk3Ca3X9U0OKfYGeryp2aD/1T6ZrDqu4rc/yzfnexCqeCkaRx/H
         bZnDOxwCaOhPCg+lzVOpy5k71EB6pVPGNcsuD3Okn8UmwWaZ5EdoIvJeNfcmcpktfDlI
         cbl+K4KB1DIXWuDamj2bHyX3ucmfJShV5WeDFNZqSFkNe7/DwyeKQpu2Wa0MGAeOGyWq
         ULyje4DSI4PFSYiKfSmS5jeW5WYvZqq1Ks/M/tVppAcMQ0aYYz0nR3j/gmZh1tb9tddp
         m50w==
X-Gm-Message-State: AOAM5303v0IISC4ARrbIwYNX2pypml8ZyJyxLG0lyga7toqOQyc1jdSd
	xxafkBuHHKsTshJonXjppwexCwzEj+ChKJ3Lp3g=
X-Google-Smtp-Source: ABdhPJzWiaSATXmX/eNO3duZZlZi0R2vWBURGEOBge/CcTQwxd/nPt0uguQdAeS1akM80YJhptfO+w==
X-Received: by 2002:a17:90a:5d03:: with SMTP id s3mr906048pji.150.1609193765776;
        Mon, 28 Dec 2020 14:16:05 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:04 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Mon, 28 Dec 2020 12:15:37 -1000
Message-Id: <cover.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1710

The following changes since commit 1746f781d541d0b0aa3280ae121068a029294351:

  selftest/reproducible: add packages to exclusion list for dunfell (2020-12-28 04:28:39 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

Richard Purdie (2):
  cups: Mark CVE-2009-0032 as a non-issue
  cups: Mark CVE-2008-1033 as a non-issue

Robert Joslyn (1):
  openssl: Update to 1.1.1i

Ross Burton (1):
  kernel: set COMPATIBLE_HOST to *-linux

Steve Sakoman (2):
  oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
  cups: whitelist CVE-2018-6553

zangrc (1):
  bash: Rename patch name

 meta/classes/kernel.bbclass                   |  2 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 .../{openssl_1.1.1g.bb => openssl_1.1.1i.bb}  |  2 +-
 ...-2019-18276.patch => CVE-2019-18276.patch} |  0
 meta/recipes-extended/bash/bash_5.0.bb        |  2 +-
 meta/recipes-extended/cups/cups.inc           |  7 ++++++
 ...20201118.bb => linux-firmware_20201218.bb} | 14 ++++++++++--
 meta/recipes-kernel/linux/linux-dummy.bb      |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 11 files changed, 43 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)
 rename meta/recipes-extended/bash/bash/{bash-CVE-2019-18276.patch => CVE-2019-18276.patch} (100%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201118.bb => linux-firmware_20201218.bb} (98%)

-- 
2.17.1

