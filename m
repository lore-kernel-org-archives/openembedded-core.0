Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjENl-0006b9-Eg
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:46:57 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHgnnx010636
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 12:42:50 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:42:49 -0500
Message-Id: <1311097369-17260-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune-ppce500mc: Add a tune file for PowerPC e500mc core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 17:46:57 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce500mc.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce500mc.inc

diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
new file mode 100644
index 0000000..763ec1a
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -0,0 +1,4 @@
+TARGET_CC_ARCH = "-mcpu=e500mc"
+BASE_PACKAGE_ARCH = "ppce500mc"
+FEED_ARCH = "ppce500mc"
+PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
-- 
1.7.3.4



