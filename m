Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E43137831C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1E54E2E6C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9ZrQL5-jvJnS
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 655B92E6C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 558E61A088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 499451A08B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3DEB22C64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v59JYgpF010963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 21:34:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v59JYgsq010962
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Jun 2017 21:34:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 21:34:25 +0200
Message-Id: <f3a878cd8bfa1e9da54e14de5cc811948fce351b.1497036762.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497036762.git.pkj@axis.com>
References: <cover.1497036762.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 03/13] insane.bbclass: Report all file-rdeps errors, not just the first
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
X-List-Received-Date: Fri, 09 Jun 2017 19:34:47 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5a3d017004..258856266e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -968,7 +968,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 for key in filerdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS_%s?" % \
                             (filerdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
-                package_qa_handle_error("file-rdeps", error_msg, d)
+                    package_qa_handle_error("file-rdeps", error_msg, d)
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
 
-- 
2.12.0


