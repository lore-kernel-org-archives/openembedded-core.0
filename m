Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5869860C19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:35:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2014 18:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="575301097"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2014 18:35:50 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:40 -0500
Message-Id: <f9e6cbbaa8772802e8268209282a4edce7c975fe.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
References: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 6/7] wic: Add sourceparams to mkefidisk.wks
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
X-List-Received-Date: Tue, 12 Aug 2014 01:35:53 -0000

The bootimg-efi plugin now requires a loader param, so supply it to
retain existing behavior.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/mkefidisk.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
index db86caa..58d42e6 100644
--- a/scripts/lib/image/canned-wks/mkefidisk.wks
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -2,7 +2,7 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
 
-part /boot --source bootimg-efi --ondisk sda --label msdos --active --align 1024
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
-- 
1.8.3.1


