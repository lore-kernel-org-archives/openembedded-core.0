Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.6358.1619053960400481766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: SHbgCh2HsEX6vbRb9m2wdyeKOd/Fi01dWhshFV33w7Qa9Zg+cV+roMWhumdvgCd5hFyAbY09S5
 UOFkPDcmxTAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="216464928"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="216464928"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:12:39 -0700
IronPort-SDR: WRe/XOFV9eeKu7I0fprL0hwgkXvStJKCS92z5gZCkXB33rEI0Hsn5fAp6p1poCnBq2leZZ17nw
 nJ4Acq4I5bEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573594"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:12:38 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] oeqa/manual/bsp-hw.json : remove click_terminal_icon_on_X_desktop manual test
Date: Thu, 22 Apr 2021 09:11:42 +0800
Message-Id: <20210422011144.58491-4-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210422011144.58491-1-jay.shen.teoh@intel.com>
References: <20210422011144.58491-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove the click_terminal_icon_on_X_desktop test as it was replaced by the new automated runtime oeqa/runtime/cases/terminal.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 5eceb741a5..bd61cf2c79 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -171,28 +171,6 @@
             "summary": "Test_if_usb_hid_device_works_well_after_resume_from_suspend_state"
         }
     },
-    {
-        "test": {
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
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.Add_multiple_files_in_media_player",
-- 
2.29.0

