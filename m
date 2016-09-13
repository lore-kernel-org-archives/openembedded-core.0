Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 970B4771BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 02:15:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2016 19:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="878068092"
Received: from wooi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.68])
	by orsmga003.jf.intel.com with ESMTP; 12 Sep 2016 19:15:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:15:14 +1200
Message-Id: <225249f90cc234b1c302ac4eb26fa3937e339a09.1473732817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473732817.git.paul.eggleton@linux.intel.com>
References: <cover.1473732817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473732817.git.paul.eggleton@linux.intel.com>
References: <cover.1473732817.git.paul.eggleton@linux.intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 1/1] oeqa/sdkext/devtool: use a smaller module to test node.js functionality
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
X-List-Received-Date: Tue, 13 Sep 2016 02:15:31 -0000

The "forever" package, despite its innocent description, actually drags
in a surprising number of dependencies and as a result the nodejs test
takes up to 10 minutes as a result. Pick a different example with a much
more reasonable set of dependencies.

Addresses part of [YOCTO #10254].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index ba12799..65f41f6 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -91,7 +91,7 @@ class DevtoolTest(oeSDKExtTest):
     @testcase(1478)
     @skipUnlessPassed('test_devtool_location')
     def test_recipes_for_nodejs(self):
-        package_nodejs = "npm://registry.npmjs.org;name=forever;version=0.15.1"
+        package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
         try:
             self._run('devtool build %s ' % package_nodejs)
-- 
2.5.5


