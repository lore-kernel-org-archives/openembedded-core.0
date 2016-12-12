Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D9E7271A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2016 02:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41515370"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 02:11:57 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 19CAF6A4006;
	Mon, 12 Dec 2016 02:11:09 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:38 +0200
Message-Id: <a07d74409d3a2125b06984edf4e9658a976bebf7.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/12] libxfont2: Add recipe
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:08 -0000

This is the same old libxfont but with a new API.
xserver-xorg 1.19 depends on libxfont2.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
new file mode 100644
index 0000000..402ab0d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "XFont2: X Font rasterisation library"
+
+DESCRIPTION = "libXfont2 provides various services for X servers, most \
+notably font selection and rasterisation (through external libraries \
+such as freetype)."
+
+require xorg-lib-common.inc
+
+LICENSE = "MIT & MIT-style & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
+
+DEPENDS += "freetype xtrans fontsproto libfontenc zlib"
+
+XORG_PN = "libXfont2"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "0d9f6dd9c23bf4bcbfb00504b566baf5"
+SRC_URI[sha256sum] = "e9fbbb475ddd171b3a6a54b989cbade1f6f874fc35d505ebc5be426bc6e4db7e"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.1.4


