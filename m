Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 76DD077697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 42D1C11A020
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0hqnVm7r9eWl
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 9C3522E5BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B63E1A06D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 806411A066
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 739D1AC3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23BHbts025962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 12:17:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23BHbPa025961
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 12:17:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 12:17:33 +0100
Message-Id: <83eee68d8f4f4bafbb4b4402818ed0d64d7d4f17.1488539819.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488539819.git.pkj@axis.com>
References: <cover.1488539819.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv3 3/5] scripts/dbus-binding-tool: Add a dummy version that always fails
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
X-List-Received-Date: Fri, 03 Mar 2017 11:17:38 -0000

This is intended to catch missing dependencies on the real version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/dbus-binding-tool | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 scripts/dbus-binding-tool

diff --git a/scripts/dbus-binding-tool b/scripts/dbus-binding-tool
new file mode 100755
index 0000000..2e85987
--- /dev/null
+++ b/scripts/dbus-binding-tool
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# This is a dummy version that always fails. It is intended to catch
+# missing dependencies on the real version.
+
+myname=${0##*/}
+
+echo "The correct version of $myname is not being used!" >&2
+echo "Make sure the recipe DEPENDS on 'dbus-glib-native'." >&2
+
+exit 1
-- 
2.9.0


