Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nqrzwf+g3605QoZ7BHXoF+XuW38so/nKOFTmS3bqK++WvPSWilfZs+VxrR1bTD0iqdc9LTI/1P
 tSWWoBpOU+RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720000"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:28 -0800
IronPort-SDR: TA/jG/p+rtk2ZqH+5AYvOSXvtH7vfnRYaCTUfnTiKNNZx7ONRdr2g7UxiTzYjp8WnK2iJK/XS6
 5WacjHNPgKXg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802971"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/19] oeqa/core/context: initialize _run_end_time
Date: Tue, 17 Nov 2020 23:35:59 +0800
Message-Id: <a91308482e1bb524df413d4342a9ebb472314663.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

with _run_start_time as value. For partial results of interrupted runs,
this info might be otherwise missing for at least one testcase

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c5e8baf57fa2a33b9ef507b11d9ea9acaa77238)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/core/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 84b43a93e1..2abe353d27 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -85,6 +85,7 @@ class OETestContext(object):
         self.skipTests(skips)
 
         self._run_start_time = time.time()
+        self._run_end_time = self._run_start_time
         if not processes:
             self.runner.buffer = True
         result = self.runner.run(self.prepareSuite(self.suites, processes))
-- 
2.28.0

