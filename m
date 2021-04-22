Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.6300.1619053909621785613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: PUoK/0T44K5om6ckYys12MpTrY2CzbjUVXniwq80ix0nXxtu1E5QGfFd1sbchZzKP4gds+Lzr5
 oVGrCECGeUmA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195918688"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="195918688"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:11:47 -0700
IronPort-SDR: INaqaCtWSKGjG8w12MK6Tl2067kA1rBxLrffTa0dwvA7Ll8HqA5+WRacgWUkxHdbIpAmqcW8iQ
 +w5v9U1D7mWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573348"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:11:47 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] oeqa/manual/bsp-hw.json : remove boot_from_runlevel_3 and boot_from_runlevel_5 manual test
Date: Thu, 22 Apr 2021 09:11:39 +0800
Message-Id: <20210422011144.58491-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove boot_from_runlevel_3 and boot_from_runlevel_5 test as they was replaced by the new automated runtime oeqa/runtime/cases/runlevel.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 64 --------------------------------
 1 file changed, 64 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 75b89758cb..5c3719f093 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -59,70 +59,6 @@
             "summary": "live_boot_from_USB"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.boot_from_runlevel_3",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Boot into system and edit /etc/inittab to make sure that system enter at the run level 3 by default, this is done by changing the line   \n\n\nid:5:initdefault  \n\nto  \n\nid:3:initdefault  \n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Reboot system, and press \"Tab\" to enter \"grub\"",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Get into the \"kernel\" line with the edit option  \"e\" and add \"psplash=false text\" at the end line.",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Press \"F10\" or \"ctrl+x\" to boot system",
-                    "expected_results": ""
-                },
-                "5": {
-                    "action": "If system ask you for a login type \"root\"",
-                    "expected_results": "System should boot to run level 3, showing the command prompt."
-                }
-            },
-            "summary": "boot_from_runlevel_3"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.boot_from_runlevel_5",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Boot into system and edit /etc/inittab to make sure that system enter at the run level 5 by default, this is done by changing the line   \n\nid:3:initdefault  \n\nto  \n\nid:5:initdefault  \n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Reboot system, and press \"Tab\" to enter \"grub\"",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Get into the \"kernel\" line with the edit option  \"e\" and add \"psplash=false text\" at the end line.",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Press \"F10\" or \"ctrl+x\" to boot system \nNote: The test is only for sato image.",
-                    "expected_results": "System should boot to runlevel 5 ."
-                }
-            },
-            "summary": "boot_from_runlevel_5"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.switch_among_multi_applications_and_desktop",
-- 
2.29.0

