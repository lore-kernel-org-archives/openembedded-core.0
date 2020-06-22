Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.340.1592848754405648158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=l8nBcFTf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id v13so13802651otp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1JWeNllb96O6RcBIA1tzSmh8jn8JDIRnWr6wsAr0lo=;
        b=l8nBcFTf6hZfG8sdWBtfH22a6hLQWm8UrSYUwAKt7re6Izip8f6anZ5hh4a/B2fgGo
         L+fE3q4L3aqPuyHVAxvZlPfdVpW+uJ2AwEEKKOFN0sSzvhV8ZeZ2PMR8kqsLYCRTm03E
         //liuakA+5mpklKL/7yGxtcQINfpUJTeEJlklZMPLyRSDkKVjdnXbcYgAaJTLMHIaw0S
         ymq9g+kxZaccgQ/UnMCZvEZI0lQfwdgOux3nlrCWFc+NrO05nfpIdUkwLdN8w4ohTjbR
         tAy6nbEHsM5WSVx7+7565MbTo8Eb4zPRGl7SJ9BSH0VFkgVB31ODmPZqLjqS7RNRaxgj
         exhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1JWeNllb96O6RcBIA1tzSmh8jn8JDIRnWr6wsAr0lo=;
        b=e2CtqadmoFsYMe0PCbzm6+KkS+Onryk3RLm3Rgz+UbLQJ7fH/K/Vhfdt3RMx8IwH3N
         ar8146O57cIBD4iWkkDFNSLHjHoNQK7+PpIQzhCuloXBx6wdFega8udI7dz+CtwEASSQ
         zyHwsexXrVibUJIu3h5n1/8rI6c3tLntmx2atyM1PixIRlEsTAP1h3lJB4+5jr3qPDda
         khfmvuREiJTvrOR6GHDWgOP0lUPxnPzqtF/vUMC8W7X4QmHudHlTsXjxblqDW4EWE7j9
         E0XbvKDfoE1pB03OwnL23EteUS61ZrJ1k2g4Hi4FXu2AFS8LykxwQBvcTCrLNLf/0wI6
         OWEg==
X-Gm-Message-State: AOAM533jIEBY9YFdQN0A1ajn8EhNhJnHMiXiCAodCuVW3XcL1F7++Ou+
	QTqJD33z4JmU18USZADfNbMYJNLocnChKw==
X-Google-Smtp-Source: ABdhPJy6rtsEv6HjV25L/phKrrc49wxUFQ9oxEv8LZC+F2E0KvYrue0ClwADrXTmmk1/eyUoTNZTAQ==
X-Received: by 2002:a05:6830:18db:: with SMTP id v27mr15304726ote.75.1592848752959;
        Mon, 22 Jun 2020 10:59:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/33] Patch review
Date: Mon, 22 Jun 2020 07:57:54 -1000
Message-Id: <cover.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 6372f78c2456a9b57ef5f8ff9b975426bd1a46be:

  u-boot-tools: backport patch from upstream to fix gcc 10 builds (2020-06-18 04:34:55 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

Konrad Weihmann (1):
  oeqa/runtime: Add OERequirePackage decorator

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
 meta/lib/oeqa/runtime/decorator/package.py    |  34 +-
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
 37 files changed, 704 insertions(+), 294 deletions(-)
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

