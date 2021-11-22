Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2DEC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:34:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.3862.1637570053453876204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="232231986"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="232231986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800";
   d="scan'208";a="508448606"
Received: from amohdwah-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.176])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:34:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/5] Review request
Date: Mon, 22 Nov 2021 16:34:01 +0800
Message-Id: <cover.1637569916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 08:34:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158554

Please review these changes. No issues seen while testing on
autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2940

Thanks,

Anuj

The following changes since commit 9f3fbfc02ae6fadffbcc1bda1fa75dfe140d05c5:

  insane.bbclass: Add a check for directories that are expected to be empty (2021-11-16 13:09:56 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Andres Beltran (1):
  create-spdx: Fix key errors in do_create_runtime_spdx

Claus Stovgaard (1):
  cups: Fix missing installation of cups sysv init scripts

Richard Purdie (1):
  glibc: Backport fix for CVE-2021-43396

Saul Wold (2):
  create_spdx: ensure is_work_shared() is unique
  create-spdx: Protect against None from LICENSE_PATH

 meta/classes/create-spdx.bbclass              |  18 +-
 .../glibc/glibc/CVE-2021-43396.patch          | 184 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   1 +
 meta/recipes-extended/cups/cups.inc           |   2 +-
 4 files changed, 195 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-43396.patch

-- 
2.33.1


