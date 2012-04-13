Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SIngG-00064L-Kc
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 23:05:21 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3DKtrxF012756;
	Fri, 13 Apr 2012 13:55:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 13 Apr 2012 16:55:43 -0400
Message-Id: <68ac4161a837e4125336c781a944687e29f6c782.1334349764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334349764.git.bruce.ashfield@windriver.com>
References: <cover.1334349764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334349764.git.bruce.ashfield@windriver.com>
References: <cover.1334349764.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto/3.2: add igb support to romley
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
X-List-Received-Date: Fri, 13 Apr 2012 21:05:21 -0000

Updating the 3.2 recipe SRCREVs to pickup the following meta change:

[
    meta: Add igb.scc to Romley

    Romley machine has 82580 Giga bit Ethernet Controller.
    Add the relavent Nic driver to it.

    Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 94ada7e..efc4611 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "32ecb53e9ff759bbd297a10712b62a6575daaf86"
 SRCREV_machine_qemuppc ?= "0d5625bb868cc2471d5dd49eb7abe7eb5fe1044b"
-SRCREV_meta ?= "59f350ec3794e19fa806c1b73749d851f8ebf364"
+SRCREV_meta ?= "135c75bf9615334b5b8bb9108d612fe7dfbdb901"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index d2c8bf7..fbff706 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -12,7 +12,7 @@ KCONFIG_MODE = "--allnoconfig"
 LINUX_VERSION ?= "3.2.11"
 
 SRCREV_machine ?= "ec236058dc254183dbfb3744bf21f110c37af30b"
-SRCREV_meta ?= "59f350ec3794e19fa806c1b73749d851f8ebf364"
+SRCREV_meta ?= "135c75bf9615334b5b8bb9108d612fe7dfbdb901"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index b2a37c0..8bea0a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "92de4e2f3c6b397c8b363e079cc4d5e9bcadf877"
 SRCREV_machine_qemux86 ?= "8ada1bb97415fe959a57a08504be4eb8a656ed30"
 SRCREV_machine_qemux86-64 ?= "4ca7e2c5d42e755e1b4c3e1478128f047a8ed2a8"
 SRCREV_machine ?= "01e948c2bdf7f5ad9f2b30047a8d3493a1a2880a"
-SRCREV_meta ?= "59f350ec3794e19fa806c1b73749d851f8ebf364"
+SRCREV_meta ?= "135c75bf9615334b5b8bb9108d612fe7dfbdb901"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



