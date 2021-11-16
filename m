Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F79C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.383.1637080346426941201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319941121"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="319941121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956798"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/17] scripts/lib/wic/help.py: Update Fedora
 Kickstart URLs
Date: Wed, 17 Nov 2021 00:31:55 +0800
Message-Id: 
 <4878c1180dc6df7012ae28afd9a84645cc094c0b.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158357

From: Jon Mason <jdmason@kudzu.us>

The URLs describing Kickstart are no longer valid and do not redirect to
the correct location.  Update them with the correct location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5ac75f93c8128b0761af5fee99e8603ddd1657d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/help.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991907d3f5..4ff7470a6a 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -840,8 +840,8 @@ DESCRIPTION
     meanings. The commands are based on the Fedora kickstart
     documentation but with modifications to reflect wic capabilities.
 
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#part-or-partition
+      https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html#bootloader
 
   Commands
 
-- 
2.33.1


