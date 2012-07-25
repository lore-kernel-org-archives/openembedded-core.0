Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Su8Ww-000477-My
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 22:50:03 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6PKcSwH000113;
	Wed, 25 Jul 2012 13:38:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 25 Jul 2012 16:37:51 -0400
Message-Id: <664323e663be764bfcc3790d24c12975da3cf88d.1343248324.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343248324.git.bruce.ashfield@windriver.com>
References: <cover.1343248324.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1343248324.git.bruce.ashfield@windriver.com>
References: <cover.1343248324.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/rt: update BSP preempt-rt.scc files to enable live boot
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
X-List-Received-Date: Wed, 25 Jul 2012 20:50:03 -0000

Updating the meta branch SCREV to pickup the preempt-rt commits
to fix live boot on the x86 boards:

  7ff48aa sys940x: Append default preempt-rt policy
  052ecea sugarbay: Append default preempt-rt policy
  b8230e3 jasperforest: Append default preempt-rt policy
  7fb788a chiefriver: Append default preempt-rt policy
  ffbb5ea romley: Append default preempt-rt policy
  5fe5f68 cedartrail: Append default preempt-rt policy
  85bee0c atom-pc: Append default preempt-rt policy

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index bfab6ba..e2aa67d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "01c5c310886e87e785db5c3bb776deb5ed2e03b2"
 SRCREV_machine_qemuppc ?= "9f5b45a730b902ed8a0809c9542512188e8fcabf"
-SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
+SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 3e7952d..ea2ce02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "2d008a6dcbf565878cee14c5f050eca53897316f"
 SRCREV_machine_qemuppc ?= "94d25f958b6dfb1e8009a0feea7ab4c9a8f54a99"
-SRCREV_meta ?= "d7a96809a585e06933d8c08adb9b9f66b21efb4c"
+SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 9e130ba..6d0550c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.2.18"
 KMETA = "meta"
 
 SRCREV_machine ?= "2f986ab91c08c16f8d201518b11be0e367eb0e14"
-SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
+SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index b1e8933..de716da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,7 +15,7 @@ SRCREV_machine_qemuppc ?= "14be92545abd339033570620e84ec2ae6780be29"
 SRCREV_machine_qemux86 ?= "34e76349ed6cb7cadbbf94a5b34712d139703c8a"
 SRCREV_machine_qemux86-64 ?= "f3625121d459b8e38f7528c2f5d2feb6078d0de9"
 SRCREV_machine ?= "7cc31a952f78b8f8e8469eed93c23e9675a8eeb5"
-SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
+SRCREV_meta ?= "486f7aec824b4127e91ef53228823e996b3696f0"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index f3867f7..48333b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "6229fc0f62283e0dc9f8b5d2be01b048a92867f3"
 SRCREV_machine_qemux86 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
 SRCREV_machine_qemux86-64 ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
 SRCREV_machine ?= "19f7e43b54aef08d58135ed2a897d77b624b320a"
-SRCREV_meta ?= "d7a96809a585e06933d8c08adb9b9f66b21efb4c"
+SRCREV_meta ?= "7ff48aa47c50b6455d60ca93bc81260ce8fe1a1b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



