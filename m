Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B42DC001B0
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 06:59:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.21828.1688367555821990311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 23:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Brn7XvO0;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688367556; x=1719903556;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HwPD/l0Tjz6qAonwenYvp1N8FLqOcV1Zqp73o98C+0c=;
  b=Brn7XvO0kikfab+NL/09kq+SxTkH0Y9oO2+HASjCKZt/DbtkhjzKjrFF
   zpC1G7xYpUHY1tm8qXWmRWVmAPsiXPWOEY4586Ystdwu3zS/Sb04WGaxC
   FK2oF0n7wxAbrSCaIJQbPH1U5CNQM/jdHsdI8hmbMc+zMAcc62vonCZt/
   9dAOpr+0dJ2jyGUbSDw+lWdIEaJWudR75IejgzcD6hAGNTJSezx/dyk5S
   TCkk+00bNAXlIyELpVLr3AWisxem83P5VBRJeIg6H1S+k/Qim5aEWreq/
   0hH2JS2WB4j3kFK+mRNgBYCGjdujfqUxhjdG1eGjQ/c0v4X/nJeI7fq4I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="366292413"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="366292413"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 23:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695713957"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="695713957"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 23:59:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sqlite3: upgrade 3.41.2 -> 3.42.0
Date: Mon,  3 Jul 2023 14:59:09 +0800
Message-ID: <20230703065909.45555-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703065909.45555-1-anuj.mittal@intel.com>
References: <20230703065909.45555-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 06:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183796

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.41.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.42.0.bb
index b09e8e7f55..f60aca63d2 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499"
+SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.41.0


