Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6246C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.151490.1703864703979988328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vK62mUrn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3aa0321b5so56620535ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864702; x=1704469502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AN+vMS7ddairC/RksEb6MtCmC3qOv0ya01vUNpmxTkA=;
        b=vK62mUrnXoVHr2/NjGnsqVHLxn4e/HbUA9aIh1Zob37yOXb+SH6Vycc42lLoP4ora/
         WhmPNjMdnUVKsGn8sv0hRSPV+dRlQPqJiewjgw3bqIC/gl3YQIIn6+DITbMWudv0HVQd
         mXDQah9JfDGiJ1fFskj1SxUs6+e0ZFfz/2JgC9vUlPMIqTX66njDhpJsQCsNzPQn2fTp
         thmo7Xlk2lLg/MGtRdT7a+RXJqf2aESvgK8lXlWYjN1SCx3HJHlZVN4xQKqhcLepBA/T
         fjbg6jqjlcJiOBG3WyrbtTYPtyfHdu9vfGTuyrLezX0tipvanFs/57O5kXfLS0sZ7TLG
         Eq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864702; x=1704469502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AN+vMS7ddairC/RksEb6MtCmC3qOv0ya01vUNpmxTkA=;
        b=fgX/c2qaQ5AgbS1gnPyHLNozu808wQnPnGCUVTek6L45EzC/l9YER7HxKbAJsVPRdo
         upg3KOjHW+3TKStG4zM4MZoXww0ArW8MgQjBXk3+a5mPSnSKsQRFq13wFsOATM0a+zaO
         pyBu8GIEUgg0QDEkDmasqAGhhMg7HvQ53njWSqX1k/PWP78HYl0E3qOStFZ2D+Un1RdB
         gklIMipDDe5CXClhN62GzzoLRtIGrirdh6HiXfiU4jkIPlbI9AdHPabpgkDYUqVWLoLe
         sX9i0TEYtCiH79AzPsbDgqjrS1wZGqAku81wSlSCfI9QXXZO6WE4ouOHBh4/hEHg/G6v
         GZ1w==
X-Gm-Message-State: AOJu0YzGemJqyUI8l6116WOqFd6EIz0WojIottuQEbZnyoKUt7GLz4gh
	NS/0CkCcy55ZdbxDalY3kVFfFNpMpuySvGWrt362rffvlVJo5A==
X-Google-Smtp-Source: AGHT+IGZR1dTzJzxHyzFXRDzDurqOYpJqGrWicgeIqqr+epYfM8+T8kf4Y/ab0Mh+3Zh3gvfs4GfGA==
X-Received: by 2002:a17:902:ced2:b0:1d0:6ffd:e2b8 with SMTP id d18-20020a170902ced200b001d06ffde2b8mr13788166plg.82.1703864702271;
        Fri, 29 Dec 2023 07:45:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/41] Patch review
Date: Fri, 29 Dec 2023 05:44:14 -1000
Message-Id: <cover.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193017

Please review this set of changes for nanbield and have comments back by
end of day Wednesday, January 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6386

The following changes since commit 1a14503ff5b4bc8192ae1b0d22622b8aefb718be:

  testimage: Exclude wtmp from target-dumper commands (2023-12-21 05:25:02 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Adam Johnston (1):
  useradd_base: Fix sed command line for passwd-expire

Alexander Kanavin (1):
  cmake: upgrade 3.27.5 -> 3.27.7

Anuj Mittal (1):
  gstreamer1.0: upgrade 1.22.6 -> 1.22.7

Bruce Ashfield (7):
  linux-yocto/6.1: drop removed IMA option
  linux-yocto-rt/6.1: update to -rt18
  linux-yocto/6.1: update to v6.1.66
  linux-yocto/6.1: update to v6.1.67
  linux-yocto/6.1: update to v6.1.68
  linux-yocto/6.5: drop removed IMA option
  linux-yocto/6.5: fix AB-INT: QEMU kernel panic: No irq handler for
    vector

Deepthi Hemraj (1):
  rust: Fix CVE-2023-40030

Dhairya Nagodra (2):
  cve-update-nvd2-native: faster requests with API keys
  cve-update-nvd2-native: increase the delay between subsequent request
    failures

Javier Tia (1):
  kernel-arch: use ccache only for compiler

Joakim Tjernlund (1):
  sed -i destroys symlinks

Julien Stephan (2):
  devtool: fix update-recipe dry-run mode
  devtool: finish/update-recipe: restrict mode srcrev to recipes fetched
    from SCM

Marco Felsch (1):
  json-c: fix icecc compilation

Markus Volk (3):
  gtk: Add rdepend on printbackend for cups
  bluez5: fix connection for ps5/dualshock controllers
  cups: Add root,sys,wheel to system groups

Massimiliano Minella (1):
  systemd: update LICENSE statement

Michael Opdenacker (1):
  systemd-compat-units.bb: fix postinstall script

Peter Marko (2):
  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
  cve-update-nvd2-native: make number of fetch attemtps configurable

Richard Purdie (3):
  linux/cve-exclusion6.1: Update to latest kernel point release
  package_ipk: Fix Source: field variable dependency
  testimage: Drop target_dumper and most of monitor_dumper

Ross Burton (4):
  linux-yocto: update CVE exclusions
  lib/oe/patch: ensure os.chdir restoring always happens
  tcl: skip timing-dependent tests in run-ptest
  tcl: skip async and event tests in run-ptest

Trevor Gamblin (2):
  python3-ptest: skip test_storlines
  patchtest: shorten patch signed-off-by test output

Viswanath Kraleti (1):
  systemd-boot: Fix build issues on armv7a-linux

Wang Mingyu (6):
  libsolv: upgrade 0.7.25 -> 0.7.26
  bind: upgrade 9.18.19 -> 9.18.20
  ell: upgrade 0.59 -> 0.60
  libgcrypt: upgrade 1.10.2 -> 1.10.3
  libxslt: upgrade 1.1.38 -> 1.1.39
  log4cplus: upgrade 2.1.0 -> 2.1.1

 meta/classes-global/package_ipk.bbclass       |   6 +-
 meta/classes-recipe/kernel-arch.bbclass       |   6 +-
 .../rootfs-postcommands.bbclass               |   4 +-
 meta/classes-recipe/testimage.bbclass         |  16 -
 meta/classes/useradd_base.bbclass             |   2 +-
 meta/lib/oe/patch.py                          |   7 +-
 meta/lib/oeqa/core/target/qemu.py             |  10 -
 meta/lib/oeqa/core/target/ssh.py              |  20 +-
 meta/lib/oeqa/targetcontrol.py                |   2 -
 meta/lib/patchtest/tests/test_patch.py        |   3 +-
 .../bind/{bind_9.18.19.bb => bind_9.18.20.bb} |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...e_probe-failing-if-SDP-record-is-not.patch | 313 +++++++++++++
 .../ell/{ell_0.59.bb => ell_0.60.bb}          |   2 +-
 .../meta/cve-update-nvd2-native.bb            |  27 +-
 .../systemd/systemd-boot_254.4.bb             |   4 +
 .../systemd/systemd-compat-units.bb           |   3 +-
 meta/recipes-core/systemd/systemd.inc         |   3 +-
 ...n-Pass-all-static-pie-args-to-linker.patch |  35 ++
 ...ative_3.27.5.bb => cmake-native_3.27.7.bb} |   0
 meta/recipes-devtools/cmake/cmake.inc         |   2 +-
 .../{cmake_3.27.5.bb => cmake_3.27.7.bb}      |   0
 meta/recipes-devtools/json-c/json-c_0.17.bb   |   3 +
 ...{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb} |   2 +-
 ...orlines-skip-due-to-load-variability.patch |  32 ++
 .../recipes-devtools/python/python3_3.11.5.bb |   1 +
 .../rust/files/0002-CVE-2023-40030.patch      | 412 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   6 +-
 meta/recipes-extended/cups/cups.inc           |   2 +-
 .../{libsolv_0.7.25.bb => libsolv_0.7.26.bb}  |   2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc             |   2 +-
 meta/recipes-gnome/gtk+/gtk4_4.12.3.bb        |   2 +-
 .../linux/cve-exclusion_6.1.inc               |   6 +-
 .../linux/cve-exclusion_6.5.inc               |   2 +-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-rt_6.5.bb               |   4 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 .../linux/linux-yocto-tiny_6.5.bb             |   4 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  |  24 +-
 ...tools_1.22.6.bb => gst-devtools_1.22.7.bb} |   2 +-
 ...1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} |   2 +-
 ...x_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.7.bb} |   2 +-
 ....22.6.bb => gstreamer1.0-python_1.22.7.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.7.bb} |   2 +-
 ...1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} |   2 +-
 ...er1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb} |   2 +-
 ...ibgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb} |   2 +-
 .../{libxslt_1.1.38.bb => libxslt_1.1.39.bb}  |   2 +-
 scripts/lib/devtool/standard.py               |  15 +-
 55 files changed, 918 insertions(+), 136 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.20.bb} (97%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
 rename meta/recipes-core/ell/{ell_0.59.bb => ell_0.60.bb} (89%)
 create mode 100644 meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.5.bb => cmake-native_3.27.7.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.1.0.bb => log4cplus_2.1.1.bb} (90%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
 create mode 100644 meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.6.bb => gst-devtools_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.6.bb => gstreamer1.0-plugins-bad_1.22.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.6.bb => gstreamer1.0-plugins-base_1.22.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.6.bb => gstreamer1.0-plugins-good_1.22.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.6.bb => gstreamer1.0-plugins-ugly_1.22.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.6.bb => gstreamer1.0-rtsp-server_1.22.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb} (97%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.2.bb => libgcrypt_1.10.3.bb} (96%)
 rename meta/recipes-support/libxslt/{libxslt_1.1.38.bb => libxslt_1.1.39.bb} (95%)

-- 
2.34.1


