Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2Z-0004qx-Nl
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:44 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07DY018923;
	Thu, 7 Jun 2012 13:00:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:43 -0400
Message-Id: <6a82e2ce9614675158c5277c3605b09628e21f4c.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/9] linux-yocto/3.2: update to v3.2.18
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:44 -0000

Updating the 3.2 kernel SRCREVs to pickup the -stable update
to v3.2.18.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index b275ad4..f881c1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,13 +11,13 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.11"
+LINUX_VERSION ?= "3.2.18"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3ebf4d172cf4a41d2abf09e4036f0850e08064e7"
-SRCREV_machine_qemuppc ?= "7cebfe717987f4ffa9ae90558c28f45049847c1c"
+SRCREV_machine ?= "fe2630b38159ea7b9cf977b5fed40a9917002087"
+SRCREV_machine_qemuppc ?= "0259e5a3ef568c6979f2cb31280a43c55c784f4f"
 SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index f50e12e..80be112 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -9,9 +9,9 @@ KBRANCH = "standard/tiny"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.2.11"
+LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine ?= "61960ba8e910d54b5525d5e9b6a7469bc399c246"
+SRCREV_machine ?= "8b8cfaaab2b8d79ac56e8c9a85bad9ae7bca399c"
 SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 14de6f4..665ddca 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,14 +15,14 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.11"
-
-SRCREV_machine_qemuarm ?= "ba47a1cc9bb6ad576b2ac7adb3036bcfa569fe2e"
-SRCREV_machine_qemumips ?= "3b2fd654392a2f33aed12748548c04e9b169591b"
-SRCREV_machine_qemuppc ?= "cf3e188cf2a18c48a0e6f9ca54c36e6ac39512ec"
-SRCREV_machine_qemux86 ?= "46f1007ad22b6790224c66a8dc4e80fdbd21eea1"
-SRCREV_machine_qemux86-64 ?= "00e5ec2393bada6723bd9a07ded3d001c02fa727"
-SRCREV_machine ?= "f4f8ba730e7783e09413872414d0a17c142c816d"
+LINUX_VERSION ?= "3.2.18"
+
+SRCREV_machine_qemuarm ?= "259cff0813417d16baaaaf44b00a9f75103ebfcb"
+SRCREV_machine_qemumips ?= "9a803ecc05b3af481036a6d9bb0da3a899be3074"
+SRCREV_machine_qemuppc ?= "466746d1fe6370957ba087f9ca6f2e31201b2162"
+SRCREV_machine_qemux86 ?= "c228cadee60f0ada73d11a36f6932f50a1c52d48"
+SRCREV_machine_qemux86-64 ?= "b95a0ae3773545fa0ed9a47088d0361527c42e6c"
+SRCREV_machine ?= "8b8cfaaab2b8d79ac56e8c9a85bad9ae7bca399c"
 SRCREV_meta ?= "49f931bc294d5b6be60502bbd448cff5aa766235"
 
 PR = "r1"
-- 
1.7.5.4



