Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.3749.1610079532734030116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XsD+M/baXfJCi7sXQ0J3CyI+lz5qZgbSQ7YoZ8edejY0jSRCJmOVuPbiouX6ueXAZtkRQ01MgD
 cuSPizcUsgUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613730"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:52 -0800
IronPort-SDR: ZABxYn/WWap9liPVtw3vU1XWTZ6NMCzljFUlvQbYqLjwXRY2iKPz7pfrlm2FfoKamR4FDvWLtZ
 cpuGgI4ZGUeg==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209491"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/30] initscripts: use quotes for shell variable comparision
Date: Fri,  8 Jan 2021 12:18:07 +0800
Message-Id: <42972452191b47802b460b0e6a3044d4621de6c1.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Helps to execute it with busybox shell

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45ba0ca0352bca46f974d28781ac935d8e9ec3ea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02f0351fcb..a63e71b780 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
 #
 # Check the root filesystem.
 #
-if test -f /fastboot || test $rootcheck = no
+if test -f /fastboot || test "$rootcheck" = "no"
 then
   test $rootcheck = yes && echo "Fast boot, no filesystem check"
 else
-- 
2.29.2

