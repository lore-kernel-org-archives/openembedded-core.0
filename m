Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 941AF6010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 194E11806F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id EMYEc6fctd5j
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 50ADC18058
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 37EA018E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 2D9211B0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 2BE0832C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 125247C611; Tue, 23 Aug 2016 09:28:25 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:28:10 +0200
Message-Id: <1471937290-16470-1-git-send-email-ola.x.nilsson@axis.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: Use the wildcard flag in update_recipe_patch
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
X-List-Received-Date: Tue, 23 Aug 2016 07:28:30 -0000

The --wilcard-version flag was only used in the srcrev variant of the
update-recipe command.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3de2401..6874224 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1186,6 +1186,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                         removevalues = {'SRC_URI': removedentries + remaining}
                 _, destpath = oe.recipeutils.bbappend_recipe(
                                 rd, appendlayerdir, files,
+                                wildcardver=wildcard_version,
                                 removevalues=removevalues)
             else:
                 logger.info('No patches or local source files needed updating')
-- 
2.1.4


