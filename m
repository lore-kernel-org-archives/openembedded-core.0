Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B079773AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:50:53 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,143,1484035200"; d="scan'208";a="57412674"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 14:50:53 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:50:02 -0800
Message-Id: <20170210225002.20610-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170210225002.20610-1-stephano.cetola@linux.intel.com>
References: <20170210225002.20610-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V2 1/1] insane.bbclass: print QA message correctly
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
X-List-Received-Date: Fri, 10 Feb 2017 22:50:53 -0000

Replace call to non-existent method "messages" with call to correct
QA logging method.

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


