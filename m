Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6867070F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:00:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2014 01:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,402,1406617200"; d="scan'208";a="581726342"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2014 01:00:17 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 6E22E2C8001;
	Tue, 26 Aug 2014 00:59:36 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:05:44 +0300
Message-Id: <1409047544-7026-5-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 4/4] oeqa/sdk/buildsudoku.py: add setUpModule method to run only when gtk+ in installed.
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
X-List-Received-Date: Tue, 26 Aug 2014 08:00:20 -0000

Adding setUpModule in order to skip the module when gtk+ is not installed in the toolchain.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/sdk/buildsudoku.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/sdk/buildsudoku.py b/meta/lib/oeqa/sdk/buildsudoku.py
index 6a60c76..dea77c6 100644
--- a/meta/lib/oeqa/sdk/buildsudoku.py
+++ b/meta/lib/oeqa/sdk/buildsudoku.py
@@ -2,6 +2,10 @@ from oeqa.oetest import oeSDKTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.targetbuild import SDKBuildProject
 
+def setUpModule():
+    if not oeSDKTest.hasPackage("gtk\+"):
+        skipModule("Image doesn't have gtk+ in manifest")
+
 class SudokuTest(oeSDKTest):
 
     @classmethod
-- 
1.8.3.2


