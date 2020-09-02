Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9150.1599058068387607344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G42Np8MK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id u20so2983795pfn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Ikk1RAYBDaYVaJOgEAOoh/TUaHfbdDChNIVKhcfNpkc=;
        b=G42Np8MKoxJ2WgcP1z48I9ndTlo8rIg7QUUloj/Mz7zutlojHAK6R2J4//MBi3FYuS
         fYgwMv429cNBd2QjjpkVedhgyzwGrNiJbOD2DVAZaaHjFV69poC4AD4pMRpyWHvk7uMG
         GTNkk/hEnE8aUCFzeeS1VATbNqM+v7VysPUy6r+JQSF8B2GXb1qbHfR13bmlx9v75J4m
         0tFHyMMyDrw0phnfBEl/VJiMh80tmviiuAs51DIzr7gjkNJ0t2vSGA67i+utlTxEIfHA
         phbA0kHgC29PWg4k5Z9KwoM9hRXCYLunwM+BU0PsptHKx/+fZZwir31rwT/wr/7PKKsm
         sHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Ikk1RAYBDaYVaJOgEAOoh/TUaHfbdDChNIVKhcfNpkc=;
        b=dgUCEephyW5g+2YdQU6nvfwrpjbmpGQWaNl5L5DaxkOEbNccfhwgygEI7qGXDZDB+O
         lVND5ZrxwZ6EolE+gA41YYHTaek6w6fvqDIzYflX6HbEiVdm58k401ycPJI6pF/ww52w
         cElH1AwVgysbDW2uIs9vV7ufPSesqkrOOuhiJmZ3NFBOrcLXJUmgYds/rSABnwGd6lLG
         aoPOnXeDylt7o91fgboN3wYtc2Ixdoj4fzj1T2NUBVS3NL6tvsrOHO3FsKVyhITzoNPS
         z6rNV8ubWMTCL4Iuz36A//NmvtG6dR61nuDO06yUWhYoqbpd3wa4fmNOq6kSkQFRclVQ
         X75g==
X-Gm-Message-State: AOAM5322Y/yJuL05BRjS+ecysfGRuYKjkxFedYB67ipnADvI8YWeDCQ1
	A6A8Ey61sHVpavNa9C26xqWOwrptT2I/8FNXOKU=
X-Google-Smtp-Source: ABdhPJxuCxvaEE5uuYc93+kzkN8HJVNLaYWiteHpXjBBQjrgQaIPrDZB8NhwNWf7M8MbE7awkwtyTQ==
X-Received: by 2002:a62:fccf:: with SMTP id e198mr3483602pfh.183.1599058067052;
        Wed, 02 Sep 2020 07:47:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u63sm5709246pfu.34.2020.09.02.07.47.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:47:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/22] Pull request (cover letter only)
Date: Wed,  2 Sep 2020 04:47:35 -1000
Message-Id: <cover.1599057947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit bec0a45393d968251059f5075add2cf633aecd1a:

  runqemu: Check gtk or sdl option is passed together with gl or gl-es options. (2020-08-19 04:11:14 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  linux-firmware: upgrade 20200619 -> 20200721
  linux-firmware: update 20200721 -> 20200817

Armin Kuster (1):
  bind: update to 9.11.22 ESV

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.59
  linux-yocto/5.4: update to v5.4.60
  linux-yocto/5.4: update to v5.4.61

Changqing Li (1):
  gpgme: fix multilib header conflict

Guillaume Champagne (1):
  weston: add missing packageconfigs

Joshua Watt (1):
  oeqa: runtime_tests: Extra GPG debugging

Mark Hatle (2):
  package_tar.bbclass: Sync to the other package_* classes
  package.bbclass: Sort shlib2 output for hash equivalency

Martin Jansa (1):
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

TeohJayShen (2):
  oeqa/manual/bsp-hw.json : remove shutdown_system test
  oeqa/manual/bsp-hw.json : remove
    X_server_can_start_up_with_runlevel_5_boot test

Vijai Kumar K (1):
  image_types_wic: Add ASSUME_PROVIDED to WICVARS

 meta/classes/image_types_wic.bbclass          |  3 +-
 meta/classes/kernel.bbclass                   |  2 +-
 meta/classes/nopackages.bbclass               |  1 +
 meta/classes/package.bbclass                  |  2 +-
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
 scripts/runqemu                               |  4 ++
 21 files changed, 73 insertions(+), 82 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.2.bb => libubootenv_0.3.bb} (78%)
 rename meta/recipes-connectivity/bind/{bind_9.11.21.bb => bind_9.11.22.bb} (98%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200619.bb => linux-firmware_20200817.bb} (99%)

-- 
2.17.1

