Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 459AC7117F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 35E9118099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HygUqMp0nX6U
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 47D6418134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 315ABC44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 262CE13EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 2415A3E049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7SFB8gt015265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7SFB8xr015264
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 17:11:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 17:11:04 +0200
Message-Id: <84f3a6f2b74809a248d0125647c9f79dad9c4f6d.1409238578.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1409238578.git.pkj@axis.com>
References: <cover.1409238578.git.pkj@axis.com>
In-Reply-To: <cover.1409238578.git.pkj@axis.com>
References: <cover.1409238578.git.pkj@axis.com>
Subject: [PATCH 2/2] package: Correct two typos in a comment
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
X-List-Received-Date: Thu, 28 Aug 2014 15:11:18 -0000

This quite coincidentally invalidates the sstate for do_package which
is needed due to the correction of oe.utils.multiprocess_exec().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0ff5370..a877d28 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1930,9 +1930,9 @@ python do_package () {
     # Optimisations
     ###########################################################################
 
-    # Contunually rexpanding complex expressions is inefficient, particularly when
-    # we write to the datastore and invalidate the expansion cache. This code 
-    # pre-expands some frequently used variables
+    # Continually expanding complex expressions is inefficient, particularly
+    # when we write to the datastore and invalidate the expansion cache. This
+    # code pre-expands some frequently used variables
 
     def expandVar(x, d):
         d.setVar(x, d.getVar(x, True))
-- 
1.9.0


