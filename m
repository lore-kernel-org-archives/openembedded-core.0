Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 896C36BB73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:16:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2013 05:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,958,1367996400"; d="scan'208";a="351674320"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 05:16:55 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id ED1DA6A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 05:16:52 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 15:16:48 +0300
Message-Id: <215b28dcd8c0b11f63c151bb217e81188c595a91.1377519067.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377519067.git.stefanx.stanacar@intel.com>
References: <cover.1377519067.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377519067.git.stefanx.stanacar@intel.com>
References: <cover.1377519067.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/2] lib/oeqa/runtime: multilib: fix typo
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
X-List-Received-Date: Mon, 26 Aug 2013 12:16:56 -0000

The check was obviously wrong and it surfaced
with the recent change in behaviour for skipping tests.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/multilib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 2d952aa..13a3b54 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -4,7 +4,7 @@ from oeqa.utils.decorators import *
 
 def setUpModule():
     multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS", True) or ""
-    if "multlib:lib32" not in multilibs:
+    if "multilib:lib32" not in multilibs:
         skipModule("this isn't a multilib:lib32 image")
 
 
-- 
1.8.3.1


