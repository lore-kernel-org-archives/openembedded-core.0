Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 480307FA10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:40:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="201485271"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.245])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2019 03:40:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2019 19:39:01 +0800
Message-Id: <934828320beb9f4414da09e5a9f10cdcb0faff91.1574422359.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1574422359.git.anuj.mittal@intel.com>
References: <cover.1574422359.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 02/15] libsoup: set CVE_PRODUCT
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
X-List-Received-Date: Fri, 22 Nov 2019 11:40:07 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
index 357f2fd3db..3a735cf27a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
 SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
 SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
 
+CVE_PRODUCT = "libsoup"
+
 S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-- 
2.21.0


