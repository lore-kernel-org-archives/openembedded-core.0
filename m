Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 186CC7728F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 16:24:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 08:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="894801954"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2016 08:23:55 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 138C66A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:11:47 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:26:25 +0200
Message-Id: <1454430386-17829-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2][jethro] libpng: update URL that no longer exists
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
X-List-Received-Date: Tue, 02 Feb 2016 16:24:27 -0000

Fix the following warning:

WARNING: Failed to fetch URL http://downloads.sourceforge.net/
project/libpng/libpng16/1.6.17/libpng-1.6.17.tar.xz, attempting
MIRRORS if available

[YOCTO #8739]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
index 00e5808..2d9835c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.17.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9b75399b72e4a8656cf3a6ddfc86d9a \
 DEPENDS = "zlib"
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz \
           "
 SRC_URI[md5sum] = "430a9b76b78533235cd4b9b26ce75c7e"
 SRC_URI[sha256sum] = "98507b55fbe5cd43c51981f2924e4671fd81fe35d52dc53357e20f2c77fa5dfd"
-- 
2.4.0


