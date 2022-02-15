Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A87C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 17:28:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.137.1644946128033882013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 09:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bBoL8zyv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id e17so16498602pfv.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IL2rkbkznTMAbewTR/VDL+rxBhYBQdQrPZVmFw8rwM4=;
        b=bBoL8zyvLpbMuUB2NazM5pcpOyVEujOxGv33BMAff9izWF35/6b/zH/6UTpVi/fL/u
         B6StdkhKYVSCZtr2la+LMp2HxTiuNS8FuZbcjgeJPCMjdU7T9WgAHFjv6/WOnBc0UMmD
         1SGOcra+taluthwp4WF3UX/cWiRDf2t4nnv4ro8zZin75NCfE1kEnqFDVYrVD7DL/nyL
         4nq2VxcIiYr0DwoorRZFtbz3i87HElvXA5iEZJR4TVTv1iYx7hTBh+UAob98uNHAX1/q
         Vcqa7IG8x2ra/bYZDaITRern7of29Sw+1Lqgb43wRRvXNPIUQESxV1b7OynoymnFl5yQ
         HayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IL2rkbkznTMAbewTR/VDL+rxBhYBQdQrPZVmFw8rwM4=;
        b=Xy+bbct7ImZM30Khgc+UO7KjbM75Oca94OxILtnZVQskoH9V9FKCEAKnXrx/BUIZdc
         UTeCL8g55KaQf9M5xhYfPqSyqzVWkR+F2Yo9NjDDNSyC5y/vcrDD1adMIKGZKd6f4fK2
         mIcmjSwqoQTifR4CVEBjpUKpyQAUKqHh+ea8O4o9+QbyA+srYsEpVsXmf1x6Tyi5Id3K
         5bwiOSzxc62Cs9FUps+ichLG9ET1S+O0NOSeHPcKggOFtzUlJZK/ymjeiXZM/lPCRBPD
         sheD4iSij9AIxXrPlRYkiJ245WSpxy/oVb0NyOF85bX5gWcypjyjKS2Xa1aixCag3ptz
         oW3A==
X-Gm-Message-State: AOAM53096W4PKeIkXDviWfydGOmfLijdzHMczZMMdqwCMoYV+RqbZ/No
	jVQ0UCaejXR4tZ8F7icwWBxJydc+qzl94l34
X-Google-Smtp-Source: 
 ABdhPJzr5Bz1LDQ7QvSlHYgL4xf5qfnnyToms2Sw2/UNrOnUdDDzhQ8v7JaJxrfsu1mqjE9lwGdR0Q==
X-Received: by 2002:a05:6a00:1513:: with SMTP id
 q19mr5014304pfu.12.1644946126776;
        Tue, 15 Feb 2022 09:28:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c13sm628309pfi.177.2022.02.15.09.28.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 09:28:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/20] Pull request (cover letter only)
Date: Tue, 15 Feb 2022 07:28:34 -1000
Message-Id: <cover.1644946036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 17:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161757

The following changes since commit f3be01483b01c88f8c4ba24ca73ccf1bcc33665c:

  build-appliance-image: Update to dunfell head revision (2022-01-27 16:16:08 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  libusb1: correct SRC_URI

Joshua Watt (5):
  tzdata: Remove BSD License specifier
  e2fsprogs: Use specific BSD license variant
  glib-2.0: Use specific BSD license variant
  shadow: Use specific BSD license variant
  libcap: Use specific BSD license variant

Marek Vasut (1):
  binutils: Backport Include members in the variable table used when
    resolving DW_AT_specification tags.

Marta Rybczynska (2):
  grub: add a fix for CVE-2020-25632
  grub: add a fix for CVE-2020-25647

Minjae Kim (1):
  ghostscript: fix CVE-2021-45949

Peter Kjellerstedt (1):
  sstate: A third fix for for touching files inside pseudo

Purushottam Choudhary (1):
  systemd: Fix CVE-2021-3997

Ranjitsinh Rathod (1):
  util-linux: Fix for CVE-2021-3995 and CVE-2021-3996

Ross Burton (2):
  lsof: correct LICENSE
  shadow-sysroot: sync license with shadow

Rudolf J Streif (1):
  linux-firmware: Add CLM blob to linux-firmware-bcm4373 package

Steve Sakoman (4):
  glibc: update to lastest 2.31 release HEAD
  expat: fix CVE-2022-23852
  expat: add missing Upstream-status, CVE tag and sign-off to
    CVE-2021-46143.patch
  common-licenses: add Spencer-94

 meta/classes/sstate.bbclass                   |  14 +-
 meta/files/common-licenses/Spencer-94         |  12 +
 .../grub/files/CVE-2020-25632.patch           |  90 +++++
 .../grub/files/CVE-2020-25647.patch           | 119 +++++++
 meta/recipes-bsp/grub/grub2.inc               |   2 +
 .../expat/expat/CVE-2021-46143.patch          |   6 +
 .../expat/expat/CVE-2022-23852.patch          |  33 ++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 .../systemd/systemd/CVE-2021-3997-1.patch     |  65 ++++
 .../systemd/systemd/CVE-2021-3997-2.patch     | 101 ++++++
 .../systemd/systemd/CVE-2021-3997-3.patch     | 266 +++++++++++++++
 ...-fsync-after-removing-directory-tree.patch |  35 ++
 ...children-split-out-body-of-directory.patch | 318 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
 .../util-linux/util-linux/CVE-2021-3995.patch | 139 ++++++++
 .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++
 ...ude-strutils-cleanup-strto-functions.patch | 270 +++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   3 +
 .../binutils/binutils-2.34.inc                |   1 +
 ...in-the-variable-table-used-when-reso.patch |  32 ++
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
 .../ghostscript/CVE-2021-45949.patch          |  65 ++++
 ...tack-limits-after-function-evalution.patch |  51 +++
 .../ghostscript/ghostscript_9.52.bb           |   2 +
 meta/recipes-extended/lsof/lsof_4.91.bb       |   2 +-
 .../shadow/shadow-sysroot_4.6.bb              |   2 +-
 meta/recipes-extended/shadow/shadow.inc       |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   2 +-
 .../linux-firmware/linux-firmware_20211216.bb |   1 +
 meta/recipes-support/libcap/libcap_2.32.bb    |   2 +-
 meta/recipes-support/libusb/libusb1_1.0.22.bb |   4 +-
 34 files changed, 1863 insertions(+), 15 deletions(-)
 create mode 100644 meta/files/common-licenses/Spencer-94
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
 create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
 create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch

-- 
2.25.1


