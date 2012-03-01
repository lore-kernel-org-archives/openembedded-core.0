Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30qo-0008UE-9t
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:54:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Feb 2012 23:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72182141"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Feb 2012 23:46:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:46:20 -0800
Message-Id: <f21df1f9163d0b08617d8d25c9305183ba1c4d11.1330587785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] image-live: Allow LABELS to be modified
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
X-List-Received-Date: Thu, 01 Mar 2012 07:54:58 -0000

This is to allow other image types to set the syslinux labels

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-live.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 1476840..2f3261e 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -3,8 +3,9 @@ AUTO_SYSLINUXCFG = "1"
 INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
 SYSLINUX_ROOT = "root=/dev/ram0 "
-SYSLINUX_TIMEOUT = "10"
-LABELS += "boot install"
+SYSLINUX_TIMEOUT ?= "10"
+SYSLINUX_LABELS ?= "boot install"
+LABELS_append = " ${SYSLINUX_LABELS} "
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
-- 
1.7.7.6



