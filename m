Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U0Wiu-0006Qf-3h
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 13:25:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2013 04:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,567,1355126400"; d="scan'208";a="280310813"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2013 04:09:21 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:10:18 +0200
Message-Id: <1359547818-6123-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] pax-utils : upgrade to 0.6
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
X-List-Received-Date: Wed, 30 Jan 2013 12:25:09 -0000

 - changed the archive extension because it changed
 on the repository.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../{pax-utils_0.2.2.bb => pax-utils_0.6.bb}       |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.2.2.bb => pax-utils_0.6.bb} (81%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.6.bb
similarity index 81%
rename from meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_0.6.bb
index 6bb33e7..3e6e687 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.2.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.6.bb
@@ -7,11 +7,10 @@ HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "93a2e993ec7a83627c39ddf92988e191"
-SRC_URI[sha256sum] = "eac86abe7871ee12452d221c1e7c21acb9ba78ba2cba1daa587d3c93c77acd07"
+SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
+SRC_URI[md5sum] = "376ec23930a55a8d3e167d50e23bb66e"
+SRC_URI[sha256sum] = "1ffd4bf7bf3f8bb404007dd1617edfb0297e4c65a2c1153712e4a76875038784"
 PR = "r0"
 
 do_install() {
-- 
1.7.9.5



