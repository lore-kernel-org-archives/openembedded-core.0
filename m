Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.6367.1619053991574019862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: z7Lv/jgilIpKWOnLFA9FSnhwprrDwsic8mXlr+8ESKJ96nFcWrGOgNKWbowp4GjmNMEif11cE4
 cloEnWDNRElw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="216464971"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="216464971"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:13:11 -0700
IronPort-SDR: dB4/lfxYQb4syw2Pup6HfvPbRCRAmHwxMfw+jVoi2Zj/ykP1HVnBU1u8/G7o8Ja99Q8xVxwj8g
 TSaDZDk8qJoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573744"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:13:10 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] oeqa/manual/bsp-hw.json : remove Test_if_usb_hid_device_works_well_after_resume_from_suspend_state manual test
Date: Thu, 22 Apr 2021 09:11:44 +0800
Message-Id: <20210422011144.58491-6-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210422011144.58491-1-jay.shen.teoh@intel.com>
References: <20210422011144.58491-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove the Test_if_usb_hid_device_works_well_after_resume_from_suspend_state test as it was replaced by the new automated runtime oeqa/runtime/cases/usb_hid.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 48e8fe48e1..ca91987e31 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -141,36 +141,6 @@
             "summary": "check_CPU_utilization_after_standby"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.Test_if_usb_hid_device_works_well_after_resume_from_suspend_state",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system and launch terminal",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "echo \"mem\" > /sys/power/state",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "After system go into S3 mode, resume the device by pressing the power button or using HID devices",
-                    "expected_results": "Devices resumes "
-                },
-                "4": {
-                    "action": "check usb mouse and keyboard",
-                    "expected_results": "Usb mouse and keyboard should work"
-                }
-            },
-            "summary": "Test_if_usb_hid_device_works_well_after_resume_from_suspend_state"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.Add_multiple_files_in_media_player",
-- 
2.29.0

