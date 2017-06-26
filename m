Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1031877EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:26:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jun 2017 08:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,396,1493708400"; d="scan'208";a="1144955668"
Received: from unknown (HELO jalamego-mobl3.zpn.intel.com) ([10.219.128.120])
	by orsmga001.jf.intel.com with ESMTP; 26 Jun 2017 08:26:49 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 10:26:48 -0500
Message-Id: <1498490808-11702-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-pygobject: upgrade to 3.24.1
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
X-List-Received-Date: Mon, 26 Jun 2017 15:26:49 -0000

From: Upgrade Helper <auh@auh.yoctoproject.org>

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 .../{python3-pygobject_3.22.0.bb => python3-pygobject_3.24.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.22.0.bb => python3-pygobject_3.24.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
index 143048d..5795ae3 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "ed4117ed5d554d25fd7718807fbf819f"
-SRC_URI[sha256sum] = "08b29cfb08efc80f7a8630a2734dec65a99c1b59f1e5771c671d2e4ed8a5cbe7"
+SRC_URI[md5sum] = "69a843311d0f0385dff376e11a2d83d2"
+SRC_URI[sha256sum] = "a628a95aa0909e13fb08230b1b98fc48adef10b220932f76d62f6821b3fdbffd"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


