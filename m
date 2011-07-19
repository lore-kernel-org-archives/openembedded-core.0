Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3W-0001dy-7F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396939"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:58 -0700
Message-Id: <3c1fa2d2d2f7362cc11c7cd9eff88a99b87ee9b9.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/22] linux-yocto/meta: update meta SRCREV for routerstation pro
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:52 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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
1.7.3.4



