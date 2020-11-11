Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.188.1605054750641787929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 16:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AbrFV4LL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id e7so400302pfn.12
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 16:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKZmBFsdW7wm8aii+46yurv4QzoHd0ZQyf7Y5B3ea0Y=;
        b=AbrFV4LLeC9Um9HvQunAlAU7smIOkZOf6DgoTIdOTgb9/a0DjjaIIGuNrzUFCRWjoR
         YQ1fdmGKqoHGZ+M7EyUSS8wqkiwn4YQGut6YPsDuIY/SskhZduJptRj7Z9ga46AielAU
         o5QB7/i0yGNJfQryMpdWUf7vv1SHMHgp2s1KqTW0r57TSM/got96eY4gf1I1QAJRTRtD
         lzEY+59iZxEQAZH21YMRl0nQ2aIymRvjaIz5Yetv+hYVMsc2g+n3UbXi7gNSV5vbJDuo
         D3auASowfzDBkx+pfXOq5Bc7k6CqN9zoQcIyKiBpMlSTiQShwIkD5zZJddDq0p1JUm1a
         F+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKZmBFsdW7wm8aii+46yurv4QzoHd0ZQyf7Y5B3ea0Y=;
        b=kemL/Nuv1XxC4Od+DxaVk8lrkwYaVNX7PLXRbK7OlEv84lwCKtzJ7xRAZbLIsAg/9X
         /mCZmOW2lYLst0jC4OzTU3kuMRR/ZfxpTFtCtRuTFSIoyOt+UmnYweFRjjiY8+igqaFw
         JaIZ2nyYm/Ey/AfGxQZ9SXbaEODRKlc4N1rfgRbEEO/8crv8b9H/4xxqnZZSlEmrGGeL
         r9ercEK20DULDkMyes6FeXK9zsR5Zgtc5tvJnEYH5NjuplcKMKR+/gPcrXIY63/LHA2H
         xl6cEU46+Ga+VXi0WxxbidjPYeF4fuGdkArMY/SGsRPrIxN2NpvI6DY02x9xl78DxSGi
         vAXA==
X-Gm-Message-State: AOAM5326r0bKB1lklKbTv5ksQHyMyJsF5rsO9SkrwsM2y3hdh7FQ1coz
	bpvGuC2hy1AnjZlTDjTeO2nJrEbtEegwfA5V
X-Google-Smtp-Source: ABdhPJwz5XVI5bPZaQb9Xh40bEXOyEi3vQa/t3zm8KFKPwCRbGTV+C/557JfRrUBo72VPNYA5XGepg==
X-Received: by 2002:a17:90a:5d11:: with SMTP id s17mr865441pji.107.1605054749345;
        Tue, 10 Nov 2020 16:32:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q16sm282342pff.114.2020.11.10.16.32.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 16:32:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/32] Pull request (cover letter only)
Date: Tue, 10 Nov 2020 14:32:19 -1000
Message-Id: <cover.1605054618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5f644082fc3c2bbd89b898d5ca7cd4414cda4a64:

  nasm: update 2.14.02 -> 2.15.03 for CVE fixes (2020-11-02 04:05:13 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  linux-firmware: upgrade 20200817 -> 20201022

Andrey Zhizhikin (1):
  insane: add GitLab /archive/ tests

Changqing Li (1):
  timezone: upgrade to 2020d

Chee Yang Lee (2):
  bluez5: update to 5.55 to fix CVE-2020-27153
  ruby: fix CVE-2020-25613

Joshua Watt (1):
  jquery: Upgrade 3.4.1 -> 3.5.0 to fix CVE-2020-11022 and
    CVE-2020-11023

Khem Raj (1):
  qemuboot.bbclass: Fix a typo

Mark Jonas (4):
  Add license text for PSF-2.0
  Map license names PSF and PSFv2 to PSF-2.0
  libsdl2: Fix directfb syntax error
  libsdl2: Fix directfb SDL_RenderFillRect

Martin Jansa (3):
  lib/oe/patch: prevent applying patches without any subject
  lib/oe/patch: GitApplyTree: save 1 echo in commit-msg hook
  Revert "lib/oe/patch: fix handling of patches with no header"

Max Krummenacher (2):
  linux-firmware: package marvel sdio 8997 firmware
  linux-firmware: package nvidia firmware

Maxime Roussin-Bélanger (1):
  meta: fix some unresponsive homepages and bugtracker links

Mingli Yu (1):
  update_udev_hwdb: clean hwdb.bin

Neil Armstrong (1):
  linux-firmware: add Amlogic VDEC firmware package

Richard Leitner (1):
  xcb-proto: backport fix for python gcd function

Richard Purdie (1):
  sstatesig: Log timestamps for hashequiv in reprodubile builds for
    do_package

Steve Sakoman (7):
  sqlite3: fix CVE-2020-13434
  sqlite3: fix CVE-2020-13435
  sqlite3: fix CVE-2020-13630
  sqlite3: fix CVE-2020-13631
  sqlite3: fix CVE-2020-13632
  netbase: update SRC_URI to reflect new file name
  netbase: bump PE to purge bogus hash equivalence from autobuilder

Yann E. MORIN (2):
  common-licenses: add bzip2-1.0.4
  recipes-core/busybox: fixup licensing information

Yongxin Liu (2):
  grub: fix several CVEs in grub 2.04
  grub: clean up CVE patches

 meta/classes/insane.bbclass                   |    4 +-
 meta/classes/qemuboot.bbclass                 |    2 +-
 meta/conf/licenses.conf                       |    6 +-
 meta/files/common-licenses/PSF-2.0            |   49 +
 meta/files/common-licenses/bzip2-1.0.4        |   43 +
 meta/lib/oe/patch.py                          |   13 +-
 meta/lib/oe/sstatesig.py                      |    6 +
 ...308-calloc-Use-calloc-at-most-places.patch | 1863 +++++++++++++++++
 ...low-checking-primitives-where-we-do-.patch | 1330 ++++++++++++
 ...se-after-free-when-redefining-a-func.patch |  117 ++
 ...er-overflows-in-initrd-size-handling.patch |  177 ++
 ...-we-always-have-an-overflow-checking.patch |  246 +++
 ...dd-LVM-cache-logical-volume-handling.patch |  287 +++
 ...e-arithmetic-primitives-that-check-f.patch |   94 +
 ...used-fields-from-grub_script_functio.patch |   37 +
 meta/recipes-bsp/grub/grub2.inc               |    8 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |    2 +-
 .../recipes-connectivity/bind/bind_9.11.22.bb |    2 +-
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} |    4 +-
 meta/recipes-connectivity/iw/iw_5.4.bb        |    2 +-
 meta/recipes-core/busybox/busybox.inc         |    7 +-
 meta/recipes-core/netbase/netbase_6.1.bb      |    9 +-
 meta/recipes-core/readline/readline.inc       |    2 +-
 meta/recipes-core/util-linux/util-linux.inc   |    4 +-
 meta/recipes-devtools/chrpath/chrpath_0.16.bb |    3 +-
 .../{jquery_3.4.1.bb => jquery_3.5.0.bb}      |    8 +-
 meta/recipes-devtools/ninja/ninja_1.10.0.bb   |    2 +-
 .../ruby/ruby/CVE-2020-25613.patch            |   40 +
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |    1 +
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |    2 +-
 .../recipes-extended/minicom/minicom_2.7.1.bb |    2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |    2 +-
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 meta/recipes-extended/which/which_2.21.bb     |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb       |    2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb    |    3 +-
 .../libsdl2/directfb-renderfillrect-fix.patch |   33 +
 ...ectfb-spurious-curly-brace-missing-e.patch |   49 +
 .../libsdl2/libsdl2_2.0.12.bb                 |    2 +
 ...1-xcbgen-use-math-gcd-for-python-3-5.patch |   40 +
 .../xorg-proto/xcb-proto_1.13.bb              |    3 +-
 meta/recipes-kernel/kmod/kmod.inc             |    2 +-
 ...20200817.bb => linux-firmware_20201022.bb} |   51 +-
 .../wireless-regdb_2020.04.29.bb              |    2 +-
 .../libvorbis/libvorbis_1.3.6.bb              |    4 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |    2 +-
 meta/recipes-support/atk/atk_2.34.1.bb        |    5 +-
 .../bash-completion/bash-completion_2.10.bb   |    4 +-
 meta/recipes-support/npth/npth_1.6.bb         |    4 +-
 .../sqlite/files/CVE-2020-13434.patch         |   48 +
 .../sqlite/files/CVE-2020-13435.patch         |  219 ++
 .../sqlite/files/CVE-2020-13630.patch         |   32 +
 .../sqlite/files/CVE-2020-13631.patch         |   99 +
 .../sqlite/files/CVE-2020-13632.patch         |   34 +
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |    5 +
 scripts/postinst-intercepts/update_udev_hwdb  |    1 +
 56 files changed, 4963 insertions(+), 63 deletions(-)
 create mode 100644 meta/files/common-licenses/PSF-2.0
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
 create mode 100644 meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
 create mode 100644 meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
 create mode 100644 meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
 create mode 100644 meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)
 rename meta/recipes-devtools/jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb} (73%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd-for-python-3-5.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200817.bb => linux-firmware_20201022.bb} (95%)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13434.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13435.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13630.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13631.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13632.patch

-- 
2.17.1

