Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B4CC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 23:53:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.2787.1653004395478575641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 16:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wO7KzbR9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id z3so4864063pgn.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ulx+6PMVIwKUty9yT0gPMk/KPQbXhHsy9y4QZkqToBw=;
        b=wO7KzbR9Jr7quCcj7/7QUYArMCpCOTHPQem77njcQYnDCUtUjtVgvACXmCAK9Q4Rob
         zxxFEwXnUlxpqJdsh59wtq+oQ9VxmIC9Vhd7mfUl3w63Dn4tIFbYp7pTTg0511p2CdD5
         dBPsnwuokhgi0gr7hzxTPUzwvz3UYCvVUGoeFoDDGxKRpf7f8NhLDiTO/bVcECHD+Te7
         N6Gck0+E3T6qmwWDzWmXVBw3VNCwospF3W33ijqfV2yYCFez/qKePIT1gvneGOKhJxxD
         GUUcUJxO5Tmd0nq97wq+rS72+OD5UtMWtH6/PXemDTjsjdQP5SXC1BbHvEF4DIzimLBy
         hdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ulx+6PMVIwKUty9yT0gPMk/KPQbXhHsy9y4QZkqToBw=;
        b=Sdaun8AeoqkKcw+YKTI6F8Zs2w8AM2KcufJEh/RWHcvuIj867JLv8AloJ0CnX4B8AJ
         U8bqtALM3QlYVmI0u0xI4JDZjTZH/GkJwE0fYO0ORu01WfiVu3A4qoI29p8gB1PPFZ0C
         ztiAT3JrbLaIMVPwYifLgIYhb/SOBm+RV7D9HCfwqYW48q3vFBfW/vu45qEfGUb7ej70
         bBekNJ5b87cy7/vrbb4dTyQdDNYJa8EHJWR5HTilFflg9L9F8aIGT1v01eZ0VCRo62FC
         0T+otjgkiSiBarEv7F4GxQEXKjoVTnc/oLHG4nHdzeyXh0zGH5vXXX8PBBEthAF+Xkpd
         ICmw==
X-Gm-Message-State: AOAM533/GXcQQo1AFz+leMzLuRuKnV95YXBuLy0BIGi+oPZBdx/IfJip
	bKR7cGAOC7Lig0B792ExssyJykEsBwhKvcts
X-Google-Smtp-Source: 
 ABdhPJz9iDLWmWIexFuVUXctg1FPQmOhMbkkNai5HNA+61oecJtu42ODxeYex7QwwduBSOO+XJmzSQ==
X-Received: by 2002:a63:e218:0:b0:3c6:7449:15a2 with SMTP id
 q24-20020a63e218000000b003c6744915a2mr6064832pgh.515.1653004393928;
        Thu, 19 May 2022 16:53:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o16-20020a17090ac09000b001d77f392280sm372978pjs.30.2022.05.19.16.53.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 16:53:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/31] Pull request (cover letter only)
Date: Thu, 19 May 2022 13:53:05 -1000
Message-Id: <cover.1653004320.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 23:53:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165913

The following changes since commit cb8647c08959abb1d6b7c2b3a34b4b415f66d7ee:

  build-appliance-image: Update to kirkstone head revision (2022-05-15 08:59:03 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE

Alexander Kanavin (11):
  systemd: upgrade 250.4 -> 250.5
  mesa: upgrade 22.0.0 -> 22.0.2
  bind: upgrade 9.18.1 -> 9.18.2
  cronie: upgrade 1.6.0 -> 1.6.1
  epiphany: upgrade 42.0 -> 42.2
  ffmpeg: upgrade 5.0 -> 5.0.1
  fribidi: upgrade 1.0.11 -> 1.0.12
  libinput: upgrade 1.19.3 -> 1.19.4
  sqlite3: upgrade 3.38.2 -> 3.38.3
  webkitgtk: upgrade 2.36.0 -> 2.36.1
  xwayland: upgrade 22.1.0 -> 22.1.1

Aryaman Gupta (1):
  e2fsprogs: update upstream status

Claudius Heine (1):
  overlayfs: add docs about skipping QA check & service dependencies

Davide Gardenal (6):
  freetype: backport patch for CVE-2022-27404
  freetype: backport patch for CVE-2022-27405
  freetype: backport patch for CVE-2022-27406
  qemu: backport patch for CVE-2021-4206
  qemu: backport patch for CVE-2021-4207
  base-passwd: Disable shell for default users

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20220411 -> 20220509
  image.bbclass: allow overriding dependency on virtual/kernel:do_deploy

Felix Moessbauer (1):
  wic/plugins/rootfs: Fix permissions when splitting rootfs folders
    across partitions

Jiaqing Zhao (3):
  libxml2: Upgrade 2.9.13 -> 2.9.14
  sed: Specify shell for "nobody" user in run-ptest
  strace: Don't run ptest as "nobody"

Khem Raj (1):
  systemd: Fix build regression with latest update

Konrad Weihmann (1):
  linux-firmware: replace mkdir by install

Richard Purdie (3):
  vim: Upgrade 8.2.4681 -> 8.2.4912
  cairo: Add missing GPLv3 license checksum entry
  sanity: Don't warn about make 4.2.1 for mint

 meta/classes/image.bbclass                    |   7 +-
 meta/classes/overlayfs.bbclass                |  18 +-
 meta/classes/pypi.bbclass                     |   2 +
 meta/classes/sanity.bbclass                   |   2 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.1 => bind-9.18.2}/bind9   |   0
 .../{bind-9.18.1 => bind-9.18.2}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.1.bb => bind_9.18.2.bb}   |   2 +-
 .../base-passwd/disable-shell.patch           |  57 ++++
 .../base-passwd/base-passwd_3.5.29.bb         |   1 +
 .../CVE-2022-23308-fix-regression.patch       |  99 -------
 .../libxml2/libxml-m4-use-pkgconfig.patch     |  21 +-
 .../{libxml2_2.9.13.bb => libxml2_2.9.14.bb}  |   5 +-
 ...md-boot_250.4.bb => systemd-boot_250.5.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 .../0001-Adjust-for-musl-headers.patch        |  98 ++++++-
 ...ass-correct-parameters-to-getdents64.patch |  10 +-
 ...e-Use-sockaddr-pointer-type-for-bind.patch |  46 ++++
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   8 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch |  20 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  10 +-
 ...k-parse_printf_format-implementation.patch |  20 +-
 ...missing.h-check-for-missing-strndupa.patch | 151 +++++++++--
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  12 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  17 +-
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  16 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   4 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  18 +-
 ...patible-basename-for-non-glibc-syste.patch |   4 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  10 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   4 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |   4 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |   6 +-
 .../0021-test-json.c-define-M_PIl.patch       |   4 +-
 ...-not-disable-buffer-in-writing-files.patch | 239 ++++++++++-------
 .../0025-Handle-__cpu_mask-usage.patch        |   4 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  16 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  11 +-
 ...eepConfiguration-when-running-on-net.patch | 253 ------------------
 .../{systemd_250.4.bb => systemd_250.5.bb}    |   2 +-
 .../e2fsprogs/e2fsprogs/extents.patch         |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2021-4206.patch             |  89 ++++++
 .../qemu/qemu/CVE-2021-4207.patch             |  43 +++
 meta/recipes-devtools/strace/strace/run-ptest |   6 +-
 .../{cronie_1.6.0.bb => cronie_1.6.1.bb}      |   2 +-
 meta/recipes-extended/sed/sed/run-ptest       |   2 +-
 .../{epiphany_42.0.bb => epiphany_42.2.bb}    |   2 +-
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   5 +-
 .../freetype/freetype/CVE-2022-27404.patch    |  48 ++++
 .../freetype/freetype/CVE-2022-27405.patch    |  41 +++
 .../freetype/freetype/CVE-2022-27406.patch    |  32 +++
 .../freetype/freetype_2.11.1.bb               |   6 +-
 .../{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb}   |   0
 ...{libinput_1.19.3.bb => libinput_1.19.4.bb} |   2 +-
 ...{xwayland_22.1.0.bb => xwayland_22.1.1.bb} |   2 +-
 ...01-Makefile-replace-mkdir-by-install.patch |  84 ++++++
 ...20220411.bb => linux-firmware_20220509.bb} |   9 +-
 .../ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb} |   2 +-
 .../webkitgtk/add_missing_include.patch       |  19 --
 ...ebkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} |   3 +-
 .../{fribidi_1.0.11.bb => fribidi_1.0.12.bb}  |   2 +-
 .../{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb}  |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/wic/plugins/source/rootfs.py      |   5 +-
 77 files changed, 1015 insertions(+), 618 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.1 => bind-9.18.2}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.1.bb => bind_9.18.2.bb} (98%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.13.bb => libxml2_2.9.14.bb} (96%)
 rename meta/recipes-core/systemd/{systemd-boot_250.4.bb => systemd-boot_250.5.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolve-Use-sockaddr-pointer-type-for-bind.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfiguration-when-running-on-net.patch
 rename meta/recipes-core/systemd/{systemd_250.4.bb => systemd_250.5.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4206.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4207.patch
 rename meta/recipes-extended/cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb} (97%)
 rename meta/recipes-gnome/epiphany/{epiphany_42.0.bb => epiphany_42.2.bb} (94%)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb} (100%)
 rename meta/recipes-graphics/wayland/{libinput_1.19.3.bb => libinput_1.19.4.bb} (95%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb} (95%)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb} (98%)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} (98%)
 rename meta/recipes-support/fribidi/{fribidi_1.0.11.bb => fribidi_1.0.12.bb} (90%)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.2.bb => sqlite3_3.38.3.bb} (86%)

-- 
2.25.1


