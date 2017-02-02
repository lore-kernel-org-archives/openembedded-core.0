Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B79BA71D9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:55:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 02 Feb 2017 05:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="1102116781"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2017 05:55:55 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3F8446A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 05:54:55 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 15:32:57 +0200
Message-Id: <ae6368b2daca806a1e7d9261b910458bd559fe17.1486041986.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486041986.git.ed.bartosh@linux.intel.com>
References: <cover.1486041986.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/3] wic: engine: create output dir
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
X-List-Received-Date: Thu, 02 Feb 2017 13:55:55 -0000

Make sure output directory exists before creating an image.
Create it if it doesn't exist.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 592ef77..7fb6f13 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -187,6 +187,9 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     if debug:
         msger.set_loglevel('debug')
 
+    if not os.path.exists(image_output_dir):
+        os.makedirs(image_output_dir)
+
     crobj = creator.Creator()
 
     cmdline = ["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
-- 
2.1.4


