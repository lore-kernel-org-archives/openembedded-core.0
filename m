Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 96A07731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378754"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:07 +0300
Message-Id: <d8ed4253ef2922e3c6d1ae4e9e517584f53edee0.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/7] libgpg-error: Upgrade 1.22 -> 1.23
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
X-List-Received-Date: Wed, 13 Jul 2016 12:55:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libgpg-error/{libgpg-error_1.22.bb => libgpg-error_1.23.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.22.bb => libgpg-error_1.23.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.22.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.23.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.22.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.23.bb
index 7231898..5f967b3 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.22.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.23.bb
@@ -15,8 +15,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
-SRC_URI[md5sum] = "83c686abe3fa223ec89f3b51da830770"
-SRC_URI[sha256sum] = "f2a04ee6317bdb41a625bea23fdc7f0b5a63fb677f02447c647ed61fb9e69d7b"
+SRC_URI[md5sum] = "5bc2d7ec28f91f883fb6f23d5c784ca7"
+SRC_URI[sha256sum] = "7f0c7f65b98c4048f649bfeebfa4d4c1559707492962504592b985634c939eaa"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.1.4


