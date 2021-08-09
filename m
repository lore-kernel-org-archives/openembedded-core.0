Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.823.1628550630206143041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 16:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fRLuoa4x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso1477365pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 16:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fDem1acgG4A74TxftD4vjgArS2kMixB/DNU+ajMHjg=;
        b=fRLuoa4xEHtXi3x0MVZMJcSXrU+cVCUU8yi0qHKt4k+OhCnkxNIGLH0/u02Uw51W2h
         d+Aus0emXdwL99Nbgd+dquDjRQ+zBxVaUM1N3VqJ4XM3GqrSIvtj/6AnSbX4tYgfgluJ
         r+ocTlWe+nf3hRoMwQqDG1WdliDUnFiE1sg1oXrZ6FbGBrleDKSQ8O9ilkYvEr4rtJqy
         huXy18MtBdVQRB006ooNF3u5MVKhCfmbgsdMaOwhxo7cMdu0IEu62xF7B+9oN2oMd/Pq
         WhwaBYY4ACmKahf1EZ/OrAuXXN8CqsnbKQcXDfZnBWJd2fCy0hMvkarUjy0J0iweORsP
         jFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fDem1acgG4A74TxftD4vjgArS2kMixB/DNU+ajMHjg=;
        b=iYFyqUabwLVZWarjWgcVL1VplDpuseZrfnby8JkKPrgYZl5QcEkaBcnlx3nmzeTn9i
         +xSnEq+kVmtj1HZ+6Vz3CnXD0uLvQ0CC1PiyLE6flDa+ZtxjuyDel9pUs7g7alCaiPiv
         Zz3ERglQhuomDyoIbTc405wYkh2QDGEi50iBSHsEtjY4uvYy692WFuc+R3H5o80SMR3C
         lfYl3RsDIs9Ruqry8rGOO97hUVKswFRhG36MWMHDEAEPfNvC3j//UGb10PJmAjV7Orez
         bM+V97uFrky05LDI1IT06nfWkasqoR4stu0RF0SYLedD7Mrj2G18XHs0Lr9l6wqLBSMY
         T3fg==
X-Gm-Message-State: AOAM532d5gKc8+qILDGxDFDJ0B3NycbCkL6FG0Hdb/CiOFWBpA63lUq7
	VczUX5vSM5/BYHcVQSyrKQOQPGapnHXPwfdW
X-Google-Smtp-Source: ABdhPJzom6vBmyWgyVqN23AsDQsjnSBXX7VGPvLRCfWOzcQmC30pFmEwxMVkJl4jYUVnz2KXbdojHQ==
X-Received: by 2002:a17:90a:74c8:: with SMTP id p8mr16028158pjl.214.1628550628095;
        Mon, 09 Aug 2021 16:10:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l185sm13888514pfd.62.2021.08.09.16.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 16:10:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/33] Pull request (cover letter only)
Date: Mon,  9 Aug 2021 13:10:03 -1000
Message-Id: <cover.1628550516.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9ae339ace9274be71bfd3b5e5da64dceac9fa963:

  kernel-devsrc: fix 32bit ARM devsrc builds (2021-07-20 06:36:58 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Armin Kuster (1):
  qemu: Enable seccomp if FEATURE is set

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.134
  linux-yocto/5.4: update to v5.4.135

Changqing Li (1):
  archiver.bbclass: fix do_ar_configured failure for kernel

Khem Raj (1):
  ovmf: Fix VLA warnings with GCC 11

Michael Opdenacker (1):
  oe-setup-builddir: update YP docs and OE URLs

Mike Crowe (1):
  curl: Fix CVE-2021-22924 and CVE-2021-22925

Nathan Rossi (1):
  qemu.inc: Add seccomp PACKAGECONFIG option

Neetika Singh (1):
  curl: Fix for CVE-2021-22898

Nicolas Dechesne (4):
  yocto-check-layer: improve missed dependencies
  checklayer: new function get_layer_dependencies()
  checklayer: rename _find_layer_depends
  yocto-check-layer: ensure that all layer dependencies are tested too

Oleksandr Kravchuk (1):
  bitbake.conf: change GNOME_MIRROR to new one

Ralph Siemsen (1):
  oeqa/manual/toaster: fix small typo

Richard Purdie (2):
  yocto-check-layer: Remove duplicated code
  sstate: Fix rebuilds when changing layer config

Ross Burton (1):
  glew: fix Makefile race

Steve Sakoman (5):
  Revert "gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are
    fixed"
  Revert "gstreamer-plugins-base: ignore CVE-2021-3522 since it is
    fixed"
  gstreamer: ignore CVE-2021-3497, CVE-2021-3498, and CVE-2021-3522
  libxml2: fix CVE-2021-3541
  avahi: fix CVE-2021-3468

Teoh Jay Shen (5):
  oeqa/ethernet_ip_connman : add test for network connections
  oeqa/runtime : add test for RTC(Real Time Clock)
  oeqa/suspend : add test for suspend state
  oeqa/terminal : improve the test case
  oeqa/usb_hid.py : add test to check the usb/human interface device
    status after suspend state

TeohJayShen (1):
  oeqa/runtime: add test for matchbox-terminal

Ulrich Ölmann (1):
  initramfs-framework/setup-live: fix shebang

Wes Lindauer (1):
  oeqa/runtime/cases: Only disable/enable for current boot

Yi Zhao (1):
  ifupdown: added -1 option to dhclient for dhcpv6

leimaohui (1):
  archiver.bbclass: Fix patch error for recipes that inherit dos2unix.

 meta/classes/archiver.bbclass                 |   8 +-
 meta/classes/sstate.bbclass                   |   1 +
 meta/conf/bitbake.conf                        |   2 +-
 .../lib/oeqa/manual/toaster-managed-mode.json |   2 +-
 meta/lib/oeqa/runtime/cases/date.py           |   4 +-
 .../oeqa/runtime/cases/ethernet_ip_connman.py |  36 +++
 meta/lib/oeqa/runtime/cases/rtc.py            |  38 +++
 meta/lib/oeqa/runtime/cases/suspend.py        |  33 +++
 meta/lib/oeqa/runtime/cases/terminal.py       |  21 ++
 meta/lib/oeqa/runtime/cases/usb_hid.py        |  22 ++
 meta/recipes-connectivity/avahi/avahi.inc     |   1 +
 .../avahi/files/CVE-2021-3468.patch           |  42 ++++
 ...-1-option-to-dhclient-on-upping-an-i.patch |  65 +++++
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |   1 +
 .../initramfs-framework/setup-live            |   2 +-
 .../libxml/libxml2/CVE-2021-3541.patch        |  73 ++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 .../ovmf/0001-Fix-VLA-parameter-warning.patch |  51 ++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 meta/recipes-devtools/qemu/qemu_4.2.0.bb      |   1 +
 .../0001-Fix-build-race-in-Makefile.patch     |  56 +++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../gstreamer1.0-plugins-base_1.16.3.bb       |   4 -
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   5 -
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   9 +
 .../curl/curl/CVE-2021-22898.patch            |  26 ++
 .../curl/curl/CVE-2021-22924.patch            | 226 ++++++++++++++++++
 .../curl/curl/CVE-2021-22925.patch            |  43 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   4 +
 scripts/lib/checklayer/__init__.py            |  11 +-
 scripts/oe-setup-builddir                     |   4 +-
 scripts/yocto-check-layer                     |  25 +-
 36 files changed, 813 insertions(+), 45 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
 create mode 100644 meta/lib/oeqa/runtime/cases/rtc.py
 create mode 100644 meta/lib/oeqa/runtime/cases/suspend.py
 create mode 100644 meta/lib/oeqa/runtime/cases/terminal.py
 create mode 100644 meta/lib/oeqa/runtime/cases/usb_hid.py
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2021-3468.patch
 create mode 100644 meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3541.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch

-- 
2.25.1

