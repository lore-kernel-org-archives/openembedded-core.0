Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466851"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462920"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/23] runqemu: Fix typo in error message
Date: Mon,  9 Aug 2021 23:35:43 +0800
Message-Id: <f2f9eb53515c7f1890365aa6441f556fb862e429.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Klein <matthias@extraklein.de>

Signed-off-by: Matthias Klein <matthias@extraklein.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cc0051d50974e198313f9513b24fd7ae9a96dd4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c985f4e75a..f3527a4412 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -775,7 +775,7 @@ class BaseConfig(object):
                 raise RunQemuError('BIOS not found: %s' % bios_match_name)
 
         if not os.path.exists(self.bios):
-            raise RunQemuError("KERNEL %s not found" % self.bios)
+            raise RunQemuError("BIOS %s not found" % self.bios)
 
 
     def check_mem(self):
-- 
2.31.1

