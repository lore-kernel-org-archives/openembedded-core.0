Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC9277E81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 17:17:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2017 10:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,421,1500966000"; d="scan'208";a="151486634"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga005.jf.intel.com with ESMTP; 20 Sep 2017 10:17:18 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:17:17 -0700
Message-Id: <0d237100dc22224840c5cb81f0a32c067e1676ca.1505927561.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <fc8637cdd9e374834b6f1b0846761d43eb2f15f3.1505927561.git.alejandro.hernandez@linux.intel.com>
References: <fc8637cdd9e374834b6f1b0846761d43eb2f15f3.1505927561.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1505927561.git.alejandro.hernandez@linux.intel.com>
References: <cover.1505927561.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/5] linux-yocto-tiny: Enable qemux86-64 on linux-yocto-tiny 4.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 17:17:18 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index efd876aee5e..ba67af357e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -17,7 +17,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "(qemux86$)"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
 # Functionality flags
 KERNEL_FEATURES = ""
-- 
2.12.3


