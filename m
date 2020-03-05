Return-Path: <sk@typedivision.de>
Received: from smtp01.udag.de (smtp01.udag.de [62.146.106.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7F561139
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (x4e37f8a2.dyn.telefonica.de
	[78.55.248.162]) by smtp01.udag.de (Postfix) with ESMTPA id EEFC925D;
	Thu,  5 Mar 2020 20:30:20 +0100 (CET)
From: Stefan Kral <sk@typedivision.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2020 20:30:00 +0100
Message-Id: <20200305193000.34658-1-sk@typedivision.de>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Authentication-Results: smtp01.udag.de;
	auth=pass smtp.auth=typedivision-de-0001
	smtp.mailfrom=sk@typedivision.de
Subject: [PATCH] oeqa-runtime: add missing import os to ptest case
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
X-List-Received-Date: Thu, 05 Mar 2020 19:30:21 -0000

Add missing import os statement to the oeqa runtime ptest.py

Signed-off-by: Stefan Kral <sk@typedivision.de>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 5626f707b9..99a44f0767 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import unittest
 import pprint
 import datetime
-- 
2.17.2 (Apple Git-113)


