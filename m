Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC8B600E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:02:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 09 Feb 2017 08:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="62737997"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 09 Feb 2017 08:02:35 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 08:01:44 -0800
Message-Id: <20170209160144.72820-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] insane.bbclass: print QA message correctly
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
X-List-Received-Date: Thu, 09 Feb 2017 16:02:47 -0000

When checking for ".debug" files, print QA message correctly.

Fixes [YOCTO #11014]

introduced in OE-core revision 1dcb38ca9d6

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3cf86c12c3..ddd58d0875 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -398,7 +398,7 @@ def package_qa_check_dbg(path, name, d, elf, messages):
 
     if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
-            messages("debug-files", "non debug package contains .debug directory: %s path %s" % \
+            package_qa_add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
                      (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[perms] = "package_qa_check_perm"
-- 
2.11.1


