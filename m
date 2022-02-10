Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27703C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 08:05:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.7491.1644480302997620758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 00:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kVKbV6fK;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644480303; x=1676016303;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=noRZ14LKzzFw+V4Gt/CQp+xroTJww3/96Bvumch7ops=;
  b=kVKbV6fKBMutysURRLFODA3YthDLmN+XfKIs1x3NjSlJiAmg8a4sw9jD
   uAtb5zZqtbi2tN6rJ36lxaDWCF5b/x+mSgdW82mqzvCeOCCijy4FaV9ez
   sISpesTco7mldJtZ4OZ9nHX6IJFw7cuqhHmtaAy3KZPqp1g4Er9IyxyPl
   IsTbeDgStszIbS4cT1BfptODRyRzQEhA7bFFmUW+TijtJQabWKwVnNbb+
   OQP9y27R3VMfIm3wmCY1/XTMrcXq1D4BrlToaO711E6y6yrdPWNJyRd1T
   c6HnOLrYdj698KPJT5DN8QmxP0EyvNiIN2OzNRZVCcEIS01KSTTHn1zb7
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="248269161"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600";
   d="scan'208";a="248269161"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 00:05:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600";
   d="scan'208";a="585880102"
Received: from cchong-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.237.102])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 00:05:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/12] Pull request (cover letter only)
Date: Thu, 10 Feb 2022 16:04:51 +0800
Message-Id: <cover.1644480182.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 08:05:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161601

The following changes since commit d54d7e7b43da621be8e6fcca34feb7b3d49b8160:

  lighttpd: backport a fix for CVE-2022-22707 (2022-01-26 11:40:00 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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


