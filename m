Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDG-0001ZN-Sn
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753289"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:09 -0700
Message-Id: <83aa89608a4bff1c2528f5032ffc9f1e11622224.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 22/50] tune-ppce500mc: Add a tune file for PowerPC e500mc core
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:05 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce500mc.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce500mc.inc

diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
new file mode 100644
index 0000000..763ec1a
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -0,0 +1,4 @@
+TARGET_CC_ARCH = "-mcpu=e500mc"
+BASE_PACKAGE_ARCH = "ppce500mc"
+FEED_ARCH = "ppce500mc"
+PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
-- 
1.7.3.4



