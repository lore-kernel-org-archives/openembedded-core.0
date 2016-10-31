Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B101F6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:46:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 31 Oct 2016 03:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,426,1473145200"; d="scan'208";a="780284599"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2016 03:46:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id C789B6A4080;
	Mon, 31 Oct 2016 03:46:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 12:46:41 +0200
Message-Id: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Mon, 31 Oct 2016 10:46:46 -0000

mkefidisk.sh will soon be deprecated in favor of .wic images.

Added deprecation warning to the script to inform users that
this script will soon be removed from the codebase.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index d8db3c0..a175895 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -20,6 +20,11 @@
 
 LANG=C
 
+echo
+echo "WARNING: This script is deprecated and will be removed soon."
+echo "Please consider using wic EFI images instead."
+echo
+
 # Set to 1 to enable additional output
 DEBUG=0
 OUT="/dev/null"
-- 
2.1.4


