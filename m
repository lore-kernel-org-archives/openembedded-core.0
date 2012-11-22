Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tbb6r-0000hW-Ak
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 19:02:49 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAMHmZW1022723;
	Thu, 22 Nov 2012 09:48:36 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Nov 2012 12:48:28 -0500
Message-Id: <c985bed8c6124a9c3d9cc92f53fd38f71fd670f2.1353606229.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353606229.git.bruce.ashfield@windriver.com>
References: <cover.1353606229.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1353606229.git.bruce.ashfield@windriver.com>
References: <cover.1353606229.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-3.4: gcc optimization config feature
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
X-List-Received-Date: Thu, 22 Nov 2012 18:02:49 -0000

Updating the meta SRCREV to include a x86 gcc optimization feature, and
its use by several BSPs:

  1c59807 meta: rangeley: Remove the shortcut path
  b5477d0 meta: crystalforest: Enable GCC inline compiler option
  ab2b874 meta: rangeley: Enable GCC inline compiler option
  8287750 meta: Add New feature for GCC optimizing

Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 587bdd6..647244a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "ae8e2cd14e47bceb9c2bdcb927b3a0ea61f6c311"
 SRCREV_machine_qemux86 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine_qemux86-64 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
+SRCREV_meta ?= "1c5980714d482f8ccb72909b40f3e1467a3fd590"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4



