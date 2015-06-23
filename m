Return-Path: <fabien.proriol@jdsu.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jun 2015 09:48:41 UTC
Received: from ks.kazoe.org (ks.kazoe.org [91.121.82.209])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF626AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:48:41 +0000 (UTC)
From: fabien.proriol@jdsu.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 11:38:00 +0200
Message-Id: <1435052280-17818-1-git-send-email-fabien.proriol@jdsu.com>
X-Mailer: git-send-email 2.3.6
Cc: Fabien Proriol <fabien.proriol@jdsu.com>, rpurdie@rpsys.net
Subject: [PATCH] Display Runned Task in verbose mode
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
X-List-Received-Date: Tue, 23 Jun 2015 09:48:42 -0000

From: Fabien Proriol <fabien.proriol@jdsu.com>

It can be usefull to list task order with
bitbake -n -v <recipe>
---
 bitbake/lib/bb/ui/knotty.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/lib/bb/ui/knotty.py b/bitbake/lib/bb/ui/knotty.py
index 2bee242..2a6f175 100644
--- a/bitbake/lib/bb/ui/knotty.py
+++ b/bitbake/lib/bb/ui/knotty.py
@@ -467,6 +467,7 @@ def main(server, eventHandler, params, tf = TerminalFilter):
                     tasktype = 'noexec task'
                 else:
                     tasktype = 'task'
+                logger.verbose("Task: %s %s"%(event.taskfile.split("/")[-1], event.taskname))
                 logger.info("Running %s %s of %s (ID: %s, %s)",
                             tasktype,
                             event.stats.completed + event.stats.active +
-- 
2.3.6

