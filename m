Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E432571A84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:40:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2016 06:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="195286131"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2016 06:40:47 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BBC336A4080;
	Thu, 24 Nov 2016 06:40:04 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 16:40:38 +0200
Message-Id: <1479998438-31719-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] qemux86*.conf: set wic-related parameters
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
X-List-Received-Date: Thu, 24 Nov 2016 14:40:46 -0000

Set directdisk.wks as default wks to use for qemux86 machines.
Set requried dependeincies to build directdisk image.

This should simplify building wic images for qemux86* machines.
It should be enough to add wic to the list of IMAGE_FSTYPES to get
the images built.

[YOCTO #10637, YOCTO #8719]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/machine/qemux86-64.conf | 3 +++
 meta/conf/machine/qemux86.conf    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index f2b2aeb..7559724 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -28,3 +28,6 @@ XSERVER = "xserver-xorg \
 MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
+
+WKS_FILE = "directdisk.wks"
+do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 09555ad..7785999 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -27,3 +27,6 @@ XSERVER = "xserver-xorg \
 MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
+
+WKS_FILE = "directdisk.wks"
+do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.1.4


