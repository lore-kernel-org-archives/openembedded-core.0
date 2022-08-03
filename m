Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37E7C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:19:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.9082.1659536365260280649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iZ+CexEQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id ha11so16911499pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQseSRI9pE6rEXnpwZ7aNpcuePRNuKkqRBrmZa7XuEs=;
        b=iZ+CexEQ2dJ3wI5qurQQ8crgLm64m92Rah/TmWt8QfIFLtrc1Gnwvi7Oods8SAhZfO
         Iki/bTFF4310S2kEvkVx5dx49dbD6rXqV1OWcsmIIbFOGVkuWhW5s2b0Av4IbT1ykD08
         NO9GQOZNbUxpSIlL8wkl5/9xZgGACbwZNoXr0btyxTktMslFdF/swvtoFwidx2+MrgOJ
         DLVpMc3dNl3EhSze8hsHmKwYgE0sCl23v20iiI1+0Wkn3UrBypcxrt61OvInzJl2pbv/
         G+vaZq+4DLrWBIz+jfH1yeO9dLzcLBlQnR+PwbgkFaQF1Au9g9Lpp1bSXPNph4BRU4Ph
         y2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQseSRI9pE6rEXnpwZ7aNpcuePRNuKkqRBrmZa7XuEs=;
        b=KHhPPYRBiGyKNtn9NiutZXbfxjsdgGHLnr8UBrB7aEnzqHr58ui2ImMlSJk6TO8sCt
         ODx1lW2UlRpf1Ohb60QU7GOt3OhPCsWVnqp9ihG8dPMBA+PqJugWg8UCsZInom2lu4CS
         ktPit5ZgV/Z25M20K5MH7tbyUawhDjGbjtvY39F8DQTHz2visKT54GYimYcXl7XUbfWe
         rtueYCbrxOtGChh6xhy6dA/LfzYCYvf0HpGyXA9oZgaw9XEcVpusHaxDks51GmIZUT6+
         FEe+erhEsw4q8cqY0cy3BO9GdTUxRCOjSAtqFnxXAxrzWbrlpE7I5yPzxroHgh5sUKdE
         7McA==
X-Gm-Message-State: ACgBeo2c7wnOajE2oDlCu7ToX9SQRhOPT/lmhA4BFlcmWebVGYrn6Mdd
	Dz7oljpXUjtR62sdYFS9ch7ESjAAPdzCxWdh
X-Google-Smtp-Source: 
 AA6agR7sBxM30xdMWr3GdV6L3Fkbn3skmx0WNmqHAC8efEqiIiRKgRAyWge+Fygg3TVhZWLF7JyPqQ==
X-Received: by 2002:a17:90a:9907:b0:1f5:2318:ea6d with SMTP id
 b7-20020a17090a990700b001f52318ea6dmr5232773pjp.163.1659536363870;
        Wed, 03 Aug 2022 07:19:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902ce8900b0016f1c1f50f4sm952891plg.235.2022.08.03.07.19.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 07:19:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/29] Pull request (cover letter only)
Date: Wed,  3 Aug 2022 04:19:10 -1000
Message-Id: <cover.1659536254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 14:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168817

The following changes since commit 2bc86c029fb82ae572f6a89407ccfe332972568c:

  gcc-runtime: Pass -nostartfiles when building dummy libstdc++.so (2022-07-26 05:34:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  bind: Remove legacy python3 PACKAGECONFIG code

Alexander Kanavin (14):
  xev: update 1.2.4 -> 1.2.5
  xmodmap: update 1.0.10 -> 1.0.11
  xf86-input-synaptics: update 1.9.1 -> 1.9.2
  encodings: update 1.0.5 -> 1.0.6
  font-util: update 1.3.2 -> 1.3.3
  xserver-xorg: update 21.1.3 -> 21.1.4
  linux-firmware: update 20220610 -> 20220708
  libuv: upgrade 1.44.1 -> 1.44.2
  log4cplus: upgrade 2.0.7 -> 2.0.8
  vala: upgrade 0.56.0 -> 0.56.1
  vala: upgrade 0.56.1 -> 0.56.2
  webkitgtk: upgrade 2.36.3 -> 2.36.4
  xwayland: upgrade 22.1.2 -> 22.1.3
  epiphany: upgrade 42.2 -> 42.3

Hitendra Prajapati (2):
  qemu: CVE-2022-35414 can perform an uninitialized read on the
    translate_fail path, leading to an io_readx or io_writex crash
  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections

Mihai Lindner (1):
  wic/plugins/rootfs: Fix NameError for 'orig_path'

Ming Liu (1):
  udev-extraconf:mount.sh: fix a umount issue

Richard Purdie (3):
  xorg-app: Tweak handling of compression changes in SRC_URI
  xwayland: upgrade 22.1.1 -> 22.1.2
  base/reproducible: Change Source Date Epoch generation methods

Ross Burton (2):
  oeqa/runtime: add test that the kernel has CONFIG_PREEMPT_RT enabled
  perf: fix reproduciblity in older releases of Linux

Shruthi Ravichandran (1):
  initscripts: run umountnfs as a KILL script

gr embeter (1):
  efivar: fix import functionality

leimaohui (1):
  systemd: Added base_bindir into pkg_postinst:udev-hwdb.

wangmy (2):
  mkfontscale: upgrade 1.2.1 -> 1.2.2
  xdpyinfo: upgrade 1.3.2 -> 1.3.3

 meta/classes/base.bbclass                     |   1 +
 meta/lib/oe/reproducible.py                   |   1 -
 meta/lib/oeqa/runtime/cases/rt.py             |  17 ++
 .../0001-Fix-invalid-free-in-main.patch       |  30 ++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   1 +
 meta/recipes-connectivity/bind/bind_9.18.4.bb |  13 --
 .../{libuv_1.44.1.bb => libuv_1.44.2.bb}      |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +-
 .../recipes-core/udev/udev-extraconf/mount.sh |   2 +-
 ...{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-35414.patch            |  53 ++++++
 meta/recipes-devtools/vala/vala_0.56.0.bb     |   3 -
 meta/recipes-devtools/vala/vala_0.56.2.bb     |   3 +
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 ++++++++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |   4 +-
 .../{epiphany_42.2.bb => epiphany_42.3.bb}    |   2 +-
 ...ontscale_1.2.1.bb => mkfontscale_1.2.2.bb} |   4 +-
 .../{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb}  |   4 +-
 .../xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb}   |   4 +-
 .../{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb}  |   5 +-
 .../xorg-app/xorg-app-common.inc              |   3 +-
 .../recipes-graphics/xorg-app/xrandr_1.5.1.bb |   3 +-
 .../64bit_time_t_support.patch                |  51 ------
 ...1.9.1.bb => xf86-input-synaptics_1.9.2.bb} |   7 +-
 .../xorg-font/encodings/nocompiler.patch      |   8 +-
 ...{encodings_1.0.5.bb => encodings_1.0.6.bb} |   6 +-
 ...{font-util_1.3.2.bb => font-util_1.3.3.bb} |   5 +-
 .../xorg-font/xorg-font-common.inc            |   3 +-
 .../0001-render-Fix-build-with-gcc-12.patch   |  90 ----------
 ...-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} |   7 +-
 ...{xwayland_22.1.1.bb => xwayland_22.1.3.bb} |   2 +-
 ...20220610.bb => linux-firmware_20220708.bb} |  13 +-
 meta/recipes-kernel/perf/perf.bb              |   3 +
 ...ebkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} |   2 +-
 scripts/lib/wic/plugins/source/rootfs.py      |   2 +-
 37 files changed, 309 insertions(+), 207 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/rt.py
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
 rename meta/recipes-connectivity/libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb} (93%)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} (90%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
 rename meta/recipes-gnome/epiphany/{epiphany_42.2.bb => epiphany_42.3.bb} (94%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb} (82%)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb} (78%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.1.bb => xf86-input-synaptics_1.9.2.bb} (74%)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.5.bb => encodings_1.0.6.bb} (78%)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb} (84%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} (79%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.1.bb => xwayland_22.1.3.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220610.bb => linux-firmware_20220708.bb} (98%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} (98%)

-- 
2.25.1


