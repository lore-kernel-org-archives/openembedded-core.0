Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F30178DDF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:37:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 01:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,431,1526367600"; d="scan'208";a="250134740"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.171])
	by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2018 01:37:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2018 16:35:21 +0800
Message-Id: <20180801083521.3675-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic/qemux86: don't pass ip parameter to kernel in wks
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
X-List-Received-Date: Wed, 01 Aug 2018 08:37:45 -0000

Images that rely on dhcp being used won't have network setup properly
otherwise.

Fixes [YOCTO #12804]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
index cfa32bd38a..be51c4eb56 100644
--- a/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
+++ b/scripts/lib/wic/canned-wks/qemux86-directdisk.wks
@@ -4,5 +4,5 @@
 
 include common.wks.inc
 
-bootloader  --timeout=0  --append="vga=0 rw mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 rootfstype=ext4 "
+bootloader  --timeout=0  --append="vga=0 rw mem=256M oprofile.timer=1 rootfstype=ext4 "
 
-- 
2.17.1


