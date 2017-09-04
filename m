Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id B24F36FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 14:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 37E032E279
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id wtv9NYqlvTNc
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 4E5D42E0C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35F6C1A067
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 294BA1A070
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 1D826263C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 18D3D409AF; Mon,  4 Sep 2017 16:18:37 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 16:18:37 +0200
Message-Id: <20170904141837.12834-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] devtool: status: Sort entries before printing
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
X-List-Received-Date: Mon, 04 Sep 2017 14:18:39 -0000

Sorted entries are easier to read.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 174cc861e1..0998fa7055 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1597,7 +1597,7 @@ def update_recipe(args, config, basepath, workspace):
 def status(args, config, basepath, workspace):
     """Entry point for the devtool 'status' subcommand"""
     if workspace:
-        for recipe, value in workspace.items():
+        for recipe, value in sorted(workspace.items()):
             recipefile = value['recipefile']
             if recipefile:
                 recipestr = ' (%s)' % recipefile
-- 
2.11.0


