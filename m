Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QZV4p-0005lc-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 23:35:11 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MLVTBl005219;
	Wed, 22 Jun 2011 14:31:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 22 Jun 2011 17:29:20 -0400
Message-Id: <3d6054040479ae77c7de24721ff822c1b09291c6.1308777703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308777703.git.bruce.ashfield@windriver.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1308777703.git.bruce.ashfield@windriver.com>
References: <cover.1308777703.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	koen@dominion.thruhere.net, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto: update meta and yocto/standard SRCREVs
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
X-List-Received-Date: Wed, 22 Jun 2011 21:35:12 -0000

As part of sync'ing the in-tree beagleboard support, the
following commit has been pushed to all branches, and hence
the SRCREV update:

  bb8e31f USB: ehci: remove structure packing from ehci_def

The meta SRCREV update is to capture the new and sync'd BSP configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
index 90943c2..f244226 100644
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
@@ -14,13 +14,13 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "52424d35025cfa43f0d66cf6fa982a5c289a1ba4"
-SRCREV_machine_qemumips = "9083f18f40fc6a2baf76fa001bc4858e02f40378"
-SRCREV_machine_qemuppc = "9d278962ff228ea9627a85b0d21ed717246ebf1f"
-SRCREV_machine_qemux86 = "57545699dff0b384bb16be74b0358059da5cce6a"
-SRCREV_machine_qemux86-64 = "5d36c23eecdc9663c9c3a2a511d4872d3b3fd669"
-SRCREV_machine = "12646d158aced2ba0122787bd56ff554e371091c"
-SRCREV_meta = "94fa015b130e96a3b6242a8ac4ff4cca9406951f"
+SRCREV_machine_qemuarm = "92232beb4e72fcf8d85abe79edba0cdf53f1ce41"
+SRCREV_machine_qemumips = "30cc7e06fba9126e79b4a0a3219c7d0259638f7a"
+SRCREV_machine_qemuppc = "4ae67af1d0ece9944f8e640925aaf69aa5f10e34"
+SRCREV_machine_qemux86 = "ea7bcd9e408ddfaf5ecd0bcc37956998add58e2d"
+SRCREV_machine_qemux86-64 = "790b4cd5ff0bb8c4f4523763436efd438c692342"
+SRCREV_machine = "bb8e31f2c99f5e007660d4540df246fb7ecfa746"
+SRCREV_meta = "d5d3c6480d61f83503ccef7fbcd765f7aca8b71b"
 
 PR = "r19"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



