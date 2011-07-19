Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/AstqBtti/6umc/QAMXi1ncTLOofuKihk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjEMa-0006T8-Cn
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:45:44 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHfdrl009980;
	Tue, 19 Jul 2011 12:41:39 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:41:34 -0500
Message-Id: <1311097296-17200-4-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311097296-17200-3-git-send-email-galak@kernel.crashing.org>
References: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-2-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-3-git-send-email-galak@kernel.crashing.org>
Cc: yocto@yoctoproject.org
Subject: [PATCH v2 3/5] tune-ppce500v2: Add a tune file for PowerPC e500v2 cores
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
X-List-Received-Date: Tue, 19 Jul 2011 17:45:45 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce500v2.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce500v2.inc

* Removed TARGET_OS_powerpc (not needed)

diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
new file mode 100644
index 0000000..d76dbc9
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -0,0 +1,4 @@
+TARGET_CC_ARCH = "-mcpu=8548 -mabi=spe -mspe"
+BASE_PACKAGE_ARCH = "ppce500v2"
+FEED_ARCH = "ppce500v2"
+PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
-- 
1.7.3.4



