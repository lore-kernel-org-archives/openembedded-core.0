Return-Path: <tobias@techne.local>
Received: from techne.local (unknown [62.63.211.71])
	by mail.openembedded.org (Postfix) with ESMTP id 432F96E988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 16:14:38 +0000 (UTC)
Received: by techne.local (Postfix, from userid 501)
	id 76C29B7C5F8; Fri, 31 Jan 2014 17:14:37 +0100 (CET)
From: Tobias Blom <tobias.blom@techne-dev.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 17:14:35 +0100
Message-Id: <1391184875-7463-1-git-send-email-tobias.blom@techne-dev.se>
X-Mailer: git-send-email 1.8.3.4 (Apple Git-47)
Subject: [meta-oe][PATCH] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Fri, 31 Jan 2014 16:14:38 -0000

Prefix to EnvironmentFile should be preciding the filenamn.

Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
index 62d6af1..ffab823 100644
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
@@ -3,5 +3,5 @@ Description=Advanced Power Management daemon
 After=remote-fs.target
 
 [Service]
-EnvironmentFile-= @SYSCONFDIR@/default/apmd
+EnvironmentFile=-@SYSCONFDIR@/default/apmd
 ExecStart=@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
-- 
1.8.3.4 (Apple Git-47)


