Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6108B71C14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:35 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649722"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:36 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:29 +0300
Message-Id: <20170510093529.6651-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/11] vulkan: fix upstream version check
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
X-List-Received-Date: Wed, 10 May 2017 09:35:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb b/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
index 45d1c493e29..7f0ba216589 100644
--- a/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan_1.0.39.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers.git;br
            file://0001-Use-getenv-if-secure_getenv-does-not-exist.patch \
 "
 SRCREV = "9c21ed0fb275589c3af6118aec9ef4f1d1544dc1"
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


