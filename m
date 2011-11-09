Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO4UE-0001w9-FF
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:30:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 01:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="72180417"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 01:24:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 01:24:03 -0800
Message-Id: <f8d27326dd5fb587f7c11455ba6689046631a67e.1320830515.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320830515.git.sgw@linux.intel.com>
References: <cover.1320830515.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320830515.git.sgw@linux.intel.com>
References: <cover.1320830515.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/5] local.conf.sample.extended: Fix bug 1674
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
X-List-Received-Date: Wed, 09 Nov 2011 09:30:26 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1674]
local.conf.sample.extended: An image based on gtk+-directfb don't need x11 for DEFAULT_FEATURES

Remove "x11" from DEFAULT_FEATURES and add "directfb" to it because someone could don't need x11 in their project, perhaps
gtk over directfb will meet his reqirement.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/conf/local.conf.sample.extended |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index e9935ce..7c26572 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -15,6 +15,9 @@
 
 #DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
 
+# If you want to get an image based on gtk+directfb without x11, Please copy this variable to build/conf/local.conf
+#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
+
 # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
 # packages at build time using qemu-native. Disabling it (by setting it to 0)
 # will save some build time at the expense of breaking i18n on devices with
-- 
1.7.6.4



