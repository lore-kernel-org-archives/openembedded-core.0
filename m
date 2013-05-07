Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UZiFS-00038y-LN
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:48:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2013 06:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,628,1363158000"; d="scan'208";a="238039415"
Received: from unknown (HELO localhost) ([10.255.12.242])
	by AZSMGA002.ch.intel.com with ESMTP; 07 May 2013 06:30:04 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 08:30:03 -0500
Message-Id: <a5db1ce0751cfa6ac2c24db5e881b17965f8422e.1367933207.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1367933207.git.tom.zanussi@linux.intel.com>
References: <cover.1367933207.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] kernel.bbclass: make FILES package-specific
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
X-List-Received-Date: Tue, 07 May 2013 13:48:49 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Fix QA warnings seen when using 'traditional' kernel recipes e.g.:

WARNING: QA Issue: .../recipes-kernel/linux/linux_3.0.18.bb: Variable
FILES is set as not being package specific, please fix this.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 00e27ef..3320747 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -252,7 +252,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
-FILES = ""
+FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
-- 
1.7.11.4



