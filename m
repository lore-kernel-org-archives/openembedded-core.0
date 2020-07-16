Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.5168.1594857721977151364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 17:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Uq3e+JTZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id g67so3904318pgc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LFy25d/ogI68A+g9OexQ0nRjUIA/AhtvKhrfPg/6FPc=;
        b=Uq3e+JTZRavZ3YdVVgpzJOzgxM2emLLQkOYsLNuig8gvMl8vb+37AiNSlXpePaRlMZ
         6E5G2DPxQrvfvWkDuXAtUVDAQNZqKNaKjPGCzY+w/IdyaGhYtLd655LDO3Z2A63PqHUF
         BQ9LCUiHsxps2zsOidudDETHIr+15TpgyhDYD10JMDc/fob5/2uH2Jkv5/DrWJmh0Uu2
         sTEzjHKrRwhxf6RJ1Rd2w4TA9sxOjLQ5pUHiJidu6hZGsSFaJJK8bbXSDhFNuBC9DuGS
         iExSZmEnhEkopccDixS4dqcqIYtxhoxyphqQciKa3yKeqaAD5CS/uTgKHQzVTultf7TC
         tOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LFy25d/ogI68A+g9OexQ0nRjUIA/AhtvKhrfPg/6FPc=;
        b=C9jSJw2sGxE2oiV6/YZDTucMSB/V7aeNjNr1IVcSr87JJut064TYfdHslqUCWwZJot
         3iKCXjeif26Pgoj1y+hQsQcNMf5SLNhJtEgPOELCRzzwbvgD16QzMRqFiWbjK2RahDg5
         sAre0RO+2syJKAN3vVp5eK8g1gSldDaLT9mG9QYfwCsvBqu/+dAVw8DDahGov5ajJByy
         5n0OOJGp4V7/Z5adisSrB/MUpEN/4uPUumpgXju+2XQzlgkBLF3v+hgO5gRtuNRg5Ddv
         o+SzS4ussbVk/vNoKoAHoftjpfiBVVOI1JT4VTaqDbO4q/Duxq2PIWj0dEDs/du5YNC9
         AY/g==
X-Gm-Message-State: AOAM532O1seVzoAG8VnHRq0KsuEI4+NSuHk59g0wnMyOruWUdvjdLN7O
	Gv5XN5mU1ZSgS/Ebw1gGSfbJf2p6nFM3bg==
X-Google-Smtp-Source: ABdhPJzu4bSwNkgeojcIKtazDs7dPJrpmfdVo6lK9U8oEuVxYdqGLgOYmTk8boCN7gil4udY4ZrNxg==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr1946668pga.335.1594857720609;
        Wed, 15 Jul 2020 17:02:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z11sm3153267pfg.169.2020.07.15.17.01.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 17:01:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Wed, 15 Jul 2020 14:01:47 -1000
Message-Id: <cover.1594857635.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit cabaf5654db5db12b6576ef0ebae9bc7b422a8ca:

  iso-codes: switch upstream branch master -> main (2020-07-07 07:07:06 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  gobject-introspection: add a patch to fix a build race
  icu: make filtered data generation optional, serial and off by default

Andrey Zhizhikin (1):
  kernel/yocto: fix search for defconfig from src_uri

Bjarne Michelsen (1):
  devtool: default to empty string, if LIC_FILES_CHKSUM is not available

Bruce Ashfield (2):
  kernel/yocto: ensure that defconfigs are processed first
  linux-yocto/5.4: update to v5.4.50

Christian Eggers (1):
  libnl: Extend for native/nativesdk

Hannu Lounento (1):
  openssl: move ${libdir}/[...]/openssl.cnf to ${PN}-conf

Joshua Watt (2):
  classes/archiver: run do_unpack_and_patch after do_preconfigure
  classes/archive: do_configure should not depend on do_ar_patched

Konrad Weihmann (1):
  systemd: remove kernel-install from base pkg

Rasmus Villemoes (1):
  coreutils: don't split stdbuf to own package with single-binary

Timon Ulrich (1):
  kernel.bbclass: add lz4 dependency and fix the call to lz4

Vacek, Patrick (1):
  oeqa/core/loader: fix regex to include numbers

 meta/classes/archiver.bbclass                 |  4 +--
 meta/classes/kernel-yocto.bbclass             | 34 ++++++++++++-------
 meta/classes/kernel.bbclass                   |  3 +-
 meta/lib/oeqa/core/loader.py                  |  2 +-
 .../openssl/openssl_1.1.1g.bb                 |  4 ++-
 meta/recipes-core/coreutils/coreutils_8.31.bb | 15 ++++++--
 meta/recipes-core/systemd/systemd_244.3.bb    |  1 -
 ...ency-for-g-ir-compiler-for-building-.patch | 33 ++++++++++++++++++
 .../gobject-introspection_1.62.0.bb           |  1 +
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++------
 meta/recipes-support/icu/icu.inc              |  4 ++-
 meta/recipes-support/icu/icu_66.1.bb          |  6 +++-
 meta/recipes-support/libnl/libnl_3.5.0.bb     |  2 ++
 scripts/lib/devtool/upgrade.py                |  4 +--
 16 files changed, 107 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch

-- 
2.17.1

