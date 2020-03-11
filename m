Return-Path: <sk@typedivision.de>
Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	by mail.openembedded.org (Postfix) with ESMTP id C017B61BEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (x4e3627bc.dyn.telefonica.de
	[78.54.39.188])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id A519F11E91;
	Wed, 11 Mar 2020 17:37:23 +0100 (CET)
From: Stefan Kral <sk@typedivision.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 17:36:49 +0100
Message-Id: <20200311163649.78011-1-sk@typedivision.de>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=typedivision-de-0001
	smtp.mailfrom=sk@typedivision.de
Cc: Stefan Kral <sk@typedivision.de>
Subject: [PATCH] oeqa/runtime/context.py: fix typo
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
X-List-Received-Date: Wed, 11 Mar 2020 16:37:26 -0000

Signed-off-by: Stefan Kral <sk@typedivision.de>
---
 meta/lib/oeqa/runtime/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 2ecb1a8f01..101434a595 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -77,7 +77,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         runtime_group.add_argument('--packages-manifest', action='store',
                 default=self.default_manifest,
-                help="Package manifest of the image under testi, default: %s" \
+                help="Package manifest of the image under test, default: %s" \
                 % self.default_manifest)
 
         runtime_group.add_argument('--extract-dir', action='store',
@@ -184,7 +184,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         except:
             obj = None
         return obj
-        
+
     @staticmethod
     def readPackagesManifest(manifest):
         if not manifest or not os.path.exists(manifest):
-- 
2.17.2 (Apple Git-113)


