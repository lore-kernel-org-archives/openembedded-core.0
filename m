Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44FC1784E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:33:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 03:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1162741628"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2017 03:33:26 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 83B0458035B;
	Tue, 15 Aug 2017 03:33:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 13:33:19 +0300
Message-Id: <f830300d197e9aab4aad446e76c2de800b9e65d1.1502792828.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1502792828.git.jussi.kukkonen@intel.com>
References: <cover.1502792828.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] glib-2.0: Upgrade 2.52.2 -> 2.52.3
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
X-List-Received-Date: Tue, 15 Aug 2017 10:33:25 -0000

Small release with bug fixes and some flatpak portal related
improvements.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/glib-2.0/{glib-2.0_2.52.2.bb => glib-2.0_2.52.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.2.bb => glib-2.0_2.52.3.bb} (85%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
similarity index 85%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
index 6f01aef..b1fe600 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.52.3.bb
@@ -19,5 +19,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "ec099bce26ce6a85104ed1d89bb45856"
-SRC_URI[sha256sum] = "f00e5d9e2a2948b1da25fcba734a6b7a40f556de8bc9f528a53f6569969ac5d0"
+SRC_URI[md5sum] = "89265d0289a436e99cad54491eb21ef4"
+SRC_URI[sha256sum] = "25ee7635a7c0fcd4ec91cbc3ae07c7f8f5ce621d8183511f414ded09e7e4e128"
-- 
2.1.4


