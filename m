Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QpYRH-0001xh-5x
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:24:43 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p764K9SJ002298;
	Fri, 5 Aug 2011 21:20:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Aug 2011 00:19:52 -0400
Message-Id: <3d3b0314c8c43ac09ed2bbf9b9c3cc2d58168db9.1312604261.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1312604261.git.bruce.ashfield@windriver.com>
References: <cover.1312604261.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto: merge v3.0.1
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
X-List-Received-Date: Sat, 06 Aug 2011 04:24:43 -0000

3.0.1 -stable has been released. This now becomes the baseline for
the 3.0 linux-yocto tree. As was the policy in the 2.6.34 and
2.6.37 kernels, the version stays at 3.0 in the recipe.

Build and boot tested on qemu* targets.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index bd08ca6..a7bd67a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -14,12 +14,12 @@ KMETA = meta
 LINUX_VERSION ?= "3.0"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "703430f6cd786d9f42fdee1936337ecf1c3d27b5"
-SRCREV_machine_qemumips = "a3bb11ebd7dd1482de334dd71f8e4afe5e2bcd32"
-SRCREV_machine_qemuppc = "582dcc88c7c4d765c03b38ff384210d6efbf7956"
-SRCREV_machine_qemux86 = "099a40c1669d20fdae2846cfd28bf74fd38dacea"
-SRCREV_machine_qemux86-64 = "896b8fd5783a6aac80d1447da5958334f4734845"
-SRCREV_machine = "2d22c15ef4802bc117c5482217c2b2c4d34ab303"
+SRCREV_machine_qemuarm = "30a2cec4e9d7048681c1d239f49cc935287a7012"
+SRCREV_machine_qemumips = "f9b9688cefaa87d898394902acfb858d6b0f1e28"
+SRCREV_machine_qemuppc = "a46a4c356f8bcf7a30d967a1b43633b824cd07a1"
+SRCREV_machine_qemux86 = "efaab1f75dbc577922c862fa19d45c3f31cb99cb"
+SRCREV_machine_qemux86-64 = "c30a56850c73c74af2d056d803081a0d829ce35c"
+SRCREV_machine = "318b059a472128f67119f367f51f11893ee60269"
 SRCREV_meta = "76b3679beff6c640388a609ccf87f46bb7bf0f2b"
 
 PR = "r0"
-- 
1.7.4.1



