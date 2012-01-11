Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZD-0005eP-Fg
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 19:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96814638"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 19:02:06 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:16 +0800
Message-Id: <8bb93d3df157986f1f9503ebd30ccfc59b38b97e.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/5] dummy-toolchain: add a new recipe dummy-toolchain
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:39 -0000

This is a dummy recipe to build toolchain in Hob

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/meta/dummy-toolchain.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/meta/dummy-toolchain.bb

diff --git a/meta/recipes-core/meta/dummy-toolchain.bb b/meta/recipes-core/meta/dummy-toolchain.bb
new file mode 100644
index 0000000..6535253
--- /dev/null
+++ b/meta/recipes-core/meta/dummy-toolchain.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "dummy toolchain"
+LICENSE = "MIT"
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGETEST ?= "dummy"
+inherit populate_sdk imagetest-${IMAGETEST}
-- 
1.7.0.4



