Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEB37CED7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:41:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:18 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="206089303"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:41:03 +0800
Message-Id: <a4864f3e3617e376c927d752c254ff1bb5dcc889.1576733575.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576733575.git.anuj.mittal@intel.com>
References: <cover.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] vte: upgrade 0.58.2 -> 0.58.3
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
X-List-Received-Date: Thu, 19 Dec 2019 05:41:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vte/{vte_0.58.2.bb => vte_0.58.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.58.2.bb => vte_0.58.3.bb} (92%)

diff --git a/meta/recipes-support/vte/vte_0.58.2.bb b/meta/recipes-support/vte/vte_0.58.3.bb
similarity index 92%
rename from meta/recipes-support/vte/vte_0.58.2.bb
rename to meta/recipes-support/vte/vte_0.58.3.bb
index 0ed382a5f9..41dc2e77c9 100644
--- a/meta/recipes-support/vte/vte_0.58.2.bb
+++ b/meta/recipes-support/vte/vte_0.58.3.bb
@@ -20,8 +20,8 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 SRC_URI += "file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
             file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "dadbf2c1d9864d3ea185738f97ab63af"
-SRC_URI[archive.sha256sum] = "33c966d2b1f2c3b0f9416dbca883fd746159b5bd040350e3b78f8104b2a42bc0"
+SRC_URI[archive.md5sum] = "f59eb0784a361c0939c03d4566255916"
+SRC_URI[archive.sha256sum] = "22dcb54ac2ad1a56ab0a745e16ccfeb383f0b5860b5bfa1784561216f98d4975"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.21.0


