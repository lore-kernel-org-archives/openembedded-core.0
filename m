Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 55E36765DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:32:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 01:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787609106"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 01:32:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:31:56 +0100
Message-Id: <86f931f8af001566551240637ac840ab9ef8aa1f.1440059460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440059460.git.paul.eggleton@linux.intel.com>
References: <cover.1440059460.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] classes/insane: fix QA check message referring to nativesdk
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
X-List-Received-Date: Thu, 20 Aug 2015 08:32:09 -0000

nativesdk has been a prefix rather than a suffix for some time now.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9c05c86..d9befc4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -260,7 +260,7 @@ def package_qa_check_dev(path, name, d, elf, messages):
     """
 
     if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
-        messages["dev-so"] = "non -dev/-dbg/-nativesdk package contains symlink .so: %s path '%s'" % \
+        messages["dev-so"] = "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d))
 
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
-- 
2.1.0


