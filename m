Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QzgbK-00054y-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 05:08:59 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8333sLA012398;
	Fri, 2 Sep 2011 20:03:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Sep 2011 23:03:25 -0400
Message-Id: <38e4dbc9f402bc0ace1cc30cc8e30925f0039863.1315017994.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: update to v3.0.4
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
X-List-Received-Date: Sat, 03 Sep 2011 03:08:59 -0000

The v3.0.4 stable kernel is available and it can now be merged
into linux-yocto. Build and boot tested on all qemu* machines.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 2bee543..e8e251d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,11 +11,11 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.3"
+LINUX_VERSION ?= "3.0.4"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "c86423d29c94525d18ef1c9b6c025f733c1e8252"
-SRCREV_machine_qemuppc ?= "ccb47c9e8d85dc00ccd28bc6819d7769e2c11cb3"
+SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
+SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
 SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
 
 PR = "r0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index e39be0d..221f81b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,14 +10,14 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.3"
-
-SRCREV_machine_qemuarm ?= "eecaa32095ab63e0a73f161cf48fd02251eb6c88"
-SRCREV_machine_qemumips ?= "eee3cb2066bb6aae5b3869083cb477b03eb87c79"
-SRCREV_machine_qemuppc ?= "c0da1d35dee9fb63ba6bfc7907a77b0feb89766e"
-SRCREV_machine_qemux86 ?= "8b51ddba0f85a6bb8e105b37a9ac03fb58b9de20"
-SRCREV_machine_qemux86-64 ?= "965dd365cf3652347960f7145ac188c86c323070"
-SRCREV_machine ?= "49d93fb0c9e1645ba0bb8951be23e56ea227a5bd"
+LINUX_VERSION ?= "3.0.4"
+
+SRCREV_machine_qemuarm ?= "b18f5c601ccc90b4c94d1d29282cf7c53fcb6e22"
+SRCREV_machine_qemumips ?= "0696ab4056ddc1b4504e8636e47a918bdff5b257"
+SRCREV_machine_qemuppc ?= "af58047d79790a06e5ac5ba09837c6e65220d7aa"
+SRCREV_machine_qemux86 ?= "515e039eeb316494955e46d38c164e56999511ae"
+SRCREV_machine_qemux86-64 ?= "d19118d19d5f95e83d6fbe1268fe6b84f67de6d3"
+SRCREV_machine ?= "6fcf6f1bca9323fa2e9a5ea15fa84153cccbc28b"
 SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
 
 PR = "r1"
-- 
1.7.4.1



