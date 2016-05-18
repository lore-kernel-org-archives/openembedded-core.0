Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 62BA773177
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:34:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2016 05:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="705059792"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 18 May 2016 05:34:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D28F16A4007;
	Wed, 18 May 2016 06:21:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 15:34:16 +0300
Message-Id: <1463574859-5073-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463159633.9746.121.camel@linuxfoundation.org>
References: <1463159633.9746.121.camel@linuxfoundation.org>
Subject: [wic][PATCH 1/4] wic: add bmaptool to the list of utilities
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
X-List-Received-Date: Wed, 18 May 2016 12:34:45 -0000

Added bmaptool -> bmap-tools pair to the dictionary
executable -> recipe as bmaptool is going to be used by wic
to generate .bmap file.

[YOCTO #9413]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 0854dfb..fe188c9 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -34,7 +34,8 @@ from wic import msger
 from wic.utils import runner
 
 # executable -> recipe pairs for exec_native_cmd
-NATIVE_RECIPES = {"mcopy": "mtools",
+NATIVE_RECIPES = {"bmaptool": "bmap-tools",
+                  "mcopy": "mtools",
                   "mkdosfs": "dosfstools",
                   "mkfs.btrfs": "btrfs-tools",
                   "mkfs.ext2": "e2fsprogs",
-- 
2.1.4


