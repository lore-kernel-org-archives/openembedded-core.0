Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TJGus-0006OK-1N
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 06:50:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2012 21:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229289825"
Received: from unknown (HELO localhost) ([10.255.13.139])
	by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2012 21:37:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 21:36:41 -0700
Message-Id: <52507f028d9ec0e88078673e15e238d010cfaead.1349239001.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] linux-yocto-custom: Clarify defconfig usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 04:50:38 -0000

It is necessary to supply file://defconfig to the SRC_URI when using
a defconfig (it is not implicitly understood as the commentary might
currently suggest).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
index 1f0b3a2..4115d2f 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
@@ -13,7 +13,8 @@
 #
 #   You must also provide a Linux kernel configuration. The most direct
 #   method is to copy your .config to files/defconfig in your layer,
-#   in the same directory as the bbappend.
+#   in the same directory as the bbappend and add file://defconfig to
+#   your SRC_URI.
 #
 #   To use the yocto kernel tooling to generate a BSP configuration
 #   using modular configuration fragments, see the yocto-bsp and
-- 
1.7.11.4



