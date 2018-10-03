Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A87C07198F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 10:28:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 03:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,335,1534834800"; d="scan'208";a="262476828"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.255])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2018 03:27:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 18:27:50 +0800
Message-Id: <20181003102750.10769-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] qemux86-directdisk: remove mem= parameter
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
X-List-Received-Date: Wed, 03 Oct 2018 10:28:23 -0000

Remove usage of a specific amount of memory and let it be controlled by
users. This was the default behaviour before it was changed by commit
3b79d9a78 that switched the wks file to be used for qemux86.

Also fixes the bitbake parsing issues seen because of memory starvation
using build appliance images.

Fixes [YOCTO #12894]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index be51c4eb56..c8d9f121b5 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 rw mem=256M oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="vga=0 rw oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.17.1


