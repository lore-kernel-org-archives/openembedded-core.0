Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.5326.1597192743196703513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 17:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GNSi13BK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id e4so279712pjd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 17:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvffaSy8svcH1+vhmPjYIy9g+xFgQ7M5on7oODLAnvc=;
        b=GNSi13BKyM25QxPL7wxUNQBviDrETmnKjWnDhh7yd/qcYyYypOluoDfXnODIOObuwU
         MRsR0jJHq900aaiVXcnXx3gTcQHbtTpPKZ+LF0c8ca7ACbRnulQS4K8eBKZOTG88Q5Hx
         CMel4YejMrfSTIbgT0HfPeDi3vEZUsIrjPm+BsD1QfqkPo4SKUE3+fPiSVc4tG9JLNxk
         L5yN+kZrLeswD8HqMh1mxWtmX1uNIercYIjMMs94AodFLmy7kfePa1fTJQMsu6tY60Es
         lbuZzA+Eudvfxl1x24IzrT4eOQ0pp9m9gvnZNrt8KQ+oGSfM6G+8mrvIBhas7ID4w61r
         XG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VvffaSy8svcH1+vhmPjYIy9g+xFgQ7M5on7oODLAnvc=;
        b=LVnF0Sv+WBpH3JbljuOSsDu6kHYIYVzdYO/3uG5Uik7EV0O3DBjn6R51g+zbwlq1UK
         WLoAGcAyzfz+/+5BqTDJ9wvOli9dSA3wfL/GHedQ/HJTCL8omm4yfj0WUSezl+A6DTjM
         12s9WAdOk9k82O8yryeAWoNKkzfN+W987eDwhOzd8U7bpb6j4QvMU8+bR383ZaPCSlCK
         UhQHYAR976B2ZcoHouelDsbxjdklU3nXLwg9WDjEGk+P1kXxLGFz28tJBVZY7tOCPvyF
         miZ5CWCYjzhqv7cajCBHEiaa0L03j7v3VywtIS47tSmejLcbHK20ZhDycWvTB+RXDGsr
         mNYw==
X-Gm-Message-State: AOAM530tTjCcg6JJUGSztH5mtdKQLAi1b3SsjOxgMLpJhquRrrLJvtl+
	bD7WP0KGSlPD4fXSk+rZc+pSEvdR+Snbcw==
X-Google-Smtp-Source: ABdhPJwkofyBbv94ugOZAF0SZa/s6Da+D8Cy4LoIuMA3uhnFPQ3rzriPZnHIm8dktff//sYJuG5oEQ==
X-Received: by 2002:a17:90b:1890:: with SMTP id mn16mr3564158pjb.230.1597192742002;
        Tue, 11 Aug 2020 17:39:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c2sm313595pgb.52.2020.08.11.17.39.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 17:39:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Pull request (cover letter only)
Date: Tue, 11 Aug 2020 14:38:47 -1000
Message-Id: <cover.1597192564.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 257758f175cdcb99f4fe890cc0b1a60e82b5b84b:

  Revert "gtk-icon-cache.bbclass: add runtime dependency" (2020-08-05 04:27:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (3):
  libexif: update to 0.6.22
  testimage: add an overall timeout setting
  oeqa: write @OETestTag content into json test reports for each case

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.53
  linux-yocto/5.4: fix perf build with binutils 2.35
  linux-yocto/5.4: update to v5.4.54

Chen Qi (1):
  grub: set CVE_PRODUCT to grub2

Daniel Gomez (1):
  allarch: Add missing allarch ttf-bitstream-vera

Khem Raj (1):
  qemumips: Use 34Kf CPU emulation

Lee Chee Yang (4):
  ghostscript: fix CVE-2020-15900
  qemu: fix CVE-2020-15863
  libjpeg-turbo: fix CVE-2020-13790
  webkitgtk: fix CVE-2020-13753

Matthew (1):
  ltp: make copyFrom scp command non-fatal

Richard Purdie (1):
  uninative: Handle PREMIRRORS generically

Steve Sakoman (2):
  glib-2.0: update 2.62.4 to 2.62.5
  glib-2.0: update 2.62.5 to 2.62.6

Tyler Hicks (1):
  kernel-devicetree: Fix intermittent build failures caused by DTB
    builds

zhengruoqin (1):
  ruby: upgrade 2.7.0 -> 2.7.1

 meta/classes/kernel-devicetree.bbclass        |   2 +-
 meta/classes/testimage.bbclass                |  11 ++
 meta/classes/uninative.bbclass                |  13 +-
 meta/conf/layer.conf                          |   1 +
 meta/conf/machine/qemumips.conf               |   2 +
 meta/lib/oeqa/core/runner.py                  |  14 +++
 meta/lib/oeqa/core/target/ssh.py              |   7 +-
 meta/lib/oeqa/runtime/cases/ltp.py            |   5 +-
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 ...t-write-bindir-into-pkg-config-files.patch |   2 +-
 ...-GSource-iterator-if-iteration-can-m.patch |  43 -------
 ...-memory-leaks-and-memory-corruption-.patch | 109 -----------------
 ...e-mutex-unlocking-in-destructor-righ.patch |  36 ------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   4 +-
 ...{glib-2.0_2.62.4.bb => glib-2.0_2.62.6.bb} |   7 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-15863.patch            |  63 ++++++++++
 .../ruby/{ruby_2.7.0.bb => ruby_2.7.1.bb}     |   4 +-
 .../ghostscript/CVE-2020-15900.patch          |  54 ++++++++
 .../ghostscript/ghostscript_9.50.bb           |   1 +
 .../jpeg/files/CVE-2020-13790.patch           |  76 ++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   1 +
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb      |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 .../webkit/webkitgtk/CVE-2020-13753.patch     |  15 +++
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb  |   1 +
 .../libexif/libexif/CVE-2016-6328.patch       |  64 ----------
 .../libexif/libexif/CVE-2017-7544.patch       |  40 ------
 .../libexif/libexif/CVE-2018-20030.patch      | 115 ------------------
 .../recipes-support/libexif/libexif_0.6.21.bb |  19 ---
 .../recipes-support/libexif/libexif_0.6.22.bb |  19 +++
 33 files changed, 305 insertions(+), 464 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.4.bb => glib-2.0_2.62.6.bb} (83%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.0.bb => ruby_2.7.1.bb} (95%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2020-13790.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2016-6328.patch
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2017-7544.patch
 delete mode 100644 meta/recipes-support/libexif/libexif/CVE-2018-20030.patch
 delete mode 100644 meta/recipes-support/libexif/libexif_0.6.21.bb
 create mode 100644 meta/recipes-support/libexif/libexif_0.6.22.bb

-- 
2.17.1

