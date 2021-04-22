Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.6274.1619053975395531649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: cwgWDFepWzIJGglcUC171ozxMKDtqDYl5U7x7t4ckerzjSLpucewp4U5mbbrWNll9f/4nhG37K
 2ac0VN/YsBHw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="192618819"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="192618819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:12:55 -0700
IronPort-SDR: RZpnHTbbNty2yoCMFAHuzfM58zfVfvxCDviTxcoqdXvk/QBL/7TKQotQ5fDfqrbnVATD/ABjDt
 jU+8rJvZxfcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573647"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:12:54 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] oeqa/manual/bsp-hw.json :remove Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test
Date: Thu, 22 Apr 2021 09:11:43 +0800
Message-Id: <20210422011144.58491-5-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210422011144.58491-1-jay.shen.teoh@intel.com>
References: <20210422011144.58491-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove the Check_if_RTC_(Real_Time_Clock)_can_work_correctly test as it was replaced by the new automated runtime oeqa/runtime/cases/rtc.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 34 --------------------------------
 1 file changed, 34 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index bd61cf2c79..48e8fe48e1 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -623,40 +623,6 @@
             "summary": "Check_if_watchdog_can_reset_the_target_system"
         }
     },
-    {
-        "test": {
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
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.System_can_boot_up_via_NFS",
-- 
2.29.0

