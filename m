Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3639360673
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 17:23:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2014 09:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,495,1413270000"; d="scan'208";a="640816305"
Received: from fodonogx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.108])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2014 09:20:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 17:20:30 +0000
Message-Id: <1417454430-27930-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] kernel-yocto.bbclass: fix shell syntax error
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
X-List-Received-Date: Mon, 01 Dec 2014 17:23:31 -0000

Spaces aren't valid around = in an assignment statement (not even with
bash).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index e672a0e..c3e2494 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -212,7 +212,7 @@ do_kernel_checkout() {
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 0 ]; then
-		machine_branch = "master"
+		machine_branch="master"
 	fi
 
 	# checkout and clobber any unimportant files
-- 
1.9.3


