Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6051E7FE47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 05:46:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:44 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220200332"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 13:46:33 +0800
Message-Id: <20200122054636.10681-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200122054636.10681-1-anuj.mittal@intel.com>
References: <20200122054636.10681-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] glib-networking: upgrade 2.62.2 -> 2.62.3
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
X-List-Received-Date: Wed, 22 Jan 2020 05:46:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{glib-networking_2.62.2.bb => glib-networking_2.62.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.2.bb => glib-networking_2.62.3.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
index 026d8701f3..e9596ce1a4 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a8b669ae54c7178848ce7a9b596a471c"
-SRC_URI[archive.sha256sum] = "0644b8dc042bab8c9d2892aee5716513280c8773dbef43a038149f24cae15544"
+SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
+SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.21.1


