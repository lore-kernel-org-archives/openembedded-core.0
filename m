Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E4245605A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 04:45:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:46:01 -0800
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="233035466"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.22.68])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 20:46:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2020 12:45:53 +0800
Message-Id: <20200302044554.1265618-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302044554.1265618-1-anuj.mittal@intel.com>
References: <20200302044554.1265618-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libsoup-2.4: upgrade 2.68.3 -> 2.68.4
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
X-List-Received-Date: Mon, 02 Mar 2020 04:46:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsoup/{libsoup-2.4_2.68.3.bb => libsoup-2.4_2.68.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.68.3.bb => libsoup-2.4_2.68.4.bb} (91%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
similarity index 91%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
index e8bc7d6470..6731b3373e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[md5sum] = "29ee2ee7017945b64ede063b1396011c"
-SRC_URI[sha256sum] = "534bb08e35b0ff3702f3adfde87d3441e27c12f9f5ec351f056fe04cba02bafb"
+SRC_URI[md5sum] = "603f3a945cd6ecc1fda644d7853b3b81"
+SRC_URI[sha256sum] = "2d50b12922cc516ab6a7c35844d42f9c8a331668bbdf139232743d82582b3294"
 
 CVE_PRODUCT = "libsoup"
 
-- 
2.24.1


