Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C67DC7F8BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:28 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540222"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:15:01 +0800
Message-Id: <84ad4604063c43ade55351b0ecd3b08bd0b011f4.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 07/11] glib: Whitelist CVE-2019-12450
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:26 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Fixed in 2.60.4, but CPE data is outdated.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
index 740473719d..5aefa6ad8b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
@@ -23,3 +23,6 @@ SRC_URI_append_class-target = " file://glib-meson.cross"
 
 SRC_URI[md5sum] = "f036f78a7fca330d9f7d939fcf794bde"
 SRC_URI[sha256sum] = "8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310"
+
+# Fixed in 2.60.4, but CPE data is outdated
+CVE_CHECK_WHITELIST += "CVE-2019-12450"
-- 
2.21.0


