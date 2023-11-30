Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673F0C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:57:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.5131.1701377861417438434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YOLMN25r;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1134297a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377860; x=1701982660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYq5pOKF2eoA6KoyugDvsGQDG8jn4Vdz67i41qOjYt0=;
        b=YOLMN25rpCzkebwY5HZ7lLUkraFtz4fiol3lfh/aJksTmO1LugU1aZtpd+IJ5yBVrv
         dje34LHQLA+5RPlSucZ/8ddCN5JcgvBnoQYtzgR6tXrthX1E78Q3cBUMVoB9TOuASIk3
         Uf+BHBvpmdmhFfXRTnw2ntNg7wYBIsIIA6eqTuNx9w5SWxhtlpm5Z3/5AmECdJsToxF8
         upUmY9bz+px+7nHT74NdsfgB8W0EqyTZEM9/YIeWwk3CMdlwWqUKGC3LjaWuwBiWdmrk
         j0yFbsL4zTK0ZYyOQVr9G4uOZuizUWVgqrEBqY6CnGIfC1YDYof7P0aJnTQAmjX0Idw3
         cmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377860; x=1701982660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYq5pOKF2eoA6KoyugDvsGQDG8jn4Vdz67i41qOjYt0=;
        b=qfFvI0mh56CKJ2Adq47qZAnxS6hSwf5+7hqhGJ7RmuRLS6+y/l4USFmpPtvgrYfqyl
         nTFMouUbo9BX5+u++gPEkxHG6rTTP+nnDnr7swnEv5ggWtzCdlJi89qmr7qYhrXz2uDg
         /ZEf/jIkLpnEEHFtGyEZQCAgW6WmEWW7HxQm2C02nDmLjpO5X40dJ+xNHHVDxxWOC5Jl
         4aLDAY2kG4G77FFC/b0W+Xn528oi5X2C4QOWcEts2NEcTGan9YiohWncd8xYfKQy6S6n
         M6QwlC202wtimitSXKfjpICC//J0+YScoAbkvhonitndbI9xTRUmHMR9jONgDWw3VM2E
         f6RQ==
X-Gm-Message-State: AOJu0Yxh8RnZQIzICwbz1RXKQMSy1lbVg18NmIQbFAYx6sY5HO7oduYL
	lOJ0gt7kKmp6xXFiBANJ/kz5H619lrDJ+C/2oFp6QA==
X-Google-Smtp-Source: AGHT+IFwc4eNhikisR6dcsQmK3vxMm55pVZPJ2/k3h/awlo4gjW8+XC5syEmhLZt5R9hlXRDubUxWw==
X-Received: by 2002:a05:6a20:3d1b:b0:18b:556b:6d54 with SMTP id y27-20020a056a203d1b00b0018b556b6d54mr26545771pzi.55.1701377860115;
        Thu, 30 Nov 2023 12:57:40 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/25] Patch review
Date: Thu, 30 Nov 2023 10:57:08 -1000
Message-Id: <cover.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191518

Please review this set of changes for nanbield and have comments back by
end of day Monday, December 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6265

The following changes since commit cce77e8e79c860f4ef0ac4a86b9375bf87507360:

  build-appliance-image: Update to nanbield head revision (2023-11-24 08:27:44 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Bastian Krause (1):
  linux-firmware: add new fw file to ${PN}-rtl8821

Chen Qi (1):
  systemd: fix DynamicUser issue

Dmitry Baryshkov (8):
  linux-firmware: upgrade 20230804 -> 20231030
  linux-firmware: add missing depenencies on license packages
  linux-firmware: add notice file to sdm845 modem firmware
  linux-firmware: add audio topology symlink to the X13's audio package
  linux-firmware: package firmware for Qualcomm Adreno a702
  linux-firmware: package firmware for Qualcomm QCM2290 / QRB4210
  linux-firmware: package Qualcomm Venus 6.0 firmware
  linux-firmware: package Robotics RB5 sensors DSP firmware

Fahad Arslan (1):
  linux-firmware: create separate packages

Jermain Horsman (2):
  lib/oe/buildcfg.py: Include missing import
  lib/oe/buildcfg.py: Remove unused parameter

Khem Raj (1):
  python3-urllib3: Upgrade to 2.0.7

Randy MacLeod (1):
  strace: backport fix for so_peerpidfd-test

Richard Purdie (1):
  qemu: Upgrade 8.1.0 -> 8.1.2

Ross Burton (1):
  xwayland: upgrade to 23.2.2

Tim Orling (1):
  lsb-release: use https for UPSTREAM_CHECK_URI

Vijay Anusuri (1):
  avahi: backport Debian patches to fix multiple CVE's

Vyacheslav Yurkov (1):
  lib/oe/path: Deploy files can start only with a dot

Wang Mingyu (4):
  base-passwd: upgrade 3.6.1 -> 3.6.2
  enchant2: upgrade 2.6.1 -> 2.6.2
  harfbuzz: upgrade 8.2.1 -> 8.2.2
  libjpeg-turbo: upgrade 3.0.0 -> 3.0.1

William Lyu (1):
  openssl: improve handshake test error reporting

 meta/lib/oe/buildcfg.py                       |  11 +-
 meta/lib/oe/path.py                           |   3 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   8 +
 .../avahi/files/CVE-2023-1981.patch           |  58 +++
 .../avahi/files/CVE-2023-38469-1.patch        |  48 +++
 .../avahi/files/CVE-2023-38469-2.patch        |  65 +++
 .../avahi/files/CVE-2023-38470-1.patch        |  57 +++
 .../avahi/files/CVE-2023-38470-2.patch        |  52 +++
 .../avahi/files/CVE-2023-38471-1.patch        |  73 ++++
 .../avahi/files/CVE-2023-38471-2.patch        |  52 +++
 .../avahi/files/CVE-2023-38472.patch          |  45 +++
 .../avahi/files/CVE-2023-38473.patch          | 109 +++++
 ...ke-history-reporting-when-test-fails.patch | 374 ++++++++++++++++++
 .../openssl/openssl_3.1.4.bb                  |   1 +
 ...-to-configure-whether-to-use-SELinux.patch |  35 --
 ...e-passwd_3.6.1.bb => base-passwd_3.6.2.bb} |   3 +-
 meta/recipes-core/systemd/systemd_254.4.bb    |  30 +-
 ...lib3_2.0.6.bb => python3-urllib3_2.0.7.bb} |   2 +-
 ...u-native_8.1.0.bb => qemu-native_8.1.2.bb} |   0
 ...e_8.1.0.bb => qemu-system-native_8.1.2.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   5 +-
 ...t-data-in-bounds-in-iotlb_to_section.patch |  42 --
 ...u-Use-async_run_on_cpu-in-tcg_commit.patch | 157 --------
 .../qemu/qemu/CVE-2023-42467.patch            |  49 ---
 .../qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb}     |   0
 .../skip-test-so_peerpidfd.gen.test.patch     |  25 --
 .../strace/tests-fix-so_peerpidfd-test.patch  |  32 ++
 meta/recipes-devtools/strace/strace_6.5.bb    |   2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   3 +-
 .../{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb}  |   2 +-
 ...-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb} |   2 +-
 ...{xwayland_23.2.1.bb => xwayland_23.2.2.bb} |   2 +-
 ...20230804.bb => linux-firmware_20231030.bb} | 288 +++++++++++++-
 .../{enchant2_2.6.1.bb => enchant2_2.6.2.bb}  |   2 +-
 34 files changed, 1292 insertions(+), 345 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.1.bb => base-passwd_3.6.2.bb} (96%)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb} (87%)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.0.bb => qemu-native_8.1.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.0.bb => qemu-system-native_8.1.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Assert-data-in-bounds-in-iotlb_to_section.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-softmmu-Use-async_run_on_cpu-in-tcg_commit.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 rename meta/recipes-devtools/qemu/{qemu_8.1.0.bb => qemu_8.1.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
 create mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.2.1.bb => harfbuzz_8.2.2.bb} (95%)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.0.0.bb => libjpeg-turbo_3.0.1.bb} (97%)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (83%)
 rename meta/recipes-support/enchant/{enchant2_2.6.1.bb => enchant2_2.6.2.bb} (92%)

-- 
2.34.1


