Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.36619.1598811394503760252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VmhP4oWC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id k4so4688656ilr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Mk/0akpJlqrhoHHutE8uivAVkByy36yBPv07yDjsQSY=;
        b=VmhP4oWCOYwkNT/urEyg6oMcWT7U1adW8LEeW2v1n34OZDxA0vxt19eNcMf+oRBLvR
         rudKlxdRVEGYRA2QkFHrBB9XLbIpBNDZx+PrGKJPbK9/Lk3Wn4sjaiEUBg93mUtQn879
         ApWBL3vYdcu3UI0O3KVbIUhIkHgiBJi7LdigPoTnFuGFCk34ckeUs8zobAX8CxYLgxdn
         g+BCyfgK+XZkz7fFev68Nw0HVGvtlIwPC0lK4SicV1HSSEsW9g6JPybetPDLuIfWJnw8
         rJ+hb7sfxb2iDhABp6hgSrcR1yIGknnueUvGZI8+ATWfk106z18rMy3/EaOmZxjOZP5A
         OIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Mk/0akpJlqrhoHHutE8uivAVkByy36yBPv07yDjsQSY=;
        b=Q8kvX3e+gpw8ttmrsp9pA8ejoubEIX06qHmzbFRVC+U27QrMuSw/CIezEmecLEDcKv
         CQ2MZNeRy9SyaD6W9alinVmw0v6ebrucH43JhIlVFiBVJSwqT8cwhvtzLlbA7oaSFyvg
         /0CjvmU5q3Foh2n0gNsiXQdIpSGUT0Gp9bHzdr0xBMxNLI1sEirflG1yoKysLr+cImfo
         XnD0YR07uABZhU1w2Oi3eQXOm/rQX8jXnuBlozabH/Laoe5EgRECB4He2i4DJm+6gNL1
         Hhg7JMew7wXXE8pY7MgE1PbIKxquxcQXfiwp6ach5QXJVbMueu743rqqAPT7yUi+FptP
         ZWUQ==
X-Gm-Message-State: AOAM530bZ8tNefJBkmWsRAqXxhOr5xwGyph3N1stjzzwuLavLv6dQjJ+
	s5JS2/LEbYtrfyVDuiwrKtVdmfDHpBetRomCw40=
X-Google-Smtp-Source: ABdhPJxTi4AQftMtauIXIw3+RTugQ2qzalfWdcDsBH43X+fPqUFm1cgX0GGgiq7/sx8kX0zlGuO4+g==
X-Received: by 2002:a92:d386:: with SMTP id o6mr6372512ilo.292.1598811393232;
        Sun, 30 Aug 2020 11:16:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.16.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:16:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Patch review
Date: Sun, 30 Aug 2020 08:15:54 -1000
Message-Id: <cover.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1320

The following changes since commit bec0a45393d968251059f5075add2cf633aecd1a:

  runqemu: Check gtk or sdl option is passed together with gl or gl-es options. (2020-08-19 04:11:14 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  linux-firmware: upgrade 20200619 -> 20200721
  linux-firmware: update 20200721 -> 20200817

Armin Kuster (1):
  bind: update to 9.11.22 ESV

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.59
  linux-yocto/5.4: update to v5.4.60
  linux-yocto/5.4: update to v5.4.61
  kernel-yocto: checksum all modifications to available kernel fragments
    directories

Changqing Li (1):
  gpgme: fix multilib header conflict

Guillaume Champagne (1):
  weston: add missing packageconfigs

Joshua Watt (1):
  oeqa: runtime_tests: Extra GPG debugging

Mark Hatle (2):
  package_tar.bbclass: Sync to the other package_* classes
  package.bbclass: Sort shlib2 output for hash equivalency

Martin Jansa (2):
  devtool: expand SRC_URI when guessing recipe update mode
  perf: backport a fix for confusing non-fatal error

Ming Liu (4):
  conf/machine: set UBOOT_MACHINE for qemumips and qemumips64
  multilib.conf: add u-boot to NON_MULTILIB_RECIPES
  libubootenv: uprev to v0.3
  libubootenv: inherit uboot-config

Peter A. Bigot (1):
  bluez5: fix builds that require ell support

Rasmus Villemoes (1):
  kernel.bbclass: run do_symlink_kernsrc before do_patch

Richard Purdie (1):
  runqemu: Show an error for conflicting graphics options

Ross Burton (1):
  package.bbclass: explode the RPROVIDES so we don't think the versions
    are provides

TeohJayShen (2):
  oeqa/manual/bsp-hw.json : remove shutdown_system test
  oeqa/manual/bsp-hw.json : remove
    X_server_can_start_up_with_runlevel_5_boot test

Vijai Kumar K (1):
  image_types_wic: Add ASSUME_PROVIDED to WICVARS

 meta/classes/image_types_wic.bbclass          |  3 +-
 meta/classes/kernel-yocto.bbclass             | 16 +++++++
 meta/classes/kernel.bbclass                   |  2 +-
 meta/classes/nopackages.bbclass               |  1 +
 meta/classes/package.bbclass                  |  4 +-
 meta/classes/package_tar.bbclass              |  6 +--
 meta/conf/machine/qemumips.conf               |  2 +
 meta/conf/machine/qemumips64.conf             |  2 +
 meta/conf/multilib.conf                       |  2 +-
 meta/lib/oeqa/manual/bsp-hw.json              | 44 -------------------
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
 ...{libubootenv_0.2.bb => libubootenv_0.3.bb} |  9 ++--
 .../bind/{bind_9.11.21.bb => bind_9.11.22.bb} |  2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  4 +-
 meta/recipes-graphics/wayland/weston_8.0.0.bb | 20 ++++++++-
 ...20200619.bb => linux-firmware_20200817.bb} |  4 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++-----
 meta/recipes-kernel/perf/perf.bb              |  4 ++
 meta/recipes-support/gpgme/gpgme_1.13.1.bb    |  6 ++-
 scripts/lib/devtool/standard.py               |  2 +-
 scripts/runqemu                               |  4 ++
 23 files changed, 91 insertions(+), 84 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (78%)
 rename meta/recipes-connectivity/bind/{bind_9.11.21.bb => bind_9.11.22.bb} (98%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200619.bb => linux-firmware_20200817.bb} (99%)

-- 
2.17.1

