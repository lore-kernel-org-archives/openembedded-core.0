Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S4PFs-0007SN-86
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 05:10:36 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2541bnf002549;
	Sun, 4 Mar 2012 20:01:39 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  4 Mar 2012 23:01:20 -0500
Message-Id: <f4a5d3a1ef1968cb360bb9a5371e60a965178e61.1330919584.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: use bareclone option
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
X-List-Received-Date: Mon, 05 Mar 2012 04:10:36 -0000

Instead of specifying nocheckout=1, it provides a better workflow if
the linux-yocto recipes use the new bareclone=1 option to get a mirrored
copy of the source repository. This allows all local and remote branches
to be available during the kernel build and development cycle.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 8090535..8120300 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -18,10 +18,10 @@ SRCREV_machine ?= "03705f7f066d83b4cd3a6088781d47e3b9e45b71"
 SRCREV_machine_qemuppc ?= "c8b184e8171f6f5a8017be4c5bf1e7a38c3f3002"
 SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
-PR = "r1"
+PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # Omit broken machines from COMPATIBLE_MACHINE
 #   qemuppc hangs at boot
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index bbb227f..e5db5df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -19,10 +19,10 @@ SRCREV_machine_qemuppc ?= "470deb222a704f84f3acf3a013a19d2da399d511"
 SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
 
-PR = "r0"
+PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # Omit broken machines from COMPATIBLE_MACHINE
 #   qemuppc hangs at boot
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index 32d502f..61706ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -10,10 +10,10 @@ LINUX_VERSION ?= "3.0.22"
 SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
 SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
-PR = "r1"
+PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta \
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta \
            file://core.cfg \
            file://serial.cfg \
            file://ext2.cfg \
diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 27c7558..d3da75c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -20,10 +20,10 @@ SRCREV_machine_qemux86-64 = "af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
 SRCREV_machine = "4ae8f8605c81c39b959948e23f7123294a5dfb3f"
 SRCREV_meta = "aeea99683c7283f1f3320bf2ee7085ee252d4e7e"
 
-PR = "r22"
+PR = "r23"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 58e1f6b..819bf70 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -20,10 +20,10 @@ SRCREV_machine_qemux86-64 ?= "14fe1742198bd5a85fbcf6e53d336838ff87b2ef"
 SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
 SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
-PR = "r3"
+PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index ecde039..bad6f5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -26,10 +26,10 @@ SRCREV_machine_qemux86-64 ?= "f54af84c64408a0259a919d1fd2405c0115c0a0b"
 SRCREV_machine ?= "21ab5dca134a6bf1316aa59f69f9ee9e091d5702"
 SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
-PR = "r0"
+PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
-- 
1.7.4.1



