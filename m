Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.1262.1596080590099632358
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 20:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uim3OKj8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id z5so15772780pgb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 20:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=kpPrGsYQguVprqczzx1thXJ4eMibpJTa6qVmqU4cFso=;
        b=uim3OKj8PnnovuaElwTEjQh9T6UqreI86zyW5wojSSNynogt0RkSYc85bcdRCztsGG
         grPNJ6pUwXqqx6EafF9RVmufeEc7xkIkwos4gPnlDpZxRFGkUYqX+rj1PxlbUw70BCnN
         EEOxXPpD2xOPGVsBSWdOPXdnsQBa22ECzH8qNYnHsm4Q1xVPJKsZbH1yaLj8JAfA/Hod
         i+STk/bUYzzv11pBqCdm0EaKbDY5H/GZ06mNbDr2aQ9q4fY6bd4mUQoGj0h/6+t6tXJu
         ag5MhMfOhDw1C2uFfzAlBa3uP4/MpFBjpwnwZ2+e68sypJO0xEx+6yyZpITxUBRDpiMV
         fYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=kpPrGsYQguVprqczzx1thXJ4eMibpJTa6qVmqU4cFso=;
        b=SZ9Os1VTzkmVBTRja1Re5akSFa40ZdGXgcxORyopLNQjGkmDQTzIw1zJxU2Sw9MLn8
         sH9xqpfycc25BBHn53UJirzqazT+7KRO9tTibhResjaOmQ0CevGRRF4mhxIzyAIqXISO
         ok8/E8Ly84bcsqw2/dEWTygZu1col4Nj5X7E3muazV42yyFFQOYv0kr+FvqGJy28nC78
         Wv2aMNv3UlBZ46muvoM3dScNwSghtcL2OFi3UPjKxYIrcjHBu5vQrkoacli1/+2XdS7V
         J1pqHkn3KPMZFUfCv/WUUVHexAeG0B/jKirTu4IXM5SjTzFBmi4WPoalvc+ZakNBOPiO
         TDQg==
X-Gm-Message-State: AOAM532jlQfmYTxY2XQVelVvTzny0W+52YQoB3rCKVLLapMr6YXDFq3W
	0MZzaJIT6xz5nD3g/7ceZyEZUCLrQxk=
X-Google-Smtp-Source: ABdhPJwJ+CfLnM9dymu/U3Ofr/1FQsRpRnh6T/MawzAqaFylzQgW/yqSSHo1jwkohoBbr8xAk+BKRA==
X-Received: by 2002:a65:664a:: with SMTP id z10mr31858949pgv.352.1596080588979;
        Wed, 29 Jul 2020 20:43:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 129sm4049083pfv.161.2020.07.29.20.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 20:43:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Pull request (cover letter only)
Date: Wed, 29 Jul 2020 17:42:57 -1000
Message-Id: <cover.1596080427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit ea886d57db917a41a0d106a15e1e96c72d6407b0:

  kernel-yocto: account for extracted defconfig in elements check (2020-07-23 04:07:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Armin Kuster (1):
  glibc: Secruity fix for CVE-2020-6096

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.51
  linux-yocto-rt/5.4: fix mmdrop stress test issues

Changqing Li (1):
  gtk-immodules-cache.bbclass: fix post install scriptlet error

Chen Qi (1):
  rpm: fix nativesdk's default var location

Daniel Ammann (1):
  image.bbclass: improve wording when image size exceeds the specified
    limit

Joshua Watt (2):
  classes/cmake: Fix host detection
  classes/package: Use HOST_OS for runtime dependencies

Kevin Hao (3):
  wic/filemap: Drop the unused block_is_unmapped()
  wic/filemap: Drop the unused get_unmapped_ranges()
  wic/filemap: Fall back to standard copy when no way to get the block
    map

Kurt Kiefer (1):
  linux-firmware: add ibt-20 package

Lee Chee Yang (1):
  buildhistory: use pid for temporary txt file name

Richard Purdie (1):
  oeqa/qemurunner: Add priority/nice information for running processes

Robert Yang (1):
  openssl: openssl-bin requires openssl-conf to run

Ross Burton (1):
  startup-notification: add time_t type mismatch patch from upstream

Sakib Sajal (1):
  busybox: make hwclock compatible with glibc 2.31

 meta/classes/buildhistory.bbclass             |  11 +-
 meta/classes/cmake.bbclass                    |  19 +-
 meta/classes/gtk-immodules-cache.bbclass      |   1 +
 meta/classes/image.bbclass                    |   4 +-
 meta/classes/package.bbclass                  |  10 +-
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 meta/lib/oeqa/utils/qemutinyrunner.py         |   2 +-
 .../openssl/openssl_1.1.1g.bb                 |   2 +
 ...1-hwclock-make-glibc-2.31-compatible.patch |  83 ++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ++++++++++
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   2 +
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   2 +-
 .../startup-notification-0.12/time_t.patch    | 108 ++++++++++
 .../startup-notification_0.12.bb              |   1 +
 .../linux-firmware/linux-firmware_20200619.bb |   4 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 scripts/lib/wic/filemap.py                    |  75 +++----
 21 files changed, 580 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
 create mode 100644 meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch

-- 
2.17.1

