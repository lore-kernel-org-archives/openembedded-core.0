Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C8DF278270
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:50:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 04:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="1174713084"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2017 04:50:18 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 29598580130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 04:50:16 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 14:51:02 +0300
Message-Id: <1500551462-19196-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
References: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
Subject: [morty][PATCH 2/2] libpng12: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Thu, 20 Jul 2017 11:50:19 -0000

Since GENTOO_MIRROR removes older binaries, move back to
SOURCEFORGE_MIRROR. Also provide a MIRROR to "older-releases"
directory.

[YOCTO #11556]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-lsb4/libpng/libpng12_1.2.56.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.56.bb
index 10c350a..eab0cf7 100644
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
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}"
 
 SRC_URI[md5sum] = "868562bd1c58b76ed8703f135a2e439a"
 SRC_URI[sha256sum] = "24ce54581468b937734a6ecc86f7e121bc46a90d76a0d948dca08f32ee000dbe"
-- 
2.4.0


