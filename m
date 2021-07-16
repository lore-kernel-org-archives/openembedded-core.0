Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.1408.1626403354267165559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494554"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075383"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/28] oeqa/selftest/runcmd: Tweal test timeouts
Date: Fri, 16 Jul 2021 10:41:59 +0800
Message-Id: <a6a83f9a25a2b4659640b35cb0bd9e3fcc6435ee.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Load on the autobuilder meant we see occasionaly timeout issues with these tests.
Slightly increase the test timeouts to better reflect the real world timings we
see.

[YOCTO #14262]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fccd2ade0e345625ed9a4b74a7431b000ce2214f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index fa6113d7fa..e9612389fe 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -27,8 +27,8 @@ class RunCmdTests(OESelftestTestCase):
 
     # The delta is intentionally smaller than the timeout, to detect cases where
     # we incorrectly apply the timeout more than once.
-    TIMEOUT = 5
-    DELTA = 3
+    TIMEOUT = 10
+    DELTA = 8
 
     def test_result_okay(self):
         result = runCmd("true")
-- 
2.31.1

