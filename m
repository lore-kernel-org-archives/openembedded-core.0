Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF487F80D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389428"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:46 +0800
Message-Id: <09227a7ee7213ff0f09d92d06ad4ed1393af4968.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 05/10] libsoup-2.4: upgrade to 2.66.4
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:07 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Fixes CVE-2019-17266.

(From OE-Core rev: ffdbcd78955d43d34988991f1d217036f044167d)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Bug fix release:
https://gitlab.gnome.org/GNOME/libsoup/compare/2.66.2...2.66.4]
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{libsoup-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
index 3a735cf27a..7f5f910d3d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
@@ -12,8 +12,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
            "
-SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
-SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
+SRC_URI[md5sum] = "42016d80ecae4cf8eb416631049a273a"
+SRC_URI[sha256sum] = "8308984f1eee1c4f8c113a9c1763b2b22d981bd811b0cc82a9f3f1aa63228779"
 
 CVE_PRODUCT = "libsoup"
 
@@ -28,7 +28,7 @@ PACKAGECONFIG[gssapi] = "-Dgssapi=true,-Dgssapi=false,krb5"
 
 EXTRA_OEMESON_append = " -Dvapi=false"
 
-GTKDOC_MESON_OPTION = "doc"
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 # When built without gnome support, libsoup-2.4 will contain only one shared lib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
-- 
2.21.0


