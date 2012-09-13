Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TCFO8-0005Ct-Jc
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:47:48 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DJYrha002911;
	Thu, 13 Sep 2012 12:34:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 13 Sep 2012 15:34:37 -0400
Message-Id: <1d5e637e32e10d7dabd19fbff9f4b25cc280daa2.1347564407.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347564407.git.bruce.ashfield@windriver.com>
References: <cover.1347564407.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347564407.git.bruce.ashfield@windriver.com>
References: <cover.1347564407.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto: virtio and KVM guest configuration
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
X-List-Received-Date: Thu, 13 Sep 2012 19:47:49 -0000

Updating the meta branch SRCREV to pick up virtio and kvm guest
configuration fragments.

  79947f1 meta: add paravirtualized KVM guest config fragment
  3ed86ed meta: add MMIO support in virtio config fragment

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index bbde730..3b6b4e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
 SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
-SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
+SRCREV_meta ?= "79947f1eb9f695c374ba63672f94deaa1de75561"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index f4f2318..0812cff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
 SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
 SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
 SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
-SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
+SRCREV_meta ?= "79947f1eb9f695c374ba63672f94deaa1de75561"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



