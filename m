Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8Er6WvbXc1pb2sLoOjTAknrlQ2QF4K7ORFNEtw72MbnRpa4P2fR3zV+f5LtD9JqOLAGez+bwxk
 g7EAnAN8UPnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004411"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:09 -0800
IronPort-SDR: SQhGPxUhWbl8meewv/+R8NnXQ/V5sCk6iKQfO+NPbCruOa4zsSaRFoIv7ZcIsHED2xncHrwRcI
 p2NAwUZKFICQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302699"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:08 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/21] sysvinit: remove bashism to be compatible with dash
Date: Mon, 30 Nov 2020 09:11:28 +0800
Message-Id: <f3dbd50d3af6ff6ef6d2d5a64691c0861a19a733.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fedor Ross <fedor.ross@ifm.com>

Replace the equality operator '==' with '=' inside of '[]' to be
compatible with bash and dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7f0ec6eafb35117eaf4eeef281162080f0ca79a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index fd1fdd26ba..d0d3149821 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -63,7 +63,7 @@ startup() {
   stty onlcr 0>&1
 
   # Limit stack size for startup scripts
-  [ "$STACK_SIZE" == "" ] || ulimit -S -s $STACK_SIZE
+  [ "$STACK_SIZE" = "" ] || ulimit -S -s $STACK_SIZE
 
   # Now find out what the current and what the previous runlevel are.
 
-- 
2.28.0

