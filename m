Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TGFQp-0008W8-Hj
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:39:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8OKQGs0000055;
	Mon, 24 Sep 2012 13:26:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Sep 2012 16:25:46 -0400
Message-Id: <a8341c40ffa945b862a7f880fb87679308584847.1348518160.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348518160.git.bruce.ashfield@windriver.com>
References: <cover.1348518160.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1348518160.git.bruce.ashfield@windriver.com>
References: <cover.1348518160.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/3.4: update beagleboard configs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 20:39:07 -0000

Updating to pickup a couple of configuration tweaks that were done
as part of a bump to the 3.4 linux-yocto tree for the beagleboard.

In particular, this updates DVI and USB settings to enable the
perhipherals out of the box.

Signed-off-by: Liang Li <liang.li@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    3 +--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ccc06f8..c8bf028 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,8 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "6d7122966eaae849ba3f2e1ccb94cdab17a46fbd"
 SRCREV_machine_qemuppc ?= "8b2acbc859c616dfcad79f786bacb856f370f4c2"
-SRCREV_meta ?= "3086a24972b0290156fb7993b659b91872388a4a"
-
+SRCREV_meta ?= "5bdc655034a58a7147176a8a882d81e2fd51e4b9"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index a59a7c4..2f8f957 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
 SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_meta ?= "3086a24972b0290156fb7993b659b91872388a4a"
+SRCREV_meta ?= "5bdc655034a58a7147176a8a882d81e2fd51e4b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



