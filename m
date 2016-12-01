Return-Path: <linus.svensson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9E03D60291
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 539832E734
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id A1FM97dIVaBR
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id A0F262E722
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D9951A09C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82F051A09A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: from lnxlinussn.se.axis.com (lnxlinussn.se.axis.com [10.94.48.1])
	by seth.se.axis.com (Postfix) with ESMTP id 7732B584
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:23:56 +0100 (CET)
Received: by lnxlinussn.se.axis.com (Postfix, from userid 21014)
	id 604413A099; Thu,  1 Dec 2016 17:23:56 +0100 (CET)
From: linus.svensson@axis.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 17:23:36 +0100
Message-Id: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] python3-native: Add python3-modules to RPROVIDES list
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
X-List-Received-Date: Thu, 01 Dec 2016 16:23:56 -0000

From: Linus Svensson <linussn@axis.com>

Signed-off-by: Linus Svensson <linussn@axis.com>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index 08802cd..7ac3942 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -54,6 +54,7 @@ RPROVIDES += " \
     python3-json-native \
     python3-lang-native \
     python3-misc-native \
+    python3-modules-native \
     python3-netclient-native \
     python3-netserver-native \
     python3-numbers-native \
-- 
2.1.4


