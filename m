Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC8-0004t7-2E
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652372"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:23 -0800
Message-Id: <13124670a226a9379e6dbe20c028c23a9d568f83.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/25] image-live: fix SYSLINUX_TIME and add SYSLINUX_ROOT instead of APPEND
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-live.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index e85ac1e..1476840 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -2,8 +2,8 @@
 AUTO_SYSLINUXCFG = "1"
 INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
-APPEND += "root=/dev/ram0 "
-TIMEOUT = "10"
+SYSLINUX_ROOT = "root=/dev/ram0 "
+SYSLINUX_TIMEOUT = "10"
 LABELS += "boot install"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
-- 
1.7.6.5



