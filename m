Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8238C7ECF9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 23:59:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 16:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,472,1557212400"; d="scan'208";a="364758498"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2019 16:59:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 07:58:58 +0800
Message-Id: <20190709235858.21667-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709235858.21667-1-anuj.mittal@intel.com>
References: <20190709235858.21667-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libva-utils: upgrade 2.4.0 -> 2.5.0
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
X-List-Received-Date: Tue, 09 Jul 2019 23:59:01 -0000
Content-Transfer-Encoding: 8bit

For changes in this release, see:

https://github.com/intel/libva-utils/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva-utils_2.4.0.bb => libva-utils_2.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.4.0.bb => libva-utils_2.5.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.4.0.bb b/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.4.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.5.0.bb
index 7b764314bf..fc013d75c3 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.4.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.5.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2
            file://0001-Build-sfcsample-only-when-X11-backend-is-enabled.patch \
            "
 
-SRC_URI[md5sum] = "f5374c4c32ce136e50aea0267887aed5"
-SRC_URI[sha256sum] = "5b7d1954b40fcb2c0544be20125c71a0852049715ab85a3e8aba60434a40c6b3"
+SRC_URI[md5sum] = "c1fada26c286654859eff33b2562cb79"
+SRC_URI[sha256sum] = "9238c9d5110d60f935683390b8383fdac3507346384cd5f117a23c6db1d72a17"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
 
-- 
2.20.1


