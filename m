Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECB760620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:56:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2016 07:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="894706866"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2016 07:56:43 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B61446A4002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:44:37 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 17:58:49 +0200
Message-Id: <1453305530-556-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1453305530-556-1-git-send-email-maxin.john@intel.com>
References: <1453305530-556-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libpng: upgrade to 1.6.21
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
X-List-Received-Date: Wed, 20 Jan 2016 15:56:48 -0000

1.6.20 -> 1.6.21

License file updates contain new dates and versions. Update checksums
to reflect it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.20.bb => libpng_1.6.21.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.20.bb => libpng_1.6.21.bb} (66%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.20.bb b/meta/recipes-multimedia/libpng/libpng_1.6.21.bb
similarity index 66%
rename from meta/recipes-multimedia/libpng/libpng_1.6.20.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.21.bb
index 3c4af38..58cef1f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.20.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.21.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55b60b5bb3ed92fbf9197e565a7fac02 \
-                    file://png.h;endline=112;md5=a6352a338642f0dbd2fc280ae060d3e9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=06a1b6fde6d93170bb72201c8000bf3d \
+                    file://png.h;endline=112;md5=9a8b5f83e1e8046df672deab87f235be"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "3968acb7c66ef81a9dab867f35d0eb4b"
-SRC_URI[sha256sum] = "55c5959e9f3484d96141a3226c53bc9da42a4845e70879d3e1d6e94833d1918b"
+SRC_URI[md5sum] = "3bacb4728f6694a64ad9052769d6a4ce"
+SRC_URI[sha256sum] = "6c8f1849eb9264219bf5d703601e5abe92a58651ecae927a03d1a1aa15ee2083"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


