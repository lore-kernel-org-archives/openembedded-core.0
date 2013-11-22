Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAEA6B3D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 601F013B91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X0U8T8zNSsY4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 4ABDD13B6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 31291895
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 25FE4418
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 2459A3404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:24:35 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.2.255.0; Fri, 22 Nov 2013
	14:24:34 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id DB4EE9C915; 
	Fri, 22 Nov 2013 14:24:34 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 14:24:34 +0100
Message-ID: <1385126674-334-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [PATCH] json-c: do rm -f on config.status before do_configure
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
X-List-Received-Date: Fri, 22 Nov 2013 13:24:38 -0000
Content-Type: text/plain

This change adds -f when doing rm on config.status. .config.status is
not always present when doing do_configure, and that would without this
change lead to a fatal error.

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta/recipes-devtools/json-c/json-c_0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-devtools/json-c/json-c_0.11.bb
index 831f281..d1bf0e9 100644
--- a/meta/recipes-devtools/json-c/json-c_0.11.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
@@ -16,5 +16,5 @@ inherit autotools
 
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
-    rm ${S}/config.status
+    rm -f ${S}/config.status
 }
-- 
1.8.4.rc3


