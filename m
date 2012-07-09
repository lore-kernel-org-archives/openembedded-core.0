Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SoHyt-00078R-Ot
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:42:44 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69HVUi4025973;
	Mon, 9 Jul 2012 10:31:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  9 Jul 2012 13:31:15 -0400
Message-Id: <01742e3c0548f99232a72fdc1d3cc2aa9ddf5a70.1341854902.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341854902.git.bruce.ashfield@windriver.com>
References: <cover.1341854902.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341854902.git.bruce.ashfield@windriver.com>
References: <cover.1341854902.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.2: perf scripting updates
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
X-List-Received-Date: Mon, 09 Jul 2012 17:42:44 -0000

Updating the 3.2 SRCREVs to reflect the perf scripting fixes by TomZ

standard/default/base:
  0ec416e perf: change --root to --prefix for python install
  18ad076 perf: add 'libperl not found' warning
  e0f641d perf: use pkg-config instead of python-config
  3195098 Revert "perf: hard-code NO_LIBPERL/NO_LIBPYTHON"

meta:
  07ee09b features/ftrace: enable FTRACE_SYSCALLS

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index cf88fae..6b98036 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c413f23eafb3e91ff98653e578e771532fd71be9"
-SRCREV_machine_qemuppc ?= "d7020ba154df03cba5351011ff664f5e3e1ce678"
-SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
+SRCREV_machine ?= "5bc4c850a416406347ef08d1ed8cb8cf97d57f14"
+SRCREV_machine_qemuppc ?= "19c1534b244ff98a5d921bfad64ccde4f7337c3a"
+SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 5381770..f331aa8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -11,8 +11,8 @@ LINUX_VERSION ?= "3.2.18"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "27b68a93eb791e830da8d3a2c0fc99780897ad89"
-SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
+SRCREV_machine ?= "6f962975e52f7ebbb5c4897aa77d76f5957a000e"
+SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 1e9a1d1..3aa19d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -9,13 +9,13 @@ KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
 LINUX_VERSION ?= "3.2.18"
 
-SRCREV_machine_qemuarm ?= "ebb5e65d02a352e3e8601096e1674ffc261345f2"
-SRCREV_machine_qemumips ?= "62aeb307e9a731c4bba05ce4d57b9cece41a2a01"
-SRCREV_machine_qemuppc ?= "1396a8f7b62f8926dc1fa474c7d94ae920d81852"
-SRCREV_machine_qemux86 ?= "9d32bb075e349cc69c7af42b60f6715c5d8c972e"
-SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
-SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
-SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
+SRCREV_machine_qemuarm ?= "50a1849ed5e180dc900471d12f41e76f6fe38fff"
+SRCREV_machine_qemumips  ?= "24a13cca4ace1cb16da0a6379514bdea82924c06"
+SRCREV_machine_qemuppc ?= "b4c41eb3dfedb80c253886451bb4c5120c547c57"
+SRCREV_machine_qemux86 ?= "0e2accb1b10421b7daac77144b11862a4bb47caa"
+SRCREV_machine_qemux86-64 ?= "6c62f352ad9ca61b0cb3e0ff9ae474d64c02e6ef"
+SRCREV_machine ?= "0ec416edf0b0cab3e919c0a1c167a883f8b344a2"
+SRCREV_meta ?= "07ee09b520579b9f29bd15fefb01fd28b34c6064"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



