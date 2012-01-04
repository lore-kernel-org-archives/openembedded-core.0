Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RiXKC-000524-JE
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 21:20:42 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q04KDE7p001257;
	Wed, 4 Jan 2012 12:13:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Jan 2012 15:13:01 -0500
Message-Id: <d3af364daa91dbc6e244459a4ad56e4670d67736.1325706838.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1325706838.git.bruce.ashfield@windriver.com>
References: <cover.1325706838.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1325706838.git.bruce.ashfield@windriver.com>
References: <cover.1325706838.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: bump kernel version to v3.0.14
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
X-List-Received-Date: Wed, 04 Jan 2012 20:20:42 -0000

Updating the 3.0 kernel recipe to contain v3.0.14 -stable.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   19 ++++++++++---------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 81d22d0..8ece90a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.12"
+LINUX_VERSION ?= "3.0.14"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "6e96ccbbf19a4a7b67d98fdcd74d2c9da2c7c463"
-SRCREV_machine_qemuppc ?= "8ea61de7fd201ff0001a039f2fda8ec2e4a562a1"
-SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
+SRCREV_machine ?= "bcf4107c7f22d10952618a2ad146e6149d240cd2"
+SRCREV_machine_qemuppc ?= "1e5511ea2cb5f150ffce86071035a81c0499494b"
+SRCREV_meta ?= "e6d8ed43eb051a5db90856cb6226d1cc05d301c5"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index b650c84..7edcb1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,16 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.12"
-
-SRCREV_machine_qemuarm ?= "b2a7d668b963f1c5f9876f130278dd9fb7df4831"
-SRCREV_machine_qemumips ?= "62bb04e5ba19b5b8aacd9079fdfbcb8284cd9fc8"
-SRCREV_machine_qemuppc ?= "7ecece328c5987112de2959f8f998dfcedaf7210"
-SRCREV_machine_qemux86 ?= "a611ba462ac51b2bfdac1c5c6538dac95ad9b4dd"
-SRCREV_machine_qemux86-64 ?= "b15a9b67089e31ef9780fdbd0481f48ef7facdba"
-SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
-SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
+LINUX_VERSION ?= "3.0.14"
+
+
+SRCREV_machine_qemuarm ?= "5a941c2d553d3244527845f096d0a7d95cdfac22"
+SRCREV_machine_qemumips ?= "0f2c18fe373339e61a55a6d826784b0cde2d5704"
+SRCREV_machine_qemuppc ?= "925b585f17da9c51e2159023f813bca391528013"
+SRCREV_machine_qemux86 ?= "54794354969774f71fdd71bd20de02f1a990b84d"
+SRCREV_machine_qemux86-64 ?= "20a790396e6eeb7c0e77135fa2a86ea8ad505b6f"
+SRCREV_machine ?= "e143cd3316f18a15d93365442e1f6eea716aab84"
+SRCREV_meta ?= "e6d8ed43eb051a5db90856cb6226d1cc05d301c5"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



