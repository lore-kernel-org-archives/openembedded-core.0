Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473AAC4707E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.3151.1650419968347044990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cpDqTjbN;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419968; x=1681955968;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5KwWlASRNx33aWpbB7wz8bWjm1GF60/SPtkrHgtiPO8=;
  b=cpDqTjbNbJxh+12CWrWbsEXo8DlV9j0JeUWotYXURDQbJ3Ot9uKRZ+Ku
   Z8QFWiQFaan3Ytr1zZ8onV/F4SVtzHViTCgFF7wqhj+KJwGPfGLv1Y5lO
   90ErRkLrP7UoJ6nYvdTnjEdMoLwTAvCxQy5qyreXoe4FV+b8CpZyKZVIo
   WuIn5QA0BoJ0iqY1sC89ROdfXPukuvS1LoSuWiWST481ha2d5gNHHNCa8
   WlnFU6L8aPK12SXhHmcNaW5ca8AdEDI9d8MOSzJnAbWoO3UHitAYf9pu7
   3gXKl/Wud0GWLqIu8FA3hrF0ZNh1qXtYNiFoYsRe7AYlhbBKCDSxZD91g
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364616"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364616"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071366"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:26 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/11] Patch review
Date: Wed, 20 Apr 2022 09:59:05 +0800
Message-Id: <cover.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164639

Next changes for honister. Please review.

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3544

Thanks,

Anuj

The following changes since commit 75e47b96d8cf82ec4a7fa3225c7fbb5b6ab62b02:

  webkitgtk: update to 2.32.4 (2022-04-07 14:40:14 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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


