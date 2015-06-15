Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A885875977
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:04:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2015 11:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="588243747"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2015 11:04:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3AD9F6A4083;
	Mon, 15 Jun 2015 11:04:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:38 +0300
Message-Id: <1434384647-2901-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 01/10] image-live: Set syslinux timeout to 5s
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
X-List-Received-Date: Mon, 15 Jun 2015 18:04:46 -0000

Increased syslinux timeout to 5s as default 1s timeout
is not enough to notice syslinux prompt on some devices.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

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


