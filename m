Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2064F7769F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 39E352E0D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dLsb9zr0YIrL
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id A946E2E0F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 965E31E079
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B83C1E07D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F9F12FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:55:14 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23AtE1x005939
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 11:55:14 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23AtEGE005938
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 11:55:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:55:11 +0100
Message-Id: <8a4f8ea2e6f2e67efc8be8e5aea9060ccce81ff1.1488538442.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488538442.git.pkj@axis.com>
References: <cover.1488538442.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 4/5] scripts/gdbus-codegen: Add a dummy version that always fails
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
X-List-Received-Date: Fri, 03 Mar 2017 10:55:15 -0000

This is intended to catch missing dependencies on the real version.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/gdbus-codegen | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 scripts/gdbus-codegen

diff --git a/scripts/gdbus-codegen b/scripts/gdbus-codegen
new file mode 100755
index 0000000..d91386b
--- /dev/null
+++ b/scripts/gdbus-codegen
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# This is a dummy version that always fails. It is intended to catch
+# missing dependencies on the real version.
+
+myname=${0##*/}
+
+echo "The correct version of $myname is not being used!" >&2
+echo "Make sure the recipe DEPENDS on 'glib-2.0-native'." >&2
+
+exit 1
-- 
2.9.0


