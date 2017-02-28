Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 315B060068
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 940612E406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qEqqGTtvnYhT
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 0F23D2E28D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:21 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0D5F1A16F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3F031A100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C871020E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SDZKgp019114
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SDZKbX019113
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 14:35:20 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 14:35:17 +0100
Message-Id: <fb795bebf9206e385694a39e880e85dd2de6b350.1488288835.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488288835.git.pkj@axis.com>
References: <cover.1488288835.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/4] scripts/dbus-binding-tool: Add a dummy version that always fails
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
X-List-Received-Date: Tue, 28 Feb 2017 13:35:21 -0000

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


