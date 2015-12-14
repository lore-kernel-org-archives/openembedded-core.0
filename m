Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF606FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:33:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 14 Dec 2015 06:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="871139457"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2015 06:33:08 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C69F56A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:21:09 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 16:34:12 +0200
Message-Id: <1450103652-30181-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
References: <1450103652-30181-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] libpng: Update SRC_URI to use GENTOO_MIRROR
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
X-List-Received-Date: Mon, 14 Dec 2015 14:33:25 -0000

Update SRC_URI to use GENTOO_MIRROR as SOURCEFORGE_MIRROR continue
to move around the release files.

[YOCTO #8739]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.20.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.20.bb b/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
index 6c149d2..3c4af38 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
@@ -5,9 +5,8 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55b60b5bb3ed92fbf9197e565a7fac02 \
                     file://png.h;endline=112;md5=a6352a338642f0dbd2fc280ae060d3e9"
 DEPENDS = "zlib"
-LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
+SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
 SRC_URI[md5sum] = "3968acb7c66ef81a9dab867f35d0eb4b"
 SRC_URI[sha256sum] = "55c5959e9f3484d96141a3226c53bc9da42a4845e70879d3e1d6e94833d1918b"
-- 
2.4.0


