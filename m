Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.811.1593046647343951295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 17:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LElPvLHR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h22so2230432pjf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9AX2R3sz1dqJuQPwG7OoyXO/F8rfJNwwpOf1ilLjP8=;
        b=LElPvLHRLoWR2eVfWTqJG4FU6f8GpmgW2zdNDPN/ro8yrMQ2nXYDHsy6PReLNoYT6t
         LMw2EwDgB8xGuNMePT0z4BTGVUKPp7RIrwo3Tw9zgtGRZQU5m2KIYVhIteuhpMTW3mK7
         PnU07s7ZiXe6B1SWIYScnC8IwmcJQ+QNOEeJRlWvBnk3HRN/+lD2Q3wwnrQ3LhVqiLU1
         ztLkA+YLfVD6AqPmi112+yPdBPInutLSIkNZnVM6GCfyM4eIkoWoM8bVxp7Wc9+Ep7kJ
         zt4xVy/xF2X2+ctoQXNNPbOulnVK6FeVYLDzFSYHLUn/OuZfN/bffjEkkiIgO0PSwrx7
         Qp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9AX2R3sz1dqJuQPwG7OoyXO/F8rfJNwwpOf1ilLjP8=;
        b=la2hRP+HoogSw+A1H3NnWw+Btuj1r71XBoNWOL4Qhadnm83/Civb0IxWN7UmoUPdII
         I5k0ERucUJzRqntOPX0UMKN4A1k1yMiRZZQ+Cr5L1eq1Kg36QK3bEaQnBHfc/gY+rD8n
         roHxCM4hzixogJqhvgjuVsmFebCqQF+DA2eEODI0f6E9LQdyoZRlkCy3utxf95v0LdWT
         erWTKt4Ve8SDRrU/TDAr47eRWiId7WREIFMi9Amd2+XhoGYpnTMVRUbi4DnwbZe/PLN/
         LwcTa/9COrWHc5mv+NrdjLDguRUPhWh3vSwW02xg3HxIfkA+onwggNOzRttiM3XEHp3J
         p+jA==
X-Gm-Message-State: AOAM531W5A3Esh9a5MsPOiYVRWtn5B8Ia5QWev+yo8BBmTgWvH5kydY2
	ySmY3BI3GP3YS/mIAdfwkXs0GaVVe1+A3w==
X-Google-Smtp-Source: ABdhPJx3+Foa0ttFodA8fhiIV+ijK/8opiwj4l5tLGWZ69Sp1mC8XrFhDcPLiCwcXAiX3ZuYqktZDw==
X-Received: by 2002:a17:90a:8c8a:: with SMTP id b10mr517612pjo.117.1593046645986;
        Wed, 24 Jun 2020 17:57:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r9sm22106456pfq.31.2020.06.24.17.57.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:57:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/32] Pull request (cover letter only)
Date: Wed, 24 Jun 2020 14:57:02 -1000
Message-Id: <cover.1593046554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6372f78c2456a9b57ef5f8ff9b975426bd1a46be:

  u-boot-tools: backport patch from upstream to fix gcc 10 builds (2020-06-18 04:34:55 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alex Kiernan (1):
  recipetool: Fix list concatenation when using edit

Alexander Kanavin (3):
  patchelf: switch to git
  powertop: switch to Arjan's git
  apr-util: make gdbm optional

Andreas M?ller (1):
  meson.bbclass: avoid unexpected operating-system names

Chen Qi (1):
  vim: restore the 'chmod -x' workaround in do_install

Dan McGregor (1):
  buildhistory-collect-srcrevs: sort directories

Joshua Watt (1):
  classes/archiver: Create patched archive before configuring

Kai Kang (3):
  mdadm: remove service template from SYSTEMD_SERVICE
  wpa-supplicant: remove service templates from SYSTEMD_SERVICE
  encodings: clear postinst script

Lee Chee Yang (1):
  qemu: fix CVE-2020-13361

Martin Jansa (1):
  net-tools: backport a patch from upstream to use the same ifconfig
    format as debian/ubuntu

Otavio Salvador (6):
  systemd: Sync systemd-serialgetty@.service with upstream
  mtd-utils: Fix return value of ubiformat
  go-mod.bbclass: Add class for `go mod` support
  glide: Avoid use of 'go mod' support
  go-dep: Avoid use of 'go mod' support
  go.bbclass: Add `-trimpath` to default build flags

Peter Kjellerstedt (1):
  relocatable.bbclass: Avoid an exception if an empty pkgconfig dir
    exist

Richard Purdie (2):
  ltp: Add missing dependencies on coreutils, bc, e2fsprogs and gdb
  perl: Fix host specific modules problems

Ross Burton (4):
  install-buildtools: fail if an error occurs
  install-buildtools: remove hardcoded x86-64 architecture
  common-licenses: add BSD-2-Clause-Patent
  gstreamer1.0-plugins-bad: add support for vdpau

Steve Sakoman (1):
  buildtools-tarball: export OPENSSL_CONF in environment setup

Tuomas Salokanto (1):
  recipetool: create: fix SRCBRANCH not being passed to params

Yongxin Liu (1):
  linux-firmware: add ice for Intel E800 series driver

akuster (1):
  bind: update to 9.11.19

haiqing (1):
  libpam: Remove option 'obscure' from common-password

wenlin.kang@windriver.com (1):
  populate_sdk_base.bbclass: fix warning: name not matched

 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/go-mod.bbclass                   |  20 +
 meta/classes/go.bbclass                       |   2 +-
 meta/classes/meson.bbclass                    |   3 +
 meta/classes/populate_sdk_base.bbclass        |   2 +-
 meta/classes/relocatable.bbclass              |  20 +-
 .../common-licenses/BSD-2-Clause-Patent.txt   |  47 +++
 .../bind/bind/CVE-2020-8616.patch             | 206 ----------
 .../bind/bind/CVE-2020-8617.patch             |  29 --
 .../bind/{bind_9.11.13.bb => bind_9.11.19.bb} |   7 +-
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   6 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   1 +
 .../systemd-serialgetty/serial-getty@.service |  14 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb   |   4 +
 meta/recipes-devtools/go/go-dep_0.5.4.bb      |   4 +
 ...-utils-Fix-return-value-of-ubiformat.patch |  62 +++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   1 +
 .../patchelf/patchelf_0.10.bb                 |   7 +-
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-13361.patch            |  61 +++
 meta/recipes-extended/ltp/ltp_20200120.bb     |   4 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |   6 +-
 ...-to-unsigned-long-long-constants-to-.patch | 381 ++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb            |   1 +
 .../pam/libpam/pam.d/common-password          |   5 +-
 .../xorg-font/encodings_1.0.5.bb              |   4 +
 .../linux-firmware/linux-firmware_20200519.bb |   9 +
 meta/recipes-kernel/powertop/powertop_2.10.bb |  13 +-
 .../gstreamer1.0-plugins-bad_1.16.2.bb        |   4 +-
 meta/recipes-support/apr/apr-util_1.6.1.bb    |   6 +-
 meta/recipes-support/vim/vim.inc              |   6 +
 scripts/buildhistory-collect-srcrevs          |   1 +
 scripts/install-buildtools                    |  20 +-
 scripts/lib/recipetool/create.py              |   1 +
 scripts/lib/recipetool/edit.py                |   2 +-
 36 files changed, 672 insertions(+), 292 deletions(-)
 create mode 100644 meta/classes/go-mod.bbclass
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-Patent.txt
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.13.bb => bind_9.11.19.bb} (94%)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/0001-added-ull-prefix-to-unsigned-long-long-constants-to-.patch

-- 
2.17.1

