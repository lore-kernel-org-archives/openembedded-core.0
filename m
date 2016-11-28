Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24DC171A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412238"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:16 +0200
Message-Id: <edaea4b16160bdc691fb16fb488e40ef0c7d40ec.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/18] lighttpd: upgrade to 1.4.43
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:27 -0000

lighttpd no longer builds modules for which dependencies are not present,
so some previously available modules are no more.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lighttpd/{lighttpd_1.4.42.bb => lighttpd_1.4.43.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.42.bb => lighttpd_1.4.43.bb} (94%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
similarity index 94%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
index 43856ca..322f212 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.42.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "53c55d7e1dac7adec161cd5490491f6d"
-SRC_URI[sha256sum] = "b2c9069ed0bade9362c27b469a9b884641786aea1c3d686f9fd9f01d15e2a15f"
+SRC_URI[md5sum] = "95eda531c27b161ef8fa2b9bf4948caf"
+SRC_URI[sha256sum] = "fe0c4a06dd2408a83ee7a2bfedc45e09597f3313cbda82485507573ae8fa948a"
 
 PACKAGECONFIG ??= "openssl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-- 
2.10.2


