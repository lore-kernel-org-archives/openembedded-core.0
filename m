Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 70BD278576
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 22:20:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2017 15:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,427,1496127600"; d="scan'208";a="113218211"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Jul 2017 15:20:05 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 15:20:02 -0700
Message-Id: <20170728222002.6166-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] initramfs-framework/setup-live: remove superfluous break
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
X-List-Received-Date: Fri, 28 Jul 2017 22:20:04 -0000

This causes us to fall out of the module setup/run loop in the base init
script should "root=" be defined, causing a boot failure.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/setup-live | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
index ec4a139..591c93a 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -49,8 +49,6 @@ shelltimeout=30
 		done
 		# The existing rootfs module has no support for rootfs images. Assign the rootfs image.
 		bootparam_root="/run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE"
-	else
-		break
 	fi
 
 	if [ "$bootparam_LABEL" != "boot" -a -f /init.d/$bootparam_LABEL.sh ] ; then
-- 
2.9.4


