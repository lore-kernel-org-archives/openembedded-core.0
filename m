Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.57659.1595862609642736934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OqQNCras;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id d1so8145563plr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=dDvoD26O4fWBcU0nJU2fnlU0FI/L1AY6tihIZI26TUA=;
        b=OqQNCrasJgQKkvuu2BJYsOgMqXcE0MGj3o13zq1nic5+2xzRqD6423GFtnFMlyIGj4
         6am1ekqiUbjfQK0JbHtMRbDWlWM2uRbliR3RLaaxFjZKkU2DReViE7Y5+DkcyQJ2pKOt
         8IdTKwao22DWBwndlGvb65HQycpeVXDyScz5AFl7DGiyZSfgIc7by1q3hY4IXT61gQkv
         zLiLYUxlZLFspqsBAWyojQLquDyrG234qUISMVXAhoFOtp6/Qoj8SMkcy1TV400RsoXK
         xPFb+Tgqk4ghaPuEiSgS0nCOO5r1jGaXY22tvhhuprri6eLDQ2iDZuPBJeULYGD8ZwED
         jNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=dDvoD26O4fWBcU0nJU2fnlU0FI/L1AY6tihIZI26TUA=;
        b=rQM7O4tyBolJg6SSNAf5VaCVlvzxKOtadiF5rcRQ7ALgNeUj+0wyLUZzztcOrSa1sK
         FYhz5pgJpBH8mwhxxGEEd/4ROHCJaBoqyPZCTQ0j23EfGrnm05voNcJZa1ZgVYrwDPgj
         cGDUt/MNiCZ9/rS9WhjnAS7Pseaq3Zds8uQQmvalQ585vl6GQ3og26sMR5hxI0lF6hKa
         onKG1Ax+3mykj9ionKV8fgCEMq3jSE9L3iI74YT6jHD0Y5oMTXFQQkTqE4wjL4D3OhRy
         j9dZ3FAM4v5yRwovypQJxaWxWNbvALTZEi8ysduqCrsL7aXz8i9wTBdBkdasvn8RajIJ
         ZnVg==
X-Gm-Message-State: AOAM531o+SpRM+2ZdSAXkxciXdxOH2pI+AhMfFJhzsOilEGe4vJqFaWU
	bqs6fsbqEzObHoJLCouYyesoiOIL1e4=
X-Google-Smtp-Source: ABdhPJyq0C3sDIzRN8YxaX5cQwp8oD4817Mw2PYC4wuhClhS2jrlfuwMJZWDHYRC+uNmxmredjKn3A==
X-Received: by 2002:a17:902:c011:: with SMTP id v17mr18535570plx.15.1595862608407;
        Mon, 27 Jul 2020 08:10:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Mon, 27 Jul 2020 05:09:39 -1000
Message-Id: <cover.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit ea886d57db917a41a0d106a15e1e96c72d6407b0:

  kernel-yocto: account for extracted defconfig in elements check (2020-07-23 04:07:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ahmad Fatoum (1):
  core: glib-2.0: fix requested libmount/mkostemp/selinux not being
    linked in

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
 ...ot-hardcode-linux-as-the-host-system.patch |  49 +++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |   1 +
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
 23 files changed, 630 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
 create mode 100644 meta/recipes-graphics/startup-notification/startup-notification-0.12/time_t.patch

-- 
2.17.1

