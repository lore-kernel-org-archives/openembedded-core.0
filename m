Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3574.1603856435817441202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 20:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: lfLusS1Zmb3zlRs42Zkjqdfv+i+zz4jiD4EoD+f+zjdOBAZ2w1XJTjlsADr3YeWDn1efwWNa81
 aAWKJIUE50pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168328228"
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; 
   d="scan'208";a="168328228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 20:40:32 -0700
IronPort-SDR: a8nuAod4jlOCCDeysTf/AVOxGi9KPzs7Wl3Ma5hyamFmit5ewEMWzUKUE+AHtsYgB9XqABf0EY
 tXZz3AyIP5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,425,1596524400"; 
   d="scan'208";a="350844933"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2020 20:40:30 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/manual/bsp-hw.json : removal of click_terminal_icon_on_X_desktop manual test because of automated
Date: Wed, 28 Oct 2020 11:40:26 +0800
Message-Id: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

removing click_terminal_icon_on_X_desktop manual test as this function is now tested by terminal.py automated runtime test

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 75b8975..790c0c0 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -365,28 +365,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.click_terminal_icon_on_X_desktop",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "After system launch and X start up, click terminal icon on desktop",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Check if only one terminal window launched and no other problem met",
-                    "expected_results": "There should be no problem after launching terminal . "
-                }
-            },
-            "summary": "click_terminal_icon_on_X_desktop"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.Add_multiple_files_in_media_player",
             "author": [
                 {
-- 
2.7.4

