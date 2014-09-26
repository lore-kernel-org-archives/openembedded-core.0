Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 41F6960167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 19:04:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2014 11:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,605,1406617200"; d="scan'208";a="609261975"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2014 12:04:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 19:04:31 +0000
Message-Id: <6575549ca9a37610b0832055c8cac3c234bd906e.1411758271.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] kernel-yocto.bbclass: Fixup shell condition test syntax error
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
X-List-Received-Date: Fri, 26 Sep 2014 19:04:49 -0000

A warning is issued when run about an unexpected operator due to a
syntax error with an extra if empedded in the shell conditional. Remove
the extra if.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 929d64a..7718f9a 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -296,7 +296,7 @@ do_validate_branches() {
 		force_srcrev="${SRCREV}"
 	else
 		git cat-file -t ${machine_srcrev} > /dev/null
-		if [ if $? -ne 0 ]; then
+		if [ $? -ne 0 ]; then
 			bberror "${machine_srcrev} is not a valid commit ID."
 			bbfatal "The kernel source tree may be out of sync"
 		fi
-- 
2.1.0


