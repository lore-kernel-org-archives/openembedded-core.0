Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sm4yn-0007lF-86
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:25:29 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63FELjd005061;
	Tue, 3 Jul 2012 08:14:24 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  3 Jul 2012 11:14:14 -0400
Message-Id: <bdea4b0af8fe25060ab1fbb6bb8f6e4c96271707.1341327590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/4] linux-yocto/3.4: update preempt-rt to 3.4.4-rt13
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
X-List-Received-Date: Tue, 03 Jul 2012 15:25:29 -0000

Updating preempt-rt in the 3.4 kernel to the latest upstream version
3.4.4-rt13.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index f856837..44d944f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e24c02204c70e9280115d6512eb54c884dee5fa7"
-SRCREV_machine_qemuppc ?= "b610e46c0ae57e483449c08619d92b8531e75ef5"
-SRCREV_meta ?= "9b7c74bc8e205edb403744098b9d62690c25803e"
+SRCREV_machine ?= "684f3c1886618c919b54e8b362e72da3d128c532"
+SRCREV_machine_qemuppc ?= "fb15c26f9deae3912ca7e2aaf8c818127ef27d82"
+SRCREV_meta ?= "62cdf67899a36efeab3ac20dcb27f1ebc238d3af"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index b21c15d..fe6f6cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "bc74ca65c9cae025861455d7f0a259458cd4a829"
 SRCREV_machine_qemux86 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
 SRCREV_machine_qemux86-64 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
 SRCREV_machine ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
-SRCREV_meta ?= "9b7c74bc8e205edb403744098b9d62690c25803e"
+SRCREV_meta ?= "62cdf67899a36efeab3ac20dcb27f1ebc238d3af"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



