Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF337318E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:52:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2016 04:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="964240695"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2016 04:52:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 180636A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:40:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:32:00 +0300
Message-Id: <58329012502ae3deec7fbf720857197a9699da6f.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/6] wic: add sfdisk to the list of utilities
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:50 -0000

Added sfdisk -> util-linux pair to the dictionary
executable -> recipe as sfdisk is going to be used by wic
to set partition system id.

[YOCTO #9096]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 81239ac..a3cbe5f 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -43,6 +43,7 @@ NATIVE_RECIPES = {"mcopy": "mtools",
                   "mksquashfs": "squashfs-tools",
                   "mkswap": "util-linux",
                   "parted": "parted",
+                  "sfdisk": "util-linux",
                   "sgdisk": "gptfdisk",
                   "syslinux": "syslinux"
                  }
-- 
2.1.4


