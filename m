Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SsFAv-00016u-GY
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:31:29 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KFJt17008000;
	Fri, 20 Jul 2012 08:19:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 20 Jul 2012 11:19:25 -0400
Message-Id: <ec029299260693f0ed272c9eddc9712fc87ccda7.1342796935.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes
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
X-List-Received-Date: Fri, 20 Jul 2012 15:31:30 -0000

Updating the 3.4 meta SRCREV for the following fixes:

  949fddd meta: crownbay.scc change emgd branch name
  cd0721a yocto/emgd: emgd 1.14 driver
  c2b5ee3 meta: disable CONFIG_MTD_NAND_VERIFY_WRITE
  004cadb meta: kmemcheck: 'other' configs turning on CONFIG_FUNCTION_TRACER

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index f30f6dd..97a1a19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "b25f7c9730e3bd3be1bf7b7982251b7459ad6579"
 SRCREV_machine_qemuppc ?= "2777125ab6f92b624ecaf11d6b1ab604e64497a8"
-SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
+SRCREV_meta ?= "949fddda61053cc15e46c015e8f7db17e7b33360"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 39b5cdf..f031e1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "08732f25bc3cb404e29ae201074bcf5c1661ea83"
 SRCREV_machine_qemux86 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
 SRCREV_machine_qemux86-64 ?= "6297e4c1d57e1063bfce297c2e12392348598559"
 SRCREV_machine ?= "6297e4c1d57e1063bfce297c2e12392348598559"
-SRCREV_meta ?= "a8cf77018b0faa0d29f1483ff4e5a2034dc8edd5"
+SRCREV_meta ?= "949fddda61053cc15e46c015e8f7db17e7b33360"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



