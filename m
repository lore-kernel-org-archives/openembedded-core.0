Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3001677697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 60267183E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Zmedyt4k0-Vg
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 647C3183A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 543741E07B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 494041E079
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 345C73FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:17:37 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23BHb4S025949
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 12:17:37 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23BHbE3025946
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 12:17:37 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 12:17:31 +0100
Message-Id: <3c9d7ae2d6dc214821c9e41d63da5a7de8404c22.1488539819.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488539819.git.pkj@axis.com>
References: <cover.1488539819.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv3 1/5] module.bbclass: Add inherit of pkgconfig
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

This is needed for the make_scripts task.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/module.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index a588873..99b7ebc 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,4 +1,4 @@
-inherit module-base kernel-module-split
+inherit module-base kernel-module-split pkgconfig
 
 addtask make_scripts after do_prepare_recipe_sysroot before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-- 
2.9.0


