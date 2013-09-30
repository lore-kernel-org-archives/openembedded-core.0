Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 518206101C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 22:18:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2013 15:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1010,1371106800"; d="scan'208";a="403369846"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.107])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2013 15:18:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2013 15:18:53 -0700
Message-Id: <1380579533-2045-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] dpkg: Add xz to RDEPENDS
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
X-List-Received-Date: Mon, 30 Sep 2013 22:18:53 -0000

dpkg uses xz as a compressor and the binary image is needed on the system for
dpkg to work correctly.

[YOCTO #1881]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 6734b20..b1da4fb 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -7,8 +7,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
-RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz"
+RDEPENDS_${PN}_class-native = "xz"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.8.3.1


