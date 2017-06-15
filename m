Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13027783E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D776A18502
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zdBHgjZO_X-n
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:02 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C4E8A18510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8065E1A07D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D14E1A080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 71E33DD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FFc1QZ014239
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FFc1SB014238
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 17:38:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:37:57 +0200
Message-Id: <dad0df752e4e9edea859701f46a89d9b60e580be.1497540930.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 10/11] insane.bbclass: Ignore perl as dependency for nativesdk packages
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
X-List-Received-Date: Thu, 15 Jun 2017 15:38:02 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f6fd7c74d8..d57b98e04c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -906,7 +906,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
             if bb.data.inherits_class('nativesdk', d):
-                ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl'])
+                ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl', 'perl'])
             # For Saving the FILERDEPENDS
             filerdepends = {}
             rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
-- 
2.12.0


