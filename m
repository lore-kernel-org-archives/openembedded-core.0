Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79B3D71FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989793"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:36 -0800
Message-Id: <44ead5b0c851703efe85fa6c2f64a58d3c34faf2.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 11/19] resolvconf: Upgrade to 1.76
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.75.bb => resolvconf_1.76.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.75.bb => resolvconf_1.76.bb} (92%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
similarity index 92%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
index 7310c83..eb29a2a 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
@@ -13,8 +13,8 @@ RDEPENDS_${PN} = "bash"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4b8bc86a3cf070e3fd0e9aff7eaaba56"
-SRC_URI[sha256sum] = "16167f37a77ef4bc4596dcbefece269b6a10d10fa448594ec55ed3303193086e"
+SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
+SRC_URI[sha256sum] = "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
 
 inherit allarch
 
-- 
1.8.3.1


