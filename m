Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2c-00056a-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034657"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:05 -0700
Message-Id: <4141bc1efd6913b6381f1049df1eed5b4a36a4be.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 02/28] qemush4.conf: Add machine configuration for qemush4
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
X-List-Received-Date: Thu, 24 May 2012 04:52:51 -0000

From: Khem Raj <raj.khem@gmail.com>

SH4 qemu emulation using rts7751r2dplus board

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemush4.conf |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/qemush4.conf

diff --git a/meta/conf/machine/qemush4.conf b/meta/conf/machine/qemush4.conf
new file mode 100644
index 0000000..acf7faf
--- /dev/null
+++ b/meta/conf/machine/qemush4.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: base
+#@DESCRIPTION: rts7751r2dplus
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-sh4.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+SERIAL_CONSOLE = "115200 ttySC1 noiotrap earlyprintk=sh-sci.1"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+
-- 
1.7.7.6



