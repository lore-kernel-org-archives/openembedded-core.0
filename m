Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 232906FEA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 22:10:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jun 2014 15:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,473,1400050800"; d="scan'208";a="557267511"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.155])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2014 15:09:13 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 15:07:42 -0700
Message-Id: <2ed2b4797e7f46bc7c2e4686dbf447610632b855.1402697205.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1402697205.git.max.eliaser@intel.com>
References: <cover.1402697205.git.max.eliaser@intel.com>
Subject: [PATCH 1/1] texinfo-dummy-native: Fix dummy scripts failing when paths contain capital Es
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
X-List-Received-Date: Fri, 13 Jun 2014 22:10:41 -0000

This was an issue in the command-line argument parsing. It was the cause of
the bug reported on the OE-core mailing list by Denys Dmytriyenko.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index 4dc31a9..b0ebf75 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
@@ -104,7 +104,7 @@ while arg_idx < len (sys.argv):
     
     # Check for functionality that isn't implemented yet.
     else:
-        assert arg[1] == '-' or 'E' not in arg or \
+        assert arg[0] != '-' or arg[1] == '-' or 'E' not in arg or \
                this_binary in simple_binaries, \
                "-E option not yet supported" + stub_msg
         
-- 
1.8.3.2


