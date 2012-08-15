Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T1k3L-0007pq-Nt
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:18:56 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FK6sWd011691;
	Wed, 15 Aug 2012 13:06:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Aug 2012 16:06:21 -0400
Message-Id: <71e186f1f0e62c2d9a1faa7da9472258cb9ae799.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/4] linux-yocto/3.4: remove explicit KBRANCH designations
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
X-List-Received-Date: Wed, 15 Aug 2012 20:18:56 -0000

A BSP specific KBRANCH assignment is no longer a required
element to locate and build a yocto kernel. As such we can
set the default kbranch, and remove all other explicit
assignments.

KBRANCH is still used, and if it is changed from the
default, that branch will be built.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 64a19a1..8ac2402 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -1,14 +1,7 @@
 require recipes-kernel/linux/linux-yocto.inc
 
-KBRANCH = "standard/base"
-KBRANCH_qemux86  = "standard/common-pc/base"
-KBRANCH_qemux86-64  = "standard/common-pc-64/base"
-KBRANCH_qemuppc  = "standard/qemuppc"
-KBRANCH_qemumips = "standard/mti-malta32"
-KBRANCH_qemumipsel = "standard/mti-malta32"
-KBRANCH_qemumips64 = "standard/mti-malta64"
-KBRANCH_qemumips64el = "standard/mti-malta64"
-KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
+KBRANCH_DEFAULT = "standard/base"
+KBRANCH = "${KBRANCH_DEFAULT}"
 
 SRCREV_machine_qemuarm ?= "6db2c606429fa8671e76eb312cdd92f9451cf8e8"
 SRCREV_machine_qemumips  ?= "a9f79fc1bde4f5adb7cb015d2f2b5a04bd5597a1"
-- 
1.7.5.4



