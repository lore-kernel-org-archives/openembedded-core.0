Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EBFD56076F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 18:19:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2018 10:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,517,1511856000"; d="scan'208";a="201469181"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 15 Feb 2018 10:19:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 20:12:54 +0200
Message-Id: <20180215181254.22810-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] nativesdk-qemu-helper: add a missing nativesdk-python3-logging dependency
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
X-List-Received-Date: Thu, 15 Feb 2018 18:19:20 -0000

[YOCTO #12545]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 1a9ad5cc2b9..cdc2f51c2eb 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPLv2"
 RDEPENDS_${PN} = "nativesdk-qemu \
-                  nativesdk-python3-shell nativesdk-python3-fcntl \
+                  nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
 
 PR = "r9"
-- 
2.15.1


