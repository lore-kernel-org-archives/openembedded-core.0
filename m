Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 43262606B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 17:42:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 19 Jan 2017 09:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,254,1477983600"; d="scan'208";a="1096315075"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.102.206])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2017 09:42:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 19 Jan 2017 09:42:47 -0800
Message-Id: <1484847767-22669-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-firmware: relocate ath9k_htc blobs to correct package
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
X-List-Received-Date: Thu, 19 Jan 2017 17:42:50 -0000

The newer firmware blobs were versioned and landing in the default
package so move them to their appropriately named package.

[YOCTO #10942]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5942997..bdad5f2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -267,6 +267,8 @@ FILES_${PN}-ath9k = " \
   ${base_libdir}/firmware/ar7010*.fw \
   ${base_libdir}/firmware/htc_9271.fw \
   ${base_libdir}/firmware/htc_7010.fw \
+  ${base_libdir}/firmware/ath9k_htc/htc_7010-1.4.0.fw \
+  ${base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
-- 
2.7.4


