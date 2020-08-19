Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.84971.1597827907310215009
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 02:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: q60ijR6d0dVuhNJo/OMaOyRjhMZKKJT7Pwz1yANK16MCCqb/CGx+SR59GBlvCdBXPd55Kbc4YE
 knWiP9TIexZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173121182"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="173121182"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 02:05:08 -0700
IronPort-SDR: vQ+rk/qnBflPfgo+IP5Kj2kgcRo7IwYeR/KCGUabvjNZXyE0u67nDwUHneWLiCm+VYsee4Gccz
 Se0xhJcwlqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; 
   d="scan'208";a="497687502"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2020 02:05:07 -0700
From: jay.shen.teoh@intel.com
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/manual/bsp-hw.json : remove X_server_can_start_up_with_runlevel_5_boot test
Date: Wed, 19 Aug 2020 17:05:03 +0800
Message-Id: <1597827903-18579-2-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597827903-18579-1-git-send-email-jay.shen.teoh@intel.com>
References: <1597827903-18579-1-git-send-email-jay.shen.teoh@intel.com>

From: TeohJayShen <jay.shen.teoh@intel.com>

remove the test as graphical mode is already being validated

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 08132c0..75b8975 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -241,28 +241,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.X_server_can_start_up_with_runlevel_5_boot",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot up system with default runlevel  \n\n",
-                    "expected_results": "X server can start up well and desktop display has no problem .  \n\n"
-                },
-                "2": {
-                    "action": "type runlevel at command prompt",
-                    "expected_results": "Output:N 5"
-                }
-            },
-            "summary": "X_server_can_start_up_with_runlevel_5_boot"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.standby",
             "author": [
                 {
-- 
2.7.4

