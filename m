Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAF06D433
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 22:02:19 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Nov 2013 14:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="317929566"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.249])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Nov 2013 14:02:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 14:02:17 -0800
Message-Id: <1383775339-4220-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/3] kbd: upgrade to 2.0.1
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
X-List-Received-Date: Wed, 06 Nov 2013 22:02:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/kbd/{kbd_2.0.0.bb => kbd_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/kbd/{kbd_2.0.0.bb => kbd_2.0.1.bb} (87%)

diff --git a/meta/recipes-core/kbd/kbd_2.0.0.bb b/meta/recipes-core/kbd/kbd_2.0.1.bb
similarity index 87%
rename from meta/recipes-core/kbd/kbd_2.0.0.bb
rename to meta/recipes-core/kbd/kbd_2.0.1.bb
index e66018f..d39f4c8 100644
--- a/meta/recipes-core/kbd/kbd_2.0.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.1.bb
@@ -12,8 +12,8 @@ RCONFLICTS_${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "1d9bbc36506b8c25740d028b0f6d2839"
-SRC_URI[sha256sum] = "f5eb125d5154bc0fe6f38175de9fcd394879485dadbba75c350d4ab050684a42"
+SRC_URI[md5sum] = "f80b93a6abddb6cc2a3652daaf7562ba"
+SRC_URI[sha256sum] = "223d60bb6882323cca161aeb5965590768b2f590fd7cddbf27511ad0ba7a429e"
 
 PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
-- 
1.8.3.1


