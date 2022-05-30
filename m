Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645C0C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31651.1653878168927618706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GPNDHRV0;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878169; x=1685414169;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wk+UIwIkMF+EoQ2dV0oh4MKD+bJcxGPEEhAIYu9u2PI=;
  b=GPNDHRV0QSAFdDi66miTbwvtYQRkjX9lU0+BOWA7riEa8yZHeIS8EHD/
   cEWC7Xe/ES39OFEgav7pkxi6lg+hdxHD+bqirTSe6SJkOqCke5PGNIZ6i
   neXPYIjnssUJj0g0COYfsnd0b9sdFJmwcW5AmrCj1OoU5g3pm9nssfh14
   2a1XQe+E7/XLfkzGHAhsfl8yusi3i2zAmaEMZXxVAjxyJB2jppaW0Bzcr
   /QNfEJ+sfXJhYeS10oArdny1ERwQ7VRkHoZUboyhK4ZszuO94QzMSON5K
   mhpeCwGWpDE/lrSyKX8CJzDwUThqcolWn7LQel9c5Ni38AaoeSP8XQlpJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876408"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876408"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313484"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/12] Patch review
Date: Mon, 30 May 2022 10:35:50 +0800
Message-Id: <cover.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166244

Next set of changes for honister. Please review. 

No problems seen while testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3722

Thanks,

Anuj

The following changes since commit e0d5d93a18d1682f3393fc10133f08009f008601:

  perf: sort-pmuevents: allow for additional type qualifiers and storage class (2022-05-10 21:44:32 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Bruce Ashfield (6):
  linux-yocto/5.10: features/security: Move x86_64 configs to separate
    file
  linux-yocto/5.10: update to v5.10.110
  linux-yocto/5.10: base: enable kernel crypto userspace API
  linux-yocto/5.10: update to v5.10.112
  linux-yocto: enable powerpc debug fragment
  linux-yocto/5.10: update to v5.10.113

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20220411 -> 20220509

Felix Moessbauer (1):
  wic/plugins/rootfs: Fix permissions when splitting rootfs folders
    across partitions

Khem Raj (1):
  linux-yocto: Enable powerpc-debug fragment for ppc64 LE

Ovidiu Panait (1):
  openssl: upgrade 1.1.1l -> 1.1.1n

Ranjitsinh Rathod (1):
  openssl: Minor security upgrade 1.1.1n to 1.1.1o

Richard Purdie (1):
  vim: Upgrade 8.2.4681 -> 8.2.4912

 .../{openssl_1.1.1l.bb => openssl_1.1.1o.bb}  |  3 ++-
 ...20220411.bb => linux-firmware_20220509.bb} |  4 +--
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 27 ++++++++++---------
 meta/recipes-support/vim/vim.inc              |  4 +--
 scripts/lib/wic/plugins/source/rootfs.py      |  5 +++-
 7 files changed, 32 insertions(+), 25 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1o.bb} (98%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)

-- 
2.35.3


