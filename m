Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB82C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.19862.1644224862709838208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Q5jGnI8W;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224863; x=1675760863;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c0amuXMW0FHHic2WahfELhYpYTybOdS++cuMrr4IgZE=;
  b=Q5jGnI8WJORw8GVe6xg/6ZU8PckacAn+MbIyBecXk7aB1VSSlBXHCX+a
   prdeO4d5fztVRRVFPbWctmCoWuiITcIH4FGWQ79fiPfxfZkI8IPwqKDW6
   tYh5yQt6W6PQVf2qHt0xoXHL+NQHWkmTDEAFeEw4e87I1kFcwn4bNeyqq
   DAlkEcwbnqTvlf1anUzHVX6gDOlclbr4YcHCE5dHMTLayGnlkH+J05OXU
   4iZiDYv4GViIqYj3qnWTkG9k+Nu7GmxOzoOkgETMKLKsbnnt3UtMAsKzF
   ma3iuwjPg3XApZVM5oIJZkuiwQEBGUbK/pz3V0R6tR6QcMKeGRcEDjGnd
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228646862"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="228646862"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140371"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/12] Patch review
Date: Mon,  7 Feb 2022 17:06:50 +0800
Message-Id: <cover.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161455

Next set of changes for hardknott. Please review.

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3196

Thanks,

Anuj

The following changes since commit d54d7e7b43da621be8e6fcca34feb7b3d49b8160:

  lighttpd: backport a fix for CVE-2022-22707 (2022-01-26 11:40:00 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  libusb1: correct SRC_URI

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.92
  linux-yocto/5.10: update to v5.10.93

Peter Kjellerstedt (1):
  sstate: A third fix for for touching files inside pseudo

Ross Burton (1):
  yocto-check-layer: add debug output for the layers that were found

Rudolf J Streif (1):
  linux-firmware: Add CLM blob to linux-firmware-bcm4373 package

Sakib Sajal (4):
  qemu: fix CVE-2021-3713
  qemu: fix CVE-2021-3748
  qemu: fix CVE-2021-3930
  qemu: fix CVE-2021-20196

Steve Sakoman (2):
  expat: fix CVE-2022-23852
  expat: add missing Upstream-status, CVE tag and sign-off to
    CVE-2021-46143.patch

 meta/classes/sstate.bbclass                   |  14 +-
 .../expat/expat/CVE-2021-46143.patch          |   6 +
 .../expat/expat/CVE-2022-23852.patch          |  33 +++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2021-20196_1.patch          |  54 ++++++++
 .../qemu/qemu/CVE-2021-20196_2.patch          |  67 +++++++++
 .../qemu/qemu/CVE-2021-3713.patch             |  68 ++++++++++
 .../qemu/qemu/CVE-2021-3748.patch             | 127 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3930.patch             |  53 ++++++++
 .../linux-firmware/linux-firmware_20211216.bb |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 ++--
 meta/recipes-support/libusb/libusb1_1.0.24.bb |   6 +-
 scripts/yocto-check-layer                     |  13 ++
 16 files changed, 460 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3713.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch

-- 
2.34.1


