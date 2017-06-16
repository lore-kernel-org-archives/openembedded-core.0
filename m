Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A6A8E784D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279592"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:47 +0300
Message-Id: <c406a5def5d15e1d8bcfc549354c7784786e2d93.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/32] python3-pygobject: update to 3.24.1
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{python3-pygobject_3.22.0.bb => python3-pygobject_3.24.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.22.0.bb => python3-pygobject_3.24.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.22.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.22.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
index 143048d9ef2..5795ae31da1 100644
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
2.11.0


