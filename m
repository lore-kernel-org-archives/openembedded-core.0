Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAAA46066A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 02:11:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2013 19:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,810,1367996400"; d="scan'208";a="375817736"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.110])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2013 19:11:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2013 19:11:02 -0700
Message-Id: <1375582262-2193-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] grub-efi-native: add flex patch to efi-native version also
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
X-List-Received-Date: Sun, 04 Aug 2013 02:11:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../grub/{grub-2.00 => files}/fix-issue-with-flex-2.5.37.patch           | 0
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb                            | 1 +
 2 files changed, 1 insertion(+)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/fix-issue-with-flex-2.5.37.patch (100%)

diff --git a/meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch b/meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch
rename to meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 11dcfdf..2d3d68a 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://check-if-liblzma-is-disabled.patch \
            file://grub-no-unused-result.patch \
            file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
+           file://fix-issue-with-flex-2.5.37.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.8.1.4


