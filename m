Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF13A6FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:24:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 08:23:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="906899800"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2016 08:23:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 122E56A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:11:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:26:26 +0200
Message-Id: <1454430386-17829-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1454430386-17829-1-git-send-email-maxin.john@intel.com>
References: <1454430386-17829-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2][jethro] libpng12: update URL that no longer exists
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
X-List-Received-Date: Tue, 02 Feb 2016 16:24:14 -0000

Fix the following warning:

WARNING: Failed to fetch URL http://downloads.sourceforge.net/project/
libpng/libpng12/1.2.53/libpng-1.2.53.tar.xz, attempting MIRRORS if
available.

[YOCTO #8739]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
index bf861a7..24f6aff 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.53.bb
@@ -9,7 +9,7 @@ DEPENDS = "zlib"
 PN = "libpng12"
 S = "${WORKDIR}/libpng-${PV}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/older-releases/${PV}/libpng-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "7d18a74e6fd2029aee76ccd00e00a9e6"
 SRC_URI[sha256sum] = "b45e49f689e7451bd576569e6a344f7e0d11c02ecbb797f4da0e431526765c0a"
-- 
2.4.0


