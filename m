Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.3574.1603856435817441202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 20:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 1KDhs23a/f24hx+l+ZtHni0i7cJh8Q1gX3m5eVLs8U8jY9rzehJz+0HBXzBc7/0o8kMpsWEOfl
 Yc1gUJMCXBRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168328230"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; 
   d="scan'208";a="168328230"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 20:40:33 -0700
IronPort-SDR: 88foahXIL1MRLgu1wdNF5uRXWuwOAH5/dJj6S3HoXuI1k2lPA2bu83FFpkFRDfxV7nbgl5dOI3
 xvW167UsXlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; 
   d="scan'208";a="350844945"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2020 20:40:32 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/manual/bsp-hw.json : removal of Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test because of automated
Date: Wed, 28 Oct 2020 11:40:27 +0800
Message-Id: <1603856427-62304-2-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
References: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

removing Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test as this function is now tested by rtc.py automated runtime test

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 790c0c0..b50b4c2 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -817,40 +817,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.Check_if_RTC_(Real_Time_Clock)_can_work_correctly",
-            "author": [
-                {
-                    "email": "yi.zhao@windriver.com",
-                    "name": "yi.zhao@windriver.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Read time from RTC registers.  root@localhost:/root> hwclock -r  Sun Mar 22 04:05:47 1970 -0.001948 seconds ",
-                    "expected_results": "Can read and set the time from RTC.\n"
-                },
-                "2": {
-                    "action": "Set system current time  root@localhost:/root> date 062309452008 ",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Synchronize the system current time to RTC registers  root@localhost:/root> hwclock -w ",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Read time from RTC registers  root@localhost:/root> hwclock -r ",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Reboot target and read time from RTC again\n",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Check_if_RTC_(Real_Time_Clock)_can_work_correctly"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.System_can_boot_up_via_NFS",
             "author": [
                 {
-- 
2.7.4

