Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EF5CF5369
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:34:51 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7679.1729686884345013726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a148/dTo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cf6eea3c0so55441715ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686883; x=1730291683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSfb2BNXrqF0c1Lfhj5epc18wkPQVEEiAbgPzRvi41A=;
        b=a148/dTowRw04p8J6DzCQp/GaPjIQXwQDiPWZZePagcQSKiItzCrdpBlZWi4SDxBp2
         pdYGeQGywLxQwf9pgJBYBypsOMWkSCXEZHlVz5gIhdVSYkK7sJ0g7RSDRFCz81Y9s/i3
         3NJylojWFG/6Yc5CTqDruInl3Uop5DkRAWBKjS3F1aVki97ifRFhM2ZTl/kZ8Slvnt/y
         cOfCGM0dGx24tjCznmr/4Z3SnMp5NGiYSHGzeow6VY7qf/hH+uVHQ/zq9VVIj/q7hi+9
         +2Z9SUutVok+iixhNBqGK3bKDjlqiN5HhVcQepPdy1RfOUDEhQzQ6RlvWEkCvy0RKoiS
         QAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686883; x=1730291683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSfb2BNXrqF0c1Lfhj5epc18wkPQVEEiAbgPzRvi41A=;
        b=QzsI3e8e5yXNQ92HERxhGcYD8LT6Cx3Rs8Ehtr7sCKgjaAGYaKGDjiO3UlJcFBW0mn
         MzHlMaPpx2obrJMbfnRNQmLLCLDMOrIu0TH/1pEZYoV33ybftp8juPq82Y2I/XRSlSeE
         DokkO38Zk4TSVlSZIvhObmUxWkY2PPkAD176geLLsPyiBdBEshOpq/T0blnool0Re9lK
         hHGaRp82P3RbsdznUwqpDOtQpRQ5fbGw8BF3vGmK7xVrv96Qz8N9Vx/fIYxCQKPXzo+n
         VNzwufSf0sfcVmpXYbjoeUmmVBf9pfyrfoKQzittLNOTs3C0AVi5Rtqg7Fq3RdYd/oZn
         p/nw==
X-Gm-Message-State: AOJu0YzsArUBvu1KI7ZWgOkoQudCF5qVw8cbsI48E5BoJ3wV1rJmgHwD
	Uk3MTIEjvMkAPptqGjTZcIv33oUxy1VFiAWkPte+DY1VbJIX8yrb6JPtkoYR7ku9XEcOsZU3giT
	S
X-Google-Smtp-Source: AGHT+IHWY6UVoKanGKRSQqnjdTmYS5ak6ZZmZR+1+w85NdZr0+zvLOYOQ40xmM7o4hTLbG9ob4hIhw==
X-Received: by 2002:a17:903:98c:b0:203:a0ea:63c5 with SMTP id d9443c01a7336-20fa707442cmr30953335ad.0.1729686883365;
        Wed, 23 Oct 2024 05:34:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/27] Patch review
Date: Wed, 23 Oct 2024 05:34:08 -0700
Message-Id: <cover.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206211

Please review this set of changes for styhead and have comments back by
end of day Friday, October 25

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/313

The following changes since commit 0d0f3541552b073f3536176e2caf847bec24548d:

  oeqa/postactions: Fix archive retrieval from target (2024-09-20 16:00:20 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Bruce Ashfield (6):
  linux-yocto/6.6: update to v6.6.52
  linux-yocto/6.6: update to v6.6.54
  linux-yocto/6.10: update to v6.10.11
  linux-yocto/6.10: update to v6.10.12
  linux-yocto/6.10: update to v6.10.13
  linux-yocto/6.10: update to v6.10.14

Chen Qi (1):
  json-c: avoid ptest failure caused by valgrind

Daniel McGregor (1):
  libpam: use libdir in conditional

Deepthi Hemraj (1):
  glibc: stable 2.40 branch updates

Harish Sadineni (2):
  oeqa/selftest/gcc: Fix kex exchange identification error
  binutils: Add missing perl modules to RDEPENDS for nativsdk variant

Jonas Gorski (1):
  rootfs-postcommands.bbclass: make opkg status reproducible

Khem Raj (3):
  linux-yocto: Enable l2tp drivers when ptest featuee is on
  bluez: Fix mesh builds on musl
  qemu: Fix build on musl/riscv64

Niko Mauno (2):
  bitbake.conf: Mark VOLATILE_LOG_DIR as obsolete
  bitbake.conf: Mark VOLATILE_TMP_DIR as obsolete

Peter Kjellerstedt (1):
  image.bbclass: Drop support for ImageQAFailed exceptions in image_qa

Peter Marko (1):
  wpa-supplicant: Ignore CVE-2024-5290

Purushottam Choudhary (1):
  kmscube: Upgrade to latest revision

Richard Purdie (2):
  efi-bootdisk.wks: Increase overhead-factor to avoid test failures
  binutils: Fix binutils mingw packaging

Ross Burton (1):
  icu: update patch Upstream-Status

Sergei Zhmylev (1):
  lsb-release: fix Distro Codename shell escaping

Shunsuke Tokumoto (1):
  python3-setuptools: Add "python:setuptools" to CVE_PRODUCT

Wang Mingyu (2):
  git: upgrade 2.46.0 -> 2.46.1
  libevdev: upgrade 1.13.2 -> 1.13.3

 meta/classes-recipe/image.bbclass             |  15 +--
 .../rootfs-postcommands.bbclass               |   4 +
 meta/conf/bitbake.conf                        |   2 +
 meta/lib/oe/utils.py                          |  13 --
 meta/lib/oeqa/selftest/cases/gcc.py           |   2 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ove-local-basename-into-utility-file.patch | 114 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |   2 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-devtools/binutils/binutils.inc   |   2 +-
 .../binutils/binutils_2.43.1.bb               |   4 +
 .../git/{git_2.46.0.bb => git_2.46.1.bb}      |   2 +-
 meta/recipes-devtools/json-c/json-c/run-ptest |   2 +
 .../python/python3-setuptools_72.1.0.bb       |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/fix-strerrorname_np.patch       |  27 +++++
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   2 +-
 meta/recipes-extended/pam/libpam_1.6.1.bb     |   2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb  |   2 +-
 .../linux/linux-yocto-rt_6.10.bb              |   6 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.10.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |  30 ++---
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 ++---
 .../icu/icu/fix-install-manx.patch            |   4 +-
 ...{libevdev_1.13.2.bb => libevdev_1.13.3.bb} |   2 +-
 .../lib/wic/canned-wks/efi-bootdisk.wks.in    |   2 +-
 28 files changed, 216 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-mesh-Move-local-basename-into-utility-file.patch
 rename meta/recipes-devtools/git/{git_2.46.0.bb => git_2.46.1.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
 rename meta/recipes-support/libevdev/{libevdev_1.13.2.bb => libevdev_1.13.3.bb} (87%)

-- 
2.34.1


