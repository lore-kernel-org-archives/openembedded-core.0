Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A8FCA609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 16:58:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2015 09:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="724741437"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2015 09:58:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 50A7B6A4005;
	Wed, 10 Jun 2015 09:58:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:04:49 +0300
Message-Id: <1433948689-3533-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image-live: Set syslinux timeout to 5s
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
X-List-Received-Date: Wed, 10 Jun 2015 16:58:41 -0000

Increased syslinux timeout to 5s as 1s default 1s timeout
is not enough to notice syslinux prompt on some devices.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 7b770fb..52b6de7 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -3,7 +3,7 @@ AUTO_SYSLINUXCFG = "1"
 INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
 SYSLINUX_ROOT = "root=/dev/ram0"
-SYSLINUX_TIMEOUT ?= "10"
+SYSLINUX_TIMEOUT ?= "50"
 SYSLINUX_LABELS ?= "boot install"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
-- 
2.1.4


