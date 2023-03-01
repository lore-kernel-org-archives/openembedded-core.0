Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18350C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:57:30 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.26302.1677686239504518209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=D/mf8MAN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so13274786pjg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677686238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK9RoV98SXa76DjdyebrBjW2rvS+4cN3TjhwTWSKNNU=;
        b=D/mf8MANu2/hN0GbVK5+77MKuAsPQ+pYyz1tzL3eN+PQPqSKKLTKzsPJyqsXZIN24k
         U5DJS3Cym9wbEeoEyNhuPSEVXOA35hL22pd+zMrHOfRkDuLLaBPNhsUffdJOSI6UFSr8
         HLN7WP0F/iBba7AbJqH+gJCmhe6MTJYdGyxoKXvnZXPBhsEWvCq65rkmmCUCggm/FGz3
         PxA9yupXEgInBRRYNrjrLgHk6s8rWive3LOQfhIU8c3CgL0wQ6SWchhKzHGFWhkhVVxw
         LnbfsEXhESG2ljw7BfMTZS5MJRXL/hUQPw7EPLTBsqsTuA/fbLNVTLeBR4ib2FT4wQ7r
         hgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677686238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK9RoV98SXa76DjdyebrBjW2rvS+4cN3TjhwTWSKNNU=;
        b=r79gS/RveEyixO7QAEh1ZbuuDc+m3pTlIvPJKwoAb0DDXAZnCIgGsh+n9eZ80p2Opl
         g2HsU9yMzsraQhdYUcKsbLPNhQYetWOjHtKeU4WgjEVTFoC6APZhF39Is9WPW3y8nf7g
         mNrmWaxTZkPAvpNOyI3q/p/HOvtnjvEo+IVZ9alCTtbicO+ilDckukDrfUqbAPz7njXN
         WnAfrcZBgCVapqK78ciP9SJg/AdhQ9sVm/M2DElwQfS9QZQAJMtFQ3N475lvmsiK3aRx
         ErN7lashOraWyUkyJPr5iaHYWQKYTXKP4XLX2vSjbNiS+v+//sPsLNi4NJcFAbSpcYq6
         6YCg==
X-Gm-Message-State: AO0yUKXyTjYodOvUEFHEdIyGXz+pXBHVoKgjGYUNgyqryjZz+arwdw+O
	DE7AT7QaMppAXr3MPweZP2MIeLzWtmKriCE5LXY=
X-Google-Smtp-Source: AK7set+sgo4s7ezYp9Vw9hVX4r8mTpg64cj+NCvtKa/1UBUdkNf2ogB8/Ju+IwU8hLwN9eB6eSSQ+w==
X-Received: by 2002:a05:6a20:728b:b0:cc:a5d4:c334 with SMTP id o11-20020a056a20728b00b000cca5d4c334mr8537752pzk.10.1677686238176;
        Wed, 01 Mar 2023 07:57:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k10-20020aa7820a000000b005a9ea5d43ddsm8372551pfi.174.2023.03.01.07.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:57:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/28] Pull request (cover letter only)
Date: Wed,  1 Mar 2023 05:57:12 -1000
Message-Id: <cover.1677685715.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177944

The following changes since commit ab1e3000cee9f5f3496a7e67cc59b2e08a681a89:

  oeqa qemurunner.py: try to avoid reading one character at a time (2023-02-18 06:41:49 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Adrian Freihofer (1):
  bblayers/setupwriters/oe-setup-layers: create dir if not exists

Alexander Kanavin (5):
  vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
  dbus: upgrade 1.14.4 -> 1.14.6
  linux-firmware: upgrade 20230117 -> 20230210
  wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
  bblayers/makesetup: skip git repos that are submodules

Alexis Lothoré (1):
  oeqa/selftest/resulttooltests: fix minor typo

Bruce Ashfield (1):
  lttng-modules: fix for kernel 6.2+

Dmitry Baryshkov (2):
  linux-firmware: properly set license for all Qualcomm firmware
  linux-firmware: add yamato fw files to qcom-adreno-a2xx package

Federico Pellegrin (1):
  curl: fix dependencies when building with ldap/ldaps

Joshua Watt (1):
  classes/populate_sdk_base: Append cleandirs

Kai Kang (1):
  xserver-xorg: 21.1.6 -> 21.1.7

Mateusz Marciniec (1):
  sstatesig: Improve output hash calculation

Mikko Rapeli (2):
  oeqa ssh.py: fix hangs in run()
  runqemu: kill qemu if it hangs

Narpat Mali (1):
  libseccomp: fix for the ptest result format

Pavel Zhukov (1):
  wic: Fix usage of fstype=none in wic

Richard Purdie (1):
  libssh2: Clean up ptest patch/coverage

Ross Burton (3):
  less: backport the fix for CVE-2022-46663
  lib/buildstats: handle tasks that never finished
  cml1: remove redundant addtask

Saul Wold (1):
  busybox: Fix depmod patch

Siddharth Doshi (1):
  openssl: Upgrade 3.0.7 -> 3.0.8

Ulrich Ölmann (1):
  kernel-yocto: fix kernel-meta data detection

Wang Mingyu (2):
  libjpeg-turbo: upgrade 2.1.5 -> 2.1.5.1
  xwayland: upgrade 22.1.7 -> 22.1.8

Xiangyu Chen (1):
  dhcpcd: fix dhcpcd start failure on qemuppc64

 meta/classes-recipe/cml1.bbclass              |  1 -
 meta/classes-recipe/kernel-yocto.bbclass      |  2 +-
 meta/classes-recipe/populate_sdk_base.bbclass |  2 +-
 meta/lib/bblayers/makesetup.py                | 10 +++++
 .../bblayers/setupwriters/oe-setup-layers.py  |  2 +
 meta/lib/oe/sstatesig.py                      |  4 ++
 meta/lib/oeqa/core/target/ssh.py              | 39 ++++++++++++----
 .../oeqa/selftest/cases/resulttooltests.py    |  2 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 ++++++++++++++
 .../openssl/openssl/CVE-2022-3996.patch       | 43 ------------------
 .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |  3 +-
 ...001-depmod-Ignore-.debug-directories.patch |  2 +-
 .../dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb}   |  4 +-
 .../less/files/CVE-2022-46663.patch           | 28 ++++++++++++
 meta/recipes-extended/less/less_608.bb        |  1 +
 ...urbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} |  2 +-
 ...-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb} |  2 +-
 ...{xwayland_22.1.7.bb => xwayland_22.1.8.bb} |  2 +-
 ...20230117.bb => linux-firmware_20230210.bb} | 41 ++++++++++++++---
 ...ccessor-helpers-into-accessors.h-v6..patch | 45 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.8.bb             |  1 +
 ....08.12.bb => wireless-regdb_2023.02.13.bb} |  2 +-
 meta/recipes-support/curl/curl_7.85.0.bb      |  4 +-
 .../libseccomp/files/run-ptest                |  3 ++
 ...nviroment-to-decide-if-a-test-is-bui.patch | 44 ------------------
 .../libssh2/libssh2/fix-ssh2-test.patch       | 23 ++++++++++
 .../libssh2/{files => libssh2}/run-ptest      |  3 +-
 .../recipes-support/libssh2/libssh2_1.10.0.bb |  3 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 scripts/lib/buildstats.py                     | 33 +++++++++++---
 scripts/lib/wic/partition.py                  |  5 +++
 scripts/runqemu                               | 24 ++++++----
 33 files changed, 282 insertions(+), 137 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (98%)
 rename meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} (98%)
 create mode 100644 meta/recipes-extended/less/files/CVE-2022-46663.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} (97%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb => linux-firmware_20230210.bb} (96%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} (94%)
 delete mode 100644 meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
 rename meta/recipes-support/libssh2/{files => libssh2}/run-ptest (67%)

-- 
2.34.1


