Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 882F9606CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 14:12:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 03 Feb 2017 06:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,328,1477983600"; d="scan'208";a="60486861"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 03 Feb 2017 06:12:25 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 329E46A4006;
	Fri,  3 Feb 2017 06:11:24 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 15:49:56 +0200
Message-Id: <1486129796-6280-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: isoimage-isohybrid: use wic-tools to get syslinux path
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
X-List-Received-Date: Fri, 03 Feb 2017 14:12:27 -0000

wic-tools recipe specific sysroot contains syslinux as wic-tools
depends on it. Used wic-tools target to get syslinux path should
guarantee that syslinux is installed there and can be used.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 56bb62d..ca28bc0 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -410,7 +410,7 @@ class IsoImagePlugin(SourcePlugin):
             exec_cmd(chmod_cmd)
 
         # Prepare files for legacy boot
-        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
+        syslinux_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
         if not syslinux_dir:
             msger.error("Couldn't find STAGING_DATADIR, exiting.\n")
 
-- 
2.1.4


