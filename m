Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 58D1B719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 11:45:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 04:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,317,1496127600"; d="scan'208";a="1168962056"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2017 04:45:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1E1AC58038E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 04:45:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:32:34 +0300
Message-Id: <5d22fca327b98ecb97f778c74d8157b5f43bba7f.1499340568.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499340568.git.ed.bartosh@linux.intel.com>
References: <cover.1499340568.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/3] wic: add description of --mkfs-extraopts
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
X-List-Received-Date: Thu, 06 Jul 2017 11:45:10 -0000

Updated help contents with the description of new
wks option --mkfs-extraopts

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 23d943c..99912cd 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -943,6 +943,12 @@ DESCRIPTION
                       for the harware that requires non-default partition system ids. The parameter
                       in one byte long hex number either with 0x prefix or without it.
 
+         --mkfs-extraopts: This option specifies extra options to pass to mkfs utility.
+                           NOTE, that wic uses default options for some filesystems, for example
+                           '-S 512' for mkfs.fat or '-F -i 8192' for mkfs.ext. Those options will
+                           not take effect when --mkfs-extraopts is used. This should be taken into
+                           account when using --mkfs-extraopts.
+
     * bootloader
 
       This command allows the user to specify various bootloader
-- 
2.1.4


