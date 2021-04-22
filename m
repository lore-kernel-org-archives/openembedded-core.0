Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.6307.1619053923422014799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 18:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: LKkbzMmjPdIGqPgKWT6iqS6lunmu/yiE0YQKqHUI67DxDUl1rEC930hhvNlen8vGt2N/FU6b/k
 E5sXPenx8Lvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="183293254"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="183293254"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 18:12:01 -0700
IronPort-SDR: J42qTi/0QDP0l5OCt4kEHSnROg0mHoRdjiQ6mpx/u0Sl/5rfuORnD9MV6gthCy5ZgZp1j+sxo3
 8MxqlOuWnwlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; 
   d="scan'208";a="455573383"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2021 18:12:00 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] oeqa/manual/bsp-hw.json : remove ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP manual test
Date: Thu, 22 Apr 2021 09:11:40 +0800
Message-Id: <20210422011144.58491-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210422011144.58491-1-jay.shen.teoh@intel.com>
References: <20210422011144.58491-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Remove ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP test as they was replaced by the new automated runtime oeqa/runtime/cases/ethernet_ip_connman.py.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 64 --------------------------------
 1 file changed, 64 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 5c3719f093..0c13d116d6 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -89,70 +89,6 @@
             "summary": "switch_among_multi_applications_and_desktop"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.ethernet_static_ip_set_in_connman",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Boot the system and check internet connection is on . ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Launch connmand-properties (up-right corner on desktop)",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Choose  Ethernet device and set a valid static ip address for it. \nFor example, in our internal network, we can set as following: \nip address: 10.239.48.xxx \nMask: 255.255.255.0 \nGateway (Broadcast): 10.239.48.255",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Check the Network configuration with \"ifconfig\"",
-                    "expected_results": "Static IP was set successfully  \n"
-                },
-                "5": {
-                    "action": "ping to another IP adress",
-                    "expected_results": "Ping works correclty\n"
-                }
-            },
-            "summary": "ethernet_static_ip_set_in_connman"
-        }
-    },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.ethernet_get_IP_in_connman_via_DHCP",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Launch connmand-properties (up-right corner on your desktop). ",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Check if Ethernet device can work properly with static IP, doing \"ping XXX.XXX.XXX.XXX\", once this is set.",
-                    "expected_results": "Ping executed successfully .  \n\n"
-                },
-                "3": {
-                    "action": "Then choose DHCP method for Ethernet device in connmand-properties.",
-                    "expected_results": ""
-                },
-                "4": {
-                    "action": "Check with 'ifconfig\" and \"ping\" if Ethernet device get IP address via DHCP.",
-                    "expected_results": "Ethernet device can get dynamic IP address via DHCP in connmand ."
-                }
-            },
-            "summary": "ethernet_get_IP_in_connman_via_DHCP"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.connman_offline_mode_in_connman-gnome",
-- 
2.29.0

