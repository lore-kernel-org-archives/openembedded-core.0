Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.11262.1604052602636446637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 03:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: MCP74favFEByC0QYibeufHB+w/YKx2aewoiqsQTaNkKcDee/X5aGANoJhmKo9MU1aP8NXpozQB
 4QIOWDc+bxVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="156361287"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="156361287"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 03:10:01 -0700
IronPort-SDR: FAKQy5NT48gUehiltDo+YS9elykv3vLo7n0fjZJKyNZy9W+Hb9xQ1qZ0uWuCSblb11BEsodLuK
 1nq/4uoi/SpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
   d="scan'208";a="304719415"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2020 03:10:00 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bluez5: update to 5.55
Date: Fri, 30 Oct 2020 18:09:58 +0800
Message-Id: <20201030100959.14262-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Chee Yang Lee <chee.yang.lee@intel.com>

Release note:
https://github.com/bluez/bluez/commit/5a180f2ec9edfacafd95e5fed20d36fe8e077f07

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.54.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 260eee1402..8190924562 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
-SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
+SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
+SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.17.1

