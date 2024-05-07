Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1976C25B10
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=idGSrJWk;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048601; x=1746584601;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Njdrqdy10GpucNUTrr8JMNKiKV6Glew0v04Z0FnI5dA=;
  b=idGSrJWkw2Lnpi5DbRgkC1A/Q+/vJDpob3U5NIHMf9kbVhWt4LIWAg8n
   f6s3c/Jvbj2jrrNVpdO4aFCiYDG8iu3xoaFK8gjgDlEqj/BJ2v6EzffbN
   VBVJNAKkCooG1FS0XLTv53nNqeEWR7paFaBwXvyIGbLb+dp1LfAlSpaso
   8Y4gbEMufGIuclyBTQMhJH6SCoQuW+vDh4U6llalwWQzaWBQ/3s7u+1Ib
   UxacGH+u36kRMnOq6nlhPiITIp/AIMRXEBtnlX0wp+tqgebSRCalu9hTM
   fo7ubgSFsyrZyNzFYeU9Fr01SrSsufgOo2uY+5Qos2KKXIPxoSNlWqq2O
   A==;
X-CSE-ConnectionGUID: Qm68IztUSTmxbHTc2hYMaQ==
X-CSE-MsgGUID: ts75vs08Sq+W6kOZHBkoqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432122"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432122"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:21 -0700
X-CSE-ConnectionGUID: WhQJZXa8QJuh+kwVMBUKqA==
X-CSE-MsgGUID: GWq3bZbZTvqrAZDSkpJECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445795"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] sqlite3: upgrade 3.45.1 -> 3.45.3
Date: Tue,  7 May 2024 10:23:08 +0800
Message-ID: <20240507022308.13637-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199063

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.45.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 50612feb25b..03d70bbd386 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a"
+SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.45.0


