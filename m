Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Soe8y-0007Zz-R7
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:22:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6AHBLlC001136;
	Tue, 10 Jul 2012 10:11:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 10 Jul 2012 13:11:03 -0400
Message-Id: <556fd8b9bf26277d3be395e01d732a10c447853e.1341933187.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341933187.git.bruce.ashfield@windriver.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341933187.git.bruce.ashfield@windriver.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto/3.2: perf: fix mips build
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
X-List-Received-Date: Tue, 10 Jul 2012 17:22:37 -0000

Updating SRCREVs for the following fix:

Author: Tom Zanussi <tom.zanussi@intel.com>
Date:   Tue Jul 10 09:38:40 2012 -0500

    perf: add sgidefs.h to for mips builds

    Allow Python.h to find the definitions it needs on mips i.e. get rid
    of the error: "_ABIN32" is not defined.

    Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 6b98036..bfab6ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5bc4c850a416406347ef08d1ed8cb8cf97d57f14"
-SRCREV_machine_qemuppc ?= "19c1534b244ff98a5d921bfad64ccde4f7337c3a"
+SRCREV_machine ?= "01c5c310886e87e785db5c3bb776deb5ed2e03b2"
+SRCREV_machine_qemuppc ?= "9f5b45a730b902ed8a0809c9542512188e8fcabf"
 SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index f331aa8..9e130ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -11,7 +11,7 @@ LINUX_VERSION ?= "3.2.18"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6f962975e52f7ebbb5c4897aa77d76f5957a000e"
+SRCREV_machine ?= "2f986ab91c08c16f8d201518b11be0e367eb0e14"
 SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 3aa19d2..b1e8933 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -9,12 +9,12 @@ KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
 LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine_qemuarm ?= "50a1849ed5e180dc900471d12f41e76f6fe38fff"
-SRCREV_machine_qemumips  ?= "24a13cca4ace1cb16da0a6379514bdea82924c06"
-SRCREV_machine_qemuppc ?= "b4c41eb3dfedb80c253886451bb4c5120c547c57"
-SRCREV_machine_qemux86 ?= "0e2accb1b10421b7daac77144b11862a4bb47caa"
-SRCREV_machine_qemux86-64 ?= "6c62f352ad9ca61b0cb3e0ff9ae474d64c02e6ef"
-SRCREV_machine ?= "0ec416edf0b0cab3e919c0a1c167a883f8b344a2"
+SRCREV_machine_qemuarm ?= "2ea2477e2965569517671ec03fa9496214e8bff1"
+SRCREV_machine_qemumips  ?= "17eb00dec08ef91acfb6d7adca81cb6e344b6c68"
+SRCREV_machine_qemuppc ?= "14be92545abd339033570620e84ec2ae6780be29"
+SRCREV_machine_qemux86 ?= "34e76349ed6cb7cadbbf94a5b34712d139703c8a"
+SRCREV_machine_qemux86-64 ?= "f3625121d459b8e38f7528c2f5d2feb6078d0de9"
+SRCREV_machine ?= "7cc31a952f78b8f8e8469eed93c23e9675a8eeb5"
 SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
-- 
1.7.5.4



