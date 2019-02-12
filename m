Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 557 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Feb 2019 02:56:29 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 440B36C1CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:56:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Feb 2019 18:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,361,1544515200"; d="scan'208";a="132849567"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.102])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2019 18:47:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2019 10:47:07 +0800
Message-Id: <20190212024709.18046-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] libva: upgrade 2.3.0 -> 2.4.0
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
X-List-Received-Date: Tue, 12 Feb 2019 02:56:29 -0000

For changes, see:

https://github.com/intel/libva/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-graphics/libva/{libva_2.3.0.bb => libva_2.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.3.0.bb => libva_2.4.0.bb} (92%)

diff --git a/meta/recipes-graphics/libva/libva_2.3.0.bb b/meta/recipes-graphics/libva/libva_2.4.0.bb
similarity index 92%
rename from meta/recipes-graphics/libva/libva_2.3.0.bb
rename to meta/recipes-graphics/libva/libva_2.4.0.bb
index 4aab5269aa..ffa1ab8f7b 100644
--- a/meta/recipes-graphics/libva/libva_2.3.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.4.0.bb
@@ -19,8 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "2555c46075ab2f6128f39902ba1c6183"
-SRC_URI[sha256sum] = "60840e50da6932ee2111e15fc8911180ff8a0d6f18bb9cc6ba8c1030098fdce4"
+SRC_URI[md5sum] = "cfc69c2a5f526dd1858e098fb8eebfa6"
+SRC_URI[sha256sum] = "99263056c21593a26f2ece812aee6fe60142b49e6cd46cb33c8dddf18fc19391"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.17.1


