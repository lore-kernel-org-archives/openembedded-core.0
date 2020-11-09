Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.6354.1604890606299106356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B6VNFhj6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 62so5768731pgg.12
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WDlv1AQrNw7EeQ62sy+TDzcDVV5hwSCn5T1sSaiGqOQ=;
        b=B6VNFhj6mZFTWV92Dx3wLtEk1umSBsoRzjeejJR/nb03a5rStDXxntdK3+UDL5oTaz
         EkW3/CU83mOqZLL4AKqNoM3oqwyx/DbwVh+8LQ4mIRhlp5rEwBLL0lz9PYwBbc0O4tyF
         jZWoVUr0YnZvhGNFnZkuz1ZWN0KB1AMysZL6HZvQElHBcMVyYedon/6u6dX9ZhpGvpcX
         GOZcUlSFkwbbY3JjbiKvTyXzWMpTZxCXmrO1i9rfHBs9lPaJSQwxr/gQAv1FO0UbBS2c
         b8h2S9Zi0f2jYB+Ipvc5ZO7zbQlCR66xGNn9ndxGD3FrOTMvVzcNiV95vyLPJlv0X+az
         r1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WDlv1AQrNw7EeQ62sy+TDzcDVV5hwSCn5T1sSaiGqOQ=;
        b=e9EyaVGrtzN351CklcyuMVzjWzgRykR61hDuV0FK46BgTSeXg43G2F+t5GJ++u+jBo
         me3o8Qd4pTu9GzngRtOBTldcB0DzfQd8jA0ftkeHImnRdPZOqKD6Pwmnb/RznEEBps3c
         MzU5b+M9ghMdDutSQ8MnGMTFYzOl42bqepFsDEsIp5bggGA7pA2YWOeNMsNfCthYj2pT
         DEpZAyk4HNxS0ajpkDspeyX+ZpRMZJjGMVTWizD0raScKGtPz7IHwFdB2C4I+euhbnq4
         Pyfp4JdVZykp8k/HGW4Zs5CbhFS3KIeHQmIIqYEaSFABL9GtsqBdwR0OZcWHDb+GKvoI
         r92g==
X-Gm-Message-State: AOAM530AVFQgCUwOtZAbM8devHIGB8rAaYGciJtTiEQfYZRASdoXXQBs
	UbEb/m3VjfFxH3tx+W6XWUfOPUmo38/IV4H/
X-Google-Smtp-Source: ABdhPJwOQon8rK4spM/DGgHrO28Ob5YwR8SJzfYBk/TiebE2r9bHvcz1awGcAO7ZE8Vmt+K0KAIKNQ==
X-Received: by 2002:a17:90a:4a85:: with SMTP id f5mr11335446pjh.216.1604890605136;
        Sun, 08 Nov 2020 18:56:45 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:56:44 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Sun,  8 Nov 2020 16:56:07 -1000
Message-Id: <cover.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1560

The following changes since commit 8d54034bb8e522f9827ec6422b32cbd4e5bf1346:

  sqlite3: fix CVE-2020-13632 (2020-11-05 04:07:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  linux-firmware: upgrade 20200817 -> 20201022

Chee Yang Lee (1):
  ruby: fix CVE-2020-25613

Khem Raj (1):
  qemuboot.bbclass: Fix a typo

Max Krummenacher (2):
  linux-firmware: package marvel sdio 8997 firmware
  linux-firmware: package nvidia firmware

Maxime Roussin-Bélanger (1):
  meta: fix some unresponsive homepages and bugtracker links

Mingli Yu (1):
  update_udev_hwdb: clean hwdb.bin

Neil Armstrong (1):
  linux-firmware: add Amlogic VDEC firmware package

Steve Sakoman (2):
  netbase: update SRC_URI to reflect new file name
  netbase: bump PE to purge bogus hash equivalence from autobuilder

Yongxin Liu (2):
  grub: fix several CVEs in grub 2.04
  grub: clean up CVE patches

 meta/classes/qemuboot.bbclass                 |    2 +-
 ...308-calloc-Use-calloc-at-most-places.patch | 1863 +++++++++++++++++
 ...low-checking-primitives-where-we-do-.patch | 1330 ++++++++++++
 ...se-after-free-when-redefining-a-func.patch |  117 ++
 ...er-overflows-in-initrd-size-handling.patch |  177 ++
 ...-we-always-have-an-overflow-checking.patch |  246 +++
 ...dd-LVM-cache-logical-volume-handling.patch |  287 +++
 ...e-arithmetic-primitives-that-check-f.patch |   94 +
 ...used-fields-from-grub_script_functio.patch |   37 +
 meta/recipes-bsp/grub/grub2.inc               |    8 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |    2 +-
 .../recipes-connectivity/bind/bind_9.11.22.bb |    2 +-
 meta/recipes-connectivity/iw/iw_5.4.bb        |    2 +-
 meta/recipes-core/netbase/netbase_6.1.bb      |    9 +-
 meta/recipes-core/readline/readline.inc       |    2 +-
 meta/recipes-core/util-linux/util-linux.inc   |    4 +-
 meta/recipes-devtools/chrpath/chrpath_0.16.bb |    3 +-
 meta/recipes-devtools/ninja/ninja_1.10.0.bb   |    2 +-
 .../ruby/ruby/CVE-2020-25613.patch            |   40 +
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |    1 +
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |    2 +-
 .../recipes-extended/minicom/minicom_2.7.1.bb |    2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |    2 +-
 meta/recipes-extended/which/which_2.21.bb     |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb       |    2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb    |    3 +-
 meta/recipes-kernel/kmod/kmod.inc             |    2 +-
 ...20200817.bb => linux-firmware_20201022.bb} |   51 +-
 .../wireless-regdb_2020.04.29.bb              |    2 +-
 .../libvorbis/libvorbis_1.3.6.bb              |    4 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |    2 +-
 meta/recipes-support/atk/atk_2.34.1.bb        |    5 +-
 .../bash-completion/bash-completion_2.10.bb   |    4 +-
 meta/recipes-support/npth/npth_1.6.bb         |    4 +-
 scripts/postinst-intercepts/update_udev_hwdb  |    1 +
 35 files changed, 4279 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
 create mode 100644 meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
 create mode 100644 meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
 create mode 100644 meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
 create mode 100644 meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200817.bb => linux-firmware_20201022.bb} (95%)

-- 
2.17.1

