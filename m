Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.6190.1619053943405099557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 6p/ZeYnetn3RSQMXTUy6y66peagIBVq8g8ZT+6byht+joUmsu4Ca99l+0Dm0HH1QE11ICFGIdj
 Vi1o1/nUTCtg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="175293530"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="175293530"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:12:22 -0700
IronPort-SDR: X3tztRCJZyQV1BolFfsNmjr7jRw9p5MKPeL3kWwwNS0jjd1s/rquKB1Qy0RHSA+tLwJUuKhaNr
 5SoFVz4SpPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573498"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:12:21 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] oeqa/manual/bsp-hw.json : remove standby and Test_if_LAN_device_works_well_after_resume_from_suspend_state manual test
Date: Thu, 22 Apr 2021 09:11:41 +0800
Message-Id: <20210422011144.58491-3-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210422011144.58491-1-jay.shen.teoh@intel.com>
References: <20210422011144.58491-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove standby and Test_if_LAN_device_works_well_after_resume_from_suspend_state test as they was replaced by the new automated runtime oeqa/runtime/cases/suspend.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 64 --------------------------------
 1 file changed, 64 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 0c13d116d6..5eceb741a5 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -111,40 +111,6 @@
             "summary": "connman_offline_mode_in_connman-gnome"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.standby",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system and launch terminal; check output of \"date\" and launch script \"continue.sh\"",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "echo \"mem\" > /sys/power/state",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "After system go into S3 mode, move mouse or press any key to make it resume (on NUC press power button)",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Check \"date\" and script \"continue.sh\"",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "Check if application can work as normal \ncontinue.sh as below: \n \n#!/bin/sh \n \ni=1 \nwhile [ 0 ] \ndo \n echo $i \n sleep 1 \n i=$((i+1)) \ndone ",
-                    "expected_results": "Screen should resume back and script can run continuously incrementing the i's value from where it was before going to standby state. Date should be the same with the corresponding time increment."
-                }
-            },
-            "summary": "standby"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.check_CPU_utilization_after_standby",
@@ -175,36 +141,6 @@
             "summary": "check_CPU_utilization_after_standby"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.Test_if_LAN_device_works_well_after_resume_from_suspend_state",
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
-                    "action": "After system go into S3 mode, move mouse or press any key to make it resume",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "check ping status  \n\nNote: This TC apply only for core-image-full-cmd.",
-                    "expected_results": "ping should always work before/after standby"
-                }
-            },
-            "summary": "Test_if_LAN_device_works_well_after_resume_from_suspend_state"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.Test_if_usb_hid_device_works_well_after_resume_from_suspend_state",
-- 
2.29.0

