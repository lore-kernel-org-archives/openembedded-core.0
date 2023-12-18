Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AD3C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bl1y88v1;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910852; x=1734446852;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1wUVLYeI2y7LGr3VvvRLf1b7+FjTrqNEdMdG6Gfa4s4=;
  b=bl1y88v1Ba9kemiEJyGofgp1LGekdB5qsq/GwFBS4cGexI+MHFU0R01N
   3JQQUoO42dNnCGB2FDjohSaiUCQXnNT+6u37BruBbe0xMcfWRGoPW3P4s
   aQzFODhFvxfqrEKVIJ+Ck+vbm+kHix5HqVaQojqD56bkkMylxv8p3N9x5
   /WHukaalgJ3m+ck9X5vhZM+MK+UUDa//A63/B733xJxevF33EQrWZ3ZSv
   +VCW/S3B9e17+qKCKzsbq+LUS9sPwhY2QsM1F2qWlWFH1wESCVlIMfKYN
   OQfJi3jKujsgjnh58+ceCYl0baro913FzmqGykLtjuU/DmTOENOq9A/dv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350860"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802873"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] sqlite3: upgrade 3.44.0 -> 3.44.2
Date: Mon, 18 Dec 2023 22:47:16 +0800
Message-ID: <20231218144724.7794-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192646

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.44.0.bb => sqlite3_3.44.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.44.0.bb => sqlite3_3.44.2.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.44.0.bb b/meta/recipes-support/sqlite/sqlite3_3.44.2.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.44.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.44.2.bb
index d4981548890..459884a5581 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.44.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.44.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "b9cd386e7cd22af6e0d2a0f06d0404951e1bef109e42ea06cc0450e10cd15550"
+SRC_URI[sha256sum] = "1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.43.0


