Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F24B177151
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861593"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:07 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:05 +0200
Message-Id: <84d5b3dc3832a7cd24b5362d35556e86b28d2f26.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 8/8] libsoup-2.4: Upgrade 2.50.0 -> 2.52.1
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Don't build the now-included vala bindings: This requires gobject-introspection.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (82%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
similarity index 82%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
index 044db31..55d8b9e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.1.bb
@@ -9,6 +9,8 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "glib-2.0 gnutls libxml2 sqlite3 intltool-native"
 
+EXTRA_OECONF = "--disable-vala"
+
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
 # by default but let it be easily disabled.
 PACKAGECONFIG ??= "gnome"
@@ -17,8 +19,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9a84d66e1b7ccd3bd340574b11eccc15"
-SRC_URI[sha256sum] = "1e01365ac4af3817187ea847f9d3588c27eee01fc519a5a7cb212bb78b0f667b"
+SRC_URI[md5sum] = "b80f11674724ab38f96426875bc0e2e5"
+SRC_URI[sha256sum] = "0e19bca047ad50b28e8ed7663840f9e45a94909148822ca44dcb3e8cafb5cc48"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.1.4


