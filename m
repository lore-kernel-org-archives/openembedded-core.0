Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.8241.1620831453990916443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=D6eill+9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so20775360otf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYDbdRWOwn3WzDhE1aVRXKd/N4pEYBisXwT0U4As5fY=;
        b=D6eill+9mAShtiHHjAb+zM/NtZBC4oKzLbDN83iJ/40Nkxz1OaYbWtS60pLfnZzZwy
         fE6r6jAdmcgoYqbVEU8bkMTMoFcXzaXFajT9889AaXBN8piWVHYqwZ/4ESPZjkfIpGCO
         azZSGKpSpKYmPJIbof+uMig8PZMvUSSU2DHVTR3f90GjH4E7CvaAOREy0wlyB2hkgkP/
         3OsDCC/csUVdJvk7fGhZT8OzdcvTU2cY4l2cYKfA65Nvk62MTOdjHgsFZWPpSA0le6RF
         sHVbfN2ajUpQGq8EUeY7YX6ewmk1vRtq8qD/yVHKhJHbBpJx75EyPeRrIZA2SmrS/GZI
         WAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aYDbdRWOwn3WzDhE1aVRXKd/N4pEYBisXwT0U4As5fY=;
        b=dKDmb/HQ/69lAb0P5qV0LlssmWb/gGwn4VVp77A04Z1ldB2uv6eSRuhKcEAcOkOfTo
         ar7LFXGyFHCW0D+wArZdSkDkBY9OCjXgNXXLwGBx7IXTu3FqZkoJGvk7XWo6Jk4mAwRG
         vOMtQkqB4JK2aPGOCOzdveWh/fz4s61AmUxMDiqiOYS21jikgQT+m6mDgtk9X174Uag0
         DrROWdX06esFh4rj/pCnmv+pmHWDb0e0fOt75Cbgs9F1GG7q/bGGZlY9W1ZOGkMF1XVi
         YV/u9CUrML1H+UQxa4oCfu/lhBris2EtkeMM+wRefpjdtyCwo+ASdq01u7l0hWeyNl53
         B6gQ==
X-Gm-Message-State: AOAM532B1xgb/vYyDT5aTLeLC4wzswzuD6YoB0mqhl5rpL/anEW7LStn
	pN8myARx+kJhTM65ucUF6dFHxfRpnhkwfYRpPu4=
X-Google-Smtp-Source: ABdhPJxJchzO+Ki577keCE8pcRHGxaJZZ2Oq3/ydCNYOAItHFTQ8LuD9aU1wBnQXqd5Vp1lkqLG/Cg==
X-Received: by 2002:a9d:5a1a:: with SMTP id v26mr31440069oth.50.1620831452853;
        Wed, 12 May 2021 07:57:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:57:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/22] Patch review
Date: Wed, 12 May 2021 04:56:39 -1000
Message-Id: <cover.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2144

The following changes since commit 5b2ad70cd82c3b812652886ee4bf29f88dcac42c:

  reproducible.py: add quilt-ptest and valgrind-ptest (2021-05-07 05:21:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

Richard Purdie (9):
  glibc: Document and whitelist CVE-2019-1010022-25
  qemu: Exclude CVE-2017-5957 from cve-check
  qemu: Exclude CVE-2007-0998 from cve-check
  qemu: Exclude CVE-2018-18438 from cve-check
  jquery: Exclude CVE-2007-2379 from cve-check
  logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
  openssh: Exclude CVE-2007-2768 from cve-check
  oeqa/qemurunner: Fix binary vs str issue
  oeqa/qemurunner: Improve handling of run_serial for shutdown commands

Romain Naour (1):
  dejagnu: needs expect at runtime

Ross Burton (3):
  cairo: backport patch for CVE-2020-35492
  libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
  builder: whitelist CVE-2008-4178 (a different builder)

Yann Dirson (1):
  linux-firmware: include all relevant files in -bcm4356

 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 .../openssh/openssh_8.2p1.bb                  |   3 +
 meta/recipes-core/glibc/glibc_2.31.bb         |  13 ++
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |   1 +
 meta/recipes-devtools/jquery/jquery_3.5.0.bb  |   5 +
 ...ja2_2.11.2.bb => python3-jinja2_2.11.3.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  12 ++
 .../qemu/qemu/CVE-2021-3392.patch             |  92 ++++++++++++++
 .../subversion/CVE-2020-17525.patch           | 117 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 .../logrotate/logrotate_3.15.1.bb             |   3 +
 .../help2man-reproducibility.patch            |  27 ++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   1 +
 .../libnotify/libnotify_0.7.8.bb              |   3 +
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
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   3 +
 meta/recipes-support/db/db_5.3.28.bb          |   2 +-
 26 files changed, 494 insertions(+), 12 deletions(-)
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

