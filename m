Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1612C782E0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 10:11:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 01 Aug 2017 03:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,305,1498546800"; d="scan'208";a="885003365"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2017 03:12:00 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id ED38C5805B3;
	Tue,  1 Aug 2017 03:11:59 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 13:13:10 +0300
Message-Id: <1501582390-17482-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [morty][PATCH v2] libpng12: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 01 Aug 2017 10:12:00 -0000

Since GENTOO_MIRROR removes older binaries, move back to
SOURCEFORGE_MIRROR. Also provide a MIRROR to "older-releases"
directory.

[YOCTO #11556]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-lsb4/libpng/libpng12_1.2.56.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
index 10c350a..277d69f 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
@@ -9,7 +9,11 @@ DEPENDS = "zlib"
 PN = "libpng12"
 S = "${WORKDIR}/libpng-${PV}"
 
-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
+LIBV = "12"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
+
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}"
 
 SRC_URI[md5sum] = "868562bd1c58b76ed8703f135a2e439a"
 SRC_URI[sha256sum] = "24ce54581468b937734a6ecc86f7e121bc46a90d76a0d948dca08f32ee000dbe"
-- 
2.4.0


