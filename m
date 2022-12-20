Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5FEC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 14:30:43 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.51319.1671546642174696506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 06:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oOTWp4E1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u5so12563506pjy.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yR4Uvj2ezMKvIcDWjBzoVCvgbA7IgU5y/wHRy/rwTg=;
        b=oOTWp4E1FrFHkEuNdfV60fsD4AgTwX1g6Ep89paXXG22pDCTAaRLrgHeslkBWRnxD4
         jxzAR2fZlM54ASymbIuUWPk/baF/D6BxWyYB5qpNhKIEXrLRe4mpCFkksnJbb7onzmua
         0eAy7IpJswLYRGje750sN1EbcjA7xYbZ8cL2jij1q+WZMfaqo3Lm/jRySOh/2iIDvr4U
         LplmrwHh48P3qj2XXicZCYuo19uzNAmCJEG9/JqjYDjKJvZtVFVZdKLXE8Us2zi6oME4
         Gz19M0ejWTezev1cc6DSSN+JpZ/4NECUiHhIjCt36nfurdqt4i21jnNJuTLkYOwdPvDJ
         rvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yR4Uvj2ezMKvIcDWjBzoVCvgbA7IgU5y/wHRy/rwTg=;
        b=WyvuANA4VL/rfoizgixDohgPV5Q0i++SuN5DnSD5OM/KLubcH/5zZTdzzHmlvaShdl
         XmJhR/H761JKj9HvlFbhl6b6z1KCvmSg5GsJbQ3YdyGIS+W4PIbOcQmLKPIZttdm9Bw1
         2ttfji+yFp6rMLlqrbt9FIFrmRZsuhRJ7YfpcDVUY/7LLLaA5O7a54WBAWIIP+PwxWV9
         9UkM7wBvTfWNnJrRF8fIdJ5Xk7pabSKvm+flrC7eU6KY3SZTRPGv5/w2Pl3y73jDLcV/
         ijYgQeNvCIqP5Gz2z/goGfODMpPVjiZpk8t5IcHn4Rh0skeyrTNxxVhlBwoEil4LN1HJ
         cebw==
X-Gm-Message-State: AFqh2kqsJwJvrBiHVkxMqMjqgT0KbVFkltdHyqn/4diDs0IWmeKtUQCn
	36RuqwByGhwK/6YZqPEyHGgkDbanyHCpVGAzaZs=
X-Google-Smtp-Source: AMrXdXsKMzcLKkfyE2fmtoGbl3rjXQRNmhtqg2K6FSfhIoSR6hFr4Dmh5PStLigtemaupflzjN7i6g==
X-Received: by 2002:a17:90b:2749:b0:223:a079:7354 with SMTP id qi9-20020a17090b274900b00223a0797354mr14393609pjb.15.1671546640766;
        Tue, 20 Dec 2022 06:30:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a760800b00218abadb6a8sm880064pjk.49.2022.12.20.06.30.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 06:30:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/30] Pull request (cover letter only)
Date: Tue, 20 Dec 2022 04:30:30 -1000
Message-Id: <cover.1671546565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 14:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174854

The following changes since commit 5a622a9171da941c705aedc88d487d7158955a8f:

  mirrors.bbclass: update CPAN_MIRROR (2022-11-30 11:10:48 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

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


