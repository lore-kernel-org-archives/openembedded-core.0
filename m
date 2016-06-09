Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCB3570100
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 17:06:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2016 10:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="994444820"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.152])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 10:06:06 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:07:39 -0500
Message-Id: <1465492059-7708-4-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
In-Reply-To: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 3/3] scripts/lib/bsp/engine.py: Added missing parentheses to string formatting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 17:06:41 -0000

Commit ab75075e7941c8c2ec429c180976702cd311c978 broke the string formatting
for multiple arguments. Since parentheses were removed the formatting considers
only first argument instead of all of them. Fixed parentheses on the formatting.

[YOCTO #9723]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/lib/bsp/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index c44bbc5..85f095e 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1614,7 +1614,7 @@ def yocto_bsp_create(machine, arch, scripts_path, bsp_output_dir, codedump, prop
     """
     yocto_common_create(machine, arch, scripts_path, bsp_output_dir, codedump, properties_file, properties)
 
-    print("\nNew %s BSP created in %s" % arch, bsp_output_dir)
+    print("\nNew %s BSP created in %s" % (arch, bsp_output_dir))
 
 
 def print_dict(items, indent = 0):
-- 
2.4.11


