Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B07AF73CF5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 21:03:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2015 14:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,524,1422950400"; d="scan'208";a="675328021"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2015 14:03:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 8E1196A408F;
	Sat,  4 Apr 2015 14:02:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Apr 2015 00:03:05 +0300
Message-Id: <1428181385-10391-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Print bitbake error output
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
X-List-Received-Date: Sat, 04 Apr 2015 21:03:29 -0000

Added bitbake error output to wic error message to make it
more descriptive.

[YOCTO #6911]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index ea9b6e8..4872bd0 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -144,6 +144,7 @@ def find_bitbake_env_lines(image_name):
     rc, bitbake_env_lines = __exec_cmd(bitbake_env_cmd)
     if rc != 0:
         print "Couldn't get '%s' output." % bitbake_env_cmd
+        print "Bitbake failed with error:\n%s\n" % bitbake_env_lines
         return None
 
     return bitbake_env_lines
-- 
2.1.4


