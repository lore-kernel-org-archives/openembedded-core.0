Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48880C61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Xy6gf/LN;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530503; x=1732066503;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7FGsA0m763zAUgR3nqy0kXUODxTUW5wZvx4VtPbd71U=;
  b=Xy6gf/LNlfe0GyQUGJs8M3O72XPF5WrulTdGID9d0xT3jLTMXGxai0Ah
   fyshth523mi2KxelDKvqyQB4dmx4QnPIz5pevbEpYBmEpOBjbgtRqhsJ2
   DbYim9U1vMe/nAEZuvv9gtUEY469k9fnywhXZSpVnWVVfaxqTOMfIWY8/
   lYw3M1lXF6wsM6Pa/e1snJhbhYNH5bYotUDnyhvpxopMSPLl1lzu+L37+
   qWP9aS1kLkwTxM5rFLy8gkfgztHJbcfQt9Nde7iI+dn5mvXr+ZgN82MZR
   YPVa/FyLyrKrtwLbrg6l4r1vg4SVuObRNPrYY+KiJHUr9KfCM1ZtiqGUw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584388"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584388"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952189"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952189"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:35:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] sqlite3: upgrade 3.43.2 -> 3.44.0
Date: Tue, 21 Nov 2023 09:34:47 +0800
Message-ID: <20231121013448.8478-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190949

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/{sqlite3_3.43.2.bb => sqlite3_3.44.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.2.bb => sqlite3_3.44.0.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb b/meta/recipes-support/sqlite/sqlite3_3.44.0.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.44.0.bb
index 64c10136253..d4981548890 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.44.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
+SRC_URI[sha256sum] = "b9cd386e7cd22af6e0d2a0f06d0404951e1bef109e42ea06cc0450e10cd15550"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.42.0


