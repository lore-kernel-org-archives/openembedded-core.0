Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA5E3707A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:02:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2014 12:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,711,1400050800"; d="scan'208";a="565625572"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2014 12:01:18 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 14:01:11 -0500
Message-Id: <3cac2081a187069929f7b4a1289cb7178ffc5dd8.1406052643.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <3d7c44a6df1f49a78f9d169f337e3041aad9e430.1406052643.git.tom.zanussi@linux.intel.com>
References: <3d7c44a6df1f49a78f9d169f337e3041aad9e430.1406052643.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406052643.git.tom.zanussi@linux.intel.com>
References: <cover.1406052643.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/3] wic: Remove fstype from mkefidisk canned wks
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
X-List-Received-Date: Tue, 22 Jul 2014 19:02:55 -0000

The bootimg-efi plugin specifies the fstype internally, so remove it
from the partition definition.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/mkefidisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
index e976bc8..db86caa 100644
--- a/scripts/lib/image/canned-wks/mkefidisk.wks
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -2,7 +2,7 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
 
-part /boot --source bootimg-efi --ondisk sda --fstype=msdos --label msdos --active --align 1024
+part /boot --source bootimg-efi --ondisk sda --label msdos --active --align 1024
 
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
-- 
1.8.3.1


