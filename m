Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BE14470149
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 043A32E12B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QVJasNlc41kY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 3A9CA2E18D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 24CA81648
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 1987214D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 0F3BB1039
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3FHU81D014344
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3FHU8V6014340
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2016 19:30:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:30:07 +0200
Message-Id: <4d259bb6c6cbac7e828b56926f558770ed32ab7f.1460741369.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1460741369.git.pkj@axis.com>
References: <cover.1460741369.git.pkj@axis.com>
In-Reply-To: <cover.1460741369.git.pkj@axis.com>
References: <cover.1460741369.git.pkj@axis.com>
Subject: [PATCH 2/2] lib/oeqa/selftest/base.py: Correct a reference to meta/lib/oeqa/selftest
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
X-List-Received-Date: Fri, 15 Apr 2016 17:30:10 -0000

---
 meta/lib/oeqa/selftest/base.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index dc93731..e10455e 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -4,7 +4,7 @@
 
 
 # DESCRIPTION
-# Base class inherited by test classes in meta/lib/selftest
+# Base class inherited by test classes in meta/lib/oeqa/selftest
 
 import unittest
 import os
-- 
2.1.0


