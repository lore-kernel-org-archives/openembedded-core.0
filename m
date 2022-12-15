Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3987C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:13 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.142640.1671132063592833640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JvTN2Tsd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3742210pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qcrJzO6b4bR+i/IX/j4YdAujJuxeAyzGLmPC1npeltc=;
        b=JvTN2TsdulLxl5dv2/QzGJ1f38jQTYIrh5Uqjo6wsecYPTr92npGqhlDOHfgIvXEia
         SxXJqAOGI48LmQ/dqBB/NfS32zdmuSnVmEmWFClqzJVzY0sPznjUd6BCzDvTpf6sBtQb
         WJtQq/EfwB+u9b36a2KrITDqWZ5DebnVa9Cr/kUGcop+F+mqQq9ilR9vbsum+YXs1MdQ
         PQxfk+FzPJz275m5fts6ZyEILyS21VF1TVS6Q1y8mWQoCz28zy5X5UQfMxEMa6xFjPe6
         IERUPbFWORddy94n3FJk1ahqSPxzYPkYDbokk9G8WX3iL8BNVXFiaoSFrNROmGpafqik
         k/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcrJzO6b4bR+i/IX/j4YdAujJuxeAyzGLmPC1npeltc=;
        b=rBc0P4l9koVTb7JiuCHqUjqP/PR3WPO0khPEQKYwCRZiJHFyNAk6aI/hrNT1uV0Olk
         fcSCRttbJe5NRuzh9e4aUavxeYtOgpq+enRTMUEbBQDQ7js0SJN1kJowsGnBFT8aZv9B
         TPq5iBgq63/DHNlRdcwwtOWUTgjNkkem1MgdAmrc1i/B1cBoMgf4JCA6GuVScYq/uqLq
         8k0Um7bQrXAmEoj/UumV4hkBcz5wTWsfxFo08kKIBhpK5k5H6IrtB3yS5YdMdfSLbG4g
         9bk8cgDSzLwZBICKjPiJE+28/xTIZeKo18kuwIZn7XX20h53DV09f5VaDF5xTTr2dXPd
         /mAg==
X-Gm-Message-State: ANoB5pmQStTBznjLFF+LMrdBEe4eMBftfppve3U17XvlMkvCXuojxIBa
	RZhkynYcQ0dSZztr5teWITg5sVDwyHhzXArTcmY=
X-Google-Smtp-Source: AA0mqf7uJ9aOsClNpkpB4Ibp7pMIYl+m6UFiHA1oBgavvpp9kYs+xqq1telfwqZLRpeVbH73gCv74g==
X-Received: by 2002:a17:902:be04:b0:186:8238:bc9 with SMTP id r4-20020a170902be0400b0018682380bc9mr28373595pls.2.1671132062014;
        Thu, 15 Dec 2022 11:21:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/30] Patch review
Date: Thu, 15 Dec 2022 09:20:24 -1000
Message-Id: <cover.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174592

Please review this set of patches for langdale and have comments back
by end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4632

except for a known autobuilder intermittent issue on qemuarm64-ltp:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14857

which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/4128


The following changes since commit 5a622a9171da941c705aedc88d487d7158955a8f:

  mirrors.bbclass: update CPAN_MIRROR (2022-11-30 11:10:48 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alex Stewart (1):
  lsof: add update-alternatives logic

Alexander Kanavin (1):
  glibc-tests: correctly pull in the actual tests when installing -ptest
    package

Alexey Smirnov (1):
  classes: make TOOLCHAIN more permissive for kernel

Carlos Alberto Lopez Perez (1):
  xwayland: libxshmfence is needed when dri3 is enabled

Chen Qi (3):
  psplash: consider the situation of psplash not exist for systemd
  bc: extend to nativesdk
  rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work

Harald Seiler (1):
  opkg: Set correct info_dir and status_file in opkg.conf

Hitendra Prajapati (1):
  libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c

Joshua Watt (1):
  scripts: convert-overrides: Allow command-line customizations

Mathieu Dubois-Briand (1):
  dbus: Add missing CVE product name

Ola x Nilsson (1):
  kbd: Don't build tests

Ovidiu Panait (1):
  kernel.bbclass: remove empty module directories to prevent QA issues

Peter Marko (2):
  externalsrc: fix lookup for .gitmodules
  oeqa/selftest/externalsrc: add test for srctree_hash_files

Qiu, Zheng (2):
  vim: upgrade 9.0.0820 -> 9.0.0947
  valgrind: remove most hidden tests for arm64

Richard Purdie (3):
  oeqa/selftest/tinfoil: Add test for separate config_data with
    recipe_parse_file()
  qemu: Ensure libpng dependency is deterministic
  yocto-check-layer: Allow OE-Core to be tested

Ross Burton (4):
  lib/buildstats: fix parsing of trees with reduced_proc_pressure
    directories
  combo-layer: remove unused import
  combo-layer: dont use bb.utils.rename
  combo-layer: add sync-revs command

Ryan Eatmon (1):
  go: Update reproducibility patch to fix panic errors

Sandeep Gundlupet Raju (1):
  libdrm: Remove libdrm-kms package

Wang Mingyu (3):
  bind: upgrade 9.18.8 -> 9.18.9
  libxcrypt-compat: upgrade 4.4.30 -> 4.4.33
  mpfr: upgrade 4.1.0 -> 4.1.1

Xiangyu Chen (1):
  grub: backport patches to fix CVE-2022-28736

 meta/classes-recipe/kernel-arch.bbclass       |   2 +-
 meta/classes-recipe/kernel.bbclass            |   4 +-
 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/rm_work.bbclass                  |   2 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |  44 ++++
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  14 ++
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++++++
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 +++++++++++++
 ...hainloader-Simplify-the-loader-state.patch | 129 ++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.8 => bind-9.18.9}/bind9   |   0
 .../{bind-9.18.8 => bind-9.18.9}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.8.bb => bind_9.18.9.bb}   |   2 +-
 meta/recipes-core/dbus/dbus_1.14.0.bb         |   2 +
 meta/recipes-core/glibc/glibc-tests_2.36.bb   |   2 +-
 meta/recipes-core/kbd/kbd_2.5.1.bb            |   1 +
 ...t_4.4.30.bb => libxcrypt-compat_4.4.33.bb} |   0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 +-
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   1 +
 ...ent-based-hash-generation-less-pedan.patch |  30 +--
 meta/recipes-devtools/opkg/opkg_0.6.0.bb      |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
 meta/recipes-extended/bc/bc_1.07.1.bb         |   2 +-
 .../libarchive/CVE-2022-36227.patch           |  42 ++++
 .../libarchive/libarchive_3.6.1.bb            |   3 +-
 meta/recipes-extended/lsof/lsof_4.95.0.bb     |   9 +
 meta/recipes-graphics/drm/libdrm_2.4.113.bb   |   3 +-
 .../xwayland/xwayland_22.1.5.bb               |   2 +-
 .../mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb}     |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/combo-layer                           |  30 ++-
 scripts/contrib/convert-overrides.py          | 103 ++++----
 scripts/lib/buildstats.py                     |   4 +-
 scripts/lib/checklayer/__init__.py            |  11 +-
 scripts/lib/checklayer/cases/bsp.py           |   2 +-
 scripts/lib/checklayer/cases/common.py        |   3 +
 scripts/lib/checklayer/cases/distro.py        |   2 +-
 scripts/yocto-check-layer                     |   5 +-
 47 files changed, 637 insertions(+), 317 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/externalsrc.py
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.8.bb => bind_9.18.9.bb} (97%)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 rename meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} (91%)

-- 
2.25.1


