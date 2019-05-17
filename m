Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D0BC67E0D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:12:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2019 00:12:43 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 17 May 2019 00:12:42 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 15:12:37 +0800
Message-Id: <1558077157-74260-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558077157-74260-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1558077157-74260-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] oeqa/manual/bsp-hw.json: Remove opengl graphic testing
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
X-List-Received-Date: Fri, 17 May 2019 07:12:41 -0000

Remove the bsps-hw.bsps-hw.Graphics_-_ABAT as it was replaced by the
new automated runtime oeqa/runtime/cases/graphic.py.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 4b7c76f..931f40a 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -873,32 +873,6 @@
     },
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.Graphics_-_ABAT",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Download ABAT test suite from internal git repository, git clone git://tinderbox.sh.intel.com/git/abat",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Apply following patch to make it work on yocto environment",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"./abat.sh\" to run ABAT test refer to abat.patch",
-                    "expected_results": "All ABAT test should pass. \nNote : If below 3 fails appears ignore them. \n- start up X server fail.. due is already up \n- module [intel_agp] \n- module [i915]"
-                }
-            },
-            "summary": "Graphics_-_ABAT"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.Graphics_-_x11perf_-_2D",
             "author": [
                 {
-- 
2.7.4


