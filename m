Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF877CED7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:41:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:19 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="206089306"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:41:04 +0800
Message-Id: <d51a346c4b9e1d8a94f2ec7b4279da071b562fcc.1576733575.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576733575.git.anuj.mittal@intel.com>
References: <cover.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] glib-networking: upgrade 2.62.1 -> 2.62.2
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
X-List-Received-Date: Thu, 19 Dec 2019 05:41:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{glib-networking_2.62.1.bb => glib-networking_2.62.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.1.bb => glib-networking_2.62.2.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.2.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.62.2.bb
index 81d3fd43d9..026d8701f3 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "64ca1e1e43e623b916059585bf7e4758"
-SRC_URI[archive.sha256sum] = "3c55ae6771ad7a79fa606a834f4686ed555c2774ed6e9ece6f3c0f6a3dab7110"
+SRC_URI[archive.md5sum] = "a8b669ae54c7178848ce7a9b596a471c"
+SRC_URI[archive.sha256sum] = "0644b8dc042bab8c9d2892aee5716513280c8773dbef43a038149f24cae15544"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.21.0


