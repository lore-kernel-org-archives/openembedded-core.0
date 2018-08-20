Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60970790FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 02:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D9BEB18585
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id gqwGo4DrZl1X
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4705D18560
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3209D1E057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 260391E054
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 1900A16F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:33 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w7K2kI18012563
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 04:46:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w7K2kIfC012560
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2018 04:46:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 04:46:16 +0200
Message-Id: <20180820024616.12501-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Mon, 20 Aug 2018 02:46:33 -0000

busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/busybox/busybox.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 8c6dbbaf9b..a8ba10d21c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of many common UNIX utilities into
 HOMEPAGE = "http://www.busybox.net"
 BUGTRACKER = "https://bugs.busybox.net/"
 
-DEPENDS += "kern-tools-native"
+# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not defined
+DEPENDS += "kern-tools-native virtual/crypt"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
-- 
2.12.0


