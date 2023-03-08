Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303D0C6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 02:27:07 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.13454.1678242421127168592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 18:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DQKUibd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id nn12so519310pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678242420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcgEH34QiMY6u37RWcxOOvaYYiTCgtpGagwHOx79cJA=;
        b=DQKUibd2zBOqy1X7ARVJ2omakn6uEBd+m262mUytKfUGiXTbmBlLCvz08Oh46xcbeR
         NhtPecBED227/EFCGErJHuJOLhN+Zt/Vi41+jFbHYA5tZQauhvr8hu211BNuR+vsWL49
         Gew06gEm9VGzrdDxp1ljifd8Nd9ot2yznUGub885A9+EkNFeHBnDVJI7RYyqqqiON2UP
         Ear/lhMlHdBCbBSdLlwjJ8ApFcxt7UbLeoZofnjLgXG92LhhGdQRHbRNyFobcs7F5gw4
         HWsM7BbpIL3vDYzRwNDSGO1OK6gf7RV6fglk/FJsPglGUaCg3HrOTGUamT+2/s1T84FY
         ucuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678242420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcgEH34QiMY6u37RWcxOOvaYYiTCgtpGagwHOx79cJA=;
        b=pPiFNERB6PDeKQZM+CIqueiH962kQdqSre/f9mkzKa3vFvX9mzK5phCx8MLqfTgifx
         rdUZSNgtzwUp9jsZ5aJsx0zGGLWPbGlRIOno4kX0O7bbS7cvX/X2eGUZpByKzV+tbqoW
         m1a8LYaoai5H00zHBVTPCNYc+69Qk9xrnQIjGp73KHntNZsvh8pBS0e5NoPyPRgbmRhU
         ciFHUYzgMmzRGnr4GkbMpyRz23fUJpJEIQgpFW/1sysapGka4fLlPR9fq/OG5eaS0Foo
         deosR0UX2sKLKCG+HaeZQDMgj4+YgYNpB2I0px/V/7g0Vg0QJ6ifdMvMcXl4QoiZ1MCz
         GLsg==
X-Gm-Message-State: AO0yUKW0Wl47fGNLrAoMebKjAhyNa6MzGzVzMKC8kRFuzaibfdoWDNOU
	D561lNGtZr51zKs3v+JbZJi+C44Hj7r8zYupJZs=
X-Google-Smtp-Source: AK7set9G2YedNgm4xyRSFKpNnMS5hJKSGbWDd97CCQJE1BvKyiUl4Zhl9NEgM2QZKKEG77e0dIrSnQ==
X-Received: by 2002:a05:6a20:9150:b0:b9:7de5:239 with SMTP id x16-20020a056a20915000b000b97de50239mr17567111pzc.27.1678242419732;
        Tue, 07 Mar 2023 18:26:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g5-20020aa78745000000b0058a3d8eab6asm8497264pfo.134.2023.03.07.18.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 18:26:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/28] Pull request (cover letter only)
Date: Tue,  7 Mar 2023 16:26:53 -1000
Message-Id: <cover.1678242326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 02:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178152

The following changes since commit b20e2134daec33fbb8ce358d984751d887752bd5:

  build-appliance-image: Update to kirkstone head revision (2023-02-27 23:39:05 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (4):
  vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
  dbus: upgrade 1.14.4 -> 1.14.6
  linux-firmware: upgrade 20230117 -> 20230210
  wireless-regdb: upgrade 2022.08.12 -> 2023.02.13

Alexis Lothoré (1):
  oeqa/selftest/resulttooltests: fix minor typo

Bruce Ashfield (1):
  lttng-modules: fix for kernel 6.2+

Changqing Li (1):
  libsdl2: fix CVE-2022-4743

Dmitry Baryshkov (2):
  linux-firmware: properly set license for all Qualcomm firmware
  linux-firmware: add yamato fw files to qcom-adreno-a2xx package

Federico Pellegrin (1):
  curl: fix dependencies when building with ldap/ldaps

Hitendra Prajapati (1):
  less: backport the fix for CVE-2022-46663

Joe Slater (1):
  nghttp2: never build python bindings

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

Ross Burton (1):
  lib/buildstats: handle tasks that never finished

Saul Wold (2):
  package.bbclase: Add check for /build in copydebugsources()
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

Yash Shinde (1):
  binutils : Fix CVE-2023-22608

 meta/classes/kernel-yocto.bbclass             |   2 +-
 meta/classes/package.bbclass                  |   7 +
 meta/lib/oe/sstatesig.py                      |   4 +
 meta/lib/oeqa/core/target/ssh.py              |  39 +-
 .../oeqa/selftest/cases/resulttooltests.py    |   2 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch |  34 ++
 .../openssl/openssl/CVE-2022-3996.patch       |  43 --
 .../{openssl_3.0.7.bb => openssl_3.0.8.bb}    |   3 +-
 ...001-depmod-Ignore-.debug-directories.patch |   2 +-
 .../dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb}   |   4 +-
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0020-CVE-2023-22608-1.patch      | 506 ++++++++++++++++++
 .../binutils/0020-CVE-2023-22608-2.patch      | 210 ++++++++
 .../binutils/0020-CVE-2023-22608-3.patch      |  32 ++
 .../less/less/CVE-2022-46663.patch            |  31 ++
 meta/recipes-extended/less/less_600.bb        |   1 +
 ...urbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} |   2 +-
 ...ial-memory-leak-in-GLES_CreateTextur.patch |  40 ++
 .../libsdl2/libsdl2_2.0.20.bb                 |   1 +
 ...-xorg_21.1.6.bb => xserver-xorg_21.1.7.bb} |   2 +-
 ...{xwayland_22.1.7.bb => xwayland_22.1.8.bb} |   2 +-
 ...20230117.bb => linux-firmware_20230210.bb} |  41 +-
 ...ccessor-helpers-into-accessors.h-v6..patch |  45 ++
 .../lttng/lttng-modules_2.13.8.bb             |   1 +
 ....08.12.bb => wireless-regdb_2023.02.13.bb} |   2 +-
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +-
 .../libseccomp/files/run-ptest                |   3 +
 ...nviroment-to-decide-if-a-test-is-bui.patch |  44 --
 .../libssh2/libssh2/fix-ssh2-test.patch       |  23 +
 .../libssh2/{files => libssh2}/run-ptest      |   3 +-
 .../recipes-support/libssh2/libssh2_1.10.0.bb |   3 +-
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   4 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/buildstats.py                     |  33 +-
 scripts/lib/wic/partition.py                  |   5 +
 scripts/runqemu                               |  24 +-
 37 files changed, 1075 insertions(+), 135 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb => openssl_3.0.8.bb} (98%)
 rename meta/recipes-core/dbus/{dbus_1.14.4.bb => dbus_1.14.6.bb} (98%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2023-22608-3.patch
 create mode 100644 meta/recipes-extended/less/less/CVE-2022-46663.patch
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} (97%)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch
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


