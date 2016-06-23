Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 95A50607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:53:30 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1bG7sg-0006U9-D3 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2016 09:53:30 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 23 Jun 2016 09:53:29 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 11:53:28 -0500
Message-ID: <1466700808-30547-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] recipetool: recognize less common makefile names
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
X-List-Received-Date: Thu, 23 Jun 2016 16:53:30 -0000
Content-Type: text/plain

GNU make looks for "makefile" and "GNUmakefile" in addition to
"Makefile", so add these other names to the heuristic for detecting a
make-based project.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 scripts/lib/recipetool/create_buildsys.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 78ae4bcdec5e..e08ad277d7b3 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -737,7 +737,7 @@ plugins = None
         if 'buildsystem' in handled:
             return False
 
-        makefile = RecipeHandler.checkfiles(srctree, ['Makefile'])
+        makefile = RecipeHandler.checkfiles(srctree, ['Makefile', 'makefile', 'GNUmakefile'])
         if makefile:
             lines_after.append('# NOTE: this is a Makefile-only piece of software, so we cannot generate much of the')
             lines_after.append('# recipe automatically - you will need to examine the Makefile yourself and ensure')
-- 
2.5.5


