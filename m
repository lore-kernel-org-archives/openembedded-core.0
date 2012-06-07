Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2b-0004rM-Sh
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:46 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07Dd018923;
	Thu, 7 Jun 2012 13:00:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:48 -0400
Message-Id: <1e7e5996dee5dcbb05b6ebf5ab4ba0b051871d32.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 7/9] linux-yocto/3.2: fri2 and chiefriver machine updates
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:47 -0000

Bumping the 3.2 SRCREVs to pickup the following configuration changes for
the new chiefriver BSP and the existing fri2 machines:

 5b4c9dc fri2: update base config
 cdfbb50 fri2: add usb-mass-storage to standard and preempt-rt
 3c1af06 fri2 update: drop NETDEVICE, e1xxx, usb-mass-storage, add iwlwifi feature
 26a4d79 iwlagn: Correct a comment typo
 ade9c57 iwlwifi: Add a feature for iwlwifi
 571b6cb fri2: Configuration update (usb, wifi, i2c)
 b257485 meta: add tmp/rc6 feature
 24c6494 chiefriver: create initial BSP infrastructure

All branches are also updated with the following fix:

  1ce6700 efi: Add patch to fix 32bit EFI service mapping (rhbz 726701)

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index f27e39e..a07b27a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -9,9 +9,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fe2630b38159ea7b9cf977b5fed40a9917002087"
-SRCREV_machine_qemuppc ?= "0259e5a3ef568c6979f2cb31280a43c55c784f4f"
-SRCREV_meta ?= "0a18db9fc89a0e030e8c7b8d01fe03c5ca4197e3"
+SRCREV_machine ?= "c413f23eafb3e91ff98653e578e771532fd71be9"
+SRCREV_machine_qemuppc ?= "d7020ba154df03cba5351011ff664f5e3e1ce678"
+SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 81aefb1..546971b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -10,8 +10,8 @@ KCONFIG_MODE = "--allnoconfig"
 
 LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine ?= "8b8cfaaab2b8d79ac56e8c9a85bad9ae7bca399c"
-SRCREV_meta ?= "0a18db9fc89a0e030e8c7b8d01fe03c5ca4197e3"
+SRCREV_machine ?= "27b68a93eb791e830da8d3a2c0fc99780897ad89"
+SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index ac4e454..85c0096 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -10,13 +10,13 @@ KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
 LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine_qemuarm ?= "259cff0813417d16baaaaf44b00a9f75103ebfcb"
-SRCREV_machine_qemumips ?= "9a803ecc05b3af481036a6d9bb0da3a899be3074"
-SRCREV_machine_qemuppc ?= "466746d1fe6370957ba087f9ca6f2e31201b2162"
-SRCREV_machine_qemux86 ?= "c228cadee60f0ada73d11a36f6932f50a1c52d48"
-SRCREV_machine_qemux86-64 ?= "b95a0ae3773545fa0ed9a47088d0361527c42e6c"
-SRCREV_machine ?= "8b8cfaaab2b8d79ac56e8c9a85bad9ae7bca399c"
-SRCREV_meta ?= "0a18db9fc89a0e030e8c7b8d01fe03c5ca4197e3"
+SRCREV_machine_qemuarm ?= "ebb5e65d02a352e3e8601096e1674ffc261345f2"
+SRCREV_machine_qemumips ?= "62aeb307e9a731c4bba05ce4d57b9cece41a2a01"
+SRCREV_machine_qemuppc ?= "1396a8f7b62f8926dc1fa474c7d94ae920d81852"
+SRCREV_machine_qemux86 ?= "9d32bb075e349cc69c7af42b60f6715c5d8c972e"
+SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
+SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
+SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654l"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



