Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.37286.1597028380118887272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ycqU3EoQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id j21so4091708pgi.9
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PH6bF6R8zYHK6rH8toAHU4Mtb2DTAQa0LKlhMzNkKB0=;
        b=ycqU3EoQB0UN/EYmGIWejT1FNk6DAwX5yHmKW3F4J6V7awX9BynJM+7T+c8FTlWoWd
         bx+QxfzJ0jPEkOflyQQtjQ1ER4QmE5ZHIzR7xKuV4azWYyghhnkHLHO+WBf3dqMNihtn
         cpeB+w604cD54HE8LrGhmNwOxlJ7JqXqk6vOD/HXyADF1PpIqD53NxKZuAhutrN4olNH
         u3Ky9BIKCwDiH0GnEZTu7XHBVaeH/eIzsUmXp5ETwLW7vd42yHLarAlSSKR/zwnovmkS
         OgS6/xhkSJ/O0fwDB6/c9Gj9IfVprQqFfd+YDFENZrlGWyvPwrJX6zzxAB465abHi85S
         A8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PH6bF6R8zYHK6rH8toAHU4Mtb2DTAQa0LKlhMzNkKB0=;
        b=qaLx7P8iRQ85NUscYxIuTkT61cqu9/P+udNVJugMLlY7W4AZ6SuSHlhGAROwA4FjgF
         BiPxXdYiGFJHmGK+Et7pClOhPQKPOtOWkrqPgIIAy/EjvIcUoP5uKnyYjDznCnIX+w2R
         pKgQ2uLbTKe9qRERyXAIzREeCYrb3dDaIg0o+FzMplLNexULmnp7HCBsoCIMujUwm/nK
         yrPj7IVgn+7GmMVuGegd8guzmJ+qWH3N1xNCy3e6XcKbehVeJilMxSfyYI/h1iCNNO3d
         t9P23aW5UwfSvpS3drjEU0aXgb6g/8/jyNJ+tlN6iDfSEVzqVkaNVQoLheD9jTl5VdC9
         81/g==
X-Gm-Message-State: AOAM530/fZ+9kcwQhS6lLADTnZToRIRWkWNEtC/HS/2+FE+ObDtelIMZ
	ZNcpdIBxaP5JMQRX/x+5qLIqF3fpd1y6gw==
X-Google-Smtp-Source: ABdhPJw+KWsSCGGvAve705V2gAwHu2Sb0Nzv03xDwUKBVXHU1FiU5kzlaXWl4IQQ1GKj0ESfl9S1ow==
X-Received: by 2002:a63:5a41:: with SMTP id k1mr19889776pgm.346.1597028378826;
        Sun, 09 Aug 2020 19:59:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Patch review
Date: Sun,  9 Aug 2020 16:59:06 -1000
Message-Id: <cover.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1244

The following changes since commit 257758f175cdcb99f4fe890cc0b1a60e82b5b84b:

  Revert "gtk-icon-cache.bbclass: add runtime dependency" (2020-08-05 04:27:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

