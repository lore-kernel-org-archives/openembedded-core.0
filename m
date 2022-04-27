Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC06AC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 13:38:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.8254.1651066688917355988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 06:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MSL8jt5D;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651066688; x=1682602688;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SaUmq2bO27IoXKzASwOIaSYL0G3e5EnpDrtqpEHg7sk=;
  b=MSL8jt5DmTJwQO13sdFv7by1eair20kqV5I8AEw49VrY7fE8j6oMcXFw
   mRaX3iLUK7Ve+TEx7AQHSV4maeOxoXqfIkKilVPLZjwBosPVb3OwFBrM7
   UZ9n2CCckLunONc3JgcFBYmCkqTmVjzpTpiTnWny11R9WeLkDkoefNyct
   g9H0cs65eqrc4rHqakw/MW8mVP9NGlgSWmNARPrNRyMdJ6o9Thw0nqTsN
   6MfiDrF/zB0bY7R0sXCItMe7fwpqQi/v6V3U5ezihORwxM61c2q588HD3
   Uo8sChkDM+Z7Oy39Bd5b3dY6IAMbhluwu7aK5hlVI9rK93b5P58B78jsV
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="266089951"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400";
   d="scan'208";a="266089951"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 06:37:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400";
   d="scan'208";a="540030457"
Received: from ckok5-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.252.101])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 06:37:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/7] Pull request
Date: Wed, 27 Apr 2022 21:37:50 +0800
Message-Id: <cover.1651066557.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 13:38:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164923

The following changes since commit 4c556b4fd07a3ce9128019b51e5623e8eeeb7400:

  license_image.bbclass: close package.manifest file (2022-04-19 22:22:49 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Dmitry Baryshkov (1):
  linux-firmware: correct license for ar3k firmware

Konrad Weihmann (1):
  gmp: add missing COPYINGv3

Peter Kjellerstedt (1):
  u-boot: Inherit pkgconfig

Richard Purdie (2):
  alsa-tools: Ensure we install correctly
  shadow-native: Simplify and fix syslog disable patch

wangmy (1):
  linux-firmware: upgrade 20220310 -> 20220411

zhengruoqin (1):
  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08

 meta/recipes-bsp/u-boot/u-boot-common.inc     |   3 +
 ...01-Disable-use-of-syslog-for-sysroot.patch | 150 +++++-------------
 ...20220310.bb => linux-firmware_20220411.bb} |   8 +-
 ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
 .../alsa/alsa-tools_1.2.5.bb                  |   1 +
 meta/recipes-support/gmp/gmp_6.2.1.bb         |   8 +-
 6 files changed, 53 insertions(+), 119 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

-- 
2.35.1


