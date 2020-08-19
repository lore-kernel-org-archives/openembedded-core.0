Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.84971.1597827907310215009
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 02:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 3Ne/Luu6utgblNGsC5rjvxcrt3iiMbJLoTu588YouQYWV7JL0crw2q363OOFUWoSEYVp2btdpT
 C5D5X4We+xpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173121174"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="173121174"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 02:05:06 -0700
IronPort-SDR: xWCrD0sszHdr0JwfiHaaMOKxBs5ngtKKEaA1RGmXJeaR/q3dkkmdVKAQbsXqBCudwN/NA0Q3iC
 VtKYOanwsXOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="497687481"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2020 02:05:05 -0700
From: jay.shen.teoh@intel.com
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/manual/bsp-hw.json : remove shutdown_system test
Date: Wed, 19 Aug 2020 17:05:02 +0800
Message-Id: <1597827903-18579-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: TeohJayShen <jay.shen.teoh@intel.com>

remove the test as shutdown function is already being validated

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index a9bc7d4..08132c0 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -125,28 +125,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.shutdown_system",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "launch terminal and run \"shutdown -h now\" or \"poweroff\"",
-                    "expected_results": "System can be shutdown successfully . "
-                }
-            },
-            "summary": "shutdown_system"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.switch_among_multi_applications_and_desktop",
             "author": [
                 {
-- 
2.7.4

