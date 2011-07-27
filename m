Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QlvHS-0007IS-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 05:59:35 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6R3tF6c016454;
	Tue, 26 Jul 2011 20:55:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 26 Jul 2011 23:55:12 -0400
Message-Id: <35a96b8d01511443b0743cca3543a4cdc007cff2.1311738733.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311738733.git.bruce.ashfield@windriver.com>
References: <cover.1311738733.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1311738733.git.bruce.ashfield@windriver.com>
References: <cover.1311738733.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update SRCREVs
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
X-List-Received-Date: Wed, 27 Jul 2011 03:59:35 -0000

Updating the linux-yocto SRCREVs to pickup changes from the
continuing uprev to korg 3.0. With this set of update, the
meta/feature audits are complete.

qemumips and qemuppc are fixed with this update and can now
boot to a prompt.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 342993f..8f49668 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "3.0"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "021129d0ad7dd63cbe68c9a1d369519a9e5e8440"
-SRCREV_machine_qemumips = "e86282b3085c5310d1c43af66242845ddadd49b6"
-SRCREV_machine_qemuppc = "f4ce805d0b74f9f32b6455730485120e27a4711e"
-SRCREV_machine_qemux86 = "3216e7d5c3cada16161481826cdb39c930457587"
-SRCREV_machine_qemux86-64 = "3216e7d5c3cada16161481826cdb39c930457587"
-SRCREV_machine = "3216e7d5c3cada16161481826cdb39c930457587"
-SRCREV_meta = "9010d1cbef2633dac7e559a7705c326b7601dd4c"
+SRCREV_machine_qemuarm = "703430f6cd786d9f42fdee1936337ecf1c3d27b5"
+SRCREV_machine_qemumips = "a3bb11ebd7dd1482de334dd71f8e4afe5e2bcd32"
+SRCREV_machine_qemuppc = "582dcc88c7c4d765c03b38ff384210d6efbf7956"
+SRCREV_machine_qemux86 = "099a40c1669d20fdae2846cfd28bf74fd38dacea"
+SRCREV_machine_qemux86-64 = "896b8fd5783a6aac80d1447da5958334f4734845"
+SRCREV_machine = "2d22c15ef4802bc117c5482217c2b2c4d34ab303"
+SRCREV_meta = "37856a69113155d343efc8f8c59c7e63fbf963c4"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



