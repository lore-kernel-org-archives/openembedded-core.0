Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5197DC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 02:23:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.36022.1674613402106522938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 18:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PzWXMvoz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id k13so16664118plg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 18:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQBw51toJzEKGmKEYwNkKPhb89gdRixA0+S+aEB37ZM=;
        b=PzWXMvozwY1cjcl8rE7gvh80nJ5vZ2eOQIK76OLlooYG5TfDbkYRN8jnW50jf7r4z6
         tt9cw16e4Kp4xlTiVen3ooxRwbO2oMhl+SFxVH2Cu/J4fqsjletNUkryzyJolxMe7wz/
         SoNNt2KtxXx8viBSDAPZ26Umo7NnHjX+Zj4LsPUHOoPbT3i5FwGPml4TcgjyZZ46Vbc0
         EeUA5z1baPLTsNmEMa6x8gh1k3A8myX0lMbG3ZRIr8iP01XRW2S+GplhAmLSbaTx9Ikw
         Lud7OsYkBgc2KejDt8hf9rPZBQo//yaQsVXsfGoq/EmEF0dBRVEauVOWPtuQQ3qgT9xT
         ua1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQBw51toJzEKGmKEYwNkKPhb89gdRixA0+S+aEB37ZM=;
        b=QsdtffAGeXeDAIO2jPZS67mO4AGKtD3zpLWVtPPU+s95QEZp6m+Q/Sl/YJ4QdxoUai
         6/BkLL8RTw9NxVCsp0/mzpHAmGDZpaF9whFKx7ai3J+GTmIxdvGIWkXfinj8iEBLib1t
         VasgtnuPyJ33p62R1DbmLq+pDuglrSa3uEnIntmLpFnxmLxjx/jiwvMscIn0Fcx/SnA7
         locJVJxWHqsfx07D04rnEW0L9kzLL4obWHH5qxdoRDrHls1HojG+QwRXIBWi2FnJ2Cdy
         iuMzYJ5QN1uVeI+YqwIemVjdXkyuTFE2rxPrIcPRogxo700OP4WYCnWvEPelTNtotBL2
         nkag==
X-Gm-Message-State: AFqh2kr3myqnHpDc5H8xsMLH0KAljoj02fNwjP9Ue83BoPClDzJHFGDw
	M9effF7LhWYfe4CzaKjVEkEtV1f2+bd1EKXVHIA=
X-Google-Smtp-Source: AMrXdXtpowUHvy/IbPPmvBoL7e2a8CX9r7uzkLHxqpjtQcTeRE1NqhJXDf5yGwsowpN2TM6SqD0QPg==
X-Received: by 2002:a05:6a20:7d8e:b0:b8:8060:ce5c with SMTP id v14-20020a056a207d8e00b000b88060ce5cmr40790431pzj.44.1674613400636;
        Tue, 24 Jan 2023 18:23:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm239329pjd.41.2023.01.24.18.23.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 18:23:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/41] Pull request (cover letter only)
Date: Tue, 24 Jan 2023 16:23:13 -1000
Message-Id: <cover.1674613342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 02:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176336

The following changes since commit b2dfb2fe86de887d0239078ded0a4f9e8c677d83:

  devtool: process local files only for the main branch (2023-01-11 06:07:36 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alex Kiernan (1):
  classes: image: Set empty weak default IMAGE_LINGUAS

Alexander Kanavin (5):
  libksba: update 1.6.2 -> 1.6.3
  linux-firmware: upgrade 20221109 -> 20221214
  xwayland: upgrade 22.1.5 -> 22.1.7
  xserver-xorg: upgrade 21.1.4 -> 21.1.6
  selftest/virgl: use pkg-config from the host

Anton Antonov (1):
  rust: Do not use default compiler flags defined in CC crate

Antonin Godard (2):
  busybox: always start do_compile with orig config files
  busybox: rm temporary files if do_compile was interrupted

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bruce Ashfield (7):
  linux-yocto/5.19: fix perf build with clang
  linux-yocto/5.15: ltp and squashfs fixes
  linux-yocto/5.15: fix perf build with clang
  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
  linux-yocto/5.15: update to v5.15.84
  linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy
  linux-yocto/5.19: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy

Carlos Alberto Lopez Perez (1):
  mesa-gl: gallium is required when enabling x11

Charlie Johnston (1):
  opkg: ensure opkg uses private gpg.conf when applying keys.

Chen Qi (2):
  dhcpcd: backport two patches to fix runtime error
  libseccomp: fix typo in DESCRIPTION

Enguerrand de Ribaucourt (1):
  bitbake-layers: fix a typo

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

Khem Raj (1):
  tiff: Add packageconfig knob for webp

Lee Chee Yang (1):
  git: Upgrade to 2.37.4

Markus Volk (1):
  librsvg: enable vapi build

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Michael Halstead (1):
  uninative: Upgrade to 3.8.1 to include libgcc

Petr Kubizňák (1):
  harfbuzz: remove bindir only if it exists

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Robert Joslyn (1):
  curl: Fix CVE-2022-43551 and CVE-2022-43552

Ross Burton (4):
  cve-update-db-native: show IP on failure
  pango: upgrade 1.50.11 -> 1.50.12
  oeqa/selftest/debuginfod: improve testcase
  curl: don't enable debug builds

Sandeep Gundlupet Raju (2):
  kernel-fitimage: Adjust order of dtb/dtbo files
  kernel-fitimage: Allow user to select dtb when multiple dtb exists

Saul Wold (1):
  at: Change when files are copied

leimaohui (1):
  libpng: Enable NEON for aarch64 to enensure consistency with arm32.

 meta/classes-recipe/image.bbclass             |  3 +-
 meta/classes-recipe/kernel-fitimage.bbclass   | 21 ++++-
 meta/classes-recipe/rust-common.bbclass       | 28 ++++--
 .../classes-recipe/rust-target-config.bbclass | 16 ++++
 meta/classes-recipe/toolchain-scripts.bbclass |  2 +-
 meta/classes/cve-check.bbclass                |  6 +-
 meta/conf/distro/include/yocto-uninative.inc  |  8 +-
 meta/lib/bblayers/makesetup.py                |  2 +-
 meta/lib/oe/reproducible.py                   |  3 +-
 meta/lib/oeqa/selftest/cases/debuginfod.py    | 67 ++++++++++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  2 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  2 +
 ...low-getrandom-sysctl-for-newer-glibc.patch | 30 +++++++
 ...sep-Allow-newfstatat-syscall-as-well.patch | 31 +++++++
 meta/recipes-core/busybox/busybox.inc         | 26 ++++--
 .../recipes-core/meta/cve-update-db-native.bb | 88 ++++++++++++++-----
 .../git/{git_2.37.3.bb => git_2.37.4.bb}      |  2 +-
 ...emove-no-options-flag-from-gpg-calls.patch | 34 +++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
 meta/recipes-extended/at/at_3.2.5.bb          |  6 +-
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb  |  2 +
 .../cairo/cairo/CVE-2019-6461.patch           | 46 +++-------
 .../cairo/cairo/CVE-2019-6462.patch           | 46 +++++++---
 .../harfbuzz/harfbuzz_5.1.0.bb                |  6 +-
 meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb  |  4 +-
 ...d-install-nofonts-fonts.conf-as-it-i.patch | 35 --------
 .../{pango_1.50.11.bb => pango_1.50.12.bb}    |  3 +-
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 -------------
 ...ntedString-against-request-length-at.patch | 38 --------
 ...-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} |  4 +-
 ...{xwayland_22.1.5.bb => xwayland_22.1.7.bb} |  2 +-
 ...20221109.bb => linux-firmware_20221214.bb} |  4 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-rt_5.19.bb              |  4 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  4 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 22 ++---
 .../libpng/libpng_1.6.39.bb                   |  4 +-
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 .../curl/curl/CVE-2022-43551.patch            | 32 +++++++
 .../curl/curl/CVE-2022-43552.patch            | 78 ++++++++++++++++
 meta/recipes-support/curl/curl_7.85.0.bb      |  6 +-
 .../libksba/ksba-add-pkgconfig-support.patch  |  6 +-
 .../{libksba_1.6.2.bb => libksba_1.6.3.bb}    |  2 +-
 .../libseccomp/libseccomp_2.5.4.bb            |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 47 files changed, 528 insertions(+), 306 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
 rename meta/recipes-devtools/git/{git_2.37.3.bb => git_2.37.4.bb} (98%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
 rename meta/recipes-graphics/pango/{pango_1.50.11.bb => pango_1.50.12.bb} (90%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} (80%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43551.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (94%)

-- 
2.25.1


