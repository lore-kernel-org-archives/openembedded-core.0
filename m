Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.289.1621462410014256901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 15:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Iy+lZMXj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id gf3so1070817pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 15:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=un5CQ9vkPYhMrEuLp6hyRM0VfoiBHk9jAqKn48ysW+g=;
        b=Iy+lZMXjE3I7vM2q9VyWZeAN4uQbocY/o7xG4QO2mfHgUagFyO92R/BgAL8Ianj3CK
         KB0S+qdADKavsLx6X4ikVmSRci09SZ9/v4/bson+hefLGm08Pxm2zICb1VxxaLESf+4y
         kSTX0GcD/d+IsvmICRpbxKbCSIOhAQXAuxPbLs/0PXGrwG2rlza095bzqAcXRjWZKqwd
         +9yD86YzQ4McuiJ/JKMS5ajVCNz0ux/jYaTJ+vTfjZAeRe+32rSAZx+ba7QlTblG5YSA
         TwC3Etm3j7WQqXXnaJJDn5pgFyhU0KQSNuWdgdkQ/DLcHD8kU/aCjiqYmIcWV9VMs/M3
         8QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=un5CQ9vkPYhMrEuLp6hyRM0VfoiBHk9jAqKn48ysW+g=;
        b=JhxJZKkAP1O0c8fKmvr5uclV7IegO7UFG04xdTErwiCzyhywEA/5sLQ7HUGZgcLD+l
         qdH2f2yKVkLf5FjZYEt1LwUeWpjZA/ruV8rnMDkzWSzPPbdNpG0OpXxM5s5JolxfyF6D
         Z1fI5wBznV6EShRjMjUwXX/0CABsJdjdcUGTZVIp3QqaLhIxj+AyEhY/GcOzKbFL6xT7
         SqUGU7WMRKYGun5+UwBm2jDgWmuQQQrm8nd8k+mAgFEMsjoFEQMt12D/7e6geLIfNQCg
         Rca8z/3AMw85kURbBMuwRqCESiUZZLLcJCzpYzr+3dJXPn+b6iUn1KaA1KnFX4gAa/Ds
         vdVw==
X-Gm-Message-State: AOAM5321qbYt1Ky9uRN2hO+zgfioZaP6XM9vBtkVrGj9LaM2m74/urBL
	3jB/ytJEhrFQjGnY1W411y6t/NDpUnght8LqDX0=
X-Google-Smtp-Source: ABdhPJwnzJ8yZlq4ShhYJ07h02a1AjX58FOePto+nK9wRSDFjsthSax+/99E2YhHr0dJ/xYwmA4lzQ==
X-Received: by 2002:a17:90a:ba8b:: with SMTP id t11mr1610530pjr.106.1621462408559;
        Wed, 19 May 2021 15:13:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p17sm81457pjg.54.2021.05.19.15.13.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 15:13:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/35] Pull request (cover letter only)
Date: Wed, 19 May 2021 12:13:15 -1000
Message-Id: <cover.1621462281.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 55dc503f4ab33e2aa51a3a6e4003131e0b9355ff:

  reproducible.py: add quilt-ptest and valgrind-ptest (2021-05-13 22:10:01 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  linux-firmware: upgrade 20210208 -> 20210315

Anuj Mittal (1):
  lsb-release: fix reproducibility failure

Bruce Ashfield (1):
  linux-yocto/5.4: qemuppc32: reduce serial shutdown issues

Chen Qi (1):
  db: update CVE_PRODUCT

Lee Chee Yang (4):
  subversion: fix CVE-2020-17525
  qemu: fix CVE-2021-3392
  tiff: fix CVE-2020-35523 CVE-2020-35524
  python3-jinja2: 2.11.2 -> 2.11.3

Richard Purdie (19):
  glibc: Document and whitelist CVE-2019-1010022-25
  qemu: Exclude CVE-2017-5957 from cve-check
  qemu: Exclude CVE-2007-0998 from cve-check
  qemu: Exclude CVE-2018-18438 from cve-check
  jquery: Exclude CVE-2007-2379 from cve-check
  logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
  openssh: Exclude CVE-2007-2768 from cve-check
  openssh: Exclude CVE-2008-3844 from cve-check
  unzip: Exclude CVE-2008-0888 from cve-check
  cpio: Exclude CVE-2010-4226 from cve-check
  ghostscript: Exclude CVE-2013-6629 from cve-check
  bluez: Exclude CVE-2020-12352 CVE-2020-24490 from cve-check
  tiff: Exclude CVE-2015-7313 from cve-check
  coreutils: Exclude CVE-2016-2781 from cve-check
  librsvg: Exclude CVE-2018-1000041 from cve-check
  avahi: Exclude CVE-2021-26720 from cve-check
  oeqa/qemurunner: Improve logging thread exit handling for qemu
    shutdown test
  oeqa/qemurunner: Fix binary vs str issue
  oeqa/qemurunner: Improve handling of run_serial for shutdown commands

Robert P. J. Day (2):
  image.bbclass: fix comment "pacackages" -> "packages"
  meta/lib/oe/rootfs.py: Fix typo "Restoreing" -> "Restoring"

Romain Naour (1):
  dejagnu: needs expect at runtime

Ross Burton (3):
  cairo: backport patch for CVE-2020-35492
  libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
  builder: whitelist CVE-2008-4178 (a different builder)

Ulrich Ölmann (1):
  local.conf.sample: fix typo

Yann Dirson (1):
  linux-firmware: include all relevant files in -bcm4356

 meta/classes/image.bbclass                    |   2 +-
 meta/conf/local.conf.sample                   |   2 +-
 meta/lib/oe/rootfs.py                         |   2 +-
 meta/lib/oeqa/selftest/cases/runqemu.py       |   9 +-
 meta/lib/oeqa/utils/qemurunner.py             |  21 +++-
 meta/recipes-connectivity/avahi/avahi_0.7.bb  |   3 +
 .../bluez5/bluez5_5.55.bb                     |   3 +
 .../openssh/openssh_8.2p1.bb                  |   6 +
 meta/recipes-core/coreutils/coreutils_8.31.bb |   4 +
 meta/recipes-core/glibc/glibc_2.31.bb         |  13 ++
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
 meta/recipes-devtools/jquery/jquery_3.5.0.bb  |   5 +
 ...ja2_2.11.2.bb => python3-jinja2_2.11.3.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  12 ++
 .../qemu/qemu/CVE-2021-3392.patch             |  92 ++++++++++++++
 .../subversion/CVE-2020-17525.patch           | 117 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 meta/recipes-extended/cpio/cpio_2.13.bb       |   3 +
 .../ghostscript/ghostscript_9.52.bb           |   4 +
 .../logrotate/logrotate_3.15.1.bb             |   3 +
 .../help2man-reproducibility.patch            |  27 ++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   1 +
 meta/recipes-extended/unzip/unzip_6.0.bb      |   3 +
 .../libnotify/libnotify_0.7.8.bb              |   3 +
 meta/recipes-gnome/librsvg/librsvg_2.40.21.bb |   3 +
 meta/recipes-graphics/builder/builder_0.1.bb  |   2 +
 .../cairo/cairo/CVE-2020-35492.patch          |  60 +++++++++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   1 +
 ...20210208.bb => linux-firmware_20210315.bb} |   8 +-
 .../linux/linux-yocto-rt_5.4.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   2 +-
 .../libtiff/files/CVE-2020-35523.patch        |  55 ++++++++
 .../libtiff/files/CVE-2020-35524-1.patch      |  42 +++++++
 .../libtiff/files/CVE-2020-35524-2.patch      |  36 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   7 ++
 meta/recipes-support/db/db_5.3.28.bb          |   2 +-
 37 files changed, 541 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (92%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch
 create mode 100644 meta/recipes-extended/lsb/lsb-release/help2man-reproducibility.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210208.bb => linux-firmware_20210315.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35523.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35524-2.patch

-- 
2.25.1

