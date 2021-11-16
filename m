Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD819C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.378.1637080325948614472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214448455"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="214448455"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:06 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956657"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/17] avahi: update CVE id fixed by
 local-ping.patch
Date: Wed, 17 Nov 2021 00:31:42 +0800
Message-Id: 
 <efb82a8e56c9af7846b391a031511ab60d12ced4.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158349

From: Chen Qi <Qi.Chen@windriver.com>

CVE-2021-36217 is treated as a duplicate of CVE-2021-3502.
Update the local-ping.patch to mark it resolve both.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d75d6c39f1faeb38191b55f1fa9311b63fcfb29)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/avahi/files/local-ping.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
index 94116ad1f3..29c192d296 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2021-36217
+CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.33.1


