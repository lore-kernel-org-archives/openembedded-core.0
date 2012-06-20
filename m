Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ShU8i-0001Dg-M2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 01:16:44 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3254930414
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 19:05:55 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 16:05:51 -0700
Message-Id: <e03d530b89b30c1e071c13df39b1df2ad9be858c.1340233133.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340233133.git.scott.a.garman@intel.com>
References: <cover.1340233133.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340233133.git.scott.a.garman@intel.com>
References: <cover.1340233133.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3254930414.027AC
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/6] linux-yocto/3.2: update to v3.2.18
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
X-List-Received-Date: Wed, 20 Jun 2012 23:16:44 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the 3.2 kernel SRCREVs to pickup the -stable update
to v3.2.18.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reworked commit to fix merge conflicts with denzil branch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 21cd84d..690d3e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,11 +11,11 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.11"
+LINUX_VERSION ?= "3.2.18"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
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
index c228794..edffec9 100644
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
1.7.9.5



