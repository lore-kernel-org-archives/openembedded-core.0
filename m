Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 16B2D7EE6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:16:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169720376"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:16:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:16:06 +0800
Message-Id: <20190718021606.3560-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718021606.3560-1-anuj.mittal@intel.com>
References: <20190718021606.3560-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] vte: upgrade 0.56.1 -> 0.56.3
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
X-List-Received-Date: Thu, 18 Jul 2019 02:16:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vte/{vte_0.56.1.bb => vte_0.56.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.56.1.bb => vte_0.56.3.bb} (93%)

diff --git a/meta/recipes-support/vte/vte_0.56.1.bb b/meta/recipes-support/vte/vte_0.56.3.bb
similarity index 93%
rename from meta/recipes-support/vte/vte_0.56.1.bb
rename to meta/recipes-support/vte/vte_0.56.3.bb
index 702436b368..0deee175df 100644
--- a/meta/recipes-support/vte/vte_0.56.1.bb
+++ b/meta/recipes-support/vte/vte_0.56.3.bb
@@ -19,8 +19,8 @@ SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
            file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "a8984cd5a101dbff0b0c875d1de3f692"
-SRC_URI[archive.sha256sum] = "02fa8ecc02a9332e47f486795494527b5687b3bd448e73e6b67285f2f326dc7c"
+SRC_URI[archive.md5sum] = "adf341807861a5dad9f98e5c701c0769"
+SRC_URI[archive.sha256sum] = "17a1d4bc8848f1d2acfa4c20aaa24b9bac49f057b8909c56d3dafec2e2332648"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.20.1


