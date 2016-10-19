Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B345271A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266961"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:48 +0300
Message-Id: <40cdd30f5b80125cf83a6f2e585b39ae45d14c84.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/19] lighttpd: update to 1.4.42
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lighttpd/{lighttpd_1.4.41.bb => lighttpd_1.4.42.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.41.bb => lighttpd_1.4.42.bb} (94%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb
similarity index 94%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb
index 1a3f323..43856ca 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "1df2e4dbc965cfe6f99f008ac3db4d8d"
-SRC_URI[sha256sum] = "4bcc383ef6d6dc7b284f68882d71a178e2986c83c4e85eeb3c8f3b882e346b6c"
+SRC_URI[md5sum] = "53c55d7e1dac7adec161cd5490491f6d"
+SRC_URI[sha256sum] = "b2c9069ed0bade9362c27b469a9b884641786aea1c3d686f9fd9f01d15e2a15f"
 
 PACKAGECONFIG ??= "openssl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-- 
2.9.3


