Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.5008.1590635075953588617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 20:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EeyYRTlv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id fs4so2436715pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 20:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qq8lQwoJVrQzV5ntgwcAfEJhnYfRneM/GCw08Q+yCPs=;
        b=EeyYRTlv1XlaYmSH6npLACR76DYvaV5T10iQ6/HK4wLbJpPT7yQ1AFTCBUvpv3pqgA
         8lMqj+ueez494bhziHky14lbxw/K/h1KEi3dZEg+fF9WZ0Yjo13dawaevMJYsjV8dG6v
         vnIw2swzgCEI7hLs8TtZ7hwSEuQX9qWfizGU8Tjink4OascU5LuXL7lhElxWdRPHw5cc
         3GMX80/KnphKHUSUMZOLDd3YyboN4yh3G5hn/lOeYReZ/NxjW9Z8KMlh84dcHv5pWNTL
         GQKBa+S9BjeoUn6upLShgMav/GrJ4Zx1w55ZuQ80hiKewbm9lrk7eoI4x40mFbApACR1
         rTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qq8lQwoJVrQzV5ntgwcAfEJhnYfRneM/GCw08Q+yCPs=;
        b=RrCqgQUsSGD5HT5H6iGzECVvfSxKEQ/XjoSRSFtDdCCNnJbbCc+wXL9/1+6kO+Zawq
         NLk3r2W6WWHeB+V+PPSCoMSkfvBlOrdaklI5qMwhlhsM/aJTplPIE2QkSbeXCIm1puSp
         Sbo1enm5C0jyS0So/Xxmp4pMHS9Fft226/i9WXTDTDJzkO9W9HYSAup/diJhylicNSn/
         AtPIbuDMqd7nJ66qyd3NhlChOGeBHpRqvRaKlkNNQb6hWRIm+HnUjYiREU+Pn2qYRaMR
         bdIrKA7It+QzNwePVZk8oePOXZ8S0/hclRU2ZHGZSW8AMHRSFX/MEuUX8zQH9H/hSIw7
         iCzw==
X-Gm-Message-State: AOAM530CtaSHW62qnAd/F8fGqjpnuBbkOjnc1D8hsvdb9nER9bX+Raje
	FgoKLVqR7nPVLMefcUw8dba39pcA8Bg=
X-Google-Smtp-Source: ABdhPJxU+iCp/PuLnfQAdKY94OG57odlnx60vDrZvHmdBm/BBeFRJGuNn2yOk+ZPcycrgGnfioYmWA==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id cp14mr1472074pjb.56.1590635074276;
        Wed, 27 May 2020 20:04:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g18sm3213813pfq.146.2020.05.27.20.04.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 20:04:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Wed, 27 May 2020 17:04:12 -1000
Message-Id: <cover.1590619258.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5bfdb6bfbd6f1de10d415228e5a5ebe01a623e2a:

  file: add PACKAGECONFIG for auto options (2020-05-14 06:33:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Adrian Bunk (2):
  git: Upgrade 2.24.1 -> 2.24.3
  wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29

Alexander Kanavin (1):
  testresults.json: add duration of the tests as well

Aníbal Limón (3):
  recipes-kernel/linux-firmware: Add wlanmdsp.mbn to qcom-modem package
  recipes-kernel/linux-firmware: Add adreno-a630 firmware package
  linux-firmware: Update to 20200122 -> 20200421

Jan-Simon Moeller (1):
  file: add bzip2-replacement-native to DEPENDS to fix sstate issue

Kai Kang (1):
  gcr: depends on gnupg-native

Lee Chee Yang (1):
  qemu: fix CVE-2020-11869

Marek Vasut (1):
  libubootenv: Depend on zlib

Mingli Yu (2):
  bison: fix the parallel build
  python3-setuptools: add the missing rdepends

Paul Barker (2):
  archiver.bbclass: Make do_deploy_archives a recursive dependency
  avahi: Don't advertise example services by default

Quentin Schulz (1):
  base/insane: Check pkgs lics are subset of recipe lics only once

zhengruoqin (1):
  make-mod-scripts: Fix dependence error.

 meta/classes/archiver.bbclass                 |  4 +-
 meta/classes/base.bbclass                     | 13 ---
 meta/classes/insane.bbclass                   | 21 +++-
 meta/lib/oeqa/core/runner.py                  |  6 +-
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb    |  2 +-
 meta/recipes-connectivity/avahi/avahi.inc     |  5 +
 .../0001-bison-fix-the-parallel-build.patch   | 63 ++++++++++++
 meta/recipes-devtools/bison/bison_3.5.3.bb    |  1 +
 meta/recipes-devtools/file/file_5.38.bb       |  2 +-
 meta/recipes-devtools/git/git_2.24.1.bb       | 11 ---
 meta/recipes-devtools/git/git_2.24.3.bb       |  9 ++
 .../python/python-setuptools.inc              |  2 +
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-11869.patch            | 97 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_3.34.0.bb          |  2 +-
 ...20200122.bb => linux-firmware_20200421.bb} | 12 ++-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +
 ....06.03.bb => wireless-regdb_2020.04.29.bb} |  3 +-
 18 files changed, 219 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-bison-fix-the-parallel-build.patch
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.24.3.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb => linux-firmware_20200421.bb} (98%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

-- 
2.17.1

