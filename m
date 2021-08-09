Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466778"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466778"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462868"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/23] parselogs.py: qemuarm should be qemuarmv5
Date: Mon,  9 Aug 2021 23:35:34 +0800
Message-Id: <5dc6645397fa8072428a17ea904d8e0b110dc12c.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

All of the errors being masked off for qemuarm are legacy from before
the migration of qemuarm to qemuarmv5.  Rename the machine to that to
allow for qemuarmv5 to pass parselog test.  Light testing shows no
errors in dmesg for qemuarm.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 701a58504de15b244b970908f2de0971a35b5a09)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1bb0425521..e06f92727e 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -121,7 +121,7 @@ ignore_errors = {
         'synth uevent: /devices/vio: failed to send uevent',
         'PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]',
         ] + common_errors,
-    'qemuarm' : [
+    'qemuarmv5' : [
         'mmci-pl18x: probe of fpga:05 failed with error -22',
         'mmci-pl18x: probe of fpga:0b failed with error -22',
         'Failed to load module "glx"',
@@ -135,6 +135,7 @@ ignore_errors = {
         'OF: amba_device_add() failed (-19) for /amba/fpga/sci@a000',
         'Failed to initialize \'/amba/timer@101e3000\': -22',
         'jitterentropy: Initialization failed with host not compliant with requirements: 2',
+        'clcd-pl11x: probe of 10120000.display failed with error -2',
         ] + common_errors,
     'qemuarm64' : [
         'Fatal server error:',
-- 
2.31.1

