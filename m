Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3271BC5518D
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.9329.1650638288420887719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 07:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RfQatU9T;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650638288; x=1682174288;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QK/o++gGuosxBMvasSJ1VVk9hr+bPO+zKc4HjID7R4c=;
  b=RfQatU9TkcxDvA9R9i2Od2k7mBQK7Tiy81XK9bj+hiprzeUWs8HNT//M
   +qkmIT71OdcGWPwIXGbSNvR+kWXnmQAtmBpCq9FDpgUcFrJFx0Kz5/5EN
   JrJBKoVphbtF+SWRviVSpoO+VlC70USgWadUssOgK47ZB/9Rpi3GjIQQX
   gz++7DB7WMymSpEtLWAdCr/C1FOs46RZVtV8MrBrtmcxFCRYBjmxVH1mQ
   bIBD0WbjbHHrI0sLF6roF+oZZm4nkscej9+aWiEdQ/A4ldBdl5+tEd2CF
   29B+mDvAa9CbXpKm0gXlguJl6/UeLer6MVV41I5XvDFZUSP+s1N0DoT5T
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351126080"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400";
   d="scan'208";a="351126080"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:38:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400";
   d="scan'208";a="728539897"
Received: from zhucx-mobl2.ccr.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.146.67])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 07:38:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/11] Pull request (cover letter only)
Date: Fri, 22 Apr 2022 22:38:00 +0800
Message-Id: <cover.1650638184.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164795

The following changes since commit 75e47b96d8cf82ec4a7fa3225c7fbb5b6ab62b02:

  webkitgtk: update to 2.32.4 (2022-04-07 14:40:14 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Alexandre Belloni (1):
  pseudo: Fix handling of absolute links

Bruce Ashfield (1):
  linux-yocto/5.10: update to v5.10.109

Joe Slater (1):
  unzip: fix CVE-2021-4217

Martin Jansa (1):
  license_image.bbclass: close package.manifest file

Ralph Siemsen (1):
  xz: fix CVE-2022-1271

Richard Purdie (6):
  scripts/runqemu: Fix memory limits for qemux86-64
  vim: Upgrade 8.2.4524 -> 8.2.4681
  uninative: Upgrade to 3.6 with gcc 12 support
  tiff: Add marker for CVE-2022-1056 being fixed
  externalsrc/devtool: Fix to work with fixed export funcition flags
    handling
  libxshmfence: Correct LICENSE to HPND

 .../recipeutils/recipeutils-test_1.2.bb       |  2 +-
 meta/classes/externalsrc.bbclass              | 19 ++--
 meta/classes/license_image.bbclass            |  4 +-
 meta/conf/distro/include/yocto-uninative.inc  |  8 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../unzip/unzip/CVE-2021-4217.patch           | 67 +++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 .../xz/xz/CVE-2022-1271.patch                 | 96 +++++++++++++++++++
 meta/recipes-extended/xz/xz_5.2.5.bb          |  4 +-
 .../xorg-lib/libxshmfence_1.3.bb              |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++---
 ...ue-380-and-382-heap-buffer-overflow-.patch |  1 +
 meta/recipes-support/vim/vim.inc              |  6 +-
 scripts/runqemu                               |  2 +-
 16 files changed, 210 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
 create mode 100644 meta/recipes-extended/xz/xz/CVE-2022-1271.patch

-- 
2.35.1


