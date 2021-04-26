Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.970.1619398463711995829
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: z0Npqveoq0KeG2m0c0AqW1LJWfLDlJlqYGZHWOQBxUk2dPo37xGqtG9GKJcU8I37nLuDIyAinR
 TNRBHqgcMYLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818097"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:23 -0700
IronPort-SDR: 7HNytBr19jXeaO1DTlplheJ0s6i4xOPg1c+V2u043N7P1X4GhkylJZ2jwQ9mU91vr1nx9A7vo9
 XRPCgr8WTa/Q==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067358"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/64] oe-time-dd-test.sh: increase timeout to 15 sec
Date: Mon, 26 Apr 2021 08:52:52 +0800
Message-Id: <4f9921db882ed06e0902d34ae06a0eabff4ba86e.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Randy MacLeod <randy.macleod@windriver.com>

With the previous timeout of 5 seconds, there would be
builds such as:
   https://autobuilder.yocto.io/pub/non-release/20210417-13/
which produced 17 files with top output with top running 454 times
and that's a bit too much data to analyze for each run. By
increasing the timeout, we'll find the worse problems
first, fix them and then we can decrease the timeout if needed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92b29a09b4c442597d212337b785afb76129ac7c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-time-dd-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 5b25e6bd97..459071e732 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -13,7 +13,7 @@ usage() {
         echo "Usage: $0 <count>"
 }
 
-TIMEOUT=5
+TIMEOUT=15
 
 if [ $# -ne 1 ]; then
         usage
-- 
2.30.2

