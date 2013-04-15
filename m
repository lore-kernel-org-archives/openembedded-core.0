Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1URkCM-0008FC-Vg
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 16:16:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2013 06:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,476,1363158000"; d="scan'208";a="295107882"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2013 06:58:24 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 16:59:02 +0300
Message-Id: <1366034342-13722-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] pax-utils : upgrade to 0.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 14:16:02 -0000

upgrade from 0.6 -> 0.7

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../{pax-utils_0.6.bb => pax-utils_0.7.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.6.bb => pax-utils_0.7.bb} (82%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.6.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
similarity index 82%
rename from meta/recipes-devtools/pax-utils/pax-utils_0.6.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
index 3e6e687..63cf0ea 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.6.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "376ec23930a55a8d3e167d50e23bb66e"
-SRC_URI[sha256sum] = "1ffd4bf7bf3f8bb404007dd1617edfb0297e4c65a2c1153712e4a76875038784"
+SRC_URI[md5sum] = "8ae7743ad11500f7604f2e817221d877"
+SRC_URI[sha256sum] = "1ac4cee9a9ca97a723505eb29a25e50adeccffba3f0f0ef4f035cf082caf3b84"
 PR = "r0"
 
 do_install() {
-- 
1.7.9.5



