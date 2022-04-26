Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAEAC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.1726.1650941652560455819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=b1//Lrzb;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941652; x=1682477652;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vpEGp0ghpWYvh1jQWR6f1TDFvSxla9EPiqCeRV7OjXk=;
  b=b1//LrzbGDh+wTmvhJKF1FjDI6B6Sl8vglHyOswqGPGEE1lvq7IElr3+
   5T9NiOMUadsaVW9w2gF/crnppL/E3FckPYlJVqNGldUoKZFqjYk5p1RO7
   r1a7BOICIMRAHLj67RwGSDLdB5GQYpL88hUOLp5GKYjhRVkmt5OeJpJaW
   lvNVkI30TtS76fIiqIfLgHksweObl0vthP97+ysFS0kOx751Nw7gn+0A5
   9X+ZzwipoYg8fLE6Q/QSBrNRsEvENiyHbBmo+ysF9xE/gkRPzN5Dxg3+r
   QQS5CpO0hH9kDTT7vWCkLuNVBdKRpOhL6TekPxyswY1WcCj4O8yRNvZuv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950945"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439775"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/7] Patch review
Date: Tue, 26 Apr 2022 10:53:58 +0800
Message-Id: <cover.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164847

Last set of patches for honister before 3.4.4. Please review.

No problems seen while testing:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3565

Thanks,

Anuj

The following changes since commit 4c556b4fd07a3ce9128019b51e5623e8eeeb7400:

  license_image.bbclass: close package.manifest file (2022-04-19 22:22:49 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

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


