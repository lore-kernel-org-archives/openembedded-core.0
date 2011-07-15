Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qharm-0004gT-K0
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 07:23:12 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-217.ottawa.windriver.com [128.224.146.217])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6F5J3es008059;
	Thu, 14 Jul 2011 22:19:05 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jul 2011 01:19:02 -0400
Message-Id: <f45c49d19403be3291ec2a144401c379ab0b0476.1310706713.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310706713.git.bruce.ashfield@windriver.com>
References: <cover.1310706713.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1310706713.git.bruce.ashfield@windriver.com>
References: <cover.1310706713.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/meta: update meta SRCREV for routerstation pro
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
X-List-Received-Date: Fri, 15 Jul 2011 05:23:12 -0000

Fixes bug [YOCTO #1161]
Fixes bug [YOCTO #773]

This streamlines the routerstation pro configuration to remove options
that are either unecessary or that are causing bugs.

Also added to all branches is:

  commit ffd73d6b2a9bfa0de5710b90a2237f4be66ae9a7
  Author: Yinghai Lu <yinghai@kernel.org>
  Date:   Thu Jul 14 15:27:44 2011 -0700

    mm: use alloc_bootmem_node_nopanic() on really needed path

    commit 8f389a99b652aab5b42297280bd94d95933ad12f upstream.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 90dc930..8260a08 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "92232beb4e72fcf8d85abe79edba0cdf53f1ce41"
-SRCREV_machine_qemumips = "30cc7e06fba9126e79b4a0a3219c7d0259638f7a"
-SRCREV_machine_qemuppc = "4ae67af1d0ece9944f8e640925aaf69aa5f10e34"
-SRCREV_machine_qemux86 = "ea7bcd9e408ddfaf5ecd0bcc37956998add58e2d"
-SRCREV_machine_qemux86-64 = "790b4cd5ff0bb8c4f4523763436efd438c692342"
-SRCREV_machine = "bb8e31f2c99f5e007660d4540df246fb7ecfa746"
-SRCREV_meta = "d5d3c6480d61f83503ccef7fbcd765f7aca8b71b"
+SRCREV_machine_qemuarm = "f5aaddc24d0866ac12e924c4cee1382cce4cdb44"
+SRCREV_machine_qemumips = "f988df822335de0e463056f8c43f2984c29e2bd1"
+SRCREV_machine_qemuppc = "b03682b7db2f21c7dcabbbe4073061b601ad5ee9"
+SRCREV_machine_qemux86 = "ff1a08b4f5a0c4afa04160460421d67f37299f2c"
+SRCREV_machine_qemux86-64 = "be49445d1504c3d4021c01471223208cd3cc9c4f"
+SRCREV_machine = "ffd73d6b2a9bfa0de5710b90a2237f4be66ae9a7"
+SRCREV_meta = "84f1a422d7e21fbc23a687035bdf9d42471f19e0"
 
 PR = "r20"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



